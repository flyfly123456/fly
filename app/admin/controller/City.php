<?php
namespace app\admin\controller;
use \think\Controller;

class City extends Controller
{
    public function city()
    {
        return view('city');
    }


    public function delete()
    {
        return view('delete');
    }

}
