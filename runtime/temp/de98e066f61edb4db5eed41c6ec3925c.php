<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:39:"../app/admin/view/todolist\approve.html";i:1548667756;}*/ ?>
<!DOCTYPE html>
<html>
<head> 
    <meta charset="UTF-8" /> 
    <title>选择审批人</title> 
    <meta name="renderer" content="webkit" /> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> 
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" /> 
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" /> 
    <link rel="stylesheet" href="/static/admin/css/font.css" /> 
    <link rel="stylesheet" href="/static/admin/css/xadmin.css" /> 
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
            <a href="">内容管理</a>
            <a><cite>选择审批人</cite></a>
        </span> 
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新"> <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a> 
    </div> 
    <div class="x-body">
        <blockquote class="layui-elem-quote">注意：只有管理员自己所拥有的文章才能送审，无权限送审其他人员拥有的文章！</blockquote>
        <form class="layui-form" enctype="multipart/form-data"> 
            <div class="layui-form-item"> 
                <label class="layui-form-label"><span class="x-red">*</span>选择审批人</label> 
                <div class="layui-input-inline"> 
                    <select name="approve" lay-verify="required">
                        <option value="">选择要送审的人员</option>
                        <?php if(is_array($admin) || $admin instanceof \think\Collection || $admin instanceof \think\Paginator): $i = 0; $__LIST__ = $admin;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$admin): $mod = ($i % 2 );++$i;?>
                            <option value="<?php echo $admin['name']; ?>"><?php echo $admin['name']; ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select> 
                </div> 
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>选择要送审的人员
                </div> 
            </div>
            <div class="layui-form-item layui-form-text"> 
                <label class="layui-form-label"><span class="x-red">*</span>备注</label> 
                <div class="layui-input-block"> 
                    <textarea name="remark" lay-verify="required" value="" placeholder="请输入内容" class="layui-textarea"></textarea> 
                </div> 
            </div>
            <div class="layui-form-item">
                <label for="sen_info" class="layui-form-label">
                </label>
                <button class="layui-btn layui-btn-sm" id="sen_info" lay-filter="approve" lay-submit="">立即送审</button>
                <button type="reset" class="layui-btn layui-btn-sm layui-btn-warm" lay-filter="">取消</button>
            </div>
            <input type="hidden" name="id" value="<?php echo $id; ?>">
            <input type="hidden" name="name" value="<?php echo $name; ?>">
        </form> 
    </div> 
    <script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery
        var form = layui.form
        ,layer = layui.layer;
      
        //监听提交
        form.on('submit(approve)', function(data){
            // console.log(data.field);
            //发异步，把数据提交给php
            $.ajax({
                url: "<?php echo url('admin/Todolist/approve_edit'); ?>",
                type: 'POST',
                dataType: 'json',
                data: data.field,
                success: function(res) {
                    //called when successful
                    if(res.status==1){
                        layer.msg(res.msg,{icon:1,time:1500});
                        setTimeout(function(){
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                            // parent.location.reload(); // 父页面刷新
                            parent.location.replace(parent.location.href);
                        },1500);
                    }else{
                        layer.msg(res.msg,{icon:2,time:1500});
                    }
                    
                },
                error: function(res) {
                    //called when there is an error
                    layer.msg('网络异常，请稍后再试！');
                }
            });
            
            return false;
        });
      
      
    });

    </script>

</body>
</html>