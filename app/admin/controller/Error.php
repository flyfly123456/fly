<?php
namespace app\admin\controller;
use \think\Controller;


class Error extends controller
{
	public function _empty(){
		header('Location:/404.html');
		exit();
	}

	public function index(){
		header('Location:/404.html');
		exit();
	}
}