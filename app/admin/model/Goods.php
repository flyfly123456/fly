<?php
namespace app\admin\model;

use \think\Model;
use \think\Image;

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
                
                mkdir(is_dir($path));

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

    public static function thumb_image($img,$savename,$width=800,$height=800)
    {
        $path=ROOT_PATH . 'public' . DS . 'uploads'.DS.'shop';

        if(!is_dir($path)){
            
            mkdir(is_dir($path));

            if(!is_writable($path)){
                chmod($path,0777);
            }
        }

        if($image = Image::open(ROOT_PATH . 'public' . DS . 'uploads'.DS.$img)){
            
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