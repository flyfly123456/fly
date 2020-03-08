<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:46:"../app/admin/view/wechat\template_message.html";i:1547479415;}*/ ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>模板消息</title>
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
            <a href="">微信管理</a>
            <a><cite>模板消息</cite></a>
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
                            <option value="name">登入名</option>
                            <option value="sex">性别</option>
                            <option value="telephone">电话</option>
                            <option value="email">邮箱</option>
                            <option value="role">角色</option>
                            <option value="department_id">部门</option>
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
        
        <table class="layui-table" lay-data="{height:'full-100', cellMinWidth: 80, url:'template_message_info', toolbar:'#demoTable', page:true, id:'idTest',initSort: {field:'id', type:'desc'}}" lay-filter="template">
            <thead>
                <tr>
                    <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
                    <th lay-data="{field:'id',sort: true, fixed: true,width:110}">ID</th>
                    <th lay-data="{field:'template_id',sort: true, fixed: true,width:110}">模板ID</th>
                    <th lay-data="{field:'title', width:140}">名称</th>
                    <th lay-data="{field:'content'}">内容</th>
                    <th lay-data="{fixed: 'right', width:210, align:'center', toolbar: '#barDemo'}">操作</th>
                </tr>
            </thead>
        </table>
    </div>

    <!-- 头部导出筛选 -->
    <script type="text/html" id="demoTable">
           
        <button class="layui-btn layui-btn-danger layui-btn-sm delete_all" data-type="getCheckData"><i class="layui-icon layui-icon-delete"></i>批量删除</button>
        <button class="layui-btn layui-btn-primary layui-btn-sm" onclick="f_fans_export()"><i class="layui-icon layui-icon-export"></i>导出</button>
        <button class="layui-btn layui-btn-sm" onclick="x_admin_show('新增模板','template_add')"><i class="layui-icon layui-icon-add-circle-fine"></i>新增</button>
        <button class="layui-btn layui-btn-sm pull_template_message" data-type="pull_template_message"><i class="layui-icon layui-icon-refresh"></i>更新列表</button>
    </script>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" onclick="x_admin_show('编辑关键字','template_message_keywords?id={{d.id}}&template_id={{d.template_id}}')">编辑关键字</a>
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
        table.on('checkbox(template)', function(obj){
            // console.log(obj)
        });

        //监听单元格编辑
        table.on('edit(template)', function(obj){
            var value = obj.value //得到修改后的值
            ,data = obj.data //得到所在行所有键值
            ,field = obj.field; //得到字段
            layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
        });
        //监听工具条
        table.on('tool(template)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                // layer.msg('ID：'+ data.id + ' 的查看操作');
            } else if(obj.event === 'del'){
                //删除操作

                layer.confirm('确定删除么？', function(index){
                    console.log(data.template_id)
                    //发异步删除数据
                    $.ajax({
                        url: 'delete_template_message',
                        type: 'POST',
                        dataType: 'json',
                        data: {template_id:data.template_id},
                        success: function(res) {
                            //called when successful
                            layer.close(index);
                            if(res.status==1){
                                layer.msg(res.msg,{icon:1,time:1000});
                                obj.del();
                            }else{
                                layer.msg(res.msg);
                            }
                            
                        },
                        error: function(res) {
                            //called when there is an error
                            layer.msg('删除失败!',{icon:1,time:1000});
                        }
                    });
                
                });
            }
        });

        //监听行单击事件（单击事件为：rowDouble）
        table.on('row(template)', function(obj){
            
            //标注选中样式
            obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
        });
      
        var $ = layui.$, active = {
            getCheckData: function(){ //批量删除
                var checkStatus = table.checkStatus('idTest')
                ,data = checkStatus.data;
                // layer.alert(JSON.stringify(data));
                // data=JSON.stringify(data);
                // console.log(data)
                if(data.length==0){
                    layer.msg('请选择要删除的数据！');
                    return false;
                }else{
                    layer.confirm('确认要删除吗？',{icon: 3, title:'提示'},function(index){
                        arrobj=[];
                        var str="";
                        var jsonStr="";
                        for (var i = 0; i < data.length; i++) {
                          str="\""+data[i]['id']+"\":"+"\""+data[i]['id']+"\",";
                          jsonStr+=str;
                        };

                        substr=jsonStr.slice(0,-1);
                        
                        substr="{"+substr+"}";
                        jsonObj=eval('(' + substr + ')');
                        console.log(jsonObj)
                        // console.log(data)
                        $.ajax({
                            url: "<?php echo url('admin/Wechat/admin_delete_all'); ?>",
                            type: 'POST',
                            dataType: 'json',
                            data: jsonObj,
                            success: function(res) {
                                //called when successful
                                console.log(res)
                                if(res.status==1){
                                    layer.msg(res.msg,{icon:1,time:1000});
                                    table.reload('idTest',{});
                                }else{
                                    layer.msg(res.msg);
                                }
                                
                            },
                            error: function(res) {
                                //called when there is an error
                                layer.msg('网络异常，请稍后再试！');
                            }
                        });
                    });
                }
                
            }
            ,getCheckLength: function(){ //获取选中数目
                var checkStatus = table.checkStatus('idTest')
                ,data = checkStatus.data;
                layer.msg('选中了：'+ data.length + ' 个');
            }
            ,isAll: function(){ //验证是否全选
                var checkStatus = table.checkStatus('idTest');
                layer.msg(checkStatus.isAll ? '全选': '未全选')
            }
            //拉取模板消息列表
            ,pull_template_message:function(){
                layer.confirm('确认要更新模板消息列表？',{icon: 3, title:'提示'},function(index){
                    layer.msg('正在拉取所有模板消息列表，请稍后...',{icon:1,time:1500});
                    $.ajax({
                        url: "<?php echo url('admin/Wechat/template_message'); ?>",
                        type: 'POST',
                        dataType: 'json',
                        data: {pull:1},
                        success: function(res) {
                            //called when successful
                            // console.log(res)
                            //执行重载
                            layer.close(index);
                            if(res.status==1){
                                layer.msg(res.msg,{icon:1,time:1500});
                                // table.reload('idTest', {});//layui表格重载会使事件失效
                                location.replace(location.href)

                            }else{
                                layer.msg(res.msg,{icon:1,time:1500});
                            }

                            setTimeout(function(){
                                layer.closeAll();
                            },1500);
                        },
                        error: function(res) {
                            //called when there is an error
                            layer.msg('网络异常，请稍后再试！');
                        }
                    }); 
                });
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
                console.log(post)
                $.ajax({
                    url: "<?php echo url('admin/Wechat/fans_list_info'); ?>",
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
                                modules:modules.val()
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

        $('#sreach,.delete_all,.demoTable .layui-btn,.pull_template_message,.viw_headimg').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //监听提交
        form.on('submit(sreach)', function(data){

            return false;
        });

    });
    


    //点击查看头像
    function view_headimg(obj){
        layer.open({
            type: 3,
            content: "<img src='"+obj+"' />",
            // area: ['300px', '300px'],
            shadeClose: true
        });
    }

    //会员导出
    function f_fans_export(){
      layer.confirm('确认要导出吗？',function(){
          window.location="<?php echo url('admin/Admin/admin_export'); ?>";
          layer.msg('导出成功', {icon: 1});

      })
    }
    
    </script>
</body>
</html>