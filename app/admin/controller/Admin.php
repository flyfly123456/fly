<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Session;
use \think\Captcha;
use \think\Cookie;
use \think\Image;
use app\admin\model\Author;
use app\admin\model\Uploads;

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
    public function admin_lists()
    {
        return $this->fetch('admin_lists');
    }

    //查看单一管理员信息
    public function admin_view()
    {
        $id=input('id');
        $rows=Db::name('admin')->where('id',$id)->find();

        $sel_group_ids=Db::name('role_group')->select();
        //获取所有部门
        $department=Db::name('department')->where('is_available',1)->select();
        $this->assign('rows',$rows);
        $this->assign('sel_group_ids',$sel_group_ids);
        $this->assign('department',$department);
        return $this->fetch('admin_view');
    }

    //查看管理员信息
    public function admin_list()
    {
        $page=input("get.page")?input("get.page"):1;
        $page=intval($page);
        $limit=input("get.limit")?input("get.limit"):1;
        $limit=intval($limit);
        $limit=input('limit');

        $where=[];
        $where['is_available']=1;
        //判断搜索
        $post = $this->request->param();

        if(isset($post['start']) && isset($post['end'])){

            if(empty($post['start']) && empty($post['end'])){
                unset($post['start']);
                unset($post['end']);
                $data['status']=0;
                $data['msg']="暂无数据...";
                return json($data);
            }

            $post['modules']="create_time";
            $post['start']=strtotime($post['start']);
            $post['end']=strtotime($post['end']);
            // if(isset($post['start']) and !empty($post['start']) and empty($post['end'])){
            //     $post['start']=strtotime($post['start']);
            //     $where['create_time'] = ['gt', $post['start']];

            // }
            // if(isset($post['end']) and !empty($post['end']) and empty($post['start'])){
            //     $post['end']=strtotime($post['end']);
            //     $where['create_time'] = ['lt', $post['end']];

            // }
            // if(isset($post['start']) and !empty($post['start']) and isset($post['end']) and !empty($post['end'])){
            //     $post['start']=strtotime($post['start']);
            //     $post['end']=strtotime($post['end']);
            //     $where['create_time'] = ['between', [$post['start'],$post['end']]];

            // }
            $where['create_time'] = ['between', [$post['start'],$post['end']]];

            $where[$post['modules']] = $where['create_time'];

            $where['status']=0;
            $where['msg']="暂无数据...";
            return json($where);

        }

        

        if(isset($post['keywords']) && isset($post['modules'])){

            if(empty($post['keywords']) && empty($post['modules'])){
                unset($post['keywords']);
                unset($post['modules']);
                $data['status']=0;
                $data['msg']="暂无数据...";
                return json($data);
            }
            
            if($post['modules']=="sex"){
                if($post['keywords']=="男"){
                    $post['keywords']=0;
                }elseif($post['keywords']=="女"){
                    $post['keywords']=1;
                }else{
                    $data['status']=0;
                    $data['msg']="暂无数据！";
                    return json($data);
                }
            
            }

            if($post['modules']=="status"){
                if($post['keywords']=="已启用"){
                    $post['keywords']=1;
                }elseif($post['keywords']=="未启用"){
                    $post['keywords']=0;
                }else{
                   $data['status']=0;
                   $data['msg']="暂无数据...";
                   return json($data); 
                }
                
            }

            if($post['modules']=="department_id"){
                $rows=Db::name('department')->where('name',$post['keywords'])->find();
                if($rows){
                    $post['keywords']=$rows['id'];
                }else{
                    $data['status']=0;
                    $data['msg']="暂无数据...";
                    return json($data); 
                }
            
            }

            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
            
        }

        $count=Db::name('admin')->where($where)->count();

        $list=Db::name('admin')->page($page,$limit)->where($where)->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据...";
            return json($data);
        }
        
        foreach ($list as $key => $value) {
            # code...

            //查询所在部门
            $department=Db::name('department')->where(['id'=>$value['department_id']])->find();
            $list[$key]['department_id']=$department['name'];

            //获取所在角色
            $rest=Db::name('role_group')->where(['id'=>$value['role_group_id']])->find();
            $list[$key]['role']=$rest['role_name'];

            $list[$key]['create_time']=date('Y-m-d H:i:s',$value['create_time']);
            if(!empty($value['last_login_time'])){
                $list[$key]['last_login_time']=date('Y-m-d H:i:s',$value['last_login_time']);
            }else{
               $list[$key]['last_login_time']="暂未登入..."; 
            }

            if(empty($value['last_login_ip'])){
                $list[$key]['last_login_ip']="未知..."; 
            }
            
            if($value['sex']==0){
                $list[$key]['sex']='女';
            }else{
                $list[$key]['sex']='男';
            }

            if($value['status']=="0"){
                $list[$key]['status']="未启用";
            }else{
                $list[$key]['status']="已启用";
            }

            if($value['multi_device']==0){
                $list[$key]['multi_device']='关闭';
            }else{
                $list[$key]['multi_device']='开启';
            }

        }

        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$list;
        
        return json_decode(json_encode($arr));
    }


    //权限资源模板显示
    public function role_resource_list()
    {
    	return $this->fetch('role_resource_list');
    }

    //权限资源信息显示
    public function role_resource_info()
    {
        $page=input("get.page")?input("get.page"):1;
        $page=intval($page);
        $limit=input("get.limit")?input("get.limit"):1;
        $limit=intval($limit);
        $limit=input('limit');

        $where=[];
        $where['is_available']=1;
        //判断搜索
        $post = $this->request->param();

        if(isset($post['keywords']) && isset($post['modules'])){

            if(empty($post['keywords']) && empty($post['modules'])){
                unset($post['keywords']);
                unset($post['modules']);
                $data['status']=0;
                $data['msg']="暂无数据...";
                return json($data);
            }
            

            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
            
        }

        $count=Db::name('role_author')->where($where)->count();

        $list=Db::name('role_author')->page($page,$limit)->where($where)->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据...";
            return json($data);
        }
        
        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$list;
        
        return json_decode(json_encode($arr));

    }

    //添加权限资源
    public function role_resource_add()
    {
        $Author = new Author();
        $post = $this->request->param();

        if(isset($post['name'])){
            $post['name']=$post['name'].".php";
            $action=$Author->getAction('admin', $post['name']);
            
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
        
        $controller=$Author->getController('admin');
        foreach ($controller as $key => $value) {
            # code...
            $controller[$key]=basename($value,".php");

        }
        
        $group=Session::get('acl');
        //获取系统类别
        $system_sort=$this->get_system_sort();

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

            if($rows){
                $data['status']="1";
                $data['msg']="权限资源修改成功";
                $data['info']=$arr;
                return json($data);
            }else{
                $data['status']="0";
                $data['msg']="权限资源修改失败";
                $data['info']=$arr;
                return json($data);
            }
        }
        
        $rows=Db::name('role_author')->where('id',$id)->find();
        
        if($rows){
            $arr=explode("@", $rows['role_code']);
            
            foreach ($arr as $key => $value) {
                # code...
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
        
        $Author = new Author();
        $controller=$Author->getController('admin');
        foreach ($controller as $key => $value) {
            # code...
            $controller[$key]=basename($value,".php");

        }
        $group=Session::get('acl');
        //获取系统类别
        $system_sort=$this->get_system_sort();
        
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
                        $rest=Db::name('role_author')->where('id',$data['id'])->update(['is_available'=>0]);
                        if($rest){
                            $data['status']='1';
                            $data['msg']='数据删除成功！';
                            return json($data);
                        }else{
                            $data['status']='0';
                            $data['msg']='数据删除失败！';
                            return json($data);
                        }
                        
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
                    # code...
                    Db::startTrans();
                    try{

                        $role_group=Db::name('role_group')->select();
                        $acl="";
                        foreach ($role_group as $k => $v) {
                            # code...
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
                if($rows){
                    $data['status']="1";
                    $data['msg']="管理员添加成功";
                    return json($data);
                }else{
                    $data['status']="0";
                    $data['msg']="管理员添加失败";
                    return json($data);
                }
                
                
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
                    if($rest){
                        $data['status']='1';
                        $data['msg']='数据修改成功！';
                        return json($data);
                    }else{
                        $data['status']='0';
                        $data['msg']='数据修改失败！';
                        return json($data);
                    }
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
                    $rows=Db::name('admin')->where('id',$data['id'])->update($arr);
                    if($rows){
                        $data['status']="1";
                        $data['msg']="管理员修改成功";
                        return json($data);
                    }else{
                        $data['status']="0";
                        $data['msg']="管理员修改失败";
                        return json($data);
                    }
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
                        if($rest){
                            $data['status']='1';
                            $data['msg']='数据删除成功！';
                            return json($data);
                        }else{
                            $data['status']='0';
                            $data['msg']='数据删除失败！';
                            return json($data);
                        }    
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
    public function admin_role()
    {
    	return view('admin_role');
    }

    //角色信息查询
    public function admin_role_list()
    {
        $page=input("get.page")?input("get.page"):1;
        $page=intval($page);
        $limit=input("get.limit")?input("get.limit"):1;
        $limit=intval($limit);
        $limit=input('limit');

        $where=[];
        $where['is_available']=1;
        //判断搜索
        $post = $this->request->param();

        if(isset($post['keywords']) && isset($post['modules'])){

            if(empty($post['keywords']) && empty($post['modules'])){
                unset($post['keywords']);
                unset($post['modules']);
                $data['status']=0;
                $data['msg']="暂无数据...";
                return json($data);
            }

            if($post['modules']=="status"){
                if($post['keywords']=="已启用"){
                    $post['keywords']=1;
                }elseif($post['keywords']=="未启用"){
                    $post['keywords']=0;
                }else{
                   $data['status']=0;
                   $data['msg']="暂无数据...";
                   return json($data); 
                }
                
            }

            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
            
        }

        $count=Db::name('role_group')->where($where)->count();

        $list=Db::name('role_group')->page($page,$limit)->where($where)->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据...";
            return json($data);
        }
        
        foreach ($list as $key => $value) {
            # code...
            $count_admin=Db::name('admin')->where(['role_group_id'=>$value['id'],'is_available'=>1])->count();
            $list[$key]['count_admin']=$count_admin;

            if($value['status']=="0"){
                $list[$key]['status']="未启用";
            }else{
                $list[$key]['status']="已启用";
            }

        }

        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$list;
        
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
                    if($rest){
                        $data['status']='1';
                        $data['msg']='数据修改成功！';
                        return json($data);
                    }else{
                        $data['status']='0';
                        $data['msg']='数据修改失败！';
                        return json($data);
                    }
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

                    if($rows){
                        $data['status']="1";
                        $data['msg']="权限修改成功";
                        return json($data);
                    }else{
                        $data['status']="0";
                        $data['msg']="权限修改失败";
                        return json($data); 
                    }
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
            $system_sort=$this->get_system_sort($id);

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
        $system_sort=$this->get_system_sort($id);

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
                if($rows){
                    $data['status']="1";
                    $data['msg']="添加成功";
                    return json($data);
                }else{
                    $data['status']="0";
                    $data['msg']="添加失败";
                    return json($data);
                }
            }

        }else{

            //获取所有权限列表
            $acl=$this->get_acl($id="",$add=true);
            //获取系统类别
            $system_sort=$this->get_system_sort();

            $this->assign('acl',$acl);
            $this->assign('system_sort',$system_sort);
            return $this->fetch('role_add');
        }
    }

    /*
    *获取系统类别
    *@params $id:角色id
    */
    public function get_system_sort($id=""){
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
                       if($rest){

                           $data['status']='1';
                           $data['msg']='数据删除成功！';
                           return json($data);
                       }else{
                           $data['status']='0';
                           $data['msg']='数据删除失败！';
                           return json($data);
                       } 
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
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                if(!empty($data['name'])){
                    $rest=Db::name('admin')->where('id','<>',$data['id'])->select();
                    //检测用户名是否存在
                    foreach ($rest as $key => $value) {
                        # code...
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
                            $arr['img_url']=$data['img_url'];
                            
                            if(isset($data['multi_device'])){
                                $arr['multi_device']=$data['multi_device']=1;
                            }else{
                                $arr['multi_device']=0;
                            }
                            $rows=Db::name('admin')->where('id',$data['id'])->update($arr);
                            if($rows!==false){
                                $data['status']="1";
                                $data['msg']="修改成功,请重新登入！";
                                return json($data);
                            }else{
                                $data['status']="0";
                                $data['msg']="当前未做任何修改！";
                                return json($data);
                            }
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

    //管理员上传头像
    public function up_photos(){
        
        if(Request::instance()->isAjax()){
            $file=Request::instance()->file('file');
            $uploads=Uploads::uploads_img($file);
            return $uploads;
        }
    }

    //管理员的测评列表
    public function evaluation()
    {
        $where=[];
        $post = $this->request->param();
        $login=Session::get('login');
        //添加时间搜索
        if(isset($post['start']) and !empty($post['start']) and empty($post['end'])){
            $post['start']=strtotime($post['start']);
            $where['create_time'] = ['gt', $post['start']];

        }
        if(isset($post['end']) and !empty($post['end']) and empty($post['start'])){
            $post['end']=strtotime($post['end']);
            $where['create_time'] = ['lt', $post['end']];

        }
        if(isset($post['start']) and !empty($post['start']) and isset($post['end']) and !empty($post['end'])){
            $post['start']=strtotime($post['start']);
            $post['end']=strtotime($post['end']);
            $where['create_time'] = ['between', [$post['start'],$post['end']]];

        }

        //下拉选择搜索
        if (isset($post['modules']) and !empty($post['modules']) and !empty($post['keywords'])) {
           
            if($post['keywords']=="已审核"){
                $post['keywords']="1";
            }
            if($post['keywords']=="未审核"){
                $post['keywords']="0";
            }

            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
        }
        
        $count=Db::name('evaluation')->where($where)->count();
        //分页显示,每页5条数据
        //联合查询
        $deft=Db::name('evaluation')->alias('e')->order('e.id desc')->paginate(5)->each(function($item, $key){
                    $item['create_time'] = date('Y-m-d H:i:s',$item['create_time']);
                    return $item;});

        $search=Db::name('evaluation')->alias('e')->where($where)->order('e.id desc')->paginate(5,false,['query'=>$this->request->param()])->each(function($item, $key){
                    $item['create_time'] = date('Y-m-d H:i:s',$item['create_time']);
                    return $item;});
        //判断是否有搜索
        $rows = empty($where) ? $deft: $search;
        
        $page = $rows->render();
        $rows=$rows->toArray();

        $arr=array();
        foreach ($rows['data'] as $key => $value) {
            # code...
            $value['id']=base64_encode($value['id']);
            if(in_array($login['id'], explode("@", $value['pass_id']))){
              $value['mark_id']=$login['id'];
            }else{
                $value['mark_id']="";
            }
            array_push($arr, $value);
        }

        if(!empty($rows)){
            $this->assign('page', $page);
            $this->assign('count',$count);
            $this->assign('rows',$arr);
            $this->assign('login_id',$login['id']);
            
        }
        return $this->fetch('evaluation');
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
            
            $rest=Db::name('evaluation_info')->where('evaluation_id',$data['id'])->select();
            //获取最大的主键值
            $lastInsId=Db::name('evaluation_record')->max('id');
            $lastInsId=$lastInsId+1;
            $arr=array();
            $instarr=array();
            $login=Session::get('login');
            $count=count($rest);

            foreach ($rest as $key => $value) {
                # code...
                if($value['type']=="single"){
                    if(!isset($data['single_answer'. $value['id']])||$data['single_answer'. $value['id']]==null){
                        $data['single_answer'. $value['id']]="";
                    }
                    $arr['answer']=$value['answer'];
                    $arr['result']=$data['single_answer'. $value['id']];
                    if($arr['answer']==$arr['result']){
                        $arr['score']=$value['score'];
                    }else{
                        $arr['score']=0;
                    }
                    $arr['evaluation_id']=$data['id'];
                    $arr['evaluation_info_id']=$value['id'];
                    $arr['admin_id']=$login['id'];
                    $arr['type']=$value['type'];
                    $arr['record_id']=$lastInsId;
                    array_push($instarr, $arr);
                   
                }

                if($value['type']=="multi"){
                    if(!isset($data['multi_answer'. $value['id']])||$data['multi_answer'. $value['id']]==null){
                        $data['multi_answer'. $value['id']]="";
                        $arr['result']="";
                    }else{
                        $arr['result']=implode('_@', $data['multi_answer'. $value['id']]);
                    }
                    $arr['answer']=$value['answer'];
                    if($arr['answer']==$arr['result']){
                        $arr['score']=$value['score'];
                    }else{
                        $arr['score']=0;
                    }
                    $arr['evaluation_id']=$data['id'];
                    $arr['evaluation_info_id']=$value['id'];
                    $arr['admin_id']=$login['id'];
                    $arr['type']=$value['type'];
                    $arr['record_id']=$lastInsId;
                    array_push($instarr, $arr);
                    
                }

                if($value['type']=="recognized"){
                    if(!isset($data['recognized_answer'.$value['id']])||$data['recognized_answer'.$value['id']]==null){
                        $data['recognized_answer'.$value['id']]="";
                    }
                    $arr['answer']=$value['answer'];
                    $arr['result']=$data['recognized_answer'. $value['id']];
                    if($arr['answer']==$arr['result']){
                        $arr['score']=$value['score'];
                    }else{
                        $arr['score']=0;
                    }
                    $arr['evaluation_id']=$data['id'];
                    $arr['evaluation_info_id']=$value['id'];
                    $arr['admin_id']=$login['id'];
                    $arr['type']=$value['type'];
                    $arr['record_id']=$lastInsId;
                    array_push($instarr, $arr);
                    
                }
                //填空题评分
                if($value['type']=="fill"){
                    if(!isset($data['fill_answer'. $value['id']])||$data['fill_answer'. $value['id']]==null){
                        $data['fill_answer'. $value['id']]="";
                    }
                    $arr['answer']=$value['answer'];
                    $arr['result']=$data['fill_answer'. $value['id']];
                    //计算相似度获取分数
                    similar_text($arr['answer'], $arr['result'], $percent);

                    if($percent>90){
                        $arr['score']=$value['score'];
                    }else{
                        $arr['score']=round(($percent/100)*$value['score'],1);
                    }
                    
                    $arr['evaluation_id']=$data['id'];
                    $arr['evaluation_info_id']=$value['id'];
                    $arr['admin_id']=$login['id'];
                    $arr['type']=$value['type'];
                    $arr['record_id']=$lastInsId;
                    array_push($instarr, $arr);
                }

                //简答题评分
                if($value['type']=="short"){
                    if(!isset($data['short_answer'. $value['id']])||$data['short_answer'. $value['id']]==null){
                        $data['short_answer'. $value['id']]="";
                    }
                    $arr['answer']=$value['answer'];
                    $arr['result']=$data['short_answer'. $value['id']];
                    //计算相似度获取分数
                    similar_text($arr['answer'], $arr['result'], $percent);

                    if($percent>90){
                        $arr['score']=$value['score'];
                    }else{
                        $arr['score']=round(($percent/100)*$value['score'],1);
                    }
                    
                    $arr['evaluation_id']=$data['id'];
                    $arr['evaluation_info_id']=$value['id'];
                    $arr['admin_id']=$login['id'];
                    $arr['type']=$value['type'];
                    $arr['record_id']=$lastInsId;
                    array_push($instarr, $arr);
                }
                
            }
 
            $rows=Db::name('evaluation_answer')->insertAll($instarr);

            if($rows==$count){
                //获取分数
                $total_score=Db::name('evaluation')->where('id',$data['id'])->find();

                $score_arr=array();
                foreach ($instarr as $key => $value) {
                    # code...
                    array_push($score_arr, $value['score']);
                }
                $score=array_sum($score_arr);
                $score=round($score,1);//四舍五入保留一位小数计算分数
                
                // $score=Db::name('evaluation_answer')->where(array('record_id'=>$lastInsId,'admin_id'=>$login['id']))->sum('score');
                $pass=$total_score['total_score']*0.6;
                $insert_record['evaluation_id']=$data['id'];
                $insert_record['admin_id']=$login['id'];
                $insert_record['score']=$score;
                //判断是否通过测评
                if($score>=$pass){
                    $insert_record['pass']='1';

                    $in_pass_id=in_array($login['id'], explode("@", $total_score['pass_id']));
                    if(!$in_pass_id){
                        $pass_ids=$total_score['pass_id'].$login['id']."@";
                        $pass_id['pass_id']=$pass_ids;
                        //通过测评更新数据
                        $update_evaluation=Db::name('evaluation')->where('id',$data['id'])->update($pass_id);
                    }

                }else{

                    $insert_record['pass']='0';
                }
                
                $record=Db::name('evaluation_record')->insert($insert_record);
                
                if($record){
                    //清除Session，退出考试
                    Session::delete('stopIntval'.$login['id']);

                    $data['status']="1";
                    $data['msg']="恭喜您,交卷成功...<br>您的成绩为：".$score."分！";
                    return json($data);
                }else{
                    $data['status']="0";
                    $data['msg']="网络异常，请重试！";
                    return json($data);
                }
                
            }else{
                $data['status']="0";
                $data['msg']="网络异常，请重试！";
                return json($data);
            }
                
        }

        //正常显示答题页面
        $rest=$memcache->get('rest'.$id);

        if(!$rest){

            $rest=Db::name('evaluation')->where('id',$id)->find();
            $memcache->set('rest'.$id,$rest);
        }
        
        $rest['duration']=$rest['duration']*60;
        
        $rows=$memcache->get('rows'.$id);
        
        if(!$rows){

            $rows=Db::name('evaluation_info')->where('evaluation_id',$id)->order('id desc')->select();
            $memcache->set('rows'.$id,$rows);
        }

        //分组查询题型
        $count=$memcache->get('count'.$id);
        if(!$count){

            $count=Db::name('evaluation_info')->group('type')->order('id asc')->where('evaluation_id',$id)->select();
            $memcache->set('count'.$id,$count);
        }
        $info=$count;
        
        $single=$memcache->get('single'.$id);
        if(!$single){
            $single=Db::name('evaluation_info')->where(array('evaluation_id'=>$id,'type'=>'single'))->order('id desc')->select();
            $memcache->set('single'.$id,$single);
        }
        $single=$this->get_options($single);
        
        $multi=$memcache->get('multi'.$id);
        if(!$multi){
            $multi=Db::name('evaluation_info')->where(array('evaluation_id'=>$id,'type'=>'multi'))->order('id desc')->select();
            $memcache->set('multi'.$id,$multi);
        }
        $multi=$this->get_options($multi);

        $recognized=$memcache->get('recognized'.$id);
        if(!$recognized){
            $recognized=Db::name('evaluation_info')->where(array('evaluation_id'=>$id,'type'=>'recognized'))->order('id desc')->select();
            $memcache->set('recognized'.$id,$recognized);
        }
        $recognized=$this->get_options($recognized);
        
        $fill=$memcache->get('fill'.$id);
        if(!$fill){
            $fill=Db::name('evaluation_info')->where(array('evaluation_id'=>$id,'type'=>'fill'))->order('id desc')->select();
            $memcache->set('fill'.$id,$fill);
        }
        $fill=$this->get_options($fill);

        $short=$memcache->get('short'.$id);
        if(!$short){
            $short=Db::name('evaluation_info')->where(array('evaluation_id'=>$id,'type'=>'short'))->order('id desc')->select();
            $memcache->set('short'.$id,$short);
        }
        $short=$this->get_options($short);
        
        $this->assign('type',$count);
        $this->assign('info',$info);
        $this->assign('login',$login);
        $this->assign('login_id',$login['id']);
        $this->assign('single',$single);
        $this->assign('multi',$multi);
        $this->assign('recognized',$recognized);
        $this->assign('fill',$fill);
        $this->assign('short',$short);
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
        $count=Db::name('evaluation_answer')->where(['evaluation_id'=>$id,'admin_id'=>$login['id']])->group('record_id')->count();
        $rows=Db::name('evaluation_answer')->alias('a')->field('a.id aID,a.*,e.id eId,e.*')->join('evaluation e','a.evaluation_id=e.id','LEFT')->where(['evaluation_id'=>$id,'admin_id'=>$login['id']])->group('record_id')->select();
        foreach ($rows as $key => $value) {
            # code...
            $rows[$key]['id']=base64_encode($value['id']);
            $rows[$key]['record_id']=base64_encode($value['record_id']);
            $rows[$key]['admin_name']=$login['name'];
            $rows[$key]['total_number']=Db::name('evaluation_answer')->where(['evaluation_id'=>$id,'admin_id'=>$login['id']])->where('record_id',$value['record_id'])->count();
            $rows[$key]['fact_score']=Db::name('evaluation_answer')->where(['evaluation_id'=>$id,'admin_id'=>$login['id']])->where('record_id',$value['record_id'])->sum('score');
            if($rows[$key]['fact_score']/$rows[$key]['total_score']>=0.6){
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
        $rows=Db::name('evaluation_answer')->alias('ea')->field('ea.id eaId,ea.evaluation_id eaEvaluation_Id,ea.answer eaAnswer,ea.type eaType,ea.score eaScore,ea.*,ei.id eiId,ei.evaluation_id eiEvaluation_Id,ei.answer eiAnswer,ei.type eiType,ei.score eiScore,ei.*')->join('evaluation_info ei','ea.evaluation_info_id=ei.id','LEFT')->where(['ea.evaluation_id'=>$id,'admin_id'=>$login['id'],'record_id'=>$record_id])->select();
        $count=array();
        foreach ($rows as $key => $value) {
            # code...
            array_push($count, $value['eaScore']);
            $rows[$key]['id']=$key+1;
            if($value['type']=="single"){
                $rows[$key]['type']="单选题";
            }

            if($value['type']=="multi"){
                $rows[$key]['type']="多选题";
                $rows[$key]['eaAnswer']=str_replace("_@", "、", $value['eaAnswer']);
                $rows[$key]['result']=str_replace("_@", "、", $value['result']);
                
            }

            if($value['type']=="recognized"){
                $rows[$key]['type']="判断题";
                if($value['eaAnswer']=="1"){
                    $rows[$key]['eaAnswer']="错误";
                    $rows[$key]['result']="错误";
                }else{
                    $rows[$key]['eaAnswer']="正确";
                    $rows[$key]['result']="正确";
                }
            }

            if($value['type']=="fill"){
                $rows[$key]['type']="填空题";
            }

            if($value['type']=="short"){
                $rows[$key]['type']="简答题";
            }
        }

        $this->assign('count',round(array_sum($count),1));
        $this->assign('rows',$rows);
        return $this->fetch('evaluation_info');
    }


    public function get_options($arr)
    {
        foreach ($arr as $key => $value) {
            # code...
            if(is_array($value)){
                $arr[$key]['content']=$this->cutstr_html($arr[$key]['content']);

                $arr[$key]['answer']=$this->cutstr_html($arr[$key]['answer']);
                
                if(!empty($value['option'])){
                    $value['option']=$this->cutstr_html($value['option']);
                    
                    $arr[$key]['option']=explode("_@", $value['option']);

                    $i=65;
                    foreach ($arr[$key]['option'] as $k => $v) {
                        # code...
                        $Char=strtoupper(chr($i)).'. ';//输出大写字母
                        $arr[$key]['option'][$k]=$Char.$v."<br>";
                        if($i<91){
                            $i++;
                        }
                    }
                    // for($i=65;$i<91;$i++){
                    //     echo strtolower(chr($i)).' ';//输出小写字母
                    //     echo strtoupper(chr($i)).' ';//输出大写字母
                    // }
                }
            }
            
        }

        return $arr;
    }

    //去除空格和html标签
    public function cutstr_html($string)
    {  

        $string = strip_tags($string);  
        $string = trim($string);  
        // $string = preg_replace("/s/","",$string);  
        // $string = str_replace("rn", '', $string);
        // $string = str_replace("n", '', $string);

        return trim($string);  

    }

    //管理员操作日志记录
    public function admin_log()
    {
        return $this->fetch();
    }
    
    //管理员日志信息查询
    public function admin_log_list()
    {
        
        $page=input("get.page")?input("get.page"):1;
        $page=intval($page);
        $limit=input("get.limit")?input("get.limit"):1;
        $limit=intval($limit);
        $limit=input('limit');

        $where=[];
        $where['is_available']=1;
        //判断搜索
        $post = $this->request->param();

        if(isset($post['keywords']) && isset($post['modules'])){

            if(empty($post['keywords']) && empty($post['modules'])){
                unset($post['keywords']);
                unset($post['modules']);
                $data['status']=0;
                $data['msg']="暂无数据...";
                return json($data);
            }
            

            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
            
        }

        $count=Db::name('admin_log')->where($where)->count();

        $list=Db::name('admin_log')->alias('l')->field('a.name,l.id,l.operation,l.time,g.role_name')->join('admin a','l.admin_id=a.id','LEFT')->join('role_group g','a.role_group_id=g.id','LEFT')->page($page,$limit)->where('l.is_available',1)->select();
        foreach ($list as $key => $value) {
            # code...
            $list[$key]['time']=date('Y-m-d H:i:s',$value['time']);
        }
        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据...";
            return json($data);
        }
        
        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$list;
        
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
            $img_url="/uploads/".Session::get('login.img_url');
        }else{
            $img_url="/static/admin/images/face.jpg";
        }

        //好友列表
        $department=Db::name('department')->select();

        $admin=Db::name('admin')->field('id,name,img_url,online,department_id')->select();
        
        $list=array();

        foreach ($admin as $key => $value) {
            # code...
            $admin[$key]['username']=$value['name'];

            if($value['img_url']=='man.png' || $value['img_url']=='woman.png'){
                $admin[$key]['avatar']="/images/".$value['img_url'];
            }else{
                $admin[$key]['avatar']="/uploads/".$value['img_url'];
            }
            
            $admin[$key]['sign']="在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱";
            
            $admin[$key]['status']=$value['online']='online';

            unset($admin[$key]['name']);
        }

        foreach ($department as $key => $value) {
            # code...
            $list[$key]['groupname']=$value['name'];
            $list[$key]['id']=$value['id'];
            $list[$key]['list']=array();
            foreach ($admin as $k => $v) {
                # code...
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
