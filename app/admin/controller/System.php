<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Db;
use \think\Request;
use \think\Session;
use \think\Config;
use app\admin\model\Pdf;

use app\admin\behavior\Behavior;
use app\admin\behavior\Files;

class System extends Base
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

    //系统管理基础设置模板显示
    public function base_info()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                
                $arr['web_title']=$data['title'];
                $arr['web_name']=$data['name'];
                $arr['web_version']=$data['version'];
                $arr['web_desc']=$data['desc'];
                $arr['web_record']=$data['record'];

                //判断是前台设置还是后台设置
                if(isset($data['img_url'])){
                    $arr['type']='1';

                    $arr['logo']=$data['img_url'];

                }else{

                    $arr['type']='0';

                }
                
                $rest=Db::name('web_info')->where('type',$arr['type'])->find();
                
                if($rest){

                    $rows=Db::name('web_info')->where('id='.$rest['id'])->update($arr);
                }else{
                    
                    $rows=Db::name('web_info')->insert($arr);
                }

                if($arr['type']=='1' && $arr['logo']!=$rest['logo']){

                    Files::thumb_image($data['img_url'],'logo',$width=200,$height=90);

                    $logo_img=ROOT_PATH . 'public' . DS . 'uploads'.DS.'logo'.DS.$rest['logo'];
                    
                    if(file_exists($logo_img)){
                        unlink(ROOT_PATH . 'public' . DS . 'uploads'.DS.'logo'.DS.$rest['logo']);
                    }
                }


                
                return Behavior::return_info($rows);
            }
        }else{
            
            $home=Db::name('web_info')->where('type','1')->limit('0,1')->find();
            $admin=Db::name('web_info')->where('type','0')->limit('0,1')->find();

            $rest=Db::name('smtp_config')->where('id','1')->limit('0,1')->find();
            
            $this->assign('rest',$rest);
            $this->assign('home',$home);
            $this->assign('admin',$admin);

            return $this->fetch('base_info');
        }
        
    }


    //配置邮件基础信息
    public function set_email()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){

                $arr['smtp_name']=$data['email_name'];
                $arr['smtp_port']=$data['email_port'];
                $arr['author_code']=$data['author_code'];
                $arr['send_email_address']=$data['send_email_address'];
                $arr['send_nickname']=$data['send_email_nickname'];
                $arr['email_pass']=$data['email_pass'];
                
                $rest=Db::name('smtp_config')->where('id=1')->find();

                if($rest){
                    $rows=Db::name('smtp_config')->where('id=1')->update($arr);
                }else{
                    $rows=Db::name('smtp_config')->insert($arr);
                }
                
                
                return Behavior::return_info($rows);
            }
        }
    }

    //数据库备份
    public function backups()
    {
        $dbtables = DB::query('SHOW TABLE STATUS');
        
        $arr=[];
        foreach ($dbtables as $key => $value) {
            # code...
            $dbtables[$key]['Data_length']=round(($value['Data_length']/1024),2)."KB";
            array_push($arr, round(($value['Data_length']/1024),2));
        }
        
        $dbspace=array_sum($arr)."KB";
        $count_datables=count($dbtables);
        $this->assign('dbspace',$dbspace);
        $this->assign('count_datables',$count_datables);
        $this->assign('dbtables',$dbtables);
        return $this->fetch('backups');
        

    }

    //数据库导出
    public function export_database()
    {
        
        header("Content-type:text/html;charset=utf-8");
        $path = ROOT_PATH.'data/';
        $database = config('database')['database'];
        // echo "运行中，请耐心等待...<br/>";
        $mysql_version=Db::query('select VERSION()');
        $info = "-- ----------------------------\r\n";
        $info .= "-- 日期：".date("Y-m-d H:i:s",time())."\r\n";
        $info .= "-- MySQL - ".$mysql_version[0]['VERSION()']."-MariaDB : Database - ".$database."\r\n";
        $info .= "-- ----------------------------\r\n\r\n";
        $info .= "CREATE DATAbase IF NOT EXISTS `".$database."` DEFAULT CHARACTER SET utf8 ;\r\n\r\n";
        $info .= "USE `".$database."`;\r\n\r\n";

        // 检查目录是否存在
        if(is_dir($path)){
            // 检查目录是否可写
            if(is_writable($path)){
                //echo '目录可写';exit;
            }else{
                // echo $path.'目录不可写';exit;
                chmod($path,0777);
            }
        }else{
            //echo '目录不存在';exit;
            // 新建目录
            mkdir($path, 0777, true);
            //chmod($path,0777);
        }

        // 检查文件是否存在
        $file_name = $path.$database.'-'.date("YmdHis",time()).'.sql';
        if(file_exists($file_name)){
            echo "数据备份文件已存在！";
            // $file_name.date("YmdHis")=$file_name;
            ob_end_clean(); 
            header("Cache-Control: must-revalidate, post-check=0, pre-check=0"); 
            header('Content-Description: File Transfer'); 
            header('Content-Type: application/octet-stream'); 
            header('Content-Length: ' . filesize($file_name)); 
            header('Content-Disposition: attachment; filename=' . basename($file_name)); 
            readfile($file_name);
            exit;
        }
        file_put_contents($file_name,$info,FILE_APPEND);

        if(Request::instance()->isAjax()){
            $result=Request::instance()->post();
            if(!empty($result)){

                $this->put_table_file($result,$database,$file_name);
                return json($result);
            }
        }else{
            //查询数据库的所有表
            $result = Db::query('show tables');
            $this->put_table_file($result,$database,$file_name);
        }
        if($file_name){
            
            ob_end_clean(); 
            header("Cache-Control: must-revalidate, post-check=0, pre-check=0"); 
            header('Content-Description: File Transfer'); 
            header('Content-Type: application/octet-stream'); 
            header('Content-Length: ' . filesize($file_name)); 
            header('Content-Disposition: attachment; filename=' . basename($file_name)); 
            readfile($file_name);
        }
    }

    //Sql文件中写入table数据
    public function put_table_file($result,$database,$file_name)
    {
        foreach ($result as $k=>$v) {
            //查询表结构
            if(isset($v['Tables_in_'.$database])){
                $val = $v['Tables_in_'.$database];
            }else{
                $val = $v;
            }
            $sql_table = "show create table ".$val;
            $res = Db::query($sql_table);
            //print_r($res);exit;
            $info_table = "-- ----------------------------\r\n";
            $info_table .= "-- Table structure for `".$val."`\r\n";
            $info_table .= "-- ----------------------------\r\n\r\n";
            $info_table .= "DROP TABLE IF EXISTS `".$val."`;\r\n\r\n";
            $info_table .= $res[0]['Create Table'].";\r\n\r\n";
            //查询表数据
            $info_table .= "-- ----------------------------\r\n";
            $info_table .= "-- Data for the table `".$val."`\r\n";
            $info_table .= "-- ----------------------------\r\n\r\n";
            file_put_contents($file_name,$info_table,FILE_APPEND);
            $sql_data = "select * from ".$val;
            $data = Db::query($sql_data);
            //print_r($data);exit;
            $count= count($data);
            //print_r($count);exit;
            if($count<1) continue;
            foreach ($data as $key => $value){
                $sqlStr = "INSERT INTO `".$val."` VALUES (";
                foreach($value as $v_d){
                    $v_d = str_replace("'","\'",$v_d);
                    $sqlStr .= "'".$v_d."', ";
                }
                //需要特别注意对数据的单引号进行转义处理
                //去掉最后一个逗号和空格
                $sqlStr = substr($sqlStr,0,strlen($sqlStr)-2);
                $sqlStr .= ");\r\n";
                file_put_contents($file_name,$sqlStr,FILE_APPEND);
            }
            $info = "\r\n";
            file_put_contents($file_name,$info,FILE_APPEND);
        }

    }

    //数据库导入
    public function database_import(){

        if(Request::instance()->isAjax()){
            $result=Request::instance()->file('file');

            if(!empty($result)){
                
                $temp = explode(".", $_FILES["file"]["name"]);

                $extension = end($temp);
                // 判断文件是否合法
                if($extension!="sql"){
                    //文件不合法
                    $data['status']=0;
                    $data['msg']="文件类型不合法...";
                    return json($data);
                }
                $path = ROOT_PATH.'data/';
                $sqlFile=$path.$_FILES["file"]["name"];
                
                $rest="";
                $get_sql_array=$this->get_sql_array($sqlFile, $prefix = '');
                
                if(empty($get_sql_array)){
                    $data['status']=0;
                    $data['msg']=$sqlFile."文件内容读取失败！";
                    return json($data);
                }

                $dbhostname=Config::get('database.hostname');
                $dbdatabase=Config::get('database.database');
                $dbusername=Config::get('database.username');
                $dbpassword=Config::get('database.password');
                $conn=mysqli_connect($dbhostname,$dbusername,$dbpassword,$dbdatabase);
                foreach($get_sql_array as $value){

                    $rest=$value.";";

                    mysqli_query($conn,$rest);
                }
                if(mysqli_error($conn)==0){
                    $data['status']=1;
                    $data['msg']="数据库恢复成功！";
                    return json($data);
                }else{
                    $data['status']=0;
                    $data['msg']="数据库数据写入失败！";
                    return json($data);
                }

            }else{
                $data['status']=0;
                $data['msg']="文件不能为空...";
                return json($data);
            }

        }else{

            $dir=ROOT_PATH.'data/';
            $resource=opendir($dir);
            $info=array();
            $i=0;
            while ($file = readdir($resource)) {
                if ($file != "." && $file != "..") {

                    $recover_files = $dir.$file;
                    if (is_file($recover_files)) {
                        // echo $recover_files;
                        $arr=pathinfo(basename($recover_files));
                        if($arr['extension']=="sql"){
                            
                            // echo date("Y-m-d H:i:s",filemtime($recover_files));
                            $info[$i]['id']=$i;
                            $info[$i]['name']=basename($recover_files);
                            $info[$i]['size']=filesize($recover_files);
                            $info[$i]['size']=sprintf("%.2f",filesize($recover_files)/1024);
                            if($info[$i]['size']<1024){
                                $info[$i]['size'].="KB";
                            }else{
                                $info[$i]['size']=$info[$i]['size']/1024;
                                $info[$i]['size'].="MB";
                            }
                            $info[$i]['ctime']=date("Y-m-d H:i:s",filectime($recover_files));
                            $info[$i]['href']=urlencode($recover_files);
                            
                        }
                        
                    } else {
                        continue;
                    }
                }
                $i++;
            }
            arsort($info);

            $this->assign('info',$info);
            return $this->fetch('database_import');
        }
        
    }


    /**
     * 读取sql文件为数组
     * @param $sqlFile sql 文件路径
     * @param string $prefix 添加表前缀
     * @return array|bool
     */
    public function get_sql_array($sqlFile, $prefix = '')
    {
        if(!file_exists($sqlFile)){
            return false;
        }
        $str = file_get_contents($sqlFile);
        $str = preg_replace('/(--.*)|(\/\*(.|\s)*?\*\/)|(\n)/', '', $str);
        if(!empty($prefix)){
            $str = preg_replace_callback("/(TABLE|INSERT\\s+?INTO|UPDATE|DELETE\\s+?FROM|SELECT.+?FROM|LEFT\\s+JOIN|JOIN|LEFT)([\\s]|[\\s`])+?(\\w+)([\\s`]|[\\s(])+?/is", function($matches) use ($prefix){
                    var_dump($matches);
                    return str_replace($matches[3], $prefix . $matches[3], $matches[0]);},$str);
        }
        $list = explode(';', trim($str));
        foreach($list as $key => $val){
            if( empty($val) ){
                unset($list[$key]);
            }else{

                $list[$key].=';';
            }
        }
        return array_values($list);
    }


    //下载sql文件方法
    public function downdload_files($file_path="")
    {
        
        header("Content-type:text/html;charset=utf-8"); 
        $file_path=urldecode(input('files'));
        //用以解决中文不能显示出来的问题 
        // $file_name=iconv("utf-8","gb2312",$file_name);
        //$file_sub_path=$_SERVER['DOCUMENT_ROOT']."marcofly/phpstudy/down/down/"; 
        //$file_path=$file_sub_path.$file_name; 
        //首先要判断给定的文件存在与否 
        if(!file_exists($file_path)){
            echo "没有该文件..."; 
            return ;
        }
        $fp=fopen($file_path,"r");
        $file_size=filesize($file_path);
        $database = config('database')['database'];
        $file_name=$database."-".date("YmdHis",time()).".sql";
        //下载文件需要用到的头
        Header("Content-type: application/octet-stream");
        Header("Accept-Ranges: bytes");
        Header("Accept-Length:".$file_size);
        Header("Content-Disposition: attachment; filename=".$file_name);
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

    //删除Sql文件
    public function file_delete(){
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                $file_path=urldecode($data['href']);
                $rest=unlink($file_path);
                if($rest){
                    $data['status']="1";
                    $data['msg']="删除成功";
                    return json($data); 
                }else{
                    $data['status']="0";
                    $data['msg']="删除失败";
                    return json($data);
                }
                
            }
        }

    }


    /**
     * 还原备份文件
     * @param $backup
     */
    public function sqlReback($backup=""){
        header("content-type:text/html;charset=utf-8");
        //1.获取数据库信息
        $info = Db::getConfig();
        
        $dbname = $info['database'];
        $file = ROOT_PATH."data/".$backup;    //还原的SQL文件
        if (!file_exists($file)) {
            throw new \Exception("文件不存在");
        }
        $sqldata = file_get_contents($file);    //读取数据文件
        $sqlFormat = self::sqlSplit($sqldata); //获取SQl语句数组
        foreach ($sqlFormat as $key=>$value){
            if($value){

                Db::execute($value);
            }

        }
        return true;
    }
    
    private static function sqlSplit($sql){
    
        $sql = preg_replace("/TYPE=(InnoDB|MyISAM|MEMORY)( DEFAULT CHARSET=[^; ]+)?/", "ENGINE=\\1 DEFAULT CHARSET=utf8", $sql);
        $sql = str_replace("\r", "\n", $sql);
        $ret = array();
        $num = 0;
        $queriesarray = explode(";\n", trim($sql));
        unset($sql);
        foreach ($queriesarray as $query) {
            $ret[$num] = '';
            $queries = explode("\n", trim($query));
            $queries = array_filter($queries);
            foreach ($queries as $query) {
                $str1 = substr($query, 0, 1);
                if ($str1 != '#' && $str1 != '-')
                    $ret[$num] .= $query;
            }
            $num++;
        }
        return $ret;
    }

    //更改管理员密码
    public function update_pass(){
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                if($data['pass']==$data['repass']){
                    $id=Session::get('login.id');
                    $rest=Db::name('admin')->where('id',$id)->find();
                    if(base64_decode($rest['password'])!=$data['oldpass']){
                        $data['status']='0';
                        $data['msg']='原始密码有误！';
                        return json($data);
                    }else{
                        $arr['password']=base64_encode($data['pass']);
                        $rows=Db::name('admin')->where('id',$id)->update($arr);
                        if($rows){
                            Session::clear();
                            $data['status']='1';
                            $data['msg']='密码修改成功，请重新登入！';
                            return json($data);
                        }else{
                            $data['status']='0';
                            $data['msg']='修改失败！';
                            return json($data);
                        }
                    }
                }else{
                    $data['status']='0';
                    $data['msg']='两次密码不一致！';
                    return json($data);
                }
                
            }else{
                $data['status']='0';
                $data['msg']='数据不能为空！';
                return json($data);
            }
        }else{
            $username=Session::get('login.name');
            $this->assign('username',$username);
            return view('update_pass');
        }
        
    }


    //设置锁屏
    public function clock_pass()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            
            $login_info=Session::get('login');
            $password=base64_decode($login_info['password']);
            $prefix=$login_info['name'];
            //重置锁屏密码
            if(count($data)=="1"){
                
                if($data['pass']==$password){
                    $arr = [
                        $prefix.'_clock_pass' => '123456'
                    ];

                    $rows=parent::modify_config($arr, $file = 'clock',$login_info['name']);
                    if($rows){

                        $clock_info=Session::set('clock_pass',$arr[$prefix.'_clock_pass']);
                        $clock_info_get=Session::get('clock_pass');//String类型

                        if($clock_info_get!=""){

                            $data['status']="1";
                            $data['msg']="锁屏密码重置成功";
                            return json($data);
                        }else{
                            $data['status']="0";
                            $data['msg']="锁屏密码重置失败";
                            return json($data); 
                        }
                        
                    }else{
                        $data['status']="0";
                        $data['msg']="锁屏密码重置失败";
                        return json($data);
                    }
                }else{
                    $data['status']="0";
                    $data['msg']="请输入正确的管理员密码";
                    return json($data);
                }
            }else{
                $clock_arr=config('clock');
                $clock_pass=$clock_arr[$prefix.'_clock_pass'];
                if($clock_pass!=$data['oldpass']){
                    $data['status']="0";
                    $data['msg']="原始密码错误";
                    return json($data);
                }
                if($data['pass']!=$data['repass']){
                    $data['status']="0";
                    $data['msg']="两次密码不一致";
                    return json($data);
                }
                $arr = [
                    $prefix.'_clock_pass' => $data['pass']
                ];
                $rows=parent::modify_config($arr, $file = 'clock',$login_info['name']);
                if($rows){
                    $clock_info=Session::set('clock_pass',$arr[$prefix.'_clock_pass']);
                    $clock_info_get=Session::get('clock_pass');
                    if($clock_info_get){
                        $data['status']="1";
                        $data['msg']="锁屏密码修改成功";
                        return json($data);
                    }else{
                        $data['status']="0";
                        $data['msg']="锁屏密码修改失败";
                        return json($data);
                    }
                    
                }else{
                    $data['status']="0";
                    $data['msg']="锁屏密码修改失败";
                    return json($data);
                }
                
            }

        }
        return view('clock_pass');
    }

    

    //添加系统公告
    public function add_system_message(){
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                $admin_id=Session::get('login.id');
                $arr['title']=$data['title'];
                $arr['content']=strip_tags(htmlspecialchars($data['content']));
                $arr['admin_id']=$admin_id;
                $arr['create_time']=time();
                $arr['status']="1";
                $arr['read_ids']=$admin_id;

                $rows=Db::name('system_message')->insert($arr);
                
                if($rows){
                    $memcache=new \Memcache();
                    $memcache->connect('127.0.0.1',11211) or die('Could not connect');
                    
                    $memcache->set('show',null);

                    $data['status']="1";
                    $data['msg']="公告添加成功！";
                    return json($data);
                }else{
                    $data['status']="0";
                    $data['msg']="公告添加失败！";
                    return json($data);
                }
                
            }else{
                $data['status']="0";
                $data['msg']="数据获取失败，请重试！";
                return json($data);
            }

        }else{

            return view('add_system_message');
        }
        
    }


    //系统公告列表
    public function system_message()
    {
        $index=input('page');
        if(!isset($index)){
            $index="1";
        }
        $admin_id=Session::get('login.id');
        $page=input('page');
        $count=Db::name('system_message')->count();
        $rows=Db::name('system_message')->order('id desc')->paginate(5,$count,[
                        'type'=>'Bootstrap'
                    ])->each(function($item, $key){
                        $item['create_time'] = date('Y-m-d',$item['create_time']);
                        return $item;});

        $page = $rows->render();
        $rows=$rows->toArray();
        $memcache=new \Memcache();
        $memcache->connect('127.0.0.1',11211) or die('Could not connect');
        $array=array();
        $arr=array();
        $rest=array();
        $read_ids=array();
        foreach ($rows['data'] as $key => $value) {
            # code...
            $read_number=explode(',', $value['read_ids']);
            $count_read_number=(count($read_number)-1);
            if($count_read_number=="0"){
                $count_read_number="1";
            }
            array_push($arr,$count_read_number);
            array_push($array, $read_number);
            $value['read_number']=$arr[$key];
            array_push($rest, $value);
            // $memcache->flush();
            $memcache=new \Memcache();
            $memcache->connect('127.0.0.1',11211) or die('Could not connect');
            //获取每次点击单条公告缓存的值
            array_push($read_ids, $memcache->get($admin_id.$value['id']));

        }
        
       
        $this->assign('read_ids',$read_ids);
        $this->assign('rows',$rest);
        $this->assign('admin_id',$admin_id);
        $this->assign('index',$index);
        $this->assign('page',$page);
        return view('system_message');
    }

    //系统公告详情页面
    public function message_detial()
    {
        $index=input('page');
        $id=input('id');
        
        $admin_id=Session::get('login.id');
        
        $rows=Db::name('system_message')->where('id',$id)->find();

        $memcache=new \Memcache();
        $memcache->connect('127.0.0.1',11211) or die('Could not connect');
        // $memcache->flush();
        // exit;
        $memcache->set($admin_id.$rows['id'],$admin_id.$rows['id']);
        $read_ids=$memcache->get($admin_id.$rows['id']);
        
        $view_id=$admin_id.",";
        
        if($rows['read_ids']==null){
            $rows['read_ids']=$view_id;
            $view_ids=$rows['read_ids'];
        }else{
            $arr_ids=explode(',', $rows['read_ids']);

            if(!in_array($admin_id, $arr_ids)){
                $view_ids=$rows['read_ids'].$view_id;
                
            }else{
                $view_ids=$rows['read_ids'];
            }
            
        }

        //阅读数
        $read_number=count(explode(',', $view_ids))-1;
        //更新阅读ID
        $rest=Db::name('system_message')->where('id',$id)->update(['read_ids'=>$view_ids]);

        $rows['create_time']=date("Y-m-d H:i:s",$rows['create_time']);
        $rows['content']= htmlspecialchars_decode($rows['content']);
        $this->assign('index',$index);
        $this->assign('rows',$rows);
        $this->assign('read_number',$read_number);
        return view('message_detial');
    }

    //导出系统公告pdf文件,需要关闭调试模式才能正常显示
    public function export_pdf(){
        $type=input('download');
        $id=input('id');
        if(!isset($type)){
            $type="I";
        }else{
            $type="D";
        }
        
        $rows=Db::name('system_message')->where('id',$id)->find();
        $content=$rows['content']= htmlspecialchars_decode($rows['content']);
        $title=$rows['title'];
        $Pdf=new Pdf();
        $Pdf->pdf($content,$type,$title);
    }

    //系统休眠时间
    public function sleep_timeout()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                $id=Session::get('login.id');
                $array['sleep_timeout']=$data['sleep_timeout']*60;
                $rows=Db::name('admin')->where('id',$id)->update($array);
                if($rows){
                    Session::set('login.sleep_timeout',$array['sleep_timeout']);
                    $data['status']="1";
                    $data['msg']="设置成功！";
                    return json($data);
                }else{
                    $data['status']="0";
                    $data['msg']="数据异常，请稍后重试！";
                    return json($data);
                }
            }
        }
        return $this->fetch('sleep_timeout');
    }
    
    //系统日志记录
    public function system_log()
    {
        $logarr=scandir(LOG_PATH.date('Ym',time()));
        $logfile=file_get_contents(LOG_PATH.date('Ym',time()).'/'.$logarr[2]);
        echo "<pre>";
            print_r($logfile);
        echo "</pre>";
        exit;


    }

    //数据可视化
    public function echarts()
    {
        return view('echart/echarts1');
    }


}
