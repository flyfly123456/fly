<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Session;
use app\admin\model\Delete;

class Todolist extends Base
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

    //待办事项模板显示
    public function todo_list()
    {
        return $this->fetch('todo_list');
    }

    //代办事项信息查询
    public function todo_list_info()
    {
        $page=input("get.page")?input("get.page"):1;
        $page=intval($page);
        $limit=input("get.limit")?input("get.limit"):1;
        $limit=intval($limit);
        $limit=input('limit');

        $where=[];

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

        $count=Db::name('todo_list')->where('status !=2 AND is_available =1')->where('sponsor|approve','=',Session::get('login.name'))->where($where)->count();
        
        $list=Db::name('todo_list')->page($page,$limit)->where('status !=2 AND is_available =1')->where('sponsor|approve','=',Session::get('login.name'))->where($where)->order('id desc')->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据...";
            return json($data);
        }
        foreach ($list as $key => $value) {
            # code...
            $list[$key]['time']=date('Y-m-d H:i:s',$value['time']);

            if($value['status']=='0'){
                $list[$key]['status']="待审核";
            }elseif($value['status']=='1'){
                $list[$key]['status']="已取回";
            }elseif($value['status']=='2'){
                $list[$key]['status']="已审核";
            }else{
                $list[$key]['status']="已驳回";
            }
        }
        
        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$list;
        
        return json_decode(json_encode($arr));
    }

    //已办事项
    public function todone_list()
    {
        return $this->fetch('todone_list');
    }

    //已办事项信息查询
    public function todone_list_info()
    {
        $page=input("get.page")?input("get.page"):1;
        $page=intval($page);
        $limit=input("get.limit")?input("get.limit"):1;
        $limit=intval($limit);
        $limit=input('limit');

        $where=[];
        $where['is_available']=1;
        $where['status']=2;
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
                if($post['keywords']=="已驳回"){
                    $post['keywords']=3;
                }elseif($post['keywords']=="已审核"){
                    $post['keywords']=2;
                }elseif($post['keywords']=="已取回"){
                    $post['keywords']=1;
                }else{
                    $data['status']=0;
                    $data['msg']="暂无数据！";
                    return json($data);
                }
            
            }
            
            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
            
        }

        $count=Db::name('todo_list')->where('sponsor|approve','=',Session::get('login.name'))->where($where)->count();

        $list=Db::name('todo_list')->page($page,$limit)->where('sponsor|approve','=',Session::get('login.name'))->where($where)->order('id desc')->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据...";
            return json($data);
        }
        foreach ($list as $key => $value) {
            # code...
            $list[$key]['time']=date('Y-m-d H:i:s',$value['time']);

            if($value['status']=='0'){
                $list[$key]['status']="待审核";
            }elseif($value['status']=='1'){
                $list[$key]['status']="已取回";
            }elseif($value['status']=='2'){
                $list[$key]['status']="已审核";
            }else{
                $list[$key]['status']="已驳回";
            }
        }
        
        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$list;
        
        return json_decode(json_encode($arr));
    }

    //送审
    public function approve_edit()
    {
        $post = $this->request->param();

        if(isset($post['id']) && isset($post['name']) && isset($post['approve'])){
            //开启事务
            Db::startTrans();
            try{

                //送审操作
                $rest=Db::name($post['name'])->where('id',$post['id'])->find();

                if($rest['status']!='0'){
                    //  抛出异常
                    throw new \Exception("已经送审或者审核的事项，不能重复送审...");
                }
                //更改原始数据状态
                $rows=Db::name($post['name'])->where('id',$post['id'])->update(['status'=>'1']);

                //插入待办事项数据
                $insert['name']="待办事项：".$rest['title'];
                $insert['todo_list_id']=$rest['id'];
                $insert['sponsor']=Session::get('login.name');
                $insert['approve']=$post['approve'];
                $insert['type']=$post['name'];
                if(isset($post['remark'])){
                    $insert['remark']=$post['remark'];
                }
                $insert['time']=time();
                $insert['status']='0';
                $result=Db::name('todo_list')->insert($insert);

                if(!$rows || !$result){
                    //  抛出异常
                    throw new \Exception("送审失败...");

                }else{
                    // 提交事务
                    Db::commit();
                    $data['status']='1';
                    $data['msg']="送审成功！";
                    return json($data);  
                }
                
            }catch(\Exception $e){
                // 回滚事务
                Db::rollback();
                $data['status']="0";
                $data['msg']=$e->getMessage();
                return json($data);
            }

        }
    }

    //审批或者驳回操作
    public function approve_receive()
    {
        $post = $this->request->param();

        if(isset($post['id'])){

            //驳回
            if(isset($post['back_reason']) && isset($post['reject'])){

                $arr['status']=3;
                $array['status']=3;
                $arr['back_reason']=$post['back_reason'];
            }else{

                //审批
                $arr['status']=2;
                $array['status']=2;
                $arr['back_reason']='审批内容符合要求...';

            }

            //开启事务
            Db::startTrans();
            try{
                //判断是否处于待办事项状态
                $info=Db::name('todo_list')->where('id',$post['id'])->find();
                //审批补卡申请
                if($info['type']=='apply_clock' && $arr['status']==2){
                    //获取插入考勤表数据
                    $apply_clock=Db::name('apply_clock')->where('id',$info['todo_list_id'])->find();
                    if(!$apply_clock){
                        //  抛出异常
                        throw new \Exception("数据异常，法进行操作...");
                    }
                    //时间间隔
                    $start_intval=60*60*9;
                    $end_intval=60*60*18;

                    $attend['admin_id']=$apply_clock['admin_id'];
                    $attend['admin_id']=$apply_clock['admin_id'];
                    $attend['dates']=$apply_clock['dates'];
                    $attend['department_id']=$apply_clock['department_id'];
                    $attend['start']=$apply_clock['dates']+$start_intval;
                    $attend['end']=$apply_clock['dates']+$end_intval;

                    $update_attend['start']=$apply_clock['dates']+$start_intval;
                    $update_attend['end']=$apply_clock['dates']+$end_intval;
                    
                    //先判断当天是否打卡
                    $find_attendance=Db::name('attendance')->where(['admin_id'=>$attend['admin_id'],'dates'=>$attend['dates']])->find();

                    if($find_attendance){
                        $update_attendance=Db::name('attendance')->where('id',$find_attendance['id'])->update($update_attend);
                        if(!$update_attendance){
                            //  抛出异常
                            throw new \Exception("操作失败，请稍后再试...");
                        }
                    }else{
                        //插入考勤表数据
                        $attendance=Db::name('attendance')->insert($attend);

                        if(!$attendance){
                            //  抛出异常
                            throw new \Exception("操作失败，请稍后再试...");
                        }
                    }
                    
                }
                if($info['status']!='0'){

                    //  抛出异常
                    throw new \Exception("待办事项不是待审核状态无法进行操作...");
                }

                //只能是审批人才能审核操作
                if($info['approve']!=Session::get('login.name')){

                    //  抛出异常
                    throw new \Exception("暂无权限进行操作...");
                }

                //改变待审核的原始数据状态
                $original=Db::name($info['type'])->where('id',$info['todo_list_id'])->update($array);

                //改变待办事项数据状态
                $rows=Db::name('todo_list')->where('id',$post['id'])->update($arr);

                if(!$rows || !$original){
                    //  抛出异常
                    throw new \Exception("操作失败...");

                }else{
                    // 提交事务
                    Db::commit();
                    $data['status']='1';
                    $data['msg']="操作成功！";
                    return json($data);  
                }
                
            }catch(\Exception $e){
                // 回滚事务
                Db::rollback();
                $data['status']="0";
                $data['msg']=$e->getMessage();
                return json($data);
            }

        }
    }

    //取回操作
    public function approve_back()
    {
        $post = $this->request->param();
        if(isset($post['id']) && isset($post['back']) && isset($post['type'])){
            $where['todo_list_id']=$post['id'];
            $where['type']=$post['type'];
            $where['sponsor']=Session::get('login.name');
            $where['name']='待办事项：'.$post['back'];
            $where['is_available']='1';
            $where['status']='0';
            //开启事务
            Db::startTrans();
            try{

                $rows=Db::name('todo_list')->where($where)->find();
                //更改回送审的数据状态
                $arr['status']='1';
                $back=Db::name('todo_list')->where('id',$rows['id'])->update($arr);

                //更改原始数据
                $change=Db::name($post['type'])->where('id',$post['id'])->update(['status'=>'4']);

                if(!$rows || !$back || !$change){
                    //  抛出异常
                    throw new \Exception("未送审或者已签收的事项无法取回...");

                }else{
                    // 提交事务
                    Db::commit();
                    $data['msg']="取回成功...";
                    $data['status']='1';
                    return json($data);
                }
                
            }catch(\Exception $e){
                // 回滚事务
                Db::rollback();
                $data['status']="0";
                $data['msg']=$e->getMessage();
                return json($data);
            }
            
        }
    }

    //重新送审
    public function again_approval()
    {
        $post = $this->request->param();
        if(isset($post['info'])){
            $post['info']=json_decode($post['info'],true);
            //开启事务
            Db::startTrans();
            try{

                $arr['status']='0';

                foreach ($post['info'] as $key => $value) {

                    $again=[];
                    $change=[];

                    $rows=Db::name('todo_list')->where('id',$value['id'])->find();
                    if($rows['status']=='0'){
                        continue;

                    }

                    $again=Db::name('todo_list')->where('id',$value['id'])->update($arr);
                    //更改原始数据状态
                    $change=Db::name($value['type'])->where('id',$value['todo_list_id'])->update(['status'=>'1']);
                }

                if(!$rows || !$again || !$change){
                    //  抛出异常
                    throw new \Exception("操作失败，请稍后再试...");

                }else{
                    // 提交事务
                    Db::commit();
                    $data['msg']="操作成功...";
                    $data['status']='1';
                    return json($data);
                }
                
            }catch(\Exception $e){
                // 回滚事务
                Db::rollback();
                $data['status']="0";
                $data['msg']=$e->getMessage();
                return json($data);
            }
            
        }
    }

    //选择审批人
    public function select_approve($id,$name)
    {
        $admin=Db::name('admin')->where('is_available',1)->select();
        $this->assign('admin',$admin);
        $this->assign('id',$id);
        $this->assign('name',$name);

        return $this->fetch('approve');
    }

}
