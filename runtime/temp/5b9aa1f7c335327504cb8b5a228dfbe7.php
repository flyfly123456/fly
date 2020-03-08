<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:50:"../app/admin/view/evaluation\questions_import.html";i:1553577376;}*/ ?>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>导入试题</title>
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
        <style>
            #edui1_iframeholder{
                min-height: 100px!important;
            }
        </style>
    </head>
    <body class="layui-anim layui-anim-up">
        <div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">测评管理</a>
                <a>
                    <cite>导入试题</cite>
                </a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="x-body">
            <form class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="x-red">*</span>所属试卷</label>
                    <div class="layui-input-block">
                        <select name="examination_id" lay-verify="required">
                            <option value="">请选择所属试卷</option>
                            <?php if(is_array($examination) || $examination instanceof \think\Collection || $examination instanceof \think\Paginator): $i = 0; $__LIST__ = $examination;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$examination): $mod = ($i % 2 );++$i;?>
                                <option value="<?php echo $examination['id']; ?>"><?php echo $examination['title']; ?></option>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item"> 
                    <label class="layui-form-label"><span class="x-red">*</span>选择试题</label> 
                    <div class="layui-input-inline"> 
                        <input name="word" lay-verify="required" id="word" placeholder="文件地址" value="" required="" autocomplete='off' class="layui-input" />
                    </div> 
                    <div class="layui-input-inline" style="width: auto;"> 
                        <div class="layui-upload"> 
                            <button type="button" class="layui-btn" id="up_word">选择文件</button>
                        </div> 
                    </div> 
                </div>
                <div class="layui-form-item"> 
                    <div class="layui-upload-list" style="margin-left:66px"> 
                        <img class="layui-upload-img" id="up_imgs" /> 
                        <span id="up_text"></span> 
                    </div> 
                </div>
                

                <div class="layui-form-item">
                    <label for="container" class="layui-form-label">
                    </label>
                    <button  class="layui-btn layui-btn-sm" lay-filter="add" lay-submit="">立即导入</button>
                    <button  class="layui-btn layui-btn-sm layui-btn-warm" type="reset">取消</button>
                </div>

            </form>
        </div>

<script>
    $(function(){
        
        layui.use(['form','layer','upload'], function(){
            $ = layui.jquery;
            var form = layui.form
            ,layer = layui.layer
            ,upload = layui.upload;

            //自定义验证规则
            form.verify({
                article_content: function(value){
                    if(value.length < 1){
                        return '内容至少得1个字符啊';
                    }
                }
            });

            upload.render({
                elem: '#up_word'
                ,url: "<?php echo url('admin/Evaluation/uploads_file'); ?>"
                ,accept: 'file' //文件
                ,size: 10240 //限制文件大小，单位 KB
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        //$('#up_imgs').attr('src', result); //图片链接（base64）
                    });
                    layer.msg('文件上传中...',{icon:1});
                }
                ,done: function(res){
                    //如果上传失败
                    if(res.code > 0){
                        return layer.msg('上传失败！');
                    }
                    if(res.status==1){
                        
                        //上传成功
                        setTimeout(function(){
                            $("#word").val(res.message);
                            layer.msg('文件上传成功...',{icon:1});
                        },1000)
                    }else{
                        return layer.msg('上传失败！',{icon:1});
                    }
                    
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


            //监听提交
            form.on('submit(add)', function(data){
                console.log(data.field);
                //发异步，把数据提交给php
                $.ajax({
                    url: "<?php echo url('admin/Evaluation/questions_import'); ?>",
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
                                location.replace(location.href);
                            });
                        }else{
                            layer.alert(res.msg, {icon: 5},function () {
                                layer.closeAll('dialog');
                                $('body,html').animate({
                                    scrollTop: scrollTop
                                },2);
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
    })    


</script>

</body>
</html>