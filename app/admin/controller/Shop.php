<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Request;
use \think\Db;
use \think\Image;
use \app\admin\model\Uploads;
use \app\admin\model\Goods;

use app\admin\logic\ShopLogic;

use app\admin\behavior\Behavior;


class Shop extends Base
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

    public function shop_list()
    {
    	
        return view('shop_list');
    }

    public function shop_list_info()
    {
        
        //判断搜索
        $post = $this->request->param();

        $info=ShopLogic::select($post,'shop');

        if(isset($info['list'])){
            foreach ($info['list'] as $key => $value) {
                
                if($value['is_available']=="1"){
                    $info['list'][$key]['is_available']="上架";
                }else{
                    $info['list'][$key]['is_available']="下架";
                }

                $cate=Db::name('cate')->where(['is_available'=>1,'id'=>$value['cate_id']])->find();
                $info['list'][$key]['cate']=$cate['title'];

                $brand=Db::name('brand')->where(['is_available'=>1,'id'=>$value['brand_id']])->find();
                $info['list'][$key]['brand']=$brand['name'];

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

    public function shop_add()
    {
        $cate=Db::name('cate')->field("id,title")->where('is_available=1 and pid=0')->select();
        $brand=Db::name('brand')->where('is_available=1')->select();

        $post = $this->request->param();

        if(isset($post['name']) && isset($post['cate_id']) && isset($post['brand_id']) && isset($post['model_list']) && isset($post['number']) && isset($post['price']) && isset($post['parameter']) && isset($post['shelf']) && isset($post['img']) && isset($post['img_url'])){

            $arr['name']=$post['name'];
            $arr['desc']=$post['desc'];
            $arr['cate_id']=$post['cate_id'];
            $arr['brand_id']=$post['brand_id'];
            $arr['model_id']=$post['model_list'];
            $arr['number']=$post['number'];
            $arr['price']=$post['price'];
            $arr['parameter']=$post['parameter'];
            $arr['shelf']=$post['shelf'];
            $arr['cover']=$post['img_url'];
            $arr['is_hot']=$post['is_hot'];
            $arr['create_time']=time();
            $arr['is_available']=1;

            $insertGetId=Db::name('shop')->insertGetId($arr);

            $array=array();

            foreach ($post['img'] as $key => $value) {
                //总共生成3种尺寸大图：60px*60px;350px*350px;800px*800px;
                Goods::thumb_image($value,$insertGetId,'shop_thumb_'.$key.$insertGetId.'_'.'60_60.jpg',$width=60,$height=60);

                Goods::thumb_image($value,$insertGetId,'shop_thumb_'.$key.$insertGetId.'_'.'350_350.jpg',$width=350,$height=350);

                Goods::thumb_image($value,$insertGetId,'shop_thumb_'.$key.$insertGetId.'_'.'800_800.jpg',$width=800,$height=800);

                unlink(ROOT_PATH . 'public' . DS . 'uploads'.DS.'temp'.DS.$value);

                $array[$key]['img_url']=date('Ymd').DS.$insertGetId.DS.'shop_thumb_'.$key.$insertGetId.'_'.'350_350.jpg';

                $array[$key]['min_img']=date('Ymd').DS.$insertGetId.DS.'shop_thumb_'.$key.$insertGetId.'_'.'60_60.jpg';

                $array[$key]['big_img']=date('Ymd').DS.$insertGetId.DS.'shop_thumb_'.$key.$insertGetId.'_'.'800_800.jpg';

                $array[$key]['shop_id']=$insertGetId;

            }

            Goods::thumb_image($arr['cover'],$insertGetId,'cover_'.$insertGetId.'_'.'350_350.jpg',$width=350,$height=350);

            $update=Db::name('shop')->where('id='.$insertGetId)->update(['cover'=>date('Ymd').DS.$insertGetId.DS.'cover_'.$insertGetId.'_'.'350_350.jpg']);

            unlink(ROOT_PATH . 'public' . DS . 'uploads'.DS.'temp'.DS.$arr['cover']);

            $rows=Db::name('shop_img')->insertAll($array);

            if($rows && $insertGetId && $update){
                $data['status']=1;
                $data['msg']="添加成功";
                return json($data);
            }else{
                $data['status']=0;
                $data['msg']="添加失败";
                return json($data);
            }
        }

        //查询商品模型列表
        $shop_model=Db::name('shop_model')->where('is_available=1')->select();
        $shop_model=json_encode($shop_model);

        $this->assign('cate',$cate);
        $this->assign('brand',$brand);
        $this->assign('shop_model',$shop_model);

        return view('shop_add');
    }


    public function shop_edit()
    {
        $id=input('id');

        $cate=Db::name('cate')->field("id,title")->where('is_available=1 and pid=0')->select();
        $brand=Db::name('brand')->where('is_available=1')->select();
        
        $shop=Db::name('shop')->where('id='.$id)->find();

        $shop_img=Db::name('shop_img')->where('shop_id='.$id)->select();

        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){
                $arr['name']=$data['name'];
                $arr['desc']=$data['desc'];
                $arr['cate_id']=$data['cate_id'];
                $arr['brand_id']=$data['brand_id'];
                $arr['number']=$data['number'];
                $arr['price']=$data['price'];
                $arr['parameter']=$data['parameter'];
                $arr['shelf']=$data['shelf'];
                $arr['is_hot']=$data['is_hot'];

                if($data['img_url']!=""){

                    $goods=Db::name('shop')->where('id='.$data['id'])->find();

                    if($data['img_url']!=$goods['cover']){

                        if(file_exists(ROOT_PATH . 'public' . DS . 'uploads'.DS.'shop'.DS.$goods['cover'])){
                            unlink(ROOT_PATH . 'public' . DS . 'uploads'.DS.'shop'.DS.$goods['cover']);
                        }

                        Goods::thumb_image($data['img_url'],$data['id'],'cover_'.$data['id'].'_'.'350_350.jpg',$width=350,$height=350);

                        unlink(ROOT_PATH . 'public' . DS . 'uploads'.DS.'temp'.DS.$data['img_url']);

                        $arr['cover']=dirname($goods['cover']).DS.'cover_'.$data['id'].'_'.'350_350.jpg';
                    }

                }

                $rest=Db::name('shop')->where('id',$data['id'])->update($arr);

                if(isset($data['img'])){
                    $array=array();
                    foreach ($data['img'] as $key => $value) {

                        Goods::thumb_image($value,$data['id'],'shop_thumb_'.$key.$data['id'].'_'.'60_60.jpg',$width=60,$height=60);

                        Goods::thumb_image($value,$data['id'],'shop_thumb_'.$key.$data['id'].'_'.'350_350.jpg',$width=350,$height=350);

                        Goods::thumb_image($value,$data['id'],'shop_thumb_'.$key.$data['id'].'_'.'800_800.jpg',$width=800,$height=800);

                        unlink(ROOT_PATH . 'public' . DS . 'uploads'.DS.'temp'.DS.$value);

                        $array[$key]['img_url']=date('Ymd').DS.$data['id'].DS.'shop_thumb_'.$key.$data['id'].'_'.'350_350.jpg';

                        $array[$key]['min_img']=date('Ymd').DS.$data['id'].DS.'shop_thumb_'.$key.$data['id'].'_'.'60_60.jpg';

                        $array[$key]['big_img']=date('Ymd').DS.$data['id'].DS.'shop_thumb_'.$key.$data['id'].'_'.'800_800.jpg';

                        $array[$key]['shop_id']=$data['id'];
                    }


                    $rows=Db::name('shop_img')->insertAll($array);

                    if(!$rows){
                        $data['status']=0;
                        $data['msg']="图片修改失败";
                        return json($data);
                    }
                }

                return Behavior::return_info($rest);

            }
        }
        
        $this->assign('id',$id);
        $this->assign('cate',$cate);
        $this->assign('brand',$brand);
        $this->assign('shop',$shop);
        $this->assign('shop_img',$shop_img);

        return view('shop_edit');
    }

    //上传商品图片
    public function shop_upload_img()
    {
        if(Request::instance()->isAjax()){
            $file=Request::instance()->file('file');
            $uploads=Uploads::uploads_img($file);
            return $uploads;
        }
    }

    //删除商品图片
    public function delete_img()
    {
        $post = $this->request->param();

        if(isset($post['id'])){

            $rows=Db::name('shop_img')->where('id='.$post['id'])->find();

            if(unlink(ROOT_PATH . 'public' . DS . 'uploads'.DS.'shop'.DS.$rows['img_url']) && unlink(ROOT_PATH . 'public' . DS . 'uploads'.DS.'shop'.DS.$rows['min_img']) && unlink(ROOT_PATH . 'public' . DS . 'uploads'.DS.'shop'.DS.$rows['big_img'])){

                $rest=Db::name('shop_img')->where('id='.$post['id'])->delete();

                if($rest){
                    $data['status']=1;
                    $data['msg']="删除成功";
                    return json($data);
                }else{
                    $data['status']=0;
                    $data['msg']="删除失败";
                    return json($data);
                }
            }
        }
        
    }

    public function change_status()
    {
        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){
                $rows=Db::name('shop')->where('id='.$data['id'])->update(["$data[field]"=>$data['name']]);

                return Behavior::return_info($rows);
            }
        }
    }


    public function model_list()
    {
        return $this->fetch();
    }

    public function model_list_info()
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
                $data['msg']="暂无数据！";
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
            $where['msg']="暂无数据！";
            return json($where);

        }

        

        if(isset($post['keywords']) && isset($post['modules'])){

            if(empty($post['keywords']) && empty($post['modules'])){
                unset($post['keywords']);
                unset($post['modules']);
                $data['status']=0;
                $data['msg']="暂无数据！";
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
                   $data['msg']="暂无数据！";
                   return json($data); 
                }
                
            }

            $where[$post['modules']] = ['like', '%' . $post['keywords'] . '%'];
            
        }

        $count=Db::name('shop_model')->where($where)->count();

        $list=Db::name('shop_model')->page($page,$limit)->where($where)->select();

        if(empty($list)){
            $data['status']=0;
            $data['msg']="暂无数据！";
            return json($data);
        }
        
        foreach ($list as $key => $value) {
            
            if($value['is_available']=="1"){
                $list[$key]['is_available']="正常";
            }else{
                $list[$key]['is_available']="禁用";
            }

        }

        $arr=array();
        $arr['code']=0;
        $arr['msg']="";
        $arr['count']=$count;
        $arr['data']=$list;
        
        return json_decode(json_encode($arr));
    }

    public function model_add()
    {
        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){

                $arr['name']=$data['name'];
                $arr['desc']=$data['desc'];
                $arr['param']=$data['param'];
                $arr['is_available']=$data['is_available'];

                $rows=Db::name('shop_model')->insert($arr);

                if($rows){
                    $info['status']="1";
                    $info['msg']="添加成功";
                    return json($info);
                }else{
                    $info['status']="0";
                    $info['msg']="添加失败";
                    return json($info);
                }
            }
        }

        return $this->fetch();
    }

    public function delete_all()
    {
        if(Request::instance()->isAjax()){
            $data=Request::instance()->post();
            
            if(!empty($data)){

                return Behavior::delete_all($data,'shop');
            }
        }
    }


}
