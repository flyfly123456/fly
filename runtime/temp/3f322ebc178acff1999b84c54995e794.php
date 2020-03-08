<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:41:"../app/admin/view/wechat\base_config.html";i:1547364749;}*/ ?>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>基础设置</title>
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
        <a>
          <cite>基础设置</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>

    <div class="x-body">
        <!-- <blockquote class="layui-elem-quote">注意：管理员所有的基础信息修改之后必须退出重新登入才生效！</blockquote> -->
        <form class="layui-form">
            <div class="layui-form-item"> 
                <label for="name" class="layui-form-label"> <span class="x-red">*</span>名称</label> 
                <div class="layui-input-inline"> 
                    <input type="text" id="name" name="name" required="" lay-verify="name" autocomplete="off" class="layui-input" value="<?php echo $rest['name']; ?>" /> 
                </div>
                <div class="layui-form-mid layui-word-aux"> 
                    <span class="x-red">*</span>微信公众号名称
                </div>
            </div>
            <div class="layui-form-item"> 
                <label for="appid" class="layui-form-label"> <span class="x-red">*</span>appID</label> 
                <div class="layui-input-inline"> 
                    <input type="text" id="appid" name="appid" required="" lay-verify="appid" autocomplete="off" class="layui-input" value="<?php echo $rest['appid']; ?>" /> 
                </div>
                <div class="layui-form-mid layui-word-aux"> 
                    <span class="x-red">*</span>appID值通过微信后台进行查看
                </div>
            </div>
            <div class="layui-form-item"> 
                <label for="appsecret" class="layui-form-label"> <span class="x-red">*</span>appsecret</label> 
                <div class="layui-input-inline"> 
                    <input type="text" id="appsecret" name="appsecret" required="" lay-verify="appsecret" autocomplete="off" class="layui-input" value="<?php echo $rest['appsecret']; ?>" /> 
                </div>
                <div class="layui-form-mid layui-word-aux"> 
                    <span class="x-red">*</span>appsecret值通过微信后台进行查看
                </div>
            </div>
            <div class="layui-form-item"> 
                <label for="token" class="layui-form-label"> <span class="x-red">*</span>TOKEN</label> 
                <div class="layui-input-inline"> 
                    <input type="text" id="token" name="token" required="" lay-verify="token" autocomplete="off" class="layui-input" value="<?php echo $rest['token']; ?>" />
                </div>
                <div class="layui-form-mid layui-word-aux"> 
                    <span class="x-red">*</span>TOKEN值必须保证与微信后台配置的值一致
                </div>
            </div>
            <div class="layui-form-item layui-form-text"> 
                <label class="layui-form-label">备注</label> 
                <div class="layui-input-block"> 
                    <textarea name="remark" placeholder="请输入内容" class="layui-textarea"><?php echo $rest['remark']; ?></textarea> 
                </div> 
            </div>
            <div class="layui-form-item">
                <label for="sen_info" class="layui-form-label">
                </label>
                <button class="layui-btn layui-btn-sm" id="sen_info" lay-filter="wechat_config" lay-submit="">立即设置</button>
                <button type="reset" class="layui-btn layui-btn-sm layui-btn-warm" lay-filter="">重置</button>
            </div>
            <input type="hidden" name="id" value="<?php echo $rest['id']; ?>"> 
        </form> 
    </div> 
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
            var form = layui.form
            ,layer = layui.layer;
        
            //自定义验证规则
            form.verify({
                appid: function(value){
                    if(value.length < 18){
                        return 'appid长度为18个字符啊';
                    }
                }
                ,appsecret: function(value){
                    if(value.length < 32){
                        return 'appsecret长度为32个字符啊';
                    }
                }
                ,token: function(value){
                    if(value.length < 5){
                        return 'token长度为5个字符啊';
                    }
                }
                
            });

            //监听提交
            form.on('submit(wechat_config)', function(data){
                console.log(data.field);
                //发异步，把数据提交给php
                $.ajax({
                    url: "<?php echo url('admin/Wechat/base_config'); ?>",
                    type: 'POST',
                    dataType: 'json',
                    data: data.field,
                    success: function(res) {
                        //called when successful
                        if(res.status=="1"){
                            layer.alert(res.msg, {icon: 6},function () {
                                layer.closeAll();
                                location.replace(location.href)
                            });
                        }else{
                            layer.alert(res.msg, {icon: 5},function () {
                                layer.closeAll();
                            });
                        }
                    },
                    error: function(res) {
                        //called when there is an error
                        layer.alert("网络异常，请稍后再试", {icon: 5},function () {
                            layer.closeAll();
                        });
                    }
                });
            
                return false;
            });//监听提交end

        });

    </script>

  </body>
</html>