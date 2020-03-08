<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:37:"../app/admin/view/admin\role_add.html";i:1546702560;}*/ ?>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
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
            <a href="">权限管理</a>
            <a><cite>角色添加</cite></a>
        </span>
        <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>
    <div class="x-body">
        <form class="layui-form layui-form-pane">
                <div class="layui-form-item">
                    <label for="name" class="layui-form-label">
                        <span class="x-red">*</span>角色名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="name" name="name" required="" lay-verify="name"
                        autocomplete="off" class="layui-input" value="">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>管理员必须拥有基础管理权限才能正常使用系统
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">
                      <span class="x-red">*</span>所属系统
                    </label>
                    <div class="layui-input-block">
                      <?php if(is_array($system_sort) || $system_sort instanceof \think\Collection || $system_sort instanceof \think\Paginator): $i = 0; $__LIST__ = $system_sort;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$system_sort): $mod = ($i % 2 );++$i;?>
                        <input type="checkbox" lay-skin="primary" name="system_sort[]" value="<?php echo $system_sort['id']; ?>" title="<?php echo $system_sort['sort_name']; ?>" checked>
                      <?php endforeach; endif; else: echo "" ;endif; ?>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">
                        <span class="x-red">*</span>拥有权限
                    </label>
                    <table  class="layui-table layui-input-block">
                        <tbody>
                            <?php if(is_array($acl) || $acl instanceof \think\Collection || $acl instanceof \think\Paginator): $i = 0; $__LIST__ = $acl;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$acl): $mod = ($i % 2 );++$i;?>
                                <tr>
                                    <td class="super_author">
                                        <input type="checkbox" name="superacl[]" lay-skin="primary" title="<?php echo $acl['name']; ?>">
                                    </td>
                                    <td>
                                        <div class="layui-input-block">
                                            <?php if(is_array($acl['sub']) || $acl['sub'] instanceof \think\Collection || $acl['sub'] instanceof \think\Paginator): $i = 0; $__LIST__ = $acl['sub'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub): $mod = ($i % 2 );++$i;?>
                                                <input name="acl[]" lay-skin="primary" type="checkbox" title="<?php echo $sub['name']; ?>" value="<?php echo $sub['urls']; ?>"> 
                                            <?php endforeach; endif; else: echo "" ;endif; ?>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </tbody>
                    </table>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label for="desc" class="layui-form-label">
                        描述
                    </label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" id="desc" name="desc" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                <button class="layui-btn" lay-submit="" lay-filter="add">添加</button>
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
            name: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符啊';
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
            var scrollTop = $(document).scrollTop();
            $('body,html').animate({
                scrollTop: 0
            }, 0);
            console.log(data.field);
            //发异步，把数据提交给php
            $.ajax({
              url: "<?php echo url('admin/Admin/role_add'); ?>",
              type: 'POST',
              dataType: 'json',
              data: data.field,
              success: function(res) {
                //called when successful
                // console.log(res);
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
                        layer.closeAll();
                        $('body,html').animate({
                          scrollTop: scrollTop
                        }, 2);
                    });
                }
                
              },
              error: function(res) {
                //called when there is an error
                layer.alert("网络异常，请稍后再试！", {icon: 6},function () {
                    // 获得frame索引
                    var index = parent.layer.getFrameIndex(window.name);
                    //关闭当前frame
                    parent.layer.close(index);
                    $('body,html').animate({
                      scrollTop: scrollTop
                    }, 2);
                });
              }
            });
            
            
            return false;
          });
        
        //选择取消点击
        $('.super_author').click(function(){
            
               if($(this).find('input').prop('checked')==true){
                    $(this).next('td').find('input').next('div').addClass("layui-form-checked");
                    $(this).next('td').find('input').prop('checked',true);
               }else{
                    $(this).next('td').find('input').next('div').removeClass("layui-form-checked");
                    $(this).next('td').find('input').prop('checked',false);
               }
               
        })
          
        });
    </script>

  </body>

</html>