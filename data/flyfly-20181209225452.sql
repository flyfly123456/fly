-- ----------------------------
-- 日期：2018-12-09 22:54:52
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
  `sex` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `role_group_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `is_super` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `last_login_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `img_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_admin`
-- ----------------------------

INSERT INTO `f_admin` VALUES ('1', 'admin', 'MTIzNDU2', '1', '18840918752', '1719847255@qq.com', '1', '1542655038', '1', '1', '1544367278', '20181202\0457073da7fde88c2485ca21d8f97269.jpg', '具有至高无上的管理权力！！！');
INSERT INTO `f_admin` VALUES ('11', 'xiaoshou', 'MTExMTEx', '0', '18578999999', '2345678@qq.com', '12', '1543566477', '0', '1', '1544228665', '20181202\92d61df595f41fb9a3c065ca86e9ada5.jpg', '销售管理员');
INSERT INTO `f_admin` VALUES ('10', 'bianji', 'MTIzNDU2', '1', '18885175642', '2345678@qq.com', '11', '1543565944', '0', '1', '1544071302', '', '');

-- ----------------------------
-- Table structure for `f_admin_role`
-- ----------------------------

DROP TABLE IF EXISTS `f_admin_role`;

CREATE TABLE `f_admin_role` (
  `admin_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`admin_id`,`role_id`)
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_members`
-- ----------------------------

INSERT INTO `f_members` VALUES ('1', 'fengyi', '123456', '0', '1970', '4', '1', '1719847255@qq.com', '贵州省贵阳市云岩区大营坡长冲农民新村40号', '18885175642');
INSERT INTO `f_members` VALUES ('43', '小老二', '111111', '1', '2018', '2', '1', '234567890@qq.com', '贵州省贵阳市', '18208482313');
INSERT INTO `f_members` VALUES ('44', '谢云芸', '111111', '1', '2018', '2', '0', '234567890@qq.com', '贵州省贵阳市', '14567890567');
INSERT INTO `f_members` VALUES ('45', 'xieyunyun', '111111', '1', '1970', '2', '1', '34567890-@qq.com', '贵州省贵阳市', '15678900987');
INSERT INTO `f_members` VALUES ('50', '申达股份好几款', '111111', '0', '2018', '4', '1', '23456789@qq.com', '贵州省贵阳市', '14567898768');
INSERT INTO `f_members` VALUES ('51', '普通会员', '111111', '0', '2018', '4', '0', '23456789@qq.com', '贵州省贵阳市', '14567890987');
INSERT INTO `f_members` VALUES ('53', '铁素体', '123456', '0', '1544245140', '1', '1', '345678967@qq.com', '贵阳市', '18456789876');
INSERT INTO `f_members` VALUES ('54', 'wwwwwww', '111111', '0', '2018', '1', '1', '234567654567@qq.com', '贵州省贵阳市', '13456789876');

-- ----------------------------
-- Table structure for `f_members_type`
-- ----------------------------

DROP TABLE IF EXISTS `f_members_type`;

CREATE TABLE `f_members_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
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
  `admin_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`admin_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_role_author`
-- ----------------------------

INSERT INTO `f_role_author` VALUES ('1', '1');
INSERT INTO `f_role_author` VALUES ('2', '2');
INSERT INTO `f_role_author` VALUES ('3', '3');

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_role_group`
-- ----------------------------

INSERT INTO `f_role_group` VALUES ('1', '超级管理员', 'all', '1', '具有至高无上的权利');
INSERT INTO `f_role_group` VALUES ('10', '普通管理员', '/index.php/admin/Admin/system_mess@/index.php/admin/Admin/admin_info@/index.php/admin/System/update_pass@/index.php/admin/System/clock_pass@/index.php/admin/System/extraconfig@/index.php/admin/Article/index@/index.php/admin/Article/article_add@/index.php/admin/Article/article_edit@/index.php/admin/Article/article_delete@/index.php/admin/Article/article_toggle@/index.php/admin/Member/index@/index.php/admin/Member/member_type@/index.php/admin/Member/member_add@/index.php/admin/Member/member_edit@/index.php/admin/Member/member_toggle@/index.php/admin/Member/member_password@/index.php/admin/Member/member_delete@/index.php/admin/Member/export@/index.php/admin/Order/index@/index.php/admin/Order/delete@/index.php/admin/System/index@/index.php/admin/Point/index@/index.php/admin/System/add_system_message@/index.php/admin/System/log@/index.php/admin/System/echarts@/index.php/admin/System/backups@/index.php/admin/System/export_database@/index.php/admin/System/database_import@/index.php/admin/System/downdload_files@/index.php/admin/System/downdload_files@/index.php/admin/System/file_delete@/index.php/admin/System/sqlReback@/index.php/admin/Wechat/base_config@/index.php/admin/Wechat/menu_config@/index.php/admin/Wechat/fans_list', '1', '拥有除权限管理之外的所有权利');
INSERT INTO `f_role_group` VALUES ('11', '编辑管理员', '/index.php/admin/Admin/system_mess@/index.php/admin/Admin/admin_info@/index.php/admin/System/update_pass@/index.php/admin/System/clock_pass@/index.php/admin/System/extraconfig@/index.php/admin/Article/index@/index.php/admin/Article/article_add@/index.php/admin/Article/article_edit@/index.php/admin/Article/article_delete@/index.php/admin/Article/article_toggle', '1', '具有文章管理的权限');
INSERT INTO `f_role_group` VALUES ('12', '销售管理员', '/index.php/admin/Admin/system_mess@/index.php/admin/Admin/admin_info@/index.php/admin/System/update_pass@/index.php/admin/System/clock_pass@/index.php/admin/System/extraconfig@/index.php/admin/Member/index@/index.php/admin/Member/member_type@/index.php/admin/Member/member_add@/index.php/admin/Member/member_edit@/index.php/admin/Member/member_toggle@/index.php/admin/Member/member_password@/index.php/admin/Member/member_delete@/index.php/admin/Member/export@/index.php/admin/Order/index@/index.php/admin/Order/delete', '1', '具有会员和订单的权限');

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
INSERT INTO `f_system_message` VALUES ('14', '关于开放企业免费查看投递简历的公告', '&lt;p&gt;尊敬的用户：&lt;/p&gt;&lt;p&gt;你好！&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: center;&quot;&gt;铜仁人力资源网&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;为了给您提供更加优质、高效的服务，经铜仁人力资源网团队研究决定：&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px;&quot;&gt;1、企业免费查看投递简历&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;即：求职者主动投递简历给企业，该企业可以免费查看联系方式。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px;&quot;&gt;2、企业上传营业执照&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;即：&lt;/span&gt;可获得1000积分，积分可以兑换简历下载点数&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px;&quot;&gt;3、企业发布职位&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;即：&lt;/span&gt;可获得200积分/职位，积分可以兑换简历下载点数&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;admin_web_tip&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px;&quot;&gt;铜仁人力资源网&lt;/strong&gt;&lt;a href=&quot;http://www.trhrw.com/&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(51, 51, 51); text-decoration-line: none; outline: none;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px;&quot;&gt;www.trhrw.com&lt;/strong&gt;&lt;/a&gt;&amp;nbsp;因您而更精彩，我们将继续以客户为中心，不断提升用户体验与服务，感谢您的支持与信任！如有任何疑问，请联系在线客服或直接拨打客服热线：0856-8122866&lt;br/&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: center; color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;特此公告。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: right;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; text-indent: 32px; background-color: rgb(255, 255, 255);&quot;&gt;2018年11月1日&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: center;&quot;&gt;&lt;img title=&quot;1541396963227024.jpg&quot; alt=&quot;1541063779918215.jpg&quot; src=&quot;/ueditor/php/upload/image/20181206/1544078513.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;铜仁人力资源网&lt;/p&gt;&lt;p&gt;2018-11-05&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '1544078513', '1', '1,');
INSERT INTO `f_system_message` VALUES ('15', '关于铜仁人力资源网升级改版的公告', '&lt;p&gt;尊敬的用户：&lt;/p&gt;&lt;p&gt;你好！&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;为了给您提供更加优质、高效的服务，铜仁人力资源网技术团队于3月23日至3月24日，对网站系统进行优化和升级。如有特殊情况造成延迟，将另行公告！届时，铜仁人力资源网将以全新的面貌与广大用户见面，敬请期待！由此给您带来的不便，我们深表歉意。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;铜仁人力资源网&amp;nbsp;&lt;a href=&quot;http://www.trhrw.com/&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(51, 51, 51); text-decoration-line: none; outline: none;&quot;&gt;www.trhrw.com&lt;/a&gt;&amp;nbsp; 因您而更精彩，我们将继续以客户为中心，不断提升用户体验与服务，感谢您的支持与信任！如有任何疑问，请联系在线客服或直接拨打客服热线：0856-8122866&lt;br/&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: center; color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); text-indent: 2em; background-color: rgb(255, 255, 255);&quot;&gt;特此公告。&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：后台新闻、公告、单页面编辑器增加附件功能&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：后台查看投递简历是否收费可自定义按照会员等级设置&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：天眼查接口增加当前系统企业名录判断，防止接口被他人利用&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：后台添加独立后台分站操作权限&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：后台添加后******立分站管理员相关操作&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：后台批量审核增加控制防止多次点击造成多次通知发送&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：企业职位刷新等服务购买强化权限验证&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：后台系统配置JS、CSS路径引用改为相对路径 防止因 HTTP HTTPS切换导致的无法修改后台地址&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;优化：取消企业邮箱必填&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台单页面编辑器内容复制粘贴有丢失&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;新增：后台订单导出功能&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台新闻关键字自动检索乱码&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：WAP端会员中心充值积分未选择支付方式依然可以提交表单&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：UC整合在PHP7.0版本下的数据库连接问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：UC整合WAP端激活身份问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：简历导出WORD 文档姓名与内容不符&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：企业资料修改199号段不支持&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：用户注册等字符长度判断&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：简历查看联系方式刷新问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：会员中心职位延期界面错位&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：地图搜索未判定职位有效状态&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台设置定图默认坐标定位无效&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台数据调用相关问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：简历创建工作类型过多导致错位&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台模板DIY 样式兼容问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：会员中心企业产品链接问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：PC端企业会员中心地图展示的是wap端界面&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台广告添加问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：PC首页登录框未开启验证码下显示问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：WAP端公共内容图片不显示&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：WAP端招聘会参会企业部分环境下不显示职位&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：安装权限判断问题（如果已删除install目录请忽视，建议删除）&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台一项权限判断&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台个人会员锁定邮件通知未显示锁定原因&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：职位详情因采集、导入等信息不全导致的页面错位&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：微信扫码登录 账户激活问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：PHP7版本下 CURL函数调用问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：LINUX环境下 后台部分操作提示出错&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：后台修改简历 二级地区不显示&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;修复：招聘会详情页图片大小比例问题&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;铜仁人力资源网&lt;/p&gt;&lt;p&gt;2018-03-23&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '1544078689', '1', '1,');

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

-- ----------------------------
-- Table structure for `news`
-- ----------------------------

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `news`
-- ----------------------------

INSERT INTO `news` VALUES ('1', '习近平离京出席APEC第26次非正式会议', '新华社北京11月15日电  11月15日，国家主席习近平乘专机离开北京，应巴布亚新几内亚独立国总督达达埃和总理奥尼尔、文莱达鲁萨兰国苏丹哈桑纳尔、菲律宾共和国总统杜特尔特邀请，对上述三国进行国事访问，并在巴新同建交太平洋岛国领导人会晤；应巴布亚新几内亚独立国总理奥尼尔邀请，出席在巴新莫尔兹比港举行的亚太经合组织第二十六次领导人非正式会议', '24557658769');
INSERT INTO `news` VALUES ('2', '【支持民营企业在行动】 商务部:支持民营经济发展', '商务部党组书记 部长 钟山：民营企业它们的贡献越来越大，国内贸易份额超过90%，外贸出口的份额占48%，对外投资份额占49%。我们要贯彻好总书记的重要讲话精神，支持它们在促进消费、扩大外贸、引进来和走出去等方面，有更大作为、做更大贡献。', '4577987080');

