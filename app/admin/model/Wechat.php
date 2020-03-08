<?php
namespace app\admin\model;

use \think\Model;

class Wechat extends Model {
    /**
     * @parms
     */
    public $appId;
    public $appSecret;

    public function __construct($appId,$appSecret){
        $this->appId=$appId;
        $this->appSecret=$appSecret;
    }

    //获取access_token
    public function get_access_token()
    {
        $get_access_token_url="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".$this->appId."&secret=".$this->appSecret;

        $memcache=new \Memcache();
        $memcache->connect('127.0.0.1',11211) or die('Count not connect...');

        $access_token=$memcache->get('access_token');
        
        if($access_token=="" || $access_token==null){
            
            $access_token=$this->https_request($get_access_token_url);

            $memcache->set('access_token',$access_token,0,7000);
        }

        if(empty($access_token)){
            $access_token['access_token']="";
        }
        
        return $access_token;
    }

    //获取微信服务器IP
    public function get_client_ip()
    {
        $get_access_token=$this->get_access_token();

        $access_token=$get_access_token['access_token'];

        $get_client_ip_url="https://api.weixin.qq.com/cgi-bin/getcallbackip?access_token=".$access_token;
        $get_client_ip=$this->https_request($get_client_ip_url);
        
        return $get_client_ip;
    }

    //设置用户标签
    //一个公众号，最多可以创建100个标签。
    public function add_users_tag($obj)
    {
        $get_access_token=$this->get_access_token();
        $add_users_tag_url="https://api.weixin.qq.com/cgi-bin/tags/create?access_token=".$get_access_token['access_token'];
        
        $add_users_tag=$this->https_request($add_users_tag_url,$obj);
        
        return $add_users_tag;
    }

    //获取公众号已创建的标签
    public function get_users_tag()
    {
        $get_access_token=$this->get_access_token();
        $get_users_tag_url="https://api.weixin.qq.com/cgi-bin/tags/get?access_token=".$get_access_token['access_token'];
        
        $get_users_tag=$this->https_request($get_users_tag_url);
        
        return $get_users_tag;
    }

    //编辑标签
    public function edit_users_tag($obj)
    {
        $get_access_token=$this->get_access_token();
        $edit_users_tag_url="https://api.weixin.qq.com/cgi-bin/tags/update?access_token=".$get_access_token['access_token'];
        
        $edit_users_tag=$this->https_request($edit_users_tag_url,$obj);
        
        return $edit_users_tag;
    }

    //删除标签
    public function delete_users_tag($obj)
    {
        $get_access_token=$this->get_access_token();
        $delete_users_tag_url="https://api.weixin.qq.com/cgi-bin/tags/delete?access_token=".$get_access_token['access_token'];
        
        $delete_users_tag=$this->https_request($delete_users_tag_url,$obj);
        
        return $delete_users_tag;
    }

    //获取标签下粉丝列表,$obj格式{   "tagid" : 134,   "next_openid":""//第一个拉取的OPENID，不填默认从头开始拉取 }
    public function get_tags_users($obj)
    {
        $get_access_token=$this->get_access_token();
        $get_tags_users_url="https://api.weixin.qq.com/cgi-bin/user/tag/get?access_token=".$get_access_token['access_token'];
        
        $get_tags_users=$this->https_request($get_tags_users_url,$obj);
        
        return $get_tags_users;
    }

    //批量为用户打标签
    public function add_batch_users_tag($obj)
    {
        $get_access_token=$this->get_access_token();
        $add_batch_users_tag_url="https://api.weixin.qq.com/cgi-bin/tags/members/batchtagging?access_token=".$get_access_token['access_token'];
        
        $add_batch_users_tag=$this->https_request($add_batch_users_tag_url,$obj);
        
        return $add_batch_users_tag;
    }

    // 批量为用户取消标签
    public function delete_batch_users_tag($obj)
    {
        $get_access_token=$this->get_access_token();
        $delete_batch_users_tag_url="https://api.weixin.qq.com/cgi-bin/tags/members/batchuntagging?access_token=".$get_access_token['access_token'];
        
        $delete_batch_users_tag=$this->https_request($delete_batch_users_tag_url,$obj);
        
        return $delete_batch_users_tag;
    }

