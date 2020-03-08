<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:47:"../app/admin/view/evaluation\questions_add.html";i:1553528444;}*/ ?>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>添加试题</title>
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
                    <cite>添加试题</cite>
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
                    <label for="score" class="layui-form-label"><span class="x-red">*</span>题目分值</label>
                    <div class="layui-input-block">
                        <input type="number" id="score" lay-verify="required" name="score" autocomplete="off" placeholder="请输入分值" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item type">
                    <label for="desc" class="layui-form-label">
                        <span class="x-red">*</span>新增题型
                    </label>
                    <div class="layui-input-block">
                        <select name="type" lay-filter="type" lay-verify="required">
                            <option value="">请选择新增题型</option>
                            <option value="0" selected>单选题</option>
                            <option value="1">多选题</option>
                            <option value="2">判断题</option>
                            <option value="3">填空题</option>
                            <option value="4">简答题</option>
                        </select>
                    </div>
                </div>

                <!-- 动态添加元素 -->
                <div class="load">
                    <div class="layui-form-item layui-form-text"> 
                        <label class="layui-form-label"><span class="x-red">*</span>试题题目</label> 
                        <div class="layui-input-block">
                            <!-- 加载编辑器的容器 -->
                            <textarea name="name" id="name" lay-verify="required"></textarea>
                        </div> 
                    </div>
                                        
                    <div class="content">
                        <div class="layui-form-item answer">
                            <label for="optionsA" class="layui-form-label">
                                <span class="x-red">*</span><span class="options-index">选项 A</span>
                            </label>
                            <div class="layui-input-block">
                                <input type="radio" name="answer" title="正确答案">
                            </div>
                            <div class="layui-input-block">
                                <textarea name="options[]" placeholder="请输入答案选项内容..." lay-verify="required" class="layui-textarea info"></textarea> 
                                
                            </div>
                        </div>

                        <div class="layui-form-item answer">
                            <label for="optionsB" class="layui-form-label">
                                <span class="x-red">*</span><span class="options-index">选项 B</span>
                            </label>
                            <div class="layui-input-block">
                                <input type="radio" name="answer" title="正确答案">
                            </div>
                            <div class="layui-input-block">
                                <textarea name="options[]" id="optionsB" placeholder="请输入答案选项内容..." lay-verify="required" class="layui-textarea info"></textarea> 
                            </div>
                        </div>

                        <div class="layui-form-item answer">
                            <label for="optionsC" class="layui-form-label">
                                <span class="x-red">*</span><span class="options-index">选项 C</span>
                            </label>
                            <div class="layui-input-block">
                                <input type="radio" name="answer" title="正确答案">
                            </div>
                            <div class="layui-input-block">
                                <textarea name="options[]" id="optionsC" placeholder="请输入答案选项内容..." lay-verify="required" class="layui-textarea info"></textarea>
                            </div>
                        </div>

                        <div class="layui-form-item options-item">
                            <label for="options" class="layui-form-label"></label>
                            <div class="layui-form-mid layui-word-aux">
                                <span class="layui-btn layui-btn-primary layui-btn-sm add_single_options" title="新增选项" style="margin-top:-5px;"><i class="layui-icon layui-icon-add-circle"></i></span>
                                <span class="layui-btn layui-btn-primary layui-btn-sm delete_options" title="删除选项" style="margin-top:-5px;"><i class="layui-icon layui-icon-delete"></i></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="container" class="layui-form-label">
                    </label>
                    <button  class="layui-btn layui-btn-sm" lay-filter="add" lay-submit="">立即添加</button>
                    <button  class="layui-btn layui-btn-sm layui-btn-warm" type="reset">取消</button>
                </div>

            </form>
        </div>

