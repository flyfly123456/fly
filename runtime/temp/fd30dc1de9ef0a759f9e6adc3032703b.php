<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:55:"../app/admin/view/wechat\template_message_keywords.html";i:1547478117;}*/ ?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>编辑模板消息关键字</title>
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
            <a href="">微信管理</a>
            <a><cite>编辑关键字</cite></a>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>
    <div class="x-body">
        <form class="layui-form">
            <div class="layui-form-item"> 
                <label for="first" class="layui-form-label"><span class="x-red">*</span>描述</label> 
                <div class="layui-input-inline"> 
                    <input type="text" id="first" name="first" required="" lay-verify="first" autocomplete="off" class="layui-input" value="<?php echo $info['first']; ?>" /> 
                </div>
                <div class="layui-form-mid layui-word-aux"> 
                    <span class="x-red">*</span>模板消息描述
                </div>
            </div>
            <?php if(is_array($rest) || $rest instanceof \think\Collection || $rest instanceof \think\Paginator): $i = 0; $__LIST__ = $rest;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rest): $mod = ($i % 2 );++$i;?>
                <div class="layui-form-item"> 
                    <label for="value" class="layui-form-label"> <span class="x-red">*</span>关键字</label> 
                    <div class="layui-input-inline"> 
                        <input type="text" id="value" name="value[]" required="" lay-verify="value" autocomplete="off" class="layui-input" value="<?php echo $rest['value']; ?>" />
                    </div>
                    <div class="layui-form-mid layui-word-aux"> 
                        <span class="x-red">*</span>模板消息关键字...&nbsp;<span class='layui-btn layui-btn-danger layui-btn-sm del-value'>删除</span>
                    </div>
                </div>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            <div class="layui-form-item URL"> 
                <label for="url" class="layui-form-label">URL</label> 
                <div class="layui-input-inline"> 
                    <input type="text" id="url" name="url" required="" lay-verify="url" autocomplete="off" class="layui-input" value="<?php echo $info['url']; ?>" /> 
                </div>
                <div class="layui-form-mid layui-word-aux"> 
                    <span class="x-red">*</span>点击模板消息跳转的链接，例如：http://www.baidu.com
                </div>
            </div>
            <div class="layui-form-item">
                <label for="color" class="layui-form-label">字体颜色</label> 
                <div class="layui-input-inline">
                    <input type="text" name="color" value="<?php echo $info['color']; ?>" placeholder="请选择模板消息颜色" class="layui-input" id="color">
                </div>
                <div class="layui-inline" style="left: -11px;">
                    <div id="color-form"></div>
                </div>
            </div>
            <div class="layui-form-item layui-form-text"> 
                <label class="layui-form-label">备注</label> 
                <div class="layui-input-block"> 
                    <textarea name="remark" placeholder="请输入内容" class="layui-textarea"><?php echo $info['remark']; ?></textarea>
                </div> 
            </div>
            <div class="layui-form-item">
                <label for="id" class="layui-form-label">
                </label>
                <input type="hidden" name="template_id" value="<?php echo $template_id; ?>">
                <span class="layui-btn layui-btn-sm layui-btn-primary add_value" title="增加关键字"><i class="layui-icon layui-icon-add-circle"></i></span>
                <button  class="layui-btn layui-btn-sm" lay-filter="add" lay-submit="">立即设置</button>
                <button  class="layui-btn layui-btn-sm layui-btn-warm" lay-filter="" type="reset">重置</button>
            </div>
        </form>
    </div>
<script>
layui.use(['form','layer','colorpicker'], function(){
    $ = layui.jquery;
    var form = layui.form
    ,layer = layui.layer
    ,colorpicker = layui.colorpicker;

    //自定义验证规则
    form.verify({
        value: function(value){
            if(value.length < 2){
                return '关键字长度为2个字符啊';
            }
        }
        ,first:function(value){
            if(value.length < 2){
                return '描述长度为2个字符啊';
            }
        }
    });

    //模板消息字体颜色
    colorpicker.render({
        elem: '#color-form'
        ,color: '#1c97f5'
        ,done: function(color){
          $('#color').val(color);
        }
    });

    //监听提交
    form.on('submit(add)', function(data){
        console.log(data.field);
        //发异步，把数据提交给php
        $.ajax({
            url: "<?php echo url('admin/Wechat/template_message_keywords'); ?>",
            type: 'POST',
            dataType: 'json',
            data: data.field,
            success: function(res) {
                //called when successful
                if(res.status=="1"){
                    layer.alert(res.msg, {icon: 6},function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        parent.location.reload(); // 父页面刷新
                    });
                }else{
                    layer.alert(res.msg, {icon: 5},function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                            
                    });
                }
            },
            error: function(res) {
                //called when there is an error
                layer.alert("网络异常，请稍后再试", {icon: 5},function () {
                    // 获得frame索引
                    var index = parent.layer.getFrameIndex(window.name);
                    //关闭当前frame
                    parent.layer.close(index);
                });
            }
        });

        var scrollTop = $(document).scrollTop();
        $('body,html').animate({
            scrollTop: 0
        }, 0);

        return false;

    });

    //监听关键字方法
    $(".add_value").on('click', function(){

        value="<div class='layui-form-item'><label for='value' class='layui-form-label'><span class='x-red'>*</span>关键字</label><div class='layui-input-inline'><input type='text' id='value' name='value[]' required='' lay-verify='value' autocomplete='off' class='layui-input' value='' /></div><div class='layui-form-mid layui-word-aux'><span class='x-red'>*</span>模板消息关键字...&nbsp;<span class='layui-btn layui-btn-danger layui-btn-sm del-value'>删除</span></div></div>";

        $(".URL").before(value);
    });

    //删除关键字
    $('.layui-form').delegate('.del-value','click',function(){
        
        $(this).parents('div.layui-form-item').remove().empty();
    })


});


</script>
</body>

</html>