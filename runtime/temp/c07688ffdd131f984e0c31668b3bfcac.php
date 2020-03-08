<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:43:"../app/admin/view/article\article_list.html";i:1552470137;}*/ ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>文章列表</title>
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
            <a href="">基础管理</a>
            <a><cite>文章列表</cite></a>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>

    <div class="x-body">
        <div class="layui-row">
            <form class="layui-form layui-col-md12 x-so">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input class="layui-input" placeholder="起始日期" name="start" id="start">
                            <input class="layui-input" placeholder="截止日期" name="end" id="end">
                    </div>
                </div>
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <select name="modules" lay-verify="" lay-search="">
                            <option value="">选择搜索条件</option>
                            <option value="title">标题</option>
                            <option value="owner">作者</option>
                            <option value="cate">分类</option>
                            <option value="desc">描述</option>
                            <option value="content">内容</option>
                            <option value="status">状态</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input type="text" name="keywords" id="demoReload"  placeholder="请输入关键字搜索" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <button class="layui-btn"  lay-submit="" id="sreach" lay-filter="sreach" data-type="reload"><i class="layui-icon">&#xe615;</i></button>
            </form>
        </div>
        
        <table class="layui-table" lay-data="{height:'full-100', cellMinWidth: 80, url:'article_list_info', toolbar:'#demoTable', page:true, id:'idTest',initSort: {field:'id', type:'desc'}}" lay-filter="article">
            <thead>
                <tr>
                    <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
                    <th lay-data="{field:'id',sort: true, fixed: true}">ID</th>
                    <th lay-data="{field:'title', width:160}">标题</th>
                    <th lay-data="{field:'desc', width:200}">描述</th>
                    <th lay-data="{field:'content', width:300}">内容</th>
                    <th lay-data="{field:'owner', width:180}">添加者</th>
                    <th lay-data="{field:'cate', width:180}">分类</th>
                    <th lay-data="{field:'create_time', width:180}">添加时间</th>
                    <th lay-data="{fixed: 'right', field:'status'}">状态</th>
                    <th lay-data="{fixed: 'right', width:210, align:'center', toolbar: '#barDemo'}">操作</th>
                </tr>
            </thead>
        </table>
    </div>

    <!-- 头部导出筛选 -->
    <script type="text/html" id="demoTable">
           
        <button class="layui-btn layui-btn-danger layui-btn-sm delete_all" data-type="batchdelete"><i class="layui-icon layui-icon-delete"></i>批量删除</button>
        <button class="layui-btn layui-btn-sm" onclick="x_admin_show('添加文章','article_add')"><i class="layui-icon">&#xe608;</i>添加</button>
    </script>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="check" onclick="x_admin_show('送审','<?php echo url('admin/Todolist/select_approve'); ?>?id={{d.id}}&name={{'article'}}')">送审</a>
        <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="back">取回</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit" onclick="x_admin_show('编辑','article_edit?id={{d.id}}')">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <script>
    layui.use(['form','layer','laydate','table'], function(){
        var table = layui.table
        var laydate = layui.laydate
        var form = layui.form;
        form.render()
        ,$ = layui.jquery
        ,layer = layui.layer;
        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
            ,type: 'datetime'
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
            ,type: 'datetime'
        });
        
        //监听表格复选框选择
        table.on('checkbox(article)', function(obj){
            // console.log(obj)
        });

        //监听单元格编辑
        table.on('edit(article)', function(obj){
            var value = obj.value //得到修改后的值
            ,data = obj.data //得到所在行所有键值
            ,field = obj.field; //得到字段
            layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
        });
        //监听工具条
        table.on('tool(article)', function(obj){
            var data = obj.data;
            if(obj.event === 'check'){
                // layer.msg('ID：'+ data.id + ' 的送审操作');
                // layer.msg(data.status);
                
            } else if(obj.event === 'del'){
                layer.confirm('确定删除么？', function(index){
                    
                    console.log(data.id)
                    //发异步删除数据
                    $.ajax({
                        url: 'article_delete',
                        type: 'POST',
                        dataType: 'json',
                        data: {id:data.id},
                        success: function(res) {
                            //called when successful
                            if(res.status==1){
                                obj.del();
                            }

                            layer.close(index);
                            layer.msg(res.msg,{icon:1,time:1500});
                        },
                        error: function(res) {
                            //called when there is an error
                            layer.msg('网络异常，请稍后再试！');
                        }
                    });
                
                });
            } else if(obj.event === 'back'){
                // layer.alert('取回操作<br>'+ data.id);
                data={id:data.id,back:data.title,type:"article"};
                // console.log(data);
                $.ajax({
                    url: "<?php echo url('admin/Todolist/approve_back'); ?>",
                    type: 'POST',
                    dataType: 'json',
                    data: data,
                    success: function(res) {
                        //called when successful
                        console.dir(res.info)
                        if(res.status==1){
                            layer.msg(res.msg,{icon:1,time:1500});
                            setTimeout(function(){
                                location.replace(location.href);
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
            }
        });

        //监听行单击事件（单击事件为：rowDouble）
        table.on('row(article)', function(obj){
            
            //标注选中样式
            obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
        });
      
        var $ = layui.$, active = {
            batchdelete: function(){ //获取选中数据
                var checkStatus = table.checkStatus('idTest')
                ,data = checkStatus.data;
                data=JSON.stringify(data);
                
                if(data.length==0){
                    layer.msg('请选择要删除的数据！');
                    return false;
                }else{
                    layer.confirm('确认要删除吗？',{icon: 3, title:'提示'},function(index){
                        
                        $.ajax({
                            url: "<?php echo url('admin/Article/delete_all'); ?>",
                            type: 'POST',
                            dataType: 'json',
                            data: {id:data},
                            success: function(res) {
                                //called when successful
                                console.log(res)
                                layer.msg(res.msg,{icon:1,time:1000});

                                table.reload('idTest',{});
                            },
                            error: function(res) {
                                //called when there is an error
                                layer.msg('网络异常，请稍后再试！');
                            }
                        });
                    });
                }
                
            }
            ,reload: function(){
                var demoReload = $('#demoReload');
                var modules=$("select[name='modules']");
                var start=$("input[name='start']");
                var end=$("input[name='end']");
                
                post={
                    keywords:demoReload.val(),
                    modules:modules.val(),
                    start:start.val(),
                    end:end.val()
                }

                if(start.val()=="" && end.val()=="" && demoReload.val()=="" && modules.val()==""){
                    layer.msg('请选择或输入关键字进行搜索',{icon:2});
                    return false;
                }

                // console.log(post)
                $.ajax({
                    url: "<?php echo url('admin/Article/article_list_info'); ?>",
                    type: 'POST',
                    dataType: 'json',
                    data: post,
                    success: function(res) {
                        //called when successful
                        console.log(res)
                        //执行重载
                        table.reload('idTest', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                            ,where: {
                                keywords: demoReload.val(),
                                modules:modules.val(),
                                start:start.val(),
                                end:end.val()
                            }
                        });
                    },
                    error: function(res) {
                        //called when there is an error
                        layer.msg('网络异常，请稍后再试！');
                    }
                });

            }
        };

        $('#sreach,.delete_all,.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //监听提交
        form.on('submit(sreach)', function(data){

            return false;
        });

    });

    </script>
</body>
</html>