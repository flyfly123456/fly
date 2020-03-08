<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:37:"../app/admin/view/shop\model_add.html";i:1551189522;}*/ ?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>添加模型</title>
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
            <a href="">商品管理</a>
            <a><cite>添加模型</cite></a>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>
    <div class="x-body">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="name" class="layui-form-label">
                    <span class="x-red">*</span>模型名称
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="name" name="name" required="" lay-verify="required"
                      autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>商品模型名称
                </div>
            </div>

            <div class="layui-form-item layui-form-text"> 
                <label class="layui-form-label"><span class="x-red">*</span>模型描述</label> 
                <div class="layui-input-inline" style="width:50%;"> 
                    <textarea name="desc" required="" lay-verify="required" placeholder="请输入描述" class="layui-textarea"></textarea> 
                </div>
            </div>
            
            <div class="layui-form-item layui-form-text"> 
                <label class="layui-form-label"><span class="x-red">*</span>参数内容</label> 
                <div class="layui-input-inline" style="width:50%;"> 
                    <textarea name="param" required="" lay-verify="required" placeholder="请输入参数内容" class="layui-textarea"></textarea> 
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>请输入参数内容，各参数之间请用@符号隔开
                </div> 
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>状态
                </label>
                <div class="layui-input-block">
                    <input type="radio" name="is_available" value="1" title="启用" checked="">
                    <input type="radio" name="is_available" value="0" title="禁用">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="name" class="layui-form-label">
                </label>
                <button  class="layui-btn layui-btn-sm" lay-filter="add" lay-submit="">立即提交</button>
                <button  class="layui-btn layui-btn-sm layui-btn-warm" lay-filter="" type="reset">重置</button>
            </div>
        </form>
    </div>
<script>
layui.use(['form','layer'], function(){
    $ = layui.jquery;
    var form = layui.form
    ,layer = layui.layer

    //自定义验证规则
    form.verify({
        name: function(value){
            if(value.length < 2){
                return '名称至少得2个字符啊';
            }
        }
        ,pass: [/(.+){6,12}$/, '密码必须6到12位']
        ,repass: function(value){
            if($('#L_pass').val()!=$('#L_repass').val()){
                return '两次密码不一致';
            }
        }
    });

    //监听提交
    form.on('submit(add)', function(data){
        console.log(data.field);
        //发异步，把数据提交给php
        $.ajax({
            url: "<?php echo url('admin/Shop/model_add'); ?>",
            type: 'POST',
            dataType: 'json',
            data: data.field,
            success: function(res) {
                //called when successful
                console.log(res);
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

        return false;
    });

});

</script>
</body>

</html>