<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Db;

$rows=Db::name('wechat_config')->where('id',1)->limit(0,1)->find();

define("TOKEN", $rows['token']);

class Wx extends Controller
{
	public function _initialize()//_initialize与__construct有区别
	{
		// parent::_initialize();
	 //    $request= Request::instance();
	 //    $module_name=$request->module();
	 //    $action=$request->action();
	 //    $controller=$request->controller();
	 //    $action=$module_name."/".$controller."/".$action;
	 //    parent::admin_priv($action);
	}

	public function index()
	{

        if(!isset($_GET['echostr'])){
            $this->response_user_msg();
        }else{
            $this->valid();
        }
        
	}

	//验证消息
	public function valid()
    {
        $echoStr = $_GET["echostr"];

        //判断签名是否合法
        if($this->check_signature()){
            echo $echoStr;
            exit;
        }
    }
	
	//检查签名
	private function check_signature()
    {
        // 判断TOKEN是否存在
        if (!defined("TOKEN")) {
            throw new Exception('TOKEN is not defined!');
        }
        
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];
                
        $token = TOKEN;
        $tmpArr = array($token, $timestamp, $nonce);
        // 使用sort对数组排序
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode( $tmpArr );
        //sha1加密
        $tmpStr = sha1( $tmpStr );
        
