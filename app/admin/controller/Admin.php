<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Session;
use \think\Captcha;
use \think\Cookie;
use \think\Image;

use app\admin\logic\AdminLogic;
use app\admin\logic\ResourceLogic;
use app\admin\logic\LogLogic;
use app\admin\logic\RoleGroupLogic;
use app\admin\logic\ExaminationLogic;

use app\admin\behavior\Behavior;
use app\admin\behavior\Files;

class Admin extends Base
{

    public function _initialize()//_initialize与__construct有区别
    {
        $request= Request::instance();
        $module_name=$request->module();
        $action=$request->action();
        $controller=$request->controller();
        $action=$module_name."/".$controller."/".$action;
        parent::admin_priv($action);
        parent::check_admin_log($action);
        
    }

    //管理员列表显示
    public function admin_list()
    {
        return $this->fetch('admin_list');
    }

    //查看管理员信息
    public function admin_list_info()
    {
        //判断搜索
        $post = $this->request->param();

        $info=AdminLogic::select($post,'admin');
        
        if(isset($info['list'])){

            foreach ($info['list'] as $key => $value) { 

                //查询所在部门
                $department=Db::name('department')->where(['id'=>$value['department_id']])->find();
                $info['list'][$key]['department_id']=$department['name'];

                //获取所在角色
                $rest=Db::name('role_group')->where(['id'=>$value['role_group_id']])->find();
                $info['list'][$key]['role']=$rest['role_name'];

                $info['list'][$key]['create_time']=date('Y-m-d H:i:s',$value['create_time']);
                if(!empty($value['last_login_time'])){
                    $info['list'][$key]['last_login_time']=date('Y-m-d H:i:s',$value['last_login_time']);
                }else{
                   $info['list'][$key]['last_login_time']="暂未登入..."; 
                }

                if(empty($value['last_login_ip'])){
                    $info['list'][$key]['last_login_ip']="未知..."; 
                }
                
                if($value['sex']==0){
                    $info['list'][$key]['sex']='女';
                }else{
                    $info['list'][$key]['sex']='男';
                }

                if($value['status']=="0"){
                    $info['list'][$key]['status']="未启用";
                }else{
                    $info['list'][$key]['status']="已启用";
                }

                if($value['multi_device']==0){
                    $info['list'][$key]['multi_device']='关闭';
                }else{
                    $info['list'][$key]['multi_device']='开启';
                }

            }
        }

        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$info['count'];
        $arr['data']=$info['list'];
        
        return json_decode(json_encode($arr));
    }


    //权限资源模板显示
    public function role_resource_list()
    {
    	return $this->fetch('role_resource_list');
    }

    //权限资源信息显示
    public function role_resource_list_info()
    {
        //判断搜索
        $post = $this->request->param();

        $info=ResourceLogic::select($post,'role_author');
        
        if(isset($info['list'])){

            foreach ($info['list'] as $key => $value) { 
                if($value['is_available']=="0"){

                    $info['list'][$key]['is_available']="未启用";
                }else{
                    $info['list'][$key]['is_available']="已启用";
                }
            }

        }else{
            return $info;
        }
        
        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$info['count'];
        $arr['data']=$info['list'];
        
        return json_decode(json_encode($arr));

    }

    //添加权限资源
    public function role_resource_add()
    {
        $post = $this->request->param();

        if(isset($post['name'])){
            $post['name']=$post['name'].".php";
            $action=Behavior::get_action('admin', $post['name']);
            
            $action['info']=$action;
            return json($action);
        }

        if(isset($post['group']) && isset($post['role_name']) && isset($post['role_code']) && isset($post['resource_type'])){

            $post['role_code']=array_unique($post['role_code']);

            $arr['role_name']=$post['role_name'];
            $arr['resource_type']=$post['resource_type'];
            $arr['group']=$post['group'];
            
            $arr['role_code']=implode("@/admin/", $post['role_code']);

            $arr['role_code']='/admin/'.$arr['role_code'];
            $rows=Db::name('role_author')->insert($arr);
            if($rows){
                $data['status']="1";
                $data['msg']="权限资源添加成功";
                return json($data);
            }else{
                $data['status']="0";
                $data['msg']="权限资源添加失败";
                return json($data);
            }
        }
        
        $controller=Behavior::get_controller('admin');
        foreach ($controller as $key => $value) {
            
            $controller[$key]=basename($value,".php");

        }
        
        $group=Session::get('acl');
        //获取系统类别
        $system_sort=Behavior::get_system_sort();

        $this->assign('system_sort',$system_sort);
        $this->assign('group',$group);
        $this->assign('controller',$controller);
        return $this->fetch('role_resource_add');
    }

    //权限资源编辑
    public function role_resource_edit()
    {
        $id=input('id');
        $post = $this->request->param();

        if(isset($post['group']) && isset($post['role_name']) && isset($post['role_code']) && isset($post['resource_type'])){

            $post['role_code']=array_unique($post['role_code']);

            $arr['role_name']=$post['role_name'];
            $arr['resource_type']=$post['resource_type'];
            $arr['group']=$post['group'];
            
            // $arr['role_code']=implode("@/index.php/admin/", $post['role_code']);//未隐藏入口文件使用
            $arr['role_code']=implode("@/admin/", $post['role_code']);

            // $arr['role_code']='/index.php/admin/'.$arr['role_code'];//未隐藏入口文件使用
            $arr['role_code']='/admin/'.$arr['role_code'];

            $rows=Db::name('role_author')->where('id',$post['id'])->update($arr);

            return Behavior::return_info($rows);
        }
        
        $rows=Db::name('role_author')->where('id',$id)->find();
        
        if($rows){
            $arr=explode("@", $rows['role_code']);
            
            foreach ($arr as $key => $value) {
                
                // $arr[$key]=substr($value, 17);//不隐藏入口文件使用
                $arr[$key]=substr($value, 7);
            }
            
        }

        $rows['role_code']=$arr;
        foreach ($rows['role_code'] as $key => $value) {
            # code...
            $rows['controller'][$key]=substr($value,0,strpos($value, '/'));
            
        }
        $rows['controller']=array_unique($rows['controller']);
        
        
        $controller=Behavior::get_controller('admin');
        foreach ($controller as $key => $value) {
            # code...
            $controller[$key]=basename($value,".php");

        }
        $group=Session::get('acl');
        //获取系统类别
        $system_sort=Behavior::get_system_sort();
        
        $this->assign('system_sort',$system_sort);
        $this->assign('group',$group);
        $this->assign('controller',$controller);
        $this->assign('rows',$rows);
        $this->assign('id',$id);
        return $this->fetch('role_resource_edit');
        
    }