    //获取用户身上的标签列表
    public function get_user_tag_list($obj)
    {
        $get_access_token=$this->get_access_token();
        $get_user_tag_list_url="https://api.weixin.qq.com/cgi-bin/tags/getidlist?access_token=".$get_access_token['access_token'];
        
        $get_user_tag_list=$this->https_request($get_user_tag_list_url,$obj);
        
        return $get_user_tag_list;
    }

    //设置用户备注名
    //开发者可以通过该接口对指定用户设置备注名，该接口暂时开放给微信认证的服务号。 接口调用请求说明
    public function set_users_remark($obj)
    {
        $get_access_token=$this->get_access_token();
        $set_users_remark_url="https://api.weixin.qq.com/cgi-bin/user/info/updateremark?access_token=".$get_access_token['access_token'];
        
        $set_users_remark=$this->https_request($set_users_remark_url,$obj);
        
        return $set_users_remark;
    }

    //获取用户基本信息(UnionID机制)
    public function get_user_info()
    {
        $get_access_token=$this->get_access_token($openid);
        $get_user_info_url="https://api.weixin.qq.com/cgi-bin/user/info?access_token=".$get_access_token['access_token']."&openid=".$openid."&lang=zh_CN";
        
        $get_user_info=$this->https_request($get_user_info_url);
        
        return $get_user_info;
    }

    //网页授权获取用户信息
    public function oauth2_get_user_info()
    {
        //根据code是否存在获取用户信息
        if(!isset($_GET['code'])){

            $callback='http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];
            
            $this->get_code($callback);

        }else{
            
            //通过code换取网页授权access_token
            $code = $_GET['code'];

            $memcache = new \Memcache();
            $memcache->connect('127.0.0.1',11211) or die('Count not connect...');

            $get_oauth2_access_token=$memcache->get('get_oauth2_access_token');

            if($oauth2_access_token==unll){
                //获取网页授权access_token
                $get_oauth2_access_token="https://api.weixin.qq.com/sns/oauth2/access_token?appid=".$this->appId."&secret=".$this->appSecret."&code=".$code."&grant_type=authorization_code";
                //通过access_token获取refresh_token, refresh_token有效期为30天
                $get_refresh_token=$memcache->get('get_refresh_token');

                if($get_refresh_token==unll){
                    
                    $get_refresh_token="https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=".$this->appId."&grant_type=refresh_token&refresh_token=".$get_oauth2_access_token['refresh_token'];

                    $memcache->set('get_oauth2_access_token',$get_refresh_token,0,2592000);
                }
                
            }
            
            $oauth2_arr=$this->https_request($get_oauth2_access_token);
                
            $get_user_info_url="https://api.weixin.qq.com/sns/userinfo?access_token=".$oauth2_arr['access_token']."&openid=".$oauth2_arr['openid']."&lang=zh_CN";
            $oauth2_get_user_info=$this->https_request($get_user_info_url);
            
            return $oauth2_get_user_info;
        }
        
    }

    //用户同意授权,获取code
    protected function get_code($callback)
    {
        $scope="snsapi_userinfo";
        $state=md5(rand());
        $get_code_url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$this->appId."&redirect_uri=".urlencode($callback)."&response_type=code&scope=".$scope."&state=".$state."#wechat_redirect";
        header("Location:".$get_code_url);
    }

    //获取用户列表方法一
    public function get_users_list()
    {
        $get_access_token=$this->get_access_token();

        $access_token=$get_access_token['access_token'];
        //获取所有用户的总数以及openid
        $get_users_data_url="https://api.weixin.qq.com/cgi-bin/user/get?access_token=".$access_token;

        //获取用户openid
        $get_users_data=$this->https_request($get_users_data_url);
        
        if(is_array($get_users_data['data']['openid'])){
            
            foreach ($get_users_data['data']['openid'] as $key => $value) {
                $user_list['user_list'][$key]['openid']=$value;
                $user_list['user_list'][$key]['lang']='zh_CN';
            }
        }
        
        $get_users_list=json_encode($user_list);
        $get_users_list_url="https://api.weixin.qq.com/cgi-bin/user/info/batchget?access_token=".$access_token;

        $get_users_list=$this->https_request($get_users_list_url,$get_users_list);
        
        return $get_users_list;
    }

    //获取用户列表方法二
    public function get_user_tabulation($next_openid)
    {
        $get_access_token=$this->get_access_token($openid);
        $get_user_tabulation_url="https://api.weixin.qq.com/cgi-bin/user/get?access_token=".$get_access_token['access_token']."&next_openid=".$next_openid;
        
        $get_user_tabulation=$this->https_request($get_user_tabulation_url);
        
        return $get_user_tabulation;
    }

