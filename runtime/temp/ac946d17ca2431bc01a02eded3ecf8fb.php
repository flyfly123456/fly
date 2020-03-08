<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:39:"../app/admin/view/admin\admin_info.html";i:1553756018;s:57:"D:\phpStudy\WWW\flyfly\app\admin\view\public\uploads.html";i:1553444343;}*/ ?>
<!DOCTYPE html>
<html>
<head> 
    <meta charset="UTF-8" /> 
    <title>基础资料</title> 
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
            <a href="">基础管理</a>
            <a><cite>个人资料</cite></a>
        </span> 
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新"> <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a> 
    </div> 
    <div class="x-body">
        <blockquote class="layui-elem-quote">注意：管理员所有的基础信息修改之后必须退出重新登入才生效！</blockquote>
        <form class="layui-form" enctype="multipart/form-data"> 
            <div class="layui-form-item"> 
                <label for="department" class="layui-form-label"> <span class="x-red">*</span>所在部门</label> 
                <div class="layui-input-inline"> 
                    <input type="text" id="department" name="department" required="" lay-verify="required" autocomplete="off" disabled class="layui-input" value="<?php echo $admin_info['department']; ?>" /> 
                </div> 
            </div>
            <div class="layui-form-item"> 
                <label class="layui-form-label"><span class="x-red">*</span>我的角色</label> 
                <div class="layui-input-inline"> 
                    <select name="role_group_id" lay-verify="">
                        <?php if(is_array($role_group_info) || $role_group_info instanceof \think\Collection || $role_group_info instanceof \think\Paginator): $i = 0; $__LIST__ = $role_group_info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$role_group_info): $mod = ($i % 2 );++$i;if($role_group_info['id'] == $admin_info['role_group_id']): ?>
                                <option value="<?php echo $role_group_info['id']; ?>" selected=""><?php echo $role_group_info['role_name']; ?></option>
                            <?php else: ?>
                                <option value="<?php echo $role_group_info['id']; ?>" disabled><?php echo $role_group_info['role_name']; ?></option>
                            <?php endif; endforeach; endif; else: echo "" ;endif; ?>
                    </select> 
                </div> 
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>当前角色不可更改为其它角色
                </div> 
            </div>
            <div class="layui-form-item">
                <label for="multi_device" class="layui-form-label"><span class="x-red">*</span>多设备</label>
                <div class="layui-input-inline" style="margin-top:7px;">
                    <?php if($admin_info['multi_device'] == 1): ?>
                        <input type="checkbox" id="multi_device" checked="" name="multi_device" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
                    <?php else: ?>
                        <input type="checkbox" id="multi_device" name="multi_device" lay-skin="switch" lay-text="ON|OFF">
                    <?php endif; ?>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>默认开启多设备登入
                </div>
            </div>
            <div class="layui-form-item"> 
                <label for="name" class="layui-form-label"> <span class="x-red">*</span>登录名 </label> 
                <div class="layui-input-inline"> 
                    <input type="text" id="name" name="name" required="" lay-verify="required" autocomplete="off" class="layui-input" value="<?php echo $admin_info['name']; ?>" /> 
                    <input type="hidden" name="id" value="<?php echo $admin_info['id']; ?>" /> 
                </div> 
                <div class="layui-form-mid layui-word-aux"> 
                    <span class="x-red">*</span>登录名是您登入的唯一凭证 
                </div> 
            </div>
            <div class="layui-form-item"> 
                <label for="phone" class="layui-form-label"> <span class="x-red">*</span>手机 </label> 
                <div class="layui-input-inline"> 
                    <input type="text" id="phone" name="phone" required="" lay-verify="phone" autocomplete="off" class="layui-input" value="<?php echo $admin_info['telephone']; ?>" /> 
                </div> 
            </div> 
            <div class="layui-form-item"> 
                <label for="L_email" class="layui-form-label"> <span class="x-red">*</span>邮箱 </label> 
                <div class="layui-input-inline"> 
                    <input type="text" id="L_email" name="email" required="" lay-verify="email" autocomplete="off" class="layui-input" value="<?php echo $admin_info['email']; ?>" /> 
                </div> 
            </div> 
            <div class="layui-form-item"> 
                <label class="layui-form-label"><span class="x-red">*</span>性别</label> 
                <div class="layui-input-inline"> 
                    <?php if($admin_info['sex'] == 1): ?>
                        <input type="radio" name="sex" value="1" class="layui-input" title="男" checked>
                        <input type="radio" name="sex" value="0" class="layui-input" title="女">
                    <?php else: ?>
                        <input type="radio" name="sex" value="1" class="layui-input" title="男">
                        <input type="radio" name="sex" value="0" class="layui-input" title="女" checked>
                    <?php endif; ?>
                </div> 
            </div> 
            
            <div class="layui-form-item img">
                <label for="img_url" class="layui-form-label"><span class="x-red">*</span>头像</label>
                <div class="layui-input-inline">
                    <?php if(($admin_info['img_url'] == 'woman.png') OR ($admin_info['img_url'] == 'man.png')): ?>
                        <input name="img_url" id="img_url" placeholder="图片地址" value="header/<?php echo $admin_info['img_url']; ?>" class="layui-input" />
                    <?php else: ?>
                        <input name="img_url" id="img_url" placeholder="图片地址" value="header/<?php echo $admin_info['id']; ?>/<?php echo $admin_info['img_url']; ?>" class="layui-input" />
                    <?php endif; ?>
                  
                </div>
                <div class="layui-input-inline" style="width: auto;">
                    <div class="layui-upload">
                        <button type="button" class="layui-btn" id="img">上传图片</button>
                        <button type="button" class="layui-btn" id="show_img">查看图片</button>
                    </div>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>请选择头像图片...
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-upload-list" style="margin-left:66px">
                    <?php if(($admin_info['img_url'] == 'woman.png') OR ($admin_info['img_url'] == 'man.png')): ?>
                        <img class="layui-upload-img" src="/uploads/header/<?php echo $admin_info['img_url']; ?>" id="up_imgs" />
                    <?php else: ?>
                        <img class="layui-upload-img" src="/uploads/header/<?php echo $admin_info['id']; ?>/<?php echo $admin_info['img_url']; ?>" id="up_imgs" />
                    <?php endif; ?>
                    <span id="up_text"></span>
                </div>
            </div>
            <div class="layui-form-item layui-form-text"> 
                <label class="layui-form-label">备注</label> 
                <div class="layui-input-block"> 
                    <textarea name="remark" placeholder="请输入内容" class="layui-textarea"><?php echo $admin_info['remark']; ?></textarea> 
                </div> 
            </div>
            <div class="layui-form-item">
                <label for="sen_info" class="layui-form-label">
                </label>
                <button class="layui-btn layui-btn-sm" id="sen_info" lay-filter="edit" lay-submit="">立即修改</button>
                <button type="reset" class="layui-btn layui-btn-sm layui-btn-warm" lay-filter="">重置</button>
            </div> 
        </form> 
    </div> 
    <script>
    layui.use(['form','layer','upload'], function(){
        $ = layui.jquery
        var form = layui.form
        ,layer = layui.layer
        ,upload = layui.upload;
            
        //自定义验证规则
        form.verify({
            nikename: function(value){
                if(value.length < 5){
                    return '昵称至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,16}$/, '密码必须6到16位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
        });

        //普通图片上传
        upload.render({
    elem: '#img'
    ,url: "<?php echo url('admin/behavior/uploads_img'); ?>"
    ,auto: true
    ,multiple: true
    // ,bindAction: '#add'
    ,before: function(obj){
    //预读本地文件示例，不支持ie8
    obj.preview(function(index, file, result){
        $('#up_imgs').attr('src', result); //图片链接（base64）
    });
    layer.msg('图片上传中...');
}
,done: function(res){
    console.log(res)
    //如果上传失败
    if(res.code > 0){
        return layer.msg('上传失败！');
    }
    //上传成功
    setTimeout(function(){
        layer.msg('图片上传成功...');
        $("#img_url").val(res.img)
    },1000)
}
,error: function(){
    //演示失败状态，并实现重传
    var demoText = $('#up_text');
    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-danger demo-reload">重试</a>');
    demoText.find('.demo-reload').on('click', function(){
        uploadInst.upload();
    });
    }
});

$('#show_img').on('click', function() {
    var img=$('#img_url').val();
    layer.open({
        // title: "个人头像",
        type: 3,
        content: "<img src='<?php echo $domain; ?>/uploads/"+img+"' />",
        area: ['500px', '300px'],
        shadeClose: true
    });
});
              
        //监听提交
        form.on('submit(edit)', function(data){
            // var img=$('#img_url').val();
            // var file=$(':file').val();
            // console.log(data.field);
            //发异步，把数据提交给php
            $.ajax({
                url: "<?php echo url('admin/Admin/base_info'); ?>",
                type: 'POST',
                dataType: 'json',
                data: data.field,
                success: function(res) {
                    console.log(res)
                    //called when successful
                    if(res.status=="1"){
                        layer.confirm(res.msg+'，请重新登入',{icon: 6, title:'系统提示'},function(index){
                            parent.window.location="<?php echo url('admin/Login/logout'); ?>";
                        });
                    
                    }else{
                        layer.alert(res.msg, {icon: 5},function () {
                            layer.closeAll();
                        });
                    }
                },
                error: function(res) {
                    //called when there is an error
                    layer.alert("网络异常，请稍后再试！", {icon: 5},function () {
                        layer.closeAll();
                    });
                }
            });
            
            return false;
        });
      
      
    });

    $('#view_header_img').on('click', function() {

        var img=$('#img_url').val();
        layer.open({
            // title: "个人头像",
            type: 3,
            content: "<img src='/uploads/"+img+"' />",
            area: ['500px', '300px'],
            shadeClose: true
        });
    });

    </script>

</body>
</html>