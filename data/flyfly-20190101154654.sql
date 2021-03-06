-- ----------------------------
-- 日期：2019-01-01 15:46:54
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

INSERT INTO `f_admin` VALUES ('1', 'admin', 'MTIzNDU2', '1', '18840918752', '1719847255@qq.com', '1', '1542655038', '1', '1', '1546322558', '20181202 457073da7fde88c2485ca21d8f97269.jpg', '具有至高无上的管理权力！！！', '1800', '1', '0', '127.0.0.1', '33', '1');
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_admin_log`
-- ----------------------------

INSERT INTO `f_admin_log` VALUES ('1', '1', '显示主页', '1546328803', '1');
INSERT INTO `f_admin_log` VALUES ('2', '1', '显示主页', '1546328803', '1');
INSERT INTO `f_admin_log` VALUES ('3', '1', '数据备份', '1546328810', '1');
INSERT INTO `f_admin_log` VALUES ('4', '1', '数据备份', '1546328814', '1');

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

INSERT INTO `f_article` VALUES ('3', '345678', '4567890', '<p>23w4ertyuhijffferdftgjnbc</p>', '0', '1542639007');

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
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Data for the table `f_members`
-- ----------------------------

INSERT INTO `f_members` VALUES ('1', 'fengyi', '123456', '0', '1545711693', '4', '0', '1719847255@qq.com', '贵州省贵阳市云岩区大营坡长冲农民新村40号', '18885175642', '1');
INSERT INTO `f_members` VALUES ('43', '小老二', '111111', '1', '1545711693', '2', '1', '234567890@qq.com', '贵州省贵阳市', '18208482313', '1');
INSERT INTO `f_members` VALUES ('44', '谢云芸', '111111', '1', '1545711693', '2', '0', '234567890@qq.com', '贵州省贵阳市', '14567890567', '1');
INSERT INTO `f_members` VALUES ('45', 'xieyunyun', '111111', '1', '1545711693', '2', '1', '34567890-@qq.com', '贵州省贵阳市', '15678900987', '1');
INSERT INTO `f_members` VALUES ('56', '嘿嘿嘿', '123456', '0', '1545711635', '4', '1', '345678@qq.com', '贵州省贵阳市', '16789676756', '1');
INSERT INTO `f_members` VALUES ('50', '园艺师', '111111', '0', '1545711635', '4', '1', '23456789@qq.com', '贵州省贵阳市', '14567898768', '1');
INSERT INTO `f_members` VALUES ('51', '普通会员', '111111', '0', '1545711693', '4', '0', '23456789@qq.com', '贵州省贵阳市', '14567890987', '1');
INSERT INTO `f_members` VALUES ('53', '铁素体', '123456', '0', '1544245140', '1', '1', '345678967@qq.com', '贵阳市', '18456789876', '1');
INSERT INTO `f_members` VALUES ('54', 'wwwwwww', '111111', '0', '1545711693', '1', '1', '234567654567@qq.com', '贵州省贵阳市', '13456789876', '1');
INSERT INTO `f_members` VALUES ('58', '啊啊啊啊', '111111', '0', '1545751060', '1', '1', '23456576786@qq.com', '贵州贵阳', '15889787879', '0');
INSERT INTO `f_members` VALUES ('69', '阿凡达房管局发广告', '111111', '0', '1546156829', '4', '0', '465587686796@qq.com', '工人一天一进入体育', '13565676765', '1');
INSERT INTO `f_members` VALUES ('67', '该如个人回电话', '111111', '0', '1545895898', '2', '0', '4345656876@qq.com', '广东人恢复添加附件', '15679789688', '1');
INSERT INTO `f_members` VALUES ('63', '反复反复付', '123456', '0', '1545895960', '2', '0', '4657676776@qq.com', '更好具体时间', '16895767658', '1');
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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

