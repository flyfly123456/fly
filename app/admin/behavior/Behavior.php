<?php
namespace app\admin\behavior;
use \think\Controller;
use \think\Request;
use \think\Db;

class Behavior extends Controller
{
	public static function delete($id,$table,$delete=false)
    {
        if($delete==true){

            $rows=Db::name($table)->where('id',$id)->delete();
        }else{
            $rows=Db::name($table)->where('id',$id)->update(['is_available'=>0]);
        }
        
        return self::return_info($rows);
    }

    public static function delete_all($ids,$table,$delete=false)
    {
        $i=0;
        // 启动事务
        Db::startTrans();
        try{

            $ids = json_decode($ids['id'],true);

            foreach ($ids as $key => $value) {
                
                if($delete==true){

                    $rows=Db::name($table)->where('id',$value['id'])->delete();

                }else{

                    $rows=Db::name($table)->where('id',$value['id'])->update(['is_available'=>0]);
                }

                if(!$rows){
                    //  抛出异常
                    throw new \Exception("写入数据库失败...");

                }else{

                    $i++;
                }
            }

            if($i==count($ids)){
                // 提交事务
                Db::commit();
                $data['msg']="成功删除".$i."条数据！";
                $data['status']='1';
                return json($data);
            }

        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            $data['msg']=$e;
            $data['status']='0';
            return json($data);
        }
        
    }

    public static function recover($table,$id)
    {
        $rows=Db::name($table)->where('id',$id)->setField('is_available',1);
        
        return self::return_info($rows);
    }

    public static function toggle_status($table,$id)
    {
        $rest=Db::name($table)->where('id',$id)->find();
        
        if($rest['status']==1){
            $arr['status']=0;
        }else{
            $arr['status']=1;
        }

        $rows=Db::name($table)->where('id',$id)->update($arr);
        
        return self::return_info($rows);
    }

    public static function select($post,$table)
    {
        $page=input("get.page")?input("get.page"):1;
        $page=intval($page);
        $limit=input("get.limit")?input("get.limit"):1;
        $limit=intval($limit);
        $limit=input('limit');

        $where=[];
        $time=[];

        $where['is_available']=1;

        if(!empty($post['start']) && empty($post['end'])){//只有开始日期
            
            $post['start']=strtotime($post['start']);
            $time['create_time']=['>',$post['start']];

            
        }elseif(empty($post['start']) && !empty($post['end'])){//只有结束日期
            
            $post['end']=strtotime($post['end']);
            $time['create_time']=['<',$post['end']];

            

        }elseif(empty($post['start']) && empty($post['end'])){//无开始和结束日期
            // $data['status']=0;
            // $data['msg']='暂无数据...';
            // return $data;
        }elseif(!empty($post['start']) && !empty($post['end'])){//有开始和结束日期
            $post['start']=strtotime($post['start']);
            $post['end']=strtotime($post['end']);

            $time['create_time']=['between',"$post[start],$post[end]"];
        }

        if(isset($post['keywords'])&& isset($post['modules'])){

            if(!empty($post['keywords']) && !empty($post['modules'])){

                if($post['modules']=="status"){
                    if($post['keywords']=="已驳回"){
                        $post['keywords']=3;
                    }elseif($post['keywords']=="已审核"){
                        $post['keywords']=2;
                    }elseif($post['keywords']=="已取回"){
                        $post['keywords']=1;
                    }elseif($post['keywords']=="未送审"){
                        $post['keywords']=0;
                    }else{
                        $data['status']=0;
                        $data['msg']="暂无数据！";
                        return $data;
                    }
                
                }

                if($post['modules']=="cate"){
                    $cate=Db::name('article_cate')->where(['name'=>$post['keywords']])->find();
                    $post['keywords']=$cate['id'];

                    $post['modules']="cate_id";
                
                }

                $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];

            }
            

        }

        $count=Db::name($table)->where($where)->count();

        $list=Db::name($table)->page($page,$limit)->where($where)->where($time)->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据...";
            return $data;
        }else{
            
            return ['list'=>$list,'count'=>$count];
        }
    }

    public static function find($id,$table)
    {
        $rows=Db::name($table)->where('id='.$id)->find();

        return self::return_info($rows);

    }


    public static function return_info($info)
    {
        if($info!==false){
            $data['msg']="操作成功";
            $data['status']='1';
            return json($data);
        }else{
           $data['msg']="操作失败！";
           $data['status']='0';
           return json($data); 
        }
    }

    public static function directory($dir)
    {
        return is_dir($dir) or self::directory(dirname($dir)) and mkdir($dir,0777);
    }

    //去除空格和html标签
    public static function cutstr_html($string)
    {  

        $string = strip_tags($string);  
        $string = trim($string);  
        // $string = preg_replace("/s/","",$string);  
        // $string = str_replace("rn", '', $string);
        // $string = str_replace("n", '', $string);

        return $string;  

    }

    public static function get_char_arr($str)
    {
        $arr=array();

        if(!is_numeric($str)){
            return false;
        }

        if($str<=676){
            for($i = 'A',$j=1;'Z' >= $i,$j<=676; $i++,$j++){

                array_push($arr, $i);
                
                if($str==$j){
                    
                    return $arr;
                    break;
                    die();
                }
            }
        }

        return false;
        
    }

    public static function get_char($size=676)
    {
        if($size+1<=676){
            for($i = 'A',$j=1;'Z' >= $i,$j<=676; $i++,$j++){
                
                if($size+1==$j){
                    
                    return $i;
                    break;
                    die();
                }
            }
        }

        return false;
    }

    /*
    *获取系统类别
    *@params $id:角色id
    */
    public static function get_system_sort($id=""){
        
        $sort=Db::name('system_sort')->where('is_available',1)->select();
        
        if($id==""){

            if(!empty($sort)){
                return $sort;
            }else{
                return '数据获取失败！';
            }
        }else{

            $rows=Db::name('role_group')->where(['id'=>$id,'is_available'=>1])->find();
            $system_sort_id=explode("@", $rows['system_sort_id']);
            
            foreach ($sort as $key => $value) {
                # code...
                foreach ($system_sort_id as $k => $v) {
                    # code...
                    if($value['id']==$v){
                        $sort[$key]['select']=1;
                    }
                }
            }
            foreach ($sort as $key => $value) {
                # code...
                if(!isset($value['select'])){
                    $sort[$key]['select']=0;
                }
            }
            return $sort;
        }
    }

    /**
     * @note 获取控制器和action存放数据库
     */
    public function index(){
        $modules = array('admin');  //模块名称
        $i = 0;
        foreach ($modules as $module) {
            $all_controller = self::get_controller($module);
            
            foreach ($all_controller as $controller) {
                $controller_name = $controller;
                $all_action = self::get_action($module, $controller_name);
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
    public static function get_controller($module){
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
    public static function get_action($module, $controller){

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
