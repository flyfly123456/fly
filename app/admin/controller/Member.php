<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Db;
use \think\Request;
use \think\Session;
use \think\Config;
use \think\Loader;

use app\admin\logic\MemberLogic;

use app\admin\behavior\Behavior;


class Member extends Base
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


    //会员列表信息
    public function member_list_info()
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

        $info=MemberLogic::select($post,'article');

        if(isset($info['list'])){
            foreach ($info['list'] as $key => $value) {

                $rest=Db::name('members_type')->where(['id'=>$value['type']])->find();

                $info['list'][$key]['type']=$rest['type'];

                $info['list'][$key]['create_time']=date('Y-m-d H:i:s',$value['create_time']);
                if($value['sex']==0){
                    $info['list'][$key]['sex']='男性';
                }elseif($value['sex']==1){
                    $info['list'][$key]['sex']='女性';
                }else{
                    $info['list'][$key]['sex']='保密';
                }

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

    //会员列表页面模板分配
    public function member_list()
    {
        return $this->fetch('member_list');
    }

    //添加会员
    public function member_add()
    {
        if(Request::instance()->isAjax()){

            $data=Request::instance()->post();

            if(empty($data)){
                $data['status']='0';
                $data['msg']='数据获取异常,请重试！';
                return json($data);
            }else{

                $result=Db::name('members_type')->where('id',$data['data']['type'])->find();
                if(!$result){
                    $data['status']='0';
                    $data['msg']='数据获取异常,请重试！';
                    return json($data);
                }

                $array=array(
                    'username'    =>  $data['data']['username'],
                    'sex'         =>  $data['data']['sex'],
                    'telephone'   =>  $data['data']['telephone'],
                    'email'       =>  $data['data']['email'],
                    'address'     =>  $data['data']['address'],
                    'type'        =>  $result['id'],
                    'password'    =>  $data['data']['password'],
                    'status'      =>  $data['data']['status'],
                    'create_time' =>  time()
                    );

                $rest=Db::name('members')->insert($array);
                if($rest){
                    $data['status']='1';
                    $data['msg']='数据插入成功！';
                    return json($data);
                }else{
                    $data['status']='0';
                    $data['msg']='数据异常,请重试！';
                    return json($data);
                }
            }

        }else{
            $rows=Db::name('members_type')->select();
            $this->assign('rows',$rows);
            return $this->fetch('member_add'); 
        }
        
    }


    //查看会员详细内容
    public function member_view()
    {
        $id=input('id');
        
        $rows=Db::name('members')->where(array('id'=>$id))->find();
        
        $rest=Db::name('members')->alias('m')->field('m.id mId,m.type mType, m.*,t.id tId,t.type tType')->join('members_type t',"m.type=t.id",'LEFT')->where('m.id',$rows['id'])->find();
        
        if($rows!=null && $rest!=null){
            $rest['create_time']=date('Y-m-d H:s:i',$rows['create_time']);
            
            $this->assign('members',$rest);
        }

        $type=Db::name('members_type')->select();
        
        $this->assign('type',$type);
        return $this->fetch('member_view');
    }

    //修改会员信息
    public function member_edit()
    {
        
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();

            if(isset($data['data']['create_time'])){
                $data['data']['create_time']=strtotime($data['data']['create_time']);
            }
            
            if(count($data)==3){//修改密码
                $rest=Db::name('members')->where('id',$data['id'])->setField($data['field'],$data['name']);
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
                $array=array();
                
                foreach ($data['data'] as $key => $value) {
                    $array[$key]=$value;
                }
                if($array['newpass']==""){
                    unset($array['newpass']);
                    $array['password']=$array['oldpass'];
                    unset($array['oldpass']);
                }else{
                    $array['password']=$array['newpass'];
                    unset($array['newpass']);
                    unset($array['oldpass']);
                }

                $rest=Db::name('members')->update($array);
                if($rest){
                    $data['status']='1';
                    $data['msg']='数据修改成功！';
                    return json($data);
                }else{
                    $data['status']='0';
                    $data['msg']='数据修改失败！';
                    return json($data);
                }
            }

        }else{

            $id=input('id');
            
            $rows=Db::name('members')->where(array('id'=>$id))->find();
            
            $rest=Db::name('members')->alias('m')->field('m.id mId,m.type mType, m.*,t.id tId,t.type tType')->join('members_type t',"m.type=t.id",'LEFT')->where('m.id',$rows['id'])->find();
            
            if($rows!=null && $rest!=null){
                $rest['create_time']=date('Y-m-d H:s:i',$rows['create_time']);
                
                $this->assign('members',$rest);
            }

            $type=Db::name('members_type')->select();
            
            $this->assign('type',$type);
            return view('member_edit'); 
        }
        
    }


    //修改会员密码
    public function member_password()
    {
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if(!empty($data)){
                $rest=Db::name('members')->where('id',$data['id'])->find();
                if($rest!=null){
                    $password=$rest['password'];

                    if($data['oldpass']==$password){

                        if($data['newpass']==$data['repass']){
                            $rows=Db::name('members')->where('id',$data['id'])->update(['password' => $data['newpass']]);
                            return json($rows);
                           if($rows){
                                $data['status']='1';
                                $data['msg']='密码修改成功!';
                                return json($data);
                           }else{
                                $data['status']='1';
                                $data['msg']='密码修改失败!';
                                return json($data);
                           }
                        }else{
                            $data['status']='0';
                            $data['msg']='两次密码不一致!';
                            return json($data);
                        }
                    }else{
                        $data['status']='0';
                        $data['msg']='原始密码有误!';
                        return json($data);
                    }
                    
                }
                return json($data);
            }

        }else{
            $id=input('id');
            $rest=Db::name('members')->where('id',$id)->select();
            foreach ($rest as $key => $value) {
               $rest=$value;
            }
            $this->assign('rest',$rest);
            $this->assign('id',$id);
            return view('member_password');  
        }
        
    }


    //删除单一会员
    public function delete_member_list()
    {
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            if($data!=""){
                if(intval($data['id'])>0){
                    $rest=Db::name('members')->where('id',$data['id'])->update(['is_available'=>0]);
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

    //批量删除会员
    public function delete_all(){
        if (Request::instance()->isAjax()){

            $data=Request::instance()->post();
            
            if($data!=""||!empty($data)){
                
                return Behavior::delete_all($data,'members');
                
            }else{
                $data['status']="0";
                $data['msg']="数据获取异常，请稍后再试！";
                return json($data);
            }

        } 
    }

    //导出会员数据
    public function export()
    {
        
        $member = Db::name('members')->select();     //数据库查询
        $path = dirname(__FILE__); //找到当前脚本所在路径

        vendor("PHPExcel.PHPExcel"); //方法一

        $PHPExcel = new \PHPExcel();
        $PHPSheet = $PHPExcel->getActiveSheet();
        $PHPSheet->setTitle("会员数据"); //给当前活动sheet设置名称
        $PHPSheet->setCellValue("A1", "ID")
            ->setCellValue("B1", "用户名")
            ->setCellValue("C1", "密码")
            ->setCellValue("D1", "性别")
            ->setCellValue("E1", "加入时间")
            ->setCellValue("F1", "类型")
            ->setCellValue("G1", "状态")
            ->setCellValue("H1", "E-mail")
            ->setCellValue("I1", "地址")
            ->setCellValue("J1", "电话");
        $i = 2;
        foreach($member as $data){
            $PHPSheet->setCellValue("A" . $i, $data['id'])
                ->setCellValue("B" . $i, $data['username'])
                ->setCellValue("C" . $i, $data['password'])
                ->setCellValue("D" . $i, $data['sex'])
                ->setCellValue("E" . $i, date("Y-m-d H:i:s",$data['create_time']))
                ->setCellValue("F" . $i, $data['type'])
                ->setCellValue("G" . $i, $data['status'])
                ->setCellValue("H" . $i, $data['email'])
                ->setCellValue("I" . $i, $data['address'])
                ->setCellValue("J" . $i, $data['telephone']);
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


    //会员类型显示
    public function member_type()
    {
        $where=[];
        $count=Db::name('members_type')->count();
        //分页显示,每页5条数据
        $rows=Db::name('members_type')->order('id asc')->paginate(5,false,['query'=>$this->request->param()]);
        $rows = empty($where) ? Db::name('members_type')->order('id desc')->paginate(5): Db::name('members_type')->where($where)->order('id desc')->paginate(5,false,['query'=>$this->request->param()]);
        $page = $rows->render();
        
        if(!empty($rows)){
            
            $this->assign('page', $page);
            $this->assign('count_type',$count);
            $this->assign('type',$rows);
        }
        return view('member_type');
    }


    //添加会员类型
    public function type_add()
    {
        if (Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                if($data['id']!=""){
                    $rows=Db::name('members_type')->update($data);
                    if($rows){
                        $data['status']="1";
                        $data['msg']="会员类型修改成功！";
                        return json($data);
                    }else{
                        $data['status']="0";
                        $data['msg']="数据修改失败，请重试！";
                        return json($data);
                    }
                }else{
                    $arr['type']=$data['type'];
                    $rows=Db::name('members_type')->insert($arr);
                    if($rows){
                        $data['status']="1";
                        $data['msg']="会员类型添加成功！";
                        return json($data);
                    }else{
                        $data['status']="0";
                        $data['msg']="数据插入失败，请重试！";
                        return json($data);
                    }
                }
                
            }else{
                $data['status']="0";
                $data['msg']="获取数据失败，请稍后再试！";
                return json($data);
            }

        }else{
            $id=input('id');
            if($id){
                $rows=Db::name('members_type')->where('id',$id)->find();
                if(!$rows){
                    $data['status']="0";
                    $data['msg']="获取数据失败，请稍后再试！";
                    return json($data);
                }else{
                    $this->assign('rows',$rows);
                }
            }
            
            return view('type_add');
            
        }
        
    }


    //删除会员类型
    public function type_delete()
    {
        if (Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                $arr['id']=$data['id'];
                $rows=Db::name('members_type')->delete($arr);
                if($rows){
                    $data['status']="1";
                    $data['msg']="会员类型删除成功！";
                    return json($data);
                }else{
                    $data['status']="0";
                    $data['msg']="数据删除失败，请重试！";
                    return json($data);
                }
            }
        }
    }


}
