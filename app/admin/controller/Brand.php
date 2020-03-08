<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
class Brand extends Base
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

    public function brand_list()
    {
    	
        return view('brand_list');
    }

    public function brand_list_info()
    {
        $page=input("get.page")?input("get.page"):1;
        $page=intval($page);
        $limit=input("get.limit")?input("get.limit"):1;
        $limit=intval($limit);
        $limit=input('limit');

        $where=[];
        // $where['is_available']=1;
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

            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
            
        }

        $count=Db::name('brand')->where($where)->count();

        $list=Db::name('brand')->page($page,$limit)->where($where)->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据！";
            return json($data);
        }
        
        foreach ($list as $key => $value) {
            
            if($value['is_available']=="1"){
                $list[$key]['is_available']="正常";
            }else{
                $list[$key]['is_available']="删除";
            }

        }

        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$list;
        
        return json_decode(json_encode($arr));
    }

    public function brand_add()
    {
        $post = $this->request->param();

        if(isset($post['name']) && isset($post['status']) && isset($post['cate']) && isset($post['img'])){
            $arr['name']=$post['name'];
            $arr['is_available']=$post['status'];
            $arr['cate_id']=$post['cate'];
            $arr['img']=$post['img'];
            $rows=Db::name('brand')->insert($arr);
            if($rows){
                $data['status']='1';
                $data['msg']='添加成功';
                return json($data);
            }else{
                $data['status']='0';
                $data['msg']='添加失败';
                return json($data);
            }
        }

        $rows=Db::name('cate')->field('*,title name,is_available status')->where('is_available=1')->select();//查询所有分类

        $list=array();
        $list2=array();
        $list3=array();
        $tmp=array();

        foreach ($rows as $key => $value) {
            //查询一级分类
            if(substr_count($value['path'], '-')==1){
                array_push($list, $value);
            }
            //查询二级分类
            if(substr_count($value['path'], '-')==2){
                array_push($list2, $value);
            }

            //查询三级分类
            if(substr_count($value['path'], '-')==3){
                array_push($list3, $value);
            }   
        }

        //合并二级三级分类
        foreach ($list2 as $key => $value) {
            $list2[$key]['children']=array();
            $tmp=explode('-', $value['path']);
            unset($tmp[2]);
            $str=implode($tmp, '-');

            foreach ($list3 as $k3 => $v3) {
                $tmp=explode('-', $v3['path']);
                unset($tmp[3]);
                $str3=implode($tmp, '-');

                if($value['path']==$str3){
                    array_push($list2[$key]['children'], $v3);
                }
            }
        }

        //合并一级二级分类
        foreach ($list as $key => $value) {
            
            $list[$key]['children']=array();

            foreach ($list2 as $k => $v) {

                $tmp=explode('-', $v['path']);
                unset($tmp[2]);
                $str=implode($tmp, '-');

                if($value['path']==$str){
                    array_push($list[$key]['children'], $v);
                }
            }
            
        }

        $list=json_encode($list,JSON_UNESCAPED_UNICODE);

        $request = Request::instance();
        $domain=$request->domain();
        
        $this->assign('cate',$list);
        $this->assign('domain',$domain);

        return view('brand_add');
    }

    public function brand_edit()
    {
        $id=input('id');

        $post = $this->request->param();

        if(isset($post['id']) && isset($post['name']) && isset($post['is_available'])){
            $arr['name']=$post['name'];
            $arr['is_available']=$post['is_available'];
            $rest=Db::name('brand')->where("id=$post[id]")->update($arr);
            if($rest){
                $data['status']='1';
                $data['msg']='修改成功';
                return json($data);
            }else{
                $data['status']='0';
                $data['msg']='修改失败';
                return json($data);
            }
        }

        //单独修改状态        
        if(isset($post['field']) && isset($post['id']) && isset($post['value'])){
            $arr['is_available']=$post['value'];
            $rest=Db::name('brand')->where("id=$post[id]")->update($arr);
            if($rest){
                $data['status']='1';
                $data['msg']='修改成功';
                return json($data);
            }else{
                $data['status']='0';
                $data['msg']='修改失败';
                return json($data);
            }
        }

        $rows=Db::name('brand')->where("id=$id")->find();

        $this->assign('rows',$rows);
        return view('brand_edit');
    }

    public function brand_delete()
    {
        $post = $this->request->param();
        if(isset($post['id'])){
            $rows=Db::name('brand')->where("id=$post[id]")->delete();
            if($rows){
                $data['status']='1';
                $data['msg']='删除成功';
                return json($data);
            }else{
                $data['status']='0';
                $data['msg']='删除失败';
                return json($data);
            }
        }
    }


    public function upload_img()
    {
        if(Request::instance()->isAjax()){
            $file=Request::instance()->file('file');
            // $file = request()->file('file');
            // $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
            if($file){

                $info = $file->validate(['size'=>1048576,'ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'uploads');
                if($info){

                    $image = \think\Image::open(ROOT_PATH . 'public' . DS . 'uploads'.DS.$info->getSaveName());
                    $image->thumb(400, 300)->save(ROOT_PATH . 'public' . DS . 'uploads'.DS.$info->getSaveName());

                    return json_encode(['state' => 1, 'message' => $file->getError(),'img'=>$info->getSaveName()]);
                
                }else{
                    // 上传失败获取错误信息
                    //     return $file->getError();
                    return json_encode(['state' => 0, 'message' => $file->getError()]);
                }
            }
        }
    }


}
