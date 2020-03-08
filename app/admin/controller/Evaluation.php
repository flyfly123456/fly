<?php
//在线测评控制器
namespace app\admin\controller;
use \think\Controller;
use \think\Db;
use \think\Request;
use \think\Session;
use \think\Config;
use \think\Loader;
class Evaluation extends Base
{
    public function _initialize()//_initialize与__construct有区别
    {
        parent::_initialize();
        $request= Request::instance();
        $module_name=$request->module();
        $action=$request->action();
        $controller=$request->controller();
        $action=$module_name."/".$controller."/".$action;
        parent::admin_priv($action);
    }
    
    public function index()
    {
        $where=[];
        $post = $this->request->param();
        //添加时间搜索
        if(isset($post['start']) and !empty($post['start']) and empty($post['end'])){
            $post['start']=strtotime($post['start']);
            $where['create_time'] = ['gt', $post['start']];

        }
        if(isset($post['end']) and !empty($post['end']) and empty($post['start'])){
            $post['end']=strtotime($post['end']);
            $where['create_time'] = ['lt', $post['end']];

        }
        if(isset($post['start']) and !empty($post['start']) and isset($post['end']) and !empty($post['end'])){
            $post['start']=strtotime($post['start']);
            $post['end']=strtotime($post['end']);
            $where['create_time'] = ['between', [$post['start'],$post['end']]];

        }

        //下拉选择搜索
        if (isset($post['modules']) and !empty($post['modules']) and !empty($post['keywords'])) {
           
            if($post['keywords']=="已审核"){
                $post['keywords']="1";
            }
            if($post['keywords']=="未审核"){
                $post['keywords']="0";
            }

            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
        }
        
        $count=Db::name('evaluation')->where($where)->count();
        //分页显示,每页5条数据
        //联合查询members_type
        $deft=Db::name('evaluation')->order('id desc')->paginate(5)->each(function($item, $key){
                    $item['create_time'] = date('Y-m-d H:i:s',$item['create_time']);
                    return $item;});
        
        $search=Db::name('evaluation')->where($where)->order('id desc')->paginate(5,false,['query'=>$this->request->param()])->each(function($item, $key){
                    $item['create_time'] = date('Y-m-d H:i:s',$item['create_time']);
                    return $item;});
        //判断是否有搜索
        $rows = empty($where) ? $deft: $search;
        
        $page = $rows->render();
        $rows=$rows->toArray();
        if(!empty($rows)){
            $this->assign('page', $page);
            $this->assign('count',$count);
            $this->assign('rows',$rows['data']);
            
        }
        
        return $this->fetch('index');
        
    }


