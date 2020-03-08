<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// [ 应用入口文件 ]

// 定义应用目录
define('APP_PATH', __DIR__ . '/../app/');

// 检测PHP环境
if(version_compare(PHP_VERSION,'5.5.0','<'))
{
    header("Content-type: text/html; charset=utf-8");
    die('PHP 版本必须大于 5.5！');
}
//error_reporting(E_ALL ^ E_NOTICE);//显示除去 E_NOTICE 之外的所有错误信息
error_reporting(E_ERROR | E_WARNING | E_PARSE);//报告运行时错误

//检测是否已安装flyfly系统
if(is_dir("./install/") && !file_exists("./install/install.lock")){
	
	// 组装安装url
	$url=$_SERVER['HTTP_HOST'].trim($_SERVER['SCRIPT_NAME'],'index.php').'install/index.php';
	// 使用http://域名方式访问；避免./public/install 路径方式的兼容性和其他出错问题
	header("Location:http://$url");
	exit();
	
}


// 加载框架引导文件
require __DIR__ . '/../thinkphp/start.php';

