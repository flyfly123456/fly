<?php

namespace app\admin\logic;

use \think\Controller;
use \think\Request;
use \think\Db;

class LogLogic extends Controller
{
	public static function select($post,$table)
	{
	    $page=input("get.page")?input("get.page"):1;
	    $page=intval($page);
	    $limit=input("get.limit")?input("get.limit"):1;
	    $limit=intval($limit);
	    $limit=input('limit');

	    $where=[];
	    $time=[];

	    if(!empty($post['start']) && empty($post['end'])){//只有开始日期
	        
	        $post['start']=strtotime($post['start']);
	        $time['l.create_time']=['>',$post['start']];

	        
	    }elseif(empty($post['start']) && !empty($post['end'])){//只有结束日期
	        
	        $post['end']=strtotime($post['end']);
	        $time['l.create_time']=['<',$post['end']];

	        

	    }elseif(empty($post['start']) && empty($post['end'])){//无开始和结束日期
	        // $data['status']=0;
	        // $data['msg']='暂无数据...';
	        // return $data;
	    }elseif(!empty($post['start']) && !empty($post['end'])){//有开始和结束日期
	        $post['start']=strtotime($post['start']);
	        $post['end']=strtotime($post['end']);

	        $time['l.create_time']=['between',"$post[start],$post[end]"];
	    }

	    if(isset($post['keywords'])&& isset($post['modules'])){

	        if(!empty($post['keywords']) && !empty($post['modules'])){

	        	if($post['modules']=="name"){
	        	    $rows=Db::name('admin')->where('name',$post['keywords'])->find();
	        	    if($rows){
	        	    	$post['modules']="l.admin_id";
	        	        $post['keywords']=$rows['id'];

	        	    }else{
	        	        $data['status']=0;
	        	        $data['msg']="暂无数据...";
	        	        return json($data); 
	        	    }

	        	    $where[$post['modules']] = ['=',$post['keywords']];
	        	
	        	}elseif($post['modules']=="role_name"){

	        		$rest=Db::name('role_group')->where(['role_name'=>$post['keywords'],'is_available'=>1])->find();
	        		if($rest){
	        			$post['modules']="g.id";
	        		    $post['keywords']=$rest['id'];

	        		}else{
	        		    $data['status']=0;
	        		    $data['msg']="暂无数据...";
	        		    return json($data); 
	        		}

	        		$where[$post['modules']] = ['=',$post['keywords']];

	        	}else{
	        		$where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
	        	}

	        }
	        

	    }

	    $list=Db::name('admin_log')->alias('l')->field('a.name,l.id,l.operation,l.create_time,g.role_name')->join('admin a','l.admin_id=a.id','LEFT')->join('role_group g','a.role_group_id=g.id','LEFT')->order('l.id desc,l.create_time desc')->page($page,$limit)->where('l.is_available',1)->where($where)->where($time)->select();

	    $count=Db::name('admin_log')->alias('l')->field('a.name,l.id,l.operation,l.create_time,g.role_name')->join('admin a','l.admin_id=a.id','LEFT')->join('role_group g','a.role_group_id=g.id','LEFT')->where('l.is_available',1)->where($where)->where($time)->count();

	    if(empty($list)){
	        $data['status']=0;
	        $data['msg']="暂无数据...";
	        return $data;
	    }else{
	        
	        return ['list'=>$list,'count'=>$count];
	    }
	}
}