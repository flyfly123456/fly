<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
class Point extends Base
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

    public function index()
    {
        return view('index');
    }


    public function delete()
    {
        return view('delete');
    }

}
