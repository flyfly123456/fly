<?php
namespace app\management\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Image;

class Index extends Base
{

    public function index()
    {
        return $this->fetch();
    }

    public function welcome()
    {
        return $this->fetch();
    }


}
