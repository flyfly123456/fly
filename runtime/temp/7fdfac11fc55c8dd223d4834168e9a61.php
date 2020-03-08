<?php if (!defined('THINK_PATH')) exit(); /*a:6:{s:34:"../app/index/view/index\index.html";i:1552817529;s:56:"D:\phpStudy\WWW\flyfly\app\index\view\public\header.html";i:1551444746;s:54:"D:\phpStudy\WWW\flyfly\app\index\view\public\plug.html";i:1551069786;s:56:"D:\phpStudy\WWW\flyfly\app\index\view\public\footer.html";i:1551011644;s:56:"D:\phpStudy\WWW\flyfly\app\index\view\public\mobile.html";i:1551012620;s:55:"D:\phpStudy\WWW\flyfly\app\index\view\public\right.html";i:1553876287;}*/ ?>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>商城首页</title>

	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

	<link href="/static/lib/amaze/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="/static/lib/amaze/assets/css/admin.css" rel="stylesheet" type="text/css" />

	<link href="/static/index/basic/css/demo.css" rel="stylesheet" type="text/css" />

	<link href="/static/index/css/hmstyle.css" rel="stylesheet" type="text/css" />
	<script src="/static/lib/amaze/assets/js/jquery.min.js"></script>
	<script src="/static/lib/amaze/assets/js/amazeui.min.js"></script>

</head>

<body>
	<div class="hmtop">
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
			<div class="menu-hd MyShangcheng"><a href="<?php echo url('index/person/index'); ?>" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
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
		<div class="logo"><img src="/static/index/img/logo.png" /></div>
		<div class="logoBig">
			<li><img src="/static/index/img/logobig.png" /></li>
		</div>

		<div class="search-bar pr">
			<a name="index_none_header_sysc" href="#"></a>
			<form method="get" action="<?php echo url('index/shop/search'); ?>">
				<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="请输入关键字搜索" autofocus="on" autocomplete="off">
				<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
			</form>
		</div>
	</div>

	<div class="clear"></div>
</div><!-- 包含头部模版header -->

		<b class="line"></b>
		<div class="shopNav">
			<div class="slideall" style="height: auto;">

				<div class="long-title"><span class="all-goods">全部分类</span></div>
<div class="nav-cont">
	<ul>
		<li class="index"><a href="#">首页</a></li>
		<?php if(is_array($plug) || $plug instanceof \think\Collection || $plug instanceof \think\Paginator): if( count($plug)==0 ) : echo "" ;else: foreach($plug as $key=>$plug): ?>
			<li class="qc"><a href="<?php echo $plug['url']; ?>"><?php echo $plug['name']; ?></a></li>
		<?php endforeach; endif; else: echo "" ;endif; ?>
		<!-- <li class="qc last"><a href="#">大包装</a></li> -->
	</ul>
	<div class="nav-extra">
		<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
		<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
	</div>
