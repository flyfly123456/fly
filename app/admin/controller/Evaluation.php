<?php
//在线测评控制器
namespace app\admin\controller;
use \think\Controller;
use \think\Db;
use \think\Request;
use \think\Session;
use \think\Config;
use \think\Loader;

use PhpOffice\PhpWord\PhpWord;

use app\admin\model\Examination;
use app\admin\model\Questions;
use app\admin\model\QuestionsAnswer;
use app\admin\model\QuestionsOptions;

use app\admin\logic\QuestionsLogic;
use app\admin\logic\ExaminationLogic;

use app\admin\behavior\Behavior;
use app\admin\behavior\Files;

class Evaluation extends Base
{
    public function _initialize()//_initialize与__construct有区别
    {
        parent::_initialize();
        $request= Request::instance();
        $module_name=$request->module();
        $action=$request->action();
        $controller=$request->controller();
        $action=$module_name."/".$controller."/".$action;
        parent::admin_priv($action);
    }
    
    // 试卷列表
    public function examination_list()
    {
     return $this->fetch();   
    }

    public function examination_list_info()
    {
        //判断搜索
        $post = $this->request->param();

        $info=ExaminationLogic::select($post,'examination');

        if(isset($info['list'])){
            foreach ($info['list'] as $key => $value) {
                
                if($value['status']=="1"){
                    $info['list'][$key]['status']="正常";
                }else{
                    $info['list'][$key]['status']="禁用";
                }


                $info['list'][$key]['create_time']=date('Y-m-d H:i:s',$value['create_time']);

            }

        }else{

            return json($info);
        }

        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$info['count'];
        $arr['data']=$info['list'];
        
        return json_decode(json_encode($arr));
    }

    // 添加试卷
    public function examination_add()
    {
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if(!empty($data)){
               
               $arr['title']=$data['title'];
               $arr['desc']=$data['desc'];
               $arr['duration']=$data['duration'];
               $arr['total_score']=$data['total_score'];
               $arr['start_time']=strtotime($data['start_time']);
               $arr['end_time']=strtotime($data['end_time']);
               $arr['create_time']=time();
               
               $rows=Examination::create($arr,true);

               return Behavior::return_info($rows);
            }
        }
        
