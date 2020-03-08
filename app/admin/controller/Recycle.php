<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Db;
use \think\Request;
use \think\Session;
use \think\Config;
use \think\Loader;
// 回收站控制器
class Recycle extends Base
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



    public function delete_member_list()
    {

        return $this->fetch('recycle/member/index');
        
    }


    public function member_info()
    {
        $page=input("get.page")?input("get.page"):1;
        $page=intval($page);
        $limit=input("get.limit")?input("get.limit"):1;
        $limit=intval($limit);
        $limit=input('limit');

        $where=[];
        $where['is_available']=0;
        //判断搜索
        $post = $this->request->param();

        if(isset($post['start']) && isset($post['end'])){

            if(empty($post['start']) && empty($post['end'])){
                unset($post['start']);
                unset($post['end']);
                $data['status']=0;
                $data['msg']="暂无数据！";
                return json($data);
            }

            $post['modules']="create_time";
            $post['start']=strtotime($post['start']);
            $post['end']=strtotime($post['end']);
            // if(isset($post['start']) and !empty($post['start']) and empty($post['end'])){
            //     $post['start']=strtotime($post['start']);
            //     $where['create_time'] = ['gt', $post['start']];

            // }
            // if(isset($post['end']) and !empty($post['end']) and empty($post['start'])){
            //     $post['end']=strtotime($post['end']);
            //     $where['create_time'] = ['lt', $post['end']];

            // }
            // if(isset($post['start']) and !empty($post['start']) and isset($post['end']) and !empty($post['end'])){
            //     $post['start']=strtotime($post['start']);
            //     $post['end']=strtotime($post['end']);
            //     $where['create_time'] = ['between', [$post['start'],$post['end']]];

            // }
            $where['create_time'] = ['between', [$post['start'],$post['end']]];

            $where[$post['modules']] = $where['create_time'];

            $where['status']=0;
            $where['msg']="暂无数据！";
            return json($where);

        }

        

        if(isset($post['keywords']) && isset($post['modules'])){

            if(empty($post['keywords']) && empty($post['modules'])){
                unset($post['keywords']);
                unset($post['modules']);
                $data['status']=0;
                $data['msg']="暂无数据！";
                return json($data);
            }
            
            if($post['modules']=="sex"){
                if($post['keywords']=="男"){
                    $post['keywords']=0;
                }elseif($post['keywords']=="女"){
                    $post['keywords']=1;
                }else{
                    $data['status']=0;
                    $data['msg']="暂无数据！";
                    return json($data);
                }
            
            }

            if($post['modules']=="status"){
                if($post['keywords']=="已启用"){
                    $post['keywords']=1;
                }elseif($post['keywords']=="未启用"){
                    $post['keywords']=0;
                }else{
                   $data['status']=0;
                   $data['msg']="暂无数据！";
                   return json($data); 
                }
                
            }

            if($post['modules']=="type"){
                $rest=Db::name('members_type')->where('type',strtoupper($post['keywords']))->find();
                if($rest){
                    $post['keywords']=$rest['id'];

                }else{
                    $data['status']=0;
                    $data['msg']="暂无数据！";
                    return json($data);
                }
                
            }


            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
            
        }

        $count=Db::name('members')->where($where)->count();

        $list=Db::name('members')->alias('m')->field(['m.id','m.username','m.sex','m.create_time','m.type','m.status','m.email','m.address','m.telephone'])->page($page,$limit)->where($where)->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据！";
            return json($data);
        }
        
        foreach ($list as $key => $value) {
            # code...

            $rest=Db::name('members_type')->where(['id'=>$value['type']])->find();

            $list[$key]['type']=$rest['type'];

            $list[$key]['create_time']=date('Y-m-d H:i:s',$value['create_time']);
            if($value['sex']==0){
                $list[$key]['sex']='男';
            }else{
                $list[$key]['sex']='女';
            }

            if($value['status']=="0"){
                $list[$key]['status']="未启用";
            }else{
                $list[$key]['status']="已启用";
            }

        }

        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$list;
        
        return json_decode(json_encode($arr));
        
    }



    public function member_view()
    {
        $id=input('id');
        
        $rows=Db::name('members')->where(array('id'=>$id))->find();
        
        $rest=Db::name('members')->alias('m')->field('m.id mId,m.type mType, m.*,t.id tId,t.type tType')->join('members_type t',"m.type=t.id",'LEFT')->where('m.id',$rows['id'])->find();
        
        if($rows!=null && $rest!=null){
            $rest['create_time']=date('Y-m-d H:s:i',$rows['create_time']);
            
            $this->assign('members',$rest);
        }

        $type=Db::name('members_type')->select();
        
        $this->assign('type',$type);
        return $this->fetch('member_view');
    }


    public function delete_member_recover()
    {
        
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if(!empty($data)){
                $rest=Db::name('members')->where('id',$data['id'])->setField('is_available',1);
                if($rest){
                    $data['status']='1';
                    $data['msg']='数据恢复成功！';
                    return json($data);
                }else{
                    $data['status']='0';
                    $data['msg']='数据恢复失败！';
                    return json($data);
                }
            }

        }
        
    }


    public function delete_member_complete()
    {
        
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if(!empty($data)){
                $rest=Db::name('members')->where('id',$data['id'])->delete();
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


    public function empty_recycle()
    {
        
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if(!empty($data)){
                if($data['delete_all']==1){

                    $rest=Db::name('members')->where('is_available',0)->delete();
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
                        $rest=Db::name('members')->where('id',$value)->delete();
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
                if($count===$number&& $number!=0){
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
