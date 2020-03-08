-- ----------------------------
-- 日期：2018-11-29 22:12:55
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
  `telephone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `role_group_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `is_super` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `last_login_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_admin`
-- ----------------------------

INSERT INTO `f_admin` VALUES ('1', 'admin', 'MTIzNDU2', '18840918752', '1719847255@qq.com', '1', '1542655038', '1', '1', '1543494213');
INSERT INTO `f_admin` VALUES ('2', 'adminf', 'MTIzNDU2', '18840918752', '1719847255@qq.com', '2', '1542655038', '0', '1', '1543500428');
INSERT INTO `f_admin` VALUES ('3', 'fengyi', '111111', '18840918752', '1234567890@qq.com', '1', '1543453967', '1', '1', '');
INSERT INTO `f_admin` VALUES ('4', 'xieyunyun', '111111', '18208482313', '14567890@qq.com', '2', '1543454188', '0', '0', '');
INSERT INTO `f_admin` VALUES ('5', 'xiaolaoer', '111111', '13000000000', '2345678@qq.com', '1', '1543454375', '1', '0', '');

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
  `create_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
INSERT INTO `f_article` VALUES ('14', '2134567', '23456789', '&lt;p style=&quot;text-align:center&quot;&gt;&lt;img src=&quot;/ueditor/php/upload/image/20181126/1543223078.jpg&quot; title=&quot;1543223078.jpg&quot; alt=&quot;A3.jpg&quot; width=&quot;753&quot; height=&quot;440&quot;/&gt;&lt;/p&gt;&lt;p&gt;23456789&lt;/p&gt;', '1', '1543223080');
INSERT INTO `f_article` VALUES ('15', '234567890', '234567890-054', '&lt;p&gt;23456789076534567890&lt;/p&gt;', '0', '1543224006');
INSERT INTO `f_article` VALUES ('16', '灵魂', '为什么二三线城市容不下自己的灵魂', '&lt;p&gt;一年一度的毕业高峰期，我便加入了毕业生的队伍。。。。。。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20181127/1543321785.jpg&quot; title=&quot;1543321785.jpg&quot; alt=&quot;featured_item_1.jpg&quot;/&gt;&lt;/p&gt;', '0', '1543321788');

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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_members`
-- ----------------------------

INSERT INTO `f_members` VALUES ('1', 'fengyi', '123456', '0', '1970', '1', '1', '1719847255@qq.com', '贵州省贵阳市云岩区大营坡长冲农民新村40号', '18885175642');
INSERT INTO `f_members` VALUES ('2', 'xieyunyun', 'xiaolaoer', '1', '1970', '2', '1', '1985148501@qq.com', '贵州省贵阳市云岩区大营坡长冲农民新村40号', '18208482313');
INSERT INTO `f_members` VALUES ('12', 'ffyyii', '111111', '0', '1970', '1', '0', '2467758@qq.com', '贵州省贵阳市云岩区大营坡', '13900876668');
INSERT INTO `f_members` VALUES ('14', 'xxxxyyyy', '111111', '0', '1542639007', '2', '0', '2345678@qq.com', '贵州省贵阳市云岩区', '18478709765');
INSERT INTO `f_members` VALUES ('13', 'fififif', '111111', '0', '1542638962', '2', '0', '124365@qq.com', '贵州省贵阳市云岩区', '14960000000');
INSERT INTO `f_members` VALUES ('15', 'xfcfcfcf', '111111', '1', '1542639226', '2', '1', '23456789@qq.com', '贵州省贵阳市云岩区', '18554342434');
INSERT INTO `f_members` VALUES ('16', 'fxfxfcxfc', '111111', '0', '1542639273', '1', '1', '1234567@qq.com', '贵州省贵阳市云岩区', '14567899876');
INSERT INTO `f_members` VALUES ('17', 'fffxxxfffxxx', '111111', '1', '1542639316', '2', '0', '23456678@qq.com', '贵州省贵阳市云岩区', '18208482313');
INSERT INTO `f_members` VALUES ('18', 'xieyunyun', '111111', '1', '1542640493', '2', '0', '19832124357678@qq.com', '贵州省贵阳市花溪区贵州财经大学', '18208482313');
INSERT INTO `f_members` VALUES ('19', 'fxfxfxfx', '111111', '0', '1542643873', '2', '0', '234567787887@qq.com', '贵州省贵阳市云岩区', '16557809876');
INSERT INTO `f_members` VALUES ('20', 'ffffxxxx', '111111', '0', '1542643925', '2', '1', '234546567788@qq.com', '贵州省贵阳市云岩区大营坡', '12345678654');
INSERT INTO `f_members` VALUES ('21', 'xyyyyy', '111111', '1', '1542643980', '2', '1', '23378987565@qq.com', '贵州省贵阳市云岩区大营坡', '18434567889');
INSERT INTO `f_members` VALUES ('22', 'xxxxxyyyyy', '111111', '0', '1542644059', '2', '0', '34567898@qq.com', '贵州省贵阳市云岩区', '19545678984');
INSERT INTO `f_members` VALUES ('23', 'kkkkkk', '111111', '0', '1542654841', '2', '0', '2345678@qq.com', '贵州省贵阳市', '14567890987');
INSERT INTO `f_members` VALUES ('24', 'ffffff', '111111', '0', '1542654871', '2', '0', '23456789@qq.com', '贵州省贵阳市', '15678909876');
INSERT INTO `f_members` VALUES ('25', 'xxxxx', '111111', '1', '1542655038', '2', '0', '12345678@qq.com', '贵州省贵阳市', '15678987654');
INSERT INTO `f_members` VALUES ('26', 'flflflfl', '111111', '0', '1543068522', '0', '0', '1719847255@qq.com', '贵州省贵阳市云岩区', '18885175642');
INSERT INTO `f_members` VALUES ('28', 'ewrtyuio', '111111', '0', '1543317260', '2', '0', '234567890@qq.com', '贵州贵阳', '13546789098');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_menus`
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_role_group`
-- ----------------------------

INSERT INTO `f_role_group` VALUES ('1', '超级管理员', 'all', '1', '具有至高无上的权利');
INSERT INTO `f_role_group` VALUES ('2', '普通管理员', '/index.php/admin/Article/index@/index.php/admin/Article/article_add@/index.php/admin/Article/article_edit@/index.php/admin/Article/article_delete@/index.php/admin/Article/article_toggle@/index.php/admin/Member/index@/index.php/admin/Member/type@/index.php/admin/Member/member_add@/index.php/admin/Member/member_edit@/index.php/admin/Member/member_toggle@/index.php/admin/Member/member_password@/index.php/admin/Member/member_delete@/index.php/admin/Member/export@/index.php/admin/Order/index@/index.php/admin/Order/delete@/index.php/admin/Admin/admin_info@/index.php/admin/System/index@/index.php/admin/System/clock_pass', '1', '普通管理员权限');
INSERT INTO `f_role_group` VALUES ('8', '销售管理员', '/index.php/admin/Member/index@/index.php/admin/Member/type@/index.php/admin/Order/index@/index.php/admin/System/index@/index.php/admin/System/echarts@/index.php/admin/System/backups', '1', '具有销售相关的权限');
INSERT INTO `f_role_group` VALUES ('7', '编辑编辑员', '/index.php/admin/Article/index@/index.php/admin/Article/article_add', '1', '具有文章相关的权限');

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

