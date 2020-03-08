<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:36:"../app/admin/view/index\welcome.html";i:1550639923;}*/ ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-FlyFly v1.0</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="/static/admin/css/font.css">
        <link rel="stylesheet" href="/static/admin/css/xadmin.css">
        <link rel="stylesheet" type="text/css" href="/static/admin/css/crowd.css">
    </head>
<body>
    <!-- 背景粒子效果 -->
    <header style="position:fixed;left:0px;top:0px;width:100%;height:100px;">
        <div class="bg">
            <canvas id="display"></canvas>
            <div id="blachole"></div>
        </div>
    </header>
        
    <div class="x-body layui-anim layui-anim-up">
        <blockquote class="layui-elem-quote">欢迎管理员：
            <span class="x-red"><?php echo \think\Request::instance()->session('login.name'); ?></span><span>！当前时间:</span><span id="sys-time">2018-11-25 下午20:50:53</span></blockquote>

        <fieldset class="layui-elem-field">
            <legend>数据统计</legend>
            <div class="layui-field-box">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body">
                            <div class="layui-carousel x-admin-carousel x-admin-backlog" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 90px;">
                                <div carousel-item="">
                                    <ul class="layui-row layui-col-space10 layui-this">
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>文章数</h3>
                                                <p><cite><?php echo $sysinfo['count_article']; ?></cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>会员数</h3>
                                                <p><cite><?php echo $sysinfo['count_member']; ?></cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>回复数</h3>
                                                <p><cite>99</cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>商品数</h3>
                                                <p><cite>67</cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>待办事项</h3>
                                                <p><cite>67</cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>系统消息</h3>
                                                <p><cite>6766</cite></p>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>系统通知</legend>
            <div class="layui-field-box">
                <table class="layui-table" lay-skin="line">
                    <tbody>
                        <?php if(is_array($rest) || $rest instanceof \think\Collection || $rest instanceof \think\Paginator): $i = 0; $__LIST__ = $rest;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rest): $mod = ($i % 2 );++$i;?>
                            <tr>
                                <td >
                                    <a class="x-a" href="<?php echo url('admin/System/message_detial'); ?>?id=<?php echo $rest['id']; ?>" target="_blank"><?php echo $rest['title']; ?></a>
                                </td>
                            </tr>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </tbody>
                </table>
            </div>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>系统信息</legend>
            <div class="layui-field-box">
                <table class="layui-table">
                    <tbody>
                        <tr>
                            <th>当前版本</th>
                            <td><?php echo $sysinfo['version']; ?></td></tr>
                        <tr>
                            <th>服务器地址</th>
                            <td><?php echo $sysinfo['server_addr']; ?></td></tr>
                        <tr>
                            <th>操作系统</th>
                            <td><?php echo $sysinfo['system']; ?></td></tr>
                        <tr>
                            <th>运行环境</th>
                            <td><?php echo $sysinfo['server_software']; ?></td></tr>
                        <tr>
                            <th>PHP版本</th>
                            <td><?php echo $sysinfo['php_version']; ?></td></tr>
                        <tr>
                            <th>PHP运行方式</th>
                            <td><?php echo $sysinfo['php_run_type']; ?></td></tr>
                        <tr>
                            <th>MYSQL版本</th>
                            <td><?php echo $sysinfo['mysql_get_server_info']; ?></td></tr>
                        <tr>
                            <th>ThinkPHP</th>
                            <td><?php echo $sysinfo['thinkphp_version']; ?></td></tr>
                        <tr>
                            <th>上传附件限制</th>
                            <td><?php echo $sysinfo['upload_max_filesize']; ?></td></tr>
                        <tr>
                            <th>执行时间限制</th>
                            <td><?php echo $sysinfo['max_execution_time']; ?></td></tr>
                        <tr>
                            <th>最大内存</th>
                            <td><?php echo $sysinfo['memory_limit']; ?></td></tr>
                        <tr>
                            <th>剩余空间</th>
                            <td><?php echo $sysinfo['memory']; ?></td></tr>
                        <tr>
                            <th>CPU使用率</th>
                            <td><?php echo $sysinfo['cpu']; ?></td></tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>开发团队</legend>
            <div class="layui-field-box">
                <table class="layui-table">
                    <tbody>
                        <tr>
                            <th>版权所有</th>
                            <td><?php echo $sysinfo['team']; ?>
                                <a href="/" class='x-a' target="_blank">访问官网</a></td>
                        </tr>
                        <tr>
                            <th>开发者</th>
                            <td><?php echo $sysinfo['developer']; ?></td></tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
        <blockquote class="layui-elem-quote layui-quote-nm">感谢layui,百度Echarts,jquery,本系统由FlyFly提供技术支持。</blockquote>
    </div>
    </body>
    <script>
        function showTime(){
            nowtime=new Date();
            year=nowtime.getFullYear();
            month=nowtime.getMonth()+1;
            date=nowtime.getDate();
            document.getElementById("sys-time").innerText=year+"-"+month+"-"+date+" "+nowtime.toLocaleTimeString();
        }
        showTime();
        setInterval("showTime()",1000);
    </script>
    <script src="/static/admin/js/jquery.min.js"></script>
    <script type="text/javascript" src="/static/admin/js/constellation.js"></script>
</html>