<?php

namespace app\admin\model;

use think\Model;

class Cate extends Model
{

	protected $pk = 'id';

	private static $_instance = null;

    private function __clone(){} //禁止被克隆

    static public function getInstance()
    {
    	//单例模式
	    if(!(self::$_instance instanceof self)){
	        self::$_instance = new self;
	    }
	    return self::$_instance;
	}

	public static function select()
	{

		$rows=self::getInstance()::all(function($query){
			$query->field("id,title,pid,path,concat(path,',',id) as bpath")->order('bpath')->where('is_available=1');
		});

		foreach ($rows as $key => $value) {
			
			$rows[$key]['count']=count(explode('-',$value['bpath']));

			$rows[$key]['title']=str_repeat('&nbsp;&nbsp;', substr_count($value['path'], '-')).'&nbsp;&nbsp;|--'.$value['title'];

		}

		return $rows;
	}

	
}