        if( $tmpStr == $signature ){
            return true;
        }else{
            return false;
        }
    }

    //相应用户的请求
    public function response_user_msg()
    {
        // $PostStr = $GLOBALS["HTTP_RAW_POST_DATA"];//无法使用时请用file_get_contents("php://input")
        $PostStr = file_get_contents("php://input");//无法使用时请用file_get_contents("php://input")

        $PostObj = simplexml_load_string($PostStr, 'SimpleXMLElement', LIBXML_NOCDATA);
        $MsgType=$PostObj->MsgType;
        $this->check_msg_type($PostObj,$MsgType); 
    
    }


    //检查消息类型
    public function check_msg_type($PostObj,$MsgType){

        switch ($MsgType) {
            case 'text':
                $this->receive_text($PostObj);
                break;
            case 'image':
                $this->receive_image($PostObj);
                break;
            case 'voice':
                $this->receive_voice($PostObj);
                break;
            case 'video':
                $this->receive_video($PostObj);
                break;
            case 'shortvideo':
                $this->receive_shortvideo($PostObj);
                break;
            case 'location':
                $this->receive_location($PostObj);
                break;
            case 'link':
                $this->receive_link($PostObj);
                break;
            default:
                # code...
                break;
        }
    }

    //处理文本消息
    public function receive_text($PostObj){
        $Content=$PostObj->Content;
        switch ($Content) {
            case '点歌':
               $this->reply_music($PostObj);
                break;
            case '天气':
                $this->reply_weather($PostObj);
                break;
            default:
                $this->reply_default($PostObj);
                break;
        }
    }

    //处理图片消息
    public function receive_image($PostObj){
        $MediaId=$PostObj->MediaId;
        $this->reply_image($PostObj,$MediaId);
    }

    //处理语音消息
    public function receive_voice($PostObj){
        $MediaId=$PostObj->MediaId;
        $Recognition=$PostObj->Recognition;
        $this->reply_voice($PostObj,$MediaId,$Recognition);
    }

    //处理视频消息
    public function receive_video($PostObj){
        $MediaId=$PostObj->MediaId;
        $ThumbMediaId=$PostObj->$ThumbMediaId;
        $this->reply_video($PostObj,$MediaId,$ThumbMediaId);
    }

    //处理位置消息
    public function receive_location($PostObj){
        $Label=$PostObj->Label;
        $xml='<xml>
            <ToUserName><![CDATA[%s]]></ToUserName>
            <FromUserName><![CDATA[%s]]></FromUserName>
            <CreateTime>%d</CreateTime>
            <MsgType><![CDATA[text]]></MsgType>
            <Content><![CDATA[%s]]></Content>
            </xml>';
        if(!empty($Label)){
            //保存位置信息
            // $memcache=new Memcache();
            // $memcache->connect('localhost', 11211) or die ("Could not connect");
            // $memcache->set('Label',$Label);

            $Location="你当前的位置[".$Label."]已经被保存";
            echo sprintf($xml,$PostObj->FromUserName,$PostObj->ToUserName,time(),$Location);
        }else{
            $notice="位置保存失败,请稍后再试";
            echo sprintf($xml,$PostObj->FromUserName,$PostObj->ToUserName,time(),$notice);
        }
        

    }

    //回复点歌消息
    public function reply_music($PostObj){
        $singer=$this->gets_kugou_music();
        $xml="<xml>
                <ToUserName><![CDATA[%s]]></ToUserName>
                <FromUserName><![CDATA[%s]]></FromUserName>
                <CreateTime>%d</CreateTime>
                <MsgType><![CDATA[news]]></MsgType>
                <ArticleCount>1</ArticleCount>
                <Articles>
                <item>
                <Title><![CDATA[".$singer['data']['audio_name']."]]></Title> 
                <Description><![CDATA[".$singer['data']['album_name']."]]></Description>
                <PicUrl><![CDATA[".$singer['data']['img']."]]></PicUrl>
                <Url><![CDATA[".$singer['data']['play_url']."]]></Url>
                </item>
                </Articles>
                </xml>";
        echo sprintf($xml,$PostObj->FromUserName,$PostObj->ToUserName,time());



        // $xml='<xml>
        //     <ToUserName><![CDATA[%s]]></ToUserName>
        //     <FromUserName><![CDATA[%s]]></FromUserName>
        //     <CreateTime>%d</CreateTime>
        //     <MsgType><![CDATA[text]]></MsgType>
        //     <Content><![CDATA[%s]]></Content>
        //     </xml>';
        // echo sprintf($xml,$PostObj->FromUserName,$PostObj->ToUserName,time(),$singer['data']['audio_name']);
    }

    //回复用户图片消息
    public function reply_image($PostObj,$MediaId){
        $xml='<xml>
            <ToUserName><![CDATA[%s]]></ToUserName>
            <FromUserName><![CDATA[%s]]></FromUserName>
            <CreateTime>%d</CreateTime>
            <MsgType><![CDATA[image]]></MsgType>
            <Image>
                <MediaId><![CDATA[%s]]></MediaId>
            </Image>
            </xml>';
        echo sprintf($xml,$PostObj->FromUserName,$PostObj->ToUserName,time(),$MediaId);
    }

    //默认回复文本消息
    public function reply_default($PostObj){
        $Content=$PostObj->Content;
        $xml='<xml>
            <ToUserName><![CDATA[%s]]></ToUserName>
            <FromUserName><![CDATA[%s]]></FromUserName>
            <CreateTime>%d</CreateTime>
            <MsgType><![CDATA[text]]></MsgType>
            <Content><![CDATA[%s]]></Content>
            </xml>';
        echo sprintf($xml,$PostObj->FromUserName,$PostObj->ToUserName,time(),'你好');
        
    }

    //随机获取一首酷狗音乐接口
    protected function gets_kugou_music($obj_name=null){
        if(empty($obj_name)){
            $obj_name=$this->gets_singer();
        }
        
        $get_all_info_url="http://songsearch.kugou.com/song_search_v2?keyword=".$obj_name."&userid=-1&clientver=&platform=WebFilter&tag=em&filter=2&iscorrection=1&privilege_filter=0";
        $get_all_info=$this->https_request($get_all_info_url);
        if(empty($get_all_info)){
            $this->gets_kugou_music();
        }
        $tot_music_info=count($get_all_info['data']['lists']);
        if($tot_music_info==0){
            $this->gets_kugou_music();
        }
        $get_info_url="http://songsearch.kugou.com/song_search_v2?keyword=".$obj_name."&page=".rand(1,$tot_music_info)."&pagesize=1&userid=-1&clientver=&platform=WebFilter&tag=em&filter=2&iscorrection=1&privilege_filter=0";
        $get_info=$this->https_request($get_info_url);

        $get_music_url="http://www.kugou.com/yy/index.php?r=play/getdata&hash=".$get_info['data']['lists'][0]['FileHash']."&album_id=".$get_info['data']['lists'][0]['AlbumID'];
        $get_music=$this->https_request($get_music_url);
        if(empty($get_music['data']['play_url'])){
            $this->gets_kugou_music();
        }else{
            return $get_music;
        }
        
    }

    //随机获取一位歌手名称
    protected function gets_singer(){
        $gets_singer_info=strip_tags(file_get_contents(ROOT_PATH.'/singerlist.txt'));
        //将字符串换行替换为空格
        $gets_singer_info=str_replace(PHP_EOL, '', $gets_singer_info);
        //将字符串多个空格替换成一个
        $gets_singer_info=preg_replace("/\s(?=\s)/","\\1",$gets_singer_info);
        
        //将字符串分隔成数组
        $gets_singer_info_arr=explode(' ', $gets_singer_info);
        //随机获取数组的一个key值
        $get_singer_info_arr_key=array_rand($gets_singer_info_arr);

        $get_singer_info=$gets_singer_info_arr[$get_singer_info_arr_key];
        // file_put_contents('errorlog.txt',$get_singer_info);
        if(empty($get_singer_info)){
            $this->gets_singer();
        }else{
            return $get_singer_info;
        }

    }

    //获取天气接口
    protected function get_weather_info($city){
        $city_code=json_decode(file_get_contents('./_city.json'),TRUE);
        foreach ($city_code as $key => $value) {
            if($value['city_name']==$city){
                $city_code=$value['city_code'];
                break;
            }
        }
        $get_weather_url="http://t.weather.sojson.com/api/weather/city/".$city_code;
        $get_weather_info=$this->https_request($get_weather_url);

        return $get_weather_info;
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

}
