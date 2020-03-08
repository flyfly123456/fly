<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:37:"../app/admin/view/system\backups.html";i:1546224627;}*/ ?>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>数据库备份</title>
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
      .f-min{
        border:1px solid #f0f0f0;
        padding:5px;
        margin-left: 5px;
        border-radius: 5px;
      }
  </style>
  <body class="layui-anim layui-anim-up">
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>
    <div class="x-body">
        <blockquote class="layui-elem-quote">
                注意：数据备份功能根据你的选择备份全部数据或指定数据，导出的数据文件可用“数据恢复”功能,导入也可以使用phpMyAdmin等软件进行Mysql数据备份。
        </blockquote>
      <xblock>
        <button class="layui-btn" onclick="f_database_export_all()"><i class="layui-icon">&#xe656;</i>批量备份</button>
        <button class="layui-btn" onclick="f_database_export()"><i class="iconfont">&#xe714;</i>一键导出</button>
        <button class="layui-btn" onclick="x_admin_show('数据恢复','database_import')"><i class="layui-icon">&#xe681;</i>数据恢复</button>
        <span class="x-right" style="line-height:40px">共有数据：<?php echo $count_datables; ?> 条，占用空间：<?php echo $dbspace; ?></span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary">
                <i class="layui-icon">&#xe605;</i>
              </div>
            </th>
            <th>数据表</th>
            <th>记录条数</th>
            <th>编码</th>
            <th>占用空间</th>
            <th>创建时间</th>
            <th>状态</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody id="list">
              <?php if(is_array($dbtables) || $dbtables instanceof \think\Collection || $dbtables instanceof \think\Paginator): $i = 0; $__LIST__ = $dbtables;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$dbtables): $mod = ($i % 2 );++$i;?>
                <tr>
                <td>
                  <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='<?php echo $dbtables['Name']; ?>'><i class="layui-icon">&#xe605;</i></div>
                </td>
                <td><?php echo $dbtables['Name']; ?></td>
                <td><?php echo $dbtables['Rows']; ?></td>
                <td><?php echo $dbtables['Collation']; ?></td>
                <td><?php echo $dbtables['Data_length']; ?></td>
                <td><?php echo $dbtables['Create_time']; ?></td>
                <td>未备份</td>
                <td class="td-manage">
                  <a class="f-min" title="优化"  onclick="x_admin_show('优化','member_edit',700,500)" href="javascript:;">
                    <i class="layui-icon">&#xe642;</i>优化
                  </a>
                  <a class="f-min" onclick="x_admin_show('修复','member_password',600,400)" title="修复" href="javascript:;">
                    <i class="layui-icon">&#xe631;</i>修复
                  </a>
                </td>
              </tr>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </tbody>
      </table>
      <div class="page">
        <div>
        </div>
      </div>

    </div>
    <script>
      layui.use(['form','layer','laydate'], function(){
        var laydate = layui.laydate;
        $ = layui.jquery;
        var form = layui.form
        ,layer = layui.layer;
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });

        //监听提交
        form.on('submit(sreach)', function(data){
          // console.log(data.field);
          //发异步，把数据提交给php
          $.ajax({
            url: "<?php echo url('index'); ?>",
            type: 'POST',
            dataType: 'json',
            data: data.field,
            success: function(res) {
              //called when successful
              // console.log(res)
               $('body').html(res);
                // window.location.replace(window.location.href);
                
            },
            error: function(res) {
              //called when there is an error
                
            }
          });
          
          return false;
        });

        //无刷新分页
        $(function () {
            //给id为list的元素代理绑定下面所有的a元素"click"事件
                $(".page").on("click",".pagination a",function() {
                //取a标签的href即url发送ajax请求
                // alert('http://www.flyfly.com'+$(this).attr('href'))
                $.get($(this).attr('href'),function(data){
                //返回数据输出到id为list的元素中
                        // console.log(data);
                        $('body').html(data);
                    });
                    //阻止默认事件和冒泡，即禁止跳转
                    return false;
                })
            })

      });

       /*用户-停用*/
      function member_stop(obj,id){
        var scrollTop = $(document).scrollTop();
        $('body,html').animate({
            scrollTop: 0
        }, 0);
          layer.confirm('确认要'+$(obj).attr('title')+'吗？',function(index){

              if($(obj).attr('title')=='启用'){

                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').addClass('layui-btn-normal').html('已启用');
                layer.msg('已启用!',{icon: 6,time:1000});

              }else{
                $(obj).attr('title','启用')
                
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('未启用');
                layer.msg('已停用!',{icon: 5,time:1000});
              }
              post={
                status:$(obj).attr('title'),
                id:$(obj).attr('data')
              }
              $.ajax({
                url: 'member_toggle',
                type: 'POST',
                dataType: 'json',
                data: post,
                success: function(res) {
                  //called when successful
                  console.log(res);
                },
                error: function(res) {
                  //called when there is an error
                }
              });
              
              $('body,html').animate({
                scrollTop: scrollTop
              }, 2);
              
          },function(index){
            $('body,html').animate({
              scrollTop: scrollTop
            }, 2);
          });
      }

      /*用户-删除*/
      function member_del(obj,id){
        var scrollTop = $(document).scrollTop();
        $('body,html').animate({
            scrollTop: 0
        }, 0);
          layer.confirm('确认要删除吗？',{icon: 3, title:'提示'},function(index){
              //发异步删除数据

              $.ajax({
                url: 'member_delete',
                type: 'POST',
                dataType: 'json',
                data: {id:id},
                success: function(res) {
                  //called when successful
                  $('#del_'+res.id).parents("tr").remove();
                  layer.msg('已删除!',{icon:1,time:1000});
                },
                error: function(res) {
                  //called when there is an error
                  layer.msg('删除失败!',{icon:1,time:1000});
                }
              });
          },function(index){
            $('body,html').animate({
              scrollTop: scrollTop
            }, 2);
          });
      }

      function f_database_export(){
        layer.confirm('确认要导出所有数据吗？',function(){
            // $.ajax({
            //   url: "<?php echo url('admin/System/export_database'); ?>",
            //   type: 'POST',
            //   dataType: 'json',
            //   data: {param: 'value1'},
            //   success: function(res) {
            //     //called when successful
            //     window.location="<?php echo url('admin/System/export_database'); ?>";
            //     layer.msg('导出成功', {icon: 1});
            //   },
            //   error: function(res) {
            //     //called when there is an error
            //     layer.msg('导出失败', {icon: 2});
            //   }
            // });
            
          window.location="<?php echo url('admin/System/export_database'); ?>";
          layer.msg('导出成功', {icon: 1}); 

        })
      }



      function f_database_export_all (argument) {

        var scrollTop = $(document).scrollTop();
        $('body,html').animate({
            scrollTop: 0
        }, 0);
        var arrData = tableCheck.getData();

        arrobj=[];
        var str="";
        var jsonStr="";
        for (var i = 0; i < arrData.length; i++) {
          str="\""+arrData[i]+"\":"+"\""+arrData[i]+"\",";
          jsonStr+=str;
        };
        substr=jsonStr.slice(0,-1);
        substr="{"+substr+"}";
        jsonObj=eval('(' + substr + ')');
        console.log(jsonObj)

        layer.confirm('确认要导出选中数据吗？',function(index){
            //捉到所有被选中的，发异步进行删除
            if(arrData.length=="0"){
              layer.msg('请选择要导出的数据！', {icon: 2});
            }else{
              $.ajax({
                url: "<?php echo url('admin/System/export_database'); ?>",
                type: 'POST',
                dataType: 'json',
                data: jsonObj,
                success: function(res) {
                  //called when successful
                  console.log(res);
                  window.location="<?php echo url('admin/System/export_database'); ?>";
                  layer.msg('导出成功', {icon: 1});
                },
                error: function(res) {
                  //called when there is an error
                  layer.msg('导出失败', {icon: 2});
                }
              });
            }
            
            // $(".layui-form-checked").not('.header').parents('tr').remove();

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