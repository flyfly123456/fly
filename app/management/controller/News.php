<?php
namespace app\management\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Image;

class News extends Base
{

    public function index()
    {
        return $this->fetch();
    }


    public function add()
    {
        return $this->fetch();
    }


}
