<?php
namespace app\index\controller;
use \think\Controller;
use \think\Db;
use \think\Request;
use \think\Session;
use \think\Cookie;

use app\index\model\PassSafe;

class Login extends Controller
{
    public function index()
    {
    	if(Session::get('user')){
    		$this->redirect('index/person/index');
    	}

    	if (Request::instance()->isAjax()){
    	    
    	    $data=Request::instance()->post();
    	    if(!empty($data)){
    	    	$arr['username']=$data['username'];
    	    	$arr['password']=md5($data['password']);

    	    	if(captcha_check($data['code'])){
    	    		$rows=Db::name('members')->where('email|telephone','=',$arr['username'])->find();
    	    		if($rows){
	    	    		if($arr['password']==$rows['password']){
							Session::set('user',$rows);
			    	    	//判断本地是否有商品加入购物车，如果有，则将同步数据库购物车
                            $cart=Cookie::get('cart');
                            $cart_info=array();
                            if($cart){
                                foreach ($cart as $key => $value) {
                                    $shop_param=explode("_", $key);
                                    $cart_info['user_id']=$rows['id'];
                                    $cart_info['shop_id']=$shop_param[0];
                                    $cart_info['shop_model']=$shop_param[1];
                                    $cart_info['shop_number']=$value;
                                    $has=Db::name('cart')->where(['shop_model'=>$cart_info['shop_model'],'user_id'=>$cart_info['user_id'],'shop_id'=>$cart_info['shop_id']])->find();
                                    if($has){

                                        $number['shop_number']=intval($has['shop_number'])+intval($value);

                                        $update=Db::name('cart')->where('id='.$has['id'])->update($number);
                                    }else{
                                        $rest=Db::name('cart')->insert($cart_info);
                                    }
                                    
                                }

                                Cookie::delete('cart');
                                
                            }

			    	    	$data['status']=1;
			    	    	$data['msg']='登入成功';
			    	    	return json($data);
			    	    	
	    	    		}else{
	    	    			$data['status']=0;
	    	    			$data['msg']='密码错误';
	    	    			return json($data);
	    	    		}
    	    		}else{
    	    			$data['status']=0;
    	    			$data['msg']='用户不存在';
    	    			return json($data);
    	    		}

					
    	    	}else{
    	    		$data['status']=0;
    	    		$data['msg']='验证码错误';
    	    		return json($data);
    	    	}

				
    	    }
    	}

        return $this->fetch('index');
    }

    public function register()
    {
    	if (Request::instance()->isAjax()){
    	    
    	    $data=Request::instance()->post();
    	    if(!empty($data)){
    	    	if(isset($data['email']) && isset($data['password']) && isset($data['repassword'])){
    	    		$arr['email']=$data['email'];
    	    		$arr['password']=md5($data['password']);
    	    		$arr['repassword']=md5($data['repassword']);
    	    		$arr['create_time']=time();
                    $arr['username']="小叮当";
    	    		$arr['sex']=2;

    	    		$result = $this->validate($arr,'Login');
    	    		if(true !== $result){
    	    		    // 验证失败 输出错误信息
    	    		    $data['status']="0";
    	    		    $data['msg']=$result;
    	    		    return json($data);
    	    		}

    	    		unset($arr['repassword']);
                    $password_safe=PassSafe::grade($data['password']);
                    
                    $arr['password_safe']=$password_safe['code'];

					$rows=Db::name('members')->insert($arr);
					if($rows){
						$data['status']=1;
						$data['msg']='注册成功';
						return json($data);
					}else{
						$data['status']=0;
						$data['msg']='注册失败';
						return json($data);
					}  	    		

    	    	}

    	    	if(isset($data['telephone']) && isset($data['code']) && isset($data['password']) && isset($data['repassword'])){

    	    		
    	    	}
    	    	
    	    }
    	}

        return $this->fetch('register');
    }


    public function sass()
    {
    	if (Request::instance()->isAjax()){
    	    
    	    $data=Request::instance()->post();
    	    if(!empty($data)){
    	    	$arr=array('1','2','3','4','5','6','7','8','9','0');
    	    	shuffle($arr);
    	    	$subarr=array_slice($arr, 5);
    	    	$verify=implode("", $subarr);

		    	$statusStr = array(
		    			"0" => "短信发送成功",
		    			"-1" => "参数不全",
		    			"-2" => "服务器空间不支持,请确认支持curl或者fsocket，联系您的空间商解决或者更换空间！",
		    			"30" => "密码错误",
		    			"40" => "账号不存在",
		    			"41" => "余额不足",
		    			"42" => "帐户已过期",
		    			"43" => "IP地址限制",
		    			"50" => "内容含有敏感词"
		    		);	
		    	$smsapi = "http://www.smsbao.com/"; //短信网关
		    	$user = "flyfly"; //短信平台帐号
		    	$pass = md5("fly123456"); //短信平台密码
		    	$content=$verify;//要发送的短信内容
		    	$phone = $data['telephone'];
		    	$sendurl = $smsapi."sms?u=".$user."&p=".$pass."&m=".$phone."&c=".urlencode($content);
		    	$result =file_get_contents($sendurl) ;
		    	
		    	return json($statusStr[$result]);
		    }
		}
    }

    public function logout()
    {
    	Session::clear();

    	$this->redirect('index/index/index');
    }
}
