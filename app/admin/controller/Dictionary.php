<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Session;

class Dictionary extends Base
{

	public function _initialize()//_initialize与__construct有区别
	{
	    $request= Request::instance();
	    $module_name=$request->module();
	    $action=$request->action();
	    $controller=$request->controller();
	    $action=$module_name."/".$controller."/".$action;
	    parent::admin_priv($action);
	    parent::check_admin_log($action);
	    
	}

    public function data_dictionary()
    {
    	return $this->fetch('data_dictionary');
    }

    public function data_dictionary_info()
    {
    	$page=input("get.page")?input("get.page"):1;
    	$page=intval($page);
    	$limit=input("get.limit")?input("get.limit"):1;
    	$limit=intval($limit);
    	$limit=input('limit');

    	$where=[];
    	//判断搜索
    	$post = $this->request->param();

    	if(isset($post['keywords']) && isset($post['modules'])){

    	    if(empty($post['keywords']) && empty($post['modules'])){
    	        unset($post['keywords']);
    	        unset($post['modules']);
    	        $data['status']=0;
    	        $data['msg']="暂无数据...";
    	        return json($data);
    	    }
    	    
    	    if($post['modules']=="status"){
    	        if($post['keywords']=="已启用"){
    	            $post['keywords']=1;
    	        }elseif($post['keywords']=="未启用"){
    	            $post['keywords']=0;
    	        }else{
    	           $data['status']=0;
    	           $data['msg']="暂无数据...";
    	           return json($data);
    	        }
    	        
    	    }

    	    $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
    	    
    	}

    	$count=Db::name('data_dictionary')->where($where)->count();

    	$list=Db::name('data_dictionary')->page($page,$limit)->order('id desc')->where($where)->select();

    	if(empty($list)){
    	    $data['status']=0;
    	    $data['msg']="暂无数据...";
    	    return json($data);
    	}
    	
    	foreach ($list as $key => $value) {
    	    
    	    if($value['is_available']=='1'){
    	        $list[$key]['is_available']="正常";
    	    }else{
    	        $list[$key]['is_available']="已删除";
    	    }

    	}

    	$arr=array();
    	$arr['code']=0;
    	$arr['msg']="";
    	$arr['count']=$count;
    	$arr['data']=$list;
    	
    	return json_decode(json_encode($arr));
    }

    public function dictionary_add()
    {
    	$post = $this->request->param();

    	if(isset($post['name']) && isset($post['desc'])){
    		$arr['name']=$post['name'];
    		$arr['desc']=$post['desc'];
    		$rows=Db::name('data_dictionary')->insert($arr);
    		if($rows){
    			$data['status']=1;
    			$data['msg']="操作成功...";
    			return json($data);
    		}else{
    			$data['status']=0;
    			$data['msg']="操作失败...";
    			return json($data);
    		}
    	}

    	return $this->fetch();
    }


}
