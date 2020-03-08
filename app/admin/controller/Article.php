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
use app\admin\model\Article as At;
use app\admin\model\Article_cate;

use app\admin\logic\ArticleLogic;

use app\admin\behavior\Behavior;
use app\admin\behavior\Files;

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


    //显示文章列表
    public function article_list()
    {
        return $this->fetch('article_list');
    }

    //获取文章信息
    public function article_list_info()
    {
        //判断搜索
        $post = $this->request->param();

        $info=ArticleLogic::select($post,'article');
        
        if(isset($info['list'])){
            foreach ($info['list'] as $key => $value) {
                
                if($value['status']=='0'){
                    $info['list'][$key]['status']="未送审";
                }elseif($value['status']=='1'){
                    $info['list'][$key]['status']="已送审";
                }elseif($value['status']=='2'){
                    $info['list'][$key]['status']="已审核";
                }elseif($value['status']=='3'){
                    $info['list'][$key]['status']="已驳回";
                }elseif($value['status']=='4'){
                    $info['list'][$key]['status']="已取回";
                }
                $info['list'][$key]['create_time']=date('Y-m-d H:i:s',$value['create_time']);
                $info['list'][$key]['content']=trim(strip_tags($value['content']));

                //查询分类
                $cate=Db::name('article_cate')->where('id='.$value['cate_id'])->find();
                $info['list'][$key]['cate']=$cate['name'];
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
    
    //添加文章信息
    public function article_add()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            
            if(!empty($data)){

                $arr['title']=$data['title'];
                $arr['desc']=$data['desc'];
                $arr['status']='0';
                $arr['create_time']=time();
                $arr['content']=trim($data['content']);
                $arr['owner']=Session::get('login.name');
                $arr['cate_id']=$data['cate_id'];

                $result = $this->validate($arr,'Article');
                if(true !== $result){
                    // 验证失败 输出错误信息
                    $data['msg']="参数错误";
                    $data['status']='0';
                    return json($data);
                }

                Files::thumb_image($data['img_url'],'article'.DS.date('Ymd'),$width=330,$height=200);

                $arr['img']='article'.DS.date('Ymd').DS.$data['img_url'];
                
                $rows=At::create($arr,true);//true排除掉表中不存在的字段
                
                return Behavior::return_info($rows);
                
            }else{
                $data['msg']="数据不能为空！";
                $data['status']='0';
                return json($data);
            }
        }else{

            $article_cate=Article_cate::all(['is_available'=>1]);

            $this->assign('article_cate',$article_cate);
            
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
                        $insert['create_time']=time();
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

                    //常规修改操作

                    $arr['title']=$data['title'];
                    $arr['desc']=$data['desc'];
                    $arr['content']=trim($data['content']);
                    $arr['cate_id']=$data['cate_id'];
                    $arr['img']=$data['img_url'];

                    if($rest['img']!=$data['img_url']){

                        Files::thumb_image($data['img_url'],dirname($rest['img']),$width=330,$height=200);

                        $arr['img']=dirname($rest['img']).DS.$data['img_url'];
                    }
                    
                    if($rest['status']!='0'){
                        $data['status']='0';
                        $data['msg']="文章已送审，不能进行修改...";
                        return json($data);
                    }

                    $rows=Db::name('article')->where('id',$rest['id'])->update($arr);

                    if($rows!==false){

                        Files::delete_img($rest['img']);

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

            $article_cate=Article_cate::all(['is_available'=>1]);

            $this->assign('article_cate',$article_cate);

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
                    
                    return Behavior::delete($rest['id'],'article');

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

    public function delete_all()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            
            if(!empty($data)){

                return Behavior::delete_all($data,'article');
            }
        }
    }

}
