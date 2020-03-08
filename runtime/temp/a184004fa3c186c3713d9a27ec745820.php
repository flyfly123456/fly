<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:36:"../app/index/view/article\index.html";i:1552493320;s:57:"D:\phpStudy\WWW\flyfly\app\index\view\public\header1.html";i:1551528607;s:55:"D:\phpStudy\WWW\flyfly\app\index\view\public\plug1.html";i:1551069995;s:56:"D:\phpStudy\WWW\flyfly\app\index\view\public\footer.html";i:1551011644;}*/ ?>
<!DOCTYPE html>
<html>
    <head lang="en">
        <meta charset="UTF-8">
        <title>新闻页面</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <meta name="renderer" content="webkit">
        <meta http-equiv="Cache-Control" content="no-siteapp"/>

        <link href="/static/lib/amaze/assets/css/admin.css" rel="stylesheet" type="text/css">
        <link href="/static/lib/amaze/assets/css/amazeui.css" rel="stylesheet" type="text/css">
        <link href="/static/index/css/personal.css" rel="stylesheet" type="text/css">
    </head>
<body>
		<!--头 -->
		<header>
	<article>
		<div class="mt-logo">
			<!--顶部导航条 -->
			<div class="am-container header">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
							<?php if($userinfo['username']): ?>
								<a href="<?php echo url('index/person/index'); ?>" target="_top" class="h">您好，<?php echo $userinfo['username']; ?></a>
								<a href="<?php echo url('index/login/logout'); ?>" target="_top" class="h">安全退出</a>
							<?php else: ?>
								<a href="<?php echo url('index/login/index'); ?>" target="_top" class="h">亲，请登录</a>
								<a href="<?php echo url('index/login/register'); ?>" target="_top">免费注册</a>
							<?php endif; ?>
						</div>
					</div>
				</ul>
				<ul class="message-r">
					<div class="topMessage home">
						<div class="menu-hd"><a href="/" target="_top" class="h">商城首页</a></div>
					</div>
					<div class="topMessage my-shangcheng">
						<div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
					</div>
					<div class="topMessage mini-cart">
						<div class="menu-hd"><a id="mc-menu-hd" href="<?php echo url('index/shop/cart'); ?>" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"><?php echo $cart; ?></strong></a></div>
					</div>
					<div class="topMessage favorite">
						<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
				</ul>
				</div>

				<!--悬浮搜索框-->

				<div class="nav white">
					<div class="logoBig">
						<li><img src="/static/index/img/logobig.png" /></li>
					</div>

					<div class="search-bar pr">
						<a name="index_none_header_sysc" href="#"></a>
						<form>
							<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
							<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
						</form>
					</div>
				</div>

				<div class="clear"></div>
			</div>
		</div>
	</article>
</header><!-- 包含头部模版header1 -->
        <div class="nav-table">
	<div class="long-title"><span class="all-goods">全部分类</span></div>
	<div class="nav-cont">
		<ul>
			<li class="index"><a href="#">首页</a></li>
			<?php if(is_array($plug) || $plug instanceof \think\Collection || $plug instanceof \think\Paginator): if( count($plug)==0 ) : echo "" ;else: foreach($plug as $key=>$plug): ?>
				<li class="qc"><a href="<?php echo $plug['url']; ?>"><?php echo $plug['name']; ?></a></li>
			<?php endforeach; endif; else: echo "" ;endif; ?>
		</ul>
		<div class="nav-extra">
			<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
			<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
		</div>
	</div>
</div><!-- 包含插件模版plug1 -->
		<b class="line"></b>	
    <!--文章 -->
    <div class="am-g am-g-fixed blog-g-fixed bloglist">
      <div class="am-u-md-9">
        <article class="blog-main">
          <h3 class="am-article-title blog-title">
            <a href="#"><?php echo $article['title']; ?></a>
          </h3>
          <h4 class="am-article-meta blog-meta"><?php echo $article['create_time']; ?></h4>

          <div class="am-g blog-content">
            <div class="am-u-sm-12">
              <p><?php echo $article['desc']; ?></p>
              
              <?php echo $article['content']; ?>
              

            </div>
      
          </div>

        </article>


        <hr class="am-article-divider blog-hr">
        <ul class="am-pagination blog-pagination">
          <li class="am-pagination-prev"><a href="">&laquo; 上一页</a></li>
          <li class="am-pagination-next"><a href="">下一页 &raquo;</a></li>
        </ul>
      </div>

      <div class="am-u-md-3 blog-sidebar">
        <div class="am-panel-group">

          <section class="am-panel am-panel-default">
            <div class="am-panel-hd">热门话题</div>
            <ul class="am-list blog-list">
              <?php if(is_array($article_list) || $article_list instanceof \think\Collection || $article_list instanceof \think\Paginator): if( count($article_list)==0 ) : echo "" ;else: foreach($article_list as $key=>$article_list): ?>
                <li><a href="<?php echo url('index/article/index'); ?>/id/<?php echo $article_list['aid']; ?>"><p> [<?php echo $article_list['name']; ?>] <?php echo $article_list['adesc']; ?></p></a></li>  
              <?php endforeach; endif; else: echo "" ;endif; ?>   
            </ul>
          </section>

        </div>
      </div>

    </div>

    <div class="footer">
	<div class="footer-hd">
		<p>
			<a href="#">FlyFly科技</a>
			<b>|</b>
			<a href="/">商城首页</a>
			<b>|</b>
			<a href="#">支付宝</a>
			<b>|</b>
			<a href="#">物流</a>
		</p>
	</div>
	<div class="footer-bd">
		<p>
			<a href="#">关于FlyFly</a>
			<a href="#">合作伙伴</a>
			<a href="#">联系我们</a>
			<a href="#">网站地图</a>
			<em>&copy; 2018-2019 www.flyfly.com 版权所有.<a href="http://www.flyfly.com" target="_blank" title="www.flyfly.com">www.flyfly.com</a></em>
		</p>
	</div>
</div><!-- 包含底部模版footer -->

    <!--[if lt IE 9]>
    <script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
    <script src="{{assets}}js/amazeui.ie8polyfill.min.js"></script>
    <![endif]-->

    <!--[if (gte IE 9)|!(IE)]><!-->
    <script src="/static/lib/amaze/assets/js/jquery.min.js"></script>
    <!--<![endif]-->
    <script src="/static/lib/amaze/assets/js/amazeui.min.js"></script>

    </body>
</html>
