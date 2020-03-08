<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Db;
use \think\Request;
use \think\Session;
use \think\Config;
use \think\Loader;

use app\admin\logic\RecycleLogic;

use app\admin\behavior\Behavior;

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
        //判断搜索
        $post = $this->request->param();

        $info=RecycleLogic::select($post,'members');

        if(isset($info['list'])){
            foreach ($info['list'] as $key => $value) {

                $rest=Db::name('members_type')->where(['id'=>$value['type']])->find();

                $info['list'][$key]['type']=$rest['type'];

                $info['list'][$key]['create_time']=date('Y-m-d H:i:s',$value['create_time']);
                if($value['sex']==0){
                    $info['list'][$key]['sex']='男性';
                }elseif($value['sex']==1){
                    $info['list'][$key]['sex']='女性';
                }else{
                    $info['list'][$key]['sex']='保密';
                }

                if($value['status']=="0"){
                    $info['list'][$key]['status']="未启用";
                }else{
                    $info['list'][$key]['status']="已启用";
                }

            }
        }else{
            return json($info);
        }
        
        

        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$info['count'];
        $arr['data']=$info['list'];
        
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

                return Behavior::recover('members',$data['id']);
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
    public function member_delete_all(){
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            
            if($data!=""||!empty($data)){
                
                return Behavior::delete_all($data,'members',true);
                
            }else{
                $data['status']="0";
                $data['msg']="数据获取异常，请稍后再试！";
                return json($data);
            }

        } 
    }


}