    //获取用户地理位置
    public function get_users_location()
    {

    }

    //黑名单管理

    //获取公众号的黑名单列表
    public function get_black_list($begin_openid)
    {
        $get_access_token=$this->get_access_token();
        $get_black_list_url="https://api.weixin.qq.com/cgi-bin/tags/members/getblacklist?access_token=".$get_access_token['access_token'];
        
        $get_black_list=$this->https_request($get_black_list_url,$begin_openid);
        
        return $get_black_list;
    }

    //拉黑用户
    public function pull_black_list($openid)
    {
        $get_access_token=$this->get_access_token();
        $pull_black_list_url="https://api.weixin.qq.com/cgi-bin/tags/members/batchblacklist?access_token=".$get_access_token['access_token'];
        
        $pull_black_list=$this->https_request($pull_black_list_url,$openid);
        
        return $pull_black_list;
    }

    //取消拉黑用户
    public function recover_black_list($openid)
    {
        $get_access_token=$this->get_access_token();
        $recover_black_list_url="https://api.weixin.qq.com/cgi-bin/tags/members/batchunblacklist?access_token=".$get_access_token['access_token'];
        
        $recover_black_list=$this->https_request($recover_black_list_url,$openid);
        
        return $recover_black_list;
    }

    //管理微信自定义菜单
    /**
    ** methods:management_wxmenu()默认不传参数则查询微信菜单;
    ** $jsonmenu:创建菜单时post的json数据,默认值为null;
    ** $type:查询或者删除菜单的参数:等于get时为查询微信菜单;
    ** 等于delete时为删除微信菜单,默认值为get.
    **/
    public function management_wxmenu($jsonmenu=null,$type='get'){
        
        $get_access_token=$this->get_access_token();

        if(isset($get_access_token['access_token'])){
            $access_token=$get_access_token['access_token'];
        }else{
            $access_token="";
        }
        

        $wxmenu_url="https://api.weixin.qq.com/cgi-bin/menu/".$type."?access_token=".$access_token;

        //判断是创建微信菜单还是查询或者是删除
        if($type=='create'){
            $create_wxmenu=$this->https_request($wxmenu_url,$jsonmenu);
            if($create_wxmenu['errcode']==0 && $create_wxmenu['errmsg']=='ok'){
                return $create_wxmenu['errcode'];
            }else{
                return $create_wxmenu['errcode'];
            }
        }elseif ($type=='delete') {
            $delete_wxmenu=$this->https_request($wxmenu_url);
            if($delete_wxmenu['errcode']==0 && $delete_wxmenu['errmsg']=='ok'){
                return true;
            }else{
                return $delete_wxmenu;
            }
        }else{
            $select_wxmenu=$this->https_request($wxmenu_url);
            return $select_wxmenu;
        }
    }

    //设置微信公众号所属行业
    public function set_industry($obj)
    {   
        $get_access_token=$this->get_access_token();
        $set_industry_url="https://api.weixin.qq.com/cgi-bin/template/api_set_industry?access_token=".$get_access_token['access_token'];
        $set_industry=$this->https_request($set_industry_url,$obj);
        return $set_industry;
    }

    //获取微信公众号所属行业
    public function get_industry()
    {
        $get_access_token=$this->get_access_token();
        $get_industry_url="https://api.weixin.qq.com/cgi-bin/template/get_industry?access_token=".$get_access_token['access_token'];
        $get_industry=$this->https_request($get_industry_url);
        return $get_industry;
    }

    //获取模板ID
    public function get_template_id($obj)
    {
        $get_access_token=$this->get_access_token();
        $get_template_url="https://api.weixin.qq.com/cgi-bin/template/api_add_template?access_token=".$get_access_token['access_token'];
        $get_template_id=$this->https_request($get_template_url,$obj);
        return $get_template_id;
    }

    //获取模板消息列表
    public function get_template_message()
    {
        $get_access_token=$this->get_access_token();
        $get_template_message_url="https://api.weixin.qq.com/cgi-bin/template/get_all_private_template?access_token=".$get_access_token['access_token'];
        $get_template_message=$this->https_request($get_template_message_url);
        return $get_template_message;
    }

