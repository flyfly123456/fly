<?php

namespace app\admin\logic;

use \think\Controller;
use \think\Request;
use \think\Db;


class RecycleLogic extends Controller
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

		$where['m.is_available']=0;

		if(!empty($post['start']) && empty($post['end'])){//只有开始日期
		    
		    $post['start']=strtotime($post['start']);
		    $time['m.create_time']=['>',$post['start']];

		    
		}elseif(empty($post['start']) && !empty($post['end'])){//只有结束日期
		    
		    $post['end']=strtotime($post['end']);
		    $time['m.create_time']=['<',$post['end']];

		    

		}elseif(empty($post['start']) && empty($post['end'])){//无开始和结束日期
		    // $data['status']=0;
		    // $data['msg']='暂无数据...';
		    // return $data;
		}elseif(!empty($post['start']) && !empty($post['end'])){//有开始和结束日期
		    $post['start']=strtotime($post['start']);
		    $post['end']=strtotime($post['end']);

		    $time['m.create_time']=['between',"$post[start],$post[end]"];
		}

		if(isset($post['keywords'])&& isset($post['modules'])){

		    if(!empty($post['keywords']) && !empty($post['modules'])){

		    	$post['modules']='m.'.$post['modules'];

		        if($post['modules']=="m.sex"){
		            if($post['keywords']=="男"){
		                $post['keywords']=0;
		            }elseif($post['keywords']=="女"){
		                $post['keywords']=1;
		            }elseif($post['keywords']=="保密"){
		            	$post['keywords']=2;
		            }
		        
		        }

		        if($post['modules']=="m.status"){
		            if($post['keywords']=="已启用" || $post['keywords']=="已启用"){
		                $post['keywords']=1;
		            }elseif($post['keywords']=="未启用"){
		                $post['keywords']=0;
		            }
		            
		        }

		        if($post['modules']=="m.type"){

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
		    

		}

		$count=Db::name($table)->alias('m')->field(['m.id','m.username','m.sex','m.create_time','m.type','m.status','m.email','m.address','m.telephone'])->where($where)->where($time)->count();

		$list=Db::name($table)->alias('m')->field(['m.id','m.username','m.sex','m.create_time','m.type','m.status','m.email','m.address','m.telephone'])->page($page,$limit)->where($where)->where($time)->select();

		if(empty($list)){
		    $data['status']=0;
		    $data['msg']="暂无数据...";
		    return $data;
		}else{
		    
		    return ['list'=>$list,'count'=>$count];
		}
	}
}