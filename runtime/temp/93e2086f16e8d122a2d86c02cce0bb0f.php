<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:43:"../app/admin/view/article\article_edit.html";i:1552403958;s:57:"D:\phpStudy\WWW\flyfly\app\admin\view\public\uploads.html";i:1553444343;}*/ ?>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>文章编辑</title>
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
        #edui1_iframeholder{
            min-height: 200px!important;
        }
  </style>
  <body class="layui-anim layui-anim-up">
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">文章管理</a>
        <a>
          <cite>文章编辑</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>
    <div class="x-body">
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="article_title" class="layui-form-label">
                  <span class="x-red">*</span>文章标题
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="article_title" name="title" required="" lay-verify="article_content"
                  autocomplete="off" class="layui-input" value="<?php echo $rows['title']; ?>">
              </div>
          </div>

          <div class="layui-form-item"> 
              <label class="layui-form-label"><span class="x-red">*</span>文章分类</label> 
              <div class="layui-input-inline"> 
                  <select name="cate_id" lay-verify="required">
                      <option value="">请选择文章分类</option>
                      <?php if(is_array($article_cate) || $article_cate instanceof \think\Collection || $article_cate instanceof \think\Paginator): $i = 0; $__LIST__ = $article_cate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$article_cate): $mod = ($i % 2 );++$i;if($rows['cate_id'] == $article_cate['id']): ?>
                            <option value="<?php echo $article_cate['id']; ?>" selected><?php echo $article_cate['name']; ?></option>
                          <?php else: ?>
                            <option value="<?php echo $article_cate['id']; ?>"><?php echo $article_cate['name']; ?></option>
                          <?php endif; endforeach; endif; else: echo "" ;endif; ?>
                  </select> 
              </div> 
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>请选择文章所属分类
              </div> 
          </div>
          
          <div class="layui-form-item layui-form-text"> 
              <label for="desc" class="layui-form-label">
                  <span class="x-red">*</span>关键字描述
              </label>
              <div class="layui-input-block"> 
                  <textarea name="desc" id="desc" placeholder="请输入描述内容" class="layui-textarea" required="" lay-verify="article_content" autocomplete="off"><?php echo $rows['desc']; ?></textarea> 
              </div> 
          </div>
          <div class="layui-form-item">
              <label for="desc" class="layui-form-label">
                  <span class="x-red">*</span>文章状态
              </label>
              <div class="layui-input-inline">
                    <?php if($rows['status'] == 0): ?>
                        <input type="text" id="status" name="status" required="" lay-verify=""
                  autocomplete="off" class="layui-input" disabled="" value="未送审">
                    <?php elseif($rows['status'] == 1): ?>
                        <input type="text" id="status" name="status" required="" lay-verify=""
                  autocomplete="off" class="layui-input" disabled="" value="已送审">
                    <?php elseif($rows['status'] == 2): ?>
                        <input type="text" id="status" name="status" required="" lay-verify=""
                  autocomplete="off" class="layui-input" disabled="" value="已审核">
                    <?php else: ?>
                        <input type="text" id="status" name="status" required="" lay-verify=""
                      autocomplete="off" class="layui-input" disabled="" value="已驳回">
                    <?php endif; ?>
                  
              </div>
          </div>
          <div class="layui-form-item">
              <label for="container" class="layui-form-label">
                  <span class="x-red">*</span>文章内容
              </label>
              <div class="layui-input-block">
                  <!-- 加载编辑器的容器 -->
                  <textarea name="content" id="container" lay-verify="article_content" cols="30" rows="20"><?php echo $rows['content']; ?></textarea>
              </div>
          </div>

          <div class="layui-form-item img">
              <label for="title" class="layui-form-label"><span class="x-red">*</span>文章图片</label>
              <div class="layui-input-inline">
                <input name="img_url" id="img_url" placeholder="图片地址" value="<?php echo $rows['img']; ?>" class="layui-input" />
              </div>
              <div class="layui-input-inline" style="width: auto;">
                  <div class="layui-upload">
                      <button type="button" class="layui-btn" id="img">上传图片</button>
                      <button type="button" class="layui-btn" id="show_img">查看图片</button>
                  </div>
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>请选择文章图片...
              </div>
          </div>
          <div class="layui-form-item">
              <div class="layui-upload-list" style="margin-left:66px">
                  <img class="layui-upload-img" src="/uploads/<?php echo $rows['img']; ?>" id="up_imgs" /><span id="up_text"></span>
              </div>
          </div>

          <div class="layui-form-item">
              <label for="container" class="layui-form-label">
              </label>
              <button  class="layui-btn layui-btn-sm" lay-filter="edit" lay-submit="">
                  修改
              </button>
              <button  class="layui-btn layui-btn-warm layui-btn-sm">
                  取消
              </button>
          </div>
          <input type="hidden" name="id" value="<?php echo $rows['id']; ?>">
      </form>
    </div>

    <script>
        layui.use(['form','layer','upload'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,upload = layui.upload
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            article_content: function(value){
              if(value.length < 1){
                return '内容至少得1个字符啊';
              }
            }
          });

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

            console.log(data.field);
            //发异步，把数据提交给php
            $.ajax({
              url: "<?php echo url('admin/Article/article_edit'); ?>",
              type: 'POST',
              dataType: 'json',
              data: data.field,
              success: function(res) {
                //called when successful
                if(res.status=='1'){
                    layer.alert(res.msg, {icon: 6},function () {
                        layer.closeAll('dialog'); 
                    });
                }else{
                   layer.alert(res.msg, {icon: 5},function () {
                       layer.closeAll('dialog'); 
                   }); 
                }
                
              },
              error: function(res) {
                //called when there is an error
                layer.alert("网络异常，请稍后再试！", {icon: 5},function () {
                    layer.closeAll('dialog'); 
                });
              }
            });
            
            return false;
          });
          
          
        });
    </script>

  <!-- 配置文件 -->
  <script type="text/javascript" src="/static/lib/ueditor/ueditor.config.js"></script>
  <!-- 编辑器源码文件 -->
  <script type="text/javascript" src="/static/lib/ueditor/ueditor.all.js"></script>
  <!-- 实例化编辑器 -->
  <script type="text/javascript">
      var ue = UE.getEditor('container');
  </script>
  <script id="container" name="content" type="text/plain">这里写你的初始化内容</script>
</body>
</html>