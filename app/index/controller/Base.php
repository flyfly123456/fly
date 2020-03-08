<?php
namespace app\index\controller;
use \think\Controller;
use \think\Session;
use \think\Cookie;
use \think\Request;
use \think\Db;

class Base extends Controller
{

    protected static $userinfo;

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
        //登入初始化
        $request= Request::instance();
        
        $module_name=$request->module();
        $action_name=$request->action();
        $controller_name=$request->controller();
        $action=$module_name."/".$controller_name."/".$action_name;
        
        if($module_name=="index" && $controller_name=="Person"){
            //验证登入信息
            $check_login=$this->check_login();
            
            if(!$check_login){

                // $this->redirect('index/Login/index');
                $this->error('您还未登入，请先登入','index/Login/index');
                exit();
            }
        }

        $userinfo=array();
        
        self::$userinfo=$userinfo=Session::get('user');

        if(!empty($userinfo)){

            switch ($userinfo['password_safe']) {
                case '0':
                    $userinfo['grade']="较弱";
                    break;
                case '1':
                    $userinfo['grade']="一般";
                    break;
                case '2':
                    $userinfo['grade']="较强";
                    break;
                
                default:
                    die('初始化数据失败');
                    break;
            }

            $carts=Db::name('cart')->where('user_id='.$userinfo['id'])->count();
            
        }else{
            
            $carts_info=Cookie::get('cart');
            $carts=count($carts_info);
        }

        //插件
        $plug=Db::name('plug')->where('status=1')->select();

        $this->assign('cart',$carts);

        $this->assign('userinfo',$userinfo);

        $this->assign('plug',$plug);
        
    }

    protected function check_login()
    {
        $userinfo=Session::get('user');
        
        if(!$userinfo || empty($userinfo) || $userinfo['id']<0){

            return false;
        }else{
           return true; 
        }
    }


    //所有控制器空方法处理
    public function _empty(){
        header('Location:/404.html');
        exit();
    }

}
