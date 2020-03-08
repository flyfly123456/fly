<?php

namespace app\admin\logic;

use \think\Controller;
use \think\Request;
use \think\Db;

class EvaluationLogic extends Controller
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

	    $where['is_available']=1;

	    if(!empty($post['start']) && empty($post['end'])){//只有开始日期
	        
	        $post['start']=strtotime($post['start']);
	        $time['a.create_time']=['>',$post['start']];

	        
	    }elseif(empty($post['start']) && !empty($post['end'])){//只有结束日期
	        
	        $post['end']=strtotime($post['end']);
	        $time['a.create_time']=['<',$post['end']];

	        

	    }elseif(empty($post['start']) && empty($post['end'])){//无开始和结束日期
	        // $data['status']=0;
	        // $data['msg']='暂无数据...';
	        // return $data;
	    }elseif(!empty($post['start']) && !empty($post['end'])){//有开始和结束日期
	        $post['start']=strtotime($post['start']);
	        $post['end']=strtotime($post['end']);

	        $time['a.create_time']=['between',"$post[start],$post[end]"];
	    }

	    if(isset($post['keywords'])&& isset($post['modules'])){

	        if(!empty($post['keywords']) && !empty($post['modules'])){

	            if($post['modules']=="name" || $post['modules']=="url" || $post['modules']=="status"){
	                
	                $post['modules']='a.'.$post['modules'];

	                if($post['modules']=='a.status'){

	                	if($post['keywords']=="正常"){
	                	    $post['keywords']=1;
	                	}elseif($post['keywords']=="禁用"){
	                	    $post['keywords']=0;
	                	}else{
	                	    $data['status']=0;
	                	    $data['msg']="暂无数据！";
	                	    return $data;
	                	}
	                }

	            }

	            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];

	        }
	        

	    }

	    $list=Db::name($table)->order('id desc')->page($page,$limit)->where($where)->where($time)->select();

	    $count=Db::name($table)->where($where)->where($time)->count();

	    if(empty($list)){
	        $data['status']=0;
	        $data['msg']="暂无数据...";
	        return $data;
	    }else{
	        
	        return ['list'=>$list,'count'=>$count];
	    }
	}
}