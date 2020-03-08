<?php
namespace app\admin\model;

use think\Model;
use think\Db;
class Phpmailer extends Model {
	
	public function think_send_mail($to, $name, $subject = '', $body = '', $attachment = null){

		$config = Db::name('smtp_config')->order('id desc')->limit(0,1)->select();
		
		Vendor('PHPMailer.PHPMailerAutoload'); //从PHPMailer目录导class.phpmailer.php类文件

		$mail = new \PHPMailer(); //PHPMailer对象

		$mail->CharSet = 'UTF-8'; //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码

		$mail->IsSMTP(); // 设定使用SMTP服务

		$mail->SMTPDebug = 0; // 关闭SMTP调试功能

		// 1 = errors and messages

		// 2 = messages only

		$mail->SMTPAuth = true; // 启用 SMTP 验证功能

		$mail->SMTPSecure = 'ssl'; // 使用安全协议

		$mail->Host = $config[0]['smtp_name']; // SMTP 服务器

		$mail->Port = $config[0]['smtp_port']; // SMTP服务器的端口号

		$mail->Username = $config[0]['send_email_address']; // SMTP服务器用户名

		$mail->Password = $config[0]['author_code']; // SMTP服务器密码

		$mail->SetFrom($config[0]['send_email_address'], $config[0]['send_email_address']);

		$replyEmail = $config[0]['reply_address']?$config[0]['reply_address']:$config[0]['send_email_address'];

		$replyName = $config[0]['reply_name']?$config[0]['reply_name']:$config[0]['send_nickname'];

		$mail->AddReplyTo($replyEmail, $replyName);

		$mail->Subject = $subject;

		$mail->AltBody = "为了查看该邮件，请切换到支持 HTML 的邮件客户端";

		$mail->MsgHTML($body);

		$mail->AddAddress($to, $name);

		if(is_array($attachment)){ // 添加附件

			foreach ($attachment as $file){

				is_file($file) && $mail->AddAttachment($file);

			}

		}

		return $mail->Send() ? true : $mail->ErrorInfo;

	}

	
}