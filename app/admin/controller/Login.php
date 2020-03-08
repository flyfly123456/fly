<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Cookie;
use \think\Session;
use \think\Request;
use \think\Db;
use \think\Config;

use app\admin\behavior\Maile;

class Login extends Base
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
    	
    	if(Session::get('login')){
            $this->success('你已经登录', 'Index/index');
        }else{

            $rows=Cookie::get('remember_info');
            // unset($rows['password']);
            unset($rows['verify']);
            
            $rows['password']=base64_decode($rows['password']);
            $this->assign('remember_info',$rows);
            return view('index');
        }
    	
    }

    public function login()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                
                if(captcha_check($data['verify'])){

                    $rows=Db::name('admin')->where('name',$data['username'])->find();
                    if($rows){
                        //判断是否允许多设备登入
                        if($rows['multi_device']!=1){
                            //判断是否在线
                            if($rows['online']==1){
                                $data['status']='0';
                                $data['msg']='账号已经在其他设备上登入！';
                                return json($data);
                            }else{
                                //设置在线标记
                                $online_mark=Db::name('admin')->where('id',$rows['id'])->update(["online"=>1]);
                                if($online_mark){
                                    $base_login=$this->base_login($rows,$data);
                                    $data['status']=$base_login['status'];
                                    $data['msg']=$base_login['msg'];
                                    return json($data);
                                }else{
                                    $data['status']='0';
                                    $data['msg']='网络数据错误！';
                                    return json($data);
                                }
                                
                            }
                            
                        }else{

                            $base_login=$this->base_login($rows,$data);
                            $data['status']=$base_login['status'];
                            $data['msg']=$base_login['msg'];
                            return json($data);
                        }
                        
                    }else{
                        $data['status']='0';
                        $data['msg']='用户名不存在！';
                        return json($data);
                    }
                    

                }else{
                    $data['status']='0';
                    $data['msg']='验证码有误！';
                    return json($data);
                }
            }else{
               $data['status']='0';
               $data['msg']='网络数据错误！';
               return json($data);
            }
            
        }else{
            $data['status']='0';
            $data['msg']='请先登录！';
            return json($data);
        }
        
    }


    public function base_login($rows,$data)
    {

        if(!$rows==null && $rows['status']=="1"){
            if($rows['password']==base64_encode($data['password'])){
                Session::set('login',$rows);
                $data['password']=base64_encode($data['password']);
                Cookie::set('remember_info',$data,1800);
                //设置锁屏密码
                $login_info=Session::get('login');
                $password=base64_decode($login_info['password']);
                $prefix=$login_info['name'];
                $arr = [
                    $prefix.'_clock_pass' => '123456'
                ];
                $clock_pass=$arr[$prefix.'_clock_pass'];//123456
                //判断是否初次登入
                $conf_info=$prefix.'_clock_pass';
                $get_config=Config::get('clock');
                
                $exist=array_key_exists($conf_info,$get_config);

                if(!$exist){

                    $extrarows=parent::modify_config($arr, $file = 'clock',$login_info['name']);
                    
                    if($extrarows){
                        $clock_info=Session::set('clock_pass',$clock_pass);
                        $clock_info_get=Session::get('clock_pass');
                        if($clock_info_get!=""||$clock_info_get!=null){
                            $last_login_info=$this->last_login_info($rows);
                            $count_login=$this->count_login($rows);
                            if($last_login_info && $count_login){

                                $data['status']='1';
                                $data['msg']='登入成功,正在跳转...';
                                return $data;
                                
                            }else{
                                $data['status']='0';
                                $data['msg']='数据库异常，请稍后再试';
                                return $data;
                            }
                        }
                        

                    }else{
                        $data['status']='0';
                        $data['msg']='配置锁屏信息失败！';
                        return $data;
                    }
                }else{
                    //不是初次登入
                    $clock_pass=Config::get('clock.'.$prefix.'_clock_pass');
                    $clock_info=Session::set('clock_pass',$clock_pass);
                    $clock_info_get=Session::get('clock_pass');
                    if($clock_info_get!=""||$clock_info_get!=null){

                        $last_login_info=$this->last_login_info($rows);
                        $count_login=$this->count_login($rows);
                        if($last_login_info && $count_login){

                            $data['status']='1';
                            $data['msg']='登入成功,正在跳转...';
                            return $data;
                        }else{
                            $data['status']='0';
                            $data['msg']='数据库异常，请稍后再试';
                            return $data;
                        }
                   }else{
                        $data['status']='0';
                        $data['msg']='配置锁屏信息失败！';
                        return $data;
                   }
                }
                
            }else{
                $data['status']='0';
                $data['msg']='密码有误！';
                return $data;
            }
        }else{
            $data['status']='0';
            $data['msg']='用户不存在或已被禁用！';
            return $data;
        }

    }

    public function last_login_info($rows){
        $request = Request::instance();
        $last_login_ip=$request->ip();
        $last_login_info=Db::name('admin')->where('id',$rows['id'])->update(array("last_login_time"=>time(),'last_login_ip'=>$last_login_ip));
        if($last_login_info){
            return true;
        }else{
            return false;
        }
    }

    //登入次数加一
    public function count_login($rows){
        $count_login=Db::name('admin')->where('id',$rows['id'])->setInc('count_login');
        if($count_login){
            return true;
        }else{
            return false;
        }
    }



    public function logout()
    {
        //设置离线标记
        $login=Session::get('login');
        if($login['multi_device']==0){
            $offline_mark=Db::name('admin')->where('id',$login['id'])->update(["online"=>0]);
            if($offline_mark){
                Session::clear();
                $this->success('退出成功', 'Login/index');
            }else{
                $this->success('退出失败，请刷新重试！');
            }
        }else{
            Session::clear();
            $this->success('退出成功', 'Login/index');
        }
    	
    }

    //找回密码
    public function remember_pass()
    {
        if(Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if(!empty($data)){

                $memcache=new \Memcache();
                $memcache->connect('127.0.0.1',11211) or die('Could not connect');
                
                //无邮箱验证码
                if(!isset($data['email_verify'])){

                    if(captcha_check($data['img_verify'])){

                        $rows=Db::name('admin')->where('email',$data['email'])->select();
                            if($rows){
                                //发送邮箱验证码
                                $arr=array('1','2','3','4','5','6','7','8','9','0');
                                shuffle($arr);
                                $subarr=array_slice($arr, 5);
                                $verify=implode("", $subarr);
                                $rows['name']="admin";
                                $content="管理员&nbsp;".$rows['name']."，您好！";
                                $content.="<br>";
                                $content.="<br>";
                                $content.="你正在使用QQ邮箱找回FlyFly后台管理系统登入密码，你的验证码为：";
                                $content.="<a href='javascript:;'>".$verify."</a>";
                                $content.="<br>";
                                $content.="<br>";
                                $content.="该邮件验证码有效期为<a href='javascript:;'>15</a>分钟，超时请重新获取验证码。";
                                $content.="<br>";
                                $content.="<br>";
                                $content.="收件日期：";
                                $content.=date("Y-m-d H:i:s");
                                $content.="<br>";
                                $content.="<br>";
                                $content.="此邮件为系统发出的，请勿直接回复。";
                                $title="FlyFly后台管理系统，邮箱验证码。";
                                
                                $send=Maile::send_mail($to=$data['email'], $name="验证码", $subject = $title, $body = $content, $attachment = null);

                                if($send){
                                    
                                    $memcache->set('email_verify',$verify,0,900);
                                    $memcache->set('admin_info',$rows,0,900);

                                    $data['status']='1';
                                    $data['msg']='验证码已发送，请前往至邮箱查收';
                                    return json($data);
                                }else{
                                    $data['status']='1';
                                    $data['msg']='验证码发送失败，请稍后再试';
                                    return json($data);
                                }

                                
                            }
                    //验证码不正确
                    }else{
                        $data['status']='0';
                        $data['msg']='图片验证码不正确！';
                        return json($data);
                    }
                //有邮箱验证码
                }else{
                    $email_verify=$memcache->get('email_verify');
                    $rest=$memcache->get('admin_info');
                    if($rest!=null && $email_verify!=null){
                        if($data['email_verify']==$email_verify){
                            $find_pass=base64_decode($rest['0']['password']);

                            $title="FlyFly后台管理系统，管理员密码找回。";

                            $content="管理员&nbsp;".$rest['0']['name']."，您好！";

                            $content.="<br>";
                            $content.="<br>";
                            $content.="你正在使用QQ邮箱找回FlyFly后台管理系统登入密码，你的密码为：";
                            $content.=$find_pass;
                            $content.="<br>";
                            $content.="<br>";
                            $content.="温馨提示：请注意个人密码隐私安全！";
                            $content.="<br>";
                            $content.="<br>";
                            $content.="收件日期：";
                            $content.=date("Y-m-d H:i:s");
                            $content.="<br>";
                            $content.="<br>";
                            $content.="此邮件为系统发出的，请勿直接回复。";
                            $send=Maile::send_mail($to=$rest['0']['email'], $name="找回密码", $subject = $title, $body = $content, $attachment = null);
                            if($send){
                                $data['status']='1';
                                $data['msg']='密码已经发至邮箱，请登入查看！';
                                return json($data);
                            }else{
                                $data['status']='0';
                                $data['msg']='密码发送失败，请稍后再试！';
                                return json($data);
                            }
                        }else{
                            $data['status']='0';
                            $data['msg']='邮箱验证码有误请重新输入！';
                            return json($data);
                        }
                    }else{
                        $data['status']='0';
                        $data['msg']='邮箱验证码已经过期，请重新获取！';
                        return json($data);

                    }
                    
                    
                    
                }
                
            //空数据   
            }else{
                $data['status']='0';
                $data['msg']='数据不能为空！';
                return json($data);
            }
        }else{

            Session::clear();
            return view('remember_pass');
        }

        
    }



}