    //删除模板消息
    public function delete_template_message($obj)
    {
        $get_access_token=$this->get_access_token();
        $delete_template_message_url="https://api.weixin.qq.com/cgi-bin/template/del_private_template?access_token=".$get_access_token['access_token'];
        $delete_template_message=$this->https_request($delete_template_message_url,$obj);
        return $delete_template_message;
    }


    //发送模板消息
    public function send_template_message($post){
        $get_access_token=$this->get_access_token();
        $send_template_message_url="https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=".$get_access_token['access_token'];
        $post=json_encode($post);
        
        $send_template_message=$this->https_request($send_template_message_url,$post);
        
        return $send_template_message;

    }

    //新增临时素材$type:分别有图片（image）、语音（voice）、视频（video）和缩略图（thumb）3天之后media_id自动失效，返回值：array
    public function add_temp_material($obj,$type)
    {
        $get_access_token=$this->get_access_token();
        $add_temp_material_url="https://api.weixin.qq.com/cgi-bin/media/upload?access_token=".$get_access_token['access_token']."&type=".$type;
        $file_data=$this->up_media($obj);

        $add_temp_material=$this->https_request($add_temp_material_url,$file_data);

        return $add_temp_material;
    }


    //获取临时素材
    public function get_temp_material($media_id)
    {
        $get_access_token=$this->get_access_token();
        $get_temp_material_url="https://api.weixin.qq.com/cgi-bin/media/get?access_token=".$get_access_token['access_token']."&media_id=".$media_id;
        $get_temp_material=$this->https_get_files($get_temp_material_url);
        
        return $get_temp_material;
    }

    //新增永久图文素材
    public function add_forever_news($obj)
    {
        $get_access_token=$this->get_access_token();
        $add_forever_news_url="https://api.weixin.qq.com/cgi-bin/material/add_news?access_token=".$get_access_token['access_token'];
        $add_forever_news=$this->https_request($add_forever_news_url,$obj);

        return $add_forever_news;
    }

    //新增其他类型永久素材//当type为thumb可以获取thumb_media_id 该接口每日限制调用10次
    //特别注意：上传视频待测试
    public function add_forever_material($obj,$type,$description=null)
    {
        $get_access_token=$this->get_access_token();
        $add_forever_material_url="https://api.weixin.qq.com/cgi-bin/material/add_material?access_token=".$get_access_token['access_token']."&type=".$type;
        
        $file_data=$this->up_media($obj);

        if($type=="video"){

            $file_data['description']=$description;
        }

        // $filedata = array("media"  => new \CURLFile($file_path),'description' => '{"title":"shiping", "introduction":"介绍"}');

        $add_forever_material=$this->https_request($add_forever_material_url,$file_data);

        return $add_forever_material;
    }


    //上传图文消息内的图片获取URL【订阅号与服务号认证后均可用】
    public function get_uploads_img($img)
    {
        $get_access_token=$this->get_access_token();
        $get_uploads_img_url="https://api.weixin.qq.com/cgi-bin/media/uploadimg?access_token=".$get_access_token['access_token'];
        
        $file_data=$this->up_media($img);

        $get_uploads_img=$this->https_request($get_uploads_img_url,$file_data);

        return $get_uploads_img;
    }

    

    //获取永久素材
    public function get_forever_material($obj)
    {
        $get_access_token=$this->get_access_token();
        $get_forever_material_url="https://api.weixin.qq.com/cgi-bin/material/get_material?access_token=".$get_access_token['access_token'];
        $get_forever_material=$this->https_request($get_forever_material_url,$obj);

        return $get_forever_material;
    }

    //删除永久素材
    public function delete_forever_material($obj)
    {
        $get_access_token=$this->get_access_token();
        $delete_forever_material_url="https://api.weixin.qq.com/cgi-bin/material/del_material?access_token=".$get_access_token['access_token'];
        $delete_forever_material=$this->https_request($delete_forever_material_url,$obj);

        return $delete_forever_material;
    }

    //修改永久图文素材
    public function edit_forever_material($obj)
    {
        $get_access_token=$this->get_access_token();
        $edit_forever_material_url="https://api.weixin.qq.com/cgi-bin/material/update_news?access_token=".$get_access_token['access_token'];
        $edit_forever_material=$this->https_request($edit_forever_material_url,$obj);

        return $edit_forever_material;
    }

