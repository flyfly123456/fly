-- ----------------------------
-- 日期：2019-01-02 01:05:17
-- MySQL - 5.7.24-MariaDB : Database - flyfly
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

INSERT INTO `f_admin` VALUES ('1', 'admin', 'MTIzNDU2', '1', '18840918752', '1719847255@qq.com', '1', '1542655038', '1', '1', '1546362068', '20190102/40af5950f4d31a08933d8bf43e1c9a3f.jpg', '具有至高无上的管理权力！！！', '1800', '1', '0', '192.168.73.1', '36', '1');
INSERT INTO `f_admin` VALUES ('11', 'xiaoshou', 'MTIzNDU2', '0', '18578999999', '2345678@qq.com', '12', '1543566477', '0', '1', '1546274192', '201812309e07deba6f455c47be0ec83f30db0c23.jpg', '销售管理员', '1800', '1', '0', '127.0.0.1', '9', '1');
INSERT INTO `f_admin` VALUES ('10', 'bianji', 'MTIzNDU2', '1', '18885175642', '2345678@qq.com', '11', '1543565944', '0', '1', '1544688857', '', '', '1800', '1', '0', '', '0', '1');
INSERT INTO `f_admin` VALUES ('12', 'weixin', 'MTIzNDU2', '', '18885175642', '1719847255@qq.com', '13', '1545238695', '0', '0', '', '', '', '1800', '1', '0', '', '0', '0');
INSERT INTO `f_admin` VALUES ('13', 'peixun', 'MTIzNDU2', '1', '18840918752', '234567898765@qq.com', '14', '1545998825', '0', '0', '', '', '', '1800', '0', '0', '', '0', '0');
INSERT INTO `f_admin` VALUES ('14', 'kefu', 'MTIzNDU2', '0', '18840918752', '2345678935@qq.com', '12', '1546002607', '0', '0', '1546004334', 'woman.png', '', '1800', '1', '0', '127.0.0.1', '4', '1');
INSERT INTO `f_admin` VALUES ('15', 'zhujiao', 'MTIzNDU2', '1', '18840918762', '234567890@qq.com', '14', '1546004445', '0', '1', '1546160893', 'woman.png', '', '1800', '1', '0', '127.0.0.1', '2', '1');
INSERT INTO `f_admin` VALUES ('16', 'weixinkefu', 'MTIzNDU2', '0', '18885175642', '2345678456@qq.com', '13', '1546004646', '0', '1', '1546004840', '20181228ad2434d1c2d02a5d58717ac0ac786962.jpg', '微信客服人员', '1800', '1', '0', '127.0.0.1', '3', '1');
INSERT INTO `f_admin` VALUES ('17', 'xiaolaoer', 'MTIzNDU2', '0', '18208482313', '234567890@qq.com', '1', '1546161352', '0', '1', '1546261634', 'woman.png', '', '1800', '1', '0', '127.0.0.1', '7', '1');

-- ----------------------------
-- Table structure for `f_admin_log`
-- ----------------------------

DROP TABLE IF EXISTS `f_admin_log`;