    public function evaluation_add()
    {
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if(count($data)<=5){
                $data['status']='0';
                $data['msg']='请选择要添加的题型！';
                return json($data);
            }

            $array=array();
            $array['title']=$data['title'];
            $array['desc']=$data['desc'];
            $array['create_time']=time();
            $array['duration']=$data['duration'];
            
            if($data['total_score']==""){
                $data['total_score']=100;
            }else{
                $array['total_score']=$data['total_score'];
            }
            if(!is_numeric($data['total_score'])){
                $data['status']='0';
                $data['msg']='总分值必须为数字类型！';
                return json($data);
            }

            $sum_score=0;
            if(isset($data['unit_answer_score'])){
                $sum_score+=array_sum($data['unit_answer_score']);
            }
            if(isset($data['multi_answer_score'])){
                $sum_score+=array_sum($data['multi_answer_score']);
            }
            if(isset($data['recognized_answer_score'])){
                $sum_score+=array_sum($data['recognized_answer_score']);
            }
            if(isset($data['fill_answer_score'])){
                $sum_score+=array_sum($data['fill_answer_score']);
            }
            if(isset($data['short_answer_score'])){
                $sum_score+=array_sum($data['short_answer_score']);
            }
            
            if($sum_score!=$data['total_score']){
                $data['status']='0';
                $data['msg']='请确保所有题型分值总和等于总分值！';
                return json($data);
            }

            $array['status']="0";
            //返回最后插入的主键值
            $getRowsId=Db::name('evaluation')->insertGetId($array);

            if($getRowsId){
                
                if(isset($data['unit_model'])){
                    $conut_unit=count($data['unit_model']);
                    $arr=array();
                    foreach ($data['unit_model'] as $key => $value) {
                        # code...

                        if($value=="single"){

                            $impStr="";
                            $insarr['content']=strip_tags($data['unit'][$key]);
                            $insarr['score']=$data['unit_answer_score'][$key];
                            $insarr['answer']=strip_tags($data['unit_answer_resolution'][$key]);
                            $temp['option']=[];
                            foreach ($data["unit_answer".$key] as $k => $v) {
                                # code...
                                array_push($temp['option'], $v);

                            }
                            $insarr['option']=strip_tags(implode("_@", $temp['option']));

                            $insarr['evaluation_id']=$getRowsId;

                            $insarr['type']=$value;
                            array_push($arr, $insarr);
                            
                        }
                        
                    }
                    $rows=Db::name('evaluation_info')->insertAll($arr);
                    if($rows!=$conut_unit){
                        $data['status']='0';
                        $data['msg']='试题添加失败！';
                        return json($data);
                    }
                    
                }

                if(isset($data['multi_model'])){
                    $conut_multi=count($data['multi_model']);
                    $arr=array();
                    foreach ($data['multi_model'] as $key => $value) {
                        # code...
                        if($value=="multi"){

                            $impStr="";
                            $insarr['content']=strip_tags($data['multi'][$key]);
                            $insarr['score']=$data['multi_answer_score'][$key];
                            $temp['answer']=[];
                            foreach ($data["multi_answer_resolution".$key] as $kk => $vv) {
                                # code...
                                array_push($temp['answer'], $vv);

                            }
                            $temp['option']=[];
                            foreach ($data["multi_answer".$key] as $k => $v) {
                                # code...
                                array_push($temp['option'], $v);

                            }
                            $insarr['option']=strip_tags(implode("_@", $temp['option']));
                            $insarr['answer']=strip_tags(implode("_@", $temp['answer']));

                            $insarr['evaluation_id']=$getRowsId;

                            $insarr['type']=$value;
                            array_push($arr, $insarr);
                            
                        }

                        
                    }
                    $rows=Db::name('evaluation_info')->insertAll($arr);
                    if($rows!=$conut_multi){
                        $data['status']='0';
                        $data['msg']='试题添加失败！';
                        return json($data);
                    }
                }


                if(isset($data['recognized_model'])){
                    $conut_recognized=count($data['recognized_model']);
                    $arr=array();
                    foreach ($data['recognized_model'] as $key => $value) {
                        # code...
                        if($value=="recognized"){

                            $insarr['content']=strip_tags($data['recognized'][$key]);
                            $insarr['answer']=strip_tags($data['recognized_answer'.$key]);
                            $insarr['score']=$data['recognized_answer_score'][$key];
                            $insarr['option']="";

                            $insarr['evaluation_id']=$getRowsId;

                            $insarr['type']=$value;
                            array_push($arr, $insarr);
                            
                        }

                        
                    }
                    $rows=Db::name('evaluation_info')->insertAll($arr);
                    if($rows!=$conut_recognized){
                        $data['status']='0';
                        $data['msg']='试题添加失败！';
                        return json($data);
                    }
                }
                
                if(isset($data['fill_model'])){
                    $conut_fill=count($data['fill_model']);
                    $arr=array();
                    foreach ($data['fill_model'] as $key => $value) {
                        # code...
                        if($value=="fill"){

                            $insarr['content']=strip_tags($data['fill'][$key]);
                            $insarr['answer']=strip_tags($data['fill_answer'.$key]);
                            $insarr['score']=$data['fill_answer_score'][$key];
                            $insarr['option']="";

                            $insarr['evaluation_id']=$getRowsId;

                            $insarr['type']=$value;
                            array_push($arr, $insarr);
                            
                        }

                        
                    }
                    $rows=Db::name('evaluation_info')->insertAll($arr);
                    if($rows!=$conut_fill){
                        $data['status']='0';
                        $data['msg']='试题添加失败！';
                        return json($data);
                    }
                }

                if(isset($data['short_model'])){
                    $conut_short=count($data['short_model']);
                    $arr=array();
                    foreach ($data['short_model'] as $key => $value) {
                        # code...
                        if($value=="short"){

                            $insarr['content']=strip_tags($data['short'][$key]);
                            $insarr['answer']=strip_tags($data['short_answer'.$key]);
                            $insarr['score']=$data['short_answer_score'][$key];
                            $insarr['option']="";

                            $insarr['evaluation_id']=$getRowsId;

                            $insarr['type']=$value;
                            array_push($arr, $insarr);
                            
                        }

                        
                    }
                    $rows=Db::name('evaluation_info')->insertAll($arr);
                    if($rows!=$conut_short){
                        $data['status']='0';
                        $data['msg']='试题添加失败！';
                        return json($data);
                    }
                }
                
                $data['status']='1';
                $data['msg']='试题添加成功！';
                return json($data);
                
            }else{
                $data['status']='0';
                $data['msg']='试题添加失败！';
                return json($data);
            }
        }
        
