<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:39:"../app/admin/view/attendance\clock.html";i:1552671400;}*/ ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>考勤记录</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="/static/admin/css/font.css">
        <link rel="stylesheet" href="/static/admin/css/xadmin.css">
        <script type="text/javascript" src="/static/admin/js/jquery.min.js"></script>
        <script type="text/javascript" src="/static/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="/static/admin/js/xadmin.js"></script>

        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
        <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
        <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
<body class="layui-anim layui-anim-up">
    <div class="x-nav">
        <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">差勤管理</a>
            <a><cite>考勤记录</cite></a>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>

    <div class="x-body">
        <div style="padding: 20px; background-color: #F2F2F2;">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md6 layui-col-md-offset3" style="height:500px;">
                    <div class="layui-card" style="height:100%;border-radius:10px;">
                        <div class="layui-card-header" style="text-align:center;">考勤打卡</div>
                        <div class="layui-card-body" style="text-align:center;position:absolute;left:50%;top:50%;transform: translate(-50%, -50%);"><button class="layui-btn layui-btn-lg clock" style="width:150px;height:150px;border-radius:50%;">上班打卡</button></div>
                    </div>
                </div>
            </div>
        </div> 
    </div>
    <!-- 上下班打卡语音 -->
    <audio id="audio" src="" style="display:none;">
    您的浏览器不支持 audio 标签。
    </audio>
<script>
    layui.use(['layer'], function(){
        $ = layui.jquery
        ,layer = layui.layer;

    });

    $(function(){
        
        start="<?php echo $rest['start']; ?>";
        end="<?php echo $rest['end']; ?>";

        if(start=="" && end==""){
            $('.clock').html('上班打卡').removeClass('layui-btn-warm');
        }else if(start!="" && end==""){
            $('.clock').html('下班打卡').addClass('layui-btn-warm');
        }

    });

    $('.clock').click(function(){

        $(this).toggleClass('layui-btn-warm');

        if($(this).html()=='上班打卡'){

            $(this).html('下班打卡');

        }else{

            $(this).html('上班打卡');
        }

        $.ajax({
            url: "<?php echo url('admin/Attendance/clock'); ?>",
            type: 'POST',
            dataType: 'json',
            data: {clock: '1'},
            success: function(res) {
                //called when successful
                if(res.status==1){
                    layer.msg('打卡成功...',{icon:1});
                    if(res.working==1){
                        $("#audio").attr({'autoplay':'autoplay','src':'/static/admin/audio/working.wav'});
                    }else{
                        $("#audio").attr({'autoplay':'autoplay','src':'/static/admin/audio/rest.wav'});
                    }
                }else{
                    layer.msg('打卡失败...',{icon:1});
                }
            },
            error: function(res) {
                //called when there is an error
                layer.msg('网络异常，请稍后再试...');
            }
        });

    });
    
</script>
</body>
</html>