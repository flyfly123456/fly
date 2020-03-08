<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:39:"../app/admin/view/admin\admin_edit.html";i:1547032026;}*/ ?>
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
            <a><cite>编辑管理员</cite></a>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>
    <div class="x-body">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>登录名
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="<?php echo $rows['name']; ?>">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>将会成为您唯一的登入名
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>性别
                </label>
                <div class="layui-input-block">
                    <?php if($rows['sex'] == 1): ?>
                        <input type="radio" name="sex" value="1" title="男" checked="">
                        <input type="radio" name="sex" value="0" title="女">
                    <?php else: ?>
                        <input type="radio" name="sex" value="1" title="男">
                        <input type="radio" name="sex" value="0" title="女" checked="">
                    <?php endif; ?>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="phone" class="layui-form-label">
                    <span class="x-red">*</span>手机
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="phone" required="" lay-verify="phone"
                  autocomplete="off" class="layui-input" value="<?php echo $rows['telephone']; ?>">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>将会成为您唯一的登入名
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_email" class="layui-form-label">
                    <span class="x-red">*</span>邮箱
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="L_email" name="email" required="" lay-verify="email"
                  autocomplete="off" class="layui-input" value="<?php echo $rows['email']; ?>">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>多设备登入
                </label>
                <div class="layui-input-inline">
                    <?php if($rows['multi_device'] == 1): ?>
                        <input type="radio" name="multi_device" value="1" title="开启" checked="">
                        <input type="radio" name="multi_device" value="0" title="禁用">
                    <?php else: ?>
                        <input type="radio" name="multi_device" value="1" title="开启">
                        <input type="radio" name="multi_device" value="0" title="禁用" checked="">
                    <?php endif; ?>
                </div>
                <div class="layui-form-mid layui-word-aux"><span class="x-red">*</span>是否允许在多台设备上同时登入</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span class="x-red">*</span>所属部门</label>
                <div class="layui-input-inline">
                    <select name="department_id" lay-verify="required">
                        <option value=""></option>
                            <?php if(is_array($department) || $department instanceof \think\Collection || $department instanceof \think\Paginator): $i = 0; $__LIST__ = $department;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$department): $mod = ($i % 2 );++$i;if($rows['department_id'] == $department['id']): ?>
                                <option value="<?php echo $department['id']; ?>" selected><?php echo $department['name']; ?></option>
                              <?php else: ?>
                                <option value="<?php echo $department['id']; ?>"><?php echo $department['name']; ?></option>
                              <?php endif; endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span class="x-red">*</span>所属角色</label>
                <div class="layui-input-inline">
                    <select name="role_group_id" lay-verify="required">
                        <option value=""></option>
                        <?php if(is_array($sel_group_ids) || $sel_group_ids instanceof \think\Collection || $sel_group_ids instanceof \think\Paginator): $i = 0; $__LIST__ = $sel_group_ids;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sel_group_ids): $mod = ($i % 2 );++$i;if($sel_group_ids['id'] == $rows['role_group_id']): ?>
                                <option value="<?php echo $sel_group_ids['id']; ?>" selected=""><?php echo $sel_group_ids['role_name']; ?></option>
                            <?php else: ?>
                                <option value="<?php echo $sel_group_ids['id']; ?>"><?php echo $sel_group_ids['role_name']; ?></option>
                            <?php endif; endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>状态
                </label>
                <div class="layui-input-inline">
                    <?php if($rows['status'] == 0): ?>
                        <input type="radio" name="status" value="1" class="layui-input" title="启用">
                        <input type="radio" name="status" value="0" class="layui-input" title="禁用" checked>
                    <?php else: ?>
                        <input type="radio" name="status" value="1" class="layui-input" title="启用" checked>
                        <input type="radio" name="status" value="0" class="layui-input" title="禁用">
                    <?php endif; ?>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">
                    <span class="x-red">*</span>密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="L_pass" name="pass" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input" value="<?php echo $rows['password']; ?>">
                </div>
                <div class="layui-form-mid layui-word-aux"><span class="x-red">*</span>密码为6到16个字符</div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                    <span class="x-red">*</span>确认密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="L_repass" name="repass" required="" lay-verify="repass"
                  autocomplete="off" class="layui-input" value="<?php echo $rows['password']; ?>">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"></label>
                <button  class="layui-btn layui-btn-sm " lay-filter="edit" lay-submit="">修改</button>
                <button  class="layui-btn layui-btn-sm layui-btn-warm" lay-filter="" lay-submit="" type="reset">取消</button>
          </div>
          <input type="hidden" name="id" value="<?php echo $rows['id']; ?>">
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
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

          //监听提交
          form.on('submit(edit)', function(data){
            console.log(data.field);
            //发异步，把数据提交给php
            
            $.ajax({
              url: "<?php echo url('admin/Admin/admin_edit'); ?>",
              type: 'POST',
              dataType: 'json',
              data: data.field,
              success: function(res) {
                console.log(data.field);
                //called when successful
                if(res.status=="1"){
                    layer.alert(res.msg, {icon: 6},function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        parent.location.reload();
                    });
                }else{
                    layer.alert(res.msg, {icon: 5},function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        parent.location.reload();
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