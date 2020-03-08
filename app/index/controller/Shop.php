<?php
namespace app\index\controller;
use \think\Controller;
use \think\Db;
use \think\Request;
use \think\Session;
use \think\Cookie;

class Shop extends Base
{
    public function cart()
    {
        $cart_info=array();
        $model=array();
        $i=0;
        
        $userinfo=Session::get('user');

        if(!$userinfo){//用户未登入的情况

            if (Request::instance()->isAjax()){
                
                $data=Request::instance()->post();
                if(!empty($data)){

                    $key=$data['goods_id']."_".trim(strip_tags($data['model']));//以商品ID和模型作为key

                    $cart=Cookie::get('cart');//从Cookie中获取购物车数据
                    
                    if(isset($cart[$key])){//已经在购物车中存在，则数量加上本次添加的数量
                        $cart[$key]+=$data['goods_number'];

                        Cookie::set("cart",$cart);

                        $info['status']=2;
                        $info['msg']="修改成功";
                        return json($info);

                    }else{
                        //没有添加过购物车，取出购物车中已经存在的商品，在加上本次添加的商品
                        $cart[$key]=$data['goods_number'];
                        
                        Cookie::set("cart",$cart);

                        $info['status']=1;
                        $info['msg']="添加成功";
                        return json($info);
                        
                    }
                    
                }
            }

            $cart=Cookie::get('cart');

            if(!empty($cart)){
                foreach ($cart as $key => $value) {
                    
                    $id_info=explode("_", $key);
                    $model_info=explode("@", $id_info[1]);

                    $cart_info[$i]['id']=$key;
                    $cart_info[$i]['goods_id']=$id_info[0];
                    //查询商品名称
                    $goods_name=Db::name('shop')->where('id='.$id_info[0])->find();
                    $cart_info[$i]['goods_name']=$goods_name['name'];
                    $cart_info[$i]['price']=$goods_name['price'];
                    $cart_info[$i]['cover']=$goods_name['cover'];
                    $cart_info[$i]['promotion']=$goods_name['promotion'];

                    $cart_info[$i]['key_info']=$key;

                    foreach ($model_info as $k => $v) {
                        $model[$k]['name']=$v;
                        $sub_param=explode(":", $v);
                        $model[$k]['param']=$sub_param[1];
                    }
                    $cart_info[$i]['model']=$model;
                    

                    $cart_info[$i]['number']=$value;

                    $i++;
                }
            }

        }else{//用户已登入的情况

            if (Request::instance()->isAjax()){
                
                $data=Request::instance()->post();
                if(!empty($data)){
                    $arr['shop_id']=$data['goods_id'];
                    $arr['user_id']=$userinfo['id'];
                    $arr['shop_model']=trim(strip_tags($data['model']));
                    $arr['shop_number']=$data['goods_number'];

                    $select_cart=Db::name('cart')->where(['shop_id'=>$arr['shop_id'],'user_id'=>$arr['user_id'],'shop_model'=>$arr['shop_model']])->find();

                    if($select_cart){
                        
                        $number['shop_number']=intval($select_cart['shop_number'])+intval($data['goods_number']);

                        $update_cart=Db::name('cart')->where('id='.$select_cart['id'])->update($number);
                        $info['status']=2;
                        $info['msg']="修改成功";
                        return json($info);

                    }else{

                        $insert_cart=Db::name('cart')->insert($arr);
                        $info['status']=1;
                        $info['msg']="添加成功";
                        return json($info);
                    }

                }

            }

            $carts=Db::name('cart')->where('user_id='.$userinfo['id'])->select();

            foreach ($carts as $key => $value) {
                $cart_info[$key]['id']=$value['id'];
                $cart_info[$key]['goods_id']=$value['shop_id'];
                $shop_name=Db::name('shop')->where('id='.$value['shop_id'])->find();

                $cart_info[$key]['goods_name']=$shop_name['name'];
                $cart_info[$key]['price']=$shop_name['price'];
                $cart_info[$key]['cover']=$shop_name['cover'];
                $cart_info[$key]['number']=$value['shop_number'];
                $cart_info[$key]['promotion']=$shop_name['promotion'];
                $cart_info[$key]['key_info']=$value['shop_id'].'_'.$value['user_id'].'_'.$value['shop_model'];
                
                $model=explode("@", $value['shop_model']);
                foreach ($model as $k => $v) {
                    $model_info[$k]['name']=$v;
                    $sub_param=explode(":", $v);
                    $model_info[$k]['param']=$sub_param[1];
                }

                $cart_info[$key]['model']=$model_info;
            }

        }

        // echo "<pre>";
        //     print_r($cart);
        // echo "</pre>";

        // echo "<pre>";
        //     print_r($cart_info);
        // echo "</pre>";

        $this->assign('userinfo',$userinfo);
        $this->assign('cart_info',$cart_info);

        return $this->fetch('cart');
    }

