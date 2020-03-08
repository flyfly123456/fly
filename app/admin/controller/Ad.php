<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Image;
use \app\admin\model\Ad as advt;
use \app\admin\model\AdPosition;
use app\admin\logic\AdLogic;
use app\admin\logic\PositionLogic;

use app\admin\behavior\Files;
use app\admin\behavior\Behavior;

class Ad extends Base
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

        if(self::$position==null){

            self::$position=Db::name('ad_position')->where('status=1')->select();
        }
        
	}

    protected static $position=null;

    public function ad_list()
    {
        return $this->fetch();
    }

    public function ad_list_info()
    {
        //判断搜索
        $post = $this->request->param();

        $info=AdLogic::select($post,'ad');

        if(isset($info['list'])){
            foreach ($info['list'] as $key => $value) {
        
                if($value['astatus']=="1"){
                    $info['list'][$key]['astatus']="正常";
                }else{
                    $info['list'][$key]['astatus']="禁用";
                }

                $info['list'][$key]['id']=$value['aid'];
                
                if(isset($value['create_time']) && $value['create_time']!=""){
                    $info['list'][$key]['create_time']=date('Y-m-d H:i:s',$value['create_time']);
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

    public function ad_add()
    {
        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){

                $arr['name']=$data['name'];
                
                $arr['url']=$data['url'];
                $arr['position_id']=$data['position_id'];

                $size=Db::name('ad_position')->where('id',$arr['position_id'])->find();

                if(isset($data['color'])){
                    $arr['color']=$data['color'];
                }
                $arr['status']=$data['status'];
                $arr['is_available']=1;

                if(isset($data['img_url'])){

                    $arr['img']=date('Ymd').DS.$data['img_url'];

                    Files::thumb_image($data['img_url'],'ad'.DS.date('Ymd'),$size['width'],$size['height']);
                }
                
                $rows=advt::create($arr,true);//true排除掉表中不存在的字段

                return Behavior::return_info($rows);
            }
        }


        $this->assign('position',self::$position);

        return $this->fetch();
    }

    public function ad_edit()
    {
        $id=input('id');
        
        $find=Db::name('ad')->where('id='.$id)->find();

        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            
            if(!empty($data)){

                if(isset($data['field']) && isset($data['id'])){//只修改状态

                    $array['status']=$data['name'];

                    $rows=advt::where('id',$data['id'])->update($array);

                    return Behavior::return_info($rows);
                }else{//通用修改
                    $arr['name']=$data['name'];
                    
                    $arr['url']=$data['url'];
                    $arr['position_id']=$data['position_id'];

                    $size=Db::name('ad_position')->where('id',$arr['position_id'])->find();

                    if(isset($data['color'])){
                        $arr['color']=$data['color'];
                    }
                    $arr['is_available']=$data['status'];

                    if($find['img']!=$data['img_url']){

                        Files::thumb_image($data['img_url'],'ad'.DS.dirname($find['img']),$size['width'],$size['height']);

                        $arr['img']=dirname($find['img']).DS.$data['img_url'];

                        Files::delete_img('ad'.DS.$find['img']);
                    }

                    $rows=advt::where('id',$data['id'])->update($arr);

                    return Behavior::return_info($rows);
                }
                
            }
        }


        $this->assign('position',self::$position);
        $this->assign('ad',$find);

        return $this->fetch();
    }

    public function ad_delete()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            
            if(!empty($data)){

                return Behavior::delete($data['id'],'ad');
            }
        }
    }

    public function delete_all()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            
            if(!empty($data)){

                return Behavior::delete_all($data,'ad');
            }
        }
    }


    public function position_list()
    {
        return $this->fetch();
    }

    public function position_list_info()
    {
        //判断搜索
        $post = $this->request->param();

        $info=PositionLogic::select($post,'ad_position');

        if(isset($info['list'])){
            foreach ($info['list'] as $key => $value) {
        
                if($value['status']=="1"){
                    $info['list'][$key]['status']="正常";
                }else{
                    $info['list'][$key]['status']="禁用";
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


    public function position_add()
    {
        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){
                $arr['name']=$data['name'];
                $arr['width']=$data['width'];
                $arr['height']=$data['height'];
                
                if(isset($data['desc'])){
                    $arr['desc']=$data['desc'];
                }

                $arr['status']=$data['status'];
                
                $position=AdPosition::create($arr,true);//true排除掉表中不存在的字段
                
                return Behavior::return_info($position);
            }
        }

        return $this->fetch();
    }

    public function position_edit()
    {
        $id=input('id');

        $position=Db::name('ad_position')->where('id',$id)->find();

        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){
                $arr['name']=$data['name'];
                $arr['width']=$data['width'];
                $arr['height']=$data['height'];
                
                if(isset($data['desc'])){
                    $arr['desc']=$data['desc'];
                }

                $arr['status']=$data['status'];
                
                $position=AdPosition::where('id',$data['id'])->update($arr);                
                return Behavior::return_info($position);
            }
        }

        $this->assign('position',$position);

        return $this->fetch();

    }


}
