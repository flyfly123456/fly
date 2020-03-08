<?php
namespace app\management\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Image;

class Base extends Controller
{
	public function __construct()
	{
	    
	    header("content-type:text/html;charset=utf-8");
	    parent::__construct();//执行一次父类的构造方法

	    // $sql_model=Db::query("SELECT @@global.sql_mode");
	    
	    //设置mysql5.7的sql模式为空
	    Db::query("set @@sql_mode=''");

	}

	public function _initialize()//_initialize与__construct有区别
	{
	    parent::_initialize();

	    $rows=Db::name('menu')->where(['type'=>0,'is_show'=>1,'pid'=>0])->order('sort asc')->select();

	    foreach ($rows as $key => $value) {

	    	$SubMenu=Db::name('menu')->where(['type'=>0,'is_show'=>1,'pid'=>$value['id']])->order('sort asc')->select();
	    	$rows[$key]['children']=array();
	    	foreach ($SubMenu as $k => $v) {
	    		if($value['id']==$v['pid']){
	    			array_push($rows[$key]['children'], $v);
	    		}
	    	}
	    }

	    $this->assign('menu',$rows);
	    
	    
	}


}
