<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:44:"../app/admin/view/admin\evaluation_list.html";i:1553848858;}*/ ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>试卷列表</title>
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
            <a href="">测评管理</a>
            <a><cite>测评列表</cite></a>
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
        
        <table class="layui-table" lay-data="{height:'full-100', cellMinWidth: 80, url:'evaluation_list_info', toolbar:'#demoTable', page:true, id:'idTest',initSort: {field:'id', type:'desc'}}" lay-filter="admin">
            <thead>
                <tr>
                    <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
                    <th lay-data="{field:'title'}">名称</th>
                    <th lay-data="{field:'desc'}">描述</th>
                    <th lay-data="{field:'duration'}">时长</th>
                    <th lay-data="{field:'total_score'}">总分</th>
                    <!-- <th lay-data="{field:'pass_num'}">通过人数</th> -->
                    <th lay-data="{fixed: 'right', field:'status'}">状态</th>
                    <th lay-data="{fixed: 'right', width:210, align:'center', toolbar: '#barDemo'}">操作</th>
                </tr>
            </thead>
        </table>
    </div>

    

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-sm layui-btn-normal" onclick="join_evaluation(this)" data="{{d.id}}" data-type="{{d.type}}" title="在线考试">在线考试</a>
        <a class="layui-btn layui-btn-sm" onclick="x_admin_show('测评记录','evaluation_record?id={{d.id}}')" title="测评记录">测评记录</a>
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
        table.on('checkbox(admin)', function(obj){
            // console.log(obj)
        });

        //监听单元格编辑
        table.on('edit(admin)', function(obj){
            var value = obj.value //得到修改后的值
            ,data = obj.data //得到所在行所有键值
            ,field = obj.field; //得到字段
            layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
        });
        //监听工具条
        table.on('tool(admin)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                // layer.msg('ID：'+ data.id + ' 的查看操作');
            }
        });

        //监听行单击事件（单击事件为：rowDouble）
        table.on('row(admin)', function(obj){
            
            //标注选中样式
            obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
        });
      
        var $ = layui.$, active = {
            getCheckLength: function(){ //获取选中数目
                var checkStatus = table.checkStatus('idTest')
                ,data = checkStatus.data;
                layer.msg('选中了：'+ data.length + ' 个');
            }
            ,isAll: function(){ //验证是否全选
                var checkStatus = table.checkStatus('idTest');
                layer.msg(checkStatus.isAll ? '全选': '未全选')
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
                    url: "<?php echo url('admin/Admin/evaluation_list_info'); ?>",
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

     /*进入在线考试*/
    function join_evaluation(obj){
      var scrollTop = $(document).scrollTop();
      $('body,html').animate({
          scrollTop: 0
      }, 0);
        post={
          id:$(obj).attr('data'),
          status:$(obj).data('type')
        }
        // console.dir(post);

        if(post.status=="0"){
          layer.alert('暂未开放考试，不能进入！');
          return false;
        }
        layer.confirm('确认进入'+$(obj).attr('title')+'吗？',function(index){
            
            // console.log(post);

            //定义弹出窗口的参数
            var fulls = "left=0,screenX=0,top=0,screenY=0,scrollbars=1,fullscreen=1";
              if (window.screen) {
                 var ah = screen.availHeight - 30;
                 var aw = screen.availWidth - 10;
                 fulls += ",height=" + ah;
                 fulls += ",innerHeight=" + ah;
                 fulls += ",width=" + aw;
                 fulls += ",innerWidth=" + aw;
                 fulls += ",resizable"
             } else {
                 fulls += ",resizable"; // 对于不支持screen属性的浏览器，可以手工进行最大化。 manually
             }

             //限制同一IP重复进入考试系统
             if(window.sessionStorage.getItem("lockcms")!=true && window.localStorage.getItem("join_evaluation"+"<?php echo $login_id; ?>")==null || window.localStorage.getItem("join_evaluation"+"<?php echo $login_id; ?>")=='null' || window.localStorage.getItem("join_evaluation"+"<?php echo $login_id; ?>")=="" || window.localStorage.getItem("join_evaluation"+"<?php echo $login_id; ?>")=='false' || window.localStorage.getItem("join_evaluation"+"<?php echo $login_id; ?>")=='undefined'){
              
              window.open("<?php echo url('admin/Admin/join_evaluation'); ?>?id="+post.id, "_blank",fulls);

              layer.closeAll();

              window.localStorage.setItem("join_evaluation"+"<?php echo $login_id; ?>",true);
             }else{

              layer.alert('您已经进入考试系统，请不要重复进入！')
              return false;
             }
            

            $('body,html').animate({
              scrollTop: scrollTop
            }, 2);
            
        },function(index){
          $('body,html').animate({
            scrollTop: scrollTop
          }, 2);
        });
    }
    
    </script>
</body>
</html>