<?php
namespace app\index\controller;
use \think\Controller;
use \think\Db;
use \think\Request;
use \think\Session;
use \think\Cookie;

use app\index\model\PassSafe;

class Person extends Base
{
    public function index()
    {
        return $this->fetch('index');
    }

    public function information()
    {
        $userinfo=Session::get('user');
        
        $members=Db::name('members')->where('id='.$userinfo['id'])->find();

        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){

                $arr['username']=$data['username'];
                $arr['sex']=$data['sex'];
                $arr['telephone']=$data['telephone'];
                $arr['realname']=$data['realname'];

                if($data['month']<10){
                    $data['month']='0'.$data['month'];
                }
                if($data['day']<10){
                    $data['day']='0'.$data['day'];
                }

                $arr['birthday']=$data['year']."-".$data['month']."-".$data['day'];
                
                $arr['birthday']=strtotime($arr['birthday']);

                $rows=Db::name('members')->where('id='.$members['id'])->update($arr);
                
                if($rows!==false){
                    $info['status']=1;
                    $info['msg']="修改成功";
                    return json($info);
                }else{
                    $info['status']=0;
                    $info['msg']="修改失败";
                    return json($info);
                }
            }
        }


        $this->assign('members',$members);

        return $this->fetch('information');
    }

    public function safety()
    {
        return $this->fetch();
    }


    public function password()
    {

        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){
                if($data['newpassword']!=$data['confirmpassword']){
                    $info['status']=0;
                    $info['msg']="两次密码不一致";
                    return json($info);
                }else{

                    $userinfo=parent::$userinfo;

                    $select=Db::name('members')->where('id='.$userinfo['id'])->find();
                    
                    if($select['password']==md5($data['oldpassword'])){
                        $PassSafe=PassSafe::grade($data['newpassword']);

                        $arr['password_safe']=$PassSafe['code'];
                        $arr['password']=md5($data['newpassword']);

                        $rows=Db::name('members')->where('id='.$userinfo['id'])->update($arr);

                        if($rows!==false){

                            Session::set('user.password_safe',$arr['password_safe']);

                            $info['status']=1;
                            $info['msg']="操作成功";
                            return json($info);
                        }else{
                            $info['status']=0;
                            $info['msg']="操作失败";
                            return json($info);
                        }
                    }else{
                        $info['status']=0;
                        $info['msg']="原始密码错误";
                        return json($info);
                    }

                    
                }
            }
        }

        return $this->fetch();
    }

    public function setpay()
    {
        return $this->fetch();
    }

    public function bindphone()
    {
        return $this->fetch();
    }

    public function email()
    {
        return $this->fetch();
    }

    public function idcard()
    {
        return $this->fetch();
    }

    public function question()
    {
        return $this->fetch();
    }

    public function address()
    {
        $userid=Session::get('user.id');

        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){
                $arr['consignee']=$data['consignee'];
                $arr['mobile']=$data['mobile'];
                $arr['province']=$data['provinces'];
                $arr['city']=$data['citys'];
                $arr['country']=$data['countys'];
                $arr['address']=$data['address'];
                $arr['zipcode']=$data['zipcode'];
                $arr['members_id']=$userid;
                $arr['is_default']=0;

                $rows=Db::name('members_address')->insert($arr);
                
                if($rows){
                    $info['status']=1;
                    $info['msg']="添加成功";
                    return json($info);
                }else{
                    $info['status']=0;
                    $info['msg']="添加失败";
                    return json($info);
                }
            }
        }

        $address=Db::name('members_address')->where(['members_id'=>$userid,'status'=>1])->select();
        
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
        // echo "<pre>";
        //     print_r($address);
        // echo "</pre>";
        // exit;

        $this->assign('address',$address);

        return $this->fetch();
    }


    public function delete_address()
    {
        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){
                $rows=Db::name('members_address')->where('id='.$data['id'])->update(['status'=>0]);
                if($rows){
                    $info['status']=1;
                    $info['msg']="删除成功";
                    return json($info);
                }else{
                    $info['status']=0;
                    $info['msg']="删除失败";
                    return json($info);
                }
            }
        }
    }

    public function edit_address()
    {

        $consignee=input('');

        // $province=Db::name('province')->select();

        // $city=Db::name('city')->where('city_num='.$consignee['city'])->select();

        // $area=Db::name('area')->where('id='.$consignee['area'])->select();

        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){
                
                $userid=Session::get('user.id');

                $arr['consignee']=$data['consignee'];
                $arr['mobile']=$data['mobile'];
                $arr['province']=$data['provinces'];
                $arr['city']=$data['citys'];
                $arr['country']=$data['countys'];
                $arr['address']=$data['address'];
                $arr['zipcode']=$data['zipcode'];
                $arr['members_id']=$userid;

                $update_address=Db::name('members_address')->where('id='.$data['id'])->update($arr);
                if($update_address!==false){
                    $info['status']=1;
                    $info['msg']="修改成功";
                    return json($info);
                }else{
                    $info['status']=0;
                    $info['msg']="修改失败";
                    return json($info);
                }
            }
        }

        $this->assign('id',$consignee['id']);
        $this->assign('consignee',$consignee['consignee']);
        $this->assign('mobile',$consignee['mobile']);
        $this->assign('province',$consignee['province']);
        $this->assign('city',$consignee['city']);
        $this->assign('area',$consignee['area']);
        $this->assign('address',$consignee['address']);
        $this->assign('zipcode',$consignee['zipcode']);

        // echo "<pre>";
        //     print_r($consignee);
        // echo "</pre>";
        
        return $this->fetch();
    }


    public function set_default()
    {
        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){

                $default=Db::name('members_address')->where('is_default=1')->select();
                
                if(!empty($default)){
                    foreach ($default as $key => $value) {
                        $update=Db::name('members_address')->where('id='.$default[$key]['id'])->update(['is_default'=>0]);
                    }
                }

                $rows=Db::name('members_address')->where('id='.$data['id'])->update(['is_default'=>1]);

                if($rows!==false){
                    $info['status']=1;
                    $info['msg']="设置成功";
                    return json($info);
                }else{
                    $info['status']=0;
                    $info['msg']="设置失败";
                    return json($info);
                }
            }
        }
    }

    public function get_area()
    {

        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){

                $type = isset($data['type'])?$data['type']:0;//获取请求信息类型 1省 2市 3区
                $province_num = isset($data['pnum'])?$data['pnum']:'440000';//根据省编号查市信息
                $city_num = isset($data['cnum'])?$data['cnum']:'440100';//根据市编号查区信息

                switch ($type) {//根据请求信息类型，组装对应的sql
                    case 1://省
                        $row=Db::name('province')->select();
                        break;
                    case 2://市
                        $row=Db::name('city')->where('province_num='.$province_num)->select();
                        break;
                    case 3://区
                        $row=Db::name('area')->where('city_num='.$city_num)->select();
                        break;
                    default:
                        die('no data');
                        break;
                }
                
                return json($row);//返回json数据
            }
        }
        
    }

    public function get_city()
    {
        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){

                $province_num = $data['pnum'];//根据市编号查区信息

                $row=Db::name('city')->where('province_num='.$province_num)->select();
                
                return json($row);//返回json数据
            }
        }
    }


    public function get_countys()
    {
        if (Request::instance()->isAjax()){
            
            $data=Request::instance()->post();
            if(!empty($data)){

                $city_num = $data['cnum'];//根据市编号查区信息

                $row=Db::name('area')->where('city_num='.$city_num)->select();
                
                return json($row);//返回json数据
            }
        }
    }


    public function cardlist()
    {
        return $this->fetch();
    }


    public function cardmethod()
    {
        return $this->fetch();
    }


    public function order()
    {
        return $this->fetch();
    }


    public function change()
    {
        return $this->fetch();
    }

    public function comment()
    {
        return $this->fetch();
    }

    public function points()
    {
        return $this->fetch();
    }

    public function coupon()
    {
        return $this->fetch();
    }

    public function bonus()
    {
        return $this->fetch();
    }

    public function walletlist()
    {
        return $this->fetch();
    }

    public function bill()
    {
        return $this->fetch();
    }

    public function billlist()
    {
        return $this->fetch();
    }

    public function collection()
    {
        return $this->fetch();
    }

    public function foot()
    {
        return $this->fetch();
    }


    public function consultation()
    {
        return $this->fetch();
    }

    public function suggest()
    {
        return $this->fetch();
    }

    public function news()
    {
        return $this->fetch();
    }

    public function blog()
    {
        return $this->fetch();
    }

    public function logistics()
    {
        return $this->fetch();
    }

    public function record()
    {
        return $this->fetch();
    }

    
    public function test()
    {
        $request = Request::instance();
        $ip = $request->ip();
        $url='http://ip.taobao.com/service/getIpInfo.php?ip='.$ip;
        $result = file_get_contents($url);
        $result = json_decode($result,true);
        dump($result);
    }



}
