<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Session;

class Rinance extends Base
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

    public function cash()
    {
        return $this->fetch('cash');
    }


}
