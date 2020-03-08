<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:36:"../app/admin/view/shop\shop_add.html";i:1553445115;s:57:"D:\phpStudy\WWW\flyfly\app\admin\view\public\uploads.html";i:1553444343;}*/ ?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>添加商品</title>
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
            <a href="">商品管理</a>
            <a><cite>添加商品</cite></a>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>
    <div class="x-body">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="name" class="layui-form-label">
                    <span class="x-red">*</span>商品名称
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="name" name="name" required="" lay-verify="required"
                      autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>请输入商品名称
                </div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label"><span class="x-red">*</span>所属分类</label>
                <div class="layui-input-inline">
                    <select name="cate_id" lay-verify="required">
                        <option value="">请选择所属分类</option>
                            <?php if(is_array($cate) || $cate instanceof \think\Collection || $cate instanceof \think\Paginator): $i = 0; $__LIST__ = $cate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i;?>
                                <option value="<?php echo $cate['id']; ?>"><?php echo $cate['title']; ?></option>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>商品所属顶级分类
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label"><span class="x-red">*</span>所属品牌</label>
                <div class="layui-input-inline">
                    <select name="brand_id" lay-verify="required">
                        <option value="">请选择所属品牌</option>
                            <?php if(is_array($brand) || $brand instanceof \think\Collection || $brand instanceof \think\Paginator): $i = 0; $__LIST__ = $brand;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$brand): $mod = ($i % 2 );++$i;?>
                                <option value="<?php echo $brand['id']; ?>"><?php echo $brand['name']; ?></option>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>商品所属品牌
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label"><span class="x-red">*</span>商品模型</label>
                <div class="layui-input-inline" id="model_list"></div>
                <div class="layui-form-mid layui-word-aux notice">
                    <span class="x-red">*</span>选择相应的商品模型
                </div>
            </div>
            
            <div class="layui-form-item">
                <label for="number" class="layui-form-label">
                    <span class="x-red">*</span>商品库存
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="number" name="number" required="" lay-verify="number"
                      autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>商品库存数量
                </div>
            </div>
            <div class="layui-form-item">
                <label for="price" class="layui-form-label">
                    <span class="x-red">*</span>商品价格
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="price" name="price" required="" lay-verify="price"
                      autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text"> 
                <label class="layui-form-label"><span class="x-red">*</span>商品描述</label> 
                <div class="layui-input-block"> 
                    <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea> 
                </div> 
            </div>

            <div class="layui-form-item layui-form-text"> 
                <label class="layui-form-label"><span class="x-red">*</span>产品参数</label> 
                <div class="layui-input-block"> 
                    <textarea name="parameter" placeholder="请输入内容" class="layui-textarea"></textarea> 
                </div> 
            </div>

            <div class="layui-form-item img">
                <label for="img_url" class="layui-form-label"><span class="x-red">*</span>商品图片</label>
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
                    <span class="x-red">*</span>请选择商品图片...
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-upload-list" style="margin-left:66px">
                    <img class="layui-upload-img" id="up_imgs" /><span id="up_text"></span>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="price" class="layui-form-label">
                    <span class="x-red">*</span>商品相册
                </label>
                <div class="layui-input-block">
                    <div class="layui-upload">
                        <button type="button" class="layui-btn layui-btn-normal" id="testList">选择图片</button>
                        <div class="layui-upload-list">
                            <table class="layui-table">
                                <thead>
                                    <tr>
                                        <th>文件名</th>
                                        <th>大小</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody id="demoList"></tbody>
                            </table>
                        </div>
                        <button type="button" class="layui-btn" id="testListAction">开始上传</button>
                    </div> 
                </div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>热销
                </label>
                <div class="layui-input-block">
                    <input type="radio" name="is_hot" value="1" title="是">
                    <input type="radio" name="is_hot" value="0" title="否" checked="">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>状态
                </label>
                <div class="layui-input-block">
                    <input type="radio" name="shelf" value="1" title="上架" checked="">
                    <input type="radio" name="shelf" value="0" title="下架">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="name" class="layui-form-label">
                </label>
                <button  class="layui-btn layui-btn-sm" lay-filter="add" lay-submit="">立即添加</button>
                <button  class="layui-btn layui-btn-sm layui-btn-warm" lay-filter="" type="reset">重置</button>
            </div>
        </form>
    </div>
<script>
var tagData=<?php echo $shop_model; ?>;
var notice="<span class='x-red'>*</span>暂无数据...";

if(tagData.length==0){
    $('.notice').html(notice);
}

layui.config({
    base: '/static/lib/layui/module/',
})

layui.use(['form','layer','upload','selectM'], function(){
    $ = layui.jquery;
    var form = layui.form
    ,layer = layui.layer
    ,selectM = layui.selectM
    ,upload = layui.upload;

    //多选标签-基本配置
    var tagIns = selectM({
        //元素容器【必填】
        elem: '#model_list'
        //候选数据【必填】
        ,data: tagData
        ,max:tagData.length
        ,width:400
        //添加验证
        ,verify:'required'
        //默认值
        ,selected: []
    });

    //自定义验证规则
    form.verify({
        name: function(value){
            if(value.length < 2){
                return '名称至少得2个字符啊';
            }
        }
        ,pass: [/(.+){6,12}$/, '密码必须6到12位']
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

    //多文件列表示例
    var demoListView = $('#demoList')
        ,uploadListIns = upload.render({
        elem: '#testList'
        ,url: "<?php echo url('admin/behavior/uploads_img'); ?>"
        ,accept: 'file'
        ,multiple: true
        ,auto: false
        ,bindAction: '#testListAction'
        ,choose: function(obj){   
            var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
            //读取本地文件
            obj.preview(function(index, file, result){
                var tr = $(['<tr id="upload-'+ index +'">'
                ,'<td>'+ file.name +'</td>'
                ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
                ,'<td>等待上传</td>'
                ,'<td>'
                    ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
                    ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
                ,'</td>'
                ,'</tr>'].join(''));
            
                //单个重传
                tr.find('.demo-reload').on('click', function(){
                    obj.upload(index, file);
                });
            
                //删除
                tr.find('.demo-delete').on('click', function(){
                    delete files[index]; //删除对应的文件
                    tr.remove();
                    uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                });
            
                demoListView.append(tr);
            });
        }
        ,done: function(res, index, upload){
            if(res.code == 0){ //上传成功
                console.dir(res.img);
                var tr = demoListView.find('tr#upload-'+ index)
                ,tds = tr.children();
                tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                tds.eq(3).html("<input type='hidden' name='img[]' value='"+res.img+"'>"); //清空操作
                return delete this.files[index]; //删除文件队列已经上传成功的文件
            }

            this.error(index, upload);
        }
        ,error: function(index, upload){
            var tr = demoListView.find('tr#upload-'+ index)
            ,tds = tr.children();
            tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
            tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
        }
    });


    //监听提交
    form.on('submit(add)', function(data){
        console.log(data.field);
        //发异步，把数据提交给php
        $.ajax({
            url: "<?php echo url('admin/Shop/shop_add'); ?>",
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

        return false;
    });

    //监听重置按钮
    $('form').find(':reset').click(function(){
        
        for (var i = 0; i < $('form').size(); i++){
            $('form')[i].reset();
            tagIns.set();//默认值
        };

        return false;
    });


});

</script>
</body>

</html>