    //获取素材总数
    public function get_total_material()
    {
        $get_access_token=$this->get_access_token();
        $get_total_material_url="https://api.weixin.qq.com/cgi-bin/material/get_materialcount?access_token=".$get_access_token['access_token'];
        $get_total_material=$this->https_request($get_total_material_url);

        return $get_total_material;
    }

    //获取素材列表
    public function get_material($obj)
    {
        $get_access_token=$this->get_access_token();
        $get_material_url="https://api.weixin.qq.com/cgi-bin/material/batchget_material?access_token=".$get_access_token['access_token'];
        $get_material=$this->https_request($get_material_url,$obj);

        return $get_material;
    }

    //上传图文消息素材【订阅号与服务号认证后均可用】
    public function get_upload_news($obj)
    {
        $get_access_token=$this->get_access_token();
        $get_upload_news_url="https://api.weixin.qq.com/cgi-bin/media/uploadnews?access_token=".$get_access_token['access_token'];
        $get_upload_news=$this->https_request($get_upload_news_url,$obj);

        return $get_upload_news;
    }

    //群发消息根据openID群发
    /*
    * 【订阅号不可用，服务号认证后可用】
    * 
    */
    public function send_all_openid_message($obj)
    {
        $get_access_token=$this->get_access_token();
        $send_all_openid_message_rul="https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token=".$get_access_token['access_token'];
        $send_all_openid_message=$this->https_request($send_all_openid_message_rul,$obj);
        
        return $send_all_openid_message;
    }

    //群发消息根据标签群发
    /*
    * 【订阅号/服务号认证均可用】
    * 
    */
    public function send_all_tag_message($obj)
    {
        $get_access_token=$this->get_access_token();
        $send_all_tag_message_url="https://api.weixin.qq.com/cgi-bin/message/mass/sendall?access_token=".$get_access_token['access_token'];
        $send_all_tag_message=$this->https_request($send_all_tag_message_url,$obj);
        
        return $send_all_tag_message;
    }

    //预览接口【订阅号与服务号认证后均可用】
    public function preview($obj)
    {
        $get_access_token=$this->get_access_token();
        $preview_url="https://api.weixin.qq.com/cgi-bin/message/mass/preview?access_token=".$get_access_token['access_token'];
        $preview=$this->https_request($preview_url,$obj);
        
        return $preview;
    }

    //用户分析数据接口 获取用户增减数据
    public function get_user_summary($begin_date,$end_date)
    {
        $get_access_token=$this->get_access_token();
        $get_user_summary_url="https://api.weixin.qq.com/datacube/getusersummary?access_token=".$get_access_token['access_token'];
        $arr['begin_date']=$begin_date;
        $arr['end_date']=$end_date;

        $obj=json_encode($arr,JSON_UNESCAPED_UNICODE);

        $get_user_summary=$this->https_request($get_user_summary_url,$obj);
        
        return $get_user_summary;
    }

    //获取累计用户数据
    public function get_user_cumulate($begin_date,$end_date)
    {
        $get_access_token=$this->get_access_token();
        $get_user_cumulate_url="https://api.weixin.qq.com/datacube/getusercumulate?access_token=".$get_access_token['access_token'];
        $arr['begin_date']=$begin_date;
        $arr['end_date']=$end_date;

        $obj=json_encode($arr,JSON_UNESCAPED_UNICODE);

        $get_user_cumulate=$this->https_request($get_user_cumulate_url,$obj);
        
        return $get_user_cumulate;
    }

    //生成带参数的二维码  提醒：TICKET记得进行UrlEncode
    public function get_qrcode($obj,$download)
    {
        $get_ticket=$this->get_ticket($obj);

        $get_qrcode_url="https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=".urlencode($get_ticket['ticket']);

        $https_get_files=$this->https_get_files($get_qrcode_url);

        $short_url=$this->get_short_url($https_get_files['header']['url']);

        $get_qrcode=$this->save_qrcode($short_url['short_url'],$download);

        return $get_qrcode;
    }

    //获取公众号的自动回复规则
    public function get_autoreply_rule()
    {
        $get_access_token=$this->get_access_token();
        $get_autoreply_rule_url="https://api.weixin.qq.com/cgi-bin/get_current_autoreply_info?access_token=".$get_access_token['access_token'];
        $get_autoreply_rule=$this->https_request($get_autoreply_rule_url);
        
        return $get_autoreply_rule;
    }

