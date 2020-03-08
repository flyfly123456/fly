<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Session;
use app\admin\model\Wechat as WechatModel;

class Wechat extends Base
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

    //微信基本信息配置
    public function base_config()
    {
    	$rest=Db::name('wechat_config')->where('id',1)->find();
        $memcache=new \Memcache();
        $memcache->connect('127.0.0.1',11211) or die('Count not connect...');
        $memcache->set('wechat_config',$rest);

    	$post = $this->request->param();

    	if(isset($post['id']) && isset($post['name']) && isset($post['appid']) && isset($post['appsecret']) && isset($post['token'])){

    		if($rest['name']==$post['name'] && $rest['appid']==$post['appid'] && $rest['appsecret']==$post['appsecret'] && $rest['token']==$post['token'] && $rest['remark']==$post['remark']){
    			$data['status']='0';
    			$data['msg']='当前未做任何改变！';
    			return json($data);
    		}
            $arr['name']=$post['name'];
    		$arr['appid']=$post['appid'];
    		$arr['appsecret']=$post['appsecret'];
    		$arr['token']=$post['token'];
    		$arr['remark']=$post['remark'];

    		if($post['id']==null || $post['id']==""){
    			$rows=Db::name('wechat_config')->insert($arr);
    		}else{
    			$rows=Db::name('wechat_config')->where('id',$post['id'])->update($arr);
    		}
    		if($rows){
    			$data['status']='1';
    			$data['msg']='配置成功！';
    			return json($data);
    		}else{
    			$data['status']='0';
    			$data['msg']='配置失败！';
    			return json($data);
    		}
    	}
    	
    	$this->assign('rest',$rest);
    	return $this->fetch('base_config');
    }

    //获取access_token
    public function get_access_token()
    {
    	$WechatModel= new WechatModel('wx5160cc8aaad9a9ec','67be8d9aae3492d6496c2ae11c782531');
    	$get_access_token=$WechatModel->get_access_token();
    	echo "<pre>";
    	    print_r($get_access_token);
    	echo "</pre>";
    	exit;
    }

    //创建查看微信菜单
    public function menu_custom()
    {
        $post = $this->request->param();
        $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
        $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);

        if(isset($post['menu'])){
            $menu=json_decode($post['menu'],true);

            $jsonmenu=json_encode($menu['menu'],JSON_UNESCAPED_UNICODE);//JSON_UNESCAPED_UNICODE处理中文字符乱码
            
            $wxmenu=$WechatModel->management_wxmenu($jsonmenu,'create');
            if($wxmenu==0){
                $data['status']='1';
                $data['msg']='菜单创建成功...';
                return json($data);
            }else{
                $data['status']='0';
                $data['msg']=$wxmenu;
                return json($data);
            }
            
        }

        $jsonmenu=json_encode($WechatModel->management_wxmenu(),JSON_UNESCAPED_UNICODE);

        Session::set('jsonmenu',$jsonmenu);
        
        $this->assign('wechat_config',$wechat_config);
        return $this->fetch('menu_custom');
    }


    //拉取微信粉丝列表
    public function fans_list()
    {
    	$post = $this->request->param();

    	if(isset($post['pull'])){
    		$memcache=new \Memcache();
            $memcache->connect('127.0.0.1',11211) or die('Count not connect...');
            $wechat_config=$memcache->get('wechat_config');
            if($wechat_config==null){
                $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
                if(!$wechat_config){
                    $data['status']='0';
                    $data['msg']='拉取列表失败，请先设置微信基础配置...';
                    return json($data);
                }else{
                    $memcache->set('wechat_config',$wechat_config);
                }
            }

    		$WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);

    		$get_users_list=$WechatModel->get_users_list();
    		
    		foreach ($get_users_list['user_info_list'] as $key => $value) {
    			# code...
    			foreach ($value as $k => $v) {
    				# code...
    				if(!is_array($v)){
    					if($v===""){
    						unset($get_users_list['user_info_list'][$key][$k]);
    					}
    				}else{
    					unset($get_users_list['user_info_list'][$key][$k]);
    				}
    				unset($get_users_list['user_info_list'][$key]['groupid']);
    				unset($get_users_list['user_info_list'][$key]['qr_scene']);
    			}
    			
    		}

    		//拉取微信粉丝列表
    		$rows=Db::name('wechat_fans')->select();

    		if(empty($rows)){

    			$rest=Db::name('wechat_fans')->insertAll($get_users_list['user_info_list']);

    			if($rest){
    				$data['status']='1';
    				$data['msg']='拉取列表成功...';
    				return json($data);
    			}else{
    				$data['status']='0';
    				$data['msg']='拉取列表失败，请重试...';
    				return json($data);
    			}
    			
    		}else{
    			//思路：先将数据库中的数据查询出来进行缓存，清空数据库表，将拉取的数据批量插入到数据库中
    			$memcache=new \Memcache();
    			$memcache->connect('127.0.0.1',11211) or die('Count not connect...');
    			$memcache->set('fans_list',$rows);

                Db::startTrans();
                try{
                    Db::query('truncate table wechat_fans');

                    $rest=Db::name('wechat_fans')->insertAll($get_users_list['user_info_list']);
                    if(!$rest){
                        throw new \Exception("拉取列表失败，请重试...");
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

    			if($rest){
    				$data['status']='1';
    				$data['msg']='拉取列表成功...';
    				return json($data);
    			}else{
    				$data['status']='0';
    				$data['msg']='拉取列表失败，请重试...';
    				return json($data);
    			}
    			
    		}

    	}

        return $this->fetch('fans_list');
    }

    public function fans_list_info()
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

    	$count=Db::name('wechat_fans')->where($where)->count();

    	$list=Db::name('wechat_fans')->page($page,$limit)->where($where)->select();

    	if(empty($list)){
    	    $data['status']=0;
    	    $data['msg']="暂无数据...";
    	    return json($data);
    	}
    	foreach ($list as $key => $value) {
    		# code...
    		$list[$key]['subscribe_time']=date('Y-m-d H:i:s',$value['subscribe_time']);
    		if($value['subscribe']==1){
    			$list[$key]['subscribe']="已关注";
    		}else{
    			$list[$key]['subscribe']="未关注";
    		}

    		if($value['sex']==1){
    			$list[$key]['sex']="男";
    		}else{
    			$list[$key]['sex']="女";
    		}

    		if($value['subscribe_scene']=='ADD_SCENE_SEARCH'){
    			# code...
    			$list[$key]['subscribe_scene']="公众号搜索";
    		}elseif($value['subscribe_scene']=='ADD_SCENE_ACCOUNT_MIGRATION'){
    			# code...
    			$list[$key]['subscribe_scene']="公众号迁移";
    		}elseif($value['subscribe_scene']=='ADD_SCENE_PROFILE_CARD'){
    			# code...
    			$list[$key]['subscribe_scene']="名片分享";
    		}elseif($value['subscribe_scene']=='ADD_SCENE_QR_CODE'){
    			# code...
    			$list[$key]['subscribe_scene']="扫描二维码";
    		}elseif($value['subscribe_scene']=='ADD_SCENEPROFILE LINK'){
    			# code...
    			$list[$key]['subscribe_scene']="图文页内名称点击";
    		}elseif($value['subscribe_scene']=='ADD_SCENE_PROFILE_ITEM'){
    			# code...
    			$list[$key]['subscribe_scene']="图文页右上角菜单";
    		}elseif($value['subscribe_scene']=='ADD_SCENE_PAID'){
    			# code...
    			$list[$key]['subscribe_scene']="支付后关注";
    		}elseif($value['subscribe_scene']=='ADD_SCENE_OTHERS '){
    			# code...
    			$list[$key]['subscribe_scene']="其他";
    		}
    	}
    	$arr=array();
    	$arr['code']=0;
    	$arr['msg']="";
    	$arr['count']=$count;
    	$arr['data']=$list;
    	
    	return json_decode(json_encode($arr));
    }


    //粉丝标签
    public function fans_tag_list()
    {
        return $this->fetch('fans_tag_list');
    }

    //粉丝列表信息
    public function fans_tag_list_info()
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

        $count=Db::name('fans_tags')->where($where)->count();

        $list=Db::name('fans_tags')->page($page,$limit)->where($where)->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据...";
            return json($data);
        }
        foreach ($list as $key => $value) {
            # code...
            if($value['status']=='1'){
                $list[$key]['status']="正常";
            }else{
                $list[$key]['status']="已删除";
            }

        }
        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$list;
        
        return json_decode(json_encode($arr));
    }

    //新增粉丝标签
    public function fans_tag_add()
    {
        $post = $this->request->param();
        if(isset($post['name'])){

            $arr['name']=$post['name'];

            $tag=array(
                    'tag'=>array(
                        'name'=>$post['name'],
                        )
                );
            $obj=json_encode($tag,JSON_UNESCAPED_UNICODE);

            $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
            $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);

            $add_users_tag=$WechatModel->add_users_tag($obj);
            if(isset($add_users_tag['tag']['id'])){
                $arr['tag_id']=$add_users_tag['tag']['id'];
                $rows=Db::name('fans_tags')->insert($arr);
                if($rows){
                    $data['status']='1';
                    $data['msg']='添加标签成功...';
                    return json($data);
                }else{
                    //将添加的标签删除
                    $del_tag=array(
                            'tag'=>array(
                                    'id'=>$add_users_tag['tag']['id'],
                                )
                        );
                    $delete_users_tag=$WechatModel->delete_users_tag($obj);

                    $data['status']='0';
                    $data['msg']='数据库写入失败...';
                    return json($data);
                }

            }else{

                $data['status']='0';
                $data['msg']='添加标签失败...';
                return json($data);
            }
            

        }

        return $this->fetch('fans_tag_add');
    }

    //编辑粉丝
    public function fans_edit()
    {
        $id=input('id');
        $openid=input('openid');
        
        $post = $this->request->param();
        $tag=Db::name('fans_tags')->where('status','1')->select();
        
        $rows=Db::name('wechat_fans')->where('id',$id)->find();

        if(isset($post['tag_id'])){
            $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
            $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);
            $openid_list=[$openid];
            $arr=array(
                    'openid_list'=>$openid_list,
                    'tagid'=>$post['tag_id']
                );

            $obj=json_encode($arr);
            
            $add_batch_users_tag=$WechatModel->add_batch_users_tag($obj);
            
            if($add_batch_users_tag['errcode']==0 && $add_batch_users_tag['errmsg']=='ok'){
                $array['fans_tag_id']=$post['tag_id'];

                $rest=Db::name('wechat_fans')->where('id',$post['id'])->update($array);
                
                if($rest){
                    $data['status']='1';
                    $data['msg']='标签设置成功...';
                    return json($data);
                }else{
                    $data['status']='0';
                    $data['msg']='数据库写入失败...';
                    return json($data);
                }

            }else{
                $data['status']='0';
                $data['msg']='标签设置失败...';
                return json($data);
            }
        }
        
        $this->assign('id',$id);
        $this->assign('tag',$tag);
        $this->assign('rows',$rows);

        return $this->fetch('fans_edit');
    }


    //批量分配粉丝标签
    public function distribution_fans_tag()
    {
        $id=input('id');
        $tag_id=input('tag_id');
        
        $rows=Db::name('wechat_fans')->select();
        $rows=json_encode($rows);

        $post = $this->request->param();

        $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
        $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);

        if(isset($post['tag_id']) && isset($post['openid_list'])){
            //删除标签下面的粉丝再重新分配 //页面回滚暂未做
            $rest=Db::name('fans_tags')->where('id',$post['id'])->find();
            $cancle_list=explode(",", $rest['openid_list']);
            $cancle_arr=array(
                'openid_list'=>$cancle_list,
                'tagid'=>$post['tag_id']
                );
            $cancle_obj=json_encode($cancle_arr,JSON_UNESCAPED_UNICODE);
            $delete_batch_users_tag=$WechatModel->delete_batch_users_tag($cancle_obj);
            //分配粉丝
            $openid_list=explode(",", $post['openid_list']);
            $arr=array(
                'openid_list'=>$openid_list,
                'tagid'=>$post['tag_id']
                );
            $obj=json_encode($arr,JSON_UNESCAPED_UNICODE);
            
            $add_batch_users_tag=$WechatModel->add_batch_users_tag($obj);
            if($add_batch_users_tag['errcode']=='0' && $add_batch_users_tag['errmsg']=='ok'){
                //插入数据库
                $rows=Db::name('fans_tags')->where('id',$post['id'])->update(['openid_list'=>$post['openid_list']]);
                if($rows){
                    $data['status']='1';
                    $data['msg']='粉丝分配成功...';
                    return json($data);
                }else{
                    $data['status']='0';
                    $data['msg']='写入数据库失败...';
                    return json($data);
                }
                
            }else{
                $data['status']='0';
                $data['msg']='粉丝分配失败...';
                return json($data);
            }
        }

        $arr['tagid']=$tag_id;
        $arr['next_openid']="";
        $obj=json_encode($arr,JSON_UNESCAPED_UNICODE);
        //查询标签下拥有的openid
        $get_tags_users=$WechatModel->get_tags_users($obj);

        if(!isset($get_tags_users['data']['openid'])){
            $get_tags_users['data']['openid']=[];
        }
        $this->assign('openid_list',json_encode($get_tags_users['data']['openid'],JSON_UNESCAPED_UNICODE));
        $this->assign('rows',$rows);
        $this->assign('id',$id);
        $this->assign('tag_id',$tag_id);

        return $this->fetch('distribution_fans_tag');
    }

    //测试群发
    public function send_all()
    {
        $tag=array(
                'tag'=>array(
                    'id'=>'100',
                    )
            );
        $obj=json_encode($tag,JSON_UNESCAPED_UNICODE);

        $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
        $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);

        $add_users_tag=$WechatModel->delete_users_tag($obj);
        echo "<pre>";
            print_r($add_users_tag);
        echo "</pre>";
        exit;
    }


    //显示模板消息页面
    public function template_message()
    {
            $post = $this->request->param();

            if(isset($post['pull'])){
                $memcache=new \Memcache();
                $memcache->connect('127.0.0.1',11211) or die('Count not connect...');
                $wechat_config=$memcache->get('wechat_config');
                if($wechat_config==null){
                    $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
                    if(!$wechat_config){
                        $data['status']='0';
                        $data['msg']='拉取列表失败，请先设置微信基础配置...';
                        return json($data);
                    }else{
                        $memcache->set('wechat_config',$wechat_config);
                    }
                }

                $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);

                $get_template_message=$WechatModel->get_template_message();
                
                //拉取微信粉丝列表
                $rows=Db::name('template_message')->select();

                if(empty($rows)){

                    $rest=Db::name('template_message')->insertAll($get_template_message['template_list']);

                    if($rest){
                        $data['status']='1';
                        $data['msg']='拉取列表成功...';
                        return json($data);
                    }else{
                        $data['status']='0';
                        $data['msg']='拉取列表失败，请重试...';
                        return json($data);
                    }
                    
                }else{
                    //思路：先将数据库中的数据查询出来进行缓存，清空数据库表，将拉取的数据批量插入到数据库中
                    $memcache=new \Memcache();
                    $memcache->connect('127.0.0.1',11211) or die('Count not connect...');
                    $memcache->set('template_list',$rows);

                    Db::startTrans();
                    try{
                        Db::query('truncate table template_message');

                        $rest=Db::name('template_message')->insertAll($get_template_message['template_list']);
                        if(!$rest){
                            throw new \Exception("拉取列表失败，请重试...");
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

                    if($rest){
                        $data['status']='1';
                        $data['msg']='拉取列表成功...';
                        return json($data);
                    }else{
                        $data['status']='0';
                        $data['msg']='拉取列表失败，请重试...';
                        return json($data);
                    }
                    
                }

            }
        return $this->fetch('template_message');
    }

    //模板消息查询
    public function template_message_info()
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

        $count=Db::name('template_message')->where($where)->count();

        $list=Db::name('template_message')->page($page,$limit)->where($where)->select();

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


    //编辑模板消息关键字
    public function template_message_keywords()
    {
        $template_id=input('template_id');
        
        $post = $this->request->param();
        if(isset($post['first']) && isset($post['value']) && isset($post['template_id'])){ 

            $arr['first']=$post['first'];
            $arr['template_id']=$post['template_id'];
            $array['template_id']=$post['template_id'];

            if(isset($post['url']) && $post['url']!=""){
                $arr['url']=$post['url'];
            }
            if(isset($post['remark']) && $post['remark']!=""){
                $arr['remark']=$post['remark'];
            }

            if(isset($post['color']) && $post['color']!=""){
                $arr['color']=$post['color'];
            }
            
            Db::startTrans();
            try{

                $result=Db::name('template_message_keywords')->where('template_id',$template_id)->select();
                if($result){

                    $rest=Db::name('template_message_info')->where('template_id',$template_id)->update($arr);

                    $rows=Db::name('template_message_keywords')->where('template_id',$template_id)->delete();

                    foreach ($post['value'] as $key => $value) {
                        # code...
                        $array['value']=$value;
                        $array['color']=$post['color'];
                        $rows=Db::name('template_message_keywords')->insert($array);
                        
                        if(!$rows){
                            throw new \Exception("新增失败，请重试...");
                        }
                    }
                }else{

                    $rest=Db::name('template_message_info')->insert($arr);

                    foreach ($post['value'] as $key => $value) {
                        # code...
                        $array['value']=$value;
                        $array['color']=$post['color'];
                        $rows=Db::name('template_message_keywords')->insert($array);
                        if(!$rows){
                            throw new \Exception("新增失败，请重试...");
                        }
                    }  
                }
                
                // 提交事务
                Db::commit(); 
                $data['status']="1";
                $data['msg']='设置成功...';
                return json($data);

            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                $data['status']="0";
                $data['msg']=$e->getMessage();
                return json($data);
            }
                

        }

        $rest=Db::name('template_message_keywords')->where('template_id',$template_id)->select();
        $info=Db::name('template_message_info')->where('template_id',$template_id)->find();
        $this->assign('template_id',$template_id);
        $this->assign('rest',$rest);
        $this->assign('info',$info);

        return $this->fetch('template_message_keywords');
    }

    //推送模板消息
    public function pull_template_message()
    {   
        $id=input('id');
        
        $rest=Db::name('wechat_fans')->where('id',$id)->find();

        $template=Db::name('template_message')->select();
        
        $post = $this->request->param();
        
        if(isset($post['template_id']) && isset($post['openid'])){

            $openid=$post['openid'];

            $template_id=$post['template_id'];

            $template_url=Db::name('template_message_info')->where('template_id',$template_id)->find();

            $url=$template_url['url'];

            //查询关键字
            $keywords=Db::name('template_message_keywords')->field('value,color')->where('template_id',$template_id)->select();

            $first=Db::name('template_message_info')->field('first,color')->where('template_id',$template_id)->find();
            $first_value['value']=$first['first'];

            $remark=Db::name('template_message_info')->field('remark,color')->where('template_id',$template_id)->find();
            $remark_value['value']=$remark['remark'];

            $arr=array();
            $arr['first']=$first_value;
            
            foreach ($keywords as $key => $value) {
                # code...
                foreach ($value as $k => $v) {
                    # code...
                    $arr['keyword'.($key+1)]=$value;
                }
            }
            $arr['remark']=$remark_value;
            
            $post=array(
                'touser'=>$openid,
                'template_id'=>$template_id,
                'url'=>$url,
                'data'=>$arr
                );
            
            $send_template_message=$this->send_template_message($post);

            if($send_template_message){
                $data['status']='1';
                $data['msg']='推送成功...';
                return json($data);
            }else{
                $data['status']='0';
                $data['msg']='推送失败...';
                return json($data);
            }

        }
        

        $this->assign('openid',$rest['openid']);
        $this->assign('template',$template);
        return $this->fetch('pull_template_message');
    }

    //发送模板消息
    public function send_template_message($post)
    {
        $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
        $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);
        
        $send_template_message=$WechatModel->send_template_message($post);
        if($send_template_message['errcode']=='0' && $send_template_message['errmsg']=='ok'){
            return true;
        }else{
            return false;
        }
        
    }


    //删除模板消息
    public function delete_template_message()
    {
        $post = $this->request->param();
        if(isset($post['template_id'])){

            $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
            $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);

            $arr['template_id']=$post['template_id'];

            $obj=json_encode($arr);

            $delete_template_message=$WechatModel->delete_template_message($obj);

            if($delete_template_message['errcode']=='0' && $delete_template_message['errmsg']=='ok'){
                //删除数据库
                Db::name('template_message_keywords')->where('template_id',$post['template_id'])->delete();

                Db::name('template_message_info')->where('template_id',$post['template_id'])->delete();

                Db::name('template_message')->where('template_id',$post['template_id'])->delete();

                $data['status']='1';
                $data['msg']='删除成功...';
                return json($data);
            }else{
                $data['status']='0';
                $data['msg']='删除失败...';
                return json($data);
            }
        }
        
    }


    //素材管理
    public function material_list()
    {
        return $this->fetch('material_list');
    }

    //素材信息列表
    public function material_list_info()
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

        $count=Db::name('material')->where($where)->count();

        $list=Db::name('material')->page($page,$limit)->where($where)->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据...";
            return json($data);
        }
        
        foreach ($list as $key => $value) {
            # code...
            if($value['forever']=='1'){
                $list[$key]['forever']="永久素材";
                $list[$key]['status']="永不过期";
            }else{
                $list[$key]['forever']="临时素材";
                if(time()-$value['created_at']>259200){
                    $list[$key]['status']="已经过期";
                }else{
                    $list[$key]['status']="暂未过期";
                }
            }
            $list[$key]['created_at']=date('Y-m-d',$value['created_at']);

            if($value['type']=='image'){
                $list[$key]['type']="图片";
            }elseif($value['type']=='voice'){
                $list[$key]['type']="语音";
            }elseif($value['type']=='video'){
                $list[$key]['type']="视频";
            }elseif($value['type']=='thumb'){
                $list[$key]['type']="缩略图";
            }
        }

        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$list;
        
        return json_decode(json_encode($arr));
    }

    //测试上传视频
    public function up_video()
    {
        $obj=$_SERVER['DOCUMENT_ROOT']. DS .'uploads'. DS .'20190119\775386a050ab2e8bbaa9384057201bda.mp4';
        $type='video';

        $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
        $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);

        $description=array(
            'title'=>"VIDEO_TITLE",
            'introduction'=>"VIDEO_DESC"
            );
        $description=json_encode($description,JSON_UNESCAPED_UNICODE);

        
        $add_forever_material=$WechatModel->add_forever_material($obj,$type,$description);
        echo "<pre>";
            print_r($add_forever_material);
        echo "</pre>";
        exit;
    }

    //新增素材
    public function material_add()
    {
        $post = $this->request->param();

        if(isset($post['forever']) && isset($post['type']) && isset($post['media'])){

            $obj=$_SERVER['DOCUMENT_ROOT']. DS .'uploads'. DS .$post['media'];
            $type=$post['type'];

            $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
            $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);

            //新增永久素材
            if($post['forever']=='1'){
                if($post['type']=="video"){
                    //新增视频素材未完成。。。。。。
                    $description=array(
                        'title'=>$post['title'],
                        'introduction'=>$post['remark']
                        );
                    $description=json_encode($description,JSON_UNESCAPED_UNICODE);

                    
                    $add_forever_material=$WechatModel->add_forever_material($obj,$type,$description);
                }

                $add_forever_material=$WechatModel->add_forever_material($obj,$type);
                
                if(isset($add_forever_material['media_id'])){
                    $arr['created_at']=time();
                    $arr['media_id']=$add_forever_material['media_id'];

                    if(isset($add_forever_material['url'])){
                        $arr['url']=$add_forever_material['url'];
                    }
                }else{
                    $data['status']='0';
                    $data['errcode']=$add_forever_material['errcode'];
                    $data['errmsg']=$add_forever_material['errmsg'];
                    $data['msg']="新增失败，请重试...";
                    return json($data);
                }
                

            }else{
                
                //新增临时素材
                $add_temp_material=$WechatModel->add_temp_material($obj,$type);

                if(isset($add_temp_material['type'])){
                    $arr['created_at']=$add_temp_material['created_at'];
                    
                    if(isset($add_temp_material['thumb_media_id'])){
                        $arr['media_id']=$add_temp_material['thumb_media_id'];
                    }else{
                        $arr['media_id']=$add_temp_material['media_id'];
                    }
                }else{
                    $data['status']='0';
                    $data['msg']="新增失败，请重试...";
                    return json($data);
                }
            }
            
            $arr['title']=$post['title'];
            $arr['forever']=$post['forever'];
            $arr['type']=$post['type'];
            $arr['remark']=$post['remark'];

            $rows=Db::name('material')->insert($arr);
            if($rows){
                $data['status']='1';
                $data['msg']="新增成功...";
                return json($data);
            }else{
                $data['status']='0';
                $data['msg']="数据库写入数据失败...";
                return json($data);
            }

        }

        return $this->fetch('material_add');
    }


    //图文素材列表
    public function material_news_list()
    {
        return $this->fetch('material_news_list');
    }

    //图文素材信息查询
    public function material_news_list_info()
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

        $count=Db::name('news_material')->where($where)->count();

        $list=Db::name('news_material')->page($page,$limit)->where($where)->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据...";
            return json($data);
        }
        
        foreach ($list as $key => $value) {
            # code...
            if($value['show_cover_pic']=='1'){
                $list[$key]['show_cover_pic']="显示";
            }else{
                $list[$key]['show_cover_pic']="隐藏";
            }

            if($value['need_open_comment']=='1'){
                $list[$key]['need_open_comment']="开启";
            }else{
                $list[$key]['need_open_comment']="关闭";
            }

            if($value['only_fans_can_comment']=='1'){
                $list[$key]['only_fans_can_comment']="粉丝";
            }else{
                $list[$key]['only_fans_can_comment']="所有人";
            }
        }

        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$list;
        
        return json_decode(json_encode($arr));
    }

    //新增图文素材
    public function material_news_add()
    {   
        $post = $this->request->param();
        $rows=Db::name('material')->where(['forever'=>'1','type'=>'thumb'])->select();
        if(isset($post['title']) && isset($post['thumb_media_id']) && isset($post['show_cover_pic']) && isset($post['content']) && isset($post['content_source_url'])){

            $arr['title']=$post['title'];
            $arr['thumb_media_id']=$post['thumb_media_id'];
            $arr['author']=$post['author'];
            $arr['digest']=$post['digest'];
            $arr['show_cover_pic']=$post['show_cover_pic'];
            $arr['content']=$post['content'];
            $arr['content_source_url']=$post['content_source_url'];
            $arr['need_open_comment']=$post['need_open_comment'];
            $arr['only_fans_can_comment']=$post['only_fans_can_comment'];

            $temp=array(
                    array(
                        'title'=> $post['title'],
                        'thumb_media_id'=> $post['thumb_media_id'],
                        'author'=> $post['author'],
                        'digest'=> $post['digest'],
                        'show_cover_pic'=> $post['show_cover_pic'],
                        'content'=> $post['content'],
                        'content_source_url'=>$post['content_source_url'],
                        'need_open_comment'=>$post['need_open_comment'],
                        'only_fans_can_comment'=>$post['only_fans_can_comment']
                    )
                );
            $inser['articles']=array();
            foreach ($temp as $key => $value) {
                # code...
                array_push($inser['articles'], $value);
            }
            
            $obj=json_encode($inser,JSON_UNESCAPED_UNICODE);

            $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
            $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);
            $add_forever_news=$WechatModel->add_forever_news($obj);

            if(isset($add_forever_news['media_id'])){
                $material_news_add=Db::name('news_material')->insert($arr);
                if($material_news_add){
                    $data['status']='1';
                    $data['msg']="新增成功...";
                    return json($data);
                }else{
                    $data['status']='0';
                    $data['msg']="数据库写入数据失败...";
                    return json($data);
                }
                
            }else{

                $data['status']='0';
                $data['errcode']=$add_forever_news['errcode'];
                $data['errmsg']=$add_forever_news['errmsg'];
                $data['msg']="新增素材失败...";
                return json($data);
            }

        }
        $this->assign('rows',$rows);
        return $this->fetch('material_news_add');
    }

    //测试
    public function add_news()
    {
        $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
        $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);

        $jsonArr = array(
        "articles"=> array(
        array(// 我就是少了这层array 才会报empty news data 错误
        "title"=> 'dingdingdemo',
        "thumb_media_id"=> 'WSOCZ4PxpO_QAy1on8nKvztiqa5audtq8UAyj7Lv_f0',
        "author"=> 'martin',
        "digest"=> 'digest',
        "show_cover_pic"=> 0,
        "content"=> 'content',
        "content_source_url"=> 'https://www.baidu.com/',
        )
        ),
        );
        $obj=json_encode($jsonArr,JSON_UNESCAPED_UNICODE);
        $add_forever_news=$WechatModel->add_forever_news($obj);
        echo "<pre>";
            print_r($add_forever_news);
        echo "</pre>";
        exit;
    }

    //测试获取素材列表
    public function get_material()
    {
        $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
        $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);
        $arr['type']="video";
        $arr['offset']=0;
        $arr['count']=10;
        $obj=json_encode($arr);
        $get_material=$WechatModel->get_material($obj);
        echo "<pre>";
            print_r($get_material);
        echo "</pre>";
        exit;
    }


    //用户标签列表获取
    public function get_users_tag()
    {   
        $post = $this->request->param();
        if(isset($post[''])){
            $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
            $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);
            $get_users_tag=$WechatModel->get_users_tag();

            return json_decode(json_encode($get_users_tag['tags']));
        }
        
    }

    //测试黑名单列表
    public function get_black_list()
    {
        $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
        $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);
        $arr['begin_openid']="";
        $obj=json_encode($arr);
        $get_black_list=$WechatModel->get_black_list($obj);
        echo "<pre>";
            print_r($get_black_list);
        echo "</pre>";
        exit;
    }

    //测试生成二维码
    public function show_qrcode()
    {
        $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
        $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);
        
        $obj='{"expire_seconds": 604800, "action_name": "QR_SCENE", "action_info": {"scene": {"scene_id": 123}}}';

        $get_qrcode=$WechatModel->get_qrcode($obj,$download=false);
        echo "<pre>";
            print_r($get_qrcode);
        echo "</pre>";
        exit;
		//print_r($get_qrcode);die();
		// header('Content-Type: image/png');
		// vendor("phpqrcode.phpqrcode");//引入工具包
		// $qRcode = new \QRcode();
		// $data = $get_qrcode['header']['url'];//网址或者是文本内容
		// $level = 'L';
		// $size = 4;
		// $png=$qRcode->png($data, ROOT_PATH. DS .'public'. DS .'uploads'. DS .'1.png', $level, $size);
        
        
    }


    //测试网页授权
    public function oauth2_get_user_info()
    {
        $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
        $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);
        $oauth2_get_user_info=$WechatModel->oauth2_get_user_info();
        echo "<pre>";
            print_r($oauth2_get_user_info);
        echo "</pre>";
        exit;
    }


    //根据openID批量推送消息
    public function push_message_all()
    {   
        //查询openID列表
        $rows=Db::name('wechat_fans')->select();

        foreach ($rows as $key => $value) {
            $rows[$key]['id']=$value['openid'];
            $rows[$key]['name']=$value['nickname'];
        }
        
        $rows=json_encode($rows);
        //查询tags列表
        $tags=Db::name('fans_tags')->select();

        $post = $this->request->param();
        if(isset($post['type']) && isset($post['openid_list'])){
            $openid_list=explode(",", $post['openid_list']);

            if($post['type']=="mpnews"){
                $arr=array(
                    'touser'=>$openid_list,
                    'mpnews'=>array(
                        'media_id'=>$post['media_id']
                        ),
                    'msgtype'=>'mpnews',
                    'send_ignore_reprint'=>0
                    );
            }elseif($post['type']=="text"){
                $arr=array(
                    "touser"=>$openid_list,
                    "msgtype"=>$post['type'],
                    "text"=>array(
                        "content"=>$post['content']
                        )
                    );

            }elseif($post['type']=="voice" || $post['type']=="image"){
                $arr=array(
                    'touser'=>$openid_list,
                    'voice'=>array(
                        'media_id'=>$post['media_id']
                        ),
                    'msgtype'=>'voice'
                    );
            }elseif($post['type']=="mpvideo"){
                $arr=array(
                    'touser'=>$openid_list,
                    'mpvideo'=>array(
                        'media_id'=>$post['media_id'],
                        'title'=>'',
                        'description'=>''
                        ),
                    'msgtype'=>'mpvideo'
                    );
            }elseif($post['type']=="wxcard"){

            }

            $obj=json_encode($arr,JSON_UNESCAPED_UNICODE);

            $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
            $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);
            $send_all_openid_message=$WechatModel->send_all_openid_message($obj);
            if($send_all_openid_message['errcode']==0){
                $data['status']=1;
                $data['msg']="推送成功...";
                return json($data);
            }else{
                $data['status']=0;
                $data['msg']="推送失败...";
                $data['errcode']=$send_all_openid_message['errcode'];
                $data['info']=$obj;
                return json($data);
            }

        }
        $this->assign('rows',$rows);
        $this->assign('tags',$tags);
        return $this->fetch('push_message_all');
    }


    //根据条件查询不同的media
    public function select_media_id()
    {
        $post = $this->request->param();
        if(isset($post['type'])){

            if($post['type']=="mpnews"){
                $rows=Db::name('news_material')->select();
            }else{
                $rows=Db::name('material')->where(['type'=>$post['type'],'forever'=>'1'])->select();
            }

            if($rows){
                $data['status']=1;
                $data['msg']='查询成功...';
                $data['data']=$rows;
                return json_decode(json_encode($data));
            }else{
                $data['status']=0;
                $data['msg']='查询失败...';
                return json_decode(json_encode($data));
            }
        }
    }


    //根据标签进行推送
    public function push_all_tag_message()
    {
        $post = $this->request->param();

        if(isset($post['type']) && isset($post['tag_id']) && isset($post['is_to_all'])){

            if($post['is_to_all']=='0'){
                $is_to_all=false;
            }else{
                $is_to_all=true;
            }

            if(isset($post['tag_id'])){
                $post['tag_id']==(int)intval($post['tag_id']);
            }
            
            if($post['type']=="mpnews"){
                $arr=array(
                    'filter'=>array(
                        'is_to_all'=>$is_to_all,
                        'tag_id'=>$post['tag_id']
                        ),
                    'mpnews'=>array(
                        'media_id'=>$post['media_id']
                        ),
                    'msgtype'=>'mpnews',
                    'send_ignore_reprint'=>0
                    );
            }elseif($post['type']=="text"){
                $arr=array(
                    'filter'=>array(
                        'is_to_all'=>$is_to_all,
                        'tag_id'=>$post['tag_id']
                        ),
                    'text'=>array(
                        'content'=>$post['content']
                        ),
                    'msgtype'=>'text'
                    );

            }elseif($post['type']=="voice" || $post['type']=="image"){
                $arr=array(
                    'filter'=>array(
                        'is_to_all'=>$is_to_all,
                        'tag_id'=>$post['tag_id']
                        ),
                    "$post[type]"=>array(
                        'media_id'=>$post['media_id']
                        ),
                    'msgtype'=>$post['type']
                    );
            }elseif($post['type']=="mpvideo"){
                $arr=array(
                    'filter'=>array(
                        'is_to_all'=>$is_to_all,
                        'tag_id'=>$post['tag_id']
                        ),
                    "mpvideo"=>array(
                        'media_id'=>$post['media_id']
                        ),
                    'msgtype'=>$post['type']
                    );
            }elseif($post['type']=="wxcard"){
                $arr=array(
                    'filter'=>array(
                        'is_to_all'=>$is_to_all,
                        'tag_id'=>$post['tag_id']
                        ),
                    'wxcard'=>array(
                        'card_id'=>$post['card_id']
                        ),
                    'msgtype'=>'wxcard'
                    );
            }

            $obj=json_encode($arr,JSON_UNESCAPED_UNICODE);

            $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
            $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);
            $send_all_tag_message=$WechatModel->send_all_tag_message($obj);
            if($send_all_tag_message['errcode']==0){
                $data['status']=1;
                $data['msg']="推送成功...";
                return json($data);
            }else{
                $data['status']=0;
                $data['msg']="推送失败...";
                $data['errcode']=$send_all_tag_message['errcode'];
                $data['info']=$obj;
                return json($data);
            }

        }
    }
    //获取上传的媒体文件
    public function get_uploads_media()
    {
        if(Request::instance()->isAjax()){
            $file=Request::instance()->file('file');

            if($file){

                $info = $file->validate(['size'=>83886080,'ext'=>'bmp,png,jpeg,jpg,gif,PNG,JPEG,JPG,GIF,mp3,wma,wav,amr,AMR,MP3,mp4,MP4'])->move(ROOT_PATH . 'public' . DS . 'uploads');
                if($info){

                    return json_encode(['status' => 1, 'message' => $info->getSaveName()]);
                
                }else{
               
                    return json_encode(['status' => 0, 'message' => $file->getError()]);
                }
            }
        }
        
    }

    //群发消息根据openid
    public function send_all_openid_message()
    {
        $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
        $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);

        //图文群发消息
        // $arr=array(
        //     'touser'=>array(
        //         'oPqJq1Hq451sLfb02nmt21NmLXLA',
        //         'oPqJq1KjvhKhbkEUWm-jHiiFEeJA'
        //         ),
        //     'mpnews'=>array(
        //         'media_id'=>'WSOCZ4PxpO_QAy1on8nKvwLfDPOlI3u5lVLiE0BUM-8'
        //         ),
        //     'msgtype'=>'mpnews',
        //     'send_ignore_reprint'=>0
        //     );
        $str="oPqJq1Hq451sLfb02nmt21NmLXLA,oPqJq1KjvhKhbkEUWm-jHiiFEeJA";
        $openid_list=explode(",", $str);
        //文本群发消息
        $arr=array(
            "touser"=>$openid_list,
            "msgtype"=>"text",
            "text"=>array(
                "content"=>"哈哈哈哈..."
                )
            );

        //语音群发消息
        // $str="oPqJq1Hq451sLfb02nmt21NmLXLA,oPqJq1KjvhKhbkEUWm-jHiiFEeJA";
        // $openid_list=explode(",", $str);
        // $arr=array(
        //     'touser'=>$openid_list,
        //     'msgtype'=>'text',
        //     'text'=>''
        //     );

        //图片群发消息
        // $arr=array(
        //     'touser'=>array(
        //         'oPqJq1Hq451sLfb02nmt21NmLXLA',
        //         'oPqJq1KjvhKhbkEUWm-jHiiFEeJA'
        //         ),
        //     'image'=>array(
        //         'media_id'=>'WSOCZ4PxpO_QAy1on8nKv8zuwWRsDTzVq6r3A8B_dx8'
        //         ),
        //     'msgtype'=>'image'
        //     );

        //视频群发消息
        // $arr=array(
        //     'touser'=>array(
        //         'oPqJq1Hq451sLfb02nmt21NmLXLA',
        //         'oPqJq1KjvhKhbkEUWm-jHiiFEeJA'
        //         ),
        //     'image'=>array(
        //         'media_id'=>'WSOCZ4PxpO_QAy1on8nKvwLfDPOlI3u5lVLiE0BUM-8'
        //         ),
        //     'msgtype'=>'image'
        //     );

        $obj=json_encode($arr,JSON_UNESCAPED_UNICODE);
        
        $send_all_openid_message=$WechatModel->send_all_openid_message($obj);
        echo "<pre>";
            print_r($send_all_openid_message);
        echo "</pre>";
        exit;
    }

    //测试群发接口根据标签
    public function send_all_tag_message()
    {
        $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
        $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);

        //文本消息
        $arr=array(
            'filter'=>array(
                'is_to_all'=>true,
                'tag_id'=>103
                ),
            'text'=>array(
                'content'=>'哈哈哈哈哈哈哈哈哈哈...'
                ),
            'msgtype'=>'text'
            );

        $obj=json_encode($arr,JSON_UNESCAPED_UNICODE);
        
        $send_all_tag_message=$WechatModel->send_all_tag_message($obj);
        echo "<pre>";
            print_r($send_all_tag_message);
        echo "</pre>";
        exit;
    }


    //测试
    public function get_tags_users()
    {
        $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
        $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);

        //文本消息
        $arr=array(
            'tagid'=>103,
            
            'next_openid'=>''
            );

        $obj=json_encode($arr,JSON_UNESCAPED_UNICODE);
        
        $get_tags_users=$WechatModel->get_tags_users($obj);
        echo "<pre>";
            print_r($get_tags_users);
        echo "</pre>";
        exit;
    }


    //测试自动回复规则
    public function get_autoreply_rule()
    {
        $wechat_config=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();
        $WechatModel= new WechatModel($wechat_config['appid'],$wechat_config['appsecret']);
        $get_autoreply_rule=$WechatModel->get_autoreply_rule();
        echo "<pre>";
            print_r($get_autoreply_rule);
        echo "</pre>";
        exit;
    }



}