<script>
    $(function(){
        
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
            var form = layui.form
            ,layer = layui.layer;

            //自定义验证规则
            form.verify({
                article_content: function(value){
                    if(value.length < 1){
                        return '内容至少得1个字符啊';
                    }
                }
            });

            var single=`<div class="layui-form-item layui-form-text"> 
                        <label class="layui-form-label"><span class="x-red">*</span>试题题目</label> 
                        <div class="layui-input-block">
                            <!-- 加载编辑器的容器 -->
                            <textarea name="name" id="name" lay-verify="required"></textarea>
                        </div> 
                    </div>
                    
                    <div class="content">
                        <div class="layui-form-item">
                            <label for="optionsA" class="layui-form-label">
                                <span class="x-red">*</span><span class="options-index">选项 A</span>
                            </label>
                            <div class="layui-input-block">
                                <input type="radio" name="answer" title="正确答案">
                            </div>
                            <div class="layui-input-block">
                                <textarea name="options[]" id="optionsA" placeholder="请输入答案选项内容..." lay-verify="required" class="layui-textarea info"></textarea> 
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label for="optionsB" class="layui-form-label">
                                <span class="x-red">*</span><span class="options-index">选项 B</span>
                            </label>
                            <div class="layui-input-block">
                                <input type="radio" name="answer" title="正确答案">
                            </div>
                            <div class="layui-input-block">
                                <textarea name="options[]" id="optionsB" placeholder="请输入答案选项内容..." lay-verify="required" class="layui-textarea info"></textarea> 
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label for="optionsC" class="layui-form-label">
                                <span class="x-red">*</span><span class="options-index">选项 C</span>
                            </label>
                            <div class="layui-input-block">
                                <input type="radio" name="answer" title="正确答案">
                            </div>
                            <div class="layui-input-block">
                                <textarea name="options[]" id="optionsC" placeholder="请输入答案选项内容..." lay-verify="required" class="layui-textarea info"></textarea>
                            </div>
                        </div>

                        <div class="layui-form-item options-item">
                            <label for="options" class="layui-form-label"></label>
                            <div class="layui-form-mid layui-word-aux">
                                <span class="layui-btn layui-btn-primary layui-btn-sm add_single_options" title="新增选项" style="margin-top:-5px;"><i class="layui-icon layui-icon-add-circle"></i></span>
                                <span class="layui-btn layui-btn-primary layui-btn-sm delete_options" title="删除选项" style="margin-top:-5px;"><i class="layui-icon layui-icon-delete"></i></span>
                            </div>
                        </div>
                    </div>`;

            var multipart=`<div class="layui-form-item layui-form-text"> 
                        <label class="layui-form-label"><span class="x-red">*</span>试题题目</label> 
                        <div class="layui-input-block">
                            <!-- 加载编辑器的容器 -->
                            <textarea name="name" id="name" lay-verify="required"></textarea>
                        </div> 
                    </div>
                    
                    <div class="content">
                        <div class="layui-form-item">
                            <label for="optionsA" class="layui-form-label">
                                <span class="x-red">*</span><span class="options-index">选项 A</span>
                            </label>
                            <div class="layui-input-block">
                                <input type="checkbox" name="answer[]" lay-skin="primary" title="正确答案">
                            </div>
                            <div class="layui-input-block">
                                <textarea name="options[]" id="optionsA" placeholder="请输入答案选项内容..." lay-verify="required" class="layui-textarea info"></textarea> 
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label for="optionsB" class="layui-form-label">
                                <span class="x-red">*</span><span class="options-index">选项 B</span>
                            </label>
                            <div class="layui-input-block">
                                <input type="checkbox" name="answer[]" lay-skin="primary" title="正确答案">
                            </div>
                            <div class="layui-input-block">
                                <textarea name="options[]" id="optionsB" placeholder="请输入答案选项内容..." lay-verify="required" class="layui-textarea info"></textarea> 
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label for="optionsC" class="layui-form-label">
                                <span class="x-red">*</span><span class="options-index">选项 C</span>
                            </label>
                            <div class="layui-input-block">
                                <input type="checkbox" name="answer[]" lay-skin="primary" title="正确答案">
                            </div>
                            <div class="layui-input-block">
                                <textarea name="options[]" id="optionsC" placeholder="请输入答案选项内容..." lay-verify="required" class="layui-textarea info"></textarea>
                            </div>
                        </div>

                        <div class="layui-form-item options-item">
                            <label for="options" class="layui-form-label"></label>
                            <div class="layui-form-mid layui-word-aux">
                                <span class="layui-btn layui-btn-primary layui-btn-sm add_multipart_options" title="新增选项" style="margin-top:-5px;"><i class="layui-icon layui-icon-add-circle"></i></span>
                                <span class="layui-btn layui-btn-primary layui-btn-sm delete_options" title="删除选项" style="margin-top:-5px;"><i class="layui-icon layui-icon-delete"></i></span>
                            </div>
                        </div>
                    </div>`;

            var recognized=`<div class="layui-form-item layui-form-text"> 
                        <label class="layui-form-label"><span class="x-red">*</span>试题题目</label> 
                        <div class="layui-input-block">
                            <!-- 加载编辑器的容器 -->
                            <textarea name="name" id="name" lay-verify="required"></textarea>
                        </div> 
                    </div>

                    <div class="content">
                        <div class="layui-form-item">
                            <label class="layui-form-label">正确答案</label>
                            <div class="layui-input-block">
                                <input type="radio" name="answer" value="1" title="正确" checked="">
                                <input type="radio" name="answer" value="0" title="错误">
                            </div>
                          </div>
                    </div>`;

            var fill=`<div class="layui-form-item layui-form-text"> 
                        <label class="layui-form-label"><span class="x-red">*</span>试题题目</label> 
                        <div class="layui-input-block">
                            <!-- 加载编辑器的容器 -->
                            <textarea name="name" id="name" lay-verify="required"></textarea>
                        </div> 
                    </div>

                    <div class="content">
                        <div class="layui-form-item">
                            <label class="layui-form-label">正确答案</label>
                            <div class="layui-input-block">
                                <!-- 加载编辑器的容器 -->
                                <textarea name="answer" id="answer" lay-verify="required"></textarea>
                            </div> 
                          </div>
                    </div>`;

            var short=`<div class="layui-form-item layui-form-text"> 
                        <label class="layui-form-label"><span class="x-red">*</span>试题题目</label> 
                        <div class="layui-input-block">
                            <!-- 加载编辑器的容器 -->
                            <textarea name="name" id="name" lay-verify="required"></textarea>
                        </div> 
                    </div>

                    <div class="content">
                        <div class="layui-form-item">
                            <label class="layui-form-label">正确答案</label>
                            <div class="layui-input-block">
                                <!-- 加载编辑器的容器 -->
                                <textarea name="answer" id="answer" lay-verify="required"></textarea>
                            </div> 
                          </div>
                    </div>`;

            form.on('select(type)', function(data){
                // console.log(data.elem); //得到select原始DOM对象
                // console.log(data.value); //得到被选中的值
                // console.log(data.othis); //得到美化后的DOM对象

                switch(data.value){
                    case "0":// 单选题
                        // html=$('.load').html();
                        $(".load,.ueditor").empty();
                        $(".load").append(single);

                        $(".ueditor").append(add_text('single'));

                        get_ueditor();
                    break;

                    case "1":// 多选题
                        $(".load,.ueditor").empty();
                        $(".load").append(multipart);

                        $(".ueditor").append(add_text('multipart'));

                        get_ueditor();
                    break;

                    case "2":// 判断题
                        $(".load,.ueditor").empty();
                        $(".load").append(recognized);

                        $(".ueditor").append(add_text('recognized'));

                        get_ueditor();
                    break;

                    case "3":// 填空题
                        $(".load,.ueditor").empty();
                        $(".load").append(fill);

                        $(".ueditor").append(add_text('fill'));

                        get_ueditor();
                    break;

                    case "4":// 简答题
                        $(".load,.ueditor").empty();
                        $(".load").append(short);

                        $(".ueditor").append(add_text('short'));

                        get_ueditor();
                    break;

                    default:
                    break;
                }

                form.render();


            });

            function add_text(type){
                //单选多选判断题
                if(type=="single" || type=="multipart" || type=="recognized"){
                    var container_text="<script id='name' type='text/plain'>\<\/script>";

                    return container_text;
                }

                //填空题简答题
                if(type=="fill" || type=="short"){
                    var container_text="<script id='name' type='text/plain'>\<\/script><script id='answer' type='text/plain'>\<\/script>";

                    return container_text;
                }


            }

            //实例化Ueditor
            function get_ueditor(){
                var longtext = $('.ueditor').find('script');
                longtext.each(function(){
                    var id = $(this).attr('id');
                    UE.delEditor(id);
                    UE.getEditor(id,{
                        toolbars: [
                            [
                                'undo', //撤销
                                'bold', //加粗
                                'italic', //斜体
                                'underline', //下划线
                                'strikethrough', //删除线
                                'formatmatch', //格式刷
                                'selectall', //全选
                                'link', //超链接
                                'unlink', //取消链接
                                'fontfamily', //字体
                                'fontsize', //字号
                                'help', //帮助
                                'justifyleft', //居左对齐
                                'justifyright', //居右对齐
                                'justifycenter', //居中对齐
                                'justifyjustify', //两端对齐
                                'forecolor', //字体颜色
                                'backcolor', //背景色
                                'touppercase', //字母大写
                                'tolowercase', //字母小写
                            ]
                        ],
                        autoHeightEnabled: false,
                        initialFrameHeight:200,
                    });
                    
                });
            }
            get_ueditor();

            //监听提交
            form.on('submit(add)', function(data){
                form.render();
                console.log(data.field);
                //发异步，把数据提交给php
                $.ajax({
                    url: "<?php echo url('admin/Evaluation/questions_add'); ?>",
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

            //单选题选项控制

            $('.load').delegate('.delete_options','click',function(){
                $(".options-item").prev().remove();
                form.render();
            })


            $('.load').delegate('.add_single_options','click',function(){
                
                send('single');

            })

            $('.load').delegate('.add_multipart_options','click',function(){
                
                send('multipart');

            })

            $('.load').delegate('.info','blur',function(){
                
                $(this).parent('.layui-input-block').prev().find('input').val($(this).val());

            })


            function send(params)
            {
                $.ajax({
                    url: "<?php echo url('admin/behavior/get_char'); ?>",
                    type: 'POST',
                    dataType: 'json',
                    data: {num: $(".options-index").size()},
                    success: function(res) {
                        //called when successful
                        index=res;

                        if(params=="single"){
                            var str='<input type="radio" name="answer" title="正确答案">';
                        }

                        if(params=="multipart"){
                            var str='<input type="checkbox" name="answer[]" lay-skin="primary" title="正确答案">';
                        }

                        var options='<div class="layui-form-item"><label for="options'+index+'" class="layui-form-label"><span class="x-red">*</span><span class="options-index">选项 '+index+'</span></label><div class="layui-input-block">'+str+'</div><div class="layui-input-block"><textarea name="options[]" id="options'+index+'" placeholder="请输入答案选项内容..." lay-verify="required" class="layui-textarea info"></textarea></div></div>';
                        
                        if($(".content .layui-form-item").size()<=1){
                            $(".content").prepend(options);
                        }else{
                            $(".options-item").prev().after(options);
                        }

                        form.render();
                    },
                    error: function(res) {
                        //called when there is an error
                        layer.msg('网络连接失败，请稍后再试！')
                    }
                });
            }


        });
    })    


</script>

<!-- 配置文件 -->
<script type="text/javascript" src="/static/lib/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/static/lib/ueditor/ueditor.all.js"></script>
<!-- 实例化编辑器 -->
<div class="ueditor"><script id='name' type='text/plain'></script></div>
</body>
</html>