<?php
namespace app\index\model;

use \think\Model;
use \think\Db;

class Article extends Model
{
    /**
     * @param 
     */
    protected $pk = 'id';

    public static function select()
    {
    	$article=Db::name('article')->alias('a')->field('a.*,a.id aid,a.is_available ais_available,a.desc adesc,c.*,c.id cid,c.is_available cis_available,c.desc cdesc')->join('article_cate c','a.cate_id=c.id','LEFT')->where(['a.is_available'=>1,'a.status'=>2])->select();

    	return $article;
    }
    

}