<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Db;

use app\admin\behavior\Maile;

use Workerman\Lib\Timer;


class Test extends Controller
{
	public function _initialize()//_initialize与__construct有区别
	{
		// parent::_initialize();
	 //    $request= Request::instance();
	 //    $module_name=$request->module();
	 //    $action=$request->action();
	 //    $controller=$request->controller();
	 //    $action=$module_name."/".$controller."/".$action;
	 //    parent::admin_priv($action);
	}

	//超过7天发邮件提示
    public function sendNoticeMail()
    {
        $admin=Db::name('admin')->where(['status'=>1,'is_available'=>1,'is_send'=>0])->select();

        foreach ($admin as $key => $value) {
            //判断时间差
            $diffTime=time()-$value['create_time'];

            if(intval($diffTime) > 604800){

                $send=Maile::send_mail('1719847255@qq.com', $name="验证码", $subject = 'flyfly', $body = 'hhh'.$key.$value['name'], $attachment = null);

                if($send){
                    echo $value['name']."\n";
                    //改变状态
                    $change=Db::name('admin')->where('id',$value['id'])->update(['is_send'=>1,'send_time'=>time()]);
                }
            }
            
        }
        
    }


    public function add_timer()
    {
        Timer::add(1, array($this, 'sendNoticeMail'), array(), true);

    }

	

}
