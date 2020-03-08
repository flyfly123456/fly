<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:34:"../app/admin/view/index\index.html";i:1548165269;s:56:"D:\phpStudy\WWW\flyfly\app\admin\view\public\header.html";i:1556330191;s:54:"D:\phpStudy\WWW\flyfly\app\admin\view\public\left.html";i:1553753165;s:56:"D:\phpStudy\WWW\flyfly\app\admin\view\public\footer.html";i:1546746502;}*/ ?>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title><?php echo $web_info['web_title']; ?></title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/admin/css/font.css">

	<link rel="stylesheet" href="/static/admin/css/xadmin.css">
    <link rel="stylesheet" href="/static/admin/css/themes/default.css" media="all" id="skin" kit-skin />
    <script type="text/javascript" src="/static/admin/js/jquery.min.js"></script>
    <script src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/admin/js/xadmin.js"></script>
    
</head>
<body>
    <!-- 顶部开始 -->
    <style>
    /*锁屏*/
    .admin-header-lock{width: 320px; height: 170px; padding: 20px; position: relative; text-align: center;}
    .admin-header-lock-img{width: 60px; height: 60px; margin: 0 auto;}
    .admin-header-lock-img img{width: 60px; height: 60px; border-radius: 100%;}
    .admin-header-lock-name{color: #009688;margin: 8px 0 15px 0;}
    .input_btn{ overflow: hidden; margin-bottom: 10px; }
    .admin-header-lock-input{width: 170px; color: #fff;background-color: #009688; float: left; margin:0 10px 0 40px; border:none;}
    .admin-header-lock-input::-webkit-input-placeholder {color:#fff;}
    .admin-header-lock-input::-moz-placeholder {color:#fff;}
    .admin-header-lock-input::-ms-input-placeholder {color:#fff;}
    .admin-header-lock-input:-moz-placeholder {color:#fff;}
    #unlock{ float: left; }
    #lock-box p{ color:#e60000; }
    /*便签和换肤*/
    .demo-class textarea {background:#fff;width:200px;color:#000;border:0;}
    .color-class .layui-layer-btn {position: absolute;top: 50px;}
    /*锁屏禁止选中*/
    .unselect{-moz-user-select: none; -o-user-select:none; -webkit-user-select:none; -ms-user-select:none; user-select:none;}
</style>

<div class="container">
    <div class="logo"><a href=""><?php echo $web_info['web_name']; ?>&nbsp;<?php echo $web_info['web_version']; ?></a></div>
        <div class="left_open">
            <i title="展开/收起左侧栏" class="layui-icon layui-icon-shrink-right"></i>
        </div>
        <ul class="layui-nav left fast-add" lay-filter="">
            <?php if(is_array($system_sort) || $system_sort instanceof \think\Collection || $system_sort instanceof \think\Paginator): $k = 0; $__LIST__ = $system_sort;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$system_sort): $mod = ($k % 2 );++$k;if($system_sort['select'] == 1): if($k == 1): ?>
                        <li data-type="<?php echo $system_sort['sort_name_en']; ?>" class="layui-nav-item layui-this menu-other"><a href="javascript:;"><?php echo $system_sort['sort_name']; ?></a></li>
                    <?php else: ?>
                        <li data-type="<?php echo $system_sort['sort_name_en']; ?>" class="layui-nav-item menu-other"><a href="javascript:;"><?php echo $system_sort['sort_name']; ?></a></li>
                    <?php endif; endif; endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <ul class="layui-nav right" lay-filter="">
            <!-- <li class="layui-nav-item" onclick="view_message()" title="系统消息">
                <a href="javascript:;" id="system_mess" onclick="x_admin_show('系统消息','<?php echo url('admin/System/system_message'); ?>')"><i class="layui-icon layui-icon-notice" style=""><?php if($exits_id): else: ?><span class="layui-badge-dot point"></span><?php endif; ?></i>
                </a>
            </li> -->
            <!-- <li class="layui-nav-item">
                <a href="javascript:;"><i class="layui-icon layui-icon-notice"></i>系统消息
                    <dl class="layui-nav-child">
                        <dd><a onclick="x_admin_show('添加文章','<?php echo url('admin/Article/article_add'); ?>')"><i class="iconfont">&#xe6a2;</i>资讯</a></dd>
                        <dd><a onclick="x_admin_show('图片','http://www.baidu.com')"><i class="iconfont">&#xe6a8;</i>图片</a></dd>
                        <dd><a onclick="x_admin_show('添加用户','<?php echo url('admin/Member/member_add'); ?>')"><i class="iconfont">&#xe6b8;</i>用户</a></dd>
                    </dl>
                </a>
            </li> -->
            <li class="layui-nav-item" title="全屏"><a href="javascript:;" id="FullScreen"><i class="layui-icon layui-icon-screen-full" style=""></i></a></li>
            <li class="layui-nav-item lockcms" title="锁屏"><a href="javascript:;"><i class="iconfont" style="">&#xe82b;</i></a></li>
            <li class="layui-nav-item"><a href="javascript:;" title="便签" id="tag"><i class="layui-icon layui-icon-note" aria-hidden="true"></i></a></li>
            <li class="layui-nav-item"><a href="javascript:;" id="color" title="皮肤"><span class="layui-icon layui-icon-theme"></span></a></li>
            <li class="layui-nav-item"><a href="javascript:;"><i class="iconfont icon-richangqingli"></i>&nbsp;清理缓存</a>
                <dl class="layui-nav-child" id="deletecache">
                    <dd><a href="javascript:;" data-type="all">一键清理缓存</a></dd>
                    <dd><a href="javascript:;" data-type="data">清理数据缓存</a></dd>
                    <dd><a href="javascript:;" data-type="template">清理模板缓存</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;"><i class="layui-icon layui-icon-more-vertical"></i>&nbsp;页面操作</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" class="closePageThis"><i class="layui-icon layui-icon-close"></i>&nbsp;关闭当前</a></dd>
                    <dd><a href="javascript:;" class="closePageOther"><i class="layui-icon layui-icon-close"></i>&nbsp;关闭其他</a></dd>
                    <dd><a href="javascript:;" class="closePageAll"><i class="layui-icon layui-icon-close"></i>&nbsp;关闭全部</a></dd>
                    <dd><a href="javascript:;" class="refreshPageThis refreshThis"><i class="layui-icon layui-icon-refresh"></i>&nbsp;刷新当前</a></dd>
                    <dd><a href="javascript:;" class="refreshPageOther refreshOther"><i class="layui-icon layui-icon-refresh"></i>&nbsp;刷新其他</a></dd>
                    <dd><a href="javascript:;" class="refreshPageAll refreshAll"><i class="layui-icon layui-icon-refresh"></i>&nbsp;刷新所有</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="javascript:;">
                <?php if($admin_info['img_url']): if(($admin_info['img_url'] == 'woman.png') OR ($admin_info['img_url'] == 'man.png')): ?>
                        <img class="layui-nav-img userAvatar" width="35" height="35" src="/uploads/header/<?php echo $admin_info['img_url']; ?>" />
                    <?php else: ?>
                        <img class="layui-nav-img userAvatar" width="35" height="35" src="/uploads/header/<?php echo $admin_info['id']; ?>/<?php echo $admin_info['img_url']; ?>" />
                    <?php endif; else: ?>
                    <img class="layui-nav-img userAvatar" width="35" height="35" src="/static/admin/images/face.jpg" />
                <?php endif; ?><?php echo $admin_name; ?></a>
                <dl class="layui-nav-child"> <!-- 二级菜单 -->
                    <dd><a onclick="x_admin_show('个人资料','<?php echo url('admin/Admin/admin_info'); ?>')"><i class="layui-icon layui-icon-username"></i>个人资料</a></dd>
                    <dd><a onclick="x_admin_show('锁屏密码','<?php echo url('admin/System/clock_pass'); ?>',700,500)"><i class="layui-icon layui-icon-password"></i>锁屏密码</a></dd>
                    <dd><a onclick="x_admin_show('休眠时间','<?php echo url('admin/System/sleep_timeout'); ?>',700,500)" href="javascript:;"><i class="layui-icon layui-icon-log"></i>休眠时间</a></dd>
                    <dd><hr></dd>
                    <dd><a href="javascript:;" onclick="logout(this)"><i class="layui-icon layui-icon-face-cry"></i>退出系统</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item to-index" title="前台首页"><a href="/" target="view_window"><i class="layui-icon layui-icon-website"></i></a></li>
        </ul>

    </div>

    <!-- 锁屏start -->
    <div class="admin-header-lock" id="lock-box" style="display:none;">
        <div class="admin-header-lock-img">
            <?php if($admin_info['img_url']): if(($admin_info['img_url'] == 'woman.png') OR ($admin_info['img_url'] == 'man.png')): ?>
                    <img src="/uploads/header/<?php echo $admin_info['img_url']; ?>" />
                <?php else: ?>
                    <img src="/uploads/header/<?php echo $admin_info['id']; ?>/<?php echo $admin_info['img_url']; ?>" />
                <?php endif; else: ?>
                <img src="/uploads/header/face.jpg" />
            <?php endif; ?>
        </div>
        <div class="admin-header-lock-name" id="lockUserName">欢迎使用<?php echo $web_info['web_name']; ?>系统</div>
        <div class="input_btn">
            <form class="layui-form">
                <input type="password" class="admin-header-lock-input layui-input" placeholder="请输入密码解锁.." autocomplete="off" autofocus="autofocus" name="lockPwd" id="lockPwd" />
                <button class="layui-btn" id="unlock" lay-filter="edit_lockPass" lay-submit="">解锁</button>
            </form>
        </div>
        <p>初始密码“123456”，请前往个人中心进行修改...</p>
    </div>
    <!-- 锁屏end -->

<script>
    layui.use(['element', 'layer', 'jquery','form'], function () {
        $ = layui.jquery;
        var element = layui.element;
        var $ = layui.$;
        var form = layui.form;

        //锁屏
        function lockPage(){
            layer.open({
                title : false,
                type : 1,
                content : $("#lock-box"),
                closeBtn : 0,
                shade : 1,
                anim : 0
            })
            //禁止f12
            $(window).keydown(function(even){
                if(even.keyCode==123){
                    return false;
                }
                //禁止刷新
                if ( even.keyCode==116){   
                    even.keyCode = 0;
                    even.cancelBubble = true;
                    return false;
                }

            })
            //禁止点击后退和前进按钮
            if (window.history && window.history.pushState) {
                $(window).on('popstate', function () {
                    // 当点击浏览器的 后退和前进按钮 时才会被触发， 
                    window.history.pushState('forward', null, ''); 
                    window.history.forward(1);
                });
            }
  　　　　　　　　　　
            window.history.pushState('forward', null, '');  //在IE中必须得有这两行
            window.history.forward(1);

            //禁止右键
            $(document).bind("contextmenu",function(e){
                return false;
            });

            $('body,html').addClass('unselect');

        }

        //绑定锁屏事件
        $(".lockcms").on("click",function(){

            if(window.sessionStorage.getItem("lockcms") == ""||window.sessionStorage.getItem("lockcms") == null||window.sessionStorage.getItem("lockcms")=="false"||window.sessionStorage.getItem("lockcms") == undefined){
                window.sessionStorage.setItem("lockcms",true);
                lockPage();
            }
  
        })
        
        // 判断是否显示锁屏
        if(window.sessionStorage.getItem("lockcms") == "true"){
            lockPage();

            $(document).on('keydown', function() {
                if(event.keyCode == 13) {
                    $("#unlock").click();
                }
            });
        }
        // 解锁
        $("#unlock").on("click",function(){
            if($(this).siblings(".admin-header-lock-input").val() == ''){
                // layer.msg("请输入解锁密码！");
                return false;
            }else{
                if($(this).siblings(".admin-header-lock-input").val() == "<?php echo \think\Request::instance()->session('clock_pass'); ?>"){
                    window.sessionStorage.setItem("lockcms",false);
                    $(this).siblings(".admin-header-lock-input").val('');
                    $('body,html').removeClass('unselect');
                  
                    //监听提交
                    form.on('submit(edit_lockPass)', function(data){

                        // console.log(data.field);
                        //发异步，把数据提交给php
                        // $.ajax({
                        //   url: "<?php echo url('admin/System/unlock'); ?>",
                        //   type: 'POST',
                        //   dataType: 'json',
                        //   data: data.field,
                        //   success: function(res) {
                        //     //called when successful
                        //     if(res.status=='1'){
                        //         layer.alert(res.msg, {icon: 6},function () {
                        //             layer.closeAll('dialog'); 
                        //         });
                        //     }else{
                        //        layer.alert(res.msg, {icon: 5},function () {
                        //            layer.closeAll('dialog'); 
                        //        }); 
                        //     }
                            
                        //   },
                        //   error: function(res) {
                        //     //called when there is an error
                        //     layer.alert("网络异常，请稍后再试", {icon: 5},function () {
                        //         layer.closeAll('dialog'); 
                        //     });
                        //   }
                        // });
                        
                        return false;
                    });

                    layer.closeAll("page");
                    return false;
                }else{
                    layer.msg("密码错误，请重新输入！");
                    return false;
                }
            }
            return false;
        });

    })


    $('#deletecache dd a').on('click',function(){
        var scrollTop = $(document).scrollTop();
        $('body,html').animate({
            scrollTop: 0
        }, 0);

        var type=$(this).data("type");
        //清除所有本地缓存
        if(type=='template'){
            sessionStorage.clear();
        }
        console.log(type)
        layer.confirm('确认要清理缓存吗？',{icon: 3, title:'提示'},function(index){
            //发异步删除数据
            $.ajax({
                url: "<?php echo url('admin/Index/clear_cache'); ?>",
                type: 'POST',
                dataType: 'json',
                data: {type:type},
                cache:false,
                success: function(res) {
                    //called when successful
                    if(res.status=='1'){
                        layer.msg(res.msg,{icon:1,time:1000},function(){
                            window.location.replace(location.href);
                        });
                    }else{
                        layer.msg(res.msg,{icon:2,time:1000});
                    }
                
                },
                error: function(res) {
                    //called when there is an error
                    layer.msg('清除失败，请稍后再试!',{icon:2,time:1000});
                }
            });
        },function(index){
            $('body,html').animate({
                scrollTop: scrollTop
            }, 2);
        });
    })


    function logout(obj){
        var scrollTop = $(document).scrollTop();
            $('body,html').animate({
                scrollTop: 0
            }, 0);
        layer.confirm('确认要退出系统吗？',{icon: 3, title:'提示'},function(index){
            window.location.href="<?php echo url('admin/Login/logout'); ?>";
        },function(index){
            $('body,html').animate({
                scrollTop: scrollTop
            }, 2);
        });
    }

    // 进入全屏：
    function entryFullScreen() {
        var docE = document.documentElement;
        if (docE.requestFullScreen) {
            docE.requestFullScreen();
        } else if (docE.mozRequestFullScreen) {
            docE.mozRequestFullScreen();
        } else if (docE.webkitRequestFullScreen) {
            docE.webkitRequestFullScreen();
        }
    }

    // 退出全屏
    function exitFullScreen() {
        var docE = document;
        if (docE.exitFullscreen) {
            docE.exitFullscreen();
        } else if (docE.mozCancelFullScreen) {
            docE.mozCancelFullScreen();
        } else if (docE.webkitCancelFullScreen) {
            docE.webkitCancelFullScreen();
        }
    }

    // 全屏切换
    $('#FullScreen').bind('click', function() {
        var fullscreenElement = document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement;
        if (fullscreenElement == null) {
            entryFullScreen();
            $(this).html('<i class="layui-icon layui-icon-screen-restore"></i>');
        } else {
            exitFullScreen();
            $(this).html('<i class="layui-icon layui-icon-screen-full"></i>');
        }
    });

</script>


  <script>
  layui.use(['form','layer','laydate'], function() {
        var app = layui.app,
        $ = layui.jquery,
        layer = layui.layer;
          
        $('dl.skin > dd').on('click', function() {
            var $that = $(this);
            var skin = $that.children('a').data('skin');
            switchSkin(skin);
        });
        var setSkin = function(value) {
            layui.data('kit_skin', {
                key: 'skin',
                value: value
            });
        },
        getSkinName = function() {
            return layui.data('kit_skin').skin;
        },
        switchSkin = function(value) {
            var _target = $('link[kit-skin]')[0];
            _target.href = _target.href.substring(0, _target.href.lastIndexOf('/') + 1) + value + _target.href.substring(_target.href.lastIndexOf('.'));
            setSkin(value);
        },
        initSkin = function() {
            var skin = getSkinName();
            switchSkin(skin === undefined ? 'default' : skin);
        }();
              
        $('#color').click(function(){
            layer.open({
                type:1,
                title:'配色方案',
                area: ['290px', 'calc(100% - 52px)'],
                offset: 'rb',
                shadeClose:true,
                id:'colors',
                anim: 2,
                shade:0.2,
                closeBtn:0,
                isOutAnim:false,
                resize:false,
                move: false,
                skin: 'color-class',
                btn:['黑白格','橘子橙','原谅绿','少女粉','天空蓝','枫叶红'],
                yes: function(index, layero){
                    switchSkin('default');
                }
                ,btn2: function(index, layero){
                    switchSkin('orange');
                    return false;
                }
                ,btn3: function(index, layero){
                    switchSkin('green');
                    return false;
                }
                ,btn4: function(index, layero){
                    switchSkin('pink');
                    return false;
                }
                ,btn5: function(index, layero){
                    switchSkin('blue.1');
                    return false;
                }
                ,btn6: function(index, layero){
                    switchSkin('red');
                    return false;
                }

            });
        })
    });

</script>

<script type="text/javascript">
    layui.use('layer', function(){
        var layer = layui.layer;
        var remember = '';
      
        $('#tag').click(function(){
            var tag = localStorage.getItem("tag");
            layer.prompt({
                formType: 2,
                anim: 1,
                offset: ['52px', 'calc(100% - 500px)'],
                value: tag,
                title: '便签',
                skin: 'demo-class',
                area: ['280px', '150px'],
                id: 'remember' ,//设定一个id，防止重复弹出
                btn: ['写好了', '忘了吧'],
                shade: 0,
                moveType: 1, //拖拽模式，0或者1
                btn2: function(index, layero){
                    localStorage.removeItem("tag");
                    $('#remember textarea').val(''); 
                    return false;
                }
                },function(value, index, elem){
                    localStorage.setItem("tag",value); 
                })
        });
    });              
</script>
<script>
    function view_message(){
        $('.point').remove();
        $.post("<?php echo url('admin/Index/index'); ?>",{"view_message":'1'},function(result){
            // location.replace(location.href);
        });
                 
    }

    //关闭当前页面
    $('.closePageThis').on('click',function(){
        var findli=$(".layui-tab-title .layui-this");
        if(findli.attr('lay-id')>'1'){
          element.tabDelete("xbs_tab", findli.attr('lay-id')); 
        }
    })

    //关闭所有页面
    $('.closePageAll').on('click',function(){
        var findli=$(".layui-tab-title li");
        findli.each(function(){
            
            if($(this).attr('lay-id')!=1){
                element.tabDelete("xbs_tab",$(this).attr('lay-id'));
            }
            
        })
    })

    //关闭其他页面
    $('.closePageOther').on('click',function(){
        var findli=$(".layui-tab-title li");
        findli.each(function(){
            
            if(!$(this).hasClass('layui-this') && $(this).attr('lay-id')!=1){
                element.tabDelete("xbs_tab",$(this).attr('lay-id'));
            }
            
        })
    })

    //刷新当前页面
    $(".refreshThis").on("click",function(){
        if($(this).hasClass("refreshPageThis")){
            $(this).removeClass("refreshPageThis");
            // 方法一有刷新不了的概率
            // $(".layui-tab-content .layui-show").find("iframe")[0].contentWindow.location.reload(true);
             //方法二基本上没有刷新失败的概率
            $(".layui-tab-content .layui-show").find("iframe").attr('src', $(".layui-tab-content .layui-show").find("iframe").attr('src'))
            layer.msg("刷新成功");
            setTimeout(function(){
                $(".refreshThis").addClass("refreshPageThis");
            },2000)
        }else{
            layer.msg("您点击的速度超过了服务器的响应速度，还是等两秒再刷新吧！");
        } 
    })


    //刷新所有页面
    $('.refreshAll').on('click',function(){

        if($(this).hasClass("refreshPageAll")){
            $(this).removeClass("refreshPageAll");
            $(".layui-tab-content .layui-tab-item").find("iframe").each(function(){
                $(this).attr('src', $(this).attr('src'))
            })
            layer.msg("刷新成功");

            setTimeout(function(){
                $(".refreshAll").addClass("refreshPageAll");
            },2000)
        }else{
            layer.msg("您点击的速度超过了服务器的响应速度，还是等两秒再刷新吧！");
        } 
       
    })

    //刷新其他页面
    $('.refreshOther').on('click',function(){

        if($(this).hasClass("refreshPageOther")){
            $(this).removeClass("refreshPageOther");
            $(".layui-tab-content .layui-show").siblings('div').find("iframe").each(function(){
                $(this).attr('src', $(this).attr('src'))
            })
            layer.msg("刷新成功");
            setTimeout(function(){
                $(".refreshOther").addClass("refreshPageOther");
            },2000)
        }else{
            layer.msg("您点击的速度超过了服务器的响应速度，还是等两秒再刷新吧！");
        } 
       
    })
</script>
    <!-- 顶部结束 -->
    <!-- 中部开始 -->
     <!-- 左侧菜单开始 -->
    <div class="left-nav">
  <div class="side-nav">
    <!-- 平台菜单 -->
    <?php if(is_array($menu_sort) || $menu_sort instanceof \think\Collection || $menu_sort instanceof \think\Paginator): $index = 0; $__LIST__ = $menu_sort;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu_sort): $mod = ($index % 2 );++$index;if($menu_sort['sort_name_en'] == 'Admin' and $menu_sort['select'] == 1): ?>
            <ul class="nav hidden-nav" data-type="<?php echo $menu_sort['sort_name_en']; ?>">
                <?php if(is_array($menu) || $menu instanceof \think\Collection || $menu instanceof \think\Paginator): $i = 0; $__LIST__ = $menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$left_menu): $mod = ($i % 2 );++$i;if($left_menu['isShow'] == 1 and $left_menu['sort'] == $menu_sort['sort_name_en']): ?>
                        <li>
                            <a href="javascript:;">
                                <i class="layui-icon <?php echo $left_menu['icon']; ?>"></i>
                                <cite><?php echo $left_menu['name']; ?></cite>
                                <i class="iconfont nav_right">&#xe697;</i>
                            </a>
                            <ul class="sub-menu">
                                <?php if($left_menu['hasSub'] == 1): if(is_array($left_menu['sub']) || $left_menu['sub'] instanceof \think\Collection || $left_menu['sub'] instanceof \think\Paginator): $i = 0; $__LIST__ = $left_menu['sub'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub): $mod = ($i % 2 );++$i;if($sub['isShow'] == 1): ?>
                                            <li>
                                                <a _href="<?php echo $sub['url']; ?>">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite><?php echo $sub['name']; ?></cite>
                                                </a>
                                            </li >
                                        <?php endif; endforeach; endif; else: echo "" ;endif; endif; ?>
                            </ul>
                        </li>
                    <?php endif; endforeach; endif; else: echo "" ;endif; ?>
            </ul>
        <?php elseif($menu_sort['sort_name_en'] == 'Shop' and $menu_sort['select'] == 1): ?>
            <ul class="nav hidden-nav" data-type="<?php echo $menu_sort['sort_name_en']; ?>" style="display:none;">
                <?php if(is_array($menu) || $menu instanceof \think\Collection || $menu instanceof \think\Paginator): $i = 0; $__LIST__ = $menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$left_menu): $mod = ($i % 2 );++$i;if($left_menu['isShow'] == 1 and $left_menu['sort'] == $menu_sort['sort_name_en']): ?>
                        <li>
                            <a href="javascript:;">
                                <i class="layui-icon <?php echo $left_menu['icon']; ?>"></i>
                                <cite><?php echo $left_menu['name']; ?></cite>
                                <i class="iconfont nav_right">&#xe697;</i>
                            </a>
                            <ul class="sub-menu">
                                <?php if($left_menu['hasSub'] == 1): if(is_array($left_menu['sub']) || $left_menu['sub'] instanceof \think\Collection || $left_menu['sub'] instanceof \think\Paginator): $i = 0; $__LIST__ = $left_menu['sub'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub): $mod = ($i % 2 );++$i;if($sub['isShow'] == 1): ?>
                                            <li>
                                                <a _href="<?php echo $sub['url']; ?>">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite><?php echo $sub['name']; ?></cite>
                                                </a>
                                            </li >
                                        <?php endif; endforeach; endif; else: echo "" ;endif; endif; ?>
                            </ul>
                        </li>
                    <?php endif; endforeach; endif; else: echo "" ;endif; ?>
            </ul>
        <?php elseif($menu_sort['sort_name_en'] == 'Hr' and $menu_sort['select'] == 1): ?>
            <ul class="nav hidden-nav" data-type="<?php echo $menu_sort['sort_name_en']; ?>" style="display:none;">
                <?php if(is_array($menu) || $menu instanceof \think\Collection || $menu instanceof \think\Paginator): $i = 0; $__LIST__ = $menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$left_menu): $mod = ($i % 2 );++$i;if($left_menu['isShow'] == 1 and $left_menu['sort'] == $menu_sort['sort_name_en']): ?>
                        <li>
                            <a href="javascript:;">
                                <i class="layui-icon <?php echo $left_menu['icon']; ?>"></i>
                                <cite><?php echo $left_menu['name']; ?></cite>
                                <i class="iconfont nav_right">&#xe697;</i>
                            </a>
                            <ul class="sub-menu">
                                <?php if($left_menu['hasSub'] == 1): if(is_array($left_menu['sub']) || $left_menu['sub'] instanceof \think\Collection || $left_menu['sub'] instanceof \think\Paginator): $i = 0; $__LIST__ = $left_menu['sub'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub): $mod = ($i % 2 );++$i;if($sub['isShow'] == 1): ?>
                                            <li>
                                                <a _href="<?php echo $sub['url']; ?>">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite><?php echo $sub['name']; ?></cite>
                                                </a>
                                            </li >
                                        <?php endif; endforeach; endif; else: echo "" ;endif; endif; ?>
                            </ul>
                        </li>
                    <?php endif; endforeach; endif; else: echo "" ;endif; ?>
            </ul>
        <?php elseif($menu_sort['sort_name_en'] == 'Finance' and $menu_sort['select'] == 1): ?>
            <ul class="nav hidden-nav" data-type="<?php echo $menu_sort['sort_name_en']; ?>" style="display:none;">
                <?php if(is_array($menu) || $menu instanceof \think\Collection || $menu instanceof \think\Paginator): $i = 0; $__LIST__ = $menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$left_menu): $mod = ($i % 2 );++$i;if($left_menu['isShow'] == 1 and $left_menu['sort'] == $menu_sort['sort_name_en']): ?>
                        <li>
                            <a href="javascript:;">
                                <i class="layui-icon <?php echo $left_menu['icon']; ?>"></i>
                                <cite><?php echo $left_menu['name']; ?></cite>
                                <i class="iconfont nav_right">&#xe697;</i>
                            </a>
                            <ul class="sub-menu">
                                <?php if($left_menu['hasSub'] == 1): if(is_array($left_menu['sub']) || $left_menu['sub'] instanceof \think\Collection || $left_menu['sub'] instanceof \think\Paginator): $i = 0; $__LIST__ = $left_menu['sub'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub): $mod = ($i % 2 );++$i;if($sub['isShow'] == 1): ?>
                                            <li>
                                                <a _href="<?php echo $sub['url']; ?>">
                                                    <i class="iconfont">&#xe6a7;</i>
                                                    <cite><?php echo $sub['name']; ?></cite>
                                                </a>
                                            </li >
                                        <?php endif; endforeach; endif; else: echo "" ;endif; endif; ?>
                            </ul>
                        </li>
                    <?php endif; endforeach; endif; else: echo "" ;endif; ?>
            </ul>
        <?php endif; endforeach; endif; else: echo "" ;endif; ?>
  </div>
</div>
    <!-- <div class="x-slide_left"></div> -->
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content" id="nav">
        <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
          <ul class="layui-tab-title" id="xbs_tab">
            <li class="home layui-this"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='/admin/index/welcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
          </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <div class="container-bg">
      <video autoplay loop id="bgvid">
        <source src="/static/admin/images/bg.mp4" type="video/mp4">
          Your browser does not support the video tag.
      </video>
    </div>
    <!-- 右侧主体结束 -->
    <!-- 中部结束 -->
    <!-- 底部开始 -->
    <!-- <div class="footer">
    <div class="copyright">Copyright &copy;&nbsp;2018 <?php echo $web_info['web_name']; ?>&nbsp;<?php echo $web_info['web_version']; ?> All Rights Reserved</div>  
</div> -->
    <!-- 底部结束 -->
    
    <script type="text/javascript">
        // 登入超时自动退出
        layui.use(['form','layer'], function(){
          $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;

        var maxTime = "<?php echo \think\Request::instance()->session('login.sleep_timeout'); ?>"; // seconds
        var time = maxTime;
        $('body,html,window,document').on('keydown mousemove mousedown click', function(e){
            time = maxTime; // reset
        });
        
        var intervalId = setInterval(function(){
            time--;
            if(time <= 0) {
                ShowInvalidLoginMessage()
                clearInterval(intervalId);
                //显示背景视频
                $('.container-bg').css({'display':'block'});
            }
            //判断是否处于考试中
            $.get("<?php echo url('admin/Evaluation/stop_countdown'); ?>", function(result){
                if(result.status==1){
                  clearInterval(intervalId);
                  // console.log('ok');
                }else{
                  // console.log('no');

                }
              });

        }, 1000)

        function ShowInvalidLoginMessage(){

            // 清除cookie、session
            // 提示用户
            $.ajax({
              url: "<?php echo url('admin/Index/max_time'); ?>",
              type: 'POST',
              dataType: 'json',
              data: {max_time: time},
              success: function(res) {
                //called when successful
                if(res.status=="1"){
                    layer.alert(res.msg, {icon: 5,title:'系统提示',closeBtn : 0},function () {
                         layer.closeAll();
                         window.location.href="<?php echo url('admin/Login/index'); ?>"
                         
                    });
                    
                }
              },
              error: function(res) {
                //called when there is an error
              }
            });
            
        }

        //隐藏背景视频
        $('.container-bg').click(function(){
          $(this).hide();
        })

    });
    
    </script>

</body>
</html>