    public function change_number()
    {
        $userinfo=Session::get('user');

        if($userinfo){//用户已经登入的情况

            if (Request::instance()->isAjax()){
                
                $data=Request::instance()->post();
                if(!empty($data)){

                    $model_info=explode("_", $data['model_info']);

                    $arr['shop_id']=$model_info[0];
                    $arr['user_id']=$model_info[1];
                    $arr['shop_model']=$model_info[2];

                    if($data['method']=="min"){
                        $find=Db::name('cart')->where($arr)->find();
                        if($find['shop_number']>1){

                            $rows=Db::name('cart')->where($arr)->setDec('shop_number');
                        }
                    }

                    if($data['method']=="add"){
                        $rows=Db::name('cart')->where($arr)->setInc('shop_number');
                    }

                    if($data['method']=="delete"){
                        $rows=Db::name('cart')->where($arr)->delete();
                    }

                    $info['status']=1;
                    $info['msg']='操作成功';
                    return json($info);

                }
            }

        }else{//用户为登入的情况

            if (Request::instance()->isAjax()){
                
                $data=Request::instance()->post();
                if(!empty($data)){

                    $cart=Cookie::get('cart');//从Cookie中获取购物车数据

                    $cart_number=$cart[$data['model_info']];

                    if($data['method']=="min"){
                        if($cart_number>1){

                            $cart_number--;
                            $cart[$data['model_info']]=$cart_number;

                            Cookie::set('cart',$cart);
                        }
                    }

                    if($data['method']=="add"){
                        $cart_number++;
                        $cart[$data['model_info']]=$cart_number;

                        Cookie::set('cart',$cart);
                    }

                    if($data['method']=="delete"){
                        unset($cart[$data['model_info']]);

                        Cookie::set('cart',$cart);
                    }

                    $info['status']=1;
                    $info['msg']=$cart_number;
                    return json($info);
                }
            }
        }

        
    }

