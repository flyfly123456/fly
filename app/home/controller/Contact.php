<?php

namespace app\home\controller;

use \think\Controller;
use \think\Request;
use \think\Db;

class Contact extends Controller
{
	public function index()
	{

		return $this->fetch();
	}


}