CREATE TABLE `f_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL,
  `operation` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '操作内容',
  `time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `is_available` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=815 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_admin_log`
-- ----------------------------

INSERT INTO `f_admin_log` VALUES ('1', '1', '显示主页', '1546328803', '1');
INSERT INTO `f_admin_log` VALUES ('2', '1', '显示主页', '1546328803', '1');
INSERT INTO `f_admin_log` VALUES ('3', '1', '数据备份', '1546328810', '1');
INSERT INTO `f_admin_log` VALUES ('4', '1', '数据备份', '1546328814', '1');
INSERT INTO `f_admin_log` VALUES ('5', '1', '显示主页', '1546335551', '1');
INSERT INTO `f_admin_log` VALUES ('6', '1', '显示主页', '1546335552', '1');
INSERT INTO `f_admin_log` VALUES ('7', '1', '查看文章', '1546335559', '1');
INSERT INTO `f_admin_log` VALUES ('8', '1', '查看会员', '1546335565', '1');
INSERT INTO `f_admin_log` VALUES ('9', '1', '查看会员', '1546335565', '1');
INSERT INTO `f_admin_log` VALUES ('10', '1', '查看会员', '1546335573', '1');
INSERT INTO `f_admin_log` VALUES ('11', '1', '查看会员', '1546335573', '1');
INSERT INTO `f_admin_log` VALUES ('12', '1', '查看文章', '1546335574', '1');
INSERT INTO `f_admin_log` VALUES ('13', '1', '显示主页', '1546335574', '1');
INSERT INTO `f_admin_log` VALUES ('14', '1', '查看会员类型', '1546335578', '1');
INSERT INTO `f_admin_log` VALUES ('15', '1', '测评列表', '1546335584', '1');
INSERT INTO `f_admin_log` VALUES ('16', '1', '数据备份', '1546335592', '1');
INSERT INTO `f_admin_log` VALUES ('17', '1', '数据备份', '1546335595', '1');
INSERT INTO `f_admin_log` VALUES ('18', '1', '显示主页', '1546351813', '1');
INSERT INTO `f_admin_log` VALUES ('19', '1', '显示主页', '1546351813', '1');
INSERT INTO `f_admin_log` VALUES ('20', '1', '查看管理员日志', '1546351818', '1');
INSERT INTO `f_admin_log` VALUES ('21', '1', '查看管理员日志', '1546351818', '1');
INSERT INTO `f_admin_log` VALUES ('22', '1', '查看管理员日志', '1546351821', '1');
INSERT INTO `f_admin_log` VALUES ('23', '1', '查看管理员日志', '1546351822', '1');
INSERT INTO `f_admin_log` VALUES ('24', '1', '发布系统公告', '1546351857', '1');
INSERT INTO `f_admin_log` VALUES ('25', '1', '发布系统公告', '1546351863', '1');
INSERT INTO `f_admin_log` VALUES ('26', '1', '发布系统公告', '1546351991', '1');
INSERT INTO `f_admin_log` VALUES ('27', '1', '查看会员', '1546352013', '1');
INSERT INTO `f_admin_log` VALUES ('28', '1', '查看会员', '1546352013', '1');
INSERT INTO `f_admin_log` VALUES ('29', '1', '添加会员', '1546352014', '1');
INSERT INTO `f_admin_log` VALUES ('30', '1', '添加会员', '1546352035', '1');
INSERT INTO `f_admin_log` VALUES ('31', '1', '查看会员', '1546352042', '1');
INSERT INTO `f_admin_log` VALUES ('32', '1', '查看会员', '1546352042', '1');
INSERT INTO `f_admin_log` VALUES ('33', '1', '查看文章', '1546352050', '1');
INSERT INTO `f_admin_log` VALUES ('34', '1', '添加文章', '1546352052', '1');
INSERT INTO `f_admin_log` VALUES ('35', '1', '添加文章', '1546352070', '1');
INSERT INTO `f_admin_log` VALUES ('36', '1', '查看文章', '1546352080', '1');
INSERT INTO `f_admin_log` VALUES ('37', '1', '文章编辑', '1546352087', '1');
INSERT INTO `f_admin_log` VALUES ('38', '1', '文章编辑', '1546352089', '1');
INSERT INTO `f_admin_log` VALUES ('39', '1', '文章编辑', '1546352109', '1');
INSERT INTO `f_admin_log` VALUES ('40', '1', '查看文章', '1546352116', '1');
INSERT INTO `f_admin_log` VALUES ('41', '1', '文章编辑', '1546352122', '1');
INSERT INTO `f_admin_log` VALUES ('42', '1', '文章编辑', '1546352124', '1');
INSERT INTO `f_admin_log` VALUES ('43', '1', '文章编辑', '1546352134', '1');
INSERT INTO `f_admin_log` VALUES ('44', '1', '文章编辑', '1546352140', '1');
INSERT INTO `f_admin_log` VALUES ('45', '1', '查看文章', '1546352146', '1');
INSERT INTO `f_admin_log` VALUES ('46', '1', '文章编辑', '1546352148', '1');
INSERT INTO `f_admin_log` VALUES ('47', '1', '文章编辑', '1546352154', '1');
INSERT INTO `f_admin_log` VALUES ('48', '1', '查看文章', '1546352159', '1');
INSERT INTO `f_admin_log` VALUES ('49', '1', '显示主页', '1546352183', '1');
INSERT INTO `f_admin_log` VALUES ('50', '1', '显示主页', '1546352183', '1');
INSERT INTO `f_admin_log` VALUES ('51', '1', '显示主页', '1546352306', '1');
INSERT INTO `f_admin_log` VALUES ('52', '1', '显示主页', '1546352337', '1');
INSERT INTO `f_admin_log` VALUES ('53', '1', '显示主页', '1546352337', '1');
INSERT INTO `f_admin_log` VALUES ('54', '1', '显示主页', '1546352627', '1');
INSERT INTO `f_admin_log` VALUES ('55', '1', '显示主页', '1546352627', '1');
INSERT INTO `f_admin_log` VALUES ('56', '1', '显示主页', '1546352674', '1');
INSERT INTO `f_admin_log` VALUES ('57', '1', '显示主页', '1546352677', '1');
INSERT INTO `f_admin_log` VALUES ('58', '1', '显示主页', '1546352678', '1');
INSERT INTO `f_admin_log` VALUES ('59', '1', '显示主页', '1546353114', '1');
INSERT INTO `f_admin_log` VALUES ('60', '1', '显示主页', '1546353114', '1');
INSERT INTO `f_admin_log` VALUES ('61', '1', '显示主页', '1546353119', '1');
INSERT INTO `f_admin_log` VALUES ('62', '1', '显示主页', '1546353119', '1');
INSERT INTO `f_admin_log` VALUES ('63', '1', '显示主页', '1546353120', '1');
INSERT INTO `f_admin_log` VALUES ('64', '1', '显示主页', '1546353120', '1');
INSERT INTO `f_admin_log` VALUES ('65', '1', '显示主页', '1546353121', '1');
INSERT INTO `f_admin_log` VALUES ('66', '1', '显示主页', '1546353121', '1');
INSERT INTO `f_admin_log` VALUES ('67', '1', '显示主页', '1546353122', '1');
INSERT INTO `f_admin_log` VALUES ('68', '1', '显示主页', '1546353122', '1');
INSERT INTO `f_admin_log` VALUES ('69', '1', '显示主页', '1546353152', '1');
INSERT INTO `f_admin_log` VALUES ('70', '1', '显示主页', '1546353152', '1');
INSERT INTO `f_admin_log` VALUES ('71', '1', '显示主页', '1546353210', '1');
INSERT INTO `f_admin_log` VALUES ('72', '1', '显示主页', '1546353210', '1');
INSERT INTO `f_admin_log` VALUES ('73', '1', '显示主页', '1546353231', '1');
INSERT INTO `f_admin_log` VALUES ('74', '1', '显示主页', '1546353231', '1');
INSERT INTO `f_admin_log` VALUES ('75', '1', '显示主页', '1546353255', '1');
INSERT INTO `f_admin_log` VALUES ('76', '1', '显示主页', '1546353256', '1');
INSERT INTO `f_admin_log` VALUES ('77', '1', '显示主页', '1546353280', '1');
INSERT INTO `f_admin_log` VALUES ('78', '1', '显示主页', '1546353280', '1');
INSERT INTO `f_admin_log` VALUES ('79', '1', '显示主页', '1546353306', '1');
INSERT INTO `f_admin_log` VALUES ('80', '1', '显示主页', '1546353306', '1');
INSERT INTO `f_admin_log` VALUES ('81', '1', '显示主页', '1546353316', '1');
INSERT INTO `f_admin_log` VALUES ('82', '1', '显示主页', '1546353316', '1');
INSERT INTO `f_admin_log` VALUES ('83', '1', '显示主页', '1546353350', '1');
INSERT INTO `f_admin_log` VALUES ('84', '1', '显示主页', '1546353379', '1');
INSERT INTO `f_admin_log` VALUES ('85', '1', '显示主页', '1546353379', '1');
INSERT INTO `f_admin_log` VALUES ('86', '1', '显示主页', '1546353449', '1');
INSERT INTO `f_admin_log` VALUES ('87', '1', '显示主页', '1546353449', '1');
INSERT INTO `f_admin_log` VALUES ('88', '1', '显示主页', '1546353480', '1');
INSERT INTO `f_admin_log` VALUES ('89', '1', '显示主页', '1546353480', '1');
INSERT INTO `f_admin_log` VALUES ('90', '1', '显示主页', '1546353724', '1');
INSERT INTO `f_admin_log` VALUES ('91', '1', '显示主页', '1546353724', '1');
INSERT INTO `f_admin_log` VALUES ('92', '1', '显示主页', '1546353740', '1');
INSERT INTO `f_admin_log` VALUES ('93', '1', '显示主页', '1546353740', '1');
INSERT INTO `f_admin_log` VALUES ('94', '1', '显示主页', '1546353752', '1');
INSERT INTO `f_admin_log` VALUES ('95', '1', '显示主页', '1546353752', '1');
INSERT INTO `f_admin_log` VALUES ('96', '1', '显示主页', '1546353810', '1');
INSERT INTO `f_admin_log` VALUES ('97', '1', '显示主页', '1546353810', '1');
INSERT INTO `f_admin_log` VALUES ('98', '1', '显示主页', '1546353868', '1');
INSERT INTO `f_admin_log` VALUES ('99', '1', '显示主页', '1546353878', '1');
INSERT INTO `f_admin_log` VALUES ('100', '1', '显示主页', '1546353878', '1');
INSERT INTO `f_admin_log` VALUES ('101', '1', '显示主页', '1546353879', '1');
INSERT INTO `f_admin_log` VALUES ('102', '1', '显示主页', '1546353879', '1');
INSERT INTO `f_admin_log` VALUES ('103', '1', '显示主页', '1546353880', '1');
INSERT INTO `f_admin_log` VALUES ('104', '1', '显示主页', '1546353880', '1');
INSERT INTO `f_admin_log` VALUES ('105', '1', '显示主页', '1546353880', '1');
INSERT INTO `f_admin_log` VALUES ('106', '1', '显示主页', '1546353880', '1');
INSERT INTO `f_admin_log` VALUES ('107', '1', '显示主页', '1546353881', '1');
INSERT INTO `f_admin_log` VALUES ('108', '1', '显示主页', '1546353881', '1');
INSERT INTO `f_admin_log` VALUES ('109', '1', '显示主页', '1546353882', '1');
INSERT INTO `f_admin_log` VALUES ('110', '1', '显示主页', '1546353882', '1');
INSERT INTO `f_admin_log` VALUES ('111', '1', '显示主页', '1546353883', '1');
INSERT INTO `f_admin_log` VALUES ('112', '1', '显示主页', '1546353883', '1');
INSERT INTO `f_admin_log` VALUES ('113', '1', '显示主页', '1546353884', '1');
INSERT INTO `f_admin_log` VALUES ('114', '1', '显示主页', '1546353884', '1');
INSERT INTO `f_admin_log` VALUES ('115', '1', '显示主页', '1546353884', '1');
INSERT INTO `f_admin_log` VALUES ('116', '1', '显示主页', '1546353884', '1');
INSERT INTO `f_admin_log` VALUES ('117', '1', '显示主页', '1546353885', '1');
INSERT INTO `f_admin_log` VALUES ('118', '1', '显示主页', '1546353885', '1');
INSERT INTO `f_admin_log` VALUES ('119', '1', '显示主页', '1546353886', '1');
INSERT INTO `f_admin_log` VALUES ('120', '1', '显示主页', '1546353886', '1');
INSERT INTO `f_admin_log` VALUES ('121', '1', '显示主页', '1546353888', '1');
INSERT INTO `f_admin_log` VALUES ('122', '1', '显示主页', '1546353889', '1');
INSERT INTO `f_admin_log` VALUES ('123', '1', '显示主页', '1546353889', '1');
INSERT INTO `f_admin_log` VALUES ('124', '1', '显示主页', '1546353889', '1');
INSERT INTO `f_admin_log` VALUES ('125', '1', '显示主页', '1546353890', '1');
INSERT INTO `f_admin_log` VALUES ('126', '1', '显示主页', '1546353890', '1');
INSERT INTO `f_admin_log` VALUES ('127', '1', '显示主页', '1546353890', '1');
INSERT INTO `f_admin_log` VALUES ('128', '1', '显示主页', '1546353891', '1');
INSERT INTO `f_admin_log` VALUES ('129', '1', '显示主页', '1546353891', '1');
INSERT INTO `f_admin_log` VALUES ('130', '1', '显示主页', '1546353891', '1');
INSERT INTO `f_admin_log` VALUES ('131', '1', '显示主页', '1546353892', '1');
INSERT INTO `f_admin_log` VALUES ('132', '1', '显示主页', '1546353892', '1');
INSERT INTO `f_admin_log` VALUES ('133', '1', '显示主页', '1546353894', '1');
INSERT INTO `f_admin_log` VALUES ('134', '1', '显示主页', '1546353894', '1');
INSERT INTO `f_admin_log` VALUES ('135', '1', '显示主页', '1546353894', '1');
INSERT INTO `f_admin_log` VALUES ('136', '1', '显示主页', '1546353894', '1');
INSERT INTO `f_admin_log` VALUES ('137', '1', '显示主页', '1546353895', '1');
INSERT INTO `f_admin_log` VALUES ('138', '1', '显示主页', '1546353895', '1');
INSERT INTO `f_admin_log` VALUES ('139', '1', '显示主页', '1546353896', '1');
INSERT INTO `f_admin_log` VALUES ('140', '1', '显示主页', '1546353896', '1');
INSERT INTO `f_admin_log` VALUES ('141', '1', '显示主页', '1546353896', '1');
INSERT INTO `f_admin_log` VALUES ('142', '1', '显示主页', '1546353897', '1');
INSERT INTO `f_admin_log` VALUES ('143', '1', '显示主页', '1546353897', '1');
INSERT INTO `f_admin_log` VALUES ('144', '1', '显示主页', '1546353898', '1');
INSERT INTO `f_admin_log` VALUES ('145', '1', '显示主页', '1546353898', '1');
INSERT INTO `f_admin_log` VALUES ('146', '1', '显示主页', '1546353898', '1');
INSERT INTO `f_admin_log` VALUES ('147', '1', '显示主页', '1546353899', '1');
INSERT INTO `f_admin_log` VALUES ('148', '1', '显示主页', '1546353899', '1');
INSERT INTO `f_admin_log` VALUES ('149', '1', '显示主页', '1546353901', '1');
INSERT INTO `f_admin_log` VALUES ('150', '1', '显示主页', '1546353901', '1');
INSERT INTO `f_admin_log` VALUES ('151', '1', '显示主页', '1546353938', '1');
INSERT INTO `f_admin_log` VALUES ('152', '1', '显示主页', '1546353938', '1');
INSERT INTO `f_admin_log` VALUES ('153', '1', '显示主页', '1546353952', '1');
INSERT INTO `f_admin_log` VALUES ('154', '1', '显示主页', '1546353952', '1');
INSERT INTO `f_admin_log` VALUES ('155', '1', '显示主页', '1546354092', '1');
INSERT INTO `f_admin_log` VALUES ('156', '1', '显示主页', '1546354093', '1');
INSERT INTO `f_admin_log` VALUES ('157', '1', '显示主页', '1546354107', '1');
INSERT INTO `f_admin_log` VALUES ('158', '1', '显示主页', '1546354107', '1');
INSERT INTO `f_admin_log` VALUES ('159', '1', '显示主页', '1546354117', '1');
INSERT INTO `f_admin_log` VALUES ('160', '1', '显示主页', '1546354117', '1');
INSERT INTO `f_admin_log` VALUES ('161', '1', '显示主页', '1546354309', '1');
INSERT INTO `f_admin_log` VALUES ('162', '1', '显示主页', '1546354309', '1');
INSERT INTO `f_admin_log` VALUES ('163', '1', '显示主页', '1546354335', '1');
INSERT INTO `f_admin_log` VALUES ('164', '1', '显示主页', '1546354335', '1');
INSERT INTO `f_admin_log` VALUES ('165', '1', '显示主页', '1546354352', '1');
INSERT INTO `f_admin_log` VALUES ('166', '1', '显示主页', '1546354352', '1');
INSERT INTO `f_admin_log` VALUES ('167', '1', '显示主页', '1546354465', '1');
INSERT INTO `f_admin_log` VALUES ('168', '1', '显示主页', '1546354465', '1');
INSERT INTO `f_admin_log` VALUES ('169', '1', '显示主页', '1546354475', '1');
INSERT INTO `f_admin_log` VALUES ('170', '1', '显示主页', '1546354475', '1');
INSERT INTO `f_admin_log` VALUES ('171', '1', '显示主页', '1546354515', '1');
INSERT INTO `f_admin_log` VALUES ('172', '1', '显示主页', '1546354515', '1');
INSERT INTO `f_admin_log` VALUES ('173', '1', '显示主页', '1546354523', '1');
INSERT INTO `f_admin_log` VALUES ('174', '1', '显示主页', '1546354523', '1');
INSERT INTO `f_admin_log` VALUES ('175', '1', '显示主页', '1546354526', '1');
INSERT INTO `f_admin_log` VALUES ('176', '1', '显示主页', '1546354527', '1');
INSERT INTO `f_admin_log` VALUES ('177', '1', '显示主页', '1546354527', '1');
INSERT INTO `f_admin_log` VALUES ('178', '1', '显示主页', '1546354527', '1');
INSERT INTO `f_admin_log` VALUES ('179', '1', '显示主页', '1546354528', '1');
INSERT INTO `f_admin_log` VALUES ('180', '1', '显示主页', '1546354528', '1');
INSERT INTO `f_admin_log` VALUES ('181', '1', '显示主页', '1546354529', '1');
INSERT INTO `f_admin_log` VALUES ('182', '1', '显示主页', '1546354529', '1');
INSERT INTO `f_admin_log` VALUES ('183', '1', '显示主页', '1546354530', '1');
INSERT INTO `f_admin_log` VALUES ('184', '1', '显示主页', '1546354530', '1');
INSERT INTO `f_admin_log` VALUES ('185', '1', '显示主页', '1546354531', '1');
INSERT INTO `f_admin_log` VALUES ('186', '1', '显示主页', '1546354531', '1');
INSERT INTO `f_admin_log` VALUES ('187', '1', '显示主页', '1546354532', '1');
INSERT INTO `f_admin_log` VALUES ('188', '1', '显示主页', '1546354532', '1');
INSERT INTO `f_admin_log` VALUES ('189', '1', '显示主页', '1546354533', '1');
INSERT INTO `f_admin_log` VALUES ('190', '1', '显示主页', '1546354533', '1');
INSERT INTO `f_admin_log` VALUES ('191', '1', '显示主页', '1546354543', '1');
INSERT INTO `f_admin_log` VALUES ('192', '1', '显示主页', '1546354543', '1');
INSERT INTO `f_admin_log` VALUES ('193', '1', '显示主页', '1546354544', '1');
INSERT INTO `f_admin_log` VALUES ('194', '1', '显示主页', '1546354544', '1');
INSERT INTO `f_admin_log` VALUES ('195', '1', '显示主页', '1546354545', '1');
INSERT INTO `f_admin_log` VALUES ('196', '1', '显示主页', '1546354545', '1');
INSERT INTO `f_admin_log` VALUES ('197', '1', '显示主页', '1546354546', '1');
INSERT INTO `f_admin_log` VALUES ('198', '1', '显示主页', '1546354546', '1');
INSERT INTO `f_admin_log` VALUES ('199', '1', '显示主页', '1546354546', '1');
INSERT INTO `f_admin_log` VALUES ('200', '1', '显示主页', '1546354546', '1');
INSERT INTO `f_admin_log` VALUES ('201', '1', '显示主页', '1546354547', '1');
INSERT INTO `f_admin_log` VALUES ('202', '1', '显示主页', '1546354547', '1');
INSERT INTO `f_admin_log` VALUES ('203', '1', '显示主页', '1546354548', '1');
INSERT INTO `f_admin_log` VALUES ('204', '1', '显示主页', '1546354548', '1');
INSERT INTO `f_admin_log` VALUES ('205', '1', '显示主页', '1546354549', '1');
INSERT INTO `f_admin_log` VALUES ('206', '1', '显示主页', '1546354549', '1');
INSERT INTO `f_admin_log` VALUES ('207', '1', '显示主页', '1546354550', '1');
INSERT INTO `f_admin_log` VALUES ('208', '1', '显示主页', '1546354550', '1');
INSERT INTO `f_admin_log` VALUES ('209', '1', '显示主页', '1546354564', '1');
INSERT INTO `f_admin_log` VALUES ('210', '1', '显示主页', '1546354564', '1');
INSERT INTO `f_admin_log` VALUES ('211', '1', '显示主页', '1546354565', '1');
INSERT INTO `f_admin_log` VALUES ('212', '1', '显示主页', '1546354566', '1');
INSERT INTO `f_admin_log` VALUES ('213', '1', '显示主页', '1546354566', '1');
INSERT INTO `f_admin_log` VALUES ('214', '1', '显示主页', '1546354566', '1');
INSERT INTO `f_admin_log` VALUES ('215', '1', '显示主页', '1546354583', '1');
INSERT INTO `f_admin_log` VALUES ('216', '1', '显示主页', '1546354584', '1');
INSERT INTO `f_admin_log` VALUES ('217', '1', '显示主页', '1546354588', '1');
INSERT INTO `f_admin_log` VALUES ('218', '1', '显示主页', '1546354588', '1');
INSERT INTO `f_admin_log` VALUES ('219', '1', '显示主页', '1546354589', '1');
INSERT INTO `f_admin_log` VALUES ('220', '1', '显示主页', '1546354589', '1');
INSERT INTO `f_admin_log` VALUES ('221', '1', '显示主页', '1546354593', '1');
INSERT INTO `f_admin_log` VALUES ('222', '1', '显示主页', '1546354593', '1');
INSERT INTO `f_admin_log` VALUES ('223', '1', '显示主页', '1546354596', '1');
INSERT INTO `f_admin_log` VALUES ('224', '1', '显示主页', '1546354596', '1');
INSERT INTO `f_admin_log` VALUES ('225', '1', '显示主页', '1546354597', '1');
INSERT INTO `f_admin_log` VALUES ('226', '1', '显示主页', '1546354597', '1');
INSERT INTO `f_admin_log` VALUES ('227', '1', '显示主页', '1546354598', '1');
INSERT INTO `f_admin_log` VALUES ('228', '1', '显示主页', '1546354598', '1');
INSERT INTO `f_admin_log` VALUES ('229', '1', '显示主页', '1546354599', '1');
INSERT INTO `f_admin_log` VALUES ('230', '1', '显示主页', '1546354599', '1');
INSERT INTO `f_admin_log` VALUES ('231', '1', '显示主页', '1546354600', '1');
INSERT INTO `f_admin_log` VALUES ('232', '1', '显示主页', '1546354600', '1');
INSERT INTO `f_admin_log` VALUES ('233', '1', '显示主页', '1546354601', '1');
INSERT INTO `f_admin_log` VALUES ('234', '1', '显示主页', '1546354601', '1');
INSERT INTO `f_admin_log` VALUES ('235', '1', '显示主页', '1546354601', '1');
INSERT INTO `f_admin_log` VALUES ('236', '1', '显示主页', '1546354602', '1');
INSERT INTO `f_admin_log` VALUES ('237', '1', '显示主页', '1546354602', '1');
INSERT INTO `f_admin_log` VALUES ('238', '1', '显示主页', '1546354602', '1');
INSERT INTO `f_admin_log` VALUES ('239', '1', '显示主页', '1546354603', '1');
INSERT INTO `f_admin_log` VALUES ('240', '1', '显示主页', '1546354604', '1');
INSERT INTO `f_admin_log` VALUES ('241', '1', '显示主页', '1546354604', '1');
INSERT INTO `f_admin_log` VALUES ('242', '1', '显示主页', '1546354604', '1');
INSERT INTO `f_admin_log` VALUES ('243', '1', '显示主页', '1546354605', '1');
INSERT INTO `f_admin_log` VALUES ('244', '1', '显示主页', '1546354605', '1');
INSERT INTO `f_admin_log` VALUES ('245', '1', '显示主页', '1546354606', '1');
INSERT INTO `f_admin_log` VALUES ('246', '1', '显示主页', '1546354606', '1');
INSERT INTO `f_admin_log` VALUES ('247', '1', '显示主页', '1546354607', '1');
INSERT INTO `f_admin_log` VALUES ('248', '1', '显示主页', '1546354607', '1');
INSERT INTO `f_admin_log` VALUES ('249', '1', '显示主页', '1546354608', '1');
INSERT INTO `f_admin_log` VALUES ('250', '1', '显示主页', '1546354608', '1');
INSERT INTO `f_admin_log` VALUES ('251', '1', '显示主页', '1546354608', '1');
INSERT INTO `f_admin_log` VALUES ('252', '1', '显示主页', '1546354608', '1');
INSERT INTO `f_admin_log` VALUES ('253', '1', '显示主页', '1546354709', '1');
INSERT INTO `f_admin_log` VALUES ('254', '1', '显示主页', '1546354709', '1');
INSERT INTO `f_admin_log` VALUES ('255', '1', '显示主页', '1546354726', '1');
INSERT INTO `f_admin_log` VALUES ('256', '1', '显示主页', '1546354726', '1');
INSERT INTO `f_admin_log` VALUES ('257', '1', '显示主页', '1546354728', '1');
INSERT INTO `f_admin_log` VALUES ('258', '1', '显示主页', '1546354728', '1');
INSERT INTO `f_admin_log` VALUES ('259', '1', '显示主页', '1546354738', '1');
INSERT INTO `f_admin_log` VALUES ('260', '1', '显示主页', '1546354738', '1');
INSERT INTO `f_admin_log` VALUES ('261', '1', '显示主页', '1546354751', '1');
INSERT INTO `f_admin_log` VALUES ('262', '1', '显示主页', '1546354751', '1');
INSERT INTO `f_admin_log` VALUES ('263', '1', '显示主页', '1546354752', '1');
INSERT INTO `f_admin_log` VALUES ('264', '1', '显示主页', '1546354752', '1');
INSERT INTO `f_admin_log` VALUES ('265', '1', '显示主页', '1546354753', '1');
INSERT INTO `f_admin_log` VALUES ('266', '1', '显示主页', '1546354753', '1');
INSERT INTO `f_admin_log` VALUES ('267', '1', '显示主页', '1546354754', '1');
INSERT INTO `f_admin_log` VALUES ('268', '1', '显示主页', '1546354754', '1');
INSERT INTO `f_admin_log` VALUES ('269', '1', '显示主页', '1546354795', '1');
INSERT INTO `f_admin_log` VALUES ('270', '1', '显示主页', '1546354795', '1');
INSERT INTO `f_admin_log` VALUES ('271', '1', '显示主页', '1546354796', '1');
INSERT INTO `f_admin_log` VALUES ('272', '1', '显示主页', '1546354796', '1');
INSERT INTO `f_admin_log` VALUES ('273', '1', '显示主页', '1546354859', '1');
INSERT INTO `f_admin_log` VALUES ('274', '1', '显示主页', '1546354859', '1');
INSERT INTO `f_admin_log` VALUES ('275', '1', '显示主页', '1546354980', '1');
INSERT INTO `f_admin_log` VALUES ('276', '1', '显示主页', '1546354980', '1');
INSERT INTO `f_admin_log` VALUES ('277', '1', '显示主页', '1546354998', '1');
INSERT INTO `f_admin_log` VALUES ('278', '1', '显示主页', '1546354998', '1');
INSERT INTO `f_admin_log` VALUES ('279', '1', '显示主页', '1546355000', '1');
INSERT INTO `f_admin_log` VALUES ('280', '1', '显示主页', '1546355000', '1');
INSERT INTO `f_admin_log` VALUES ('281', '1', '显示主页', '1546355001', '1');
INSERT INTO `f_admin_log` VALUES ('282', '1', '显示主页', '1546355001', '1');
INSERT INTO `f_admin_log` VALUES ('283', '1', '显示主页', '1546355002', '1');
INSERT INTO `f_admin_log` VALUES ('284', '1', '显示主页', '1546355002', '1');
INSERT INTO `f_admin_log` VALUES ('285', '1', '显示主页', '1546355002', '1');
INSERT INTO `f_admin_log` VALUES ('286', '1', '显示主页', '1546355002', '1');
INSERT INTO `f_admin_log` VALUES ('287', '1', '显示主页', '1546355003', '1');
INSERT INTO `f_admin_log` VALUES ('288', '1', '显示主页', '1546355003', '1');
INSERT INTO `f_admin_log` VALUES ('289', '1', '显示主页', '1546355004', '1');
INSERT INTO `f_admin_log` VALUES ('290', '1', '显示主页', '1546355004', '1');
INSERT INTO `f_admin_log` VALUES ('291', '1', '显示主页', '1546355004', '1');
INSERT INTO `f_admin_log` VALUES ('292', '1', '显示主页', '1546355004', '1');
INSERT INTO `f_admin_log` VALUES ('293', '1', '显示主页', '1546355005', '1');
INSERT INTO `f_admin_log` VALUES ('294', '1', '显示主页', '1546355005', '1');
INSERT INTO `f_admin_log` VALUES ('295', '1', '显示主页', '1546355005', '1');
INSERT INTO `f_admin_log` VALUES ('296', '1', '显示主页', '1546355005', '1');
INSERT INTO `f_admin_log` VALUES ('297', '1', '显示主页', '1546355006', '1');
INSERT INTO `f_admin_log` VALUES ('298', '1', '显示主页', '1546355006', '1');
INSERT INTO `f_admin_log` VALUES ('299', '1', '显示主页', '1546355006', '1');
INSERT INTO `f_admin_log` VALUES ('300', '1', '显示主页', '1546355006', '1');
INSERT INTO `f_admin_log` VALUES ('301', '1', '显示主页', '1546355007', '1');
INSERT INTO `f_admin_log` VALUES ('302', '1', '显示主页', '1546355007', '1');
INSERT INTO `f_admin_log` VALUES ('303', '1', '显示主页', '1546355007', '1');
INSERT INTO `f_admin_log` VALUES ('304', '1', '显示主页', '1546355007', '1');
INSERT INTO `f_admin_log` VALUES ('305', '1', '显示主页', '1546355007', '1');
INSERT INTO `f_admin_log` VALUES ('306', '1', '显示主页', '1546355007', '1');
INSERT INTO `f_admin_log` VALUES ('307', '1', '显示主页', '1546355008', '1');
INSERT INTO `f_admin_log` VALUES ('308', '1', '显示主页', '1546355008', '1');
INSERT INTO `f_admin_log` VALUES ('309', '1', '显示主页', '1546355008', '1');
INSERT INTO `f_admin_log` VALUES ('310', '1', '显示主页', '1546355008', '1');
INSERT INTO `f_admin_log` VALUES ('311', '1', '显示主页', '1546355009', '1');
INSERT INTO `f_admin_log` VALUES ('312', '1', '显示主页', '1546355009', '1');
INSERT INTO `f_admin_log` VALUES ('313', '1', '显示主页', '1546355009', '1');
INSERT INTO `f_admin_log` VALUES ('314', '1', '显示主页', '1546355009', '1');
INSERT INTO `f_admin_log` VALUES ('315', '1', '显示主页', '1546355009', '1');
INSERT INTO `f_admin_log` VALUES ('316', '1', '显示主页', '1546355009', '1');
INSERT INTO `f_admin_log` VALUES ('317', '1', '显示主页', '1546355010', '1');
INSERT INTO `f_admin_log` VALUES ('318', '1', '显示主页', '1546355010', '1');
INSERT INTO `f_admin_log` VALUES ('319', '1', '显示主页', '1546355011', '1');
INSERT INTO `f_admin_log` VALUES ('320', '1', '显示主页', '1546355011', '1');
INSERT INTO `f_admin_log` VALUES ('321', '1', '显示主页', '1546355011', '1');
INSERT INTO `f_admin_log` VALUES ('322', '1', '显示主页', '1546355011', '1');
INSERT INTO `f_admin_log` VALUES ('323', '1', '显示主页', '1546355011', '1');
INSERT INTO `f_admin_log` VALUES ('324', '1', '显示主页', '1546355011', '1');
INSERT INTO `f_admin_log` VALUES ('325', '1', '显示主页', '1546355011', '1');
INSERT INTO `f_admin_log` VALUES ('326', '1', '显示主页', '1546355012', '1');
INSERT INTO `f_admin_log` VALUES ('327', '1', '显示主页', '1546355012', '1');
INSERT INTO `f_admin_log` VALUES ('328', '1', '显示主页', '1546355012', '1');
INSERT INTO `f_admin_log` VALUES ('329', '1', '显示主页', '1546355012', '1');
INSERT INTO `f_admin_log` VALUES ('330', '1', '显示主页', '1546355012', '1');
INSERT INTO `f_admin_log` VALUES ('331', '1', '显示主页', '1546355012', '1');
INSERT INTO `f_admin_log` VALUES ('332', '1', '显示主页', '1546355012', '1');
INSERT INTO `f_admin_log` VALUES ('333', '1', '显示主页', '1546355012', '1');
INSERT INTO `f_admin_log` VALUES ('334', '1', '显示主页', '1546355012', '1');
INSERT INTO `f_admin_log` VALUES ('335', '1', '显示主页', '1546355013', '1');
INSERT INTO `f_admin_log` VALUES ('336', '1', '显示主页', '1546355013', '1');
INSERT INTO `f_admin_log` VALUES ('337', '1', '显示主页', '1546355013', '1');
INSERT INTO `f_admin_log` VALUES ('338', '1', '显示主页', '1546355013', '1');
INSERT INTO `f_admin_log` VALUES ('339', '1', '显示主页', '1546355013', '1');
INSERT INTO `f_admin_log` VALUES ('340', '1', '显示主页', '1546355013', '1');
INSERT INTO `f_admin_log` VALUES ('341', '1', '显示主页', '1546355014', '1');
INSERT INTO `f_admin_log` VALUES ('342', '1', '显示主页', '1546355014', '1');
INSERT INTO `f_admin_log` VALUES ('343', '1', '显示主页', '1546355014', '1');
INSERT INTO `f_admin_log` VALUES ('344', '1', '显示主页', '1546355014', '1');
INSERT INTO `f_admin_log` VALUES ('345', '1', '显示主页', '1546355014', '1');
INSERT INTO `f_admin_log` VALUES ('346', '1', '显示主页', '1546355014', '1');
INSERT INTO `f_admin_log` VALUES ('347', '1', '显示主页', '1546355014', '1');
INSERT INTO `f_admin_log` VALUES ('348', '1', '显示主页', '1546355015', '1');
INSERT INTO `f_admin_log` VALUES ('349', '1', '显示主页', '1546355015', '1');
INSERT INTO `f_admin_log` VALUES ('350', '1', '显示主页', '1546355015', '1');
INSERT INTO `f_admin_log` VALUES ('351', '1', '显示主页', '1546355015', '1');
INSERT INTO `f_admin_log` VALUES ('352', '1', '显示主页', '1546355015', '1');
INSERT INTO `f_admin_log` VALUES ('353', '1', '显示主页', '1546355015', '1');
INSERT INTO `f_admin_log` VALUES ('354', '1', '显示主页', '1546355015', '1');
INSERT INTO `f_admin_log` VALUES ('355', '1', '显示主页', '1546355015', '1');
INSERT INTO `f_admin_log` VALUES ('356', '1', '显示主页', '1546355016', '1');
INSERT INTO `f_admin_log` VALUES ('357', '1', '显示主页', '1546355016', '1');
INSERT INTO `f_admin_log` VALUES ('358', '1', '显示主页', '1546355016', '1');
INSERT INTO `f_admin_log` VALUES ('359', '1', '显示主页', '1546355016', '1');
INSERT INTO `f_admin_log` VALUES ('360', '1', '显示主页', '1546355016', '1');
INSERT INTO `f_admin_log` VALUES ('361', '1', '显示主页', '1546355016', '1');
INSERT INTO `f_admin_log` VALUES ('362', '1', '显示主页', '1546355016', '1');
INSERT INTO `f_admin_log` VALUES ('363', '1', '显示主页', '1546355016', '1');
INSERT INTO `f_admin_log` VALUES ('364', '1', '显示主页', '1546355016', '1');
INSERT INTO `f_admin_log` VALUES ('365', '1', '显示主页', '1546355017', '1');
INSERT INTO `f_admin_log` VALUES ('366', '1', '显示主页', '1546355017', '1');
INSERT INTO `f_admin_log` VALUES ('367', '1', '显示主页', '1546355017', '1');
INSERT INTO `f_admin_log` VALUES ('368', '1', '显示主页', '1546355017', '1');
INSERT INTO `f_admin_log` VALUES ('369', '1', '显示主页', '1546355017', '1');
INSERT INTO `f_admin_log` VALUES ('370', '1', '显示主页', '1546355017', '1');
INSERT INTO `f_admin_log` VALUES ('371', '1', '显示主页', '1546355017', '1');
INSERT INTO `f_admin_log` VALUES ('372', '1', '显示主页', '1546355017', '1');
INSERT INTO `f_admin_log` VALUES ('373', '1', '显示主页', '1546355017', '1');
INSERT INTO `f_admin_log` VALUES ('374', '1', '显示主页', '1546355018', '1');
INSERT INTO `f_admin_log` VALUES ('375', '1', '显示主页', '1546355018', '1');
INSERT INTO `f_admin_log` VALUES ('376', '1', '显示主页', '1546355018', '1');
INSERT INTO `f_admin_log` VALUES ('377', '1', '显示主页', '1546355018', '1');
INSERT INTO `f_admin_log` VALUES ('378', '1', '显示主页', '1546355018', '1');
INSERT INTO `f_admin_log` VALUES ('379', '1', '显示主页', '1546355018', '1');
INSERT INTO `f_admin_log` VALUES ('380', '1', '显示主页', '1546355018', '1');
INSERT INTO `f_admin_log` VALUES ('381', '1', '显示主页', '1546355018', '1');
INSERT INTO `f_admin_log` VALUES ('382', '1', '显示主页', '1546355018', '1');
INSERT INTO `f_admin_log` VALUES ('383', '1', '显示主页', '1546355019', '1');
INSERT INTO `f_admin_log` VALUES ('384', '1', '显示主页', '1546355019', '1');
INSERT INTO `f_admin_log` VALUES ('385', '1', '显示主页', '1546355019', '1');
INSERT INTO `f_admin_log` VALUES ('386', '1', '显示主页', '1546355019', '1');
INSERT INTO `f_admin_log` VALUES ('387', '1', '显示主页', '1546355019', '1');
INSERT INTO `f_admin_log` VALUES ('388', '1', '显示主页', '1546355019', '1');
INSERT INTO `f_admin_log` VALUES ('389', '1', '显示主页', '1546355019', '1');
INSERT INTO `f_admin_log` VALUES ('390', '1', '显示主页', '1546355019', '1');
INSERT INTO `f_admin_log` VALUES ('391', '1', '显示主页', '1546355020', '1');
INSERT INTO `f_admin_log` VALUES ('392', '1', '显示主页', '1546355020', '1');
INSERT INTO `f_admin_log` VALUES ('393', '1', '显示主页', '1546355020', '1');
INSERT INTO `f_admin_log` VALUES ('394', '1', '显示主页', '1546355020', '1');
INSERT INTO `f_admin_log` VALUES ('395', '1', '显示主页', '1546355020', '1');
INSERT INTO `f_admin_log` VALUES ('396', '1', '显示主页', '1546355020', '1');
INSERT INTO `f_admin_log` VALUES ('397', '1', '显示主页', '1546355020', '1');
INSERT INTO `f_admin_log` VALUES ('398', '1', '显示主页', '1546355020', '1');
INSERT INTO `f_admin_log` VALUES ('399', '1', '显示主页', '1546355021', '1');
INSERT INTO `f_admin_log` VALUES ('400', '1', '显示主页', '1546355021', '1');
INSERT INTO `f_admin_log` VALUES ('401', '1', '显示主页', '1546355027', '1');
INSERT INTO `f_admin_log` VALUES ('402', '1', '显示主页', '1546355027', '1');
INSERT INTO `f_admin_log` VALUES ('403', '1', '显示主页', '1546355028', '1');
INSERT INTO `f_admin_log` VALUES ('404', '1', '显示主页', '1546355028', '1');
INSERT INTO `f_admin_log` VALUES ('405', '1', '显示主页', '1546355029', '1');
INSERT INTO `f_admin_log` VALUES ('406', '1', '显示主页', '1546355029', '1');
INSERT INTO `f_admin_log` VALUES ('407', '1', '显示主页', '1546355029', '1');
INSERT INTO `f_admin_log` VALUES ('408', '1', '显示主页', '1546355029', '1');
INSERT INTO `f_admin_log` VALUES ('409', '1', '显示主页', '1546355030', '1');
INSERT INTO `f_admin_log` VALUES ('410', '1', '显示主页', '1546355030', '1');
INSERT INTO `f_admin_log` VALUES ('411', '1', '显示主页', '1546355032', '1');
INSERT INTO `f_admin_log` VALUES ('412', '1', '显示主页', '1546355032', '1');
INSERT INTO `f_admin_log` VALUES ('413', '1', '显示主页', '1546355032', '1');
INSERT INTO `f_admin_log` VALUES ('414', '1', '显示主页', '1546355032', '1');
INSERT INTO `f_admin_log` VALUES ('415', '1', '显示主页', '1546355033', '1');
INSERT INTO `f_admin_log` VALUES ('416', '1', '显示主页', '1546355033', '1');
INSERT INTO `f_admin_log` VALUES ('417', '1', '显示主页', '1546355033', '1');
INSERT INTO `f_admin_log` VALUES ('418', '1', '显示主页', '1546355033', '1');
INSERT INTO `f_admin_log` VALUES ('419', '1', '显示主页', '1546355034', '1');
INSERT INTO `f_admin_log` VALUES ('420', '1', '显示主页', '1546355034', '1');
INSERT INTO `f_admin_log` VALUES ('421', '1', '显示主页', '1546355034', '1');
INSERT INTO `f_admin_log` VALUES ('422', '1', '显示主页', '1546355034', '1');
INSERT INTO `f_admin_log` VALUES ('423', '1', '显示主页', '1546355035', '1');
INSERT INTO `f_admin_log` VALUES ('424', '1', '显示主页', '1546355035', '1');
INSERT INTO `f_admin_log` VALUES ('425', '1', '显示主页', '1546355035', '1');
INSERT INTO `f_admin_log` VALUES ('426', '1', '显示主页', '1546355035', '1');
INSERT INTO `f_admin_log` VALUES ('427', '1', '显示主页', '1546355035', '1');
INSERT INTO `f_admin_log` VALUES ('428', '1', '显示主页', '1546355036', '1');
INSERT INTO `f_admin_log` VALUES ('429', '1', '显示主页', '1546355041', '1');
INSERT INTO `f_admin_log` VALUES ('430', '1', '显示主页', '1546355041', '1');
INSERT INTO `f_admin_log` VALUES ('431', '1', '显示主页', '1546355042', '1');
INSERT INTO `f_admin_log` VALUES ('432', '1', '显示主页', '1546355042', '1');
INSERT INTO `f_admin_log` VALUES ('433', '1', '显示主页', '1546355042', '1');
INSERT INTO `f_admin_log` VALUES ('434', '1', '显示主页', '1546355042', '1');
INSERT INTO `f_admin_log` VALUES ('435', '1', '显示主页', '1546355043', '1');
INSERT INTO `f_admin_log` VALUES ('436', '1', '显示主页', '1546355043', '1');
INSERT INTO `f_admin_log` VALUES ('437', '1', '显示主页', '1546355043', '1');
INSERT INTO `f_admin_log` VALUES ('438', '1', '显示主页', '1546355043', '1');
INSERT INTO `f_admin_log` VALUES ('439', '1', '显示主页', '1546355044', '1');
INSERT INTO `f_admin_log` VALUES ('440', '1', '显示主页', '1546355044', '1');
INSERT INTO `f_admin_log` VALUES ('441', '1', '显示主页', '1546355044', '1');
INSERT INTO `f_admin_log` VALUES ('442', '1', '显示主页', '1546355044', '1');
INSERT INTO `f_admin_log` VALUES ('443', '1', '显示主页', '1546355045', '1');
INSERT INTO `f_admin_log` VALUES ('444', '1', '显示主页', '1546355045', '1');
INSERT INTO `f_admin_log` VALUES ('445', '1', '显示主页', '1546355045', '1');
INSERT INTO `f_admin_log` VALUES ('446', '1', '显示主页', '1546355045', '1');
INSERT INTO `f_admin_log` VALUES ('447', '1', '显示主页', '1546355046', '1');
INSERT INTO `f_admin_log` VALUES ('448', '1', '显示主页', '1546355046', '1');
INSERT INTO `f_admin_log` VALUES ('449', '1', '显示主页', '1546355046', '1');
INSERT INTO `f_admin_log` VALUES ('450', '1', '显示主页', '1546355046', '1');
INSERT INTO `f_admin_log` VALUES ('451', '1', '显示主页', '1546355047', '1');
INSERT INTO `f_admin_log` VALUES ('452', '1', '显示主页', '1546355047', '1');
INSERT INTO `f_admin_log` VALUES ('453', '1', '显示主页', '1546355047', '1');
INSERT INTO `f_admin_log` VALUES ('454', '1', '显示主页', '1546355047', '1');
INSERT INTO `f_admin_log` VALUES ('455', '1', '显示主页', '1546355048', '1');
INSERT INTO `f_admin_log` VALUES ('456', '1', '显示主页', '1546355048', '1');
INSERT INTO `f_admin_log` VALUES ('457', '1', '显示主页', '1546355079', '1');
INSERT INTO `f_admin_log` VALUES ('458', '1', '显示主页', '1546355079', '1');
INSERT INTO `f_admin_log` VALUES ('459', '1', '显示主页', '1546355135', '1');
INSERT INTO `f_admin_log` VALUES ('460', '1', '显示主页', '1546355135', '1');
INSERT INTO `f_admin_log` VALUES ('461', '1', '显示主页', '1546355198', '1');
INSERT INTO `f_admin_log` VALUES ('462', '1', '显示主页', '1546355198', '1');
INSERT INTO `f_admin_log` VALUES ('463', '1', '显示主页', '1546355226', '1');
INSERT INTO `f_admin_log` VALUES ('464', '1', '显示主页', '1546355226', '1');
INSERT INTO `f_admin_log` VALUES ('465', '1', '显示主页', '1546355313', '1');
INSERT INTO `f_admin_log` VALUES ('466', '1', '显示主页', '1546355313', '1');
INSERT INTO `f_admin_log` VALUES ('467', '1', '显示主页', '1546355366', '1');
INSERT INTO `f_admin_log` VALUES ('468', '1', '显示主页', '1546355366', '1');
INSERT INTO `f_admin_log` VALUES ('469', '1', '显示主页', '1546355542', '1');
INSERT INTO `f_admin_log` VALUES ('470', '1', '显示主页', '1546355542', '1');
INSERT INTO `f_admin_log` VALUES ('471', '1', '显示主页', '1546355553', '1');
INSERT INTO `f_admin_log` VALUES ('472', '1', '显示主页', '1546355553', '1');
INSERT INTO `f_admin_log` VALUES ('473', '1', '显示主页', '1546355670', '1');
INSERT INTO `f_admin_log` VALUES ('474', '1', '显示主页', '1546355670', '1');
INSERT INTO `f_admin_log` VALUES ('475', '1', '显示主页', '1546355671', '1');
INSERT INTO `f_admin_log` VALUES ('476', '1', '显示主页', '1546355672', '1');
INSERT INTO `f_admin_log` VALUES ('477', '1', '显示主页', '1546355673', '1');
INSERT INTO `f_admin_log` VALUES ('478', '1', '显示主页', '1546355673', '1');
INSERT INTO `f_admin_log` VALUES ('479', '1', '显示主页', '1546355674', '1');
INSERT INTO `f_admin_log` VALUES ('480', '1', '显示主页', '1546355674', '1');
INSERT INTO `f_admin_log` VALUES ('481', '1', '显示主页', '1546355675', '1');
INSERT INTO `f_admin_log` VALUES ('482', '1', '显示主页', '1546355675', '1');
INSERT INTO `f_admin_log` VALUES ('483', '1', '显示主页', '1546355725', '1');
INSERT INTO `f_admin_log` VALUES ('484', '1', '显示主页', '1546355726', '1');
INSERT INTO `f_admin_log` VALUES ('485', '1', '显示主页', '1546355727', '1');
INSERT INTO `f_admin_log` VALUES ('486', '1', '显示主页', '1546355727', '1');
INSERT INTO `f_admin_log` VALUES ('487', '1', '显示主页', '1546355728', '1');
INSERT INTO `f_admin_log` VALUES ('488', '1', '显示主页', '1546355728', '1');
INSERT INTO `f_admin_log` VALUES ('489', '1', '显示主页', '1546355729', '1');
INSERT INTO `f_admin_log` VALUES ('490', '1', '显示主页', '1546355729', '1');
INSERT INTO `f_admin_log` VALUES ('491', '1', '显示主页', '1546355731', '1');
INSERT INTO `f_admin_log` VALUES ('492', '1', '显示主页', '1546355731', '1');
INSERT INTO `f_admin_log` VALUES ('493', '1', '显示主页', '1546355805', '1');
INSERT INTO `f_admin_log` VALUES ('494', '1', '显示主页', '1546355805', '1');
INSERT INTO `f_admin_log` VALUES ('495', '1', '显示主页', '1546355814', '1');
INSERT INTO `f_admin_log` VALUES ('496', '1', '显示主页', '1546355814', '1');
INSERT INTO `f_admin_log` VALUES ('497', '1', '显示主页', '1546355922', '1');
INSERT INTO `f_admin_log` VALUES ('498', '1', '显示主页', '1546355922', '1');
INSERT INTO `f_admin_log` VALUES ('499', '1', '显示主页', '1546355927', '1');
INSERT INTO `f_admin_log` VALUES ('500', '1', '显示主页', '1546355927', '1');
INSERT INTO `f_admin_log` VALUES ('501', '1', '显示主页', '1546355958', '1');
INSERT INTO `f_admin_log` VALUES ('502', '1', '显示主页', '1546355958', '1');
INSERT INTO `f_admin_log` VALUES ('503', '1', '显示主页', '1546355964', '1');
INSERT INTO `f_admin_log` VALUES ('504', '1', '显示主页', '1546355964', '1');
INSERT INTO `f_admin_log` VALUES ('505', '1', '显示主页', '1546355981', '1');
INSERT INTO `f_admin_log` VALUES ('506', '1', '显示主页', '1546355981', '1');
INSERT INTO `f_admin_log` VALUES ('507', '1', '显示主页', '1546356019', '1');
INSERT INTO `f_admin_log` VALUES ('508', '1', '显示主页', '1546356019', '1');
INSERT INTO `f_admin_log` VALUES ('509', '1', '显示主页', '1546356022', '1');
INSERT INTO `f_admin_log` VALUES ('510', '1', '显示主页', '1546356023', '1');
INSERT INTO `f_admin_log` VALUES ('511', '1', '显示主页', '1546356066', '1');
INSERT INTO `f_admin_log` VALUES ('512', '1', '显示主页', '1546356066', '1');
INSERT INTO `f_admin_log` VALUES ('513', '1', '显示主页', '1546356073', '1');
INSERT INTO `f_admin_log` VALUES ('514', '1', '显示主页', '1546356073', '1');
INSERT INTO `f_admin_log` VALUES ('515', '1', '显示主页', '1546356074', '1');
INSERT INTO `f_admin_log` VALUES ('516', '1', '显示主页', '1546356074', '1');
INSERT INTO `f_admin_log` VALUES ('517', '1', '显示主页', '1546356075', '1');
INSERT INTO `f_admin_log` VALUES ('518', '1', '显示主页', '1546356075', '1');
INSERT INTO `f_admin_log` VALUES ('519', '1', '显示主页', '1546356076', '1');
INSERT INTO `f_admin_log` VALUES ('520', '1', '显示主页', '1546356076', '1');
INSERT INTO `f_admin_log` VALUES ('521', '1', '显示主页', '1546356077', '1');
INSERT INTO `f_admin_log` VALUES ('522', '1', '显示主页', '1546356077', '1');
INSERT INTO `f_admin_log` VALUES ('523', '1', '显示主页', '1546356164', '1');
INSERT INTO `f_admin_log` VALUES ('524', '1', '显示主页', '1546356164', '1');
INSERT INTO `f_admin_log` VALUES ('525', '1', '显示主页', '1546356198', '1');
INSERT INTO `f_admin_log` VALUES ('526', '1', '显示主页', '1546356199', '1');
INSERT INTO `f_admin_log` VALUES ('527', '1', '显示主页', '1546356264', '1');
INSERT INTO `f_admin_log` VALUES ('528', '1', '显示主页', '1546356264', '1');
INSERT INTO `f_admin_log` VALUES ('529', '1', '显示主页', '1546356499', '1');
INSERT INTO `f_admin_log` VALUES ('530', '1', '显示主页', '1546356499', '1');
INSERT INTO `f_admin_log` VALUES ('531', '1', '显示主页', '1546356559', '1');
INSERT INTO `f_admin_log` VALUES ('532', '1', '显示主页', '1546356559', '1');
INSERT INTO `f_admin_log` VALUES ('533', '1', '显示主页', '1546356560', '1');
INSERT INTO `f_admin_log` VALUES ('534', '1', '显示主页', '1546356560', '1');
INSERT INTO `f_admin_log` VALUES ('535', '1', '显示主页', '1546356612', '1');
INSERT INTO `f_admin_log` VALUES ('536', '1', '显示主页', '1546356612', '1');
INSERT INTO `f_admin_log` VALUES ('537', '1', '显示主页', '1546356775', '1');
INSERT INTO `f_admin_log` VALUES ('538', '1', '显示主页', '1546356775', '1');
INSERT INTO `f_admin_log` VALUES ('539', '1', '显示主页', '1546356775', '1');
INSERT INTO `f_admin_log` VALUES ('540', '1', '显示主页', '1546356776', '1');
INSERT INTO `f_admin_log` VALUES ('541', '1', '显示主页', '1546356852', '1');
INSERT INTO `f_admin_log` VALUES ('542', '1', '显示主页', '1546356852', '1');
INSERT INTO `f_admin_log` VALUES ('543', '1', '显示主页', '1546356866', '1');
INSERT INTO `f_admin_log` VALUES ('544', '1', '显示主页', '1546356866', '1');
INSERT INTO `f_admin_log` VALUES ('545', '1', '显示主页', '1546356872', '1');
INSERT INTO `f_admin_log` VALUES ('546', '1', '显示主页', '1546356872', '1');
INSERT INTO `f_admin_log` VALUES ('547', '1', '显示主页', '1546356876', '1');
INSERT INTO `f_admin_log` VALUES ('548', '1', '显示主页', '1546356876', '1');
INSERT INTO `f_admin_log` VALUES ('549', '1', '显示主页', '1546357137', '1');
INSERT INTO `f_admin_log` VALUES ('550', '1', '显示主页', '1546357137', '1');
INSERT INTO `f_admin_log` VALUES ('551', '1', '显示主页', '1546357230', '1');
INSERT INTO `f_admin_log` VALUES ('552', '1', '显示主页', '1546357230', '1');
INSERT INTO `f_admin_log` VALUES ('553', '1', '显示主页', '1546357270', '1');
INSERT INTO `f_admin_log` VALUES ('554', '1', '显示主页', '1546357270', '1');
INSERT INTO `f_admin_log` VALUES ('555', '1', '显示主页', '1546357418', '1');
INSERT INTO `f_admin_log` VALUES ('556', '1', '显示主页', '1546357418', '1');
INSERT INTO `f_admin_log` VALUES ('557', '1', '显示主页', '1546357451', '1');
INSERT INTO `f_admin_log` VALUES ('558', '1', '显示主页', '1546357451', '1');
INSERT INTO `f_admin_log` VALUES ('559', '1', '显示主页', '1546357461', '1');
INSERT INTO `f_admin_log` VALUES ('560', '1', '显示主页', '1546357461', '1');
INSERT INTO `f_admin_log` VALUES ('561', '1', '显示主页', '1546357524', '1');
INSERT INTO `f_admin_log` VALUES ('562', '1', '显示主页', '1546357524', '1');
INSERT INTO `f_admin_log` VALUES ('563', '1', '显示主页', '1546357550', '1');
INSERT INTO `f_admin_log` VALUES ('564', '1', '显示主页', '1546357550', '1');
INSERT INTO `f_admin_log` VALUES ('565', '1', '显示主页', '1546357612', '1');
INSERT INTO `f_admin_log` VALUES ('566', '1', '显示主页', '1546357612', '1');
INSERT INTO `f_admin_log` VALUES ('567', '1', '显示主页', '1546357653', '1');
INSERT INTO `f_admin_log` VALUES ('568', '1', '显示主页', '1546357653', '1');
INSERT INTO `f_admin_log` VALUES ('569', '1', '显示主页', '1546358189', '1');
INSERT INTO `f_admin_log` VALUES ('570', '1', '显示主页', '1546358189', '1');
INSERT INTO `f_admin_log` VALUES ('571', '1', '显示主页', '1546358192', '1');
INSERT INTO `f_admin_log` VALUES ('572', '1', '显示主页', '1546358192', '1');
INSERT INTO `f_admin_log` VALUES ('573', '1', '显示主页', '1546358193', '1');
INSERT INTO `f_admin_log` VALUES ('574', '1', '显示主页', '1546358193', '1');
INSERT INTO `f_admin_log` VALUES ('575', '1', '显示主页', '1546358211', '1');
INSERT INTO `f_admin_log` VALUES ('576', '1', '显示主页', '1546358211', '1');
INSERT INTO `f_admin_log` VALUES ('577', '1', '显示主页', '1546358212', '1');
INSERT INTO `f_admin_log` VALUES ('578', '1', '显示主页', '1546358212', '1');
INSERT INTO `f_admin_log` VALUES ('579', '1', '显示主页', '1546358213', '1');
INSERT INTO `f_admin_log` VALUES ('580', '1', '显示主页', '1546358213', '1');
INSERT INTO `f_admin_log` VALUES ('581', '1', '显示主页', '1546358220', '1');
INSERT INTO `f_admin_log` VALUES ('582', '1', '显示主页', '1546358220', '1');
INSERT INTO `f_admin_log` VALUES ('583', '1', '显示主页', '1546358221', '1');
INSERT INTO `f_admin_log` VALUES ('584', '1', '显示主页', '1546358221', '1');
INSERT INTO `f_admin_log` VALUES ('585', '1', '显示主页', '1546358250', '1');
INSERT INTO `f_admin_log` VALUES ('586', '1', '显示主页', '1546358250', '1');
INSERT INTO `f_admin_log` VALUES ('587', '1', '显示主页', '1546358251', '1');
INSERT INTO `f_admin_log` VALUES ('588', '1', '显示主页', '1546358251', '1');
INSERT INTO `f_admin_log` VALUES ('589', '1', '显示主页', '1546358252', '1');
INSERT INTO `f_admin_log` VALUES ('590', '1', '显示主页', '1546358252', '1');
INSERT INTO `f_admin_log` VALUES ('591', '1', '显示主页', '1546358282', '1');
INSERT INTO `f_admin_log` VALUES ('592', '1', '显示主页', '1546358282', '1');
INSERT INTO `f_admin_log` VALUES ('593', '1', '显示主页', '1546358283', '1');
INSERT INTO `f_admin_log` VALUES ('594', '1', '显示主页', '1546358284', '1');
INSERT INTO `f_admin_log` VALUES ('595', '1', '显示主页', '1546358345', '1');
INSERT INTO `f_admin_log` VALUES ('596', '1', '显示主页', '1546358345', '1');
INSERT INTO `f_admin_log` VALUES ('597', '1', '显示主页', '1546358364', '1');
INSERT INTO `f_admin_log` VALUES ('598', '1', '显示主页', '1546358364', '1');
INSERT INTO `f_admin_log` VALUES ('599', '1', '显示主页', '1546358379', '1');
INSERT INTO `f_admin_log` VALUES ('600', '1', '显示主页', '1546358380', '1');
INSERT INTO `f_admin_log` VALUES ('601', '1', '显示主页', '1546358403', '1');
INSERT INTO `f_admin_log` VALUES ('602', '1', '显示主页', '1546358403', '1');
INSERT INTO `f_admin_log` VALUES ('603', '1', '显示主页', '1546358487', '1');
INSERT INTO `f_admin_log` VALUES ('604', '1', '显示主页', '1546358487', '1');
INSERT INTO `f_admin_log` VALUES ('605', '1', '清除缓存', '1546358515', '1');
INSERT INTO `f_admin_log` VALUES ('606', '1', '显示主页', '1546358517', '1');
INSERT INTO `f_admin_log` VALUES ('607', '1', '显示主页', '1546358517', '1');
INSERT INTO `f_admin_log` VALUES ('608', '1', '显示主页', '1546358535', '1');
INSERT INTO `f_admin_log` VALUES ('609', '1', '显示主页', '1546358535', '1');
INSERT INTO `f_admin_log` VALUES ('610', '1', '显示主页', '1546359178', '1');
INSERT INTO `f_admin_log` VALUES ('611', '1', '显示主页', '1546359178', '1');
INSERT INTO `f_admin_log` VALUES ('612', '1', '显示主页', '1546359228', '1');
INSERT INTO `f_admin_log` VALUES ('613', '1', '显示主页', '1546359228', '1');
INSERT INTO `f_admin_log` VALUES ('614', '1', '显示主页', '1546359323', '1');
INSERT INTO `f_admin_log` VALUES ('615', '1', '显示主页', '1546359323', '1');
INSERT INTO `f_admin_log` VALUES ('616', '1', '显示主页', '1546359422', '1');
INSERT INTO `f_admin_log` VALUES ('617', '1', '显示主页', '1546359423', '1');
INSERT INTO `f_admin_log` VALUES ('618', '1', '显示主页', '1546359439', '1');
INSERT INTO `f_admin_log` VALUES ('619', '1', '显示主页', '1546359439', '1');
INSERT INTO `f_admin_log` VALUES ('620', '1', '显示主页', '1546359472', '1');
INSERT INTO `f_admin_log` VALUES ('621', '1', '显示主页', '1546359473', '1');
INSERT INTO `f_admin_log` VALUES ('622', '1', '显示主页', '1546359520', '1');
INSERT INTO `f_admin_log` VALUES ('623', '1', '显示主页', '1546359520', '1');
INSERT INTO `f_admin_log` VALUES ('624', '1', '显示主页', '1546359708', '1');
INSERT INTO `f_admin_log` VALUES ('625', '1', '显示主页', '1546359708', '1');
INSERT INTO `f_admin_log` VALUES ('626', '1', '显示主页', '1546359716', '1');
INSERT INTO `f_admin_log` VALUES ('627', '1', '显示主页', '1546359716', '1');
INSERT INTO `f_admin_log` VALUES ('628', '1', '显示主页', '1546359725', '1');
INSERT INTO `f_admin_log` VALUES ('629', '1', '显示主页', '1546359725', '1');
INSERT INTO `f_admin_log` VALUES ('630', '1', '清除缓存', '1546359754', '1');
INSERT INTO `f_admin_log` VALUES ('631', '1', '显示主页', '1546359772', '1');
INSERT INTO `f_admin_log` VALUES ('632', '1', '显示主页', '1546359772', '1');
INSERT INTO `f_admin_log` VALUES ('633', '1', '显示主页', '1546359775', '1');
INSERT INTO `f_admin_log` VALUES ('634', '1', '显示主页', '1546359775', '1');
INSERT INTO `f_admin_log` VALUES ('635', '1', '显示主页', '1546359776', '1');
INSERT INTO `f_admin_log` VALUES ('636', '1', '显示主页', '1546359776', '1');
INSERT INTO `f_admin_log` VALUES ('637', '1', '清除缓存', '1546359865', '1');
INSERT INTO `f_admin_log` VALUES ('638', '1', '显示主页', '1546359883', '1');
INSERT INTO `f_admin_log` VALUES ('639', '1', '显示主页', '1546359883', '1');
INSERT INTO `f_admin_log` VALUES ('640', '1', '显示主页', '1546359909', '1');
INSERT INTO `f_admin_log` VALUES ('641', '1', '显示主页', '1546359909', '1');
INSERT INTO `f_admin_log` VALUES ('642', '1', '清除缓存', '1546359913', '1');
INSERT INTO `f_admin_log` VALUES ('643', '1', '显示主页', '1546359936', '1');
INSERT INTO `f_admin_log` VALUES ('644', '1', '显示主页', '1546359936', '1');
INSERT INTO `f_admin_log` VALUES ('645', '1', '显示主页', '1546359946', '1');
INSERT INTO `f_admin_log` VALUES ('646', '1', '显示主页', '1546359946', '1');
INSERT INTO `f_admin_log` VALUES ('647', '1', '清除缓存', '1546359953', '1');
INSERT INTO `f_admin_log` VALUES ('648', '1', '显示主页', '1546360036', '1');
INSERT INTO `f_admin_log` VALUES ('649', '1', '显示主页', '1546360036', '1');
INSERT INTO `f_admin_log` VALUES ('650', '1', '显示主页', '1546360060', '1');
INSERT INTO `f_admin_log` VALUES ('651', '1', '显示主页', '1546360060', '1');
INSERT INTO `f_admin_log` VALUES ('652', '1', '显示主页', '1546360072', '1');
INSERT INTO `f_admin_log` VALUES ('653', '1', '显示主页', '1546360072', '1');
INSERT INTO `f_admin_log` VALUES ('654', '1', '显示主页', '1546360156', '1');
INSERT INTO `f_admin_log` VALUES ('655', '1', '显示主页', '1546360156', '1');
INSERT INTO `f_admin_log` VALUES ('656', '1', '显示主页', '1546360157', '1');
INSERT INTO `f_admin_log` VALUES ('657', '1', '显示主页', '1546360157', '1');
INSERT INTO `f_admin_log` VALUES ('658', '1', '显示主页', '1546360158', '1');
INSERT INTO `f_admin_log` VALUES ('659', '1', '显示主页', '1546360158', '1');
INSERT INTO `f_admin_log` VALUES ('660', '1', '显示主页', '1546360158', '1');
INSERT INTO `f_admin_log` VALUES ('661', '1', '显示主页', '1546360159', '1');
INSERT INTO `f_admin_log` VALUES ('662', '1', '清除缓存', '1546360162', '1');
INSERT INTO `f_admin_log` VALUES ('663', '1', '显示主页', '1546360164', '1');
INSERT INTO `f_admin_log` VALUES ('664', '1', '显示主页', '1546360164', '1');
INSERT INTO `f_admin_log` VALUES ('665', '1', '显示主页', '1546360168', '1');
INSERT INTO `f_admin_log` VALUES ('666', '1', '显示主页', '1546360168', '1');
INSERT INTO `f_admin_log` VALUES ('667', '1', '显示主页', '1546360169', '1');
INSERT INTO `f_admin_log` VALUES ('668', '1', '显示主页', '1546360169', '1');
INSERT INTO `f_admin_log` VALUES ('669', '1', '显示主页', '1546360276', '1');
INSERT INTO `f_admin_log` VALUES ('670', '1', '显示主页', '1546360276', '1');
INSERT INTO `f_admin_log` VALUES ('671', '1', '清除缓存', '1546360280', '1');
INSERT INTO `f_admin_log` VALUES ('672', '1', '显示主页', '1546360283', '1');
INSERT INTO `f_admin_log` VALUES ('673', '1', '显示主页', '1546360283', '1');
INSERT INTO `f_admin_log` VALUES ('674', '1', '显示主页', '1546360288', '1');
INSERT INTO `f_admin_log` VALUES ('675', '1', '显示主页', '1546360288', '1');
INSERT INTO `f_admin_log` VALUES ('676', '1', '显示主页', '1546360289', '1');
INSERT INTO `f_admin_log` VALUES ('677', '1', '显示主页', '1546360289', '1');
INSERT INTO `f_admin_log` VALUES ('678', '1', '个人信息', '1546360303', '1');
INSERT INTO `f_admin_log` VALUES ('679', '1', '个人信息', '1546360315', '1');
INSERT INTO `f_admin_log` VALUES ('680', '1', '显示主页', '1546360346', '1');
INSERT INTO `f_admin_log` VALUES ('681', '1', '显示主页', '1546360346', '1');
INSERT INTO `f_admin_log` VALUES ('682', '1', '个人信息', '1546360367', '1');
INSERT INTO `f_admin_log` VALUES ('683', '1', '个人信息', '1546360372', '1');
INSERT INTO `f_admin_log` VALUES ('684', '1', '个人信息', '1546360376', '1');
INSERT INTO `f_admin_log` VALUES ('685', '1', '在线聊天', '1546360406', '1');
INSERT INTO `f_admin_log` VALUES ('686', '1', '显示主页', '1546360410', '1');
INSERT INTO `f_admin_log` VALUES ('687', '1', '显示主页', '1546360411', '1');
INSERT INTO `f_admin_log` VALUES ('688', '1', '查看会员', '1546360415', '1');
INSERT INTO `f_admin_log` VALUES ('689', '1', '查看会员', '1546360415', '1');
INSERT INTO `f_admin_log` VALUES ('690', '1', '会员数据导出', '1546360420', '1');
INSERT INTO `f_admin_log` VALUES ('691', '1', '显示主页', '1546360473', '1');
INSERT INTO `f_admin_log` VALUES ('692', '1', '查看会员', '1546360473', '1');
INSERT INTO `f_admin_log` VALUES ('693', '1', '查看会员', '1546360473', '1');
INSERT INTO `f_admin_log` VALUES ('694', '1', '会员数据导出', '1546360477', '1');
INSERT INTO `f_admin_log` VALUES ('695', '1', '显示主页', '1546360520', '1');
INSERT INTO `f_admin_log` VALUES ('696', '1', '显示主页', '1546360521', '1');
INSERT INTO `f_admin_log` VALUES ('697', '1', '显示主页', '1546360523', '1');
INSERT INTO `f_admin_log` VALUES ('698', '1', '显示主页', '1546360523', '1');
INSERT INTO `f_admin_log` VALUES ('699', '1', '查看会员', '1546360534', '1');
INSERT INTO `f_admin_log` VALUES ('700', '1', '查看会员', '1546360534', '1');
INSERT INTO `f_admin_log` VALUES ('701', '1', '会员数据导出', '1546360536', '1');
INSERT INTO `f_admin_log` VALUES ('702', '1', '会员数据导出', '1546360548', '1');
INSERT INTO `f_admin_log` VALUES ('703', '1', '会员数据导出', '1546360550', '1');
INSERT INTO `f_admin_log` VALUES ('704', '1', '会员数据导出', '1546360557', '1');
INSERT INTO `f_admin_log` VALUES ('705', '1', '显示主页', '1546360583', '1');
INSERT INTO `f_admin_log` VALUES ('706', '1', '查看会员', '1546360584', '1');
INSERT INTO `f_admin_log` VALUES ('707', '1', '查看会员', '1546360584', '1');
INSERT INTO `f_admin_log` VALUES ('708', '1', '显示主页', '1546360594', '1');
INSERT INTO `f_admin_log` VALUES ('709', '1', '显示主页', '1546360594', '1');
INSERT INTO `f_admin_log` VALUES ('710', '1', '查看会员', '1546360596', '1');
INSERT INTO `f_admin_log` VALUES ('711', '1', '查看会员', '1546360596', '1');
INSERT INTO `f_admin_log` VALUES ('712', '1', '删除会员', '1546360602', '1');
INSERT INTO `f_admin_log` VALUES ('713', '1', '查看会员', '1546360605', '1');
INSERT INTO `f_admin_log` VALUES ('714', '1', '查看会员', '1546360605', '1');
INSERT INTO `f_admin_log` VALUES ('715', '1', '删除会员', '1546360615', '1');
INSERT INTO `f_admin_log` VALUES ('716', '1', '查看会员', '1546360619', '1');
INSERT INTO `f_admin_log` VALUES ('717', '1', '查看会员', '1546360620', '1');
INSERT INTO `f_admin_log` VALUES ('718', '1', '编辑会员', '1546360634', '1');
INSERT INTO `f_admin_log` VALUES ('719', '1', '编辑会员', '1546360639', '1');
INSERT INTO `f_admin_log` VALUES ('720', '1', '编辑会员', '1546360644', '1');
INSERT INTO `f_admin_log` VALUES ('721', '1', '查看会员', '1546360645', '1');
INSERT INTO `f_admin_log` VALUES ('722', '1', '查看会员', '1546360645', '1');
INSERT INTO `f_admin_log` VALUES ('723', '1', '查看会员', '1546360658', '1');
INSERT INTO `f_admin_log` VALUES ('724', '1', '查看会员', '1546360658', '1');
INSERT INTO `f_admin_log` VALUES ('725', '1', '会员数据导出', '1546360667', '1');
INSERT INTO `f_admin_log` VALUES ('726', '1', '显示主页', '1546360818', '1');
INSERT INTO `f_admin_log` VALUES ('727', '1', '显示主页', '1546360818', '1');
INSERT INTO `f_admin_log` VALUES ('728', '1', '查看管理员', '1546360825', '1');
INSERT INTO `f_admin_log` VALUES ('729', '1', '查看管理员', '1546360825', '1');
INSERT INTO `f_admin_log` VALUES ('730', '1', '管理员数据导出', '1546360828', '1');
INSERT INTO `f_admin_log` VALUES ('731', '1', '查看管理员', '1546360860', '1');
INSERT INTO `f_admin_log` VALUES ('732', '1', '查看管理员', '1546360879', '1');
INSERT INTO `f_admin_log` VALUES ('733', '1', '查看管理员', '1546360879', '1');
INSERT INTO `f_admin_log` VALUES ('734', '1', '管理员数据导出', '1546360899', '1');
INSERT INTO `f_admin_log` VALUES ('735', '1', '管理员数据导出', '1546360900', '1');
INSERT INTO `f_admin_log` VALUES ('736', '1', '管理员数据导出', '1546360905', '1');
INSERT INTO `f_admin_log` VALUES ('737', '1', '显示主页', '1546360913', '1');
INSERT INTO `f_admin_log` VALUES ('738', '1', '显示主页', '1546360913', '1');
INSERT INTO `f_admin_log` VALUES ('739', '1', '查看订单', '1546360928', '1');
INSERT INTO `f_admin_log` VALUES ('740', '1', '查看管理员', '1546360931', '1');
INSERT INTO `f_admin_log` VALUES ('741', '1', '查看管理员', '1546360931', '1');
INSERT INTO `f_admin_log` VALUES ('742', '1', '角色查看', '1546360931', '1');
INSERT INTO `f_admin_log` VALUES ('743', '1', '导出管理员角色数据', '1546360931', '1');
INSERT INTO `f_admin_log` VALUES ('744', '1', '角色查看', '1546360932', '1');
INSERT INTO `f_admin_log` VALUES ('745', '1', '导出管理员角色数据', '1546360934', '1');
INSERT INTO `f_admin_log` VALUES ('746', '1', '管理员数据导出', '1546361002', '1');
INSERT INTO `f_admin_log` VALUES ('747', '1', '显示主页', '1546361010', '1');
INSERT INTO `f_admin_log` VALUES ('748', '1', '显示主页', '1546361011', '1');
INSERT INTO `f_admin_log` VALUES ('749', '1', '显示主页', '1546361399', '1');
INSERT INTO `f_admin_log` VALUES ('750', '1', '显示主页', '1546361400', '1');
INSERT INTO `f_admin_log` VALUES ('751', '1', '查看会员', '1546361403', '1');
INSERT INTO `f_admin_log` VALUES ('752', '1', '查看会员', '1546361403', '1');
INSERT INTO `f_admin_log` VALUES ('753', '1', '会员数据导出', '1546361405', '1');
INSERT INTO `f_admin_log` VALUES ('754', '1', '会员数据导出', '1546361435', '1');
INSERT INTO `f_admin_log` VALUES ('755', '1', '显示主页', '1546361627', '1');
INSERT INTO `f_admin_log` VALUES ('756', '1', '显示主页', '1546361628', '1');
INSERT INTO `f_admin_log` VALUES ('757', '1', '查看会员', '1546361630', '1');
INSERT INTO `f_admin_log` VALUES ('758', '1', '查看会员', '1546361630', '1');
INSERT INTO `f_admin_log` VALUES ('759', '1', '会员数据导出', '1546361632', '1');
INSERT INTO `f_admin_log` VALUES ('760', '1', '显示主页', '1546361689', '1');
INSERT INTO `f_admin_log` VALUES ('761', '1', '显示主页', '1546361689', '1');
INSERT INTO `f_admin_log` VALUES ('762', '1', '查看会员', '1546361691', '1');
INSERT INTO `f_admin_log` VALUES ('763', '1', '查看会员', '1546361691', '1');
INSERT INTO `f_admin_log` VALUES ('764', '1', '会员数据导出', '1546361694', '1');
INSERT INTO `f_admin_log` VALUES ('765', '1', '查看会员', '1546361726', '1');
INSERT INTO `f_admin_log` VALUES ('766', '1', '查看会员', '1546361727', '1');
INSERT INTO `f_admin_log` VALUES ('767', '1', '显示主页', '1546361817', '1');
INSERT INTO `f_admin_log` VALUES ('768', '1', '显示主页', '1546361817', '1');
INSERT INTO `f_admin_log` VALUES ('769', '1', '查看会员', '1546361820', '1');
INSERT INTO `f_admin_log` VALUES ('770', '1', '查看会员', '1546361820', '1');
INSERT INTO `f_admin_log` VALUES ('771', '1', '会员数据导出', '1546361822', '1');
INSERT INTO `f_admin_log` VALUES ('772', '1', '会员数据导出', '1546361835', '1');
INSERT INTO `f_admin_log` VALUES ('773', '1', '显示主页', '1546361865', '1');
INSERT INTO `f_admin_log` VALUES ('774', '1', '显示主页', '1546361865', '1');
INSERT INTO `f_admin_log` VALUES ('775', '1', '查看会员', '1546361866', '1');
INSERT INTO `f_admin_log` VALUES ('776', '1', '查看会员', '1546361867', '1');
INSERT INTO `f_admin_log` VALUES ('777', '1', '会员数据导出', '1546361869', '1');
INSERT INTO `f_admin_log` VALUES ('778', '1', '显示主页', '1546361897', '1');
INSERT INTO `f_admin_log` VALUES ('779', '1', '显示主页', '1546361898', '1');
INSERT INTO `f_admin_log` VALUES ('780', '1', '查看会员', '1546361899', '1');
INSERT INTO `f_admin_log` VALUES ('781', '1', '查看会员', '1546361899', '1');
INSERT INTO `f_admin_log` VALUES ('782', '1', '会员数据导出', '1546361904', '1');
INSERT INTO `f_admin_log` VALUES ('783', '1', '显示主页', '1546361925', '1');
INSERT INTO `f_admin_log` VALUES ('784', '1', '显示主页', '1546361926', '1');
INSERT INTO `f_admin_log` VALUES ('785', '1', '查看会员', '1546361927', '1');
INSERT INTO `f_admin_log` VALUES ('786', '1', '查看会员', '1546361928', '1');
INSERT INTO `f_admin_log` VALUES ('787', '1', '会员数据导出', '1546361930', '1');
INSERT INTO `f_admin_log` VALUES ('788', '1', '显示主页', '1546362003', '1');
INSERT INTO `f_admin_log` VALUES ('789', '1', '显示主页', '1546362003', '1');
INSERT INTO `f_admin_log` VALUES ('790', '1', '显示主页', '1546362022', '1');
INSERT INTO `f_admin_log` VALUES ('791', '1', '显示主页', '1546362023', '1');
INSERT INTO `f_admin_log` VALUES ('792', '1', '显示主页', '1546362071', '1');
INSERT INTO `f_admin_log` VALUES ('793', '1', '显示主页', '1546362071', '1');
INSERT INTO `f_admin_log` VALUES ('794', '1', '显示主页', '1546362105', '1');
INSERT INTO `f_admin_log` VALUES ('795', '1', '显示主页', '1546362105', '1');
INSERT INTO `f_admin_log` VALUES ('796', '1', '显示主页', '1546362145', '1');
INSERT INTO `f_admin_log` VALUES ('797', '1', '显示主页', '1546362145', '1');
INSERT INTO `f_admin_log` VALUES ('798', '1', '查看管理员', '1546362149', '1');
INSERT INTO `f_admin_log` VALUES ('799', '1', '查看管理员', '1546362149', '1');
INSERT INTO `f_admin_log` VALUES ('800', '1', '管理员数据导出', '1546362152', '1');
INSERT INTO `f_admin_log` VALUES ('801', '1', '查看权限资源', '1546362168', '1');
INSERT INTO `f_admin_log` VALUES ('802', '1', '查看权限资源', '1546362168', '1');
INSERT INTO `f_admin_log` VALUES ('803', '1', '查看权限资源', '1546362241', '1');
INSERT INTO `f_admin_log` VALUES ('804', '1', '查看权限资源', '1546362241', '1');
INSERT INTO `f_admin_log` VALUES ('805', '1', '查看管理员日志', '1546362243', '1');
INSERT INTO `f_admin_log` VALUES ('806', '1', '查看管理员日志', '1546362243', '1');
INSERT INTO `f_admin_log` VALUES ('807', '1', '会员数据导出', '1546362251', '1');
INSERT INTO `f_admin_log` VALUES ('808', '1', '查看管理员日志', '1546362260', '1');
INSERT INTO `f_admin_log` VALUES ('809', '1', '查看管理员日志', '1546362267', '1');
INSERT INTO `f_admin_log` VALUES ('810', '1', '查看管理员日志', '1546362276', '1');
INSERT INTO `f_admin_log` VALUES ('811', '1', '查看管理员日志', '1546362282', '1');
INSERT INTO `f_admin_log` VALUES ('812', '1', '数据可视化', '1546362307', '1');
INSERT INTO `f_admin_log` VALUES ('813', '1', '数据备份', '1546362311', '1');
INSERT INTO `f_admin_log` VALUES ('814', '1', '数据备份', '1546362317', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_article`
-- ----------------------------

