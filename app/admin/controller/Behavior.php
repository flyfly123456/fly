<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;

use app\admin\behavior\Files;

class Behavior extends Base
{
	//公共行为类
    public function uploads_img()
    {
        return Files::uploads_img();
    }

    // 根据传入的数字获得相应序号的大写字母
    public function get_char()
    {
    	if (Request::instance()->isAjax()){

    	    $data=Request::instance()->post();
    	    if(!empty($data)){

    	    	if($data['num']+1<=676){
    	    		for($i = 'A',$j=1;'Z' >= $i,$j<=676; $i++,$j++){
    	    		    
    	    		    if($data['num']+1==$j){
    	    		    	
    	    		    	return $i;
    	    		    	break;
    	    		    	die();
    	    		    }
    	    		}
    	    	}

    	    	return false;
    	    }
    	}
    	
    }

}
