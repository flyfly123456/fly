<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:46:"../app/admin/view/admin\role_resource_add.html";i:1553756902;}*/ ?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>添加权限FlyFly v1.0</title>
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
            <a><cite>添加权限</cite></a>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>
    <div class="x-body">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>所属类型
                </label>
                <div class="layui-input-inline">
                    <select name="resource_type" lay-verify="required">
                        <option value="">请选择所属类型</option>
                        <?php if(is_array($system_sort) || $system_sort instanceof \think\Collection || $system_sort instanceof \think\Paginator): $i = 0; $__LIST__ = $system_sort;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$system_sort): $mod = ($i % 2 );++$i;?>
                            <option value="<?php echo $system_sort['sort_name']; ?>"><?php echo $system_sort['sort_name']; ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>权限名称
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="role_name" name="role_name" required="" lay-verify="required"
                      autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="group" class="layui-form-label">
                    <span class="x-red">*</span>所属分组
                </label>
                <div class="layui-input-inline">
                    <select name="group" id="group" lay-verify="required">
                        <option value="选择分组">选择分组</option>
                        <?php if(is_array($group) || $group instanceof \think\Collection || $group instanceof \think\Paginator): $i = 0; $__LIST__ = $group;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$group): $mod = ($i % 2 );++$i;?>
                            <option value="<?php echo $group['name']; ?>"><?php echo $group['name']; ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-row">
                    <div class="layui-col-xs4">
                        <label class="layui-form-label"><span class="x-red">*</span>添加权限码</label>
                        <div class="layui-input-inline">
                            <select name="controller_list" lay-filter="controller" lay-verify="required">
                                <option value="选择控制器">选择控制器</option>
                                <?php if(is_array($controller) || $controller instanceof \think\Collection || $controller instanceof \think\Paginator): $i = 0; $__LIST__ = $controller;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$controller): $mod = ($i % 2 );++$i;?>
                                    <option value="<?php echo $controller; ?>"><?php echo $controller; ?></option>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </select>
                        </div>
                    </div>
                    <div class="layui-col-xs8">
                        <ul class="action"></ul>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span class="x-red">*</span>权限码</label>
                <div class="layui-input-inline" style="width:400px">
                    <table class="layui-table" lay-skin="nob" style="margin-top:0px;">
                      <thead>
                        <tr>
                          <th style="width:300px">权限码</th>
                          <th>操作</th>
                        </tr> 
                      </thead>
                      <tbody class="role_code"></tbody>
                    </table>
                </div>
            </div>
            
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                </label>
                <button  class="layui-btn layui-btn-sm" lay-filter="add" lay-submit="">增加</button>
                <button  class="layui-btn layui-btn-sm layui-btn-warm" lay-filter="" type="reset">重置</button>
            </div>
        </form>
    </div>
<script>
layui.use(['form','layer'], function(){
    $ = layui.jquery;
    var form = layui.form
    ,layer = layui.layer;

    //监听提交
    form.on('submit(add)', function(data){
        console.log(data.field);
        //发异步，把数据提交给php
        $.ajax({
            url: "<?php echo url('admin/Admin/role_resource_add'); ?>",
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

        var scrollTop = $(document).scrollTop();
        $('body,html').animate({
            scrollTop: 0
        }, 0);

        return false;

    });

    //监听控制器改变
    form.on('select(controller)', function(data){
      
        console.log(data.value); //得到被选中的值
        post={
            name:data.value
        };
        //发异步，把数据提交给php
        $.ajax({
            url: "<?php echo url('admin/Admin/role_resource_add'); ?>",
            type: 'POST',
            dataType: 'json',
            data: post,
            success: function(res) {
                //called when successful
              
                if(res.info.length!=0){
                    // console.log(res.info);
                    action="";
                    $.each(res.info, function(index, val) {
                        //iterate through array or object
                        action+="<li style='float:left;width:220px;'><input name='code_list' lay-skin='primary' lay-filter='code_list' type='checkbox' title='"+val+"' value='"+val+"'></li>";
                    });
                    // console.log(action);
                    $('.action').empty().append(action);
                    form.render();
                }else{
                    layer.msg('数据异常！');
                }
            },
            error: function(res) {
                //called when there is an error
                layer.msg("网络异常，请稍后再试");
            }
        });

    });

    //监听控制器方法
    form.on('checkbox(code_list)', function(data){
        // console.log(data.elem.checked); //是否被选中，true或者false
        // console.log(data.value); //复选框value值，也可以通过data.elem.value得到
        
        controller=$("select[name='controller_list']").val();

        mark=controller+"/"+data.value;
        del=controller+"_"+data.value;

        role_code="<tr id='"+del+"'><td  style='width:300px'><input type='text' name='role_code[]' required='' lay-verify='required' autocomplete='off' class='layui-input' value='"+mark+"'></td><td><span class='layui-btn layui-btn-sm layui-btn-danger del_code'>删除</span></td></tr>";

        if(data.elem.checked){
            $(".role_code").append(role_code);
        }else{
            $("#"+del).empty().remove()
        }

    }); 


});


$(function(){
    $('.role_code').delegate('.del_code','click',function(){
        // alert($('.role_code input').val())
        $(this).parents('td').parents('tr').remove().empty();
    })

})
</script>
</body>

</html>