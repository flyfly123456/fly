<?php
namespace app\admin\model;

use \think\Model;

class ExtraConfig extends Model {
    /**
     * @note 读取锁屏配置文件内容
     */
    //配置文件内容读取
    public function index($arr = [], $file = 'queue',$admin)
    {
        if (is_array($arr)) {
            $filename = $file . EXT;
     
            $filepath = APP_PATH . 'extra/' . $filename;
            if (!file_exists($filepath)) {
                $conf = "<?php return [];";
                file_put_contents($filepath, $conf);
            }
     
            $conf = include $filepath;
            foreach ($arr as $key => $value) {
                $conf[$key] = $value;
            }
     
            $time = date('Y/m/d H:i:s');
            $str = "<?php\r\n/**\r\n * 由".config('database')['database']."建立.\r\n * 被$admin修改于：$time\r\n */\r\nreturn [\r\n";
            foreach ($conf as $key => $value) {
                $str .= "\t'$key' => '$value',";
                $str .= "\r\n";
            }
            $str .= '];';
     
            file_put_contents($filepath, $str);
            
            return true;
        } else {
            return false;
        }
    }
}