    public function find_shop()
    {
        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){
                $shopinfo=Db::name('shop')->where('id='.$data['id'])->find();
                $model=explode(",", $shopinfo['model_id']);
                $model_id="";
                foreach ($model as $key => $value) {
                    $modelinfo=Db::name('shop_model')->where('id='.$value)->find();

                    $shopinfo['model'][$key]['model_info']=$modelinfo;
                    $model_id.=",".$modelinfo['id'];

                }

                $shopinfo['model_id']=substr($model_id, 1);
                $shopinfo['cart_id']=$data['cart_id'];

                $shopinfo['status']=1;
                $shopinfo['msg']="查询成功";
                return json($shopinfo);
            }
        }
    }

    public function edit_cart()
    {
        $userinfo=Session::get('user');

        if($userinfo){//用户已经登入的情况
            if (Request::instance()->isAjax()){
                
                $data=Request::instance()->post();
                if(!empty($data)){
                    $arr['shop_model']=$data['content'];
                    $arr['shop_number']=$data['number'];
                    $rows=Db::name('cart')->where('id='.$data['id'])->update($arr);
                    if($rows!==false){
                        $info['status']=1;
                        $info['msg']="修改成功";
                        return json($info);
                    }
                }
            }

        }else{//用户未登入的情况

            if (Request::instance()->isAjax()){
                
                $data=Request::instance()->post();
                if(!empty($data)){
                    $cart=Cookie::get('cart');

                    $id_info=explode("_", $data['id']);

                    $key=$id_info[0]."_".$data['content'];

                    if(isset($cart[$key])){//购物车中已经存在相同的商品
                        
                        // $number=$cart[$key];

                        // $cart[$key]=intval($number)+intval($data['number']);

                        // $info['status']=0;
                        // $info['msg']="修改成功";
                        // return json($info);

                    }else{

                        $cart[$key]=$data['number'];

                        // unset($cart[$data['id']]);//删除原来购物车中的商品

                        Cookie::set("cart",$cart);
                    }

                    $info['status']=1;
                    $info['msg']="修改成功";
                    return json($info);
                }
            }
            
            

        }
        
    }

    public function sort()
    {
        $userinfo=Session::get('user');
        $this->assign('userinfo',$userinfo);

        return $this->fetch('sort');
    }

    public function search()
    {
        //插件
        $plug=Db::name('plug')->where('status=1')->select();
        $this->assign('plug',$plug);

        return $this->fetch('search');
    }

    public function introduction()
    {
        $id=input('id');
        $shop=Db::name('shop_img')->alias('i')->join('shop s','s.id=i.shop_id','LEFT')->where('s.id='.trim($id).' and is_available=1')->select();

        $goods=Db::name('shop')->where('id='.$id)->find();


        //查询所属模型
        $goods_model=array();
        $model=explode(",", $goods['model_id']);

        foreach ($model as $key => $value) {
            $goods_model_info=Db::name('shop_model')->field('name,param')->where(['id'=>$value])->find();
            array_push($goods_model, $goods_model_info);

        }

        foreach ($goods_model as $key => $value) {
            $goods_model[$key]['child']=array();
            $param=explode("@", $value['param']);
            foreach ($param as $k => $v) {
                $goods_model[$key]['child'][$k]['name']="";
                $goods_model[$key]['child'][$k]['name']=$v;
            }
            
        }

        $userinfo=Session::get('user');
        
        //插件
        $plug=Db::name('plug')->where('status=1')->select();

        

        $this->assign('userinfo',$userinfo);
        $this->assign('shop',$shop);
        $this->assign('shopinfo',$shop);
        $this->assign('info',$shop);
        $this->assign('title',$shop);
        $this->assign('plug',$plug);
        $this->assign('goods',$goods);
        $this->assign('goods_model',$goods_model);

        return $this->fetch('introduction');
    }

    public function order()
    {
        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();

            if(!empty($data)){

                if(!parent::$userinfo){
                    $info['status']=-1;
                    $info['msg']="暂未登入，请先登入...";
                    return json($info);
                }

                $ids = json_decode($_POST['id'],true);

                foreach ($ids as $key => $value) {
                    
                    $update=Db::name('cart')->where('id='.$value['id'])->update(['is_statement'=>'1']);

                    if($update===false){
                        $info['status']=0;
                        $info['msg']="操作失败，请稍后再试";
                        return json($info);
                    }

                }

                $info['status']=1;
                $info['msg']="操作成功";
                return json($info);
            }
        }
    }


    public function pay()
    {

        $userinfo=parent::$userinfo;
        
        $address=Db::name('members_address')->where(['members_id'=>$userinfo['id'],'status'=>1])->select();
        
        foreach ($address as $key => $value) {

            $address[$key]['telephone']=$address[$key]['mobile'];
            $address[$key]['province_id']=$address[$key]['province'];
            $address[$key]['city_id']=$address[$key]['city'];

            $address[$key]['mobile']=str_replace(substr($value['mobile'], 3,4), "****", $value['mobile']);
            $province=Db::name('province')->where('province_num='.$value['province'])->find();
            $city=Db::name('city')->where('city_num='.$value['city'])->find();
            $area=Db::name('area')->where('id='.$value['country'])->find();
            
            $address[$key]['province']=$province['province_name'];
            $address[$key]['city']=$city['city_name'];
            $address[$key]['area']=$area['area_name'];
        }

        $shop=Db::name('cart')->where(['user_id'=>$userinfo['id'],'is_statement'=>1])->select();


        foreach ($shop as $key => $value) {
            $shop[$key]['shop_model']=str_replace("@", " ", $value['shop_model']);
            $shopinfo=Db::name('shop')->where('id='.$value['shop_id'])->find();
            $shop[$key]['shop_name']=$shopinfo['name'];
            $shop[$key]['shop_img']=$shopinfo['cover'];
            $shop[$key]['shop_price']=$shopinfo['price'];
            $shop[$key]['shop_promotion']=$shopinfo['promotion'];
            $shop[$key]['total_price']=$shopinfo['price']*$value['shop_number'];
        }

        echo "<pre>";
            print_r($shop);
        echo "</pre>";


        $default_address=Db::name('members_address')->where(['members_id'=>$userinfo['id'],'status'=>1,'is_default'=>1])->select();
        
        foreach ($default_address as $key => $value) {

            $default_address[$key]['mobile']=str_replace(substr($value['mobile'], 3,4), "****", $value['mobile']);
            $province=Db::name('province')->where('province_num='.$value['province'])->find();
            $city=Db::name('city')->where('city_num='.$value['city'])->find();
            $area=Db::name('area')->where('id='.$value['country'])->find();
            
            $default_address[$key]['province']=$province['province_name'];
            $default_address[$key]['city']=$city['city_name'];
            $default_address[$key]['area']=$area['area_name'];
        }


        $d_addr=array();

        foreach ($default_address as $key => $value) {
           $d_addr=$default_address[$key];
        }

        $default_address=$d_addr;


        $this->assign('address',$address);
        $this->assign('shop',$shop);

        $this->assign('default_address',$default_address);

        return $this->fetch('pay');
    }

    public function well()
    {

        return $this->fetch('well');
    }

}
