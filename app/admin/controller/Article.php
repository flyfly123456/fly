<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Session;
use \think\Captcha;
use \think\Cookie;
use \think\Loader;
use \think\Config;

class Article extends Base
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

    
    public function index()
    {
        $where=[];
        $post = $this->request->param();
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
        if (isset($post['modules']) and !empty($post['modules']) and !empty($post['keywords'])) {
            if($post['keywords']=="未审核"){
                $post['keywords']="0";
            }
            if($post['keywords']=="已审核"){
                $post['keywords']="1";
            }
            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
        }

        $count=Db::name('article')->where($where)->group('id')->count();

        $deft=Db::name('article')->order('id desc')->paginate(5)->each(function($item, $key){$item['create_time'] = date('Y-m-d H:i:s',$item['create_time']);return $item;});
                
        $search=Db::name('article')->where($where)->order('id desc')->paginate(5,false,['query'=>$this->request->param()])->each(function($item, $key){$item['create_time'] = date('Y-m-d H:i:s',$item['create_time']);return $item;});
        //判断是否有搜索
        $rows = empty($where) ? $deft: $search;
        
        $page = $rows->render();
        $rows=$rows->toArray();
        if(!empty($rows)){
            $this->assign('page', $page);
            $this->assign('count',$count);
            $this->assign('rows',$rows['data']);
            
        }
        return $this->fetch('index');
    }

    //显示文章列表
    public function article_list()
    {
        return $this->fetch('article_list');
    }

    //获取文章信息
    public function article_list_info()
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
                    return json($data);
                }
            
            }

            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
            
        }

        $count=Db::name('article')->where($where)->count();

        $list=Db::name('article')->page($page,$limit)->where($where)->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据...";
            return json($data);
        }

        foreach ($list as $key => $value) {
            # code...
            if($value['status']=='0'){
                $list[$key]['status']="未送审";
            }elseif($value['status']=='1'){
                $list[$key]['status']="已送审";
            }elseif($value['status']=='2'){
                $list[$key]['status']="已审核";
            }elseif($value['status']=='3'){
                $list[$key]['status']="已驳回";
            }elseif($value['status']=='4'){
                $list[$key]['status']="已取回";
            }
            $list[$key]['create_time']=date('Y-m-d H:i:s',$value['create_time']);
            $list[$key]['content']=trim(strip_tags($value['content']));
        }
        
        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$list;
        
        return json_decode(json_encode($arr));
    }
    
    //添加文章信息
    public function article_add()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            
            if(!empty($data)){
                $data['status']='0';
                $data['create_time']=time();
                $data['content']=trim(strip_tags($data['content']));
                $data['owner']=Session::get('login.name');
                $result = $this->validate($data,'Article');
                if(true !== $result){
                    // 验证失败 输出错误信息
                    $data['msg']="参数错误";
                    $data['status']='0';
                    return json($data);
                }
                $rows=Db::name('article')->insert($data);
                if($rows){
                    $data['msg']="添加成功！";
                    $data['status']='1';
                    return json($data);
                }else{
                   $data['msg']="数据插入失败！";
                   $data['status']='0';
                   return json($data); 
                }
                
            }else{
                $data['msg']="数据不能为空！";
                $data['status']='0';
                return json($data);
            }
        }else{
           return view('article_add');
        }
    	
    }

    //文章编辑包括正常修改、送审、取回(只有超级管理员和自己才有权限修改、送审和取回自己添加文章，超级管理员对所有文章具有权限)
    public function article_edit()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            
            if(!empty($data)){

                $rest=Db::name('article')->where('id',$data['id'])->find();
                if($rest['owner']!=Session::get('login.name') && Session::get('acl_list')!='all'){
                    $data['status']='0';
                    $data['msg']="暂无权限操作其他人拥有的文章...";
                    return json($data);
                }
                if(isset($data['id']) && isset($data['approve']) && !isset($data['back']) && !isset($data['title']) && !isset($data['desc']) && !isset($data['content']) && !isset($data['status'])){

                    if($rest['status']=='1' || $rest['status']=='2'){

                        $data['status']='0';
                        $data['msg']="文章已被签收，无法进行送审...";
                        return json($data);
                    }else{
                        //文章送审操作
                        $rows=Db::name('article')->where('id',$rest['id'])->update(['status'=>'1']);

                        //插入待办事项数据
                        $insert['name']="文章待办事项：".$rest['title'];
                        $insert['todo_list_id']=$rest['id'];
                        $insert['sponsor']=Session::get('login.name');
                        $insert['approve']=$data['approve'];
                        $insert['type']="article";
                        $insert['time']=time();
                        $insert['status']='0';
                        $rest=Db::name('todo_list')->insert($insert);

                        if($rows && $rest){
                            $data['status']='1';
                            $data['msg']="文章送审成功！";
                            return json($data);
                        }else{
                            $data['status']='0';
                            $data['msg']="文章送审失败！";
                            return json($data);
                        }
                    }
                }elseif(isset($data['back'])){
                    if($rest['status']=='0' || $rest['status']=='2' || $rest['status']=='3'){
                        $data['status']='0';
                        $data['msg']="文章已经被签收，无法进行取回操作...";
                        return json($data);
                    }else{
                        //文章取回操作
                        $rows=Db::name('article')->where('id',$rest['id'])->update(['status'=>'0']);

                        //插入待办事项数据
                        $todo['todo_list_id']=$rest['id'];
                        $todo['name']="文章待办事项：".$rest['title'];
                        $todo['type']="article";
                        $todo['status']='0';

                        $back=Db::name('todo_list')->where($todo)->update(['status'=>'1']);

                        if($rows && $back){
                            $data['status']='1';
                            $data['msg']="文章取回成功！";
                            return json($data);
                        }else{
                            $data['status']='0';
                            $data['msg']="文章取回失败！";
                            return json($data);
                        }
                    }
                }else{
                    $arr['title']=$data['title'];
                    $arr['desc']=$data['desc'];
                    $arr['content']=trim(strip_tags($data['content']));
                    if($rest['status']!='0'){
                        $data['status']='0';
                        $data['msg']="文章已送审，不能进行修改...";
                        return json($data);
                    }
                    $rows=Db::name('article')->where('id',$rest['id'])->update($arr);

                    if($rows){
                        $data['msg']="修改成功！";
                        $data['status']='1';
                        return json($data);
                    }else{
                       $data['msg']="数据修改失败！";
                       $data['status']='0';
                       return json($data); 
                    }
                }
            }else{
                $data['msg']="数据不存在！";
                $data['status']='0';
                return json($data); 
            }
        }else{

            $id=input('id');
            $rows=Db::name('article')->where('id',$id)->find();
            if($rows){
                $this->assign('rows',$rows);
            }
            return $this->fetch('article_edit');
        }
        
    }

    //删除文章信息
    public function article_delete()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            
            if(!empty($data)){
                $rest=Db::name('article')->where('id',$data['id'])->find();
                if($rest['status']=='0'){
                    $rows=Db::name('article')->where('id',$data['id'])->delete();
                    if($rows){
                        $data['msg']="删除成功！";
                        $data['status']='1';
                        return json($data); 
                    }else{
                        $data['msg']="删除失败！";
                        $data['status']='0';
                        return json($data);
                    }

                }else{
                   $data['msg']="已审核文章不能删除！";
                   $data['status']='0';
                   return json($data); 
                }
            }else{
                $data['msg']="数据错误！";
                $data['status']='0';
                return json($data);
            }
        }else{
            $data['msg']="暂无数据！";
            $data['status']='0';
            return json($data);  
        }
    }

    //审核或者驳回待办事项
    public function article_toggle(){
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            
            if(!empty($data)){
                $rows=Db::name('todo_list')->where('id',$data['id'])->find();
                if(isset($data['reject'])){
                    //驳回操作
                    $arr['status']='3';
                    $arr['back_reason']=$data['back_reason'];
                }else{
                    $arr['status']='2'; 
                }

                if($rows['status']!='0'){
                    $data['status']='0';
                    $data['msg']="数据已经审核，不能重复操作...";
                    return json($data);
                }else{
                    $rest=Db::name('todo_list')->where('id',$data['id'])->update($arr);
                    $result=Db::name($rows['type'])->where('id',$rows['todo_list_id'])->update(['status'=>$arr['status']]);
                    if($rest && $result){
                        $data['status']='1';
                        $data['msg']="操作成功！";
                        return json($data);
                    }else{
                        $data['status']='1';
                        $data['msg']="操作失败，请重试！";
                        return json($data);
                    }
                }
                
            }else{
                $data['msg']="数据获取失败！";
                $data['status']='0';
                return json($data);
            }
        }else{
            $data['msg']="暂无数据！";
            $data['status']='0';
            return json($data);
        }
    }

    
}