        return $this->fetch('evaluation_add');
     
    }


    public function evaluation_edit()
    {
        
        
        return $this->fetch('evaluation_edit'); 
        
        
    }

    public function evaluation_toggle(){
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if($data['status']=='审核'){
                $array['status']=0;
            }else{
                $array['status']=1;
            }
            $array['id']=$data['id'];
            $rest=Db::name('evaluation')->update($array);
            if($rest){
               $data['status']='1';
               $data['msg']='操作成功！';
               return json($data); 
           }else{
                $data['status']='0';
                $data['msg']='操作失败！';
                return json($data); 
           }
        }
    }

    //判断开始测评
    public function start_exams(){
        if (Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if($data!=""||!empty($data)){
                $id=Session::get('login.id');
                $stopIntval=Session::set('stopIntval'.$id,'1');
                if(Session::has('stopIntval'.$id)){
                    
                    $data['status']="1";
                    $data['msg']="开始计时！";
                    return json($data);
                }else{
                    $data['status']="0";
                    $data['msg']="停止计时！";
                    return json($data);
                }
                
            }
        }
    }

    //停止系统休眠计时
    public function stop_countdown(){
        if (Request::instance()->isAjax()){
            $data=Request::instance()->post();
            $id=Session::get('login.id');
            $stopIntval=Session::get('stopIntval'.$id);
            if(Session::has('stopIntval'.$id)){
                
                $data['status']="1";
                $data['msg']="停止计时！";
                return json($data);
            }else{
                $data['status']="0";
                $data['msg']="开始计时！";
                return json($data);
            }
        }
    }

    public function evaluation_delete()
    {
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if($data!=""){
                if(intval($data['id'])>0){
                    $rest=Db::name('evaluation')->where('id',$data['id'])->delete();
                    if($rest){

                        $data['status']='1';
                        $data['msg']='数据删除成功！';
                        return json($data);
                    }else{
                        $data['status']='0';
                        $data['msg']='数据删除失败！';
                        return json($data);
                    }
                }
            }
        }
    }

    //批量删除
    public function delete_all(){
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if($data!=""||!empty($data)){
                $count=0;
                foreach ($data as $key => $value) {
                    # code...
                    Db::startTrans();
                    try{
                        $rest=Db::name('evaluation')->where('id',$value)->delete();
                        if($rest){
                            $count++;
                        }
                        // 提交事务
                        Db::commit();    
                    } catch (\Exception $e) {
                        // 回滚事务
                        Db::rollback();
                    }
                    
                }
                $number=count($data);
                if($count===$number){
                    $data['status']="1";
                    $data['msg']="成功删除".$count."条数据！";
                    return json($data);
                }else{
                    $data['status']="0";
                    $data['msg']="删除失败，请稍后再试！";
                    return json($data);
                }
                
            }else{
                $data['status']="0";
                $data['msg']="数据获取异常，请稍后再试！";
                return json($data);
            }

        } 
    }


}
