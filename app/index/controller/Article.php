<?php
namespace app\index\controller;
use \think\Controller;
use \think\Db;
use \think\Request;
use \think\Session;
use app\index\model\Article as at;

class Article extends Base
{
    public function index()
    {

    	$id=input('id');

        $article=Db::name('article')->where(['id'=>$id,'status'=>2,'is_available'=>1])->find();

        $article['create_time']=date('Y-m-d H:i',$article['create_time']);

        $article_list=at::select();

        $this->assign('article',$article);
        $this->assign('article_list',$article_list);
        
        return $this->fetch('index');
    }


}
