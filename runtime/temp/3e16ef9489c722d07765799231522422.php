<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:49:"../app/admin/view/evaluation\examination_add.html";i:1553780315;}*/ ?>
  <!DOCTYPE html>
  <html>
    
    <head>
      <meta charset="UTF-8">
      <title>添加测评</title>
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
    <style>
          /*#edui1_iframeholder{
              min-height: 200px!important;
          }*/
    </style>
    <body class="layui-anim layui-anim-up">
      <div class="x-nav">
        <span class="layui-breadcrumb">
          <a href="">首页</a>
          <a href="">测评管理</a>
          <a>
            <cite>添加试卷</cite></a>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
          <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
      </div>
      <div class="x-body">
        
          <form class="layui-form">
            <div class="layui-form-item">
                <label for="article_title" class="layui-form-label">
                    <span class="x-red">*</span>试卷名称
                </label>
                <div class="layui-input-inline" style="width:390px;">
                    <input type="text" id="article_title" name="title" required="" lay-verify="article_content"
                    autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>测评试卷名称
                </div>
            </div>
            <div class="layui-form-item">
                <label for="desc" class="layui-form-label">
                    <span class="x-red">*</span>试卷描述
                </label>
                <div class="layui-input-inline" style="width:390px;">
                    <textarea name="desc" placeholder="请输入内容" required="" class="layui-textarea"></textarea> 
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>测评试卷描述
                </div>
            </div>
            
            <div class="layui-form-item">
                <label for="duration" class="layui-form-label">
                    <span class="x-red">*</span>考试时长
                </label>
                <div class="layui-input-inline" style="width:390px;">
                    <input type="number" id="duration" name="duration" required="" lay-verify="article_content"
                    autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>单位为分钟
                </div>
            </div>
            <div class="layui-form-item">
                <label for="score" class="layui-form-label">总分值</label>
                <div class="layui-input-inline" style="width:390px;">
                    <input type="number" id="score" name="total_score" autocomplete="off" class="layui-input" value="100">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>不填默认总分为100分。
                </div>
            </div>
            <div class="layui-form-item">
                <label for="score" class="layui-form-label">通过比值</label>
                <div class="layui-input-inline" style="width:390px;">
                    <input type="text" id="score" name="pass_score" autocomplete="off" class="layui-input" value="0.6">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>不填默认为总分的60%。
                </div>
            </div>
            <div class="layui-form-item">
                <label for="start_date" class="layui-form-label">
                    <span class="x-red">*</span>起止时间</label>
                <div class="layui-inline ">
                    <div class="layui-input-inline">
                        <input class="layui-input" autocomplete="off" placeholder="起始时间" name="start_time" id="start_time">
                    </div>
                    
                    <div class="layui-input-inline">
                        <input class="layui-input" autocomplete="off" placeholder="截止时间" name="end_time" id="end_time">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>测评起始时间
                    </div>
                </div>
            </div>
             
            <div class="layui-form-item">
                <label for="container" class="layui-form-label">
                </label>
                <button  class="layui-btn layui-btn-sm" lay-filter="add" lay-submit="">立即添加</button>
                <button  class="layui-btn layui-btn-sm layui-btn-warm" type="reset">取 消</button>
            </div>
        </form>
      </div>

      <script>
          layui.use(['form','layer','laydate'], function(){
            $ = layui.jquery;
            var form = layui.form
            var laydate = layui.laydate
            form.render()
            ,layer = layui.layer;

            //执行一个laydate实例
            laydate.render({
                elem: '#start_time' //指定元素
                ,type: 'datetime'
            });

            //执行一个laydate实例
            laydate.render({
                elem: '#end_time' //指定元素
                ,type: 'datetime'
            });
          
            //自定义验证规则
            form.verify({
              article_content: function(value){
                if(value.length < 1){
                  return '内容至少得1个字符啊';
                }
              }
            });

            //监听提交
            form.on('submit(add)', function(data){

              form.render();
              console.log(data.field);
              //发异步，把数据提交给php
              $.ajax({
                url: "<?php echo url('admin/Evaluation/examination_add'); ?>",
                type: 'POST',
                dataType: 'json',
                data: data.field,
                success: function(res) {
                  //called when successful
                  console.log(res)
                  if(res.status=='1'){
                      
                      layer.alert(res.msg, {icon: 6},function () {
                          layer.closeAll('dialog');
                          $('body,html').animate({
                            scrollTop: scrollTop
                          }, 2);
                          location.replace(location.href)
                      });
                      
                  }else{
                     layer.alert(res.msg, {icon: 5},function () {
                         layer.closeAll('dialog');
                         $('body,html').animate({
                           scrollTop: scrollTop
                         }, 2);
                     }); 
                  }

                  var scrollTop = $(document).scrollTop();
                  $('body,html').animate({
                      scrollTop: 0
                  }, 0);
                  
                },
                error: function(res) {
                  //called when there is an error
                  layer.alert("网络连接失败，请稍后再试！", {icon: 5},function () {
                      layer.closeAll('dialog');
                      $('body,html').animate({
                        scrollTop: scrollTop
                      }, 2);
                  });
                  var scrollTop = $(document).scrollTop();
                  $('body,html').animate({
                      scrollTop: 0
                  }, 0);

                }
              });

              return false;
            });

        });
    </script>
    
  </body>
  </html>