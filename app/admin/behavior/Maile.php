<?php

namespace app\admin\behavior;

use think\Db;
use PHPMailer\PHPMailer\PHPMailer;

class Maile
{
	public static function send_mail($to, $name, $subject = '', $body = '', $attachment = null){

		$openssl_funcs = get_extension_funcs('openssl');
		if(!$openssl_funcs){

		    return array('status'=>0 , 'msg'=>'请先开启openssl扩展');
		}

		$config = Db::name('smtp_config')->where('id=1')->find();

		$mail = new PHPMailer(); //PHPMailer对象

		$mail->CharSet = 'UTF-8'; //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码

		$mail->IsSMTP(); // 设定使用SMTP服务

		$mail->SMTPDebug = 0; // 关闭SMTP调试功能

		// 1 = errors and messages

		// 2 = messages only

		$mail->SMTPAuth = true; // 启用 SMTP 验证功能

		$mail->SMTPSecure = 'ssl'; // 使用安全协议

		$mail->Host = $config['smtp_name']; // SMTP 服务器

		$mail->Port = $config['smtp_port']; // SMTP服务器的端口号

		$mail->Username = $config['send_email_address']; // SMTP服务器用户名

		$mail->Password = $config['author_code']; // SMTP服务器密码

		$mail->SetFrom($config['send_email_address'], $config['send_email_address']);

		$replyEmail = $config['reply_address']?$config['reply_address']:$config['send_email_address'];

		$replyName = $config['reply_name']?$config['reply_name']:$config['send_nickname'];

		$mail->AddReplyTo($replyEmail, $replyName);

		$mail->Subject = $subject;

		$mail->AltBody = "为了查看该邮件，请切换到支持 HTML 的邮件客户端";

		$mail->MsgHTML($body);

		if(is_array($to)){
		    foreach ($to as $v){
		        $mail->addAddress($v,$name);
		    }
		}else{
		    $mail->addAddress($to,$name);
		}

		// $mail->AddAddress($to, $name);

		if(is_array($attachment)){ // 添加附件

			foreach ($attachment as $file){

				is_file($file) && $mail->AddAttachment($file);

			}

		}

		// $mail->SMTPOptions = array(
		// 	'ssl' => array(
		// 	'verify_peer' => false,
		// 	'verify_peer_name' => false,
		// 	'allow_self_signed' => true
		// 	)
		// );

		// $mail->SMTPSecure = 'tls';
		// $mail->Port = 587;

		
		return $mail->Send() ? true : false;

	}
}