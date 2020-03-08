<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Db;
use \think\Request;
use \think\Image;
use app\admin\model\Cate as Sort;

use app\admin\behavior\Behavior;
use app\admin\behavior\Files;

class Cate extends Base
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

    public function cate_list()
    {
    	$rows=Sort::all(['is_available'=>1]);
        
    	foreach ($rows as $key => $value) {
            
            if($value['status']=='1'){
                $rows[$key]['status']="已启用";
            }else{
                $rows[$key]['status']="已禁用";
            }
        }

    	$cate=json_encode($rows,JSON_UNESCAPED_UNICODE);

        $count=count($rows);

        $this->assign('cate',$cate);
        $this->assign('count',$count);

        return view('cate_list');
    }

    public function cate_add()
    {
        $rows=Sort::select();

    	$post = $this->request->param();

    	if(isset($post['pid']) && isset($post['title']) && isset($post['status']) && $post['pid']!=""){
    		//开启事务
    		Db::startTrans();
    		try{

	    		$arr['pid']=$post['pid'];
	    		$arr['title']=$post['title'];
                $arr['is_available']=$post['status'];
	    		$arr['desc']=$post['desc'];
                if(isset($post['img_url'])){
                    $arr['img']=date('Ymd').DS.$post['img_url'];

                    Files::thumb_image($post['img_url'],'cate'.DS.date('Ymd'),$width=400,$height=300);
                }

                if(isset($post['url'])){
                    $arr['url']=$post['url'];
                }

                $insertGetId=Sort::create($arr);

	    		$pid=$insertGetId->id;

	    		if(!$pid){
	    			//  抛出异常
	    			throw new \Exception("插入失败...");
	    		}

	    		if($arr['pid']=='0'){

	    			$array['path']='0-'.$pid;
	    		}else{

                    $path=Sort::get(['id'=>$post['pid']]);

	    			if(!$path){
	    				//  抛出异常
	    				throw new \Exception("查询失败...");
	    			}

	    			$array['path']=$path['path'].'-'.$pid;
	    		}

	    		$result=Sort::where('id',$pid)->update($array);

	    		if($pid && $result){
	    			// 提交事务
	    			Db::commit();
	    			
	    			$data['status']='1';
	    			$data['msg']='添加成功！';
	    			return json($data);
	    		}else{
	    			$data['status']='0';
	    			$data['msg']='添加失败！';
	    			return json($data);
	    		}
	    	}catch(\Exception $e){
                // 回滚事务
                Db::rollback();
                $data['status']="0";
                $data['msg']=$e->getMessage();
                return json($data);
            }
    	}

        $pid=input('pid');
        $id=input('id');


        $this->assign('cate',$rows);
        
        $this->assign('pid',$pid);
    	$this->assign('id',$id);

    	return $this->fetch('cate_add');
    }


    public function cate_edit()
    {
        $id=input('id');

        $rows=Sort::get(['id'=>$id]);

        $cate=Sort::select();

        $post = $this->request->param();

        if(isset($post['id']) && isset($post['title']) && isset($post['status'])){
            
            $rest=Sort::get(['id'=>$post['id']]);
            
            $array['title']=$post['title'];
            $array['is_available']=$post['status'];
            $array['desc']=$post['desc'];
            
            if(isset($post['img_url']) && $post['img_url']!=$rest['img']){

                $array['img']=dirname($rest['img']).DS.$post['img_url'];

                Files::thumb_image($post['img_url'],'cate'.DS.dirname($rest['img']),$width=400,$height=300);
            }

            if(isset($post['url'])){
                $array['url']=$post['url'];
            }

            $result=Sort::where("id",$post['id'])->update($array);
            
            return Behavior::return_info($result);
        }
        
        $this->assign('rows',$rows);
        $this->assign('cate',$cate);
        $this->assign('id',$id);

        return $this->fetch('cate_edit');
        
    }


    public function cate_toggle()
    {
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if(!empty($data)){

                return Behavior::toggle_status('cate',$data['id']);
            }

        }
    }

    
    public function cate_delete()
    {
        $post = $this->request->param();
        if(isset($post['id'])){
            
            return Behavior::delete($post['id'],'cate');
            
        }
    }


    public function delete_all()
    {
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            
            if($data!=""||!empty($data)){
                
                return Behavior::delete_all($data,'cate');
                
            }else{
                $data['status']="0";
                $data['msg']="数据获取异常，请稍后再试！";
                return json($data);
            }

        } 
    }



}
