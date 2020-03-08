<?php
namespace app\admin\model;

use \think\Model;
use \think\Image;

class Uploads extends Model
{
    /**
     * @param 
     */
    //上传图片
    public static function uploads_img($file)
    {
        if($file){

            $info = $file->validate(['size'=>1048576,'ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'uploads');
            if($info){

                return json_encode(['code' => 0, 'message' => $file->getError(),'img'=>$info->getSaveName()]);
            
            }else{
                // 上传失败获取错误信息
                //     return $file->getError();
                return json_encode(['code' => 1, 'message' => $file->getError()]);
            }
        }
    }

    public static function thumb_image($img,$width=400,$height=300)
    {
        if($image = Image::open(ROOT_PATH . 'public' . DS . 'uploads'.DS.$img)){
            
            if($image->thumb($width, $height)->save(ROOT_PATH . 'public' . DS . 'uploads'.DS.$img)){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
        
    }

}