<?php
namespace app\index\controller;
use \think\Controller;
use \think\Db;
use \think\Request;
use \think\Session;

class Index extends Base
{
    public function index()
    {

    	$rows=Db::name('cate')->where('is_available=1')->select();//查询所有分类

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
    		$list2[$key]['child']=array();
    		$tmp=explode('-', $value['path']);
    		unset($tmp[2]);
    		$str=implode($tmp, '-');

    		foreach ($list3 as $k3 => $v3) {
    			$tmp=explode('-', $v3['path']);
    			unset($tmp[3]);
    			$str3=implode($tmp, '-');

    			if($value['path']==$str3){
    				array_push($list2[$key]['child'], $v3);
    			}
    		}
    	}

    	//合并一级二级分类
    	foreach ($list as $key => $value) {
    		
    		$list[$key]['child']=array();

    		foreach ($list2 as $k => $v) {

    			$tmp=explode('-', $v['path']);
    			unset($tmp[2]);
    			$str=implode($tmp, '-');

    			if($value['path']==$str){
    				array_push($list[$key]['child'], $v);
    			}
    		}
    		
    	}

        $rest=Db::name('cate')->where('is_available=1 and pid=0')->select();//查询所有一级分类

        $shop=Db::name('shop')->where('is_available=1')->select();//查询所有商品
        $hot=Db::name('shop')->where('is_available=1 and is_hot=1')->select();//查询所有商品

        foreach ($rest as $key => $value) {
            
            $rest[$key]['children']=array();
            $rest[$key]['hot']=array();
            $rest[$key]['cate2']=array();
            $rest[$key]['cate3']=array();
            
            foreach ($shop as $k => $v) {

                if($value['id']==$v['cate_id']){
                    array_push($rest[$key]['children'], $v);
                }
            }

            foreach ($hot as $kh => $vh) {
                if($value['id']==$vh['cate_id']){
                    array_push($rest[$key]['hot'], $vh);
                }
            }

            foreach ($list2 as $k2 => $v2) {

                $tmp=explode('-', $v2['path']);
                unset($tmp[2]);
                $str=implode($tmp, '-');

                if($value['path']==$str){
                    array_push($rest[$key]['cate2'], $v2);
                }
            }

            foreach ($list3 as $k3 => $v3) {
                $tmp=explode('-', $v3['path']);
                unset($tmp[2]);
                unset($tmp[3]);
                $str3=implode($tmp, '-');

                if($value['path']==$str3){
                    array_push($rest[$key]['cate3'], $v3);
                }
                
            }
            
        }

        // echo "<pre>";
        //     print_r($rest);
        // echo "</pre>";
        // exit;

        $userinfo=Session::get('user');

        //查询轮播
        $ad=Db::name('ad')->where(['is_available'=>1,'position_id'=>1])->select();

        //抢购活动
        $buy=Db::name('ad')->where(['is_available'=>1,'position_id'=>3])->select();
        
        $this->assign('cate',$list);
        $this->assign('shop',$rest);
        $this->assign('userinfo',$userinfo);
        $this->assign('ad',$ad);
        $this->assign('buy',$buy);
        
        return $this->fetch('index');
    }

}
