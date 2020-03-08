<?php

namespace app\index\model;

use \think\Model;
use \think\Db;

class PassSafe extends Model
{
	public static function grade($pwd)
	{
		if ($pwd == null || strlen($pwd) < 6) {
	        return false;
	    }

	    $pwd = trim($pwd);

	    if (preg_match("/^[0-9]+$/", $pwd)) { //必须含有特殊字符
	        return ['code' => 0, 'msg' => '密码全为数字'];
	    }

	    if (preg_match("/^[a-zA-Z]+$/", $pwd)) {
	        return ['code' => 0,'msg' => '密码全为字母'];
	    }

	    if (preg_match("/^[0-9A-Z]+$/", $pwd)) {
	        return ['code' => 1, 'msg' => '密码为数字和大写字母组合'];
	    }

	    if (preg_match("/^[0-9a-z]+$/", $pwd)) {
	        return ['code' => 1,'msg' => '密码为数字和小写字母组合'];
	    }

	    return ['code' => 2,'msg' => '密码复杂度较强'];
	}
}