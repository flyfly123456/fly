<?php

namespace app\admin\logic;

use \think\Controller;
use \think\Request;
use \think\Db;

class AdminLogic extends Controller
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
	        $time['create_time']=['>',$post['start']];

	        
	    }elseif(empty($post['start']) && !empty($post['end'])){//只有结束日期
	        
	        $post['end']=strtotime($post['end']);
	        $time['create_time']=['<',$post['end']];

	        

	    }elseif(empty($post['start']) && empty($post['end'])){//无开始和结束日期
	        // $data['status']=0;
	        // $data['msg']='暂无数据...';
	        // return $data;
	    }elseif(!empty($post['start']) && !empty($post['end'])){//有开始和结束日期
	        $post['start']=strtotime($post['start']);
	        $post['end']=strtotime($post['end']);

	        $time['create_time']=['between',"$post[start],$post[end]"];
	    }

	    if(isset($post['keywords'])&& isset($post['modules'])){

	        if(!empty($post['keywords']) && !empty($post['modules'])){

	        	if($post['modules']=="sex"){
	        	    if($post['keywords']=="男"){
	        	        $post['keywords']=1;
	        	    }elseif($post['keywords']=="女"){
	        	        $post['keywords']=0;
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
	                   $data['msg']="暂无数据...";
	                   return json($data); 
	                }
	                
	            }

	            if($post['modules']=="department_id"){
	                $rows=Db::name('department')->where('name',$post['keywords'])->find();
	                if($rows){
	                    $post['keywords']=$rows['id'];
	                }else{
	                    $data['status']=0;
	                    $data['msg']="暂无数据...";
	                    return json($data);
	                }
	            
	            }


	            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];

	        }
	        

	    }

	    $count=Db::name($table)->where($where)->where($time)->count();

	    $list=Db::name($table)->page($page,$limit)->where($where)->where($time)->select();

	    if(empty($list)){
	        $data['status']=0;
	        $data['msg']="暂无数据...";
	        return $data;
	    }else{
	        
	        return ['list'=>$list,'count'=>$count];
	    }
	}
}