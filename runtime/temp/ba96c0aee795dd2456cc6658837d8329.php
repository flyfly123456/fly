<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:37:"../app/admin/view/cate\cate_list.html";i:1554649369;}*/ ?>
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
    <style type="text/css">
        .hide{display:none}
    </style>
</head>
  
<body class="layui-anim layui-anim-up">
    <div class="x-nav">
        <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">分类管理</a>
            <a><cite>分类列表</cite></a>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>
    <div class="x-body">
        <blockquote class="layui-elem-quote">当前分类父id='0'时，为顶级分类，有子分类的前面加收缩图标<i class="layui-icon x-show" status='true'>&#xe623;</i></blockquote>
        <xblock>
            <button class="layui-btn layui-btn-danger layui-btn-sm delete-all"><i class="layui-icon layui-icon-delete"></i>批量删除</button>
            <button class="layui-btn layui-btn-sm" onclick="x_admin_show('添加分类','cate_add')"><i class="layui-icon layui-icon-add-circle-fine"></i>添加</button>

            <button class="layui-btn layui-btn-sm up-down">展开 / 收起</button>
            <span class="x-right" style="line-height:40px">共有数据：<?php echo $count; ?> 条</span>
        </xblock>
    
    <table class="layui-table layui-form" id="test-tree-table"></table>
    
    <script type="text/javascript">
        layui.config({
            base: '/static/lib/layui/module/',
        })

        layui.use(['treetable','form'],function(){
            // var data=[{"id":1,"pid":0,"title":"1-1"},{"id":2,"pid":0,"title":"1-2"},{"id":3,"pid":0,"title":"1-3"},{"id":4,"pid":1,"title":"1-1-1"},{"id":5,"pid":1,"title":"1-1-2"},{"id":6,"pid":2,"title":"1-2-1"},{"id":7,"pid":2,"title":"1-2-3"},{"id":8,"pid":3,"title":"1-3-1"},{"id":9,"pid":3,"title":"1-3-2"},{"id":10,"pid":4,"title":"1-1-1-1"},{"id":11,"pid":4,"title":"1-1-1-2"}];
            
            var data=<?php echo $cate; ?>;

            var o = layui.$,treetable = layui.treetable;
            var form = layui.form,layer = layui.layer;
            treetable.render({
                elem: '#test-tree-table',
                data: data,
                field: 'title',
                is_checkbox: true,
                // checked:[1,2,3,4],
                // icon_val: {
                //     open: "&#xe619;",
                //     close: "&#xe61a;"
                // },
                // space: 4,
                cols: [
                    {
                        field: 'title',
                        title: '标题',
                        width: '30%',
                        template: function(item){
                            if(item.level == 1){
                                return '<span style="color:red;">'+item.title+'</span>';
                            }
                            if(item.level == 2){
                                return '<span style="color:green;">'+item.title+'</span>';
                            }
                            return item.title;
                        }
                    },
                    {
                        field: 'id',
                        title: 'ID',
                        width: '20%'
                    },
                    {
                        field: 'pid',
                        title: '父ID',
                        width: '15%',
                    },
                    {
                        field: 'status',
                        title: '状态',
                        width: '15%',
                        template: function(item){
                            if(item.status=='已启用'){

                                return '<input type="checkbox" name="status" value="'+item.id+'" lay-skin="switch" lay-filter="status" lay-text="已启用|已禁用" checked>';
                            }else{

                                return '<input type="checkbox" name="status" value="'+item.id+'" lay-skin="switch" lay-filter="status" lay-text="已启用|已禁用">';
                            }
                            
                        }
                    },
                    {
                        field: 'actions',
                        title: '操作',
                        width: '30%',
                        template: function(item){
                            var tem = [];
                            // if(item.pid == 0){
                            //  tem.push('<a class="add-child" lay-filter="add">添加子级</a>');
                            // }

                            
                            if(item.pid >= 0){
                                tem.push('<a href="javascript:;" class="add-child" lay-filter="add">添加</a>');
                                tem.push('<a href="javascript:;" lay-filter="edit">编辑</a>');
                                tem.push('<a href="javascript:;" class="del" lay-filter="del">删除</a>');
                            }
                            return tem.join(' <font>|</font> ')
                        },
                    },
                ]
            });
            
            treetable.on('treetable(add)',function(data){
                // layer.msg('添加操作');
                console.dir(data);
                x_admin_show('添加分类',"<?php echo url('admin/cate/cate_add'); ?>?pid="+data.item.pid+"&id="+data.item.id);
            })
            
            treetable.on('treetable(edit)',function(data){
                // layer.msg('编辑操作');
                // console.dir(data.item);

                x_admin_show('编辑分类',"<?php echo url('admin/cate/cate_edit'); ?>?id="+data.item.id);

            })

            treetable.on('treetable(del)',function(data){
                layer.confirm('确定要删除么？',{icon:3,title:'系统提示'},function(){
                    // console.dir(data.item)
                    $.ajax({
                      url: "<?php echo url('admin/cate/cate_delete'); ?>",
                      type: 'POST',
                      dataType: 'json',
                      data: {id: data.item.id},
                      success: function(res) {
                        //called when successful
                        if(res.status==1){
                            layer.msg(res.msg,{icon:6},function(){
                                location.replace(location.href);
                            })
                        }else{
                            layer.msg(res.msg);
                        }

                      },
                      error: function(res) {
                        //called when there is an error
                        layer.msg('网络连接失败');
                      }
                    });    
                });
                
            })
            
            o('.up-down').click(function(){
                if($(this).data('down')==true){
                    treetable.all('up');
                    $(this).data('down',false);
                }else{
                    treetable.all('down');
                    $(this).data('down',true);
                }
            })
            
            o('.delete-all').click(function(){
                console.dir(treetable.all('checked').data);
                data=treetable.all('checked').data;
                data=JSON.stringify(data);

                if(treetable.all('checked').data.length==0 && treetable.all('checked').ids.length==0){
                    layer.alert("请选择要删除的数据",{icon:2,title:'系统提示'});
                }else{
                    layer.confirm('确定要删除么？',{icon:3,title:'系统提示'},function(){
                        $.ajax({
                            url: "<?php echo url('admin/cate/delete_all'); ?>",
                            type: 'POST',
                            dataType: 'json',
                            data: {id:data},
                            success: function(res) {
                                //called when successful
                                layer.msg(res.msg,{icon:6});
                                location.replace(location.href);
                            },
                            error: function(res) {
                                //called when there is an error
                                layer.msg("网络异常，请稍后再试");
                            }
                        });
                        
                    })
                }
            })
            
            form.on('switch(status)',function(data){
                // layer.msg('监听状态操作');
                // console.dir(data.value);
                $.ajax({
                    url: "<?php echo url('admin/cate/cate_toggle'); ?>",
                    type: 'POST',
                    dataType: 'json',
                    data: {id:data.value},
                    success: function(res) {
                        //called when successful
                        layer.msg(res.msg,{icon:6});
                    },
                    error: function(res) {
                        //called when there is an error
                        layer.msg("网络异常，请稍后再试");
                    }
                });
                
            })
        })
    </script>

</div>
</body>

</html>