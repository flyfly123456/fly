<?php
namespace app\admin\behavior;
use \think\Controller;
use \think\Request;
use \think\Image;
use app\admin\behavior\Behavior;

class Files extends Controller
{
	public static function uploads_img()
    {
        if(Request::instance()->isAjax()){
            
            $file=Request::instance()->file('file');
            
            if($file){

                $info = $file->validate(['size'=>1048576,'ext'=>'jpg,png,gif'])->rule('uniqid')->move(ROOT_PATH . 'public' . DS . 'uploads'.DS.'temp');
                if($info){

                    return json_encode(['code' => 0, 'message' => $file->getError(),'img'=>$info->getSaveName()]);
                
                }else{
                    // 上传失败获取错误信息
                    //     return $file->getError();
                    return json_encode(['code' => 1, 'message' => $file->getError()]);
                }
            }
        }
        
    }


    public static function uploads_file()
    {
        if(Request::instance()->isAjax()){
            $file=Request::instance()->file('file');

            if($file){

                $info = $file->validate(['size'=>83886080,'ext'=>'doc,docx'])->rule('uniqid')->move(ROOT_PATH . 'public' . DS . 'uploads'.DS.'temp');
                if($info){

                    return json_encode(['status' => 1, 'message' => $info->getSaveName()]);
                
                }else{
               
                    return json_encode(['status' => 0, 'message' => $file->getError()]);
                }
            }
        }
    }


    public static function download_question_templet($files)
    {
        header("Content-type:text/html;charset=utf-8"); 
        $file_path=urldecode($files);
        //用以解决中文不能显示出来的问题 
        // $file_name=iconv("utf-8","gb2312",$file_name);
        //首先要判断给定的文件存在与否 
        if(!file_exists($file_path)){
            echo "没有该文件..."; 
            return ;
        }
        $fp=fopen($file_path,"r");
        $file_size=filesize($file_path);
        
        //下载文件需要用到的头
        Header("Content-type: application/octet-stream");
        Header("Accept-Ranges: bytes");
        Header("Accept-Length:".$file_size);
        Header("Content-Disposition: attachment; filename=".time().'.doc');
        $buffer=1024;
        $file_count=0;
        //向浏览器返回数据
        while(!feof($fp) && $file_count<$file_size){
            $file_con=fread($fp,$buffer);
            $file_count+=$buffer;
            echo $file_con;
        }
        fclose($fp);
    }


    /**
    * @params
    * $oldfile:原始文件
    * $dname:要保存的文件夹名字
    * $width:图片宽
    * $height:图片高
    */

    public static function thumb_image($oldfile,$dname,$width=400,$height=300)
    {
        $filepath=ROOT_PATH . 'public' . DS . 'uploads'.DS.'temp'.DS.$oldfile;
        
        $savepath=ROOT_PATH . 'public' . DS . 'uploads'.DS.$dname;
        
        if(!is_dir($savepath)){
            
            Behavior::directory($savepath);
        }
        
        if($image = Image::open($filepath)){
            
            if($image->thumb($width, $height)->save($savepath.DS.$oldfile)){
                
                if(file_exists($filepath)){
                    unlink($filepath);
                }
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
        
    }


    public static function delete_img($file)
    {
        $filepath=ROOT_PATH . 'public' . DS . 'uploads'.DS.$file;
        
        if(file_exists($filepath)){
            
            unlink($filepath);
        }

    }


}