</div><!-- 包含插件模版plug -->

				<div class="bannerTwo">
					<!--轮播 -->
					<div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
						<ul class="am-slides">
							<?php if(is_array($ad) || $ad instanceof \think\Collection || $ad instanceof \think\Paginator): $k = 0; $__LIST__ = $ad;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ad): $mod = ($k % 2 );++$k;?>
								<li class="banner<?php echo $k; ?>"><a href="<?php echo $ad['url']; ?>"><img src="/uploads/ad/<?php echo $ad['img']; ?>" /></a></li>
							<?php endforeach; endif; else: echo "" ;endif; ?>
						</ul>
					</div>
					<div class="clear"></div>	
				</div>

				<!--侧边导航 -->
				<div id="nav" class="navfull" style="position: static;">
					<div class="area clearfix">
						<div class="category-content" id="guide_2">

							<div class="category" style="box-shadow:none ;margin-top: 2px;">
								<ul class="category-list navTwo" id="js_climit_li">
									<?php if(is_array($cate) || $cate instanceof \think\Collection || $cate instanceof \think\Paginator): $i = 0; $__LIST__ = $cate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i;?>
										<li>
											<div class="category-info">
												<h3 class="category-name b-category-name"><i><img src="/uploads/cate/<?php echo $cate['img']; ?>"></i><a class="ml-22" title="<?php echo $cate['title']; ?>"><?php echo $cate['title']; ?></a></h3>
												<em>&gt;</em>
											</div>
											<div class="menu-item menu-in top">
												<div class="area-in">
													<div class="area-bg">
														<div class="menu-srot">
															<div class="sort-side">
																<?php if(is_array($cate['child']) || $cate['child'] instanceof \think\Collection || $cate['child'] instanceof \think\Paginator): $i = 0; $__LIST__ = $cate['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate1): $mod = ($i % 2 );++$i;?>
																	<dl class="dl-sort">
																		<dt>
																			<span title="<?php echo $cate1['title']; ?>"><?php echo $cate1['title']; ?></span>
																		</dt>
																		<!-- 三级分类 -->
																		<?php if(is_array($cate1['child']) || $cate1['child'] instanceof \think\Collection || $cate1['child'] instanceof \think\Paginator): $i = 0; $__LIST__ = $cate1['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate2): $mod = ($i % 2 );++$i;?>
																			<dd>
																				<a title="<?php echo $cate2['title']; ?>" href="<?php echo url('index/shop/sort',array('id'=>$cate2['id'])); ?>"><span><?php echo $cate2['title']; ?></span></a>
																			</dd>
																		<?php endforeach; endif; else: echo "" ;endif; ?>
																	</dl>
																<?php endforeach; endif; else: echo "" ;endif; ?>
															</div>
															<!-- 实力商家 -->
																<!-- <div class="brand-side">
																	<dl class="dl-sort"><dt><span>实力商家</span></dt>
																		<dd><a rel="nofollow" title="呵官方旗舰店" target="_blank" href="#" rel="nofollow"><span  class="red" >呵官方旗舰店</span></a></dd>
																		<dd><a rel="nofollow" title="格瑞旗舰店" target="_blank" href="#" rel="nofollow"><span >格瑞旗舰店</span></a></dd>
																		<dd><a rel="nofollow" title="飞彦大厂直供" target="_blank" href="#" rel="nofollow"><span  class="red" >飞彦大厂直供</span></a></dd>
																		<dd><a rel="nofollow" title="红e·艾菲妮" target="_blank" href="#" rel="nofollow"><span >红e·艾菲妮</span></a></dd>
																		<dd><a rel="nofollow" title="本真旗舰店" target="_blank" href="#" rel="nofollow"><span  class="red" >本真旗舰店</span></a></dd>
																		<dd><a rel="nofollow" title="杭派女装批发网" target="_blank" href="#" rel="nofollow"><span  class="red" >杭派女装批发网</span></a></dd>
																	</dl>
																</div> -->
															</div>
														</div>
													</div>
												</div>
												<b class="arrow"></b>	
											</li>
										<?php endforeach; endif; else: echo "" ;endif; ?>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!--导航 -->
					<script type="text/javascript">
					(function() {
						$('.am-slider').flexslider();
					});
					$(document).ready(function() {
						$("li").hover(function() {
							$(".category-content .category-list li.first .menu-in").css("display", "none");
							$(".category-content .category-list li.first").removeClass("hover");
							$(this).addClass("hover");
							$(this).children("div.menu-in").css("display", "block")
						}, function() {
							$(this).removeClass("hover")
							$(this).children("div.menu-in").css("display", "none")
						});
					})
					</script>


					<!--小导航 -->
					<div class="am-g am-g-fixed smallnav">
						<div class="am-u-sm-3">
							<a href="<?php echo url('index/shop/sort'); ?>"><img src="/static/index/img/navsmall.jpg" />
								<div class="title">商品分类</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="/static/index/img/huismall.jpg" />
								<div class="title">大聚惠</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="<?php echo url('index/person/index'); ?>"><img src="/static/index/img/mansmall.jpg" />
								<div class="title">个人中心</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="/static/index/img/moneysmall.jpg" />
								<div class="title">投资理财</div>
							</a>
						</div>
					</div>

					
					<div class="clear"></div>
					<!--走马灯 -->

					<div class="marqueenTwo">
						<span class="marqueen-title"><i class="am-icon-volume-up am-icon-fw"></i>商城头条<em class="am-icon-angle-double-right"></em></span>
						<div class="demo">
							<ul>
								<?php if(is_array($article) || $article instanceof \think\Collection || $article instanceof \think\Paginator): if( count($article)==0 ) : echo "" ;else: foreach($article as $key=>$article): ?>
									<li class="title-first"><a target="_blank" href="<?php echo url('index/article/index'); ?>/id/<?php echo $article['aid']; ?>">
										<span> [<?php echo $article['name']; ?>] </span><?php echo $article['adesc']; ?></a>
									</li>
								<?php endforeach; endif; else: echo "" ;endif; ?>
							</ul>
						</div>
					</div>
					<div class="clear"></div>

				</div>
				
				<!--各类活动-->
				<div class="row">
					<div class="am-container">
						<?php if(is_array($buy) || $buy instanceof \think\Collection || $buy instanceof \think\Paginator): $k = 0; $__LIST__ = $buy;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$buy): $mod = ($k % 2 );++$k;if($k == 1): ?>
								<li class="title">
							<?php else: ?>
								<li class="index">
							<?php endif; ?>
							<a href="<?php echo $buy['url']; ?>"><img src="/uploads/ad/<?php echo $buy['img']; ?>" /></a></li>
						<?php endforeach; endif; else: echo "" ;endif; ?>
					</div>
					
				</div>


				<script type="text/javascript">
				if ($(window).width() < 640) {
					function autoScroll(obj) {
						$(obj).find("ul").animate({
							marginTop: "-39px"
						}, 500, function() {
							$(this).css({
								marginTop: "0px"
							}).find("li:first").appendTo(this);
						})
					}
					$(function() {
						setInterval('autoScroll(".demo")', 3000);
					})
				}
				</script>
			</div>
			<div class="shopMainbg">
				<div class="shopMain" id="shopmain">

					<!--热门活动 -->

					<div class="am-container">

						<div class="sale-mt">
							<i></i>
							<em class="sale-title">限时秒杀</em>
							<div class="s-time" id="countdown">
								<span class="hh">01</span>
								<span class="mm">20</span>
								<span class="ss">59</span>
							</div>
						</div>


						<div class="am-g am-g-fixed sale">
							<div class="am-u-sm-3 sale-item">
								<div class="s-img">
									<a href="# "><img src="/static/index/img/sale3.jpg" /></a>
								</div>
								<div class="s-info">
									<a href="#"><p class="s-title">ZEK 原味海苔</p></a>
									<div class="s-price">￥<b>9.90</b>
										<a class="s-buy" href="#">秒杀</a>
									</div>                          	  
								</div>								
							</div>

							<div class="am-u-sm-3 sale-item">
								<div class="s-img">
									<a href="# "><img src="/static/index/img/sale2.jpg" /></a>
								</div>
								<div class="s-info">
									<a href="#"><p class="s-title">ZEK 原味海苔</p></a>
									<div class="s-price">￥<b>9.90</b>
										<a class="s-buy" href="#">秒杀</a>
									</div>                          	  
								</div>								
							</div>					

							<div class="am-u-sm-3 sale-item">
								<div class="s-img">
									<a href="# "><img src="/static/index/img/sale1.jpg" /></a>
								</div>
								<div class="s-info">
									<a href="#"><p class="s-title">ZEK 原味海苔</p></a>
									<div class="s-price">￥<b>9.90</b>
										<a class="s-buy" href="#">秒杀</a>
									</div>                          	  
								</div>								
							</div>

							<div class="am-u-sm-3 sale-item">
								<div class="s-img">
									<a href="# "><img src="/static/index/img/sale2.jpg " /></a>
								</div>
								<div class="s-info">
									<a href="#"><p class="s-title">ZEK 原味海苔</p></a>
									<div class="s-price">￥<b>9.90</b>
										<a class="s-buy" href="#">秒杀</a>
									</div>                          	  
								</div>								
							</div>

						</div>
					</div>
					<div class="clear "></div>
					<!-- 楼层商品开始 -->
					<?php if(is_array($shop) || $shop instanceof \think\Collection || $shop instanceof \think\Paginator): if( count($shop)==0 ) : echo "" ;else: foreach($shop as $f=>$shop): ?>
						<div class="f<?php echo $f; ?>">
							
							<div class="am-container ">
								<div class="shopTitle ">
									<h4><?php echo $shop['title']; ?></h4>
									<h3><?php echo $shop['desc']; ?></h3>
									<div class="today-brands ">
										<?php if(is_array($shop['cate2']) || $shop['cate2'] instanceof \think\Collection || $shop['cate2'] instanceof \think\Paginator): if( count($shop['cate2'])==0 ) : echo "" ;else: foreach($shop['cate2'] as $key=>$cate2): ?>
											<a href="<?php echo $cate2['url']; ?>"><?php echo $cate2['title']; ?></a>
										<?php endforeach; endif; else: echo "" ;endif; ?>
									</div>
									<span class="more ">
                    					<a class="more-link " href="<?php echo url('index/shop/sort',array('pid'=>$cate2['pid'])); ?>" target="_blank">更多美味</a>
                        			</span>
                        		</div>
                        	</div>

							<div class="am-g am-g-fixed floodSix ">				
								<?php if(is_array($shop['hot']) || $shop['hot'] instanceof \think\Collection || $shop['hot'] instanceof \think\Paginator): if( count($shop['hot'])==0 ) : echo "" ;else: foreach($shop['hot'] as $h=>$hot): if($h < 1): ?>
										<div class="am-u-sm-7 am-u-md-5 am-u-lg-2 text-two big">
											<div class="outer-con ">
												<div class="title ">
													<?php echo $hot['name']; ?>
												</div>
												<div class="sub-title ">
													¥<?php echo $hot['price']; ?>
												</div>

											</div>
											<a href="<?php echo url('index/shop/introduction',array('id'=>$hot['id'])); ?>" target="_blank"><img src="/uploads/shop/<?php echo $hot['cover']; ?>" /></a>						
										</div>
									<?php endif; endforeach; endif; else: echo "" ;endif; if(is_array($shop['children']) || $shop['children'] instanceof \think\Collection || $shop['children'] instanceof \think\Paginator): if( count($shop['children'])==0 ) : echo "" ;else: foreach($shop['children'] as $k=>$children): if($k < 8): ?>
										<li>
											<div class="am-u-md-2 am-u-lg-2 text-three">
												<div class="boxLi"></div>
												<div class="outer-con ">
													<div class="title ">
														<?php echo $children['name']; ?>
													</div>								
													<div class="sub-title ">
														¥<?php echo $children['price']; ?>
													</div>

												</div>
												<a href="<?php echo url('index/shop/introduction',array('id'=>$children['id'])); ?>" target="_blank"><img src="/uploads/shop/<?php echo $children['cover']; ?>" /></a>
											</div>
										</li>
									<?php endif; endforeach; endif; else: echo "" ;endif; ?>
														
							</div>

							<div class="clear "></div>
						</div>
					<?php endforeach; endif; else: echo "" ;endif; ?>
            		<!-- 楼层商品结束 -->
					<!--底部-->
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
				</div>
			</div>
		</div>
	</div>

	<!--引导 -->
	<!-- 移动端兼容导航 -->
<div class="navCir">
	<li class="active"><a href="/"><i class="am-icon-home "></i>首页</a></li>
	<li><a href="<?php echo url('index/shop/sort'); ?>"><i class="am-icon-list"></i>分类</a></li>
	<li><a href="<?php echo url('index/shop/cart'); ?>"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
	<li><a href="<?php echo url('index/person/index'); ?>"><i class="am-icon-user"></i>我的</a></li>
</div><!-- 包含移动端导航模版mobile -->
	<!--菜单 -->
	<div class=tip>
	<div id="sidebar">
		<div id="wrap">
			<div id="prof" class="item">
				<a href="#">
					<span class="setting"></span>
				</a>
				<div class="ibar_login_box status_login">
					<div class="avatar_box">
						<p class="avatar_imgbox"><img src="/static/index/img/no-img_mid_.jpg" /></p>
						<ul class="user_info">
							<li><?php if($userinfo['username']): ?>用户名：<?php echo $userinfo['username']; else: ?>你好！请<a href="<?php echo url('index/login/index'); ?>" target="_top" class="h" style="display:inline;color:#F72862;">登录</a> | <a href="<?php echo url('index/login/register'); ?>" target="_top" class="h" style="display:inline;color:#F72862;">注册</a><?php endif; ?></li>
							<li>级&nbsp;别：普通会员</li>
						</ul>
					</div>
					<div class="login_btnbox">
						<a href="#" class="login_order">我的订单</a>
						<a href="#" class="login_favorite">我的收藏</a>
					</div>
					<i class="icon_arrow_white"></i>
				</div>

			</div>
			<div id="shopCart" class="item">
				<a>
					<span class="message"></span>
				</a>
				<p>
					购物车
				</p>
				<p class="cart_num"><?php echo $cart; ?></p>
			</div>
			<div id="asset" class="item">
				<a href="#">
					<span class="view"></span>
				</a>
				<div class="mp_tooltip">
					我的资产
					<i class="icon_arrow_right_black"></i>
				</div>
			</div>

			<div id="foot" class="item">
				<a href="#">
					<span class="zuji"></span>
				</a>
				<div class="mp_tooltip">
					我的足迹
					<i class="icon_arrow_right_black"></i>
				</div>
			</div>

			<div id="brand" class="item">
				<a href="#">
					<span class="wdsc"><img src="/static/index/img/wdsc.png" /></span>
				</a>
				<div class="mp_tooltip">
					我的收藏
					<i class="icon_arrow_right_black"></i>
				</div>
			</div>

			<div id="broadcast" class="item">
				<a href="#">
					<span class="chongzhi"><img src="/static/index/img/chongzhi.png" /></span>
				</a>
				<div class="mp_tooltip">
					我要充值
					<i class="icon_arrow_right_black"></i>
				</div>
			</div>

			<div class="quick_toggle">
				<li class="qtitem">
					<a href="#"><span class="kfzx"></span></a>
					<div class="mp_tooltip">客服中心<i class="icon_arrow_right_black"></i></div>
				</li>
				<!--二维码 -->
				<li class="qtitem">
					<a href="#none"><span class="mpbtn_qrcode"></span></a>
					<div class="mp_qrcode" style="display:none;"><img src="/static/index/img/weixin_code_145.png" /><i class="icon_arrow_white"></i></div>
				</li>
				<li class="qtitem">
					<a href="#top" class="return_top"><span class="top am-gotop-title"></span></a>
				</li>
			</div>
			
			<!--回到顶部 -->
			<div id="quick_links_pop" class="quick_links_pop hide"></div>

		</div>

	</div>
	<div id="prof-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>
			我
		</div>
	</div>
	<div id="shopCart-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>
			购物车
		</div>
	</div>
	<div id="asset-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>
			资产
		</div>

		<div class="ia-head-list">
			<a href="#" target="_blank" class="pl">
				<div class="num">0</div>
				<div class="text">优惠券</div>
			</a>
			<a href="#" target="_blank" class="pl">
				<div class="num">0</div>
				<div class="text">红包</div>
			</a>
			<a href="#" target="_blank" class="pl money">
				<div class="num">￥0</div>
				<div class="text">余额</div>
			</a>
		</div>

	</div>
	<div id="foot-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>
			足迹
		</div>
	</div>
	<div id="brand-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>
			收藏
		</div>
	</div>
	<div id="broadcast-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>
			充值
		</div>
	</div>
</div>

<script>
	
	$('#shopCart').click(function(){
		window.location.href="<?php echo url('index/shop/cart'); ?>"
	})
</script><!-- 包含右侧模版right -->

	<script>
	window.jQuery || document.write('<script src="/static/index/basic/js/jquery.min.js "><\/script>');
	</script>
	<script type="text/javascript " src="/static/index/basic/js/quick_links.js "></script>
</body>

</html>