    //长链接转短链接接口
    protected function get_short_url($long_url)
    {
        $get_access_token=$this->get_access_token();
        $long2short_url="https://api.weixin.qq.com/cgi-bin/shorturl?access_token=".$get_access_token['access_token'];
        $arr['action']='long2short';
        $arr['long_url']=$long_url;
        $obj=json_encode($arr,JSON_UNESCAPED_UNICODE);
        $get_short_url=$this->https_request($long2short_url,$obj);
        
        return $get_short_url;
    }

    //通过URL地址保存二维码图片参数 $download为true表示下载，为false表示显示图片
    protected function save_qrcode($url,$download)
    {
        $filename = 'flyfly-'.date('YmdHis',time()).'.jpg';
        $path=ROOT_PATH.'public/uploads/qrcode/';
        ob_start();
        readfile($url);
        $img=ob_get_contents();
        ob_end_clean();
        $size=strlen($img);
        if(!is_dir($path)){

            mkdir($path, 0777, true);
        }else{
            if(!is_writable($path)){
                // echo $path.'目录不可写';exit;
                chmod($path,0777);
            }
        }

        $fp2=fopen($path.$filename,"a");

        if(fwrite($fp2,$img) === false){

            return '';
        }

        fclose($fp2);

        if($download==1){
            header("Cache-Control: must-revalidate, post-check=0, pre-check=0"); 
            header('Content-Description: File Transfer'); 
            header('Content-Type: application/octet-stream'); 
            header('Content-Length: ' . filesize($path.$filename)); 
            header('Content-Disposition: attachment; filename=' . basename($path.$filename)); 
            readfile($path.$filename);
            return $path.$filename;
        }else{

            return $path.$filename;
        }
        
        
    }


    //获取二维码ticket  POST数据例子：{"expire_seconds": 604800, "action_name": "QR_SCENE", "action_info": {"scene": {"scene_id": 123}}}
    //或者也可以使用以下POST数据创建字符串形式的二维码参数：{"expire_seconds": 604800, "action_name": "QR_STR_SCENE", "action_info": {"scene": {"scene_str": "test"}}}
    protected function get_ticket($obj)
    {
        $get_access_token=$this->get_access_token();
        $get_ticket_url="https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=".$get_access_token['access_token'];
        $get_ticket=$this->https_request($get_ticket_url,$obj);

        return $get_ticket;
    }

    //模拟数据请求
    protected function https_request($obj_url,$data=null)
    {
        $curl = curl_init();//初始化一个cURL会话
        curl_setopt($curl, CURLOPT_URL, $obj_url);//需要获取的 URL地址，也可以在curl_init() 初始化会话的时候 
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);//禁止 cURL 验证对等证书 
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);//设置为1是检查服务器SSL证书中是否存在一个公用名(common name)。 
        if (!empty($data)){
            curl_setopt($curl, CURLOPT_POST, TRUE);//TRUE时会发送POST请求，类型为：application/x-www-form-urlencoded，是HTML表单提交时最常见的一种。
            curl_setopt($curl, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)');
            @curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
            curl_setopt($curl, CURLOPT_AUTOREFERER, 1);

            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);//全部数据使用HTTP协议中的"POST" 操作来发送。 
        } 
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);//TRUE 将curl_exec()获取的信息以字符串返回，而不是直接输出。
        $outputstr = curl_exec($curl);//执行一个cURL会话
        curl_close($curl);//关闭一个cURL会话

        return json_decode($outputstr,TRUE);
        
    }


    //获得文件内容
    protected function https_get_files($url)
    {
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_HEADER, 0);    
        curl_setopt($ch, CURLOPT_NOBODY, 0);    //只取body头
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        $package = curl_exec($ch);
        $httpinfo = curl_getinfo($ch);
        curl_close($ch);
        $obj = array_merge(array('header' => $httpinfo), array('body' => $package)); 
        
        return $obj;
        
    }

    //CURL上传多媒体文件
    protected function up_media($obj)
    {
        if(phpversion()<'5.5'){
            $file_data = array('media'  => '@'.$obj);
            //传递的数组，方式一：使用'@'符号加上文件的绝对路径来指引文件。这种方式适合PHP5.5之前的版本。
        }else{
            $file_data = array("media"  => new \CURLFile($obj));
            //传递的数组，方式二：从PHP5.5版本以后，引入了新的CURLFile 类来指向文件，参数传入的也是绝对路径
        }
        return $file_data;
    }
}