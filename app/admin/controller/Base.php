<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Config;
use \think\Session;
use \think\Request;
use \think\Db;
use app\admin\model\Author;
use app\admin\model\AdminLog;
use app\admin\controller\Admin;

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
        //登入初始化
        $request= Request::instance();
        
        $module_name=$request->module();
        $action_name=$request->action();
        $controller_name=$request->controller();
        $action=$module_name."/".$controller_name."/".$action_name;

        if($module_name=="admin" && $controller_name!="Login" && $action_name!="login"){

            //验证登入信息
            $check_login=$this->check_login();
            
            if(!$check_login){

                // $this->redirect('admin/Login/index');
                $this->error('请先登录', 'admin/login/index', null, 3);
            }else{

                $memcache=new \memcache();
                $memcache->connect('127.0.0.1',11211) or die('Count not connect');
                
                $login=Session::get('login');
                
                $menu_sort=$memcache->get('menu_sort'.$login['id']);
                $url=$memcache->get('url'.$login['id']);
                
                $this->assign('menu',$url);
                $this->assign('menu_sort',$menu_sort);
                $login_role_group_id=Session::get('login.role_group_id');
                $login_role_group_id=explode(',', $login_role_group_id);
                
                //管理员日志记录自动执行
                $this->check_admin_log($action);
                
                //权限验证
                $this->admin_priv($action);
                //缓存管理员菜单
                if($menu_sort==null || empty($menu_sort) && $url==null || empty($url)){
                    //菜单权限分配
                    $row=array();
                    $menu=Config::get('menu');
                    
                    //设置权限url
                    $memcache->set('acl',$menu);
                    //循环角色ID
                    foreach ($login_role_group_id as $key => $value) {
                        # code...
                        $rows=Db::name('admin')->alias('a')->order('a.id asc')->join('role_group g',$value.'= g.id','Left')->find();
                        array_push($row, $rows);
                    }
                    // $rows=Db::name('role_group')->where('id',$login_role_group_id)->select();
                    $rows=$row;
                    
                    $url=array();
                    
                    $inarr=array();
                    
                    //循环查询admin表的结果,分配菜单权限
                    foreach ($rows as $kk => $vv) {
                        # code...
                        $str=$vv['acl'];
                        //判断是否超级管理员
                        if($str!='all'){
                            
                            $arr=explode('@', $str);
                            
                            for($row=0;$row<count($menu);$row++){
                                
                                foreach ($menu[$row]['sub'] as $kkk => $vvv) {
                                    # code...

                                    foreach ($arr as $k => $v) {
                                        # code...
                                        
                                        if($v==$vvv['url']){
                                            if(!in_array($menu[$row],$url)){
                                                array_push($url, $menu[$row]);
                                            }
                                        }
                                        
                                        array_push($inarr, $v);

                                    }
                                    
                                }
                            }
                            
                            $menu_sort=$this->get_system_sort(Session::get('login.role_group_id'));
                            
                            $this->assign('menu',$url);
                            $this->assign('menu_sort',$menu_sort);
                            
                            $memcache->set('menu_sort'.$login['id'],$menu_sort);
                            $memcache->set('url'.$login['id'],$url);
                            
                        }else{
                            
                            //超级管理员
                            $url=$menu;
                            $menu_sort=$this->get_system_sort(Session::get('login.role_group_id'));
                            
                            $this->assign('menu',$url);
                            $this->assign('menu_sort',$menu_sort);
                            
                            $memcache->set('menu_sort'.$login['id'],$menu_sort);
                            $memcache->set('url'.$login['id'],$url);
                            
                            break;
                        }
                    }
                }
                
                //设置权限url
                
                $acl=$memcache->get('acl');
                
                Session::set('acl',$acl);
                
                //开启权限验证
                $this->admin_acl();
            }
        
        }
        
    }

    //控制器方法权限把控
    protected function admin_priv($action)
    {
        //排除登入页面、找回密码页面
        if($action!="admin/Login/index" && $action!="admin/Login/login" && $action!="admin/Login/remember_pass"){
            //验证登入信息
            $check_login=$this->check_login();
        
            if($check_login){
                $action_list = Session::get('acl_list');//当前管理员权限列表
                
                //思路：获取所有控制器和方法，将公共控制器方法赋值给所有管理员
                //未隐藏入口文件的时候使用
                // $add_acl='/index.php/admin/Index/welcome@/index.php/admin/Index/index@/index.php/admin/Login/index@/index.php/admin/Login/login@/index.php/admin/Login/remember_pass';
                
                $add_acl='/admin/Index/welcome@/admin/Index/index@/admin/Login/index@/admin/Login/login@/admin/Login/remember_pass';

                if($action_list == 'all'){

                    return true;
                }else{
                    
                    $action_list.=$add_acl;
                    
                    if(strpos($action_list,$action) === false){
                        $this->error('暂无权限查看此模块','/404.html',1);
                        header('Location:/404.html');
                        exit('对此模块暂无权限');
                    }
                }
            }else{
                $this->error('您还未登入，请先登入！','admin/Login/index',3);
                exit('您还未登入，请先登入！');
            }
        }
            
    }

    //获取控制器方法权限
    protected function admin_acl()
    {
        $id=Session::get('login.role_group_id');
        $rows=Db::name('role_group')->where('id',$id)->find();
        if($rows){
            Session::set('acl_list',$rows['acl']);
        }
        return $rows['acl'];
    }


    //记录管理员操作日志
    protected function check_admin_log($action)
    {
        $AdminLog=new AdminLog();
        
        $logarr=Db::name('role_author')->select();
        
        foreach ($logarr as $key => $value) {
            # code...
            
            if(strstr($value['role_code'],$action)){
                
               $AdminLog->admin_log(Session::get('login.id'),$value['role_name']);
            }
        }
    }


    protected function check_login()
    {
        $login=Session::get('login');
        
        if(!empty($login) && isset($login['id']) && $login['id']!="" && isset($login['name']) && $login['name']!="" && $login['id']>0){

            return true;
        }else{
            return false;
        }
    }


    //锁屏配置文件内容读取
    protected function modify_config($arr = [], $file = 'queue',$admin)
    {
        if (is_array($arr)) {
            $filename = $file . EXT;
     
            $filepath = APP_PATH . 'extra/' . $filename;
            if (!file_exists($filepath)) {
                $conf = "<?php return [];";
                file_put_contents($filepath, $conf);
            }
     
            $conf = include $filepath;
            foreach ($arr as $key => $value) {
                $conf[$key] = $value;
            }
     
            $time = date('Y/m/d H:i:s');
            $str = "<?php\r\n/**\r\n * 由".config('database')['database']."建立.\r\n * 被".$admin."管理员修改于：".$time."\r\n */\r\nreturn [\r\n";
            foreach ($conf as $key => $value) {
                $str .= "\t'$key' => '$value',";
                $str .= "\r\n";
            }
            $str .= '];';
     
            file_put_contents($filepath, $str);
            
            return true;
        } else {
            return false;
        }
    }

    protected function get_system_sort($role_group_id){
        //获取系统类别
        $admin_system_sort=new Admin();
        $system_sort=$admin_system_sort->get_system_sort($role_group_id);
        $system_author=array();
        
        foreach ($system_sort as $key => $value) {
            # code...
            $system_sort[$key]['sort_name']=substr($value['sort_name'],0,strpos($value['sort_name'], '_'));
            $system_sort[$key]['sort_name_en']=substr($value['sort_name'],strpos($value['sort_name'], '_')+1);
        }

        return $system_sort;
    }

    //所有控制器空方法处理
    public function _empty(){
        header('Location:/404.html');
        exit();
    }

}
