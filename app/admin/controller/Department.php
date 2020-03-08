<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Session;

class Department extends Base
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

    public function department_list()
    {
        return $this->fetch('department_list');
    }

    public function department_info()
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

    	$count=Db::name('department')->where($where)->count();

    	$list=Db::name('department')->page($page,$limit)->where($where)->select();

    	if(empty($list)){
    	    $data['status']=0;
    	    $data['msg']="暂无数据...";
    	    return json($data);
    	}
    	
    	foreach ($list as $key => $value) {
    	    # code...
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


    public function department_add()
    {
    	if(Request::instance()->isAjax()){
    	    $data=Request::instance()->post();
    	    if(!empty($data)){
    	    	$arr['name']=$data['name'];
                $result = $this->validate($arr,'Department');
                if(true !== $result){
                    // 验证失败 输出错误信息
                    $data['status']="0";
                    $data['msg']="参数错误";
                    return json($data);
                }
                $rest=Db::name('department')->where('name',$data['name'])->select();
    	    	if($rest){
                    $data['status']="0";
                    $data['msg']="部门已经存在！";
                    return json($data);
                }else{
                    $arr['status']=$data['status'];
                    $arr['is_available']=1;
                    $rows=Db::name('department')->insert($arr);
                    if($rows){
                        $data['status']="1";
                        $data['msg']="部门添加成功！";
                        return json($data);
                    }else{
                        $data['status']="0";
                        $data['msg']="部门添加失败！";
                        return json($data);
                    } 
                }
                
    	    }
    	}

    	return $this->fetch('department_add');
    }


    public function department_edit()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                $arr['id']=$data['id'];
                if(isset($data['name'])){
                    $arr['name']=$data['name'];
                    $result = $this->validate($arr,'Department');
                    if(true !== $result){
                        // 验证失败 输出错误信息
                        $data['status']="0";
                        $data['msg']="参数错误";
                        return json($data);
                    }
                    $rest=Db::name('department')->where('name',$data['name'])->select();
                    if($rest){
                        $data['status']="0";
                        $data['msg']="部门名称已经存在！";
                        return json($data);
                    }
                    $arr['status']=$data['status'];
                }else{
                    $arr['status']=$data['status'];
                }
                $arr['is_available']=1;
                $rows=Db::name('department')->where('id',$arr['id'])->update($arr);
                if($rows){
                    $data['status']="1";
                    $data['msg']="部门修改成功！";
                    return json($data);
                }else{
                    $data['status']="0";
                    $data['msg']="部门修改失败！";
                    return json($data);
                }
            }
        }
        $id=input('id');
        $rows=Db::name('department')->where('id',$id)->find();
        $this->assign('rows',$rows);
        $this->assign('id',$id);
        return $this->fetch('department_edit');
    }

    public function delete_department()
    {
        if (Request::instance()->isAjax()){
            $data=Request::instance()->post();
            if(!empty($data)){
                $rows=Db::name('staff')->where('department_id',$data['id'])->select();
                $admin=Db::name('admin')->where('department_id',$data['id'])->select();
                if($rows || $admin){
                    $data['status']='0';
                    $data['msg']='删除失败，请先移除该部门所属的所有员工！';
                    return json($data);
                }else{
                    $rest=Db::name('department')->where('id',$data['id'])->update(['is_available'=>0]);
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
