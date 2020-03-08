<?php
/**
 * 安装向导
 */
header('Content-type:text/html;charset=utf-8');
// 检测是否安装过
if (file_exists('./install.lock')) {

    exit('你已经安装过该系统，重新安装需要先删除./public/install/install.lock 文件');
}

$sqlFile="flyfly.sql";

date_default_timezone_set('PRC');
@set_time_limit(1000);

if ('5.4.0' > phpversion()){
    
    exit('您的php版本过低，不能安装本软件，请升级到5.4.0或更高版本再安装，谢谢！');
}

if(!file_exists('./data/'.$sqlFile)){

    exit('缺少必要的安装文件!');
}

// 同意协议页面
if(@!isset($_GET['install']) || @$_GET['install']=='agreement'){
    require './template/agreement.html';
}
// 检测环境页面
if(@$_GET['install']=='step1'){
    require './template/step1.html';
}
// 创建数据库页面
if(@$_GET['install']=='step2'){
    
    if($_POST){

        $dbHost = $_POST['service'];
        $dbUser = $_POST['db_username'];
        $dbPwd = $_POST['db_password'];
        $dbName = $_POST['db_name'];
        $dbPort = $_POST['port'];
        $dbPrefix = $_POST['prefix'];

        $admin_name = $_POST['name'];
        $admin_pass = base64_encode($_POST['password']);
        $admin_repass = base64_encode($_POST['repassword']);
        $admin_email = $_POST['email'];
        $admin_create = time();

        if($admin_repass!=$admin_pass){
            $data['status']='0';
            $data['msg'] = "两次密码不一致!";
            echo json_encode($data);
            exit;
        }
        
        if(!function_exists('mysqli_connect')){
            $data['status']='0';
            $data['msg'] = "请安装 mysqli 扩展!";
            echo json_encode($data);
            exit;
        }

        $link=@new mysqli("$dbHost:$dbPort",$dbUser,$dbPwd);

        // 获取错误信息
        $error=$link->connect_error;
        if(!is_null($error)){
            // 转义防止和alert中的引号冲突
            $error=addslashes($error);
            $data['status']='0';
            $data['msg'] = "数据库链接失败:$error";
            echo json_encode($data);
            exit;
            
        }
        // 设置字符集
        $link->query("SET NAMES 'utf8'");
        
        $mysql_version=$link->server_info;
        if($mysql_version < 5.4){

            $data['status']='0';
            $data['msg'] = "请将您的mysql升级到5.4以上...";
            echo json_encode($data);
            exit;
        }

        // 创建数据库并选中
        if(!$link->select_db($dbName)){
            $create_sql='CREATE DATABASE IF NOT EXISTS '.$dbName.' DEFAULT CHARACTER SET utf8;';
            $link->query($create_sql) or die('创建数据库失败');
            $link->select_db($dbName);
        }
        // 导入sql数据并创建表
        $sql_str=file_get_contents('./data/'.$sqlFile);
        $sql_array=preg_split("/;[\r\n]+/", str_replace('f_',$dbPrefix,$sql_str));
        foreach ($sql_array as $k => $v) {
            if (!empty($v)) {
                $link->query($v);
            }
        }

        //添加初始化管理员数据
        $sql="INSERT INTO `{$dbPrefix}admin` VALUES ('1', '{$admin_name}', '{$admin_pass}', '1', '', '{$admin_email}', '1', '{$admin_create}', '1', '1', '', '', '具有至高无上的管理权力！！！', '1800', '1', '0', '127.0.0.1', '0', '1', '3');";
        $link->query($sql);
        
        $link->close();
        

        $db_str=<<<DB
<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

return [
    // 数据库类型
    'type'            => 'mysql',
    // 服务器地址
    'hostname'        => '{$dbHost}',
    // 数据库名
    'database'        => '{$dbName}',
    // 用户名
    'username'        => '{$dbUser}',
    // 密码
    'password'        => '{$dbPwd}',
    // 端口
    'hostport'        => '{$dbPort}',
    // 连接dsn
    'dsn'             => '',
    // 数据库连接参数
    'params'          => [],
    // 数据库编码默认采用utf8
    'charset'         => 'utf8',
    // 数据库表前缀
    'prefix'          => '{$dbPrefix}',
    // 数据库调试模式
    'debug'           => true,
    // 数据库部署方式:0 集中式(单一服务器),1 分布式(主从服务器)
    'deploy'          => 0,
    // 数据库读写是否分离 主从式有效
    'rw_separate'     => false,
    // 读写分离后 主服务器数量
    'master_num'      => 1,
    // 指定从服务器序号
    'slave_no'        => '',
    // 自动读取主库数据
    'read_master'     => false,
    // 是否严格检查字段是否存在
    'fields_strict'   => true,
    // 数据集返回类型
    'resultset_type'  => 'array',
    // 自动写入时间戳字段
    'auto_timestamp'  => false,
    // 时间字段取出后的默认时间格式
    'datetime_format' => 'Y-m-d H:i:s',
    // 是否需要进行SQL性能分析
    'sql_explain'     => false,
];
DB;
        @chmod('../../app/database.php',0777); //数据库配置文件的地址
        // 创建数据库链接配置文件
        file_put_contents('../../app/database.php', $db_str);
        // @touch('./install.lock');
        // $data['status']=1;
        // $data['msg']='安装成功...';
        // echo json_encode(1);
        exit(json_encode(1));

    }
    
    require './template/step2.html';

}
// 安装成功页面
if(@$_GET['install']=='step3'){
    if($_POST){
        @touch('./install.lock');
    }
    require './template/step3.html';

}



