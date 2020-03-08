<?php
namespace app\management\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Image;

class System extends Base
{

    public function menu()
    {
        return $this->fetch();
    }

    public function menu_add()
    {
        return $this->fetch();
    }


}
