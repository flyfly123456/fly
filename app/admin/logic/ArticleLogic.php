<?php

namespace app\admin\logic;

use \think\Controller;
use \think\Request;
use \think\Db;

class ArticleLogic extends Controller
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

	            if($post['modules']=="status"){
	                if($post['keywords']=="已驳回"){
	                    $post['keywords']=3;
	                }elseif($post['keywords']=="已审核"){
	                    $post['keywords']=2;
	                }elseif($post['keywords']=="已取回"){
	                    $post['keywords']=1;
	                }elseif($post['keywords']=="未送审"){
	                    $post['keywords']=0;
	                }else{
	                    $data['status']=0;
	                    $data['msg']="暂无数据！";
	                    return $data;
	                }
	            
	            }

	            if($post['modules']=="cate"){
	                $cate=Db::name('article_cate')->where(['name'=>$post['keywords']])->find();
	                $post['keywords']=$cate['id'];

	                $post['modules']="cate_id";
	            
	            }

	            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];

	        }
	        

	    }

	    $count=Db::name($table)->where($where)->count();

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