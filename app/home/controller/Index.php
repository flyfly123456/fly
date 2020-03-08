<?php

namespace app\home\controller;

use \think\Controller;
use \think\Request;
use \think\Db;

class Index extends Controller
{
	public function index()
	{

		return $this->fetch();
	}


	public function event()
	{

		return $this->fetch();
	}
}

