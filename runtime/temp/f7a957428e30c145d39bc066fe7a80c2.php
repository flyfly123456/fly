<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:36:"../app/admin/view/cate\cate_add.html";i:1552652867;s:57:"D:\phpStudy\WWW\flyfly\app\admin\view\public\uploads.html";i:1553444343;}*/ ?>
<!DOCTYPE html>
<html>
  
<head>
    <meta charset="UTF-8">
    <title>添加分类</title>
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
            <a href="">分类管理</a>
            <a><cite>添加分类</cite></a>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>
    <div class="x-body">
        <form class="layui-form">
          <div class="layui-form-item">
              <label class="layui-form-label">父级分类</label>
              <div class="layui-input-inline">
                <select name="pid" lay-verify="required" lay-filter="cate">
                  <?php if($id): ?>
                    <option value="">请选择父级分类</option>
                    <option value="0" disabled>|--顶级分类</option>
                    <?php if(is_array($cate) || $cate instanceof \think\Collection || $cate instanceof \think\Paginator): $i = 0; $__LIST__ = $cate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i;if($id == $cate['id']): ?>
                        <option value="<?php echo $cate['id']; ?>" selected><?php echo $cate['title']; ?></option>
                      <?php else: ?>
                        <option value="<?php echo $cate['id']; ?>" disabled><?php echo $cate['title']; ?></option>
                      <?php endif; endforeach; endif; else: echo "" ;endif; else: ?>
                    <option value="">请选择父级分类</option>
                    <option value="0">|--顶级分类</option>
                    <?php if(is_array($cate) || $cate instanceof \think\Collection || $cate instanceof \think\Paginator): $i = 0; $__LIST__ = $cate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i;?>
                      <option value="<?php echo $cate['id']; ?>"><?php echo $cate['title']; ?></option>
                    <?php endforeach; endif; else: echo "" ;endif; endif; ?>
                </select>
              </div>
            </div>

            <div class="layui-form-item img">
                <label for="img_url" class="layui-form-label"><span class="x-red">*</span>分类图片</label>
                <div class="layui-input-inline">
                    <input name="img_url" id="img_url" placeholder="图片地址" value="" class="layui-input" />
                  
                </div>
                <div class="layui-input-inline" style="width: auto;">
                    <div class="layui-upload">
                        <button type="button" class="layui-btn" id="img">上传图片</button>
                        <button type="button" class="layui-btn" id="show_img">查看图片</button>
                    </div>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>请选择顶级分类图片...
                </div>
            </div>

            <div class="layui-form-item">
                <label for="title" class="layui-form-label">
                    <span class="x-red">*</span>分类名称</label>
                <div class="layui-input-inline">
                  <input type="text" id="title" name="title" required="" lay-verify="title" autocomplete="off" class="layui-input" value="">
                </div>
                <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>分类名称至少2个字符，且不得重复添加...
                </div>
            </div>

            <div class="layui-form-item">
                <label for="url" class="layui-form-label">
                    <span class="x-red">*</span>分类链接</label>
                <div class="layui-input-inline">
                  <input type="text" id="url" name="url" lay-verify="url" autocomplete="off" class="layui-input" value="">
                </div>
                <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>只有三级分类链接才生效...
                </div>
            </div>

            <div class="layui-form-item layui-form-text"> 
                <label class="layui-form-label"><span class="x-red">*</span>分类描述</label> 
                <div class="layui-input-block"> 
                    <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea> 
                </div> 
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>状态
                </label>
                <div class="layui-input-inline">
                      <input type="radio" name="status" value="1" class="layui-input" title="启用" checked>
                      <input type="radio" name="status" value="0" class="layui-input" title="禁用">
                        
                </div>
            </div>
            <div class="layui-form-item">
                <label for="title" class="layui-form-label">
                </label>
                <button  class="layui-btn layui-btn-sm" id="add" lay-filter="add" lay-submit="">
                  立即添加
                </button>
                <button  class="layui-btn layui-btn-warm layui-btn-sm" type="reset" lay-filter="" lay-submit="">
                  重置
                </button>
            </div>
      </form>
    </div>
    <script>

        layui.use(['form','layer','upload','element'], function(){
          $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer
          ,element = layui.element
          ,upload = layui.upload;
          form.render();
          upload.render();
          //自定义验证规则
          form.verify({
            title: function(value){
              if(value.length < 2){
                return '名称至少得2个字符啊';
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
          form.on('submit(add)', function(data){
            console.log(data.field);
            // console.log(typeof data.field);
            //发异步，把数据提交给php
            $.ajax({
              url: 'cate_add',
              type: 'POST',
              dataType: 'json',
              data: data.field,
              success: function(res) {
                console.log(res);
                if(res.status=='1'){
                  //called when successful
                  layer.alert(res.msg, {icon: 6},function () {
                      layer.closeAll();
                      location.replace(location.href);
                  });
                }else{
                  layer.alert(res.msg, {icon: 5},function () {
                      layer.closeAll();
                  });
                }
              },
              error: function(res) {
                //called when there is an error
                layer.msg('网络异常，请稍后再试...');
              }
            });
            
            
            return false;
          });
          
          
      });

    </script>
</body>

</html>