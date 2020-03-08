-- ----------------------------
-- 日期：2018-12-30 19:43:50
-- MySQL - 5.5.53-MariaDB : Database - flyfly
-- ----------------------------

CREATE DATAbase IF NOT EXISTS `flyfly` DEFAULT CHARACTER SET utf8 ;

USE `flyfly`;

-- ----------------------------
-- Table structure for `f_admin`
-- ----------------------------

DROP TABLE IF EXISTS `f_admin`;

CREATE TABLE `f_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '1表示男，0表示女',
  `telephone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `role_group_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `is_super` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `last_login_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `img_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sleep_timeout` int(10) unsigned NOT NULL DEFAULT '1800',
  `multi_device` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `online` tinyint(1) unsigned NOT NULL,
  `last_login_ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `count_login` int(10) unsigned NOT NULL DEFAULT '0',
  `is_available` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_admin`
-- ----------------------------

INSERT INTO `f_admin` VALUES ('1', 'admin', 'MTIzNDU2', '1', '18840918752', '1719847255@qq.com', '1', '1542655038', '1', '1', '1546168597', '20181202\0457073da7fde88c2485ca21d8f97269.jpg', '具有至高无上的管理权力！！！', '1800', '1', '0', '127.0.0.1', '17', '1');
INSERT INTO `f_admin` VALUES ('11', 'xiaoshou', 'MTIzNDU2', '0', '18578999999', '2345678@qq.com', '12', '1543566477', '0', '1', '1546159398', '20181230\9e07deba6f455c47be0ec83f30db0c23.jpg', '销售管理员', '1800', '1', '0', '127.0.0.1', '7', '1');
INSERT INTO `f_admin` VALUES ('10', 'bianji', 'MTIzNDU2', '1', '18885175642', '2345678@qq.com', '11', '1543565944', '0', '1', '1544688857', '', '', '1800', '1', '0', '', '0', '1');
INSERT INTO `f_admin` VALUES ('12', 'weixin', 'MTIzNDU2', '', '18885175642', '1719847255@qq.com', '13', '1545238695', '0', '0', '', '', '', '1800', '1', '0', '', '0', '1');
INSERT INTO `f_admin` VALUES ('13', 'peixun', 'MTIzNDU2', '1', '18840918752', '234567898765@qq.com', '14', '1545998825', '0', '0', '', '', '', '1800', '0', '0', '', '0', '1');
INSERT INTO `f_admin` VALUES ('14', 'kefu', 'MTIzNDU2', '0', '18840918752', '2345678935@qq.com', '12', '1546002607', '0', '0', '1546004334', 'woman.png', '', '1800', '1', '0', '127.0.0.1', '4', '1');
INSERT INTO `f_admin` VALUES ('15', 'zhujiao', 'MTIzNDU2', '1', '18840918762', '234567890@qq.com', '14', '1546004445', '0', '1', '1546160893', 'woman.png', '', '1800', '1', '0', '127.0.0.1', '2', '1');
INSERT INTO `f_admin` VALUES ('16', 'weixinkefu', 'MTIzNDU2', '1', '18885175642', '2345678456@qq.com', '13', '1546004646', '0', '1', '1546004840', '20181228\ad2434d1c2d02a5d58717ac0ac786962.jpg', '微信客服人员', '1800', '1', '0', '127.0.0.1', '3', '1');
INSERT INTO `f_admin` VALUES ('17', 'xiaolaoer', 'MTIzNDU2', '0', '18208482313', '234567890@qq.com', '10', '1546161352', '0', '1', '1546168552', 'woman.png', '', '1800', '1', '0', '127.0.0.1', '2', '1');

-- ----------------------------
-- Table structure for `f_admin_role`
-- ----------------------------

DROP TABLE IF EXISTS `f_admin_role`;

