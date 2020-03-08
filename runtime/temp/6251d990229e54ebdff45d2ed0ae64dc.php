<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:40:"../app/admin/view/system\clock_pass.html";i:1545232044;}*/ ?>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>基础资料</title>
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
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>
    <div class="x-body">
        <blockquote class="layui-elem-quote">
                注意：锁屏初始密码为123456，忘记密码可点击重置，锁屏将使用初始密码。
        </blockquote>
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="L_oldpass" class="layui-form-label">
                  <span class="x-red">*</span>原始密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_oldpass" value="" name="oldpass" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>密码为6到16个字符
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>新密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_pass" value="" name="pass" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>密码为6到16个字符
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
                  <span class="x-red">*</span>确认密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_repass" value="" name="repass" required="" lay-verify="repass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="edit" lay-submit="">
                  修改
              </button>
              <span  class="layui-btn layui-btn-danger" onclick="reset_clock_pass(this,'')">
                  重置
              </span>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            pass: [/(.+){6,16}$/, '密码必须6到16位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

          //监听提交
          form.on('submit(edit)', function(data){
            console.log(data.field);
            //发异步，把数据提交给php
            $.ajax({
              url: "<?php echo url('admin/System/clock_pass'); ?>",
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
                        parent.window.location.replace(parent.window.location.href)
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
                layer.alert(res.msg, {icon: 5},function () {
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
//重置锁屏密码
function reset_clock_pass(obj,id){
    var scrollTop = $(document).scrollTop();
    $('body,html').animate({
        scrollTop: 0
    }, 0);
    layer.prompt({
        formType: 1,
        title: '请输入管理员密码重置锁屏密码'
    }, function(value, index, elem){
        // alert(value); //得到value
        if(value.length<6){
          layer.msg('管理员密码位数不正确',{icon: 5,time: 1500}, function(){});

        }else{

        $.ajax({
            url: "<?php echo url('admin/System/clock_pass'); ?>",
            type: 'POST',
            dataType: 'json',
            data: {pass: value},
            success: function(res) {
                //called when successful
                if(res.status=="1"){
                    layer.msg(res.msg,{icon: 6,time: 1500}, function(){
                      
                        setTimeout(function(){

                            layer.close(index);
                        
                        },1500)
                    
                    });
                    
                }else{
                    layer.msg(res.msg,{icon: 5,time: 1500}, function(){
                      
                        // setTimeout(function(){

                        //     layer.close(index);
                        
                        // },1500)
                    
                    });
                }
                
            },
            error: function(res) {
                //called when there is an error
                layer.msg(res.msg,{icon: 5,time: 1500}, function(){
                  
                    setTimeout(function(){

                        layer.close(index);

                    },1500)
                
                });
            }
        });
        
      }
        
        $('body,html').animate({
            scrollTop: scrollTop
        }, 2);
    });
}


    </script>
  </body>
</html>