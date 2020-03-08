<?php
namespace app\admin\model;

use \think\Model;

class Author extends Model {
    /**
     * @note 获取控制器和action存放数据库
     */
    public function index(){
        $modules = array('admin');  //模块名称
        $i = 0;
        foreach ($modules as $module) {
            $all_controller = $this->getController($module);
            
            foreach ($all_controller as $controller) {
                $controller_name = $controller;
                $all_action = $this->getAction($module, $controller_name);
                $data[$i]=array(
                    'controller' => $controller,
                    'action'=>$all_action
                    );
                $i++;
                // foreach ($all_action as $action) {
                //     $data[$i] = array(
                //         'controller' => $controller,
                //         'action' => $action,
                //         'desc'=>$this->get_cc_desc($module,$controller,$action)
                //     );
                //     $i++;
                // }
            }
        }
        return $data;
        
    }

    /**
     * @note 获取控制器
     * @param $module
     * @return array|null
     */
    public function getController($module){
        if(empty($module)) return null;
        $module_path = APP_PATH . '/' . $module . '/controller/';  //控制器路径
        if(!is_dir($module_path)) return null;
        $module_path .= '/*.php';
        $ary_files = glob($module_path);
        
        foreach ($ary_files as $file) {
            if (is_dir($file)) {
                continue;
            }else {
                $files[] = basename($file, config('url_controller_layer').'.php');
            }
        }
        //排除部分控制器
        $inherents_controller = array('Base.php','Worker.php');//如有排除控制器添加此数组
        foreach ($files as $file){
            $file = trim($file);
            if(!in_array($file, $inherents_controller)){
                if (strlen($file)>0)   $controller[] = $file;
            }
        }

        return $controller;
    }

    /**
     * @note 获取方法
     *
     * @param $module
     * @param $controller
     *
     * @return array|null
     */
    public function getAction($module, $controller){

        if(empty($controller)) return null;

        $content = file_get_contents(APP_PATH . '/'.$module.'/controller/'.$controller);

        preg_match_all("/.*?public.*?function(.*?)\(.*?\)/i", $content, $matches);
        $functions = $matches[1];

        //排除部分方法
        $inherents_functions = array('_initialize','_empty');//如有排除方法添加此数组
        foreach ($functions as $func){
            $func = trim($func);
            if(!in_array($func, $inherents_functions)){
                if (strlen($func)>0)   $customer_functions[] = $func;
            }
        }
        return $customer_functions;
    }

    /**
     * @note 获取函数的注释
     *
     * @param $module Admin
     * @param $controller Auth
     * @param $action index
     *
     * @return string 注释
     *
     */
    protected function get_cc_desc($module,$controller,$action){
        $desc = "app\\".$module."\\controller\\".$controller;
        $arr=explode(".", $desc);
        $desc=$arr[0];
        $func  = new \ReflectionMethod(new $desc(),$action);
        $tmp   = $func->getDocComment();
        
        $flag  = preg_match_all('/@note(.*?)\n/',$tmp,$tmp);
        
        // $tmp   = $tmp !='' ? $tmp:'无';
        if(!empty($tmp[1])){
            $tmp   = trim($tmp[1]);
        }
        
        return $tmp;
    }
}