CREATE TABLE `f_admin_role` (
  `admin_id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`admin_id`,`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_admin_role`
-- ----------------------------

-- ----------------------------
-- Table structure for `f_article`
-- ----------------------------

DROP TABLE IF EXISTS `f_article`;

CREATE TABLE `f_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_article`
-- ----------------------------

INSERT INTO `f_article` VALUES ('1', '2345`234567', '3453456578', '&lt;p&gt;34562334567&lt;/p&gt;', '1', '1542639007');
INSERT INTO `f_article` VALUES ('3', '345678', '4567890', '<p>23w4ertyuhijffferdftgjnbc</p>', '0', '1542639007');
INSERT INTO `f_article` VALUES ('5', '345678', '4567890', '&lt;p&gt;23w4ertyuhijffferdftgjnbc&lt;/p&gt;', '0', '1542639007');
INSERT INTO `f_article` VALUES ('7', '345678', '4567890', '&lt;p&gt;23w4ertyuhijffferdftgjnbc&lt;/p&gt;', '0', '1542639007');
INSERT INTO `f_article` VALUES ('8', '345678', '4567890', '&lt;p&gt;23w4ertyuhijffferdftgjnbc&lt;/p&gt;', '0', '1542639007');
INSERT INTO `f_article` VALUES ('9', '2134567', '23456789', '&lt;p&gt;234567890-kjhgfwefghj&lt;/p&gt;', '0', '1542639007');
INSERT INTO `f_article` VALUES ('12', '2134567', '23456789', '&lt;p&gt;234567890-09855678909856788567890345678&lt;/p&gt;', '0', '1543222923');
INSERT INTO `f_article` VALUES ('13', '2134567', '23456789', '&lt;p&gt;234567890-kjhgfwefghj2345678&lt;/p&gt;', '0', '1543223056');
INSERT INTO `f_article` VALUES ('11', '2134567', '23456789', '&lt;p&gt;234567890-kjhgfwefghj&lt;/p&gt;', '0', '1543222903');
INSERT INTO `f_article` VALUES ('14', '2134567', '23456789', '&lt;p style=&quot;text-align:center&quot;&gt;&lt;img src=&quot;/ueditor/php/upload/image/20181126/1543223078.jpg&quot; title=&quot;1543223078.jpg&quot; alt=&quot;A3.jpg&quot; width=&quot;753&quot; height=&quot;440&quot;/&gt;&lt;/p&gt;&lt;p&gt;23456789&lt;/p&gt;', '0', '1543223080');
INSERT INTO `f_article` VALUES ('15', '234567890', '234567890-054', '&lt;p&gt;23456789076534567890&lt;/p&gt;', '1', '1543224006');
INSERT INTO `f_article` VALUES ('16', '灵魂', '为什么二三线城市容不下自己的灵魂', '&lt;p&gt;一年一度的毕业高峰期，我便加入了毕业生的队伍。。。。。。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20181127/1543321785.jpg&quot; title=&quot;1543321785.jpg&quot; alt=&quot;featured_item_1.jpg&quot;/&gt;&lt;/p&gt;', '1', '1543321788');
INSERT INTO `f_article` VALUES ('18', '今日不容错过的新闻一瞬间2018.11.22', '今日不容错过的新闻一瞬间2018.11.22', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;火鸡是美国人感恩节的食物。按照传统，美国总统每年感恩节都会赦免至少一只火鸡。美国总统特朗普举行今年的赦免仪式，他把火鸡牵扯到民主党身上。究竟两者有什么关系呢？&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=820822858,1537475652&amp;fm=173&amp;app=49&amp;f=JPEG?w=640&amp;h=405&amp;s=7E7229C0C4021B5D08F1DC150300D0C2&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;嘲讽对手 特朗普白宫特赦火鸡&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;Jim WATSON/AFP&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;这两只幸运火鸡名叫碗豆和萝卜，都是由民众投票选出来的，其中以碗豆的票数比较高，成为全国感恩节火鸡。画面上，特朗普动作夸张高谈阔论，他拿中期选举有部分州重新点票来开玩笑，他说：今年的感恩节火鸡，是在白宫官网上举行的公平和公开选举中选出来的。这是一次公平的选举，但很不幸，萝卜拒绝承认落败，并要求重新点票。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=871899826,2313917820&amp;fm=173&amp;app=49&amp;f=JPEG?w=640&amp;h=427&amp;s=65503888C74302E41841758203008080&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;借“鸡”讽今 特朗普揶揄民主党&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;Brendan Smialowski /AFP&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;这就是那只幸运的火鸡，从这个角度可以看到，有多少媒体记者的镜头对准他。记者们来，并不仅仅是为了拍火鸡，当然还是来听特朗普有什么话说，特朗普不忘揶揄民主党一番。感恩节是美国人重视的节日，也是一家团聚的日子。特朗普趁机呼吁民众团结。特朗普说，我可以告诉大家，我们已经得出结论，萝卜，实在对不起，结果不会改变。这让人想起这个月初举行的中期选举，乔治亚州和佛罗里达州的民主党候选人都挑战点票结果，要在重新点票后才肯承认落败。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=178083845,1103591188&amp;fm=173&amp;app=49&amp;f=JPEG?w=640&amp;h=427&amp;s=75A490554071B3D6D402CD850300608B&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;拆除哨所 美韩首召涉朝会议&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;AFP&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;朝鲜昨天爆破方式拆除朝韩非军事区10个试点哨所。经朝韩协议，双方商定各自保留1处哨所。韩国方面选择的是1953年签订《停战协定》后最早建成的一处，朝鲜选择了金正恩曾访问过的、位于中间地带的哨所。第一次美韩涉朝事务工作组会议20号在美国召开，美国国务卿蓬佩奥上来先摆出了态度，表示两国对朝鲜无核化进程有完全的共识，无核化绝不能滞后于正在回暖的韩朝关系。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3672704545,1896980708&amp;fm=173&amp;app=49&amp;f=JPEG?w=640&amp;h=415&amp;s=AC524C8500401EFF4B50F8A10300E090&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;何为承诺？韩解散日资「慰安妇基金」&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;Jung Yeon-je /AFP&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;韩国前朴槿惠政府在2015年12月和日本政府达成协议，签署《韩日慰安妇问题协议》书。两国承认慰安妇问题已得到完全且不可逆的解决。日本首相安倍晋三就当年日军暴行致歉，拨款10亿日圆大约7000万港元成立基金会，协助赔偿工作。文在寅上台后，政府下令重新调查当年慰安妇协议，最终认定朴槿惠政府谈判对受害人诉求没有考虑周全。他敦促日本不应主张慰安妇问题已得到解决。虽然韩国没有真正撕毁条约，但日本已经把韩国的表态视为反悔，多次表达不满。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '1543564178');
INSERT INTO `f_article` VALUES ('19', '新闻资讯：今天，锦报君走进了社区', '报社在职党员走进社区助力“三城联创”', '&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;冬日天寒，激情暖心。为学习贯彻落实习近平总书记在辽宁考察时和深入推进东北振兴座谈会上重要讲话精神，以实际行动助力我市“三城联创”，12月7日，锦州日报社多个党支部的在职党员满怀豪情走进松山新区凌南街道西里社区，与社区党总支联合开展了共驻共建主题系列活动。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1043575701,3741267247&amp;fm=173&amp;app=49&amp;f=JPEG?w=640&amp;h=480&amp;s=978061A45A533FC6561C088E0300E082&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2568876067,475185523&amp;fm=173&amp;app=49&amp;f=JPEG?w=640&amp;h=480&amp;s=D61A10C7DA7A38843CF095220300F011&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;活动中，报社的党员们首先参观了西里社区办公室、活动室各项建设，对其贴近百姓、为民办实事的作风和效率大加赞赏。这里不仅有敞开的办公区，办理内容、办事流程等醒目公示上墙，而且有学习室、谈心室、爱心超市等独立空间，让前来办理各项事务的社区居民体会方便快捷的同时深感贴心与温暖。在社区活动室，党员们如饥似渴地浏览了摆满书架的各类书籍和学习资料，之后围坐在一起共同学习了近日中共中央印发的《中国共产党支部工作条例（试行）》，并就条例中提出的各项要求进行了认真的研讨领会。经过与社区工作人员商量，针对他们当前急需协助的工作，党员们还选定了一处就近的小区展开了清理楼道小招贴、小广告行动。大家拿起喷壶、小铲子等工具，深入到居民楼各个单元，逐层清理着惹人烦恼的“牛皮癣”，还给居民干净整洁的居住环境，也为我市创建文明城、卫生城鼓劲加油。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=4239838286,3191861601&amp;fm=173&amp;app=49&amp;f=JPEG?w=640&amp;h=480&amp;s=20D019CAD8210C9CF8E00CB30300C082&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;large&quot; src=&quot;https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3625863548,2970614793&amp;fm=173&amp;app=49&amp;f=JPEG?w=640&amp;h=480&amp;s=E6B4C56F97371F94596CA883010090C3&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;通过此次主题党日活动，日报社各个党支部尤其是日报一、二支部与西里社区党总支建立起长期联系，作为共建单位将不定期开展各项活动，发挥各自优势与特长，共同为社区发展、城市建设以及党员综合素质提升等做出应有贡献。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '1543564673');

-- ----------------------------
-- Table structure for `f_evaluation`
-- ----------------------------

DROP TABLE IF EXISTS `f_evaluation`;

CREATE TABLE `f_evaluation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '添加时间',
  `duration` int(10) unsigned NOT NULL DEFAULT '90' COMMENT '考试时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `total_score` int(10) unsigned NOT NULL DEFAULT '100',
  `pass_id` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_evaluation`
-- ----------------------------

INSERT INTO `f_evaluation` VALUES ('1', 'PHP面试题', 'PHP面试题宝典', '1545466793', '90', '1', '100', '1@11@');

-- ----------------------------
-- Table structure for `f_evaluation_answer`
-- ----------------------------

DROP TABLE IF EXISTS `f_evaluation_answer`;

CREATE TABLE `f_evaluation_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `evaluation_id` int(10) unsigned NOT NULL,
  `evaluation_info_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `answer` text COLLATE utf8_unicode_ci,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `result` text COLLATE utf8_unicode_ci NOT NULL,
  `score` int(10) unsigned NOT NULL,
  `record_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=647 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_evaluation_answer`
-- ----------------------------

INSERT INTO `f_evaluation_answer` VALUES ('1', '1', '1', '1', 'D', 'single', 'D', '5', '1');
INSERT INTO `f_evaluation_answer` VALUES ('2', '1', '2', '1', 'C', 'single', 'B', '0', '1');
INSERT INTO `f_evaluation_answer` VALUES ('3', '1', '3', '1', 'B', 'single', 'B', '5', '1');
INSERT INTO `f_evaluation_answer` VALUES ('4', '1', '4', '1', 'A', 'single', 'A', '5', '1');
INSERT INTO `f_evaluation_answer` VALUES ('5', '1', '5', '1', 'D', 'single', 'D', '5', '1');
INSERT INTO `f_evaluation_answer` VALUES ('6', '1', '6', '1', 'C', 'single', 'C', '5', '1');
INSERT INTO `f_evaluation_answer` VALUES ('7', '1', '7', '1', 'D', 'single', 'C', '0', '1');
INSERT INTO `f_evaluation_answer` VALUES ('8', '1', '8', '1', 'B_@D', 'multi', 'B_@D', '5', '1');
INSERT INTO `f_evaluation_answer` VALUES ('9', '1', '9', '1', 'C_@D', 'multi', 'C_@D', '5', '1');
INSERT INTO `f_evaluation_answer` VALUES ('10', '1', '10', '1', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '1');
INSERT INTO `f_evaluation_answer` VALUES ('11', '1', '11', '1', '0', 'recognized', '0', '0', '1');
INSERT INTO `f_evaluation_answer` VALUES ('12', '1', '12', '1', '0', 'recognized', '0', '5', '1');
INSERT INTO `f_evaluation_answer` VALUES ('13', '1', '13', '1', '0', 'recognized', '0', '5', '1');
INSERT INTO `f_evaluation_answer` VALUES ('14', '1', '14', '1', '1', 'recognized', '1', '0', '1');
INSERT INTO `f_evaluation_answer` VALUES ('15', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', '10', '1');
INSERT INTO `f_evaluation_answer` VALUES ('16', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', '10', '1');
INSERT INTO `f_evaluation_answer` VALUES ('17', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '1');
INSERT INTO `f_evaluation_answer` VALUES ('18', '1', '1', '1', 'D', 'single', 'D', '5', '2');
INSERT INTO `f_evaluation_answer` VALUES ('19', '1', '2', '1', 'C', 'single', 'B', '0', '2');
INSERT INTO `f_evaluation_answer` VALUES ('20', '1', '3', '1', 'B', 'single', 'B', '5', '2');
INSERT INTO `f_evaluation_answer` VALUES ('21', '1', '4', '1', 'A', 'single', 'A', '5', '2');
INSERT INTO `f_evaluation_answer` VALUES ('22', '1', '5', '1', 'D', 'single', 'D', '5', '2');
INSERT INTO `f_evaluation_answer` VALUES ('23', '1', '6', '1', 'C', 'single', 'C', '5', '2');
INSERT INTO `f_evaluation_answer` VALUES ('24', '1', '7', '1', 'D', 'single', 'C', '0', '2');
INSERT INTO `f_evaluation_answer` VALUES ('25', '1', '8', '1', 'B_@D', 'multi', 'B_@D', '5', '2');
INSERT INTO `f_evaluation_answer` VALUES ('26', '1', '9', '1', 'C_@D', 'multi', 'C_@D', '5', '2');
INSERT INTO `f_evaluation_answer` VALUES ('27', '1', '10', '1', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '2');
INSERT INTO `f_evaluation_answer` VALUES ('28', '1', '11', '1', '0', 'recognized', '0', '0', '2');
INSERT INTO `f_evaluation_answer` VALUES ('29', '1', '12', '1', '0', 'recognized', '0', '5', '2');
INSERT INTO `f_evaluation_answer` VALUES ('30', '1', '13', '1', '0', 'recognized', '0', '5', '2');
INSERT INTO `f_evaluation_answer` VALUES ('31', '1', '14', '1', '1', 'recognized', '1', '0', '2');
INSERT INTO `f_evaluation_answer` VALUES ('32', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', '10', '2');
INSERT INTO `f_evaluation_answer` VALUES ('33', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', '10', '2');
INSERT INTO `f_evaluation_answer` VALUES ('34', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '2');
INSERT INTO `f_evaluation_answer` VALUES ('35', '1', '1', '1', 'D', 'single', 'D', '5', '3');
INSERT INTO `f_evaluation_answer` VALUES ('36', '1', '2', '1', 'C', 'single', 'B', '0', '3');
INSERT INTO `f_evaluation_answer` VALUES ('37', '1', '3', '1', 'B', 'single', 'B', '5', '3');
INSERT INTO `f_evaluation_answer` VALUES ('38', '1', '4', '1', 'A', 'single', 'A', '5', '3');
INSERT INTO `f_evaluation_answer` VALUES ('39', '1', '5', '1', 'D', 'single', 'D', '5', '3');
INSERT INTO `f_evaluation_answer` VALUES ('40', '1', '6', '1', 'C', 'single', 'C', '5', '3');
INSERT INTO `f_evaluation_answer` VALUES ('41', '1', '7', '1', 'D', 'single', 'C', '0', '3');
INSERT INTO `f_evaluation_answer` VALUES ('42', '1', '8', '1', 'B_@D', 'multi', 'B_@D', '5', '3');
INSERT INTO `f_evaluation_answer` VALUES ('43', '1', '9', '1', 'C_@D', 'multi', 'C_@D', '5', '3');
INSERT INTO `f_evaluation_answer` VALUES ('44', '1', '10', '1', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '3');
INSERT INTO `f_evaluation_answer` VALUES ('45', '1', '11', '1', '0', 'recognized', '0', '0', '3');
INSERT INTO `f_evaluation_answer` VALUES ('46', '1', '12', '1', '0', 'recognized', '0', '5', '3');
INSERT INTO `f_evaluation_answer` VALUES ('47', '1', '13', '1', '0', 'recognized', '0', '5', '3');
INSERT INTO `f_evaluation_answer` VALUES ('48', '1', '14', '1', '1', 'recognized', '1', '0', '3');
INSERT INTO `f_evaluation_answer` VALUES ('49', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', '10', '3');
INSERT INTO `f_evaluation_answer` VALUES ('50', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', '10', '3');
INSERT INTO `f_evaluation_answer` VALUES ('51', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '3');
INSERT INTO `f_evaluation_answer` VALUES ('52', '1', '1', '1', 'D', 'single', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('53', '1', '2', '1', 'C', 'single', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('54', '1', '3', '1', 'B', 'single', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('55', '1', '4', '1', 'A', 'single', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('56', '1', '5', '1', 'D', 'single', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('57', '1', '6', '1', 'C', 'single', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('58', '1', '7', '1', 'D', 'single', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('59', '1', '8', '1', 'B_@D', 'multi', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('60', '1', '9', '1', 'C_@D', 'multi', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('61', '1', '10', '1', 'A_@C_@D', 'multi', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('62', '1', '11', '1', '0', 'recognized', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('63', '1', '12', '1', '0', 'recognized', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('64', '1', '13', '1', '0', 'recognized', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('65', '1', '14', '1', '1', 'recognized', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('66', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('67', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('68', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '4');
INSERT INTO `f_evaluation_answer` VALUES ('69', '1', '1', '11', 'D', 'single', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('70', '1', '2', '11', 'C', 'single', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('71', '1', '3', '11', 'B', 'single', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('72', '1', '4', '11', 'A', 'single', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('73', '1', '5', '11', 'D', 'single', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('74', '1', '6', '11', 'C', 'single', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('75', '1', '7', '11', 'D', 'single', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('76', '1', '8', '11', 'B_@D', 'multi', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('77', '1', '9', '11', 'C_@D', 'multi', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('78', '1', '10', '11', 'A_@C_@D', 'multi', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('79', '1', '11', '11', '0', 'recognized', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('80', '1', '12', '11', '0', 'recognized', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('81', '1', '13', '11', '0', 'recognized', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('82', '1', '14', '11', '1', 'recognized', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('83', '1', '15', '11', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('84', '1', '16', '11', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('85', '1', '17', '11', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '5');
INSERT INTO `f_evaluation_answer` VALUES ('86', '1', '1', '11', 'D', 'single', 'D', '5', '6');
INSERT INTO `f_evaluation_answer` VALUES ('87', '1', '2', '11', 'C', 'single', 'C', '5', '6');
INSERT INTO `f_evaluation_answer` VALUES ('88', '1', '3', '11', 'B', 'single', 'B', '5', '6');
INSERT INTO `f_evaluation_answer` VALUES ('89', '1', '4', '11', 'A', 'single', 'A', '5', '6');
INSERT INTO `f_evaluation_answer` VALUES ('90', '1', '5', '11', 'D', 'single', 'D', '5', '6');
INSERT INTO `f_evaluation_answer` VALUES ('91', '1', '6', '11', 'C', 'single', 'C', '5', '6');
INSERT INTO `f_evaluation_answer` VALUES ('92', '1', '7', '11', 'D', 'single', 'D', '5', '6');
INSERT INTO `f_evaluation_answer` VALUES ('93', '1', '8', '11', 'B_@D', 'multi', 'B_@D', '5', '6');
INSERT INTO `f_evaluation_answer` VALUES ('94', '1', '9', '11', 'C_@D', 'multi', 'C_@D', '5', '6');
INSERT INTO `f_evaluation_answer` VALUES ('95', '1', '10', '11', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '6');
INSERT INTO `f_evaluation_answer` VALUES ('96', '1', '11', '11', '0', 'recognized', '0', '0', '6');
INSERT INTO `f_evaluation_answer` VALUES ('97', '1', '12', '11', '0', 'recognized', '0', '5', '6');
INSERT INTO `f_evaluation_answer` VALUES ('98', '1', '13', '11', '0', 'recognized', '0', '5', '6');
INSERT INTO `f_evaluation_answer` VALUES ('99', '1', '14', '11', '1', 'recognized', '1', '0', '6');
INSERT INTO `f_evaluation_answer` VALUES ('100', '1', '15', '11', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '6');
INSERT INTO `f_evaluation_answer` VALUES ('101', '1', '16', '11', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '6');
INSERT INTO `f_evaluation_answer` VALUES ('102', '1', '17', '11', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '6');
INSERT INTO `f_evaluation_answer` VALUES ('103', '1', '1', '11', 'D', 'single', 'D', '5', '7');
INSERT INTO `f_evaluation_answer` VALUES ('104', '1', '2', '11', 'C', 'single', 'C', '5', '7');
INSERT INTO `f_evaluation_answer` VALUES ('105', '1', '3', '11', 'B', 'single', 'B', '5', '7');
INSERT INTO `f_evaluation_answer` VALUES ('106', '1', '4', '11', 'A', 'single', 'A', '5', '7');
INSERT INTO `f_evaluation_answer` VALUES ('107', '1', '5', '11', 'D', 'single', 'D', '5', '7');
INSERT INTO `f_evaluation_answer` VALUES ('108', '1', '6', '11', 'C', 'single', 'C', '5', '7');
INSERT INTO `f_evaluation_answer` VALUES ('109', '1', '7', '11', 'D', 'single', 'D', '5', '7');
INSERT INTO `f_evaluation_answer` VALUES ('110', '1', '8', '11', 'B_@D', 'multi', 'B_@D', '5', '7');
INSERT INTO `f_evaluation_answer` VALUES ('111', '1', '9', '11', 'C_@D', 'multi', 'C_@D', '5', '7');
INSERT INTO `f_evaluation_answer` VALUES ('112', '1', '10', '11', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '7');
INSERT INTO `f_evaluation_answer` VALUES ('113', '1', '11', '11', '0', 'recognized', '0', '0', '7');
INSERT INTO `f_evaluation_answer` VALUES ('114', '1', '12', '11', '0', 'recognized', '0', '5', '7');
INSERT INTO `f_evaluation_answer` VALUES ('115', '1', '13', '11', '0', 'recognized', '0', '5', '7');
INSERT INTO `f_evaluation_answer` VALUES ('116', '1', '14', '11', '1', 'recognized', '0', '0', '7');
INSERT INTO `f_evaluation_answer` VALUES ('117', '1', '15', '11', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '7');
INSERT INTO `f_evaluation_answer` VALUES ('118', '1', '16', '11', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '7');
INSERT INTO `f_evaluation_answer` VALUES ('119', '1', '17', '11', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '7');
INSERT INTO `f_evaluation_answer` VALUES ('120', '1', '1', '11', 'D', 'single', 'D', '5', '8');
INSERT INTO `f_evaluation_answer` VALUES ('121', '1', '2', '11', 'C', 'single', 'C', '5', '8');
INSERT INTO `f_evaluation_answer` VALUES ('122', '1', '3', '11', 'B', 'single', 'B', '5', '8');
INSERT INTO `f_evaluation_answer` VALUES ('123', '1', '4', '11', 'A', 'single', 'A', '5', '8');
INSERT INTO `f_evaluation_answer` VALUES ('124', '1', '5', '11', 'D', 'single', 'D', '5', '8');
INSERT INTO `f_evaluation_answer` VALUES ('125', '1', '6', '11', 'C', 'single', 'C', '5', '8');
INSERT INTO `f_evaluation_answer` VALUES ('126', '1', '7', '11', 'D', 'single', 'D', '5', '8');
INSERT INTO `f_evaluation_answer` VALUES ('127', '1', '8', '11', 'B_@D', 'multi', 'B_@D', '5', '8');
INSERT INTO `f_evaluation_answer` VALUES ('128', '1', '9', '11', 'C_@D', 'multi', 'C_@D', '5', '8');
INSERT INTO `f_evaluation_answer` VALUES ('129', '1', '10', '11', 'A_@C_@D', 'multi', 'A_@B_@C_@D', '0', '8');
INSERT INTO `f_evaluation_answer` VALUES ('130', '1', '11', '11', '0', 'recognized', '0', '0', '8');
INSERT INTO `f_evaluation_answer` VALUES ('131', '1', '12', '11', '0', 'recognized', '0', '5', '8');
INSERT INTO `f_evaluation_answer` VALUES ('132', '1', '13', '11', '0', 'recognized', '0', '5', '8');
INSERT INTO `f_evaluation_answer` VALUES ('133', '1', '14', '11', '1', 'recognized', '0', '0', '8');
INSERT INTO `f_evaluation_answer` VALUES ('134', '1', '15', '11', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '8');
INSERT INTO `f_evaluation_answer` VALUES ('135', '1', '16', '11', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '8');
INSERT INTO `f_evaluation_answer` VALUES ('136', '1', '17', '11', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '8');
INSERT INTO `f_evaluation_answer` VALUES ('137', '1', '1', '11', 'D', 'single', 'D', '5', '9');
INSERT INTO `f_evaluation_answer` VALUES ('138', '1', '2', '11', 'C', 'single', 'C', '5', '9');
INSERT INTO `f_evaluation_answer` VALUES ('139', '1', '3', '11', 'B', 'single', 'B', '5', '9');
INSERT INTO `f_evaluation_answer` VALUES ('140', '1', '4', '11', 'A', 'single', 'A', '5', '9');
INSERT INTO `f_evaluation_answer` VALUES ('141', '1', '5', '11', 'D', 'single', 'D', '5', '9');
INSERT INTO `f_evaluation_answer` VALUES ('142', '1', '6', '11', 'C', 'single', 'C', '5', '9');
INSERT INTO `f_evaluation_answer` VALUES ('143', '1', '7', '11', 'D', 'single', 'D', '5', '9');
INSERT INTO `f_evaluation_answer` VALUES ('144', '1', '8', '11', 'B_@D', 'multi', 'B_@D', '5', '9');
INSERT INTO `f_evaluation_answer` VALUES ('145', '1', '9', '11', 'C_@D', 'multi', 'C_@D', '5', '9');
INSERT INTO `f_evaluation_answer` VALUES ('146', '1', '10', '11', 'A_@C_@D', 'multi', 'A_@B_@C_@D', '0', '9');
INSERT INTO `f_evaluation_answer` VALUES ('147', '1', '11', '11', '0', 'recognized', '0', '0', '9');
INSERT INTO `f_evaluation_answer` VALUES ('148', '1', '12', '11', '0', 'recognized', '0', '5', '9');
INSERT INTO `f_evaluation_answer` VALUES ('149', '1', '13', '11', '0', 'recognized', '0', '5', '9');
INSERT INTO `f_evaluation_answer` VALUES ('150', '1', '14', '11', '1', 'recognized', '1', '0', '9');
INSERT INTO `f_evaluation_answer` VALUES ('151', '1', '15', '11', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '9');
INSERT INTO `f_evaluation_answer` VALUES ('152', '1', '16', '11', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '9');
INSERT INTO `f_evaluation_answer` VALUES ('153', '1', '17', '11', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '9');
INSERT INTO `f_evaluation_answer` VALUES ('154', '1', '1', '11', 'D', 'single', 'D', '5', '10');
INSERT INTO `f_evaluation_answer` VALUES ('155', '1', '2', '11', 'C', 'single', 'C', '5', '10');
INSERT INTO `f_evaluation_answer` VALUES ('156', '1', '3', '11', 'B', 'single', 'B', '5', '10');
INSERT INTO `f_evaluation_answer` VALUES ('157', '1', '4', '11', 'A', 'single', 'A', '5', '10');
INSERT INTO `f_evaluation_answer` VALUES ('158', '1', '5', '11', 'D', 'single', 'D', '5', '10');
INSERT INTO `f_evaluation_answer` VALUES ('159', '1', '6', '11', 'C', 'single', 'C', '5', '10');
INSERT INTO `f_evaluation_answer` VALUES ('160', '1', '7', '11', 'D', 'single', 'D', '5', '10');
INSERT INTO `f_evaluation_answer` VALUES ('161', '1', '8', '11', 'B_@D', 'multi', 'B_@D', '5', '10');
INSERT INTO `f_evaluation_answer` VALUES ('162', '1', '9', '11', 'C_@D', 'multi', 'C_@D', '5', '10');
INSERT INTO `f_evaluation_answer` VALUES ('163', '1', '10', '11', 'A_@C_@D', 'multi', 'A_@B_@C_@D', '0', '10');
INSERT INTO `f_evaluation_answer` VALUES ('164', '1', '11', '11', '0', 'recognized', '0', '0', '10');
INSERT INTO `f_evaluation_answer` VALUES ('165', '1', '12', '11', '0', 'recognized', '0', '5', '10');
INSERT INTO `f_evaluation_answer` VALUES ('166', '1', '13', '11', '0', 'recognized', '0', '5', '10');
INSERT INTO `f_evaluation_answer` VALUES ('167', '1', '14', '11', '1', 'recognized', '0', '0', '10');
INSERT INTO `f_evaluation_answer` VALUES ('168', '1', '15', '11', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '10');
INSERT INTO `f_evaluation_answer` VALUES ('169', '1', '16', '11', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '10');
INSERT INTO `f_evaluation_answer` VALUES ('170', '1', '17', '11', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '10');
INSERT INTO `f_evaluation_answer` VALUES ('171', '1', '1', '11', 'D', 'single', 'D', '5', '11');
INSERT INTO `f_evaluation_answer` VALUES ('172', '1', '2', '11', 'C', 'single', 'C', '5', '11');
INSERT INTO `f_evaluation_answer` VALUES ('173', '1', '3', '11', 'B', 'single', 'B', '5', '11');
INSERT INTO `f_evaluation_answer` VALUES ('174', '1', '4', '11', 'A', 'single', 'A', '5', '11');
INSERT INTO `f_evaluation_answer` VALUES ('175', '1', '5', '11', 'D', 'single', 'D', '5', '11');
INSERT INTO `f_evaluation_answer` VALUES ('176', '1', '6', '11', 'C', 'single', 'C', '5', '11');
INSERT INTO `f_evaluation_answer` VALUES ('177', '1', '7', '11', 'D', 'single', 'D', '5', '11');
INSERT INTO `f_evaluation_answer` VALUES ('178', '1', '8', '11', 'B_@D', 'multi', 'B_@D', '5', '11');
INSERT INTO `f_evaluation_answer` VALUES ('179', '1', '9', '11', 'C_@D', 'multi', 'C_@D', '5', '11');
INSERT INTO `f_evaluation_answer` VALUES ('180', '1', '10', '11', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '11');
INSERT INTO `f_evaluation_answer` VALUES ('181', '1', '11', '11', '0', 'recognized', '0', '0', '11');
INSERT INTO `f_evaluation_answer` VALUES ('182', '1', '12', '11', '0', 'recognized', '0', '5', '11');
INSERT INTO `f_evaluation_answer` VALUES ('183', '1', '13', '11', '0', 'recognized', '0', '5', '11');
INSERT INTO `f_evaluation_answer` VALUES ('184', '1', '14', '11', '1', 'recognized', '0', '0', '11');
INSERT INTO `f_evaluation_answer` VALUES ('185', '1', '15', '11', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '11');
INSERT INTO `f_evaluation_answer` VALUES ('186', '1', '16', '11', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '11');
INSERT INTO `f_evaluation_answer` VALUES ('187', '1', '17', '11', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '11');
INSERT INTO `f_evaluation_answer` VALUES ('188', '1', '1', '11', 'D', 'single', 'D', '5', '12');
INSERT INTO `f_evaluation_answer` VALUES ('189', '1', '2', '11', 'C', 'single', 'C', '5', '12');
INSERT INTO `f_evaluation_answer` VALUES ('190', '1', '3', '11', 'B', 'single', 'B', '5', '12');
INSERT INTO `f_evaluation_answer` VALUES ('191', '1', '4', '11', 'A', 'single', 'A', '5', '12');
INSERT INTO `f_evaluation_answer` VALUES ('192', '1', '5', '11', 'D', 'single', 'D', '5', '12');
INSERT INTO `f_evaluation_answer` VALUES ('193', '1', '6', '11', 'C', 'single', 'C', '5', '12');
INSERT INTO `f_evaluation_answer` VALUES ('194', '1', '7', '11', 'D', 'single', 'D', '5', '12');
INSERT INTO `f_evaluation_answer` VALUES ('195', '1', '8', '11', 'B_@D', 'multi', 'B_@D', '5', '12');
INSERT INTO `f_evaluation_answer` VALUES ('196', '1', '9', '11', 'C_@D', 'multi', 'C_@D', '5', '12');
INSERT INTO `f_evaluation_answer` VALUES ('197', '1', '10', '11', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '12');
INSERT INTO `f_evaluation_answer` VALUES ('198', '1', '11', '11', '0', 'recognized', '0', '0', '12');
INSERT INTO `f_evaluation_answer` VALUES ('199', '1', '12', '11', '0', 'recognized', '0', '5', '12');
INSERT INTO `f_evaluation_answer` VALUES ('200', '1', '13', '11', '0', 'recognized', '0', '5', '12');
INSERT INTO `f_evaluation_answer` VALUES ('201', '1', '14', '11', '1', 'recognized', '1', '0', '12');
INSERT INTO `f_evaluation_answer` VALUES ('202', '1', '15', '11', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '12');
INSERT INTO `f_evaluation_answer` VALUES ('203', '1', '16', '11', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '12');
INSERT INTO `f_evaluation_answer` VALUES ('204', '1', '17', '11', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '12');
INSERT INTO `f_evaluation_answer` VALUES ('205', '1', '1', '11', 'D', 'single', 'D', '5', '13');
INSERT INTO `f_evaluation_answer` VALUES ('206', '1', '2', '11', 'C', 'single', 'C', '5', '13');
INSERT INTO `f_evaluation_answer` VALUES ('207', '1', '3', '11', 'B', 'single', 'B', '5', '13');
INSERT INTO `f_evaluation_answer` VALUES ('208', '1', '4', '11', 'A', 'single', 'A', '5', '13');
INSERT INTO `f_evaluation_answer` VALUES ('209', '1', '5', '11', 'D', 'single', 'D', '5', '13');
INSERT INTO `f_evaluation_answer` VALUES ('210', '1', '6', '11', 'C', 'single', 'C', '5', '13');
INSERT INTO `f_evaluation_answer` VALUES ('211', '1', '7', '11', 'D', 'single', 'D', '5', '13');
INSERT INTO `f_evaluation_answer` VALUES ('212', '1', '8', '11', 'B_@D', 'multi', 'B_@D', '5', '13');
INSERT INTO `f_evaluation_answer` VALUES ('213', '1', '9', '11', 'C_@D', 'multi', 'C_@D', '5', '13');
INSERT INTO `f_evaluation_answer` VALUES ('214', '1', '10', '11', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '13');
INSERT INTO `f_evaluation_answer` VALUES ('215', '1', '11', '11', '0', 'recognized', '1', '0', '13');
INSERT INTO `f_evaluation_answer` VALUES ('216', '1', '12', '11', '0', 'recognized', '1', '0', '13');
INSERT INTO `f_evaluation_answer` VALUES ('217', '1', '13', '11', '0', 'recognized', '1', '0', '13');
INSERT INTO `f_evaluation_answer` VALUES ('218', '1', '14', '11', '1', 'recognized', '1', '5', '13');
INSERT INTO `f_evaluation_answer` VALUES ('219', '1', '15', '11', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '13');
INSERT INTO `f_evaluation_answer` VALUES ('220', '1', '16', '11', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '13');
INSERT INTO `f_evaluation_answer` VALUES ('221', '1', '17', '11', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '13');
INSERT INTO `f_evaluation_answer` VALUES ('222', '1', '1', '11', 'D', 'single', 'D', '5', '14');
INSERT INTO `f_evaluation_answer` VALUES ('223', '1', '2', '11', 'C', 'single', 'C', '5', '14');
INSERT INTO `f_evaluation_answer` VALUES ('224', '1', '3', '11', 'B', 'single', 'B', '5', '14');
INSERT INTO `f_evaluation_answer` VALUES ('225', '1', '4', '11', 'A', 'single', 'A', '5', '14');
INSERT INTO `f_evaluation_answer` VALUES ('226', '1', '5', '11', 'D', 'single', 'D', '5', '14');
INSERT INTO `f_evaluation_answer` VALUES ('227', '1', '6', '11', 'C', 'single', 'C', '5', '14');
INSERT INTO `f_evaluation_answer` VALUES ('228', '1', '7', '11', 'D', 'single', 'D', '5', '14');
INSERT INTO `f_evaluation_answer` VALUES ('229', '1', '8', '11', 'B_@D', 'multi', 'B_@D', '5', '14');
INSERT INTO `f_evaluation_answer` VALUES ('230', '1', '9', '11', 'C_@D', 'multi', 'C_@D', '5', '14');
INSERT INTO `f_evaluation_answer` VALUES ('231', '1', '10', '11', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '14');
INSERT INTO `f_evaluation_answer` VALUES ('232', '1', '11', '11', '0', 'recognized', '1', '0', '14');
INSERT INTO `f_evaluation_answer` VALUES ('233', '1', '12', '11', '0', 'recognized', '1', '0', '14');
INSERT INTO `f_evaluation_answer` VALUES ('234', '1', '13', '11', '0', 'recognized', '1', '0', '14');
INSERT INTO `f_evaluation_answer` VALUES ('235', '1', '14', '11', '1', 'recognized', '1', '5', '14');
INSERT INTO `f_evaluation_answer` VALUES ('236', '1', '15', '11', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '14');
INSERT INTO `f_evaluation_answer` VALUES ('237', '1', '16', '11', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '14');
INSERT INTO `f_evaluation_answer` VALUES ('238', '1', '17', '11', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '14');
INSERT INTO `f_evaluation_answer` VALUES ('239', '1', '1', '11', 'D', 'single', 'D', '5', '15');
INSERT INTO `f_evaluation_answer` VALUES ('240', '1', '2', '11', 'C', 'single', 'C', '5', '15');
INSERT INTO `f_evaluation_answer` VALUES ('241', '1', '3', '11', 'B', 'single', 'B', '5', '15');
INSERT INTO `f_evaluation_answer` VALUES ('242', '1', '4', '11', 'A', 'single', 'A', '5', '15');
INSERT INTO `f_evaluation_answer` VALUES ('243', '1', '5', '11', 'D', 'single', 'D', '5', '15');
INSERT INTO `f_evaluation_answer` VALUES ('244', '1', '6', '11', 'C', 'single', 'C', '5', '15');
INSERT INTO `f_evaluation_answer` VALUES ('245', '1', '7', '11', 'D', 'single', 'D', '5', '15');
INSERT INTO `f_evaluation_answer` VALUES ('246', '1', '8', '11', 'B_@D', 'multi', 'B_@D', '5', '15');
INSERT INTO `f_evaluation_answer` VALUES ('247', '1', '9', '11', 'C_@D', 'multi', 'C_@D', '5', '15');
INSERT INTO `f_evaluation_answer` VALUES ('248', '1', '10', '11', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '15');
INSERT INTO `f_evaluation_answer` VALUES ('249', '1', '11', '11', '0', 'recognized', '1', '0', '15');
INSERT INTO `f_evaluation_answer` VALUES ('250', '1', '12', '11', '0', 'recognized', '1', '0', '15');
INSERT INTO `f_evaluation_answer` VALUES ('251', '1', '13', '11', '0', 'recognized', '1', '0', '15');
INSERT INTO `f_evaluation_answer` VALUES ('252', '1', '14', '11', '1', 'recognized', '1', '5', '15');
INSERT INTO `f_evaluation_answer` VALUES ('253', '1', '15', '11', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '15');
INSERT INTO `f_evaluation_answer` VALUES ('254', '1', '16', '11', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '15');
INSERT INTO `f_evaluation_answer` VALUES ('255', '1', '17', '11', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '15');
INSERT INTO `f_evaluation_answer` VALUES ('256', '1', '1', '11', 'D', 'single', 'D', '5', '16');
INSERT INTO `f_evaluation_answer` VALUES ('257', '1', '2', '11', 'C', 'single', 'C', '5', '16');
INSERT INTO `f_evaluation_answer` VALUES ('258', '1', '3', '11', 'B', 'single', 'B', '5', '16');
INSERT INTO `f_evaluation_answer` VALUES ('259', '1', '4', '11', 'A', 'single', 'A', '5', '16');
INSERT INTO `f_evaluation_answer` VALUES ('260', '1', '5', '11', 'D', 'single', 'D', '5', '16');
INSERT INTO `f_evaluation_answer` VALUES ('261', '1', '6', '11', 'C', 'single', 'C', '5', '16');
INSERT INTO `f_evaluation_answer` VALUES ('262', '1', '7', '11', 'D', 'single', 'D', '5', '16');
INSERT INTO `f_evaluation_answer` VALUES ('263', '1', '8', '11', 'B_@D', 'multi', 'B_@D', '5', '16');
INSERT INTO `f_evaluation_answer` VALUES ('264', '1', '9', '11', 'C_@D', 'multi', 'C_@D', '5', '16');
INSERT INTO `f_evaluation_answer` VALUES ('265', '1', '10', '11', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '16');
INSERT INTO `f_evaluation_answer` VALUES ('266', '1', '11', '11', '0', 'recognized', '1', '0', '16');
INSERT INTO `f_evaluation_answer` VALUES ('267', '1', '12', '11', '0', 'recognized', '1', '0', '16');
INSERT INTO `f_evaluation_answer` VALUES ('268', '1', '13', '11', '0', 'recognized', '1', '0', '16');
INSERT INTO `f_evaluation_answer` VALUES ('269', '1', '14', '11', '1', 'recognized', '0', '5', '16');
INSERT INTO `f_evaluation_answer` VALUES ('270', '1', '15', '11', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '16');
INSERT INTO `f_evaluation_answer` VALUES ('271', '1', '16', '11', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '16');
INSERT INTO `f_evaluation_answer` VALUES ('272', '1', '17', '11', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '16');
INSERT INTO `f_evaluation_answer` VALUES ('273', '1', '1', '1', 'D', 'single', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('274', '1', '2', '1', 'C', 'single', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('275', '1', '3', '1', 'B', 'single', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('276', '1', '4', '1', 'A', 'single', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('277', '1', '5', '1', 'D', 'single', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('278', '1', '6', '1', 'C', 'single', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('279', '1', '7', '1', 'D', 'single', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('280', '1', '8', '1', 'B_@D', 'multi', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('281', '1', '9', '1', 'C_@D', 'multi', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('282', '1', '10', '1', 'A_@C_@D', 'multi', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('283', '1', '11', '1', '0', 'recognized', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('284', '1', '12', '1', '0', 'recognized', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('285', '1', '13', '1', '0', 'recognized', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('286', '1', '14', '1', '1', 'recognized', '0', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('287', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('288', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('289', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '17');
INSERT INTO `f_evaluation_answer` VALUES ('290', '1', '1', '1', 'D', 'single', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('291', '1', '2', '1', 'C', 'single', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('292', '1', '3', '1', 'B', 'single', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('293', '1', '4', '1', 'A', 'single', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('294', '1', '5', '1', 'D', 'single', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('295', '1', '6', '1', 'C', 'single', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('296', '1', '7', '1', 'D', 'single', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('297', '1', '8', '1', 'B_@D', 'multi', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('298', '1', '9', '1', 'C_@D', 'multi', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('299', '1', '10', '1', 'A_@C_@D', 'multi', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('300', '1', '11', '1', '0', 'recognized', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('301', '1', '12', '1', '0', 'recognized', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('302', '1', '13', '1', '0', 'recognized', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('303', '1', '14', '1', '1', 'recognized', '1', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('304', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('305', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('306', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '18');
INSERT INTO `f_evaluation_answer` VALUES ('307', '1', '1', '1', 'D', 'single', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('308', '1', '2', '1', 'C', 'single', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('309', '1', '3', '1', 'B', 'single', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('310', '1', '4', '1', 'A', 'single', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('311', '1', '5', '1', 'D', 'single', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('312', '1', '6', '1', 'C', 'single', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('313', '1', '7', '1', 'D', 'single', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('314', '1', '8', '1', 'B_@D', 'multi', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('315', '1', '9', '1', 'C_@D', 'multi', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('316', '1', '10', '1', 'A_@C_@D', 'multi', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('317', '1', '11', '1', '0', 'recognized', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('318', '1', '12', '1', '0', 'recognized', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('319', '1', '13', '1', '0', 'recognized', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('320', '1', '14', '1', '1', 'recognized', '0', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('321', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('322', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('323', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '19');
INSERT INTO `f_evaluation_answer` VALUES ('324', '1', '1', '1', 'D', 'single', '', '0', '20');
INSERT INTO `f_evaluation_answer` VALUES ('325', '1', '2', '1', 'C', 'single', '', '0', '20');
INSERT INTO `f_evaluation_answer` VALUES ('326', '1', '3', '1', 'B', 'single', '', '0', '20');
INSERT INTO `f_evaluation_answer` VALUES ('327', '1', '4', '1', 'A', 'single', '', '0', '20');
INSERT INTO `f_evaluation_answer` VALUES ('328', '1', '5', '1', 'D', 'single', '', '0', '20');
INSERT INTO `f_evaluation_answer` VALUES ('329', '1', '6', '1', 'C', 'single', '', '0', '20');
INSERT INTO `f_evaluation_answer` VALUES ('330', '1', '7', '1', 'D', 'single', '', '0', '20');
INSERT INTO `f_evaluation_answer` VALUES ('331', '1', '8', '1', 'B_@D', 'multi', '', '0', '20');
INSERT INTO `f_evaluation_answer` VALUES ('332', '1', '9', '1', 'C_@D', 'multi', '', '0', '20');
INSERT INTO `f_evaluation_answer` VALUES ('333', '1', '10', '1', 'A_@C_@D', 'multi', '', '0', '20');
INSERT INTO `f_evaluation_answer` VALUES ('334', '1', '11', '1', '0', 'recognized', '', '5', '20');
INSERT INTO `f_evaluation_answer` VALUES ('335', '1', '12', '1', '0', 'recognized', '', '5', '20');
INSERT INTO `f_evaluation_answer` VALUES ('336', '1', '13', '1', '0', 'recognized', '', '5', '20');
INSERT INTO `f_evaluation_answer` VALUES ('337', '1', '14', '1', '1', 'recognized', '1', '5', '20');
INSERT INTO `f_evaluation_answer` VALUES ('338', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '20');
INSERT INTO `f_evaluation_answer` VALUES ('339', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '20');
INSERT INTO `f_evaluation_answer` VALUES ('340', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '20');
INSERT INTO `f_evaluation_answer` VALUES ('341', '1', '1', '1', 'D', 'single', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('342', '1', '2', '1', 'C', 'single', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('343', '1', '3', '1', 'B', 'single', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('344', '1', '4', '1', 'A', 'single', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('345', '1', '5', '1', 'D', 'single', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('346', '1', '6', '1', 'C', 'single', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('347', '1', '7', '1', 'D', 'single', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('348', '1', '8', '1', 'B_@D', 'multi', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('349', '1', '9', '1', 'C_@D', 'multi', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('350', '1', '10', '1', 'A_@C_@D', 'multi', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('351', '1', '11', '1', '0', 'recognized', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('352', '1', '12', '1', '0', 'recognized', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('353', '1', '13', '1', '0', 'recognized', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('354', '1', '14', '1', '1', 'recognized', '1', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('355', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('356', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('357', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '21');
INSERT INTO `f_evaluation_answer` VALUES ('358', '1', '1', '1', 'D', 'single', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('359', '1', '2', '1', 'C', 'single', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('360', '1', '3', '1', 'B', 'single', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('361', '1', '4', '1', 'A', 'single', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('362', '1', '5', '1', 'D', 'single', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('363', '1', '6', '1', 'C', 'single', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('364', '1', '7', '1', 'D', 'single', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('365', '1', '8', '1', 'B_@D', 'multi', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('366', '1', '9', '1', 'C_@D', 'multi', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('367', '1', '10', '1', 'A_@C_@D', 'multi', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('368', '1', '11', '1', '0', 'recognized', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('369', '1', '12', '1', '0', 'recognized', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('370', '1', '13', '1', '0', 'recognized', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('371', '1', '14', '1', '1', 'recognized', '0', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('372', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('373', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('374', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '22');
INSERT INTO `f_evaluation_answer` VALUES ('375', '1', '1', '1', 'D', 'single', '', '0', '23');
INSERT INTO `f_evaluation_answer` VALUES ('376', '1', '2', '1', 'C', 'single', '', '0', '23');
INSERT INTO `f_evaluation_answer` VALUES ('377', '1', '3', '1', 'B', 'single', '', '0', '23');
INSERT INTO `f_evaluation_answer` VALUES ('378', '1', '4', '1', 'A', 'single', '', '0', '23');
INSERT INTO `f_evaluation_answer` VALUES ('379', '1', '5', '1', 'D', 'single', '', '0', '23');
INSERT INTO `f_evaluation_answer` VALUES ('380', '1', '6', '1', 'C', 'single', '', '0', '23');
INSERT INTO `f_evaluation_answer` VALUES ('381', '1', '7', '1', 'D', 'single', '', '0', '23');
INSERT INTO `f_evaluation_answer` VALUES ('382', '1', '8', '1', 'B_@D', 'multi', '', '0', '23');
INSERT INTO `f_evaluation_answer` VALUES ('383', '1', '9', '1', 'C_@D', 'multi', '', '0', '23');
INSERT INTO `f_evaluation_answer` VALUES ('384', '1', '10', '1', 'A_@C_@D', 'multi', '', '0', '23');
INSERT INTO `f_evaluation_answer` VALUES ('385', '1', '11', '1', '0', 'recognized', '0', '0', '23');
INSERT INTO `f_evaluation_answer` VALUES ('386', '1', '12', '1', '0', 'recognized', '0', '5', '23');
INSERT INTO `f_evaluation_answer` VALUES ('387', '1', '13', '1', '0', 'recognized', '0', '5', '23');
INSERT INTO `f_evaluation_answer` VALUES ('388', '1', '14', '1', '1', 'recognized', '1', '0', '23');
INSERT INTO `f_evaluation_answer` VALUES ('389', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '23');
INSERT INTO `f_evaluation_answer` VALUES ('390', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '23');
INSERT INTO `f_evaluation_answer` VALUES ('391', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '23');
INSERT INTO `f_evaluation_answer` VALUES ('392', '1', '1', '1', 'D', 'single', '', '0', '24');
INSERT INTO `f_evaluation_answer` VALUES ('393', '1', '2', '1', 'C', 'single', '', '0', '24');
INSERT INTO `f_evaluation_answer` VALUES ('394', '1', '3', '1', 'B', 'single', '', '0', '24');
INSERT INTO `f_evaluation_answer` VALUES ('395', '1', '4', '1', 'A', 'single', '', '0', '24');
INSERT INTO `f_evaluation_answer` VALUES ('396', '1', '5', '1', 'D', 'single', '', '0', '24');
INSERT INTO `f_evaluation_answer` VALUES ('397', '1', '6', '1', 'C', 'single', '', '0', '24');
INSERT INTO `f_evaluation_answer` VALUES ('398', '1', '7', '1', 'D', 'single', '', '0', '24');
INSERT INTO `f_evaluation_answer` VALUES ('399', '1', '8', '1', 'B_@D', 'multi', '', '0', '24');
INSERT INTO `f_evaluation_answer` VALUES ('400', '1', '9', '1', 'C_@D', 'multi', '', '0', '24');
INSERT INTO `f_evaluation_answer` VALUES ('401', '1', '10', '1', 'A_@C_@D', 'multi', '', '0', '24');
INSERT INTO `f_evaluation_answer` VALUES ('402', '1', '11', '1', '0', 'recognized', '0', '5', '24');
INSERT INTO `f_evaluation_answer` VALUES ('403', '1', '12', '1', '0', 'recognized', '0', '5', '24');
INSERT INTO `f_evaluation_answer` VALUES ('404', '1', '13', '1', '0', 'recognized', '0', '5', '24');
INSERT INTO `f_evaluation_answer` VALUES ('405', '1', '14', '1', '1', 'recognized', '1', '5', '24');
INSERT INTO `f_evaluation_answer` VALUES ('406', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '24');
INSERT INTO `f_evaluation_answer` VALUES ('407', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '24');
INSERT INTO `f_evaluation_answer` VALUES ('408', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '24');
INSERT INTO `f_evaluation_answer` VALUES ('409', '1', '1', '1', 'D', 'single', '', '0', '25');
INSERT INTO `f_evaluation_answer` VALUES ('410', '1', '2', '1', 'C', 'single', '', '0', '25');
INSERT INTO `f_evaluation_answer` VALUES ('411', '1', '3', '1', 'B', 'single', '', '0', '25');
INSERT INTO `f_evaluation_answer` VALUES ('412', '1', '4', '1', 'A', 'single', '', '0', '25');
INSERT INTO `f_evaluation_answer` VALUES ('413', '1', '5', '1', 'D', 'single', '', '0', '25');
INSERT INTO `f_evaluation_answer` VALUES ('414', '1', '6', '1', 'C', 'single', '', '0', '25');
INSERT INTO `f_evaluation_answer` VALUES ('415', '1', '7', '1', 'D', 'single', '', '0', '25');
INSERT INTO `f_evaluation_answer` VALUES ('416', '1', '8', '1', 'B_@D', 'multi', '', '0', '25');
INSERT INTO `f_evaluation_answer` VALUES ('417', '1', '9', '1', 'C_@D', 'multi', '', '0', '25');
INSERT INTO `f_evaluation_answer` VALUES ('418', '1', '10', '1', 'A_@C_@D', 'multi', '', '0', '25');
INSERT INTO `f_evaluation_answer` VALUES ('419', '1', '11', '1', '0', 'recognized', '0', '5', '25');
INSERT INTO `f_evaluation_answer` VALUES ('420', '1', '12', '1', '0', 'recognized', '0', '5', '25');
INSERT INTO `f_evaluation_answer` VALUES ('421', '1', '13', '1', '0', 'recognized', '0', '5', '25');
INSERT INTO `f_evaluation_answer` VALUES ('422', '1', '14', '1', '1', 'recognized', '0', '0', '25');
INSERT INTO `f_evaluation_answer` VALUES ('423', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '25');
INSERT INTO `f_evaluation_answer` VALUES ('424', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '25');
INSERT INTO `f_evaluation_answer` VALUES ('425', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '25');
INSERT INTO `f_evaluation_answer` VALUES ('426', '1', '1', '1', 'D', 'single', '', '0', '26');
INSERT INTO `f_evaluation_answer` VALUES ('427', '1', '2', '1', 'C', 'single', '', '0', '26');
INSERT INTO `f_evaluation_answer` VALUES ('428', '1', '3', '1', 'B', 'single', '', '0', '26');
INSERT INTO `f_evaluation_answer` VALUES ('429', '1', '4', '1', 'A', 'single', '', '0', '26');
INSERT INTO `f_evaluation_answer` VALUES ('430', '1', '5', '1', 'D', 'single', '', '0', '26');
INSERT INTO `f_evaluation_answer` VALUES ('431', '1', '6', '1', 'C', 'single', '', '0', '26');
INSERT INTO `f_evaluation_answer` VALUES ('432', '1', '7', '1', 'D', 'single', '', '0', '26');
INSERT INTO `f_evaluation_answer` VALUES ('433', '1', '8', '1', 'B_@D', 'multi', '', '0', '26');
INSERT INTO `f_evaluation_answer` VALUES ('434', '1', '9', '1', 'C_@D', 'multi', '', '0', '26');
INSERT INTO `f_evaluation_answer` VALUES ('435', '1', '10', '1', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '26');
INSERT INTO `f_evaluation_answer` VALUES ('436', '1', '11', '1', '0', 'recognized', '0', '5', '26');
INSERT INTO `f_evaluation_answer` VALUES ('437', '1', '12', '1', '0', 'recognized', '0', '5', '26');
INSERT INTO `f_evaluation_answer` VALUES ('438', '1', '13', '1', '0', 'recognized', '0', '5', '26');
INSERT INTO `f_evaluation_answer` VALUES ('439', '1', '14', '1', '1', 'recognized', '0', '0', '26');
INSERT INTO `f_evaluation_answer` VALUES ('440', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '26');
INSERT INTO `f_evaluation_answer` VALUES ('441', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '26');
INSERT INTO `f_evaluation_answer` VALUES ('442', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '26');
INSERT INTO `f_evaluation_answer` VALUES ('443', '1', '1', '1', 'D', 'single', '', '0', '27');
INSERT INTO `f_evaluation_answer` VALUES ('444', '1', '2', '1', 'C', 'single', '', '0', '27');
INSERT INTO `f_evaluation_answer` VALUES ('445', '1', '3', '1', 'B', 'single', '', '0', '27');
INSERT INTO `f_evaluation_answer` VALUES ('446', '1', '4', '1', 'A', 'single', '', '0', '27');
INSERT INTO `f_evaluation_answer` VALUES ('447', '1', '5', '1', 'D', 'single', '', '0', '27');
INSERT INTO `f_evaluation_answer` VALUES ('448', '1', '6', '1', 'C', 'single', '', '0', '27');
INSERT INTO `f_evaluation_answer` VALUES ('449', '1', '7', '1', 'D', 'single', '', '0', '27');
INSERT INTO `f_evaluation_answer` VALUES ('450', '1', '8', '1', 'B_@D', 'multi', 'B_@C', '0', '27');
INSERT INTO `f_evaluation_answer` VALUES ('451', '1', '9', '1', 'C_@D', 'multi', 'C_@D', '5', '27');
INSERT INTO `f_evaluation_answer` VALUES ('452', '1', '10', '1', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '27');
INSERT INTO `f_evaluation_answer` VALUES ('453', '1', '11', '1', '0', 'recognized', '0', '5', '27');
INSERT INTO `f_evaluation_answer` VALUES ('454', '1', '12', '1', '0', 'recognized', '0', '5', '27');
INSERT INTO `f_evaluation_answer` VALUES ('455', '1', '13', '1', '0', 'recognized', '0', '5', '27');
INSERT INTO `f_evaluation_answer` VALUES ('456', '1', '14', '1', '1', 'recognized', '0', '0', '27');
INSERT INTO `f_evaluation_answer` VALUES ('457', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '27');
INSERT INTO `f_evaluation_answer` VALUES ('458', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '27');
INSERT INTO `f_evaluation_answer` VALUES ('459', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '27');
INSERT INTO `f_evaluation_answer` VALUES ('460', '1', '1', '1', 'D', 'single', '', '0', '28');
INSERT INTO `f_evaluation_answer` VALUES ('461', '1', '2', '1', 'C', 'single', '', '0', '28');
INSERT INTO `f_evaluation_answer` VALUES ('462', '1', '3', '1', 'B', 'single', '', '0', '28');
INSERT INTO `f_evaluation_answer` VALUES ('463', '1', '4', '1', 'A', 'single', '', '0', '28');
INSERT INTO `f_evaluation_answer` VALUES ('464', '1', '5', '1', 'D', 'single', '', '0', '28');
INSERT INTO `f_evaluation_answer` VALUES ('465', '1', '6', '1', 'C', 'single', '', '0', '28');
INSERT INTO `f_evaluation_answer` VALUES ('466', '1', '7', '1', 'D', 'single', '', '0', '28');
INSERT INTO `f_evaluation_answer` VALUES ('467', '1', '8', '1', 'B_@D', 'multi', 'B_@C', '0', '28');
INSERT INTO `f_evaluation_answer` VALUES ('468', '1', '9', '1', 'C_@D', 'multi', 'C_@D', '5', '28');
INSERT INTO `f_evaluation_answer` VALUES ('469', '1', '10', '1', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '28');
INSERT INTO `f_evaluation_answer` VALUES ('470', '1', '11', '1', '0', 'recognized', '0', '5', '28');
INSERT INTO `f_evaluation_answer` VALUES ('471', '1', '12', '1', '0', 'recognized', '0', '5', '28');
INSERT INTO `f_evaluation_answer` VALUES ('472', '1', '13', '1', '0', 'recognized', '0', '5', '28');
INSERT INTO `f_evaluation_answer` VALUES ('473', '1', '14', '1', '1', 'recognized', '0', '0', '28');
INSERT INTO `f_evaluation_answer` VALUES ('474', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '28');
INSERT INTO `f_evaluation_answer` VALUES ('475', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '28');
INSERT INTO `f_evaluation_answer` VALUES ('476', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '请简述项目中优化sql语句执行效率的方法,从哪些方面,sql语句性能如何分析?', '1', '28');
INSERT INTO `f_evaluation_answer` VALUES ('477', '1', '1', '1', 'D', 'single', '', '0', '29');
INSERT INTO `f_evaluation_answer` VALUES ('478', '1', '2', '1', 'C', 'single', '', '0', '29');
INSERT INTO `f_evaluation_answer` VALUES ('479', '1', '3', '1', 'B', 'single', '', '0', '29');
INSERT INTO `f_evaluation_answer` VALUES ('480', '1', '4', '1', 'A', 'single', '', '0', '29');
INSERT INTO `f_evaluation_answer` VALUES ('481', '1', '5', '1', 'D', 'single', '', '0', '29');
INSERT INTO `f_evaluation_answer` VALUES ('482', '1', '6', '1', 'C', 'single', '', '0', '29');
INSERT INTO `f_evaluation_answer` VALUES ('483', '1', '7', '1', 'D', 'single', '', '0', '29');
INSERT INTO `f_evaluation_answer` VALUES ('484', '1', '8', '1', 'B_@D', 'multi', 'B_@C', '0', '29');
INSERT INTO `f_evaluation_answer` VALUES ('485', '1', '9', '1', 'C_@D', 'multi', 'C_@D', '5', '29');
INSERT INTO `f_evaluation_answer` VALUES ('486', '1', '10', '1', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '29');
INSERT INTO `f_evaluation_answer` VALUES ('487', '1', '11', '1', '0', 'recognized', '0', '5', '29');
INSERT INTO `f_evaluation_answer` VALUES ('488', '1', '12', '1', '0', 'recognized', '0', '5', '29');
INSERT INTO `f_evaluation_answer` VALUES ('489', '1', '13', '1', '0', 'recognized', '0', '5', '29');
INSERT INTO `f_evaluation_answer` VALUES ('490', '1', '14', '1', '1', 'recognized', '0', '0', '29');
INSERT INTO `f_evaluation_answer` VALUES ('491', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '29');
INSERT INTO `f_evaluation_answer` VALUES ('492', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '29');
INSERT INTO `f_evaluation_answer` VALUES ('493', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '请简述项目中优化sql语句执行效率的方法,从哪些方面,sql语句性能如何分析?', '1', '29');
INSERT INTO `f_evaluation_answer` VALUES ('494', '1', '1', '1', 'D', 'single', '', '0', '30');
INSERT INTO `f_evaluation_answer` VALUES ('495', '1', '2', '1', 'C', 'single', '', '0', '30');
INSERT INTO `f_evaluation_answer` VALUES ('496', '1', '3', '1', 'B', 'single', '', '0', '30');
INSERT INTO `f_evaluation_answer` VALUES ('497', '1', '4', '1', 'A', 'single', '', '0', '30');
INSERT INTO `f_evaluation_answer` VALUES ('498', '1', '5', '1', 'D', 'single', '', '0', '30');
INSERT INTO `f_evaluation_answer` VALUES ('499', '1', '6', '1', 'C', 'single', '', '0', '30');
INSERT INTO `f_evaluation_answer` VALUES ('500', '1', '7', '1', 'D', 'single', '', '0', '30');
INSERT INTO `f_evaluation_answer` VALUES ('501', '1', '8', '1', 'B_@D', 'multi', 'B_@C', '0', '30');
INSERT INTO `f_evaluation_answer` VALUES ('502', '1', '9', '1', 'C_@D', 'multi', 'C_@D', '5', '30');
INSERT INTO `f_evaluation_answer` VALUES ('503', '1', '10', '1', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '30');
INSERT INTO `f_evaluation_answer` VALUES ('504', '1', '11', '1', '0', 'recognized', '0', '5', '30');
INSERT INTO `f_evaluation_answer` VALUES ('505', '1', '12', '1', '0', 'recognized', '0', '5', '30');
INSERT INTO `f_evaluation_answer` VALUES ('506', '1', '13', '1', '0', 'recognized', '0', '5', '30');
INSERT INTO `f_evaluation_answer` VALUES ('507', '1', '14', '1', '1', 'recognized', '0', '0', '30');
INSERT INTO `f_evaluation_answer` VALUES ('508', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '30');
INSERT INTO `f_evaluation_answer` VALUES ('509', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '30');
INSERT INTO `f_evaluation_answer` VALUES ('510', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '请简述项目中优化sql语句执行效率的方法,从哪些方面,sql语句性能如何分析?', '1', '30');
INSERT INTO `f_evaluation_answer` VALUES ('511', '1', '1', '1', 'D', 'single', '', '0', '31');
INSERT INTO `f_evaluation_answer` VALUES ('512', '1', '2', '1', 'C', 'single', '', '0', '31');
INSERT INTO `f_evaluation_answer` VALUES ('513', '1', '3', '1', 'B', 'single', '', '0', '31');
INSERT INTO `f_evaluation_answer` VALUES ('514', '1', '4', '1', 'A', 'single', '', '0', '31');
INSERT INTO `f_evaluation_answer` VALUES ('515', '1', '5', '1', 'D', 'single', '', '0', '31');
INSERT INTO `f_evaluation_answer` VALUES ('516', '1', '6', '1', 'C', 'single', '', '0', '31');
INSERT INTO `f_evaluation_answer` VALUES ('517', '1', '7', '1', 'D', 'single', '', '0', '31');
INSERT INTO `f_evaluation_answer` VALUES ('518', '1', '8', '1', 'B_@D', 'multi', 'B_@C', '0', '31');
INSERT INTO `f_evaluation_answer` VALUES ('519', '1', '9', '1', 'C_@D', 'multi', 'C_@D', '5', '31');
INSERT INTO `f_evaluation_answer` VALUES ('520', '1', '10', '1', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '31');
INSERT INTO `f_evaluation_answer` VALUES ('521', '1', '11', '1', '0', 'recognized', '0', '5', '31');
INSERT INTO `f_evaluation_answer` VALUES ('522', '1', '12', '1', '0', 'recognized', '0', '5', '31');
INSERT INTO `f_evaluation_answer` VALUES ('523', '1', '13', '1', '0', 'recognized', '0', '5', '31');
INSERT INTO `f_evaluation_answer` VALUES ('524', '1', '14', '1', '1', 'recognized', '0', '0', '31');
INSERT INTO `f_evaluation_answer` VALUES ('525', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '31');
INSERT INTO `f_evaluation_answer` VALUES ('526', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '数据库中的事务是什么?', '1', '31');
INSERT INTO `f_evaluation_answer` VALUES ('527', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '请简述项目中优化sql语句执行效率的方法,从哪些方面,sql语句性能如何分析?', '1', '31');
INSERT INTO `f_evaluation_answer` VALUES ('528', '1', '1', '1', 'D', 'single', '', '0', '32');
INSERT INTO `f_evaluation_answer` VALUES ('529', '1', '2', '1', 'C', 'single', '', '0', '32');
INSERT INTO `f_evaluation_answer` VALUES ('530', '1', '3', '1', 'B', 'single', '', '0', '32');
INSERT INTO `f_evaluation_answer` VALUES ('531', '1', '4', '1', 'A', 'single', '', '0', '32');
INSERT INTO `f_evaluation_answer` VALUES ('532', '1', '5', '1', 'D', 'single', '', '0', '32');
INSERT INTO `f_evaluation_answer` VALUES ('533', '1', '6', '1', 'C', 'single', '', '0', '32');
INSERT INTO `f_evaluation_answer` VALUES ('534', '1', '7', '1', 'D', 'single', '', '0', '32');
INSERT INTO `f_evaluation_answer` VALUES ('535', '1', '8', '1', 'B_@D', 'multi', 'B_@C', '0', '32');
INSERT INTO `f_evaluation_answer` VALUES ('536', '1', '9', '1', 'C_@D', 'multi', 'C_@D', '5', '32');
INSERT INTO `f_evaluation_answer` VALUES ('537', '1', '10', '1', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '32');
INSERT INTO `f_evaluation_answer` VALUES ('538', '1', '11', '1', '0', 'recognized', '0', '5', '32');
INSERT INTO `f_evaluation_answer` VALUES ('539', '1', '12', '1', '0', 'recognized', '0', '5', '32');
INSERT INTO `f_evaluation_answer` VALUES ('540', '1', '13', '1', '0', 'recognized', '0', '5', '32');
INSERT INTO `f_evaluation_answer` VALUES ('541', '1', '14', '1', '1', 'recognized', '0', '0', '32');
INSERT INTO `f_evaluation_answer` VALUES ('542', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '数据库中的事务是什么?', '1', '32');
INSERT INTO `f_evaluation_answer` VALUES ('543', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '数据库中的事务是什么?', '1', '32');
INSERT INTO `f_evaluation_answer` VALUES ('544', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '请简述项目中优化sql语句执行效率的方法,从哪些方面,sql语句性能如何分析?', '1', '32');
INSERT INTO `f_evaluation_answer` VALUES ('545', '1', '1', '1', 'D', 'single', '', '0', '33');
INSERT INTO `f_evaluation_answer` VALUES ('546', '1', '2', '1', 'C', 'single', '', '0', '33');
INSERT INTO `f_evaluation_answer` VALUES ('547', '1', '3', '1', 'B', 'single', '', '0', '33');
INSERT INTO `f_evaluation_answer` VALUES ('548', '1', '4', '1', 'A', 'single', '', '0', '33');
INSERT INTO `f_evaluation_answer` VALUES ('549', '1', '5', '1', 'D', 'single', '', '0', '33');
INSERT INTO `f_evaluation_answer` VALUES ('550', '1', '6', '1', 'C', 'single', '', '0', '33');
INSERT INTO `f_evaluation_answer` VALUES ('551', '1', '7', '1', 'D', 'single', '', '0', '33');
INSERT INTO `f_evaluation_answer` VALUES ('552', '1', '8', '1', 'B_@D', 'multi', 'B_@C', '0', '33');
INSERT INTO `f_evaluation_answer` VALUES ('553', '1', '9', '1', 'C_@D', 'multi', 'C_@D', '5', '33');
INSERT INTO `f_evaluation_answer` VALUES ('554', '1', '10', '1', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '33');
INSERT INTO `f_evaluation_answer` VALUES ('555', '1', '11', '1', '0', 'recognized', '0', '5', '33');
INSERT INTO `f_evaluation_answer` VALUES ('556', '1', '12', '1', '0', 'recognized', '0', '5', '33');
INSERT INTO `f_evaluation_answer` VALUES ('557', '1', '13', '1', '0', 'recognized', '0', '5', '33');
INSERT INTO `f_evaluation_answer` VALUES ('558', '1', '14', '1', '1', 'recognized', '0', '0', '33');
INSERT INTO `f_evaluation_answer` VALUES ('559', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '33');
INSERT INTO `f_evaluation_answer` VALUES ('560', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '数据库中的事务是什么?', '1', '33');
INSERT INTO `f_evaluation_answer` VALUES ('561', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '请简述项目中优化sql语句执行效率的方法,从哪些方面,sql语句性能如何分析?', '1', '33');
INSERT INTO `f_evaluation_answer` VALUES ('562', '1', '1', '11', 'D', 'single', 'D', '5', '34');
INSERT INTO `f_evaluation_answer` VALUES ('563', '1', '2', '11', 'C', 'single', 'C', '5', '34');
INSERT INTO `f_evaluation_answer` VALUES ('564', '1', '3', '11', 'B', 'single', 'B', '5', '34');
INSERT INTO `f_evaluation_answer` VALUES ('565', '1', '4', '11', 'A', 'single', 'A', '5', '34');
INSERT INTO `f_evaluation_answer` VALUES ('566', '1', '5', '11', 'D', 'single', 'D', '5', '34');
INSERT INTO `f_evaluation_answer` VALUES ('567', '1', '6', '11', 'C', 'single', 'C', '5', '34');
INSERT INTO `f_evaluation_answer` VALUES ('568', '1', '7', '11', 'D', 'single', 'D', '5', '34');
INSERT INTO `f_evaluation_answer` VALUES ('569', '1', '8', '11', 'B_@D', 'multi', 'B_@D', '5', '34');
INSERT INTO `f_evaluation_answer` VALUES ('570', '1', '9', '11', 'C_@D', 'multi', 'C_@D', '5', '34');
INSERT INTO `f_evaluation_answer` VALUES ('571', '1', '10', '11', 'A_@C_@D', 'multi', 'A_@C_@D', '5', '34');
INSERT INTO `f_evaluation_answer` VALUES ('572', '1', '11', '11', '0', 'recognized', '1', '0', '34');
INSERT INTO `f_evaluation_answer` VALUES ('573', '1', '12', '11', '0', 'recognized', '1', '0', '34');
INSERT INTO `f_evaluation_answer` VALUES ('574', '1', '13', '11', '0', 'recognized', '1', '0', '34');
INSERT INTO `f_evaluation_answer` VALUES ('575', '1', '14', '11', '1', 'recognized', '0', '0', '34');
INSERT INTO `f_evaluation_answer` VALUES ('576', '1', '15', '11', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '34');
INSERT INTO `f_evaluation_answer` VALUES ('577', '1', '16', '11', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '34');
INSERT INTO `f_evaluation_answer` VALUES ('578', '1', '17', '11', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '34');
INSERT INTO `f_evaluation_answer` VALUES ('579', '1', '1', '1', 'D', 'single', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('580', '1', '2', '1', 'C', 'single', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('581', '1', '3', '1', 'B', 'single', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('582', '1', '4', '1', 'A', 'single', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('583', '1', '5', '1', 'D', 'single', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('584', '1', '6', '1', 'C', 'single', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('585', '1', '7', '1', 'D', 'single', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('586', '1', '8', '1', 'B_@D', 'multi', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('587', '1', '9', '1', 'C_@D', 'multi', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('588', '1', '10', '1', 'A_@C_@D', 'multi', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('589', '1', '11', '1', '0', 'recognized', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('590', '1', '12', '1', '0', 'recognized', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('591', '1', '13', '1', '0', 'recognized', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('592', '1', '14', '1', '1', 'recognized', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('593', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('594', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('595', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '35');
INSERT INTO `f_evaluation_answer` VALUES ('596', '1', '1', '1', 'D', 'single', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('597', '1', '2', '1', 'C', 'single', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('598', '1', '3', '1', 'B', 'single', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('599', '1', '4', '1', 'A', 'single', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('600', '1', '5', '1', 'D', 'single', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('601', '1', '6', '1', 'C', 'single', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('602', '1', '7', '1', 'D', 'single', 'C', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('603', '1', '8', '1', 'B_@D', 'multi', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('604', '1', '9', '1', 'C_@D', 'multi', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('605', '1', '10', '1', 'A_@C_@D', 'multi', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('606', '1', '11', '1', '0', 'recognized', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('607', '1', '12', '1', '0', 'recognized', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('608', '1', '13', '1', '0', 'recognized', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('609', '1', '14', '1', '1', 'recognized', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('610', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('611', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('612', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '36');
INSERT INTO `f_evaluation_answer` VALUES ('613', '1', '1', '1', 'D', 'single', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('614', '1', '2', '1', 'C', 'single', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('615', '1', '3', '1', 'B', 'single', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('616', '1', '4', '1', 'A', 'single', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('617', '1', '5', '1', 'D', 'single', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('618', '1', '6', '1', 'C', 'single', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('619', '1', '7', '1', 'D', 'single', 'D', '5', '37');
INSERT INTO `f_evaluation_answer` VALUES ('620', '1', '8', '1', 'B_@D', 'multi', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('621', '1', '9', '1', 'C_@D', 'multi', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('622', '1', '10', '1', 'A_@C_@D', 'multi', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('623', '1', '11', '1', '0', 'recognized', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('624', '1', '12', '1', '0', 'recognized', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('625', '1', '13', '1', '0', 'recognized', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('626', '1', '14', '1', '1', 'recognized', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('627', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('628', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('629', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '37');
INSERT INTO `f_evaluation_answer` VALUES ('630', '1', '1', '11', 'D', 'single', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('631', '1', '2', '11', 'C', 'single', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('632', '1', '3', '11', 'B', 'single', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('633', '1', '4', '11', 'A', 'single', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('634', '1', '5', '11', 'D', 'single', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('635', '1', '6', '11', 'C', 'single', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('636', '1', '7', '11', 'D', 'single', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('637', '1', '8', '11', 'B_@D', 'multi', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('638', '1', '9', '11', 'C_@D', 'multi', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('639', '1', '10', '11', 'A_@C_@D', 'multi', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('640', '1', '11', '11', '0', 'recognized', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('641', '1', '12', '11', '0', 'recognized', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('642', '1', '13', '11', '0', 'recognized', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('643', '1', '14', '11', '1', 'recognized', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('644', '1', '15', '11', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('645', '1', '16', '11', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '38');
INSERT INTO `f_evaluation_answer` VALUES ('646', '1', '17', '11', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '38');

-- ----------------------------
-- Table structure for `f_evaluation_info`
-- ----------------------------

DROP TABLE IF EXISTS `f_evaluation_info`;

CREATE TABLE `f_evaluation_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `evaluation_id` int(10) unsigned NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `answer` text COLLATE utf8_unicode_ci NOT NULL,
  `option` text COLLATE utf8_unicode_ci NOT NULL COMMENT '题目选项',
  `score` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_evaluation_info`
-- ----------------------------

INSERT INTO `f_evaluation_info` VALUES ('1', '1', 'single', '给定一个用逗号分隔一组值的字符串，以下哪个函数能在仅调用一次的情况下就把每个独立的值放入一个新创建的数组？', 'D', 'strstr()_@extract()_@不可能只调用一次就完成_@explode()', '5');
INSERT INTO `f_evaluation_info` VALUES ('2', '1', 'single', '如果用+操作符把一个字符串和一个整型数字相加，结果将怎样？', 'C', '解释器输出一个类型错误_@字符串将被转换成数字，再与整型数字相加_@字符串将被丢弃，只保留整型数字_@字符串和整型数字将连接成一个新字符串', '5');
INSERT INTO `f_evaluation_info` VALUES ('3', '1', 'single', '以下脚本输出什么？$s = &#39;12345&#39;;&nbsp; $s[$s[1]] = &#39;2&#39;;&nbsp; echo $s;?&gt;', 'B', '12345_@12245_@22345_@11345', '5');
INSERT INTO `f_evaluation_info` VALUES ('4', '1', 'single', '以下脚本输出什么？$x = &#39;apple&#39;;&nbsp; echo substr_replace ($x, &#39;x&#39;, 1, 2);?&gt;', 'A', 'axle_@axxle_@applex_@xapple', '5');
INSERT INTO `f_evaluation_info` VALUES ('5', '1', 'single', '函数______能读取文本文件中的一行。读取二进制文件或者其他文件时，应当用______函数。', 'D', 'fgets(), fseek()_@fread(), fgets()_@fputs(), fgets()_@fgets(), fread()', '5');
INSERT INTO `f_evaluation_info` VALUES ('6', '1', 'single', '以下哪个选项能将文件指针移到开头？', 'C', 'reset()_@fseek(0, SEEK_END)_@fseek(0, SEEK_SET)_@fseek(0, SEEK_CUR)', '5');
INSERT INTO `f_evaluation_info` VALUES ('7', '1', 'single', 'include的功能和require一样，不同的是，require不能用在[&nbsp;&nbsp; ]', 'D', '判断语句或循环里_@连接语句里_@文件的开头_@文件的中间', '5');
INSERT INTO `f_evaluation_info` VALUES ('8', '1', 'multi', '下面建立与MySQL Server的连接语法正确的是：[&nbsp; ]', 'B_@D', '$link=connect(&quot;host_name&quot;,&quot;user_name&quot;,&quot;password&quot;);_@$link=mysql_connect(&quot;host_name&quot;,&quot;user_name&quot;,&quot;password&quot;);_@$link=mysqlconnect(&quot;host_name&quot;,&quot;user_name&quot;,&quot;password&quot;);_@$link=mysql_pconnect(&quot;host_name&quot;,&quot;user_name&quot;,&quot;password&quot;);', '5');
INSERT INTO `f_evaluation_info` VALUES ('9', '1', 'multi', '下面功能 PHP 无法实现的是', 'C_@D', '服务器端脚本运行_@命令行脚本运行_@客户端图形界面（GUI）程序_@浏览器端执行 DOM 操作', '5');
INSERT INTO `f_evaluation_info` VALUES ('10', '1', 'multi', '对于下面的代码&lt;?php$fruits=array(&#39;strawberry&#39;=&gt;&#39;red&#39;,&#39;banana&#39;=&gt;&#39;yellow&#39;);?&gt;能够正确得到结果&#39;yellow&#39;的代码是：', 'A_@C_@D', 'echo &quot;A banana is {$fruits[&#39;banana&#39;]}&quot;;_@echo&quot;Abananais$fruits[&#39;banana&#39;]&quot;;_@echo &quot;A banana is {$fruits[banana]}&quot;;_@echo &quot;A banana is $fruits[banana]&quot;;', '5');
INSERT INTO `f_evaluation_info` VALUES ('11', '1', 'recognized', 'PHP是一种服务端脚本执行语言', '0', '', '5');
INSERT INTO `f_evaluation_info` VALUES ('12', '1', 'recognized', '在返回数组中的所有值，可以使用array_value( )函数', '0', '', '5');
INSERT INTO `f_evaluation_info` VALUES ('13', '1', 'recognized', '运算符“++”可以对常量和变量进行累加1', '0', '', '5');
INSERT INTO `f_evaluation_info` VALUES ('14', '1', 'recognized', 'PHP程序的扩展名必须是.php', '1', '', '5');
INSERT INTO `f_evaluation_info` VALUES ('15', '1', 'short', 'Http 和Https的区别', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', '', '10');
INSERT INTO `f_evaluation_info` VALUES ('16', '1', 'short', '数据库中的事务是什么?', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', '', '10');
INSERT INTO `f_evaluation_info` VALUES ('17', '1', 'short', '请简述项目中优化sql语句执行效率的方法,从哪些方面,sql语句性能如何分析?', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', '', '10');

-- ----------------------------
-- Table structure for `f_evaluation_record`
-- ----------------------------

DROP TABLE IF EXISTS `f_evaluation_record`;

CREATE TABLE `f_evaluation_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `evaluation_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `score` int(10) unsigned NOT NULL,
  `pass` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`evaluation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_evaluation_record`
-- ----------------------------

INSERT INTO `f_evaluation_record` VALUES ('1', '1', '1', '70', '1');
INSERT INTO `f_evaluation_record` VALUES ('2', '1', '1', '70', '1');
INSERT INTO `f_evaluation_record` VALUES ('3', '1', '1', '70', '1');
INSERT INTO `f_evaluation_record` VALUES ('4', '1', '1', '0', '0');
INSERT INTO `f_evaluation_record` VALUES ('5', '1', '11', '0', '0');
INSERT INTO `f_evaluation_record` VALUES ('6', '1', '11', '60', '1');
INSERT INTO `f_evaluation_record` VALUES ('7', '1', '11', '60', '1');
INSERT INTO `f_evaluation_record` VALUES ('8', '1', '11', '55', '0');
INSERT INTO `f_evaluation_record` VALUES ('9', '1', '11', '55', '0');
INSERT INTO `f_evaluation_record` VALUES ('10', '1', '11', '55', '0');
INSERT INTO `f_evaluation_record` VALUES ('11', '1', '11', '60', '1');
INSERT INTO `f_evaluation_record` VALUES ('12', '1', '11', '60', '1');
INSERT INTO `f_evaluation_record` VALUES ('13', '1', '11', '55', '0');
INSERT INTO `f_evaluation_record` VALUES ('14', '1', '11', '238', '1');
INSERT INTO `f_evaluation_record` VALUES ('15', '1', '11', '55', '0');
INSERT INTO `f_evaluation_record` VALUES ('16', '1', '11', '55', '0');
INSERT INTO `f_evaluation_record` VALUES ('17', '1', '1', '0', '0');
INSERT INTO `f_evaluation_record` VALUES ('18', '1', '1', '0', '0');
INSERT INTO `f_evaluation_record` VALUES ('19', '1', '1', '0', '0');
INSERT INTO `f_evaluation_record` VALUES ('20', '1', '1', '20', '0');
INSERT INTO `f_evaluation_record` VALUES ('21', '1', '1', '0', '0');
INSERT INTO `f_evaluation_record` VALUES ('22', '1', '1', '0', '0');
INSERT INTO `f_evaluation_record` VALUES ('23', '1', '1', '10', '0');
INSERT INTO `f_evaluation_record` VALUES ('24', '1', '1', '20', '0');
INSERT INTO `f_evaluation_record` VALUES ('25', '1', '1', '15', '0');
INSERT INTO `f_evaluation_record` VALUES ('26', '1', '1', '20', '0');
INSERT INTO `f_evaluation_record` VALUES ('27', '1', '1', '25', '0');
INSERT INTO `f_evaluation_record` VALUES ('28', '1', '1', '26', '0');
INSERT INTO `f_evaluation_record` VALUES ('29', '1', '1', '26', '0');
INSERT INTO `f_evaluation_record` VALUES ('30', '1', '1', '26', '0');
INSERT INTO `f_evaluation_record` VALUES ('31', '1', '1', '28', '0');
INSERT INTO `f_evaluation_record` VALUES ('32', '1', '1', '28', '0');
INSERT INTO `f_evaluation_record` VALUES ('33', '1', '1', '28', '0');
INSERT INTO `f_evaluation_record` VALUES ('34', '1', '11', '50', '0');
INSERT INTO `f_evaluation_record` VALUES ('35', '1', '1', '0', '0');
INSERT INTO `f_evaluation_record` VALUES ('36', '1', '1', '0', '0');
INSERT INTO `f_evaluation_record` VALUES ('37', '1', '1', '5', '0');
INSERT INTO `f_evaluation_record` VALUES ('38', '1', '11', '0', '0');

-- ----------------------------
-- Table structure for `f_members`
-- ----------------------------

DROP TABLE IF EXISTS `f_members`;

CREATE TABLE `f_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` int(10) unsigned NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL,
  `email` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `is_available` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_members`
-- ----------------------------

INSERT INTO `f_members` VALUES ('1', 'fengyi', '123456', '0', '1545711693', '4', '0', '1719847255@qq.com', '贵州省贵阳市云岩区大营坡长冲农民新村40号', '18885175642', '1');
INSERT INTO `f_members` VALUES ('43', '小老二', '111111', '1', '1545711693', '2', '1', '234567890@qq.com', '贵州省贵阳市', '18208482313', '1');
INSERT INTO `f_members` VALUES ('44', '谢云芸', '111111', '1', '1545711693', '2', '0', '234567890@qq.com', '贵州省贵阳市', '14567890567', '1');
INSERT INTO `f_members` VALUES ('45', 'xieyunyun', '111111', '1', '1545711693', '2', '1', '34567890-@qq.com', '贵州省贵阳市', '15678900987', '1');
INSERT INTO `f_members` VALUES ('56', '嘿嘿嘿', '123456', '1', '1545711635', '4', '1', '345678@qq.com', '贵州省贵阳市', '16789676756', '1');
INSERT INTO `f_members` VALUES ('50', '园艺师', '111111', '0', '1545711635', '4', '1', '23456789@qq.com', '贵州省贵阳市', '14567898768', '1');
INSERT INTO `f_members` VALUES ('51', '普通会员', '111111', '0', '1545711693', '4', '0', '23456789@qq.com', '贵州省贵阳市', '14567890987', '1');
INSERT INTO `f_members` VALUES ('53', '铁素体', '123456', '0', '1544245140', '1', '1', '345678967@qq.com', '贵阳市', '18456789876', '1');
INSERT INTO `f_members` VALUES ('54', 'wwwwwww', '111111', '0', '1545711693', '1', '1', '234567654567@qq.com', '贵州省贵阳市', '13456789876', '1');
INSERT INTO `f_members` VALUES ('58', '啊啊啊啊', '111111', '0', '1545751060', '1', '1', '23456576786@qq.com', '贵州贵阳', '15889787879', '0');
INSERT INTO `f_members` VALUES ('69', '阿凡达房管局发广告', '111111', '0', '1546156829', '4', '0', '465587686796@qq.com', '工人一天一进入体育', '13565676765', '1');
INSERT INTO `f_members` VALUES ('67', '该如个人回电话', '111111', '0', '1545895898', '2', '0', '4345656876@qq.com', '广东人恢复添加附件', '15679789688', '0');
INSERT INTO `f_members` VALUES ('63', '反复反复付', '123456', '0', '1545895960', '2', '0', '4657676776@qq.com', '更好具体时间', '16895767658', '0');
INSERT INTO `f_members` VALUES ('68', '海豚音', '111111', '0', '1545895960', '4', '0', '43465465756@qq.com', '头发与人体一天如何', '14556884645', '1');

-- ----------------------------
-- Table structure for `f_members_type`
-- ----------------------------

DROP TABLE IF EXISTS `f_members_type`;

CREATE TABLE `f_members_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_members_type`
-- ----------------------------

INSERT INTO `f_members_type` VALUES ('1', '普通会员');
INSERT INTO `f_members_type` VALUES ('2', 'VIP会员');
INSERT INTO `f_members_type` VALUES ('4', '黄金会员');

-- ----------------------------
-- Table structure for `f_menus`
-- ----------------------------

DROP TABLE IF EXISTS `f_menus`;

CREATE TABLE `f_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sub_list` text COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_menus`
-- ----------------------------

INSERT INTO `f_menus` VALUES ('2', '系统管理', 'base_info@', 'system');

-- ----------------------------
-- Table structure for `f_news`
-- ----------------------------

DROP TABLE IF EXISTS `f_news`;

CREATE TABLE `f_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_news`
-- ----------------------------

INSERT INTO `f_news` VALUES ('1', '习近平离京出席APEC第26次非正式会议', '新华社北京11月15日电  11月15日，国家主席习近平乘专机离开北京，应巴布亚新几内亚独立国总督达达埃和总理奥尼尔、文莱达鲁萨兰国苏丹哈桑纳尔、菲律宾共和国总统杜特尔特邀请，对上述三国进行国事访问，并在巴新同建交太平洋岛国领导人会晤；应巴布亚新几内亚独立国总理奥尼尔邀请，出席在巴新莫尔兹比港举行的亚太经合组织第二十六次领导人非正式会议', '24557658769');
INSERT INTO `f_news` VALUES ('2', '【支持民营企业在行动】 商务部:支持民营经济发展', '商务部党组书记 部长 钟山：民营企业它们的贡献越来越大，国内贸易份额超过90%，外贸出口的份额占48%，对外投资份额占49%。我们要贯彻好总书记的重要讲话精神，支持它们在促进消费、扩大外贸、引进来和走出去等方面，有更大作为、做更大贡献。', '4577987080');

-- ----------------------------
-- Table structure for `f_order`
-- ----------------------------

DROP TABLE IF EXISTS `f_order`;

CREATE TABLE `f_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `shop_id` int(10) unsigned NOT NULL,
  `pay_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `shop_number` int(10) unsigned NOT NULL COMMENT '商品数量',
  `receiver` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '收货人',
  `total_money` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '总金额',
  `payable` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '支付方式',
  `dispatch_status` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '物流状态',
  `shop_method` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '配送方式',
  `pay_status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_status` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '发货状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_order`
-- ----------------------------

INSERT INTO `f_order` VALUES ('1', '201700917182229805', '34567890', '1', '1', '1', '0', '2', '冯毅', '234', '234', '0', '申通物流', '', '');
INSERT INTO `f_order` VALUES ('2', '201700917182229809', '1234567890', '', '0', '0', '', '0', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `f_role_author`
-- ----------------------------

DROP TABLE IF EXISTS `f_role_author`;

CREATE TABLE `f_role_author` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `resource_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `role_code` text COLLATE utf8_unicode_ci NOT NULL,
  `is_available` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `admin_id` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`role_name`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_role_author`
-- ----------------------------

INSERT INTO `f_role_author` VALUES ('1', '修改密码', '系统后台—Admin', '基础管理', '/index.php/admin/System/update_pass', '1', '');
INSERT INTO `f_role_author` VALUES ('2', '锁屏密码', '系统后台—Admin', '基础管理', '/index.php/admin/System/clock_pass@/index.php/admin/System/extraconfig', '1', '');
INSERT INTO `f_role_author` VALUES ('3', '添加会员', '系统后台—Admin', '用户管理', '/index.php/admin/Member/member_add', '1', '');
INSERT INTO `f_role_author` VALUES ('4', '编辑会员', '系统后台—Admin', '用户管理', '/index.php/admin/Member/member_edit@/index.php/admin/Member/member_password', '1', '');
INSERT INTO `f_role_author` VALUES ('5', '添加文章', '系统后台—Admin', '文章管理', '/index.php/admin/Article/article_add', '1', '');
INSERT INTO `f_role_author` VALUES ('6', '文章删除', '系统后台—Admin', '文章管理', '/index.php/admin/Article/article_delete', '1', '');
INSERT INTO `f_role_author` VALUES ('7', '订单添加', '系统后台—Admin', '订单管理', '/index.php/admin/Order/order_add', '1', '');
INSERT INTO `f_role_author` VALUES ('8', '查看管理员', '系统后台—Admin', '权限管理', '/index.php/admin/Admin/admin_list@/index.php/admin/Admin/index@/index.php/admin/Admin/admin_view', '1', '');
INSERT INTO `f_role_author` VALUES ('9', '查看角色', '系统后台—Admin', '权限管理', '/index.php/admin/Admin/admin_role_list', '1', '');
INSERT INTO `f_role_author` VALUES ('10', '网站基础设置', '系统后台—Admin', '系统管理', '/index.php/admin/System/index', '1', '');
INSERT INTO `f_role_author` VALUES ('11', '数据备份', '系统后台—Admin', '系统管理', '/index.php/admin/System/backups@/index.php/admin/System/export_database', '1', '');
INSERT INTO `f_role_author` VALUES ('12', '添加试卷', '系统后台—Admin', '测评管理', '/index.php/admin/Evaluation/evaluation_add', '1', '');
INSERT INTO `f_role_author` VALUES ('13', '查看微信粉丝', '系统后台—Admin', '微信管理', '/index.php/admin/Wechat/fans_list', '1', '');
INSERT INTO `f_role_author` VALUES ('14', '恢复删除会员', '系统后台—Admin', '回收站', '/index.php/admin/Recycle/delete_member_recover', '1', '');
INSERT INTO `f_role_author` VALUES ('15', '查看会员', '系统后台—Admin', '用户管理', '/index.php/admin/Member/member_list@/index.php/admin/Member/member_info@/index.php/admin/Member/member_view', '1', '');
INSERT INTO `f_role_author` VALUES ('16', '会员数据导出', '系统后台—Admin', '用户管理', '/index.php/admin/Member/export', '1', '');
INSERT INTO `f_role_author` VALUES ('17', '查看会员类型', '系统后台—Admin', '用户管理', '/index.php/admin/Member/member_type', '1', '');
INSERT INTO `f_role_author` VALUES ('18', '添加会员类型', '系统后台—Admin', '用户管理', '/index.php/admin/Member/type_add', '1', '');
INSERT INTO `f_role_author` VALUES ('19', '删除会员类型', '系统后台—Admin', '用户管理', '/index.php/admin/Member/type_delete', '1', '');
INSERT INTO `f_role_author` VALUES ('20', '删除会员', '系统后台—Admin', '用户管理', '/index.php/admin/Member/delete_all@/index.php/admin/Member/delete_member_list', '1', '');
INSERT INTO `f_role_author` VALUES ('21', '登入功能', '系统后台—Admin', '基础管理', '/index.php/admin/Login/login@/index.php/admin/Login/base_login@/index.php/admin/Login/last_login_info@/index.php/admin/Login/count_login@/index.php/admin/Login/extraconfig@/index.php/admin/Login/index', '1', '');
INSERT INTO `f_role_author` VALUES ('22', '退出系统功能', '系统后台—Admin', '基础管理', '/index.php/admin/Login/logout', '1', '');
INSERT INTO `f_role_author` VALUES ('23', '清除缓存', '系统后台—Admin', '基础管理', '/index.php/admin/Index/clear_cache@/index.php/admin/Index/del_runtime', '1', '');
INSERT INTO `f_role_author` VALUES ('24', '显示主页', '系统后台—Admin', '基础管理', '/index.php/admin/Index/index@/index.php/admin/Index/welcome', '1', '');
INSERT INTO `f_role_author` VALUES ('25', '设置休眠时间', '系统后台—Admin', '基础管理', '/index.php/admin/Index/max_time@/index.php/admin/System/sleep_timeout', '1', '');
INSERT INTO `f_role_author` VALUES ('26', '个人信息', '系统后台—Admin', '基础管理', '/index.php/admin/Admin/admin_info@/index.php/admin/Admin/up_photos@/index.php/admin/Admin/base_info', '1', '');
INSERT INTO `f_role_author` VALUES ('27', '在线测评', '系统后台—Admin', '基础管理', '/index.php/admin/Admin/get_options@/index.php/admin/Admin/cutstr_html@/index.php/admin/Admin/hand_exams@/index.php/admin/Admin/join_evaluation@/index.php/admin/Admin/evaluation@/index.php/admin/Admin/evaluation_record', '1', '');
INSERT INTO `f_role_author` VALUES ('28', '查看系统公告', '系统后台—Admin', '基础管理', '/index.php/admin/System/message_detial@/index.php/admin/System/system_message@/index.php/admin/System/export_pdf', '1', '');
INSERT INTO `f_role_author` VALUES ('29', '查看订单', '系统后台—Admin', '订单管理', '/index.php/admin/Order/index', '1', '');
INSERT INTO `f_role_author` VALUES ('30', '删除订单', '系统后台—Admin', '订单管理', '/index.php/admin/Order/delete', '1', '');
INSERT INTO `f_role_author` VALUES ('31', '测评列表', '系统后台—Admin', '测评管理', '/index.php/admin/Evaluation/index', '1', '');
INSERT INTO `f_role_author` VALUES ('32', '添加试卷', '系统后台—Admin', '测评管理', '/index.php/admin/Evaluation/evaluation_add', '1', '');
INSERT INTO `f_role_author` VALUES ('33', '编辑试卷', '系统后台—Admin', '测评管理', '/index.php/admin/Evaluation/evaluation_edit@/index.php/admin/Evaluation/evaluation_toggle', '1', '');
INSERT INTO `f_role_author` VALUES ('34', '删除试卷', '系统后台—Admin', '测评管理', '/index.php/admin/Evaluation/evaluation_delete@/index.php/admin/Evaluation/delete_all', '1', '');
INSERT INTO `f_role_author` VALUES ('35', '在线聊天', '系统后台—Admin', '基础管理', '/index.php/admin/Admin/web_chat', '1', '');
INSERT INTO `f_role_author` VALUES ('36', '发布系统公告', '系统后台—Admin', '系统管理', '/index.php/admin/System/add_system_message', '1', '');
INSERT INTO `f_role_author` VALUES ('37', '数据库恢复', '系统后台—Admin', '系统管理', '/index.php/admin/System/database_import', '1', '');
INSERT INTO `f_role_author` VALUES ('38', 'Sql文件下载', '系统后台—Admin', '系统管理', '/index.php/admin/System/downdload_files', '1', '');
INSERT INTO `f_role_author` VALUES ('39', 'Sql文件删除', '系统后台—Admin', '系统管理', '/index.php/admin/System/file_delete', '1', '');

-- ----------------------------
-- Table structure for `f_role_group`
-- ----------------------------

DROP TABLE IF EXISTS `f_role_group`;

CREATE TABLE `f_role_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `acl` text COLLATE utf8_unicode_ci,
  `status` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `is_available` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`role_name`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_role_group`
-- ----------------------------

INSERT INTO `f_role_group` VALUES ('1', '超级管理员', 'all', '1', '具有至高无上的权利', '1');
INSERT INTO `f_role_group` VALUES ('10', '普通管理员', '/index.php/admin/System/update_pass@/index.php/admin/System/clock_pass@/index.php/admin/System/extraconfig@/index.php/admin/Login/login@/index.php/admin/Login/base_login@/index.php/admin/Login/last_login_info@/index.php/admin/Login/count_login@/index.php/admin/Login/extraconfig@/index.php/admin/Login/index@/index.php/admin/Login/logout@/index.php/admin/Index/clear_cache@/index.php/admin/Index/del_runtime@/index.php/admin/Index/index@/index.php/admin/Index/welcome@/index.php/admin/Index/max_time@/index.php/admin/System/sleep_timeout@/index.php/admin/Admin/admin_info@/index.php/admin/Admin/up_photos@/index.php/admin/Admin/base_info@/index.php/admin/Admin/get_options@/index.php/admin/Admin/cutstr_html@/index.php/admin/Admin/hand_exams@/index.php/admin/Admin/join_evaluation@/index.php/admin/Admin/evaluation@/index.php/admin/Admin/evaluation_record@/index.php/admin/System/message_detial@/index.php/admin/System/system_message@/index.php/admin/System/export_pdf@/index.php/admin/Admin/web_chat@/index.php/admin/Article/article_add@/index.php/admin/Article/article_delete@/index.php/admin/Member/member_add@/index.php/admin/Member/member_edit@/index.php/admin/Member/member_password@/index.php/admin/Member/member_list@/index.php/admin/Member/member_info@/index.php/admin/Member/member_view@/index.php/admin/Member/export@/index.php/admin/Member/member_type@/index.php/admin/Member/type_add@/index.php/admin/Member/type_delete@/index.php/admin/Member/delete_all@/index.php/admin/Member/delete_member_list@/index.php/admin/Order/order_add@/index.php/admin/Order/index@/index.php/admin/Order/delete@/index.php/admin/System/index@/index.php/admin/System/backups@/index.php/admin/System/export_database@/index.php/admin/System/add_system_message@/index.php/admin/System/database_import@/index.php/admin/System/downdload_files@/index.php/admin/System/file_delete@/index.php/admin/Evaluation/evaluation_add@/index.php/admin/Evaluation/index@/index.php/admin/Evaluation/evaluation_add@/index.php/admin/Evaluation/evaluation_edit@/index.php/admin/Evaluation/evaluation_toggle@/index.php/admin/Evaluation/evaluation_delete@/index.php/admin/Evaluation/delete_all@/index.php/admin/Wechat/fans_list@/index.php/admin/Recycle/delete_member_recover', '1', '拥有除权限管理之外的所有权利', '1');
INSERT INTO `f_role_group` VALUES ('11', '编辑管理员', '/index.php/admin/System/update_pass@/index.php/admin/System/clock_pass@/index.php/admin/System/extraconfig@/index.php/admin/Login/login@/index.php/admin/Login/base_login@/index.php/admin/Login/last_login_info@/index.php/admin/Login/count_login@/index.php/admin/Login/extraconfig@/index.php/admin/Login/index@/index.php/admin/Login/logout@/index.php/admin/Index/clear_cache@/index.php/admin/Index/del_runtime@/index.php/admin/Index/index@/index.php/admin/Index/welcome@/index.php/admin/Index/max_time@/index.php/admin/System/sleep_timeout@/index.php/admin/Admin/admin_info@/index.php/admin/Admin/up_photos@/index.php/admin/Admin/base_info@/index.php/admin/Admin/get_options@/index.php/admin/Admin/cutstr_html@/index.php/admin/Admin/hand_exams@/index.php/admin/Admin/join_evaluation@/index.php/admin/Admin/evaluation@/index.php/admin/Admin/evaluation_record@/index.php/admin/System/message_detial@/index.php/admin/System/system_message@/index.php/admin/System/export_pdf@/index.php/admin/Admin/web_chat@/index.php/admin/Article/article_add@/index.php/admin/Article/article_delete', '1', '具有文章管理的权限', '1');
INSERT INTO `f_role_group` VALUES ('12', '销售管理员', '/index.php/admin/System/update_pass@/index.php/admin/System/clock_pass@/index.php/admin/System/extraconfig@/index.php/admin/Login/login@/index.php/admin/Login/base_login@/index.php/admin/Login/last_login_info@/index.php/admin/Login/count_login@/index.php/admin/Login/extraconfig@/index.php/admin/Login/index@/index.php/admin/Login/logout@/index.php/admin/Index/clear_cache@/index.php/admin/Index/del_runtime@/index.php/admin/Index/index@/index.php/admin/Index/welcome@/index.php/admin/Index/max_time@/index.php/admin/System/sleep_timeout@/index.php/admin/Admin/admin_info@/index.php/admin/Admin/up_photos@/index.php/admin/Admin/base_info@/index.php/admin/Admin/get_options@/index.php/admin/Admin/cutstr_html@/index.php/admin/Admin/hand_exams@/index.php/admin/Admin/join_evaluation@/index.php/admin/Admin/evaluation@/index.php/admin/Admin/evaluation_record@/index.php/admin/System/message_detial@/index.php/admin/System/system_message@/index.php/admin/System/export_pdf@/index.php/admin/Admin/web_chat@/index.php/admin/Member/member_add@/index.php/admin/Member/member_edit@/index.php/admin/Member/member_password@/index.php/admin/Member/member_list@/index.php/admin/Member/member_info@/index.php/admin/Member/member_view@/index.php/admin/Member/export@/index.php/admin/Member/member_type@/index.php/admin/Member/type_add@/index.php/admin/Member/type_delete@/index.php/admin/Member/delete_all@/index.php/admin/Member/delete_member_list@/index.php/admin/Order/order_add@/index.php/admin/Order/index@/index.php/admin/Order/delete', '1', '具有会员和订单的权限', '1');
INSERT INTO `f_role_group` VALUES ('13', '微信公众号管理员', '/index.php/admin/System/update_pass@/index.php/admin/System/clock_pass@/index.php/admin/System/extraconfig@/index.php/admin/Login/login@/index.php/admin/Login/base_login@/index.php/admin/Login/last_login_info@/index.php/admin/Login/count_login@/index.php/admin/Login/extraconfig@/index.php/admin/Login/index@/index.php/admin/Login/logout@/index.php/admin/Index/clear_cache@/index.php/admin/Index/del_runtime@/index.php/admin/Index/index@/index.php/admin/Index/welcome@/index.php/admin/Index/max_time@/index.php/admin/System/sleep_timeout@/index.php/admin/Admin/admin_info@/index.php/admin/Admin/up_photos@/index.php/admin/Admin/base_info@/index.php/admin/Admin/get_options@/index.php/admin/Admin/cutstr_html@/index.php/admin/Admin/hand_exams@/index.php/admin/Admin/join_evaluation@/index.php/admin/Admin/evaluation@/index.php/admin/Admin/evaluation_record@/index.php/admin/System/message_detial@/index.php/admin/System/system_message@/index.php/admin/System/export_pdf@/index.php/admin/Admin/web_chat@/index.php/admin/Wechat/fans_list', '1', '具有微信公众号相关的权限', '1');
INSERT INTO `f_role_group` VALUES ('14', '培训管理员', '/index.php/admin/System/update_pass@/index.php/admin/System/clock_pass@/index.php/admin/System/extraconfig@/index.php/admin/Login/login@/index.php/admin/Login/base_login@/index.php/admin/Login/last_login_info@/index.php/admin/Login/count_login@/index.php/admin/Login/extraconfig@/index.php/admin/Login/index@/index.php/admin/Login/logout@/index.php/admin/Index/clear_cache@/index.php/admin/Index/del_runtime@/index.php/admin/Index/index@/index.php/admin/Index/welcome@/index.php/admin/Index/max_time@/index.php/admin/System/sleep_timeout@/index.php/admin/Admin/admin_info@/index.php/admin/Admin/up_photos@/index.php/admin/Admin/base_info@/index.php/admin/Admin/get_options@/index.php/admin/Admin/cutstr_html@/index.php/admin/Admin/hand_exams@/index.php/admin/Admin/join_evaluation@/index.php/admin/Admin/evaluation@/index.php/admin/Admin/evaluation_record@/index.php/admin/System/message_detial@/index.php/admin/System/system_message@/index.php/admin/System/export_pdf@/index.php/admin/Evaluation/evaluation_add@/index.php/admin/Evaluation/index@/index.php/admin/Evaluation/evaluation_add@/index.php/admin/Evaluation/evaluation_edit@/index.php/admin/Evaluation/evaluation_toggle@/index.php/admin/Evaluation/evaluation_delete@/index.php/admin/Evaluation/delete_all', '1', '具有培训测评相关的权限', '1');

-- ----------------------------
-- Table structure for `f_smtp_config`
-- ----------------------------

DROP TABLE IF EXISTS `f_smtp_config`;

CREATE TABLE `f_smtp_config` (
  `id` int(10) unsigned NOT NULL DEFAULT '1',
  `smtp_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_port` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `send_email_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `send_nickname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reply_address` varchar(50) CHARACTER SET utf8 NOT NULL,
  `reply_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_smtp_config`
-- ----------------------------

INSERT INTO `f_smtp_config` VALUES ('1', 'smtp.qq.com', '465', 'gpfnatajjnmcdcac', '1719847255@qq.com', 'flyfly~~~', 'fy7276945201314', '1719847255@qq.com', '');

-- ----------------------------
-- Table structure for `f_system_message`
-- ----------------------------

DROP TABLE IF EXISTS `f_system_message`;

CREATE TABLE `f_system_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `create_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `read_ids` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_system_message`
-- ----------------------------

INSERT INTO `f_system_message` VALUES ('1', '招投标平台电子发票系统升级公告', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &amp;quot;Microsoft Yahei&amp;quot;, arial, verdana; line-height: 30px; word-break: break-all; text-align: justify; color: rgb(52, 52, 52); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;尊敬的用户：&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &amp;quot;Microsoft Yahei&amp;quot;, arial, verdana; line-height: 30px; word-break: break-all; text-align: justify; color: rgb(52, 52, 52); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 由于平台电子发票系统升级改造及年底财务结算安排，自2018年11月16日至12月31日，平台将暂停开具发票。如您在该日期之后支付了会员认证和CA证书业务款项，平台预计将于2019年1月1日之后按照支付顺序为您开具电子发票。标书费及中标服务费发票由招标代理机构正常开具。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &amp;quot;Microsoft Yahei&amp;quot;, arial, verdana; line-height: 30px; word-break: break-all; text-align: justify; color: rgb(52, 52, 52); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;由此带来的不便我们深表歉意。如有疑问，请拨打平台热线4000-555-811。&lt;/p&gt;', '1', '1542639007', '1', '11,1,10,');
INSERT INTO `f_system_message` VALUES ('2', '【系统维护升级20181102】', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 30px; word-break: break-all; text-align: justify;&quot;&gt;尊敬的平台用户大家好：&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;br/&gt;&amp;nbsp;&amp;nbsp;为向大家提供更为优质的平台服务，平台定于2018年11月02日（周五）晚上19:00—21:00进行升级维护，期间平台上无法进行招投标相关业务操作，请各位安排好相应工作。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p class=&quot;mt30&quot; style=&quot;margin-top: 30px; margin-bottom: 0px; padding: 0px; line-height: 30px; word-break: break-all; text-align: justify;&quot;&gt;附件：&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '1542639007', '1', '11,10,');
INSERT INTO `f_system_message` VALUES ('3', '2018年中国兵器电子招投标平台国庆节放假通知', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 30px; word-break: break-all; text-align: justify;&quot;&gt;各位会员：&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 30px; word-break: break-all; text-align: justify;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 按照平台及国家法定节假日安排，国庆节假期为2018年09月29日至2018年10月07日，放假期间做如下安排：&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 30px; word-break: break-all; text-align: justify;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 1.&amp;nbsp;&amp;nbsp; 平台CA数字证书暂停办理，招标投标业务可在平台正常进行；&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 30px; word-break: break-all; text-align: justify;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 2.&amp;nbsp;&amp;nbsp;&amp;nbsp;各申请审核会有所延迟；&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 30px; word-break: break-all; text-align: justify;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 3.&amp;nbsp;&amp;nbsp;&amp;nbsp;缴费业务到账时间以各银行交易时间为准；&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 30px; word-break: break-all; text-align: justify;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 4.&amp;nbsp;&amp;nbsp; 2018年10月08日平台业务恢复正常；&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 30px; word-break: break-all; text-align: justify;&quot;&gt;如有问题可拨打平台热线进行咨询：4000-555-811。感谢大家对平台的支持。预祝大家国庆节节日快乐。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 30px; word-break: break-all; text-align: justify;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 30px; word-break: break-all; text-align: justify;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 中国兵器电子招标投标交易平台&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 30px; word-break: break-all; text-align: justify;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;2018年9月27日&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p class=&quot;mt30&quot; style=&quot;margin-top: 30px; margin-bottom: 0px; padding: 0px; line-height: 30px; word-break: break-all; text-align: justify;&quot;&gt;附件：&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '1543760898', '1', '1,11,10,');
INSERT INTO `f_system_message` VALUES ('12', '关于新上任HR可免费下载人才库的公告', '&lt;p&gt;尊敬的用户：&lt;/p&gt;&lt;p&gt;你好！&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: center;&quot;&gt;铜仁人力资源网&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;为了给您提供更加优质、高效的服务，经铜仁人力资源网团队研究决定：&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;公司新上任HR可免费下载人才库简历，指铜仁人力资源网提供30-50份简历供HR下载，以支持HR在新公司早期工作的展开。注：仅限于在铜仁人力资源网注册过的用户。&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px;&quot;&gt;铜仁人力资源网&lt;/strong&gt;&lt;a href=&quot;http://www.trhrw.com/&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(51, 51, 51); text-decoration-line: none; outline: none;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px;&quot;&gt;www.trhrw.com&lt;/strong&gt;&lt;/a&gt;&amp;nbsp;因您而更精彩，我们将继续以客户为中心，不断提升用户体验与服务，感谢您的支持与信任！如有任何疑问，请联系在线客服或直接拨打客服热线：0856-8122866&lt;br/&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: center; color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;特此公告。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: right;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; text-indent: 32px; background-color: rgb(255, 255, 255);&quot;&gt;2018年11月19日&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;铜仁人力资源网&lt;/p&gt;&lt;p&gt;2018-11-19&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '1544072856', '1', '1,11,');
INSERT INTO `f_system_message` VALUES ('13', '铜仁人力资源网_双11招聘节来啦！让我们一起约惠吧！', '&lt;p&gt;尊敬的用户：&lt;/p&gt;&lt;p&gt;你好！&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: center;&quot;&gt;双11招聘节来啦！惠战到底，让我们一起约惠吧！&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: center;&quot;&gt;&lt;img title=&quot;1541475257784088.jpg&quot; alt=&quot;活动 买一送一.jpg&quot; src=&quot;https://www.trhrw.com/data/upload/ueditor/20181106/1541475257784088.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;铜仁人力资源网&lt;/p&gt;&lt;p&gt;2018-11-06&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '1544073041', '1', '1,11,');
INSERT INTO `f_system_message` VALUES ('14', '关于开放企业免费查看投递简历的公告', '&lt;p&gt;尊敬的用户：&lt;/p&gt;&lt;p&gt;你好！&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: center;&quot;&gt;铜仁人力资源网&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;为了给您提供更加优质、高效的服务，经铜仁人力资源网团队研究决定：&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px;&quot;&gt;1、企业免费查看投递简历&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;即：求职者主动投递简历给企业，该企业可以免费查看联系方式。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px;&quot;&gt;2、企业上传营业执照&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;即：&lt;/span&gt;可获得1000积分，积分可以兑换简历下载点数&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px;&quot;&gt;3、企业发布职位&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;即：&lt;/span&gt;可获得200积分/职位，积分可以兑换简历下载点数&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px;&quot;&gt;铜仁人力资源网&lt;/strong&gt;&lt;a href=&quot;http://www.trhrw.com/&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(51, 51, 51); text-decoration-line: none; outline: none;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px;&quot;&gt;www.trhrw.com&lt;/strong&gt;&lt;/a&gt;&amp;nbsp;因您而更精彩，我们将继续以客户为中心，不断提升用户体验与服务，感谢您的支持与信任！如有任何疑问，请联系在线客服或直接拨打客服热线：0856-8122866&lt;br/&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: center; color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;特此公告。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: right;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; text-indent: 32px; background-color: rgb(255, 255, 255);&quot;&gt;2018年11月1日&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: center;&quot;&gt;&lt;img title=&quot;1541396963227024.jpg&quot; alt=&quot;1541063779918215.jpg&quot; src=&quot;/ueditor/php/upload/image/20181206/1544078513.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;铜仁人力资源网&lt;/p&gt;&lt;p&gt;2018-11-05&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '1544078513', '1', '1,11,');
INSERT INTO `f_system_message` VALUES ('15', '关于铜仁人力资源网升级改版的公告', '&lt;p&gt;尊敬的用户：&lt;/p&gt;&lt;p&gt;你好！&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;为了给您提供更加优质、高效的服务，铜仁人力资源网技术团队于3月23日至3月24日，对网站系统进行优化和升级。如有特殊情况造成延迟，将另行公告！届时，铜仁人力资源网将以全新的面貌与广大用户见面，敬请期待！由此给您带来的不便，我们深表歉意。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;铜仁人力资源网&amp;nbsp;&lt;a href=&quot;http://www.trhrw.com/&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(51, 51, 51); text-decoration-line: none; outline: none;&quot;&gt;www.trhrw.com&lt;/a&gt;&amp;nbsp; 因您而更精彩，我们将继续以客户为中心，不断提升用户体验与服务，感谢您的支持与信任！如有任何疑问，请联系在线客服或直接拨打客服热线：0856-8122866&lt;br/&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: center; color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;特此公告。&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：后台新闻、公告、单页面编辑器增加附件功能&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：后台查看投递简历是否收费可自定义按照会员等级设置&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：天眼查接口增加当前系统企业名录判断，防止接口被他人利用&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：后台添加独立后台分站操作权限&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：后台添加后******立分站管理员相关操作&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：后台批量审核增加控制防止多次点击造成多次通知发送&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：企业职位刷新等服务购买强化权限验证&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：后台系统配置JS、CSS路径引用改为相对路径 防止因 HTTP HTTPS切换导致的无法修改后台地址&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：取消企业邮箱必填&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台单页面编辑器内容复制粘贴有丢失&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;新增：后台订单导出功能&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台新闻关键字自动检索乱码&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：WAP端会员中心充值积分未选择支付方式依然可以提交表单&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：UC整合在PHP7.0版本下的数据库连接问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：UC整合WAP端激活身份问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：简历导出WORD 文档姓名与内容不符&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：企业资料修改199号段不支持&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：用户注册等字符长度判断&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：简历查看联系方式刷新问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：会员中心职位延期界面错位&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：地图搜索未判定职位有效状态&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台设置定图默认坐标定位无效&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台数据调用相关问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：简历创建工作类型过多导致错位&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台模板DIY 样式兼容问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：会员中心企业产品链接问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：PC端企业会员中心地图展示的是wap端界面&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台广告添加问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：PC首页登录框未开启验证码下显示问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：WAP端公共内容图片不显示&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：WAP端招聘会参会企业部分环境下不显示职位&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：安装权限判断问题（如果已删除install目录请忽视，建议删除）&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台一项权限判断&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台个人会员锁定邮件通知未显示锁定原因&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：职位详情因采集、导入等信息不全导致的页面错位&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：微信扫码登录 账户激活问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：PHP7版本下 CURL函数调用问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：LINUX环境下 后台部分操作提示出错&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台修改简历 二级地区不显示&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：招聘会详情页图片大小比例问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;铜仁人力资源网&lt;/p&gt;&lt;p&gt;2018-03-23&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '1544078689', '1', '1,11,17,');

-- ----------------------------
-- Table structure for `f_web_info`
-- ----------------------------

DROP TABLE IF EXISTS `f_web_info`;

CREATE TABLE `f_web_info` (
  `id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `web_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `web_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `web_record` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '网站基础信息表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_web_info`
-- ----------------------------

INSERT INTO `f_web_info` VALUES ('1', 'FlyFly v0.1', '你猜不着，你管不着！！！', '京ICP备08001421号');