    //删除权限资源
    public function role_resource_delete()
    {
        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if($data!=""){
                if(intval($data['id'])>0){
                    $rows=Db::name('role_author')->where('id',$data['id'])->find();
                    $role_group=Db::name('role_group')->select();
                    $acl="";
                    foreach ($role_group as $key => $value) {
                        # code...
                        $acl.=$value['acl'];
                    }

                    if(strpos($acl,$rows['role_code']) === false){

                        return Behavior::delete($data['id'],'role_author');
                        
                    }else{
                        $data['status']="0";
                        $data['msg']="删除失败，该权限资源已经有角色使用！";
                        return json($data);
                    }
                }
            }
        }
    }


    //批量权限资源删除
    public function resource_delete_all(){
        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            
            if($data!=""||!empty($data)){
                $count=0;
                foreach ($data as $key => $value) {

                    $rows=Db::name('role_author')->where('id',$value)->find();
                    
                    Db::startTrans();
                    try{

                        $role_group=Db::name('role_group')->select();
                        $acl="";
                        foreach ($role_group as $k => $v) {
                            
                            $acl.=$v['acl'];
                        }

                        if(strpos($acl,$rows['role_code']) !== false){
                            //  抛出异常
                            throw new \Exception("删除失败，请确保删除的数据排除角色在使用！");
                        }else{
                            $rest=Db::name('role_author')->where('id',$value)->update(['is_available'=>0]);
                            if(!$rest){
                                $data['status']='0';
                                $data['msg']='数据删除失败！';
                                return json($data);
                            }
                        }
                        
                        // 提交事务
                        Db::commit();    
                    } catch (\Exception $e) {
                        // 回滚事务
                        Db::rollback();
                        $data['status']="0";
                        $data['msg']=$e->getMessage();
                        return json($data);
                    }
                    $count++;
                }
                $number=count($data);
                if($count===$number&& $number!=0){
                    $data['status']="1";
                    $data['msg']="成功删除".$count."条数据！";
                    return json($data);
                }else{
                    $data['status']="0";
                    $data['msg']="删除失败，请稍后再试！";
                    return json($data);
                }
                
            }else{
                $data['status']="0";
                $data['msg']="数据获取异常，请稍后再试！";
                return json($data);
            }

        }
    }

    //添加管理员
    public function admin_add()
    {
        
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            
            if(!empty($data)){
                if($data['pass']!=$data['repass']){
                    $data['status']="0";
                    $data['msg']="两次密码不一致！";
                    return json($data);
                }

                if(empty($data['pass'])|| empty($data['repass'])){
                    $data['status']="0";
                    $data['msg']="密码不能为空！";
                    return json($data);
                }
                $arr['name']=$data['username'];
                $arr['password']=base64_encode($data['pass']);
                $arr['repassword']=base64_encode($data['repass']);
                $arr['email']=$data['email'];
                $arr['telephone']=$data['phone'];
                $arr['role_group_id']=$data['role_group_id'];
                $arr['department_id']=$data['department_id'];
                $arr['create_time']=time();
                $arr['status']=$data['status'];
                $arr['sex']=$data['sex'];
                if($arr['sex']==1){
                    $arr['img_url']="man.png";
                }elseif($arr['sex']==0){
                    $arr['img_url']="woman.png";
                }else{
                    $data['status']="0";
                    $data['msg']="请选择正确的管理员性别！";
                    return json($data);
                }
                
                $is_super=Db::name('role_group')->where('id',$data['role_group_id'])->find();
                if($is_super['role_name']=="超级管理员" && $is_super['acl']=="all"){
                    
                    $arr['is_super']="1";
                }else{
                    $arr['is_super']="0";
                }

                $result = $this->validate($arr,'Admin');
                if(true !== $result){
                    // 验证失败 输出错误信息
                    $data['status']="0";
                    $data['msg']=$result;
                    return json($data);
                }
                unset($arr['repassword']);
                $rows=Db::name('admin')->insert($arr);
                
                return Behavior::return_info($rows);
                
                
            }
        }else{
            //循环遍历角色数据
            $sel_group_ids=Db::name('role_group')->where(['status'=>'1','is_available'=>1])->select();
            //获取所有部门
            $department=Db::name('department')->where('is_available',1)->select();
            $this->assign('sel_group_ids',$sel_group_ids);
            $this->assign('department',$department);
            return $this->fetch('admin_add');
        }
        
    }

    //编辑管理员
    public function admin_edit()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            
            if(!empty($data)){
                if(isset($data['field'])){
                    if($data['field']=='password'){
                        $data['name']="123456";
                        $data['name']=base64_encode($data['name']);
                        $rest=Db::name('admin')->where('id',$data['id'])->find();
                        if($rest['password']==$data['name']){
                            $data['status']='1';
                            $data['msg']='数据修改成功！';
                            return json($data);
                        }
                    }
                    $rest=Db::name('admin')->where('id',$data['id'])->setField($data['field'],$data['name']);

                    return Behavior::return_info($rest);

                }else{
                    if($data['pass']!=$data['repass']){
                        $data['status']="0";
                        $data['msg']="两次密码不一致";
                        return json($data);
                    }
                    $arr['name']=$data['username'];
                    $arr['password']=$data['pass'];
                    $arr['telephone']=$data['phone'];
                    $arr['role_group_id']=$data['role_group_id'];
                    $arr['department_id']=$data['department_id'];
                    $arr['status']=$data['status'];
                    $arr['email']=$data['email'];
                    $arr['multi_device']=$data['multi_device'];
                    $arr['sex']=$data['sex'];

                    $rows=Db::name('admin')->where('id',$data['id'])->update($arr);
                    
                    return Behavior::return_info($rows);
                }
            }else{
                $data['status']="0";
                $data['msg']="数据获取失败";
                return json($data);
            }
        }else{
            $id=input('id');
            $rows=Db::name('admin')->where('id',$id)->find();

            $sel_group_ids=Db::name('role_group')->where('is_available',1)->select();

            //获取所有部门
            $department=Db::name('department')->where('is_available',1)->select();
            
            $this->assign('department',$department);
            $this->assign('rows',$rows);
            $this->assign('sel_group_ids',$sel_group_ids);

            return view('admin_edit');
        }

        
    }

    //删除单一管理员
    public function admin_delete()
    {
        if (Request::instance()->isAjax()){
            $login=Session::get('login');
            $data=Request::instance()->post();
            if($data!=""){
                if(intval($data['id'])>0){
                    $rows=Db::name('admin')->where('id',$data['id'])->find();
                    if($login['id']==$data['id']){
                        $data['status']="0";
                        $data['msg']="删除失败，请确保删除的数据排除当前登入用户！";
                        return json($data);
                    }elseif($rows['is_super']==1){
                        $data['status']="0";
                        $data['msg']="删除失败，暂无权限删除超级管理员！";
                        return json($data);
                    }else{
                        $rest=Db::name('admin')->where('id',$data['id'])->update(['is_available'=>0]);
                        return Behavior::return_info($rest);   
                    }
                }
            }
        }

    }

    //批量管理员删除
    public function admin_delete_all(){
        if (Request::instance()->isAjax()){
            $login=Session::get('login');
            $data=Request::instance()->post();
            
            if($data!=""||!empty($data)){
                
                $count=0;
                foreach ($data as $key => $value) {
                    $rows=Db::name('admin')->where('id',$value)->find();
                    # code...
                    Db::startTrans();
                    try{

                        if($login['id']==$value){
                            //  抛出异常
                            throw new \Exception("删除失败，请确保删除的数据排除当前登入用户！");

                        }elseif($rows['is_super']==1){
                            //  抛出异常
                            throw new \Exception("删除失败，暂无权限删除超级管理员！");
                        }else{
                            $rest=Db::name('admin')->where('id',$value)->update(['is_available'=>0]);
                            if($rest){
                                
                                $count++;
                            }
                        }
                        
                        // 提交事务
                        Db::commit();    
                    } catch (\Exception $e) {
                        // 回滚事务
                        Db::rollback();
                        $data['status']="0";
                        $data['msg']=$e->getMessage();
                        return json($data);
                    }
                    
                }
                $number=count($data);
                if($count===$number&& $number!=0){
                    $data['status']="1";
                    $data['msg']="成功删除".$count."条数据！";
                    return json($data);
                }else{
                    $data['status']="0";
                    $data['msg']="删除失败，请稍后再试！";
                    return json($data);
                }
                
            }else{
                $data['status']="0";
                $data['msg']="数据获取异常，请稍后再试！";
                return json($data);
            }

        } 
    }


    //管理员导出
    public function admin_export()
    {
        
        $admin = Db::name('admin')->alias('a')->field('a.status aStatus,a.*,g.id gId,g.*')->join('role_group g','a.role_group_id=g.id','LEFT')->select();    //数据库查询
        $path = dirname(__FILE__); //找到当前脚本所在路径

        vendor("PHPExcel.PHPExcel"); //方法一

        $PHPExcel = new \PHPExcel();
        $PHPSheet = $PHPExcel->getActiveSheet();
        $PHPSheet->setTitle("管理员数据"); //给当前活动sheet设置名称
        $PHPSheet->setCellValue("A1", "ID")
            ->setCellValue("B1", "登入名")
            ->setCellValue("C1", "密码")
            ->setCellValue("D1", "性别")
            ->setCellValue("E1", "加入时间")
            ->setCellValue("F1", "角色")
            ->setCellValue("G1", "状态")
            ->setCellValue("H1", "E-mail")
            ->setCellValue("I1", "最后登入时间")
            ->setCellValue("J1", "最后登入IP")
            ->setCellValue("K1", "登入次数")
            ->setCellValue("L1", "电话");
        $i = 2;
        foreach($admin as $data){
            if($data['aStatus']==1){
                $data['aStatus']="已启用";
            }else{
                $data['aStatus']="未启用";
            }

            if($data['sex']==1){
                $data['sex']="男";
            }else{
                $data['sex']="女";
            }

            if($data['create_time']!="" && is_numeric($data['create_time'])){
                $data['create_time']=date("Y-m-d H:i:s",$data['create_time']);
            }

            if($data['last_login_time']!="" && is_numeric($data['last_login_time'])){
                $data['last_login_time']=date("Y-m-d H:i:s",$data['last_login_time']);
            }

            
            $PHPSheet->setCellValue("A" . $i, $data['id'])
                ->setCellValue("B" . $i, $data['name'])
                ->setCellValue("C" . $i, base64_decode($data['password']))
                ->setCellValue("D" . $i, $data['sex'])
                ->setCellValue("E" . $i, $data['create_time'])
                ->setCellValue("F" . $i, $data['role_name'])
                ->setCellValue("G" . $i, $data['aStatus'])
                ->setCellValue("H" . $i, $data['email'])
                ->setCellValue("I" . $i, $data['last_login_time'])
                ->setCellValue("J" . $i, $data['last_login_ip'])
                ->setCellValue("K" . $i, $data['count_login'])
                ->setCellValue("L" . $i, $data['telephone']);
            $i++;
        }
        //设置全表自动筛选
        // $PHPExcel->getActiveSheet()->setAutoFilter('A1:E20');
        $PHPExcel->getActiveSheet()->setAutoFilter(
            $PHPExcel->getActiveSheet()->calculateWorksheetDimension());
        $PHPExcel->getDefaultStyle()->getFont()->setName('Arial');
        $PHPExcel->getDefaultStyle()->getFont()->setSize(14);
        //单元格密码保护
        // $PHPExcel->getActiveSheet()->getProtection()->setSheet( true);
        // $PHPExcel->getActiveSheet()->protectCells( 'A3:E13', 'PHPExcel');

        $PHPExcel->getActiveSheet()->getStyle('A1:J1')->getFill()->getStartColor()->setARGB('FF303030');
        //设置字体颜色
        // $PHPExcel->getActiveSheet()->getStyle( 'B1')->getFont()->getColor()->setARGB(\PHPExcel_Style_Color::COLOR_BLACK);
        
        $PHPWriter = \PHPExcel_IOFactory::createWriter($PHPExcel, "Excel5");
        $time=date('Y-m-d',time());
        // header("Content-Disposition: attachment;filename='会员数据$time.xlsx'");
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header("Content-Disposition: attachment;filename='会员数据$time.xls'");//下载下来的表格名
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Type: application/octet-stream');  
        $PHPWriter->save("php://output");
    }

    //角色模板显示
    public function role_group_list()
    {
    	return view('role_group_list');
    }

    //角色信息查询
    public function role_group_list_info()
    {
        //判断搜索
        $post = $this->request->param();

        $info=RoleGroupLogic::select($post,'role_group');
        
        if(isset($info['list'])){
            foreach ($info['list'] as $key => $value) {
                $count_admin=Db::name('admin')->where(['role_group_id'=>$value['id'],'is_available'=>1])->count();
                
                $info['list'][$key]['count_admin']=$count_admin;

                if($value['status']=="0"){
                    $info['list'][$key]['status']="未启用";
                }else{
                    $info['list'][$key]['status']="已启用";
                }
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

    //角色编辑
    public function role_edit()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            
            if(!empty($data)){

                if(isset($data['field'])){

                    $rest=Db::name('role_group')->where('id',$data['id'])->setField($data['field'],$data['name']);
                    return Behavior::return_info($rest);
                }else{
                    $id=$data['id'];
                    $desc=$data['desc'];
                    $sortStr="";
                    $stracl=implode("", $data['acl']);

                    $stracl=substr($stracl,0,-1);

                    $arr['desc']=$desc;
                    $rest=Db::name('role_group')->where('id',$id)->find();
                    if($rest['role_name']=="超级管理员"){
                        $arr['acl']="all";
                    }else{
                        $arr['acl']=$stracl;
                    }

                    foreach ($data['system_sort'] as $key => $value) {
                        # code...
                        $system_sort=$value."@";
                        $sortStr.=$system_sort;

                    }
                    $arr['system_sort_id']=$sortStr;
                    $rows=Db::name('role_group')->where('id',$id)->update($arr);

                    return Behavior::return_info($rows);
                }
                
            }else{
                $data['status']="0";
                $data['msg']="数据获取失败";
                return json($data);
            }
        }else{

            $id=input('id');
            $acl=$this->get_acl($id);
            
            //获取系统类别
            $system_sort=Behavior::get_system_sort($id);

            $this->assign('acl',$acl);
            $this->assign('system_sort',$system_sort);
            
            return $this->fetch('role_edit');
        }
        
    }

    //查看角色
    public function role_view()
    {
        $id=input('id');
        $acl=$this->get_acl($id);
        //获取系统类别
        $system_sort=Behavior::get_system_sort($id);

        $this->assign('acl',$acl);
        $this->assign('system_sort',$system_sort);
        
        return $this->fetch('role_view');
    }

    //获取角色urls
    public function get_acl($id="",$add="")
    {
        if($id!=""){
            $rows=Db::name('role_group')->where('id',$id)->find();
            
            if($rows!=null){
                $this->assign('rows',$rows);
            }

            $role_acl=explode('@', $rows['acl']);
        }
        
        $rest=Db::name('role_author')->where('is_available',1)->select();
        
        $acl=Session::get('acl');
        
        foreach ($acl as $key => $value) {
            # code...
            $acl[$key]['sub']=[];
            foreach ($rest as $k => $v) {
                # code...
                if(!isset($value['role_code'])){
                    $value['role_code']="";
                }

                if($v['group']==$value['name']){
                    $acl[$key]['sub'][$k]['name']=$v['role_name'];
                    $acl[$key]['sub'][$k]['author']=0;
                    $acl[$key]['sub'][$k]['url']=explode("@", $v['role_code']);
                    if($add==""){
                        foreach ($acl[$key]['sub'][$k]['url'] as $kkk => $vvv) {
                            # code...
                            foreach ($role_acl as $kkkk => $vvvv) {
                                # code...
                                if($vvvv==$vvv){
                                    $acl[$key]['sub'][$k]['author']=1;
                                }
                            }
                        }
                    }
                }

                foreach ($acl[$key]['sub'] as $k => $v) {
                    # code...
                    $acl[$key]['sub'][$k]['urls']=implode("@",$v['url']);
                }
            }
        }

        return $acl;
    }

    //角色添加
    public function role_add(){

        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            
            if(!empty($data)){
                if(empty($data['acl'])){
                    $data['status']="0";
                    $data['msg']="请为角色赋予相应的权限...";
                    return json($data);
                }

                if(empty($data['system_sort'])){
                    $data['status']="0";
                    $data['msg']="请为角色分配所属系统...";
                    return json($data);
                }
                $arr=array();
                $aclStr="";
                $sortStr="";
                $arr['role_name']=$data['name'];
                foreach ($data['acl'] as $key => $value) {
                    # code...
                    $addstr=$value."@";
                    $aclStr.=$addstr;

                }
                foreach ($data['system_sort'] as $key => $value) {
                    # code...
                    $system_sort=$value."@";
                    $sortStr.=$system_sort;

                }
                $sortStr=substr($sortStr,0,-1);
                $aclStr=substr($aclStr,0,-1);
                $arr['acl']=$aclStr;
                $arr['system_sort_id']=$sortStr;
                $arr['desc']=$data['desc'];
                $arr['status']="1";
                $rows=Db::name('role_group')->insert($arr);
                
                return Behavior::return_info($rows);
            }

        }else{

            //获取所有权限列表
            $acl=$this->get_acl($id="",$add=true);
            //获取系统类别
            $system_sort=Behavior::get_system_sort();

            $this->assign('acl',$acl);
            $this->assign('system_sort',$system_sort);
            return $this->fetch('role_add');
        }
    }

    //角色删除
    public function role_delete()
    {
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if($data!=""){
                if(intval($data['id'])>0 && is_numeric($data['id'])){
                    $count_admin=Db::name('admin')->where('role_group_id',$data['id'])->count();
                    if($count_admin!=0){
                        $data['status']='0';
                        $data['msg']='请先解除该角色拥有的管理员，否则将无法删除！';
                        return json($data);
                    }else{
                        $rest=Db::name('role_group')->where('id',$data['id'])->update(['is_available'=>0]);
                        return Behavior::return_info($rest);    
                    }
                }
            }
        }

    }

    //批量角色删除
    public function role_delete_all(){
        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            
            if($data!=""||!empty($data)){
                
                $count=0;
                foreach ($data as $key => $value) {
                    $rows=Db::name('role_group')->where('id',$value)->find();
                    # code...
                    Db::startTrans();
                    try{
                        $count_admin=Db::name('admin')->alias('a')->join('role_group g','a.role_group_id='.$rows['id'],'LEFT')->select();
                        if($count_admin!=""){
                            //  抛出异常
                            throw new \Exception("先解除该角色拥有的管理员，否则将无法删除！");

                        }else{
                            $rest=Db::name('role_group')->where('id',$value)->update(['is_available'=>0]);
                            if($rest){
                                
                                $count++;
                            }
                        }
                        
                        // 提交事务
                        Db::commit();    
                    } catch (\Exception $e) {
                        // 回滚事务
                        Db::rollback();
                        $data['status']="0";
                        $data['msg']=$e->getMessage();
                        return json($data);
                    }
                    
                }
                $number=count($data);
                if($count===$number&& $number!=0){
                    $data['status']="1";
                    $data['msg']="成功删除".$count."条数据！";
                    return json($data);
                }else{
                    $data['status']="0";
                    $data['msg']="删除失败，请稍后再试！";
                    return json($data);
                }
                
            }else{
                $data['status']="0";
                $data['msg']="数据获取异常，请稍后再试！";
                return json($data);
            }

        } 
    }

    //管理员导出
    public function admin_role_export()
    {
        
        $admin = Db::name('role_group')->select();//数据库查询
        $path = dirname(__FILE__);//找到当前脚本所在路径

        vendor("PHPExcel.PHPExcel");//方法一

        $PHPExcel = new \PHPExcel();
        $PHPSheet = $PHPExcel->getActiveSheet();
        $PHPSheet->setTitle("管理员角色数据");//给当前活动sheet设置名称
        $PHPSheet->setCellValue("A1", "ID")
            ->setCellValue("B1", "角色名称")
            ->setCellValue("C1", "权限码")
            ->setCellValue("D1", "状态")
            ->setCellValue("E1", "描述")
            ->setCellValue("F1", "是否删除");
        $i = 2;
        foreach($admin as $data){
            if($data['status']==1){
                $data['status']="已启用";
            }else{
                $data['status']="未启用";
            }

            if($data['is_available']==1){
                $data['is_available']="正常";
            }else{
                $data['is_available']="删除";
            }

            $PHPSheet->setCellValue("A" . $i, $data['id'])
                ->setCellValue("B" . $i, $data['role_name'])
                ->setCellValue("C" . $i, $data['acl'])
                ->setCellValue("D" . $i, $data['status'])
                ->setCellValue("E" . $i, $data['desc'])
                ->setCellValue("F" . $i, $data['is_available']);
            $i++;
        }
        //设置全表自动筛选
        // $PHPExcel->getActiveSheet()->setAutoFilter('A1:E20');
        $PHPExcel->getActiveSheet()->setAutoFilter(
            $PHPExcel->getActiveSheet()->calculateWorksheetDimension());
        $PHPExcel->getDefaultStyle()->getFont()->setName('Arial');
        $PHPExcel->getDefaultStyle()->getFont()->setSize(14);
        //单元格密码保护
        // $PHPExcel->getActiveSheet()->getProtection()->setSheet( true);
        // $PHPExcel->getActiveSheet()->protectCells( 'A3:E13', 'PHPExcel');

        $PHPExcel->getActiveSheet()->getStyle('A1:J1')->getFill()->getStartColor()->setARGB('FF303030');
        //设置字体颜色
        // $PHPExcel->getActiveSheet()->getStyle( 'B1')->getFont()->getColor()->setARGB(\PHPExcel_Style_Color::COLOR_BLACK);
        
        $PHPWriter = \PHPExcel_IOFactory::createWriter($PHPExcel, "Excel5");
        $time=date('Y-m-d',time());
        // header("Content-Disposition: attachment;filename='会员数据$time.xlsx'");
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header("Content-Disposition: attachment;filename='会员数据$time.xls'");//下载下来的表格名
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Type: application/octet-stream');  
        $PHPWriter->save("php://output");
    }

    //基础管理个人中心模板显示
    public function admin_info()
    {

        $admin_info=Session::get('login');
        $admin_info['password']=base64_decode($admin_info['password']);
        $rows=Db::name('role_group')->where('id',$admin_info['role_group_id'])->find();
        $department=Db::name('department')->where('id',$admin_info['department_id'])->find();
        $admin_info['department']=$department['name'];
        // $array=array();
        // foreach ($rows as $key => $value) {
        //     # code...
        //     $value['role_group_id']=explode(',', $value['role_group_id']);
        //     array_push($array, $value);
        // }
        // $rows=$array;

        // echo "<pre>";
        //     print_r($admin_info);
        // echo "</pre>";
        // exit;
        $role_group_info=Db::name('role_group')->select();
        $http_referer=$_SERVER['HTTP_HOST'].DS."uploads/";
        $this->assign('role_group_info',$role_group_info);
        $this->assign('http_referer',$http_referer);
        $this->assign('admin_info',$admin_info);
        
        $this->assign('rows',$rows);
        return view('admin_info');
    }

    //基础管理基本信息修改
    public function base_info(){

        $admin_info=Session::get('login');

        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                if(!empty($data['name'])){
                    $rest=Db::name('admin')->where('id','<>',$data['id'])->select();
                    $rows=Db::name('admin')->where('id='.$data['id'])->find();
                    //检测用户名是否存在
                    foreach ($rest as $key => $value) {
                        
                        if($value['name']==$data['name']){
                            $data['status']="0";
                            $data['msg']="修改失败，用户名已经存在！";
                            return json($data);
                        }else{
                            
                            $arr['name']=$data['name'];
                            $arr['sex']=$data['sex'];
                            $arr['telephone']=$data['phone'];
                            $arr['email']=$data['email'];
                            $arr['remark']=$data['remark'];

                            if(basename($data['img_url'])!=$rows['img_url']){

                                $arr['img_url']=$data['img_url'];

                                Files::thumb_image($data['img_url'],'header'.DS.$data['id'],$width=400,$height=300);

                                $heade_img=ROOT_PATH . 'public' . DS . 'uploads'.DS.'header'.DS.$data['id'].DS.$admin_info['img_url'];
                                
                                if(file_exists($heade_img)){
                                    unlink(ROOT_PATH . 'public' . DS . 'uploads'.DS.'header'.DS.$data['id'].DS.$admin_info['img_url']);
                                }

                            }

                            
                            if(isset($data['multi_device'])){
                                $arr['multi_device']=$data['multi_device']=1;
                            }else{
                                $arr['multi_device']=0;
                            }
                            $rows=Db::name('admin')->where('id',$data['id'])->update($arr);
                            return Behavior::return_info($rows);
                        }
                    }
                    
                }else{
                    $data['status']="0";
                    $data['msg']="用户名不能为空！";
                    return json($data);
                }
                
            }
        }
    }

    // 试卷列表
    public function evaluation_list()
    {
        $login=Session::get('login');

        $this->assign('login_id',$login['id']);
        
        return $this->fetch();   
    }

    public function evaluation_list_info()
    {
        //判断搜索
        $post = $this->request->param();

        $info=ExaminationLogic::select($post,'examination');

        if(isset($info['list'])){
            foreach ($info['list'] as $key => $value) {
                
                $info['list'][$key]['type']=$value['status'];
                $info['list'][$key]['id']=base64_encode($value['id']);
                
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

    //参加考试
    public function join_evaluation()
    {
         
        // ignore_user_abort(true);
        // set_time_limit(0);
        $memcache=new \Memcache();
        $memcache->connect('127.0.0.1',11211) or die('Count not connect');
        $id=base64_decode(input('id'));
        
        $login=Session::get('login');
        
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();

            $arr=array();
            $instarr=array();
            $login=Session::get('login');
            //定义答题分数
            $result_score=0;
            //定义多选题答案一维数组
            $multi=array();
            $result=array();

            $ins=array();

            $ins['examination_id']=$data['id'];

            $ins['admin_id']=$login['id'];

            $evaluation_record=Db::name('evaluation_record')->insertGetId($ins);

            $arr['record_id']=$evaluation_record;

            //判断单选答案
            if(isset($data['single_answer'])){

                foreach ($data['single_answer'] as $key => $value) {

                    $single_answer=Db::name('questions_answer')->where('questions_id',$key)->find();

                    $arr['answer']=$value;

                    if($value==$single_answer['answer']){

                        $single_questions=Db::name('questions')->where('id',$key)->find();

                        $arr['score']=$single_questions['score'];

                    }else{

                        $arr['score']=0;
                    }

                    $result_score+=$arr['score'];

                    $arr['questions_id']=$key;

                    array_push($instarr, $arr);

                }
            }

            //判断多选题答案
            //答不全得一半的分数
            //答错不得分

            if(isset($data['multi_answer'])){
                
                $multi_score=0;

                foreach ($data['multi_answer'] as $key => $value) {
                    
                    $multi_str="";

                    $multi_questions=Db::name('questions')->where('id',$key)->find();

                    $multi_answer=Db::name('questions_answer')->where('questions_id',$key)->select();
                    
                    //多选了答案
                    if(count($data['multi_answer'][$key])>count($multi_answer)){
                        //答错，不得分
                        $arr['score']=0;

                    }elseif(count($data['multi_answer'][$key])<=count($multi_answer)){

                        //本题的正确答案选项

                        foreach ($multi_answer as $km => $vm) {
                            array_push($multi, $vm['answer']);
                        }
                        
                        if(is_array($value)){

                            foreach ($value as $k => $v) {
                                
                                $multi_str.="@".$v;
                                
                                array_push($result, $v);//本题提交的答案
                            }

                            $arr['answer']=$multi_str;

                        }

                        $diff1 = array_diff($result,$multi);

                        $diff2 = array_diff($multi,$result);

                        if(empty($diff1) && empty($diff2)){

                            // 答案无误，得满分
                            $arr['score']=$multi_questions['score'];
                               
                        }elseif(empty($diff1) && !empty($diff2)){

                            //答案不全，得一半分

                            $arr['score']=$multi_questions['score']*0.5;

                        }else{
                            
                            //答案有误，不得分

                            $arr['score']=0;
                        }


                    }

                    $result_score+=$arr['score'];

                    $arr['questions_id']=$key;

                    array_push($instarr, $arr);

                }

                
            }


            //判断填空题
            if(isset($data['fill_answer'])){

                foreach ($data['fill_answer'] as $key => $value) {

                    $fill_answer=Db::name('questions_answer')->where('questions_id',$key)->find();

                    $arr['answer']=$value;

                    if($value==$fill_answer['answer']){

                        $fill_questions=Db::name('questions')->where('id',$key)->find();

                        $arr['score']=$fill_questions['score'];

                    }else{

                        $arr['score']=0;
                    }

                    $result_score+=$arr['score'];

                    $arr['questions_id']=$key;

                    array_push($instarr, $arr);

                }

            }


            // 判断题
            if(isset($data['recognized_answer'])){

                foreach ($data['recognized_answer'] as $key => $value) {

                    $recognized_answer=Db::name('questions_answer')->where('questions_id',$key)->find();

                    $arr['answer']=$value;

                    if($value==$recognized_answer['answer']){

                        $recognized_questions=Db::name('questions')->where('id',$key)->find();

                        $arr['score']=$recognized_questions['score'];

                    }else{

                        $arr['score']=0;
                    }

                    $result_score+=$arr['score'];

                    $arr['questions_id']=$key;

                    array_push($instarr, $arr);

                }

            }

            //判断简答题
            //相似度90%以上的满分
            //低于90%按相似度计算分值

            if(isset($data['short_answer'])){

                foreach ($data['short_answer'] as $key => $value) {

                    $short_answer=Db::name('questions_answer')->where('questions_id',$key)->find();

                    $recognized_questions=Db::name('questions')->where('id',$key)->find();

                    similar_text($short_answer['answer'], $value, $percent);

                    $arr['answer']=Behavior::cutstr_html($value);

                    if($percent>90){

                        $arr['score']=$recognized_questions['score'];

                    }else{

                        $arr['score']=round(($percent/100)*$recognized_questions['score'],1);
                    }

                    $result_score+=$arr['score'];

                    $arr['questions_id']=$key;

                    array_push($instarr, $arr);

                }
            }

            $rows=Db::name('evaluation_answer')->insertAll($instarr);

            //获取本次提交分数
            $count_score=Db::name('evaluation_answer')->where('record_id',$evaluation_record)->sum('score');
            
            //判断是否通过考试
            $examination=Db::name('examination')->where('id',$data['id'])->find();

            $pass=$count_score/$examination['total_score'];

            if($pass>=$examination['pass_score']){
                $pass=1;//通过测评
                $info['examination_id']=$data['id'];
                $info['admin_id']=$login['id'];

                $select_admin=Db::name('examination_pass')->where($info)->find();

                if($select_admin==false){
                    $pass_admin=Db::name('examination_pass')->insert($info);
                }
                
            }else{
                $pass=0;
            }

            //重新赋值考试记录数据
            $update_evaluation_record=Db::name('evaluation_record')->where('id',$evaluation_record)->update(['score'=>$count_score,'pass'=>$pass]);

            if($pass){
                $data['status']="1";
                $data['msg']='恭喜你，通过测评，您的成绩为：'.$count_score.'分';
                return json($data);
            }else{
                $data['status']="0";
                $data['msg']='很遗憾，您没有通过测评，您的成绩为：'.$count_score.'分';
                return json($data);
            }
                
        }

        //正常显示答题页面

        $rest=Db::name('examination')->where('id',$id)->find();

        $rest['duration']=$rest['duration']*60;
        
        $rows=Db::name('questions')->where('examination_id',$id)->order('id')->select();

        foreach ($rows as $key => $value) {
            $rows[$key]['options']=array();
            $options=Db::name('questions_options')->where('questions_id',$value['id'])->select();
            foreach ($options as $k => $v) {

                $index=Behavior::get_char($k);
                
                $options[$k]['index']=$index;
            }
            
            $rows[$key]['options']=$options;


        }

        //分组查询题型
        $count=Db::name('questions')->group('type')->order('id asc')->where('examination_id',$id)->select();

        $info=$count;
        
        $this->assign('type',$count);
        $this->assign('info',$info);
        $this->assign('login',$login);
        $this->assign('login_id',$login['id']);
        $this->assign('single',$rows);
        $this->assign('multi',$rows);
        $this->assign('recognized',$rows);
        $this->assign('fill',$rows);
        $this->assign('short',$rows);
        $this->assign('rows',$rows);
        $this->assign('rest',$rest);
        $this->assign('id',$id);

        return $this->fetch('join_evaluation');
    }

    //测评记录显示
    public function evaluation_record()
    {
        $id=base64_decode(input('id'));
        
        $login=Session::get('login');

        $count=Db::name('evaluation_record')->where(['examination_id'=>$id,'admin_id'=>$login['id']])->count();

        $rows=Db::name('examination')->alias('e')->field('e.id eID,e.*,r.id rId,r.*')->join('evaluation_record r','r.examination_id=e.id','LEFT')->where(['examination_id'=>$id,'admin_id'=>$login['id']])->select();
       
        foreach ($rows as $key => $value) {
            
            $rows[$key]['id']=base64_encode($value['id']);
            $rows[$key]['eID']=base64_encode($value['eID']);
            $rows[$key]['rId']=base64_encode($value['rId']);

            $rows[$key]['admin_name']=$login['name'];

            $rows[$key]['total_number']=Db::name('questions')->where(['examination_id'=>$id,'is_available'=>1])->count();

            $score=Db::name('evaluation_record')->where('id',$value['rId'])->find();

            $rows[$key]['fact_score']=$score['score'];

            if($value['pass']==1){
                $rows[$key]['pass']="已通过";
            }else{
                $rows[$key]['pass']="未通过";
            }
        }

        $this->assign('count',$count);
        $this->assign('rows',$rows);
        return $this->fetch('evaluation_record');
    }


    //测评详情
    public function evaluation_info()
    {
        $id=base64_decode(input('id'));
        $record_id=base64_decode(input('record_id'));

        $login=Session::get('login');

        $rows=Db::name('questions')->where('examination_id',$id)->select();

        $total_score=Db::name('evaluation_answer')->where(['record_id'=>$record_id])->sum('score');

        foreach ($rows as $key => $value) {

            $result=Db::name('evaluation_answer')->where(['record_id'=>$record_id,'questions_id'=>$value['id']])->find();

            if(empty($result) || $result['answer']==""){
                $result['answer']="未答题";
            }

            if(empty($result) || empty($result['score'])){
                $result['score']=0;
            }

            $rows[$key]['result']=$result['answer'];
            $rows[$key]['real_score']=$result['score'];

            if($value['type']=="0"){
                $rows[$key]['type']="单选题";
            }

            if($value['type']=="1"){

                $rows[$key]['type']="多选题";
                $rows[$key]['result']=str_replace("@", "", $rows[$key]['result']);
                
            }

            if($value['type']=="2"){

                $rows[$key]['type']="判断题";

                if($rows[$key]['result']=="1"){
                    $rows[$key]['result']="正确";
                }else{
                    $rows[$key]['result']="错误";
                }
            }

            if($value['type']=="3"){
                $rows[$key]['type']="填空题";
            }

            if($value['type']=="4"){
                $rows[$key]['type']="简答题";
            }
        }

        $this->assign('total_score',$total_score);
        $this->assign('rows',$rows);
        $this->assign('id',input('id'));
        
        return $this->fetch('evaluation_info');
    }

    //管理员操作日志记录
    public function admin_log()
    {
        return $this->fetch();
    }
    
    //管理员日志信息查询
    public function admin_log_list()
    {
        //判断搜索
        $post = $this->request->param();

        $info=LogLogic::select($post,'admin_log');
        
        if(isset($info['list'])){
            foreach ($info['list'] as $key => $value) {

                $info['list'][$key]['create_time']=date('Y-m-d H:i:s',$value['create_time']);
            }

        }else{

            return $info;
        }

        
        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$info['count'];
        $arr['data']=$info['list'];
        
        return json_decode(json_encode($arr));
        
    }

    //web聊天界面显示
    public function web_chat()
    {
        return $this->fetch('web_chat');
    }

    //查询好友列表
    public function get_friends_list()
    {
        $name=Session::get('login.name');
            
        $id=Session::get('login.id');

        if(Session::get('login.img_url')!="" || Session::get('login.img_url')!=null){
            $img_url="/uploads/header/".$id."/".Session::get('login.img_url');
        }else{
            $img_url="/uploads/header/face.jpg";
        }

        //好友列表
        $department=Db::name('department')->select();

        $admin=Db::name('admin')->field('id,name,img_url,online,department_id')->select();
        
        $list=array();

        foreach ($admin as $key => $value) {
            
            $admin[$key]['username']=$value['name'];

            if($value['img_url']=='man.png' || $value['img_url']=='woman.png'){
                $admin[$key]['avatar']="/uploads/header/".$value['img_url'];
            }else{
                $admin[$key]['avatar']="/uploads/header/".$value['id']."/".$value['img_url'];
            }
            
            $admin[$key]['sign']="在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱";
            
            $admin[$key]['status']=$value['online']='online';

            unset($admin[$key]['name']);
        }

        foreach ($department as $key => $value) {
            
            $list[$key]['groupname']=$value['name'];
            $list[$key]['id']=$value['id'];
            $list[$key]['list']=array();
            foreach ($admin as $k => $v) {
                
                if($value['id']==$v['department_id']){
                    array_push($list[$key]['list'], $v);
                }

            }
            
        }

        $info=array(
            'mine'=>array(
                'username'=>$name,
                "id"=> $id,
                "status"=> "online",
                "sign"=>"编程是一门失传已久的艺术",
                "avatar"=> $img_url
                ),
            'friend'=>$list
            );

        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['data']=$info;
        
        return json_decode(json_encode($arr));

    }


    public function test()
    {
        $obj='{
    "code": 0,
    "msg": "",
    "data": {
        "mine": {
            "username": "纸飞机",
            "id": "100000",
            "status": "online",
            "sign": "在深邃的编码世界，做一枚轻盈的纸飞机",
            "avatar": "//res.layui.com/images/fly/avatar/00.jpg"
        },
        "friend": [{
            "groupname": "知名人物",
            "id": 0,
            "list": [{
                "username": "贤心",
                "id": "100001",
                "avatar": "//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg",
                "sign": "这些都是测试数据，实际使用请严格按照该格式返回",
                "status": "online"
            }, {
                "username": "刘小涛",
                "id": "100001222",
                "sign": "如约而至，不负姊妹欢乐颂",
                "avatar": "//tva4.sinaimg.cn/crop.0.1.1125.1125.180/475bb144jw8f9nwebnuhkj20v90vbwh9.jpg"
            }, {
                "username": "谢小楠",
                "id": "10034001",
                "avatar": "//tva2.sinaimg.cn/crop.1.0.747.747.180/633f068fjw8f9h040n951j20ku0kr74t.jpg",
                "sign": ""
            }, {
                "username": "马小云",
                "id": "168168",
                "avatar": "//tva1.sinaimg.cn/crop.0.0.180.180.180/7fde8b93jw1e8qgp5bmzyj2050050aa8.jpg",
                "sign": "让天下没有难写的代码"
            }, {
                "username": "徐小峥",
                "id": "666666",
                "avatar": "//tva1.sinaimg.cn/crop.0.0.512.512.180/6a4acad5jw8eqi6yaholjj20e80e8t9f.jpg",
                "sign": "代码在囧途，也要写到底"
            }]
        }, {
            "groupname": "网红声优",
            "id": 1,
            "list": [{
                "username": "罗小凤",
                "id": "121286",
                "avatar": "//tva4.sinaimg.cn/crop.0.0.640.640.180/4a02849cjw8fc8vn18vktj20hs0hs75v.jpg",
                "sign": "在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱"
            }, {
                "username": "Z_子晴",
                "id": "108101",
                "avatar": "//tva1.sinaimg.cn/crop.0.23.1242.1242.180/8693225ajw8fbimjimpjwj20yi0zs77l.jpg",
                "sign": "微电商达人"
            }, {
                "username": "大鱼_MsYuyu",
                "id": "12123454",
                "avatar": "//tva2.sinaimg.cn/crop.0.0.512.512.180/005LMAegjw8f2bp9qg4mrj30e80e8dg5.jpg",
                "sign": "我瘋了！這也太準了吧  超級笑點低"
            }, {
                "username": "醋醋cucu",
                "id": "102101",
                "avatar": "//tva2.sinaimg.cn/crop.0.0.640.640.180/648fbe5ejw8ethmg0u9egj20hs0ht0tn.jpg",
                "sign": ""
            }, {
                "username": "柏雪近在它香",
                "id": "3435343",
                "avatar": "//tva2.sinaimg.cn/crop.0.8.751.751.180/961a9be5jw8fczq7q98i7j20kv0lcwfn.jpg",
                "sign": ""
            }]
        }, {
            "groupname": "女神艺人",
            "id": 2,
            "list": [{
                "username": "王小贤",
                "id": "76543",
                "avatar": "//wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg",
                "sign": "我爱贤心"
            }, {
                "username": "佟小娅",
                "id": "4803920",
                "avatar": "//tva3.sinaimg.cn/crop.0.0.750.750.180/5033b6dbjw8etqysyifpkj20ku0kuwfw.jpg",
                "sign": "我也爱贤心吖吖啊"
            }]
        }],
        "group": [{
            "groupname": "前端群",
            "id": "101",
            "avatar": "//tva1.sinaimg.cn/crop.0.0.200.200.50/006q8Q6bjw8f20zsdem2mj305k05kdfw.jpg"
        }, {
            "groupname": "Fly社区官方群",
            "id": "102",
            "avatar": "//tva2.sinaimg.cn/crop.0.0.199.199.180/005Zseqhjw1eplix1brxxj305k05kjrf.jpg"
        }]
    }
}';
echo "<pre>";
    print_r(json_decode($obj,true));
echo "</pre>";
exit;
    }
}
