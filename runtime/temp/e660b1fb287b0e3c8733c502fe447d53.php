<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:34:"../app/admin/view/login\index.html";i:1552620095;}*/ ?>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台登录-FlyFly v1.0</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/admin/css/font.css">
	<link rel="stylesheet" href="/static/admin/css/xadmin.css">
    <script type="text/javascript" src="/static/admin/js/jquery-1.8.2.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/admin/js/xadmin.js" charset="utf-8"></script>

</head>
<body class="login-bg">
    <!-- 背景图片 -->
    <div class="bg-img">
        <img src="/static/admin/images/background/1.jpg">
        <img src="/static/admin/images/background/2.jpg">
        <img src="/static/admin/images/background/3.jpg">
    </div>
    <div class="login layui-anim layui-anim-up">
        <div class="message">FlyFly1.0-管理登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" >
            <input name="username" placeholder="用户名" autofocus autocomplete='off'  type="text" lay-verify="required" class="layui-input" value="<?php echo !empty($remember_info['username'])?$remember_info['username']:""; ?>">
            <hr class="hr15">
            <input name="password" autocomplete='off' lay-verify="required" placeholder="密码"  type="password" class="layui-input" value="<?php echo !empty($remember_info['password'])?$remember_info['password']:""; ?>">
            <hr class="hr15">
            <input name="verify" autocomplete='off' lay-verify="required" placeholder="验证码"  type="text" class="layui-input verify">
            <div class="verify-img"><img src="<?php echo captcha_src(); ?>" alt="captcha" onclick="this.src=this.src" /></div>
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
            <div class="layui-form-item">
                <label class="layui-form-label">记住密码</label>
                <div class="layui-input-block f_height">
                    <input type="checkbox" name="close" lay-skin="switch" lay-text="ON|OFF" lay-filter="login" title="开关">
                    <label class="layui-form-label" style="float:right;padding-right:70px"><a href="<?php echo url('admin/Login/remember_pass'); ?>" style="text-decoration:underline">忘记密码？</a></label>
                </div>
            </div>
        </form>
    </div>

    <script>
        $(document).ready(function(){
            layui.use('form', function(){
                var form = layui.form;
              
                //监听指定开关
                form.on('switch(login)', function(data){
                
                    layer.tips('温馨提示：请注意账号密码风险，不要在公共电脑开启此选项', data.othis)
                });

                //监听提交
                form.on('submit(login)', function(data){
                    // console.log(data)
                    $.ajax({
                        url: "<?php echo url('admin/Login/login'); ?>",
                        type: 'POST',
                        dataType: 'json',
                        data: data.field,
                        success: function(res) {
                            //called when successful
                            // console.log(res)
                            if(res.status=='1'){
                                layer.msg(res.msg,{icon:1,offset:'t'},function(){
                                    location.href="<?php echo url('admin/Index/index'); ?>"
                                });
                                return false;
                            }else{
                                layer.msg(res.msg,{icon:2,offset:'t'},function(){
                                    $(".verify-img img").click();
                                });
                            }

                        },
                        error: function(res) {
                            //called when there is an error
                            layer.msg('网络连接失败,请稍后再试',{icon:2,offset:'t'},function(){
                            });
                        }
                    });
                    
                    return false;
                });
            });
        

            //切换背景图片
            var i=0;
            setInterval(function(){
                
                if(i>2){
                    i=0;
                }
                
                $('.login-bg .bg-img img').eq(i).fadeIn('slow').siblings('img').fadeOut('slow');
                i++;
            },5000);
            
        })

    </script>
    
    <!-- 底部结束 -->
</body>
</html>