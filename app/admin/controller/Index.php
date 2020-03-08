<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Session;
use \think\Captcha;
use \think\Cookie;
use app\admin\model\SystemInfo;
use app\admin\model\Author;
use app\admin\model\SystemLog;
use app\admin\controller\System;
use app\admin\controller\Admin;
use \think\Config;
use \think\Cache;

use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\Autoloader;
use PhpOffice\PhpWord\Settings;
use PhpOffice\PhpWord\IOFactory;

use PHPMailer\PHPMailer\PHPMailer;
use TCPDF;

class Index extends Base
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

    //后台主页显示
    public function index()
    {
        // $mem=Cache::set('name','111',20);
        // $mem = Cache::store('memcache')->set('name','666',10);
        // echo "<pre>";
        //     print_r(Cache::store('memcache')->get('name'));
        // echo "</pre>";
        // exit;
        // echo "<pre>";
        //     print_r(strtotime('2018-06-09'));
        // echo "</pre>";
        // exit;

        // $file_path=ROOT_PATH . 'public' . DS . 'static' . DS . 'admin' . DS . 'templet' . DS . 'questions.docx';
        // $save_path=ROOT_PATH . 'public' . DS . 'static' . DS . 'admin' . DS . 'templet' . DS . 'questions.txt';

        // $str=file_get_contents($file_path);

        // $save_str=file_put_contents($save_path, $str);
        // echo "<pre>";
        //     print_r($save_str);
        // echo "</pre>";
        // exit;
        // Include the main TCPDF library (search for installation path).
        // vendor('TCPDF.tcpdf');

        // create new PDF document
        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

        $PhpWord=new PhpWord();
        $PHPMailer=new PHPMailer();
        $PhpWord->setDefaultFontName('仿宋'); // 全局字体
        $PhpWord->setDefaultFontSize(16);     // 全局字号为3号

        $memcache=new \Memcache();
        $memcache->connect('127.0.0.1',11211) or die('Could not connect');
        // $memcache->flush();
        $admin_id=Session::get('login.id');
        $admin_ids=Session::get('login.id').",";
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){

                $read_ids=$memcache->get('read_message');
                if($read_ids==null){
                    $memcache->set('read_message','0,');
                    $memcache->append('read_message',$admin_ids);
                }else{
                    $read_ids=$memcache->get('read_message');
                    $arr_ids=explode(',', $read_ids);
                    if(!in_array($admin_id, $arr_ids)){
                        $memcache->append('read_message',$admin_ids);
                    }
                    
                }

            }
        }
        // $memcache->set('read_message',null);
        // exit;
        $read_ids=$memcache->get('read_message');
        $in_id=preg_match_all('/(?<=,)\w+(?<!$)/u', $read_ids, $m);
        
        $array=array();
        foreach ($m as $key => $value) {
            # code...
            foreach ($value as $k => $v) {
                # code...
                array_push($array, $v);
            }
            
        }
        
        $exits_id=in_array($admin_id, $array);
        $memcache->set('show',$exits_id);
        $show=$memcache->get('show');
        $this->assign('in_id',$in_id);
        $this->assign('exits_id',$show);
        $this->assign('admin_id',$admin_id);
        // echo $memcache->get('show');
        
        //获取管理员头像
        $admin_info=Session::get('login');
        $admin_info['password']=base64_decode($admin_info['password']);
        $rows=Db::name('role_group')->where('id',$admin_info['role_group_id'])->find();
        //获取系统类别

        $system_sort=parent::get_system_sort($admin_info['role_group_id']);
        
        //获取网站基本信息
        $web_info=Db::name('web_info')->where('type','0')->limit(0,1)->find();
        
        $this->assign('system_sort',$system_sort);
        $this->assign('admin_info',$admin_info);
        $this->assign('admin_name',$admin_info['name']);
        $this->assign('web_info',$web_info);
        
        return $this->fetch('index');
    }

    //后台欢迎页面显示
    public function welcome(){
        $memcache=new \Memcache();
        $memcache->connect('127.0.0.1',11211) or die("Could not connect");
        // echo "<pre>";
        //     print_r($memcache->get('admin_info'));
        // echo "</pre>";
        // exit;
        $sysinfo=array();
        //统计文章数
        $count_article=$memcache->get('count_article');
        if(!isset($count_article) || $count_article==null){
            $count_article=Db::name('article')->group('id')->count();
            $memcache->set('count_article',$count_article, 0, 86400);
        }
        $sysinfo['count_article']=$count_article;
        //统计会员数
        $count_member=$memcache->get('count_member');
        if(!isset($count_member) || $count_member==null){
            $count_member=Db::name('members')->group('username')->count();
            $memcache->set('count_member',$count_member, 0, 86400);
        }
        
        $sysinfo['count_member']=$count_member;
        //当前登入的管理员
    	$sysinfo['admin_name']=Session::get('login.name');
        $version=Db::name('web_info')->where('id',1)->find();
        //系统版本号
        $sysinfo['version']=$version['web_version'];
        //PHP版本
        $sysinfo['php_version']=phpversion();
        //PHP运行方式
        $sysinfo['php_run_type']=php_sapi_name();
        //获取MySQL版本
        $mysql_version=$memcache->get('mysql_version');
        if(!isset($mysql_version) || $mysql_version==null){
            $mysql_version=Db::query('select VERSION()');
            $memcache->set('mysql_version',$mysql_version, 0, 86400);
        }
        $sysinfo['mysql_get_server_info']=$mysql_version[0]['VERSION()'];
        //获取thinkphp版本号
        $sysinfo['thinkphp_version']=THINK_VERSION;
        //服务器地址
        $sysinfo['server_addr']=$_SERVER['SERVER_ADDR'];
        //服务器运行环境
        $sysinfo['server_software']=$_SERVER ['SERVER_SOFTWARE'];
        //最大上传
        $sysinfo['upload_max_filesize']=get_cfg_var ("upload_max_filesize")?get_cfg_var ("upload_max_filesize"):"不允许上传附件";
        //最大执行时间
        $sysinfo['max_execution_time']=get_cfg_var("max_execution_time")."秒 ";
        //最大占用内存
        $sysinfo['memory_limit']=get_cfg_var ("memory_limit")?get_cfg_var("memory_limit"):"无";
        //系统剩余内存
        $cpu=$memcache->get('cpu');
        $memory=$memcache->get('memory');
        $info = new SystemInfo();
        //判断系统

        if(IS_WIN){
            $system="Windows";
            if(!isset($cpu)||empty($memory)){
                $cpu = $info->getCpuUsage();
                $memory = $info->getMemoryUsage();
                $memory=ceil($memory['FreePhysicalMemory']/1024).'M';
                
                $memcache->set('cpu', $cpu, 0, 86400);
                $memcache->set('memory', $memory, 0, 86400);
            }
        }else{
            $system="Linux";
            if(!isset($cpu)||empty($memory)){
                $status=$info->get_used_status();
                
                $cpu = $status['cpu'];
                $memory = $status['memory'];
                
                $memcache->set('cpu', $cpu, 0, 86400);
                $memcache->set('memory', $memory, 0, 86400);
            }
        }

        $sysinfo['cpu']=$memcache->get('cpu');
        $sysinfo['memory']=$memcache->get('memory');
        
        $sysinfo['system']=$system;
        
        //获取ip
        $sysinfo['ip']=Request::instance()->ip();
        
        //开发团队
        $sysinfo['team']="FlyFly";
        $sysinfo['developer']="FlyFly(1719847255@qq.com)";
        
        $this->assign('sysinfo',$sysinfo);

        //获取前3条系统公告
        $rest=Db::name('system_message')->order('id desc')->limit(0,3)->select();
        $this->assign('rest',$rest);
    	return view('welcome');
    }

    //清除缓存
    public function clear_cache(){
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                switch ($data['type']) {
                    case 'data':
                        # code...
                        //清除Memcache缓存
                        $memcache=new \Memcache();
                        $memcache->connect('127.0.0.1',11211) or die("Could not connect");
                        $memcache->flush();
                        $data['msg']="操作成功！";
                        $data['status']='1';
                        return json($data);
                        break;

                    case 'template':
                        # code...
                        //清理runtime目录缓存
                        $this->del_runtime(RUNTIME_PATH);
                        $data['msg']="操作成功！";
                        $data['status']='1';
                        return json($data);
                        break;
                    
                    default:
                        # code...
                        //清除Memcache缓存
                        $memcache=new \Memcache();
                        $memcache->connect('127.0.0.1',11211) or die("Could not connect");
                        $memcache->flush();
                        //清理runtime目录缓存
                        $this->del_runtime(RUNTIME_PATH);
                        $data['msg']="操作成功！";
                        $data['status']='1';
                        return json($data);
                        break;
                }
                
            }
        }
    }

    //删除runtime缓存文件
    public function del_runtime($dir) {
        $runtime=opendir($dir);
        while ($file = readdir($runtime)) {
            if ($file != "." && $file != "..") {

                $fullpath = $dir . "/" . $file;
                if (is_dir($fullpath)) {
                    $this->del_runtime($fullpath);
                } else {
                    unlink($fullpath);
                }
            }
        }
        closedir($runtime);
    }

    //设置系统休眠时间
    public function max_time(){
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                Session::set('login',null);
                Session::clear();
                $data['status']="1";
                $data['msg']="你太久没有操作了，系统已经退出，请重新登录";
                return json($data);
            }
        }
    }

}
