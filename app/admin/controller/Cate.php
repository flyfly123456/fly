<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Db;
use \think\Request;
use \think\Image;

class Cate extends Controller
{
    public function cate_list()
    {
    	$rows=Db::name('cate')->where('is_available=1')->select();
        
    	foreach ($rows as $key => $value) {
            
            if($value['is_available']=='1'){
                $rows[$key]['is_available']="正常";
            }else{
                $rows[$key]['is_available']="禁用";
            }
        }

    	$cate=json_encode($rows,JSON_UNESCAPED_UNICODE);
    	// echo "<pre>";
    	//     print_r($cate);
    	// echo "</pre>";
    	// exit;
        $count=Db::name('cate')->where('is_available=1')->count();
        $this->assign('cate',$cate);
        $this->assign('count',$count);

        return view('cate_list');
    }

    public function cate_add()
    {
    	$rows=Db::name('cate')->field("id,title,pid,path,concat(path,',',id) as bpath")->order('bpath')->where('is_available=1')->select();

    	foreach ($rows as $key => $value) {
    		
    		$rows[$key]['count']=count(explode('-',$value['bpath']));

    		$rows[$key]['title']=str_repeat('&nbsp;&nbsp;', substr_count($value['path'], '-')).'&nbsp;&nbsp;|--'.$value['title'];

    	}

    	// echo "<pre>";
    	//     print_r($rows);
    	// echo "</pre>";
    	// exit;

    	$post = $this->request->param();

    	if(isset($post['pid']) && isset($post['title']) && isset($post['status']) && $post['pid']!=""){
    		//开启事务
    		Db::startTrans();
    		try{

	    		$arr['pid']=$post['pid'];
	    		$arr['title']=$post['title'];
                $arr['is_available']=$post['status'];
	    		$arr['desc']=$post['desc'];
                if(isset($post['img_url'])){
                    $arr['img']=$post['img_url'];
                }

                if(isset($post['url'])){
                    $arr['url']=$post['url'];
                }

	    		$pid=Db::name('cate')->insertGetId($arr);
	    		if(!$pid){
	    			//  抛出异常
	    			throw new \Exception("插入失败...");
	    		}

	    		if($arr['pid']=='0'){

	    			$array['path']='0-'.$pid;
	    		}else{
	    			$path=Db::name('cate')->field('path')->where("id=$post[pid]")->find();
	    			if(!$path){
	    				//  抛出异常
	    				throw new \Exception("查询失败...");
	    			}

	    			$array['path']=$path['path'].'-'.$pid;
	    		}

	    		$result=Db::name('cate')->where("id=$pid")->update($array);

	    		if($pid && $result){
	    			// 提交事务
	    			Db::commit();
	    			
	    			$data['status']='1';
	    			$data['msg']='添加成功！';
	    			return json($data);
	    		}else{
	    			$data['status']='0';
	    			$data['msg']='添加失败！';
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

        $request = Request::instance();
        $domain=$request->domain();

        $this->assign('cate',$rows);
    	$this->assign('domain',$domain);

    	return $this->fetch('cate_add');
    }


    public function cate_edit()
    {
        $id=input('id');

        $rows=Db::name('cate')->where("id=$id")->find();
        $cate=Db::name('cate')->field("id,title,pid,path,concat(path,',',id) as bpath")->order('bpath')->where('is_available=1')->select();

        foreach ($cate as $key => $value) {
            
            $cate[$key]['count']=count(explode('-',$value['bpath']));

            $cate[$key]['title']=str_repeat('&nbsp;&nbsp;', substr_count($value['path'], '-')).'&nbsp;&nbsp;|--'.$value['title'];

        }

        $post = $this->request->param();

        if(isset($post['id']) && isset($post['title']) && isset($post['status'])){
                
            $array['title']=$post['title'];
            $array['is_available']=$post['status'];
            $array['desc']=$post['desc'];
            if(isset($post['img_url'])){
                $array['img']=$post['img_url'];
            }

            if(isset($post['url'])){
                $array['url']=$post['url'];
            }

            $result=Db::name('cate')->where("id=$post[id]")->update($array);
            if($result){
                $data['status']='1';
                $data['msg']='修改成功！';
                return json($data);
            }else{
                $data['status']='0';
                $data['msg']='修改失败！';
                return json($data);
            }
        }

        $request = Request::instance();
        $domain=$request->domain();
        
        $this->assign('rows',$rows);
        $this->assign('cate',$cate);
        $this->assign('id',$id);
        $this->assign('domain',$domain);

        return $this->fetch('cate_edit');
        
    }

    public function show_img()
    {
        $post = $this->request->param();
        if(isset($post['id'])){
            $rows=Db::name('cate')->where("id=$post[id]")->find();
            if($rows['pid']=='0'){
                $data['status']='1';
                return json($data);
            }else{
                $data['status']='0';
                return json($data);
            }
        }
    }

    public function upload_img()
    {
        if(Request::instance()->isAjax()){
            $file=Request::instance()->file('file');
            // $file = request()->file('file');
            // $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
            if($file){

                $info = $file->validate(['size'=>1048576,'ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'uploads');
                if($info){

                    $image = \think\Image::open(ROOT_PATH . 'public' . DS . 'uploads'.DS.$info->getSaveName());
                    $image->thumb(400, 300)->save(ROOT_PATH . 'public' . DS . 'uploads'.DS.$info->getSaveName());

                    return json_encode(['state' => 1, 'message' => $file->getError(),'img'=>$info->getSaveName()]);
                
                }else{
                    // 上传失败获取错误信息
                    //     return $file->getError();
                    return json_encode(['state' => 0, 'message' => $file->getError()]);
                }
            }
        }
    }


    public function cate_delete()
    {
        $post = $this->request->param();
        if(isset($post['id'])){
            $rows=Db::name('cate')->where("id=$post[id]")->update(['is_available'=>'0']);
            if($rows){
                $data['status']='1';
                $data['msg']='删除成功';
                return json($data);
            }else{
                $data['status']='0';
                $data['msg']='删除失败';
                return json($data);
            }
        }
    }

}
