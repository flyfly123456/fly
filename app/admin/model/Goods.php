<?php
namespace app\admin\model;

use \think\Model;
use \think\Image;
use app\admin\behavior\Behavior;

class Goods extends Model
{
    /**
     * @param 
     */
    //上传图片
    public static function uploads_img($file,$index,$savename,$width=800,$height=800)
    {
        $path=ROOT_PATH . 'public' . DS . 'uploads'.DS.'shop'.DS.$index;

        if($file){
            if(!is_dir($path)){
                
                mkdir($path);

                if(!is_writable($path)){
                    chmod($path,0777);
                }
            }

            $info = $file->validate(['size'=>1048576,'ext'=>'jpg,png,gif'])->move($path,$savename);

            if($info){

                return json_encode(['code' => 0, 'message' => $file->getError(),'img'=>$info->getSaveName()]);
            
            }else{
                // 上传失败获取错误信息
                //     return $file->getError();
                return json_encode(['code' => 1, 'message' => $file->getError()]);
            }
        }
    }

    /**
    * @parms $img:原始图片名称
    * $savename:保存的名称
    * 
    */

    public static function thumb_image($img,$id,$savename,$width=800,$height=800)
    {
        $path=ROOT_PATH . 'public' . DS . 'uploads'.DS.'shop'.DS.date('Ymd').DS.$id;

        $tempimg=ROOT_PATH . 'public' . DS . 'uploads'.DS.'temp'.DS.$img;

        if(!is_dir($path)){
            
            Behavior::directory($path);

            if(!is_writable($path)){
                chmod($path,0777);
            }
        }

        if($image = Image::open($tempimg)){
            
            if($image->thumb($width, $height)->save($path.DS.$savename)){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
        
    }

    

}