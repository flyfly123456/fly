<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:44:"../app/admin/view/admin\evaluation_info.html";i:1553858790;}*/ ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>测评详情</title>
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
            <a href="">在线测评</a>
            <a><cite>测评详情</cite></a>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>
    
    <div class="x-body">
        <a href="<?php echo url('admin/Admin/evaluation_record'); ?>?id=<?php echo $id; ?>" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon layui-icon-return"></i>返回列表</a>
        <span class="x-right x-red" style="line-height:40px">总得分：<?php echo $total_score; ?> </span>
        <table class="layui-table" style="table-layout: fixed;">
            <thead>
                <tr>
                    <th>题目序号</th>
                    <th>题目类型</th>
                    <!-- <th>答案解析</th> -->
                    <th>测评答案</th>
                    <th>题目总分</th>
                    <th>测评得分</th>
                </tr>
            </thead>
            <tbody>
                <?php if(is_array($rows) || $rows instanceof \think\Collection || $rows instanceof \think\Paginator): $i = 0; $__LIST__ = $rows;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rows): $mod = ($i % 2 );++$i;?>
                  <tr>
                    <td><?php echo $rows['id']; ?></td>
                    <td><?php echo $rows['type']; ?></td>
                    <td onclick="show_detail(this)" style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;" title="点击查看详细内容"><?php echo $rows['result']; ?></td>
                    <td><?php echo $rows['score']; ?></td>
                    <td><?php echo $rows['real_score']; ?></td>
                  </tr>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
    </div>

    <script>
    layui.use(['form','layer','table'], function(){
        var table = layui.table
        var form = layui.form;
        form.render()
        ,$ = layui.jquery
        ,layer = layui.layer;

    });

    function show_detail(obj){
        var scrollTop = $(document).scrollTop();
        $('body,html').animate({
            scrollTop: 0
        }, 0);
        var content=obj.innerHTML;
        layer.alert(content, {icon: 6,title:'详细内容',closeBtn : 0,shade : 0.9,scrollbar : false},function (index) {
            layer.close(index);
            $('body,html').animate({
              scrollTop: scrollTop
            }, 2);
        });

    }

    //会员导出
    function f_members_export(){
      layer.confirm('确认要导出吗？',function(){
          window.location="<?php echo url('admin/Member/export'); ?>";
          layer.msg('导出成功', {icon: 1});

      })
    }
    
    </script>
</body>
</html>