INSERT INTO `f_article` VALUES ('1', '方法很多很多', '而过的故事是个', '&lt;p&gt;风电混合色而他也廏&lt;img src=&quot;/ueditor/php/upload/image/20190101/1546352068734780.png&quot; title=&quot;1546352068734780.png&quot; alt=&quot;image.png&quot;/&gt;&lt;/p&gt;', '0', '1546352070');

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
INSERT INTO `f_evaluation_info` VALUES ('5', '1', 'single', '函数______能读取文本文件中的一行。读取二进制文件或者其他文件时，应当用______函数。', 'D', 'fgets(), fseek()_@fread(), fgets()_@fputs(), fgets()_@fgets(), fread()', '5');
INSERT INTO `f_evaluation_info` VALUES ('6', '1', 'single', '以下哪个选项能将文件指针移到开头？', 'C', 'reset()_@fseek(0, SEEK_END)_@fseek(0, SEEK_SET)_@fseek(0, SEEK_CUR)', '5');
INSERT INTO `f_evaluation_info` VALUES ('9', '1', 'multi', '下面功能 PHP 无法实现的是', 'C_@D', '服务器端脚本运行_@命令行脚本运行_@客户端图形界面（GUI）程序_@浏览器端执行 DOM 操作', '5');
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
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_members`
-- ----------------------------

INSERT INTO `f_members` VALUES ('1', 'fengyi', '123456', '0', '1545711693', '4', '0', '1719847255@qq.com', '贵州省贵阳市云岩区大营坡长冲农民新村40号', '18885175642', '1');
INSERT INTO `f_members` VALUES ('43', '小老二', '111111', '1', '1545711693', '2', '1', '234567890@qq.com', '贵州省贵阳市', '18208482313', '1');
INSERT INTO `f_members` VALUES ('44', '谢云芸', '111111', '1', '1545711693', '2', '0', '234567890@qq.com', '贵州省贵阳市', '14567890567', '1');
INSERT INTO `f_members` VALUES ('45', 'xieyunyun', '111111', '1', '1545711693', '2', '1', '34567890-@qq.com', '贵州省贵阳市', '15678900987', '1');
INSERT INTO `f_members` VALUES ('56', '嘿嘿嘿', '123456', '0', '1545712520', '2', '1', '345678@qq.com', '贵州省贵阳市', '16789676756', '1');
INSERT INTO `f_members` VALUES ('50', '园艺师', '111111', '0', '1545711635', '4', '1', '23456789@qq.com', '贵州省贵阳市', '14567898768', '1');
INSERT INTO `f_members` VALUES ('51', '普通会员', '111111', '0', '1545711693', '4', '0', '23456789@qq.com', '贵州省贵阳市', '14567890987', '1');
INSERT INTO `f_members` VALUES ('53', '铁素体', '123456', '0', '1544245140', '1', '1', '345678967@qq.com', '贵阳市', '18456789876', '1');
INSERT INTO `f_members` VALUES ('54', 'wwwwwww', '111111', '0', '1545711693', '1', '1', '234567654567@qq.com', '贵州省贵阳市', '13456789876', '1');
INSERT INTO `f_members` VALUES ('58', '啊啊啊啊', '111111', '0', '1545751060', '1', '1', '23456576786@qq.com', '贵州贵阳', '15889787879', '0');
INSERT INTO `f_members` VALUES ('69', '阿凡达房管局发广告', '111111', '0', '1546156829', '4', '0', '465587686796@qq.com', '工人一天一进入体育', '13565676765', '0');
INSERT INTO `f_members` VALUES ('67', '该如个人回电话', '111111', '0', '1545895898', '2', '0', '4345656876@qq.com', '广东人恢复添加附件', '15679789688', '0');
INSERT INTO `f_members` VALUES ('63', '反复反复付', '123456', '0', '1545895960', '2', '0', '4657676776@qq.com', '更好具体时间', '16895767658', '1');
INSERT INTO `f_members` VALUES ('68', '海豚音', '111111', '0', '1545895960', '4', '0', '43465465756@qq.com', '头发与人体一天如何', '14556884645', '1');
INSERT INTO `f_members` VALUES ('70', '为钢结构还叫的冠农股份', '111111', '0', '1546352035', '4', '0', '3545577867@qq.com', '规划局法规回复', '16587857858', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
INSERT INTO `f_role_author` VALUES ('9', '管理员数据导出', '系统后台—Admin', '权限管理', '/index.php/admin/Admin/admin_export', '1', '');
INSERT INTO `f_role_author` VALUES ('10', '网站基础设置', '系统后台—Admin', '系统管理', '/index.php/admin/System/index@/index.php/admin/System/set_email', '1', '');
INSERT INTO `f_role_author` VALUES ('11', '数据备份', '系统后台—Admin', '系统管理', '/index.php/admin/System/backups@/index.php/admin/System/export_database@/index.php/admin/System/put_table_file', '1', '');
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
INSERT INTO `f_role_author` VALUES ('40', '数据可视化', '系统后台—Admin', '系统管理', '/index.php/admin/System/echarts', '1', '');
INSERT INTO `f_role_author` VALUES ('41', '添加权限资源', '系统后台—Admin', '权限管理', '/index.php/admin/Admin/role_resource_add', '1', '');
INSERT INTO `f_role_author` VALUES ('42', '查看权限资源', '系统后台—Admin', '权限管理', '/index.php/admin/Admin/role_resource_list@/index.php/admin/Admin/role_resource_info', '1', '');
INSERT INTO `f_role_author` VALUES ('43', '添加管理员', '系统后台—Admin', '权限管理', '/index.php/admin/Admin/admin_add', '1', '');
INSERT INTO `f_role_author` VALUES ('44', '编辑管理员', '系统后台—Admin', '权限管理', '/index.php/admin/Admin/admin_edit', '1', '');
INSERT INTO `f_role_author` VALUES ('45', '删除管理员', '系统后台—Admin', '权限管理', '/index.php/admin/Admin/admin_delete@/index.php/admin/Admin/admin_delete_all', '1', '');
INSERT INTO `f_role_author` VALUES ('46', '角色查看', '系统后台—Admin', '权限管理', '/index.php/admin/Admin/admin_role@/index.php/admin/Admin/admin_role_list@/index.php/admin/Admin/role_view', '1', '');
INSERT INTO `f_role_author` VALUES ('47', '角色编辑', '系统后台—Admin', '权限管理', '/index.php/admin/Admin/role_edit', '1', '');
INSERT INTO `f_role_author` VALUES ('48', '角色删除', '系统后台—Admin', '权限管理', '/index.php/admin/Admin/role_delete', '1', '');
INSERT INTO `f_role_author` VALUES ('49', '权限资源删除', '系统后台—Admin', '权限管理', '/index.php/admin/Admin/role_resource_delete@/index.php/admin/Admin/resource_delete_all', '1', '');
INSERT INTO `f_role_author` VALUES ('52', '清空会员回收站', '系统后台—Admin', '回收站', '/index.php/admin/Recycle/empty_recycle@/index.php/admin/Recycle/delete_all@/index.php/admin/Recycle/delete_member_complete', '1', '');
INSERT INTO `f_role_author` VALUES ('53', '查看已删会员', '系统后台—Admin', '回收站', '/index.php/admin/Recycle/delete_member_list@/index.php/admin/Recycle/member_info@/index.php/admin/Recycle/member_view', '1', '');
INSERT INTO `f_role_author` VALUES ('50', '查看文章', '系统后台—Admin', '文章管理', '/index.php/admin/Article/index', '1', '');
INSERT INTO `f_role_author` VALUES ('51', '文章编辑', '系统后台—Admin', '文章管理', '/index.php/admin/Article/article_toggle@/index.php/admin/Article/article_edit', '1', '');
INSERT INTO `f_role_author` VALUES ('54', '查看管理员日志', '系统后台—Admin', '权限管理', '/index.php/admin/Admin/admin_log@/index.php/admin/Admin/admin_log_list', '1', '');
INSERT INTO `f_role_author` VALUES ('55', '导出管理员角色数据', '系统后台—Admin', '权限管理', '/index.php/admin/Admin/admin_role_export', '1', '');
INSERT INTO `f_role_author` VALUES ('56', '编辑权限资源', '系统后台—Admin', '权限管理', '/index.php/admin/Admin/role_resource_edit', '1', '');

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
INSERT INTO `f_role_group` VALUES ('10', '普通管理员', '/index.php/admin/System/update_pass@/index.php/admin/System/clock_pass@/index.php/admin/System/extraconfig@/index.php/admin/Login/login@/index.php/admin/Login/base_login@/index.php/admin/Login/last_login_info@/index.php/admin/Login/count_login@/index.php/admin/Login/extraconfig@/index.php/admin/Login/index@/index.php/admin/Login/logout@/index.php/admin/Index/clear_cache@/index.php/admin/Index/del_runtime@/index.php/admin/Index/index@/index.php/admin/Index/welcome@/index.php/admin/Index/max_time@/index.php/admin/System/sleep_timeout@/index.php/admin/Admin/admin_info@/index.php/admin/Admin/up_photos@/index.php/admin/Admin/base_info@/index.php/admin/Admin/get_options@/index.php/admin/Admin/cutstr_html@/index.php/admin/Admin/hand_exams@/index.php/admin/Admin/join_evaluation@/index.php/admin/Admin/evaluation@/index.php/admin/Admin/evaluation_record@/index.php/admin/System/message_detial@/index.php/admin/System/system_message@/index.php/admin/System/export_pdf@/index.php/admin/Admin/web_chat@/index.php/admin/Article/article_add@/index.php/admin/Article/article_delete@/index.php/admin/Article/index@/index.php/admin/Article/article_toggle@/index.php/admin/Article/article_edit@/index.php/admin/Member/member_add@/index.php/admin/Member/member_edit@/index.php/admin/Member/member_password@/index.php/admin/Member/member_list@/index.php/admin/Member/member_info@/index.php/admin/Member/member_view@/index.php/admin/Member/export@/index.php/admin/Member/member_type@/index.php/admin/Member/type_add@/index.php/admin/Member/type_delete@/index.php/admin/Member/delete_all@/index.php/admin/Member/delete_member_list@/index.php/admin/Order/order_add@/index.php/admin/Order/index@/index.php/admin/Order/delete@/index.php/admin/System/index@/index.php/admin/System/backups@/index.php/admin/System/export_database@/index.php/admin/System/put_table_file@/index.php/admin/System/add_system_message@/index.php/admin/System/database_import@/index.php/admin/System/downdload_files@/index.php/admin/System/file_delete@/index.php/admin/System/echarts@/index.php/admin/Evaluation/evaluation_add@/index.php/admin/Evaluation/index@/index.php/admin/Evaluation/evaluation_add@/index.php/admin/Evaluation/evaluation_edit@/index.php/admin/Evaluation/evaluation_toggle@/index.php/admin/Evaluation/evaluation_delete@/index.php/admin/Evaluation/delete_all@/index.php/admin/Wechat/fans_list@/index.php/admin/Recycle/delete_member_recover@/index.php/admin/Recycle/empty_recycle@/index.php/admin/Recycle/delete_all@/index.php/admin/Recycle/delete_member_complete@/index.php/admin/Recycle/delete_member_list@/index.php/admin/Recycle/member_info@/index.php/admin/Recycle/member_view', '1', '拥有除权限管理之外的所有权利', '1');
INSERT INTO `f_role_group` VALUES ('11', '编辑管理员', '/index.php/admin/System/update_pass@/index.php/admin/System/clock_pass@/index.php/admin/System/extraconfig@/index.php/admin/Login/login@/index.php/admin/Login/base_login@/index.php/admin/Login/last_login_info@/index.php/admin/Login/count_login@/index.php/admin/Login/extraconfig@/index.php/admin/Login/index@/index.php/admin/Login/logout@/index.php/admin/Index/clear_cache@/index.php/admin/Index/del_runtime@/index.php/admin/Index/index@/index.php/admin/Index/welcome@/index.php/admin/Index/max_time@/index.php/admin/System/sleep_timeout@/index.php/admin/Admin/admin_info@/index.php/admin/Admin/up_photos@/index.php/admin/Admin/base_info@/index.php/admin/Admin/get_options@/index.php/admin/Admin/cutstr_html@/index.php/admin/Admin/hand_exams@/index.php/admin/Admin/join_evaluation@/index.php/admin/Admin/evaluation@/index.php/admin/Admin/evaluation_record@/index.php/admin/System/message_detial@/index.php/admin/System/system_message@/index.php/admin/System/export_pdf@/index.php/admin/Admin/web_chat@/index.php/admin/Article/article_add@/index.php/admin/Article/article_delete@/index.php/admin/Article/index@/index.php/admin/Article/article_toggle@/index.php/admin/Article/article_edit', '1', '具有文章管理的权限', '1');
INSERT INTO `f_role_group` VALUES ('12', '销售管理员', '/index.php/admin/System/update_pass@/index.php/admin/System/clock_pass@/index.php/admin/System/extraconfig@/index.php/admin/Login/login@/index.php/admin/Login/base_login@/index.php/admin/Login/last_login_info@/index.php/admin/Login/count_login@/index.php/admin/Login/extraconfig@/index.php/admin/Login/index@/index.php/admin/Login/logout@/index.php/admin/Index/clear_cache@/index.php/admin/Index/del_runtime@/index.php/admin/Index/index@/index.php/admin/Index/welcome@/index.php/admin/Index/max_time@/index.php/admin/System/sleep_timeout@/index.php/admin/Admin/admin_info@/index.php/admin/Admin/up_photos@/index.php/admin/Admin/base_info@/index.php/admin/Admin/get_options@/index.php/admin/Admin/cutstr_html@/index.php/admin/Admin/hand_exams@/index.php/admin/Admin/join_evaluation@/index.php/admin/Admin/evaluation@/index.php/admin/Admin/evaluation_record@/index.php/admin/System/message_detial@/index.php/admin/System/system_message@/index.php/admin/System/export_pdf@/index.php/admin/Admin/web_chat@/index.php/admin/Member/member_add@/index.php/admin/Member/member_edit@/index.php/admin/Member/member_password@/index.php/admin/Member/member_list@/index.php/admin/Member/member_info@/index.php/admin/Member/member_view@/index.php/admin/Member/export@/index.php/admin/Member/member_type@/index.php/admin/Member/type_add@/index.php/admin/Member/type_delete@/index.php/admin/Member/delete_all@/index.php/admin/Member/delete_member_list@/index.php/admin/Order/order_add@/index.php/admin/Order/index@/index.php/admin/Order/delete@/index.php/admin/Recycle/delete_member_recover@/index.php/admin/Recycle/delete_member_list@/index.php/admin/Recycle/member_info@/index.php/admin/Recycle/member_view', '1', '具有会员和订单的权限', '1');
INSERT INTO `f_role_group` VALUES ('13', '微信公众号管理员', '/index.php/admin/System/update_pass@/index.php/admin/System/clock_pass@/index.php/admin/System/extraconfig@/index.php/admin/Login/login@/index.php/admin/Login/base_login@/index.php/admin/Login/last_login_info@/index.php/admin/Login/count_login@/index.php/admin/Login/extraconfig@/index.php/admin/Login/index@/index.php/admin/Login/logout@/index.php/admin/Index/clear_cache@/index.php/admin/Index/del_runtime@/index.php/admin/Index/index@/index.php/admin/Index/welcome@/index.php/admin/Index/max_time@/index.php/admin/System/sleep_timeout@/index.php/admin/Admin/admin_info@/index.php/admin/Admin/up_photos@/index.php/admin/Admin/base_info@/index.php/admin/Admin/get_options@/index.php/admin/Admin/cutstr_html@/index.php/admin/Admin/hand_exams@/index.php/admin/Admin/join_evaluation@/index.php/admin/Admin/evaluation@/index.php/admin/Admin/evaluation_record@/index.php/admin/System/message_detial@/index.php/admin/System/system_message@/index.php/admin/System/export_pdf@/index.php/admin/Admin/web_chat@/index.php/admin/Wechat/fans_list', '1', '具有微信公众号相关的权限', '1');
INSERT INTO `f_role_group` VALUES ('14', '培训管理员', '/index.php/admin/System/update_pass@/index.php/admin/System/clock_pass@/index.php/admin/System/extraconfig@/index.php/admin/Login/login@/index.php/admin/Login/base_login@/index.php/admin/Login/last_login_info@/index.php/admin/Login/count_login@/index.php/admin/Login/extraconfig@/index.php/admin/Login/index@/index.php/admin/Login/logout@/index.php/admin/Index/clear_cache@/index.php/admin/Index/del_runtime@/index.php/admin/Index/index@/index.php/admin/Index/welcome@/index.php/admin/Index/max_time@/index.php/admin/System/sleep_timeout@/index.php/admin/Admin/admin_info@/index.php/admin/Admin/up_photos@/index.php/admin/Admin/base_info@/index.php/admin/Admin/get_options@/index.php/admin/Admin/cutstr_html@/index.php/admin/Admin/hand_exams@/index.php/admin/Admin/join_evaluation@/index.php/admin/Admin/evaluation@/index.php/admin/Admin/evaluation_record@/index.php/admin/System/message_detial@/index.php/admin/System/system_message@/index.php/admin/System/export_pdf@/index.php/admin/Admin/web_chat@/index.php/admin/Evaluation/evaluation_add@/index.php/admin/Evaluation/index@/index.php/admin/Evaluation/evaluation_add@/index.php/admin/Evaluation/evaluation_edit@/index.php/admin/Evaluation/evaluation_toggle@/index.php/admin/Evaluation/evaluation_delete@/index.php/admin/Evaluation/delete_all', '1', '具有培训测评相关的权限', '1');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_system_message`
-- ----------------------------

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
-- Table structure for `f_wechat_config`
-- ----------------------------

DROP TABLE IF EXISTS `f_wechat_config`;

CREATE TABLE `f_wechat_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_wechat_config`
-- ----------------------------

-- ----------------------------
-- Table structure for `f_wechat_fans`
-- ----------------------------

DROP TABLE IF EXISTS `f_wechat_fans`;

CREATE TABLE `f_wechat_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `head_img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_wechat_fans`
-- ----------------------------