        return $this->fetch('examination_add');
     
    }

    // 编辑试卷
    public function examination_edit()
    {
        
        $id=input('id');

        $rows=Examination::get($id);

        $rows['start_time']=date('Y-m-d H:i:s',$rows['start_time']);
        $rows['end_time']=date('Y-m-d H:i:s',$rows['end_time']);

        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if(!empty($data)){
                
                $arr['id']=$data['id'];
                $arr['title']=$data['title'];
                $arr['desc']=$data['desc'];
                $arr['duration']=$data['duration'];
                $arr['total_score']=$data['total_score'];
                $arr['start_time']=strtotime($data['start_time']);
                $arr['end_time']=strtotime($data['end_time']);
                
                $rows=Examination::update($arr);

                return Behavior::return_info($rows);
            }
        }

        
        $this->assign('id',$id);
        $this->assign('rows',$rows);

        return $this->fetch('examination_edit'); 
        
    }

    
    // 试题列表
    public function questions_list()
    {
        return $this->fetch();
    }

    public function questions_list_info()
    {
        //判断搜索
        $post = $this->request->param();

        $info=QuestionsLogic::select($post,'questions');

        if(isset($info['list'])){
            foreach ($info['list'] as $key => $value) {
                
                if($value['status']=="1"){
                    $info['list'][$key]['status']="正常";
                }else{
                    $info['list'][$key]['status']="禁用";
                }

                if($value['type']=="0"){
                    $info['list'][$key]['type']="单选题";
                }elseif($value['type']=="1"){
                    $info['list'][$key]['type']="多选题";
                }elseif($value['type']=="2"){
                    $info['list'][$key]['type']="判断题";
                }elseif($value['type']=="3"){
                    $info['list'][$key]['type']="填空题";
                }elseif($value['type']=="4"){
                    $info['list'][$key]['type']="简答题";
                }


                $info['list'][$key]['create_time']=date('Y-m-d H:i:s',$value['create_time']);

            }

        }else{

            return json($info);
        }

        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$info['count'];
        $arr['data']=$info['list'];
        
        return json_decode(json_encode($arr));
    }


    public function questions_add()
    {
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if(!empty($data)){
               
                $arr['problems']=Behavior::cutstr_html($data['name']);
                $arr['type']=$data['type'];
                $arr['score']=$data['score'];
                $arr['examination_id']=$data['examination_id'];
                $arr['create_time']=time();

                //不向一个表中插入
                // if(is_array($data['answer'])){
                //     $str_answer=implode("@", $data['answer']);
                //     $arr['answer']=$str_answer;
                // }else{
                //     $arr['answer']=$data['answer'];
                // }

                //开启事务
                Db::startTrans();
                try{

                    $rows=Questions::create($arr,true);

                    $answer=array();
                    $options=array();

                    if($data['type']=="0"){//单选题

                        $answer['answer']=$data['answer'];

                        $answer['questions_id']=$rows->id;

                        $rest=QuestionsAnswer::create($answer);

                        foreach ($data['options'] as $key => $value) {
                           $options[$key]['options']=$value;

                           $options[$key]['questions_id']=$rows->id;
                        }

                        $QuestionsOptions=model('QuestionsOptions');
                        
                        $result=$QuestionsOptions->saveAll($options);
                        
                    }

                    if($data['type']=="1"){//多选题

                        foreach ($data['answer'] as $key => $value) {
                            $answer[$key]['answer']=$value;
                            $answer[$key]['questions_id']=$rows->id;
                        }
                        
                        $QuestionsAnswer=model('QuestionsAnswer');
                        
                        $rest=$QuestionsAnswer->saveAll($answer);


                        foreach ($data['options'] as $key => $value) {
                           $options[$key]['options']=$value;

                           $options[$key]['questions_id']=$rows->id;
                        }

                        $QuestionsOptions=model('QuestionsOptions');
                        
                        $result=$QuestionsOptions->saveAll($options);
                        
                   }

                    if($data['type']=="2" || $data['type']=="3" || $data['type']=="4"){//判断题、填空题、简答题

                        $answer['answer']=Behavior::cutstr_html($data['answer']);

                        $answer['questions_id']=$rows->id;

                        $rest=QuestionsAnswer::create($answer);

                        $result=true;
                       
                    }


                    if(!$rows || !$rest || !$result){
                        //  抛出异常
                        throw new \Exception("数据写入失败...");
                    }else{
                        // 提交事务
                        Db::commit();
                        return Behavior::return_info(true);
                    }
                   
                }catch(\Exception $e){
                    // 回滚事务
                    Db::rollback();
                   
                    return Behavior::return_info(false);
                   
                }
               
            }
        }

        $examination=Examination::all(['is_available'=>1,'status'=>1]);

        $this->assign('examination',$examination);
        
        return $this->fetch('questions_add');
    }


    public function questions_edit()
    {

        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if(!empty($data)){

                $arr['id']=$data['id'];
                $arr['problems']=Behavior::cutstr_html($data['name']);
                $arr['score']=$data['score'];
                $arr['examination_id']=$data['examination_id'];               

                // //开启事务
                Db::startTrans();
                try{

                    $rows=Questions::update($arr);

                    $find=QuestionsAnswer::get(['questions_id'=>$arr['id']]);

                    $answer=array();
                    $options=array();

                    if($data['type']!=="1"){
                        $answer['answer']=Behavior::cutstr_html($data['answer']);

                        $answer['questions_id']=$arr['id'];

                        $answer['id']=$find->id;

                        $rest=QuestionsAnswer::update($answer);
                    }

                    if($data['type']=="0" || $data['type']=="1"){
                        //先删除原来的题目选项，在重新新增现在的题目选项
                        $delete=QuestionsOptions::destroy(['questions_id'=>$arr['id']]);

                        if($delete===false){
                            //  抛出异常
                            throw new \Exception("数据初始化失败...");
                        }
                    }

                    if($data['type']=="0"){//单选题

                        foreach ($data['options'] as $key => $value) {
                            $options[$key]['options']=$value;

                            $options[$key]['questions_id']=$arr['id'];
                        }

                        $QuestionsOptions=model('QuestionsOptions');
                         
                        $result=$QuestionsOptions->saveAll($options);
                         
                    }

                    if($data['type']=="1"){//多选题

                        //先删除原来所有答案，在新增当前所有答案

                        $delete_answer=QuestionsAnswer::destroy(['questions_id'=>$arr['id']]);

                        if($delete_answer===false){
                            //  抛出异常
                            throw new \Exception("数据初始化失败...");
                        }

                        foreach ($data['answer'] as $key => $value) {
                            $answer[$key]['answer']=$value;
                            $answer[$key]['questions_id']=$arr['id'];
                        }
                         
                        $QuestionsAnswer=model('QuestionsAnswer');
                         
                        $rest=$QuestionsAnswer->saveAll($answer);

                        foreach ($data['options'] as $key => $value) {
                            $options[$key]['options']=$value;

                            $options[$key]['questions_id']=$arr['id'];
                        }

                        $QuestionsOptions=model('QuestionsOptions');
                         
                        $result=$QuestionsOptions->saveAll($options);
                         
                    }

                    if($data['type']=="2" || $data['type']=="3" || $data['type']=="4"){//判断题、填空题、简答题

                        $result=true;

                    }

                    if($rows===false || $find===false || $rest===false || $result===false){
                        //  抛出异常
                        throw new \Exception("数据写入失败...");
                    }else{
                        // 提交事务
                        Db::commit();
                        return Behavior::return_info(true);
                    }
                   
                }catch(\Exception $e){
                    // 回滚事务
                    Db::rollback();
                   
                    return Behavior::return_info(false);
                   
                }
            }
        }

        $examination=Examination::all(['is_available'=>1,'status'=>1]);

        $id=input('id');

        $questions=Questions::get($id);//查询当前题目信息

        //查询当前题目答案
        $questions_answer=QuestionsAnswer::all(['questions_id'=>$id]);

        //查询当前题目答案选项
        $options=QuestionsOptions::all(['questions_id'=>$id]);

        //统计当前题目选项个数
        $count_options=count($options);

        $count_options_arr=Behavior::get_char_arr($count_options);
        
        if($questions['type']=="0" || $questions['type']=="1"){
            foreach ($options as $key => $value) {
                $options[$key]['answer']='0';
                
                foreach ($questions_answer as $k => $v) {

                    if($value['options']==$v['answer']){
                        $options[$key]['answer']='1';
                    }
                }

                foreach ($count_options_arr as $kk => $vv) {
                    
                    $options[$kk]['char']=$vv;

                }
            }
            
        }

        if($questions['type']==0){

            $questions['style']="单选题";

        }elseif($questions['type']==1){

            $questions['style']="多选题";

        }elseif($questions['type']==2){

            $questions['style']="判断题";

        }elseif($questions['type']==3){

            $questions['style']="填空题";

        }elseif($questions['type']==4){

            $questions['style']="简答题";

        }

        $this->assign('examination',$examination);
        $this->assign('id',$id);
        $this->assign('questions',$questions);

        $this->assign('single_options',$options);
        $this->assign('multipart_options',$options);
        $this->assign('recognized_options',$options);

        $this->assign('questions_answer',$questions_answer);

        return $this->fetch();
    }


    //导入试题
    public function questions_import()
    {
        $single=array();
        $multipart=array();
        $recognized=array();
        $fill=array();
        $short=array();

        $length=0;
        
        $word=new PhpWord();

        $word = \PhpOffice\PhpWord\IOFactory::load(ROOT_PATH . 'public' . DS . 'static'.DS.'admin' . DS .'templet'.DS.'questions.docx');

        $wordWriter = \PhpOffice\PhpWord\IOFactory::createWriter($word, "HTML");
        
        $wordWriter->save(ROOT_PATH . 'public' . DS . 'uploads'.DS.'temp' . DS .'questions.html');
        
        $files=file_get_contents(ROOT_PATH . 'public' . DS . 'uploads'.DS.'temp' . DS .'questions.html');
        
        $files=strip_tags($files);

        $pos=strpos($files, "#@#");

        if($pos>0){

            $length=strlen("#@#");
        }

        $files=substr($files, $pos+$length);

        $files_size=strlen($files);

        
        // echo $files_size;
        echo $files;

        // echo $pos;

        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if(!empty($data)){
                $arr['examination_id']=$data['examination_id'];

                $word=$data['word'];

                //处理上传的Word文件内容

                
            }
        }


        $examination=Examination::all(['is_available'=>1,'status'=>1]);

        $this->assign('examination',$examination);

        return $this->fetch();
    }


    public function uploads_file()
    {
        return Files::uploads_file();
    }

    public static function download_question_templet()
    {

        header("Content-type:text/html;charset=utf-8"); 
        $file_path=ROOT_PATH . 'public' . DS . 'static' . DS . 'admin' . DS . 'templet' . DS . 'questions.docx';
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
        Header("Content-Disposition: attachment; filename=questions.docx");
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


    public function change_status()
    {
        if (Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){

            }
        }
    }


    //判断开始测评
    public function start_exams(){
        if (Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if($data!=""||!empty($data)){
                $id=Session::get('login.id');
                $stopIntval=Session::set('stopIntval'.$id,'1');
                if(Session::has('stopIntval'.$id)){
                    
                    $data['status']="1";
                    $data['msg']="开始计时！";
                    return json($data);
                }else{
                    $data['status']="0";
                    $data['msg']="停止计时！";
                    return json($data);
                }
                
            }
        }
    }

    //停止系统休眠计时
    public function stop_countdown(){
        if (Request::instance()->isAjax()){
            $data=Request::instance()->post();
            $id=Session::get('login.id');
            $stopIntval=Session::get('stopIntval'.$id);
            if(Session::has('stopIntval'.$id)){
                
                $data['status']="1";
                $data['msg']="停止计时！";
                return json($data);
            }else{
                $data['status']="0";
                $data['msg']="开始计时！";
                return json($data);
            }
        }
    }


}
