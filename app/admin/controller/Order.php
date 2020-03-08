<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
class Order extends Base
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
    	$count=Db::name('order')->count();
    	$rows=Db::name('order')->order('id desc')->paginate(5,$count,[
                        'type'=>'Bootstrap'
                    ])->each(function($item, $key){
                        $item['create_time'] = date('Y-m-d',$item['create_time']);
                        return $item;});
		$page = $rows->render();
		$this->assign('page',$page);
		$this->assign('count',$count);
		$this->assign('rows',$rows);
        return view('index');
    }


    public function order_add(){
    	return view('order_add');
    }

    public function delete()
    {
        return view('delete');
    }

}
