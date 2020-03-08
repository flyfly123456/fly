<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:46:"../app/admin/view/admin\evaluation_record.html";i:1553854208;}*/ ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>测评记录</title>
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
            <a><cite>测评记录</cite></a>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>

    <div class="x-body">
        <span class="x-right" style="line-height:40px">总记录数：<?php echo $count; ?>条</span>
        <table class="layui-table" lay-skin="line">
            <thead>
                <tr>
                    <th>题目标题</th>
                    <th>答题人</th>
                    <th>题目总数</th>
                    <th>题目总分</th>
                    <th>答题得分</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <?php if(is_array($rows) || $rows instanceof \think\Collection || $rows instanceof \think\Paginator): $i = 0; $__LIST__ = $rows;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rows): $mod = ($i % 2 );++$i;?>
                  <tr>
                    <td><?php echo $rows['title']; ?></td>
                    <td><?php echo $rows['admin_name']; ?></td>
                    <td><?php echo $rows['total_number']; ?></td>
                    <td><?php echo $rows['total_score']; ?></td>
                    <td><?php echo $rows['fact_score']; ?></td>
                    <td><?php echo $rows['pass']; ?></td>
                    <td>
                      <a class="layui-btn layui-btn-normal layui-btn-sm" title="查看详情" href="evaluation_info?id=<?php echo $rows['eID']; ?>&record_id=<?php echo $rows['rId']; ?>">查看详情
                      </a>
                    </td>
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