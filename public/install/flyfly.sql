/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : flyfly

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-01-22 10:18:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for f_admin
-- ----------------------------
DROP TABLE IF EXISTS `f_admin`;
CREATE TABLE `f_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `sex` varchar(1) NOT NULL COMMENT '1表示男，0表示女',
  `telephone` varchar(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `role_group_id` varchar(10) NOT NULL,
  `create_time` varchar(20) NOT NULL,
  `is_super` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `last_login_time` varchar(20) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `sleep_timeout` int(10) unsigned NOT NULL DEFAULT '1800',
  `multi_device` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `online` tinyint(1) unsigned NOT NULL,
  `last_login_ip` varchar(20) NOT NULL,
  `count_login` int(10) unsigned NOT NULL DEFAULT '0',
  `is_available` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `department_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of f_admin
-- ----------------------------
INSERT INTO `f_admin` VALUES ('1', 'admin', 'MTIzNDU2', '1', '18840918752', '1719847255@qq.com', '1', '1542655038', '1', '1', '1548074627', '20190115\\da1cbed002f03684ae700ae04cc6834d.jpg', '具有至高无上的管理权力！！！', '1800', '1', '0', '127.0.0.1', '175', '1', '3');
INSERT INTO `f_admin` VALUES ('10', 'bianji', 'MTIzNDU2', '1', '18885175642', '2345678@qq.com', '11', '1543565944', '0', '1', '1547538017', '', '', '1800', '1', '0', '127.0.0.1', '11', '1', '6');
INSERT INTO `f_admin` VALUES ('11', 'xiaoshou', 'MTIzNDU2', '0', '18578999999', '2345678@qq.com', '12', '1543566477', '0', '1', '1547538073', '201812309e07deba6f455c47be0ec83f30db0c23.jpg', '销售管理员', '1800', '1', '0', '127.0.0.1', '30', '1', '1');
INSERT INTO `f_admin` VALUES ('12', 'weixin', 'MTIzNDU2', '', '18885175642', '1719847255@qq.com', '13', '1545238695', '0', '0', '', '', '', '1800', '1', '0', '', '0', '1', '6');
INSERT INTO `f_admin` VALUES ('13', 'peixun', 'MTIzNDU2', '1', '18840918752', '234567898765@qq.com', '14', '1545998825', '0', '0', '', '', '', '1800', '0', '0', '', '0', '1', '4');
INSERT INTO `f_admin` VALUES ('14', 'kefu', 'MTIzNDU2', '0', '18840918752', '2345678935@qq.com', '12', '1546002607', '0', '0', '1546004334', 'woman.png', '', '1800', '1', '0', '127.0.0.1', '4', '1', '1');
INSERT INTO `f_admin` VALUES ('15', 'zhujiao', 'MTIzNDU2', '1', '18840918762', '234567890@qq.com', '14', '1546004445', '0', '1', '1546160893', 'woman.png', '', '1800', '1', '0', '127.0.0.1', '2', '1', '4');
INSERT INTO `f_admin` VALUES ('16', 'weixinkefu', 'MTIzNDU2', '0', '18885175642', '2345678456@qq.com', '13', '1546004646', '0', '1', '1546004840', '20181228ad2434d1c2d02a5d58717ac0ac786962.jpg', '微信客服人员', '1800', '1', '0', '127.0.0.1', '3', '1', '6');
INSERT INTO `f_admin` VALUES ('17', 'xiaolaoer', 'MTIzNDU2', '0', '18208482313', '234567890@qq.com', '1', '1546161352', '0', '1', '1547135991', 'woman.png', '', '1800', '1', '0', '127.0.0.1', '13', '1', '3');
INSERT INTO `f_admin` VALUES ('18', 'chuna', 'MTIzNDU2', '1', '18840918752', '4235467785@qq.com', '17', '1546700028', '0', '1', '1547183497', 'man.png', '', '1800', '1', '0', '127.0.0.1', '21', '1', '2');
INSERT INTO `f_admin` VALUES ('19', 'hr', 'MTIzNDU2', '0', '18840918752', '423567875@qq.com', '15', '1546700157', '0', '1', '1547537972', 'woman.png', '', '1800', '1', '0', '127.0.0.1', '19', '1', '4');
INSERT INTO `f_admin` VALUES ('20', 'flyfly', 'MTIzNDU2', '1', '18840918752', '345678976@qq.com', '10', '1546848687', '0', '1', '1547132402', 'man.png', '', '1800', '1', '0', '127.0.0.1', '8', '1', '0');
INSERT INTO `f_admin` VALUES ('21', 'renshi', 'MTIzNDU2', '0', '18840918752', '4357876864@qq.com', '15', '1547183636', '0', '1', '1547183661', 'woman.png', '', '1800', '1', '0', '127.0.0.1', '1', '1', '4');

-- ----------------------------
-- Table structure for f_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `f_admin_log`;
CREATE TABLE `f_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL,
  `operation` varchar(255) NOT NULL COMMENT '操作内容',
  `time` varchar(20) NOT NULL,
  `is_available` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员操作日志表';

-- ----------------------------
-- Records of f_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for f_article
-- ----------------------------
DROP TABLE IF EXISTS `f_article`;
CREATE TABLE `f_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0' COMMENT '0表示未送审，1表示已送审，2表示已审核，3表示被驳回',
  `create_time` int(10) unsigned NOT NULL,
  `is_available` varchar(1) NOT NULL DEFAULT '1' COMMENT '1表示正常，0表示删除',
  `owner` varchar(20) NOT NULL COMMENT '文章拥有者（创建者）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_article
-- ----------------------------
INSERT INTO `f_article` VALUES ('1', '【系统维护升级20181102】', '【系统维护升级20181102】', '观影光临观影光临观影光临观影光临观影光临观影光临观影光临光临观影光临', '2', '1546366737', '1', '');
INSERT INTO `f_article` VALUES ('2', '你好', '欢迎光临', '观影光临观影光临观影光临观影光临观影光临观影光临观影光临', '3', '1547097082', '1', '');
INSERT INTO `f_article` VALUES ('3', 'test', '哈哈哈哈哈', '哈哈哈哈哈哈哈哈哈哈或或或', '3', '1547117169', '1', '');
INSERT INTO `f_article` VALUES ('4', '哈哈哈哈', '哈哈哈哈', '呵呵呵呵呵', '3', '1547120091', '1', '');
INSERT INTO `f_article` VALUES ('5', 'flyfly', '嘎嘎嘎嘎嘎过过', '哈哈哈哈嗝过过过', '0', '1547124242', '1', '');
INSERT INTO `f_article` VALUES ('6', '个人还挺好挺好挺好', '嘎嘎嘎嘎嘎', '嘎嘎嘎嘎嘎过过过过', '2', '1547125660', '1', '');
INSERT INTO `f_article` VALUES ('7', '发给谁三个大人', '投入也容易人员', '号体检酒红色特也挺好', '2', '1547132303', '1', '');
INSERT INTO `f_article` VALUES ('8', '嘎嘎嘎嘎嘎', '发放人付付付付', '发旺旺图几个熟人', '0', '1547135105', '1', 'admin');
INSERT INTO `f_article` VALUES ('9', '分行与家人更好', '热议换个问题', '认为与问题通过后', '2', '1547135841', '1', 'admin');

-- ----------------------------
-- Table structure for f_department
-- ----------------------------
DROP TABLE IF EXISTS `f_department`;
CREATE TABLE `f_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1',
  `is_available` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_department
-- ----------------------------
INSERT INTO `f_department` VALUES ('1', '销售部门', '1', '1');
INSERT INTO `f_department` VALUES ('2', '财务部门', '1', '1');
INSERT INTO `f_department` VALUES ('3', '技术部门', '1', '1');
INSERT INTO `f_department` VALUES ('4', '人事部门', '1', '1');
INSERT INTO `f_department` VALUES ('5', '人事部门1肉', '1', '0');
INSERT INTO `f_department` VALUES ('6', '营运部门', '1', '1');

-- ----------------------------
-- Table structure for f_education
-- ----------------------------
DROP TABLE IF EXISTS `f_education`;
CREATE TABLE `f_education` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '学历',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_education
-- ----------------------------
INSERT INTO `f_education` VALUES ('1', '大专');
INSERT INTO `f_education` VALUES ('2', '本科');
INSERT INTO `f_education` VALUES ('3', '硕士');
INSERT INTO `f_education` VALUES ('4', '博士');
INSERT INTO `f_education` VALUES ('5', '其他');

-- ----------------------------
-- Table structure for f_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `f_evaluation`;
CREATE TABLE `f_evaluation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `create_time` varchar(10) NOT NULL COMMENT '添加时间',
  `duration` int(10) unsigned NOT NULL DEFAULT '90' COMMENT '考试时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `total_score` int(10) unsigned NOT NULL DEFAULT '100',
  `pass_id` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_evaluation
-- ----------------------------
INSERT INTO `f_evaluation` VALUES ('1', 'PHP面试题', 'PHP面试题宝典', '1545466793', '90', '1', '100', '1@11@');

-- ----------------------------
-- Table structure for f_evaluation_answer
-- ----------------------------
DROP TABLE IF EXISTS `f_evaluation_answer`;
CREATE TABLE `f_evaluation_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `evaluation_id` int(10) unsigned NOT NULL,
  `evaluation_info_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `answer` text,
  `type` varchar(10) NOT NULL,
  `result` text NOT NULL,
  `score` int(10) unsigned NOT NULL,
  `record_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=659 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_evaluation_answer
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
INSERT INTO `f_evaluation_answer` VALUES ('647', '1', '1', '1', 'D', 'single', '', '0', '39');
INSERT INTO `f_evaluation_answer` VALUES ('648', '1', '2', '1', 'C', 'single', '', '0', '39');
INSERT INTO `f_evaluation_answer` VALUES ('649', '1', '5', '1', 'D', 'single', '', '0', '39');
INSERT INTO `f_evaluation_answer` VALUES ('650', '1', '6', '1', 'C', 'single', '', '0', '39');
INSERT INTO `f_evaluation_answer` VALUES ('651', '1', '9', '1', 'C_@D', 'multi', '', '0', '39');
INSERT INTO `f_evaluation_answer` VALUES ('652', '1', '11', '1', '0', 'recognized', '', '0', '39');
INSERT INTO `f_evaluation_answer` VALUES ('653', '1', '12', '1', '0', 'recognized', '', '0', '39');
INSERT INTO `f_evaluation_answer` VALUES ('654', '1', '13', '1', '0', 'recognized', '', '0', '39');
INSERT INTO `f_evaluation_answer` VALUES ('655', '1', '14', '1', '1', 'recognized', '', '0', '39');
INSERT INTO `f_evaluation_answer` VALUES ('656', '1', '15', '1', '第一：http是超文本传输协议，信息是明文传输，https是具有安全性的ssl加密传输协议第二：http和https使用的是完全不同的连接方式，端口也不一样，前者80 或者443第三：http连接很简单，是无状态的。https协议是由ssl+http协议构建的可进行加密传输，身份认证的网络协议。', 'short', '', '0', '39');
INSERT INTO `f_evaluation_answer` VALUES ('657', '1', '16', '1', '事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。', 'short', '', '0', '39');
INSERT INTO `f_evaluation_answer` VALUES ('658', '1', '17', '1', '选择最有效率的表名顺序WHERE子句中的连接顺序SELECT子句中避免使用‘*’用Where子句替换HAVING子句通过内部函数提高SQL效率避免在索引列上使用计算。提高GROUP BY 语句的效率, 可以通过将不需要的记录在GROUP BY 之前过滤掉。', 'short', '', '0', '39');

-- ----------------------------
-- Table structure for f_evaluation_info
-- ----------------------------
DROP TABLE IF EXISTS `f_evaluation_info`;
CREATE TABLE `f_evaluation_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `evaluation_id` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `content` text NOT NULL,
  `answer` text NOT NULL,
  `option` text NOT NULL COMMENT '题目选项',
  `score` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_evaluation_info
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
-- Table structure for f_evaluation_record
-- ----------------------------
DROP TABLE IF EXISTS `f_evaluation_record`;
CREATE TABLE `f_evaluation_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `evaluation_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `score` int(10) unsigned NOT NULL,
  `pass` varchar(1) NOT NULL,
  PRIMARY KEY (`id`,`evaluation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_evaluation_record
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
INSERT INTO `f_evaluation_record` VALUES ('39', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for f_fans_tags
-- ----------------------------
DROP TABLE IF EXISTS `f_fans_tags`;
CREATE TABLE `f_fans_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '默认1表示未删除，0表示删除',
  `openid_list` text,
  PRIMARY KEY (`id`,`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='微信粉丝标签';

-- ----------------------------
-- Records of f_fans_tags
-- ----------------------------
INSERT INTO `f_fans_tags` VALUES ('1', '101', '广东', '1', null);
INSERT INTO `f_fans_tags` VALUES ('2', '102', '贵州', '1', 'oPqJq1Hq451sLfb02nmt21NmLXLA');
INSERT INTO `f_fans_tags` VALUES ('3', '103', '一级粉丝', '1', 'oPqJq1KjvhKhbkEUWm-jHiiFEeJA,oPqJq1Hq451sLfb02nmt21NmLXLA');

-- ----------------------------
-- Table structure for f_material
-- ----------------------------
DROP TABLE IF EXISTS `f_material`;
CREATE TABLE `f_material` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `media_id` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  `forever` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否永久素材',
  `created_at` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`media_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='微信素材列表';

-- ----------------------------
-- Records of f_material
-- ----------------------------
INSERT INTO `f_material` VALUES ('1', '', '_fczhdBTTzd19SA2T2KWyEcHxLQXKbrBryQ1RstDPtdA5Q_w9ycjjvHhN9llF2cS', 'voice', '0', '1547613499', null, null);
INSERT INTO `f_material` VALUES ('2', '', 'Wg2N4PZQ3tXLcBRVJeSQCLgIx_6wHR3CWJVufKHhMU8pLqK_SrQPsPRmBs-KTJGa', 'image', '0', '1547619501', null, null);
INSERT INTO `f_material` VALUES ('3', '', 'RsUpSSgXl_iURk1xu8-H7R-Sb_k7OIjKH9AL47HW_HbdwThZb0n3AapG0toiECf8', 'image', '1', '1547619972', null, '');
INSERT INTO `f_material` VALUES ('4', '', 'ThAC8WgSjpFnIkt1Bb0WgHmkTqGO4EeAkvZrvT8PHTUkb-IwGhKbMJd_W0D5oDhw', 'video', '0', '1547620320', null, '');
INSERT INTO `f_material` VALUES ('5', '', '-iU0XUkmM93tiBsBijzesrk2OImdoc5IrJ0WjpCjDbFpcFJGBhulnY9wkgnJAK6_', 'video', '1', '1547620365', null, '');
INSERT INTO `f_material` VALUES ('6', '', 'qkDXnD7L9cSM7vMvMjRVBYx2OszWGPHFOQu1cnD3a671G54W8-QsEGzlKngw2wjq', 'image', '0', '1547620701', null, '');
INSERT INTO `f_material` VALUES ('7', '', 'bnvFph4ngjXHc5Lx2jsw0iyGOy3KdAamZoAlWjacxjjpLwVM0qKttvW_3h_EJOe4', 'thumb', '0', '1547621662', null, '');
INSERT INTO `f_material` VALUES ('8', '缩略图2', 'WSOCZ4PxpO_QAy1on8nKv83qkD28Gr_TZOtIdw3tY4o', 'thumb', '1', '1547622045', 'http://mmbiz.qpic.cn/mmbiz_jpg/AvguCW2FUAPJfSISgbibibQayQiatJffroFDkEaWJHqx80nuibjQh64XYnndeG4Cd9T7HUMoVz6EATaPZFMZsvKfdw/0?wx_fmt=jpeg', '');
INSERT INTO `f_material` VALUES ('9', '缩略图1', 'WSOCZ4PxpO_QAy1on8nKvwLfDPOlI3u5lVLiE0BUM-8', 'thumb', '1', '1547622746', 'http://mmbiz.qpic.cn/mmbiz_png/AvguCW2FUAPJfSISgbibibQayQiatJffroF9kMsJBgbV7vjLRh1T6iaQfQLJ0BdGPfF37Xruia0icF5COnoCNMbjF63g/0?wx_fmt=png', '');
INSERT INTO `f_material` VALUES ('10', '图文素材封面', 'WSOCZ4PxpO_QAy1on8nKvztiqa5audtq8UAyj7Lv_f0', 'thumb', '1', '1547631959', 'http://mmbiz.qpic.cn/mmbiz_png/AvguCW2FUAPJfSISgbibibQayQiatJffroF9kMsJBgbV7vjLRh1T6iaQfQLJ0BdGPfF37Xruia0icF5COnoCNMbjF63g/0?wx_fmt=png', '图文素材封面缩略图');
INSERT INTO `f_material` VALUES ('11', '图片素材', 'WSOCZ4PxpO_QAy1on8nKv8zuwWRsDTzVq6r3A8B_dx8', 'image', '1', '1547805940', 'http://mmbiz.qpic.cn/mmbiz_png/AvguCW2FUAMbicPZFjeQkp53DNzHYT1IeoOhezuqMIdNoKan6YTr4MhVf4ichxM5tPl766Olr4ufLuJ1DIenp6VA/0?wx_fmt=png', '');
INSERT INTO `f_material` VALUES ('12', '语音素材', 'WSOCZ4PxpO_QAy1on8nKvy9PoiOEwNNupNWGLxKYBFM', 'voice', '1', '1547806337', null, '');
INSERT INTO `f_material` VALUES ('13', '图片素材哈哈哈', 'WSOCZ4PxpO_QAy1on8nKvyn0C_YYO1f4aKL4UuKcw54', 'image', '1', '1547827982', 'http://mmbiz.qpic.cn/mmbiz_jpg/AvguCW2FUAMbicPZFjeQkp53DNzHYT1IeRREAJAGMMF92OoImx4q8m8enGhdv9mcGLczIickwrVcMnSwvfxVE3tg/0?wx_fmt=jpeg', '图片素材哈哈哈');
INSERT INTO `f_material` VALUES ('14', '视频素材', 'WSOCZ4PxpO_QAy1on8nKv7iaXyJaReMf-zjcCbXf9FA', 'video', '1', '1547972632', null, '视频素材哈哈哈');

-- ----------------------------
-- Table structure for f_members
-- ----------------------------
DROP TABLE IF EXISTS `f_members`;
CREATE TABLE `f_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `create_time` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `status` int(1) NOT NULL,
  `email` varchar(32) NOT NULL,
  `address` varchar(100) NOT NULL,
  `telephone` varchar(11) NOT NULL,
  `is_available` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_members
-- ----------------------------
INSERT INTO `f_members` VALUES ('1', 'fengyi', '123456', '0', '1545711693', '4', '0', '1719847255@qq.com', '贵州省贵阳市云岩区大营坡长冲农民新村40号', '18885175642', '1');
INSERT INTO `f_members` VALUES ('43', '小老二', '111111', '1', '1545711693', '2', '1', '234567890@qq.com', '贵州省贵阳市', '18208482313', '1');
INSERT INTO `f_members` VALUES ('44', '谢云芸', '111111', '1', '1545711693', '2', '0', '234567890@qq.com', '贵州省贵阳市', '14567890567', '1');
INSERT INTO `f_members` VALUES ('45', 'xieyunyun', '111111', '1', '1545711693', '2', '1', '34567890-@qq.com', '贵州省贵阳市', '15678900987', '1');
INSERT INTO `f_members` VALUES ('50', '园艺师', '111111', '0', '1545711635', '4', '1', '23456789@qq.com', '贵州省贵阳市', '14567898768', '1');
INSERT INTO `f_members` VALUES ('51', '普通会员', '111111', '0', '1545711693', '4', '0', '23456789@qq.com', '贵州省贵阳市', '14567890987', '1');
INSERT INTO `f_members` VALUES ('53', '铁素体', '123456', '0', '1544245140', '1', '1', '345678967@qq.com', '贵阳市', '18456789876', '1');
INSERT INTO `f_members` VALUES ('54', 'wwwwwww', '111111', '0', '1545711693', '1', '1', '234567654567@qq.com', '贵州省贵阳市', '13456789876', '1');
INSERT INTO `f_members` VALUES ('56', '嘿嘿嘿', '123456', '0', '1545711635', '4', '1', '345678@qq.com', '贵州省贵阳市', '16789676756', '1');
INSERT INTO `f_members` VALUES ('58', '啊啊啊啊', '111111', '0', '1545751060', '1', '1', '23456576786@qq.com', '贵州贵阳', '15889787879', '0');
INSERT INTO `f_members` VALUES ('63', '反复反复付', '123456', '0', '1545895960', '2', '0', '4657676776@qq.com', '更好具体时间', '16895767658', '1');
INSERT INTO `f_members` VALUES ('67', '该如个人回电话', '111111', '0', '1545895898', '2', '0', '4345656876@qq.com', '广东人恢复添加附件', '15679789688', '1');
INSERT INTO `f_members` VALUES ('68', '海豚音', '111111', '0', '1545895960', '4', '0', '43465465756@qq.com', '头发与人体一天如何', '14556884645', '1');
INSERT INTO `f_members` VALUES ('69', '阿凡达房管局发广告', '111111', '0', '1546156829', '4', '0', '465587686796@qq.com', '工人一天一进入体育', '13565676765', '1');

-- ----------------------------
-- Table structure for f_members_type
-- ----------------------------
DROP TABLE IF EXISTS `f_members_type`;
CREATE TABLE `f_members_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_members_type
-- ----------------------------
INSERT INTO `f_members_type` VALUES ('1', '普通会员');
INSERT INTO `f_members_type` VALUES ('2', 'VIP会员');
INSERT INTO `f_members_type` VALUES ('4', '黄金会员');

-- ----------------------------
-- Table structure for f_menus
-- ----------------------------
DROP TABLE IF EXISTS `f_menus`;
CREATE TABLE `f_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) NOT NULL,
  `sub_list` text NOT NULL,
  `group` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_menus
-- ----------------------------
INSERT INTO `f_menus` VALUES ('2', '系统管理', 'base_info@', 'system');

-- ----------------------------
-- Table structure for f_news
-- ----------------------------
DROP TABLE IF EXISTS `f_news`;
CREATE TABLE `f_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `time` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_news
-- ----------------------------
INSERT INTO `f_news` VALUES ('1', '习近平离京出席APEC第26次非正式会议', '新华社北京11月15日电  11月15日，国家主席习近平乘专机离开北京，应巴布亚新几内亚独立国总督达达埃和总理奥尼尔、文莱达鲁萨兰国苏丹哈桑纳尔、菲律宾共和国总统杜特尔特邀请，对上述三国进行国事访问，并在巴新同建交太平洋岛国领导人会晤；应巴布亚新几内亚独立国总理奥尼尔邀请，出席在巴新莫尔兹比港举行的亚太经合组织第二十六次领导人非正式会议', '24557658769');
INSERT INTO `f_news` VALUES ('2', '【支持民营企业在行动】 商务部:支持民营经济发展', '商务部党组书记 部长 钟山：民营企业它们的贡献越来越大，国内贸易份额超过90%，外贸出口的份额占48%，对外投资份额占49%。我们要贯彻好总书记的重要讲话精神，支持它们在促进消费、扩大外贸、引进来和走出去等方面，有更大作为、做更大贡献。', '4577987080');

-- ----------------------------
-- Table structure for f_news_material
-- ----------------------------
DROP TABLE IF EXISTS `f_news_material`;
CREATE TABLE `f_news_material` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `thumb_media_id` varchar(255) NOT NULL,
  `author` varchar(20) NOT NULL,
  `digest` text COMMENT '图文消息的摘要，仅有单图文消息才有摘要，多图文此处为空。如果本字段为没有填写，则默认抓取正文前64个字。',
  `show_cover_pic` varchar(1) NOT NULL COMMENT '是否显示封面，0为false，即不显示，1为true，即显示',
  `content` text NOT NULL COMMENT '图文消息的具体内容，支持HTML标签，必须少于2万字符，小于1M，且此处会去除JS,涉及图片url必须来源 "上传图文消息内的图片获取URL"接口获取。外部图片url将被过滤。',
  `content_source_url` varchar(255) NOT NULL COMMENT '图文消息的原文地址，即点击“阅读原文”后的URL',
  `need_open_comment` varchar(1) DEFAULT NULL COMMENT 'Uint32 是否打开评论，0不打开，1打开',
  `only_fans_can_comment` varchar(1) DEFAULT NULL COMMENT 'Uint32 是否粉丝才可评论，0所有人可评论，1粉丝才可评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_news_material
-- ----------------------------
INSERT INTO `f_news_material` VALUES ('1', '标题', 'WSOCZ4PxpO_QAy1on8nKvztiqa5audtq8UAyj7Lv_f0', 'fengyi', '摘要', '1', '内容', 'http://www.flyfly.com/admin/index/index', '1', '0');
INSERT INTO `f_news_material` VALUES ('2', '图文素材标题', 'WSOCZ4PxpO_QAy1on8nKvztiqa5audtq8UAyj7Lv_f0', 'fengyi', '图文素材摘要', '1', '图文素材内容', 'http://www.flyfly.com/admin/index/index', '1', '0');
INSERT INTO `f_news_material` VALUES ('3', '图文素材标题', 'WSOCZ4PxpO_QAy1on8nKvwLfDPOlI3u5lVLiE0BUM-8', '冯毅', '摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。', '1', '内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。', 'http://www.flyfly.com/admin/index/index', '1', '0');
INSERT INTO `f_news_material` VALUES ('4', '图文素材标题', 'WSOCZ4PxpO_QAy1on8nKvwLfDPOlI3u5lVLiE0BUM-8', '冯毅', '摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘要。。。摘', '1', '内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。内容。。。。。。', 'http://www.flyfly.com/admin/index/index', '1', '0');

-- ----------------------------
-- Table structure for f_order
-- ----------------------------
DROP TABLE IF EXISTS `f_order`;
CREATE TABLE `f_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(18) NOT NULL,
  `create_time` varchar(20) NOT NULL,
  `status` varchar(1) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `shop_id` int(10) unsigned NOT NULL,
  `pay_type` varchar(10) NOT NULL,
  `shop_number` int(10) unsigned NOT NULL COMMENT '商品数量',
  `receiver` varchar(20) NOT NULL COMMENT '收货人',
  `total_money` varchar(10) NOT NULL COMMENT '总金额',
  `payable` varchar(10) NOT NULL COMMENT '支付方式',
  `dispatch_status` varchar(1) NOT NULL COMMENT '物流状态',
  `shop_method` varchar(50) NOT NULL COMMENT '配送方式',
  `pay_status` varchar(1) NOT NULL,
  `delivery_status` varchar(1) NOT NULL COMMENT '发货状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_order
-- ----------------------------

-- ----------------------------
-- Table structure for f_role_author
-- ----------------------------
DROP TABLE IF EXISTS `f_role_author`;
CREATE TABLE `f_role_author` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `resource_type` varchar(20) NOT NULL,
  `group` varchar(20) NOT NULL,
  `role_code` text NOT NULL,
  `is_available` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `admin_id` text NOT NULL,
  PRIMARY KEY (`id`,`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_role_author
-- ----------------------------
INSERT INTO `f_role_author` VALUES ('1', '修改密码', '后台系统_Admin', '基础管理', '/admin/System/update_pass', '1', '');
INSERT INTO `f_role_author` VALUES ('2', '锁屏密码', '后台系统_Admin', '基础管理', '/admin/System/clock_pass@/admin/System/extraconfig', '1', '');
INSERT INTO `f_role_author` VALUES ('3', '添加会员', '后台系统_Admin', '用户管理', '/admin/Member/member_add', '1', '');
INSERT INTO `f_role_author` VALUES ('4', '编辑会员', '后台系统_Admin', '用户管理', '/admin/Member/member_edit@/admin/Member/member_password', '1', '');
INSERT INTO `f_role_author` VALUES ('5', '添加文章', '后台系统_Admin', '文章管理', '/admin/Article/article_add', '1', '');
INSERT INTO `f_role_author` VALUES ('6', '文章删除', '后台系统_Admin', '文章管理', '/admin/Article/article_delete', '1', '');
INSERT INTO `f_role_author` VALUES ('7', '订单添加', '后台系统_Admin', '订单管理', '/admin/Order/order_add', '1', '');
INSERT INTO `f_role_author` VALUES ('8', '查看管理员', '后台系统_Admin', '权限管理', '/admin/Admin/admin_list@/admin/Admin/index@/admin/Admin/admin_view', '1', '');
INSERT INTO `f_role_author` VALUES ('9', '管理员数据导出', '后台系统_Admin', '权限管理', '/admin/Admin/admin_export', '1', '');
INSERT INTO `f_role_author` VALUES ('10', '网站基础设置', '后台系统_Admin', '系统管理', '/admin/System/set_email@/admin/System/web_info', '1', '');
INSERT INTO `f_role_author` VALUES ('11', '数据备份', '后台系统_Admin', '系统管理', '/admin/System/backups@/admin/System/export_database@/admin/System/put_table_file', '1', '');
INSERT INTO `f_role_author` VALUES ('12', '添加试卷', '后台系统_Admin', '测评管理', '/admin/Evaluation/evaluation_add', '1', '');
INSERT INTO `f_role_author` VALUES ('13', '查看微信粉丝', '后台系统_Admin', '微信管理', '/admin/Wechat/fans_list', '1', '');
INSERT INTO `f_role_author` VALUES ('14', '恢复删除会员', '后台系统_Admin', '回收站', '/admin/Recycle/delete_member_recover', '1', '');
INSERT INTO `f_role_author` VALUES ('15', '查看会员', '后台系统_Admin', '用户管理', '/admin/Member/member_list@/admin/Member/member_info@/admin/Member/member_view', '1', '');
INSERT INTO `f_role_author` VALUES ('16', '会员数据导出', '后台系统_Admin', '用户管理', '/admin/Member/export', '1', '');
INSERT INTO `f_role_author` VALUES ('17', '查看会员类型', '后台系统_Admin', '用户管理', '/admin/Member/member_type', '1', '');
INSERT INTO `f_role_author` VALUES ('18', '添加会员类型', '后台系统_Admin', '用户管理', '/admin/Member/type_add', '1', '');
INSERT INTO `f_role_author` VALUES ('19', '删除会员类型', '后台系统_Admin', '用户管理', '/admin/Member/type_delete', '1', '');
INSERT INTO `f_role_author` VALUES ('20', '删除会员', '后台系统_Admin', '用户管理', '/admin/Member/delete_all@/admin/Member/delete_member_list', '1', '');
INSERT INTO `f_role_author` VALUES ('21', '登入功能', '后台系统_Admin', '基础管理', '/admin/Login/login@/admin/Login/base_login@/admin/Login/last_login_info@/admin/Login/count_login@/admin/Login/extraconfig@/admin/Login/index', '1', '');
INSERT INTO `f_role_author` VALUES ('22', '退出系统功能', '后台系统_Admin', '基础管理', '/admin/Login/logout', '1', '');
INSERT INTO `f_role_author` VALUES ('23', '清除缓存', '后台系统_Admin', '基础管理', '/admin/Index/clear_cache@/admin/Index/del_runtime', '1', '');
INSERT INTO `f_role_author` VALUES ('24', '显示主页', '后台系统_Admin', '基础管理', '/admin/Index/index@/admin/Index/welcome', '1', '');
INSERT INTO `f_role_author` VALUES ('25', '设置休眠时间', '后台系统_Admin', '基础管理', '/admin/Index/max_time@/admin/System/sleep_timeout', '1', '');
INSERT INTO `f_role_author` VALUES ('26', '个人信息', '后台系统_Admin', '基础管理', '/admin/Admin/admin_info@/admin/Admin/up_photos@/admin/Admin/base_info', '1', '');
INSERT INTO `f_role_author` VALUES ('27', '在线测评', '后台系统_Admin', '基础管理', '/admin/Admin/get_options@/admin/Admin/cutstr_html@/admin/Admin/hand_exams@/admin/Admin/join_evaluation@/admin/Admin/evaluation@/admin/Admin/evaluation_record', '1', '');
INSERT INTO `f_role_author` VALUES ('28', '查看系统公告', '后台系统_Admin', '基础管理', '/admin/System/message_detial@/admin/System/system_message@/admin/System/export_pdf', '1', '');
INSERT INTO `f_role_author` VALUES ('29', '查看订单', '后台系统_Admin', '订单管理', '/admin/Order/index', '1', '');
INSERT INTO `f_role_author` VALUES ('30', '删除订单', '后台系统_Admin', '订单管理', '/admin/Order/delete', '1', '');
INSERT INTO `f_role_author` VALUES ('31', '测评列表', '后台系统_Admin', '测评管理', '/admin/Evaluation/index', '1', '');
INSERT INTO `f_role_author` VALUES ('32', '添加试卷', '后台系统_Admin', '测评管理', '/admin/Evaluation/evaluation_add', '1', '');
INSERT INTO `f_role_author` VALUES ('33', '编辑试卷', '后台系统_Admin', '测评管理', '/admin/Evaluation/evaluation_edit@/admin/Evaluation/evaluation_toggle', '1', '');
INSERT INTO `f_role_author` VALUES ('34', '删除试卷', '后台系统_Admin', '测评管理', '/admin/Evaluation/evaluation_delete@/admin/Evaluation/delete_all', '1', '');
INSERT INTO `f_role_author` VALUES ('35', '在线聊天', '后台系统_Admin', '基础管理', '/admin/Admin/web_chat', '1', '');
INSERT INTO `f_role_author` VALUES ('36', '发布系统公告', '后台系统_Admin', '系统管理', '/admin/System/add_system_message', '1', '');
INSERT INTO `f_role_author` VALUES ('37', '数据库恢复', '后台系统_Admin', '系统管理', '/admin/System/database_import', '1', '');
INSERT INTO `f_role_author` VALUES ('38', 'Sql文件下载', '后台系统_Admin', '系统管理', '/admin/System/downdload_files', '1', '');
INSERT INTO `f_role_author` VALUES ('39', 'Sql文件删除', '后台系统_Admin', '系统管理', '/admin/System/file_delete', '1', '');
INSERT INTO `f_role_author` VALUES ('40', '数据可视化', '后台系统_Admin', '系统管理', '/admin/System/echarts', '1', '');
INSERT INTO `f_role_author` VALUES ('41', '添加权限资源', '后台系统_Admin', '权限管理', '/admin/Admin/role_resource_add', '1', '');
INSERT INTO `f_role_author` VALUES ('42', '查看权限资源', '后台系统_Admin', '权限管理', '/admin/Admin/role_resource_list@/admin/Admin/role_resource_info', '1', '');
INSERT INTO `f_role_author` VALUES ('43', '添加管理员', '后台系统_Admin', '权限管理', '/admin/Admin/admin_add', '1', '');
INSERT INTO `f_role_author` VALUES ('44', '编辑管理员', '后台系统_Admin', '权限管理', '/admin/Admin/admin_edit', '1', '');
INSERT INTO `f_role_author` VALUES ('45', '删除管理员', '后台系统_Admin', '权限管理', '/admin/Admin/admin_delete@/admin/Admin/admin_delete_all', '1', '');
INSERT INTO `f_role_author` VALUES ('46', '角色查看', '后台系统_Admin', '权限管理', '/admin/Admin/admin_role@/admin/Admin/admin_role_list@/admin/Admin/role_view', '1', '');
INSERT INTO `f_role_author` VALUES ('47', '角色编辑', '后台系统_Admin', '权限管理', '/admin/Admin/role_edit', '1', '');
INSERT INTO `f_role_author` VALUES ('48', '角色删除', '后台系统_Admin', '权限管理', '/admin/Admin/role_delete', '1', '');
INSERT INTO `f_role_author` VALUES ('49', '权限资源删除', '后台系统_Admin', '权限管理', '/admin/Admin/role_resource_delete@/admin/Admin/resource_delete_all', '1', '');
INSERT INTO `f_role_author` VALUES ('50', '查看文章', '后台系统_Admin', '文章管理', '/admin/Article/article_list@/admin/Article/article_list_info', '1', '');
INSERT INTO `f_role_author` VALUES ('51', '文章编辑', '后台系统_Admin', '文章管理', '/admin/Article/article_toggle@/admin/Article/article_edit', '1', '');
INSERT INTO `f_role_author` VALUES ('52', '清空会员回收站', '后台系统_Admin', '回收站', '/admin/Recycle/empty_recycle@/admin/Recycle/delete_all@/admin/Recycle/delete_member_complete', '1', '');
INSERT INTO `f_role_author` VALUES ('53', '查看已删会员', '后台系统_Admin', '回收站', '/admin/Recycle/delete_member_list@/admin/Recycle/member_info@/admin/Recycle/member_view', '1', '');
INSERT INTO `f_role_author` VALUES ('54', '查看管理员日志', '后台系统_Admin', '权限管理', '/admin/Admin/admin_log@/admin/Admin/admin_log_list', '1', '');
INSERT INTO `f_role_author` VALUES ('55', '导出管理员角色数据', '后台系统_Admin', '权限管理', '/admin/Admin/admin_role_export', '1', '');
INSERT INTO `f_role_author` VALUES ('56', '编辑权限资源', '后台系统_Admin', '权限管理', '/admin/Admin/role_resource_edit', '1', '');
INSERT INTO `f_role_author` VALUES ('57', '查看部门', '人力资源系统_Hr', '部门管理', '/admin/Department/department_list@/admin/Department/department_info', '1', '');
INSERT INTO `f_role_author` VALUES ('58', '现金管理', '财务系统_Finance', '财务管理', '/admin/Rinance/cash', '1', '');
INSERT INTO `f_role_author` VALUES ('59', '待办事项', '后台系统_Admin', '任务管理', '/admin/Todolist/todo_list@/admin/Todolist/todo_list_info@/admin/Todolist/article_view', '1', '');
INSERT INTO `f_role_author` VALUES ('60', '已办事项', '后台系统_Admin', '任务管理', '/admin/Todolist/todone_list@/admin/Todolist/todone_list_info', '1', '');
INSERT INTO `f_role_author` VALUES ('61', '选择审批人', '后台系统_Admin', '文章管理', '/admin/Article/article_approve', '1', '');
INSERT INTO `f_role_author` VALUES ('62', '添加部门', '人力资源系统_Hr', '部门管理', '/admin/Department/department_add', '1', '');
INSERT INTO `f_role_author` VALUES ('63', '编辑部门', '人力资源系统_Hr', '部门管理', '/admin/Department/department_edit', '1', '');
INSERT INTO `f_role_author` VALUES ('64', '删除部门', '人力资源系统_Hr', '部门管理', '/admin/Department/delete_department', '1', '');
INSERT INTO `f_role_author` VALUES ('65', '查看员工档案', '人力资源系统_Hr', '员工管理', '/admin/Staff/archives_list@/admin/Staff/archives_info', '1', '');

-- ----------------------------
-- Table structure for f_role_group
-- ----------------------------
DROP TABLE IF EXISTS `f_role_group`;
CREATE TABLE `f_role_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system_sort_id` varchar(10) DEFAULT NULL,
  `role_name` varchar(20) NOT NULL,
  `acl` text,
  `status` varchar(2) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `is_available` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_role_group
-- ----------------------------
INSERT INTO `f_role_group` VALUES ('1', '1@2@3@', '超级管理员', 'all', '1', '具有至高无上的权利', '1');
INSERT INTO `f_role_group` VALUES ('10', '1@2@3@', '普通管理员', '/admin/System/update_pass@/admin/System/clock_pass@/admin/System/extraconfig@/admin/Login/login@/admin/Login/base_login@/admin/Login/last_login_info@/admin/Login/count_login@/admin/Login/extraconfig@/admin/Login/index@/admin/Login/logout@/admin/Index/clear_cache@/admin/Index/del_runtime@/admin/Index/index@/admin/Index/welcome@/admin/Index/max_time@/admin/System/sleep_timeout@/admin/Admin/admin_info@/admin/Admin/up_photos@/admin/Admin/base_info@/admin/Admin/get_options@/admin/Admin/cutstr_html@/admin/Admin/hand_exams@/admin/Admin/join_evaluation@/admin/Admin/evaluation@/admin/Admin/evaluation_record@/admin/System/message_detial@/admin/System/system_message@/admin/System/export_pdf@/admin/Admin/web_chat@/admin/Todolist/todo_list@/admin/Todolist/todo_list_info@/admin/Todolist/article_view@/admin/Todolist/todone_list@/admin/Todolist/todone_list_info@/admin/Article/article_add@/admin/Article/article_delete@/admin/Article/article_list@/admin/Article/article_list_info@/admin/Article/article_toggle@/admin/Article/article_edit@/admin/Article/article_approve@/admin/Member/member_add@/admin/Member/member_edit@/admin/Member/member_password@/admin/Member/member_list@/admin/Member/member_info@/admin/Member/member_view@/admin/Member/export@/admin/Member/member_type@/admin/Member/type_add@/admin/Member/type_delete@/admin/Member/delete_all@/admin/Member/delete_member_list@/admin/Order/order_add@/admin/Order/index@/admin/Order/delete@/admin/System/set_email@/admin/System/web_info@/admin/System/backups@/admin/System/export_database@/admin/System/put_table_file@/admin/System/add_system_message@/admin/System/database_import@/admin/System/downdload_files@/admin/System/file_delete@/admin/System/echarts@/admin/Evaluation/evaluation_add@/admin/Evaluation/index@/admin/Evaluation/evaluation_add@/admin/Evaluation/evaluation_edit@/admin/Evaluation/evaluation_toggle@/admin/Evaluation/evaluation_delete@/admin/Evaluation/delete_all@/admin/Wechat/fans_list@/admin/Recycle/delete_member_recover@/admin/Recycle/empty_recycle@/admin/Recycle/delete_all@/admin/Recycle/delete_member_complete@/admin/Recycle/delete_member_list@/admin/Recycle/member_info@/admin/Recycle/member_view@/admin/Department/department_list@/admin/Rinance/cash', '1', '拥有除权限管理之外的所有权利', '1');
INSERT INTO `f_role_group` VALUES ('11', '1@', '编辑管理员', '/admin/System/update_pass@/admin/System/clock_pass@/admin/System/extraconfig@/admin/Login/login@/admin/Login/base_login@/admin/Login/last_login_info@/admin/Login/count_login@/admin/Login/extraconfig@/admin/Login/index@/admin/Login/logout@/admin/Index/clear_cache@/admin/Index/del_runtime@/admin/Index/index@/admin/Index/welcome@/admin/Index/max_time@/admin/System/sleep_timeout@/admin/Admin/admin_info@/admin/Admin/up_photos@/admin/Admin/base_info@/admin/Admin/get_options@/admin/Admin/cutstr_html@/admin/Admin/hand_exams@/admin/Admin/join_evaluation@/admin/Admin/evaluation@/admin/Admin/evaluation_record@/admin/System/message_detial@/admin/System/system_message@/admin/System/export_pdf@/admin/Admin/web_chat@/admin/Todolist/todo_list@/admin/Todolist/todo_list_info@/admin/Todolist/article_view@/admin/Todolist/todone_list@/admin/Todolist/todone_list_info@/admin/Article/article_add@/admin/Article/article_delete@/admin/Article/article_list@/admin/Article/article_list_info@/admin/Article/article_toggle@/admin/Article/article_edit@/admin/Article/article_approve', '1', '具有文章管理的权限', '1');
INSERT INTO `f_role_group` VALUES ('12', '1@', '销售管理员', '/admin/System/update_pass@/admin/System/clock_pass@/admin/System/extraconfig@/admin/Login/login@/admin/Login/base_login@/admin/Login/last_login_info@/admin/Login/count_login@/admin/Login/extraconfig@/admin/Login/index@/admin/Login/logout@/admin/Index/clear_cache@/admin/Index/del_runtime@/admin/Index/index@/admin/Index/welcome@/admin/Index/max_time@/admin/System/sleep_timeout@/admin/Admin/admin_info@/admin/Admin/up_photos@/admin/Admin/base_info@/admin/Admin/get_options@/admin/Admin/cutstr_html@/admin/Admin/hand_exams@/admin/Admin/join_evaluation@/admin/Admin/evaluation@/admin/Admin/evaluation_record@/admin/System/message_detial@/admin/System/system_message@/admin/System/export_pdf@/admin/Admin/web_chat@/admin/Member/member_add@/admin/Member/member_edit@/admin/Member/member_password@/admin/Member/member_list@/admin/Member/member_info@/admin/Member/member_view@/admin/Member/export@/admin/Member/member_type@/admin/Member/type_add@/admin/Member/type_delete@/admin/Member/delete_all@/admin/Member/delete_member_list@/admin/Order/order_add@/admin/Order/index@/admin/Order/delete@/admin/Recycle/delete_member_recover@/admin/Recycle/empty_recycle@/admin/Recycle/delete_all@/admin/Recycle/delete_member_complete@/admin/Recycle/delete_member_list@/admin/Recycle/member_info@/admin/Recycle/member_view', '1', '具有会员和订单的权限', '1');
INSERT INTO `f_role_group` VALUES ('13', '1@', '微信公众号管理员', '/admin/System/update_pass@/admin/System/clock_pass@/admin/System/extraconfig@/admin/Login/login@/admin/Login/base_login@/admin/Login/last_login_info@/admin/Login/count_login@/admin/Login/extraconfig@/admin/Login/index@/admin/Login/logout@/admin/Index/clear_cache@/admin/Index/del_runtime@/admin/Index/index@/admin/Index/welcome@/admin/Index/max_time@/admin/System/sleep_timeout@/admin/Admin/admin_info@/admin/Admin/up_photos@/admin/Admin/base_info@/admin/Admin/get_options@/admin/Admin/cutstr_html@/admin/Admin/hand_exams@/admin/Admin/join_evaluation@/admin/Admin/evaluation@/admin/Admin/evaluation_record@/admin/System/message_detial@/admin/System/system_message@/admin/System/export_pdf@/admin/Admin/web_chat@/admin/Wechat/fans_list', '1', '具有微信公众号相关的权限', '1');
INSERT INTO `f_role_group` VALUES ('14', '1@', '培训管理员', '/admin/System/update_pass@/admin/System/clock_pass@/admin/System/extraconfig@/admin/Login/login@/admin/Login/base_login@/admin/Login/last_login_info@/admin/Login/count_login@/admin/Login/extraconfig@/admin/Login/index@/admin/Login/logout@/admin/Index/clear_cache@/admin/Index/del_runtime@/admin/Index/index@/admin/Index/welcome@/admin/Index/max_time@/admin/System/sleep_timeout@/admin/Admin/admin_info@/admin/Admin/up_photos@/admin/Admin/base_info@/admin/Admin/get_options@/admin/Admin/cutstr_html@/admin/Admin/hand_exams@/admin/Admin/join_evaluation@/admin/Admin/evaluation@/admin/Admin/evaluation_record@/admin/System/message_detial@/admin/System/system_message@/admin/System/export_pdf@/admin/Admin/web_chat@/admin/Evaluation/evaluation_add@/admin/Evaluation/index@/admin/Evaluation/evaluation_add@/admin/Evaluation/evaluation_edit@/admin/Evaluation/evaluation_toggle@/admin/Evaluation/evaluation_delete@/admin/Evaluation/delete_all', '1', '具有培训测评相关的权限', '1');
INSERT INTO `f_role_group` VALUES ('15', '1@2@', 'HR管理员', '/admin/System/update_pass@/admin/System/clock_pass@/admin/System/extraconfig@/admin/Login/login@/admin/Login/base_login@/admin/Login/last_login_info@/admin/Login/count_login@/admin/Login/extraconfig@/admin/Login/index@/admin/Login/logout@/admin/Index/clear_cache@/admin/Index/del_runtime@/admin/Index/index@/admin/Index/welcome@/admin/Index/max_time@/admin/System/sleep_timeout@/admin/Admin/admin_info@/admin/Admin/up_photos@/admin/Admin/base_info@/admin/Admin/get_options@/admin/Admin/cutstr_html@/admin/Admin/hand_exams@/admin/Admin/join_evaluation@/admin/Admin/evaluation@/admin/Admin/evaluation_record@/admin/System/message_detial@/admin/System/system_message@/admin/System/export_pdf@/admin/Admin/web_chat@/admin/Department/department_list@/admin/Department/department_info@/admin/Department/department_add@/admin/Department/department_edit@/admin/Department/delete_department@/admin/Staff/archives_list@/admin/Staff/archives_info', '1', 'HR具有人事相关的权限', '1');
INSERT INTO `f_role_group` VALUES ('16', '1@3', '财务管理员', '/index.php/admin/System/update_pass@/index.php/admin/System/clock_pass@/index.php/admin/System/extraconfig@/index.php/admin/Login/login@/index.php/admin/Login/base_login@/index.php/admin/Login/last_login_info@/index.php/admin/Login/count_login@/index.php/admin/Login/extraconfig@/index.php/admin/Login/index@/index.php/admin/Login/logout@/index.php/admin/Index/clear_cache@/index.php/admin/Index/del_runtime@/index.php/admin/Index/index@/index.php/admin/Index/welcome@/index.php/admin/Index/max_time@/index.php/admin/System/sleep_timeout@/index.php/admin/Admin/admin_info@/index.php/admin/Admin/up_photos@/index.php/admin/Admin/base_info@/index.php/admin/Admin/get_options@/index.php/admin/Admin/cutstr_html@/index.php/admin/Admin/hand_exams@/index.php/admin/Admin/join_evaluation@/index.php/admin/Admin/evaluation@/index.php/admin/Admin/evaluation_record@/index.php/admin/System/message_detial@/index.php/admin/System/system_message@/index.php/admin/System/export_pdf@/index.php/admin/Admin/web_chat', '1', '具有财务管理相关的权限', '0');
INSERT INTO `f_role_group` VALUES ('17', '1@3@', '财务管理员', '/admin/System/update_pass@/admin/System/clock_pass@/admin/System/extraconfig@/admin/Login/login@/admin/Login/base_login@/admin/Login/last_login_info@/admin/Login/count_login@/admin/Login/extraconfig@/admin/Login/index@/admin/Login/logout@/admin/Index/clear_cache@/admin/Index/del_runtime@/admin/Index/index@/admin/Index/welcome@/admin/Index/max_time@/admin/System/sleep_timeout@/admin/Admin/admin_info@/admin/Admin/up_photos@/admin/Admin/base_info@/admin/Admin/get_options@/admin/Admin/cutstr_html@/admin/Admin/hand_exams@/admin/Admin/join_evaluation@/admin/Admin/evaluation@/admin/Admin/evaluation_record@/admin/System/message_detial@/admin/System/system_message@/admin/System/export_pdf@/admin/Admin/web_chat@/admin/Rinance/cash', '1', '具有财务管理相关的权限', '1');
INSERT INTO `f_role_group` VALUES ('18', '1@3@', '会计管理员', '/admin/System/update_pass@/admin/System/clock_pass@/admin/System/extraconfig@/admin/Login/login@/admin/Login/base_login@/admin/Login/last_login_info@/admin/Login/count_login@/admin/Login/extraconfig@/admin/Login/index@/admin/Login/logout@/admin/Index/clear_cache@/admin/Index/del_runtime@/admin/Index/index@/admin/Index/welcome@/admin/Index/max_time@/admin/System/sleep_timeout@/admin/Admin/admin_info@/admin/Admin/up_photos@/admin/Admin/base_info@/admin/Admin/get_options@/admin/Admin/cutstr_html@/admin/Admin/hand_exams@/admin/Admin/join_evaluation@/admin/Admin/evaluation@/admin/Admin/evaluation_record@/admin/System/message_detial@/admin/System/system_message@/admin/System/export_pdf@/admin/Admin/web_chat@/admin/Rinance/cash', '1', '具有财务管理相关的权限', '1');

-- ----------------------------
-- Table structure for f_smtp_config
-- ----------------------------
DROP TABLE IF EXISTS `f_smtp_config`;
CREATE TABLE `f_smtp_config` (
  `id` int(10) unsigned NOT NULL DEFAULT '1',
  `smtp_name` varchar(255) NOT NULL,
  `smtp_port` varchar(255) NOT NULL,
  `author_code` varchar(50) NOT NULL,
  `send_email_address` varchar(255) NOT NULL,
  `send_nickname` varchar(255) NOT NULL,
  `email_pass` varchar(255) NOT NULL,
  `reply_address` varchar(50) NOT NULL,
  `reply_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_smtp_config
-- ----------------------------
INSERT INTO `f_smtp_config` VALUES ('1', 'smtp.qq.com', '465', 'gpfnatajjnmcdcac', '1719847255@qq.com', 'flyfly~~~', 'fy7276945201314', '1719847255@qq.com', '');

-- ----------------------------
-- Table structure for f_staff
-- ----------------------------
DROP TABLE IF EXISTS `f_staff`;
CREATE TABLE `f_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(20) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `education_id` int(10) unsigned NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  `titles_id` int(10) unsigned NOT NULL COMMENT '职称',
  `join_time` varchar(20) NOT NULL COMMENT '入职时间',
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '1表示在职，0表示离职',
  `email` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `telephone` varchar(11) NOT NULL,
  `is_available` int(1) unsigned NOT NULL DEFAULT '1',
  `id_card` varchar(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_staff
-- ----------------------------
INSERT INTO `f_staff` VALUES ('1', '冯毅', '1', '2', '3', '1', '1515427200', '1', '1719847255@qq.com', '贵州省贵阳市云岩区', '18885175642', '1', '');
INSERT INTO `f_staff` VALUES ('2', '谢云芸', '0', '2', '4', '1', '1528473600', '1', '133443567@qq.com', '贵州省贵阳市云岩区', '18208482313', '1', '');
INSERT INTO `f_staff` VALUES ('3', '小老二', '0', '2', '3', '2', '1546963200', '0', '146774546@qq.com', '贵州省贵阳市', '18208482313', '0', '');

-- ----------------------------
-- Table structure for f_system_message
-- ----------------------------
DROP TABLE IF EXISTS `f_system_message`;
CREATE TABLE `f_system_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `create_time` varchar(20) NOT NULL,
  `status` varchar(1) NOT NULL,
  `read_ids` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_system_message
-- ----------------------------

-- ----------------------------
-- Table structure for f_system_sort
-- ----------------------------
DROP TABLE IF EXISTS `f_system_sort`;
CREATE TABLE `f_system_sort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort_name` varchar(20) NOT NULL,
  `is_available` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_system_sort
-- ----------------------------
INSERT INTO `f_system_sort` VALUES ('1', '后台系统_Admin', '1');
INSERT INTO `f_system_sort` VALUES ('2', '人力资源系统_Hr', '1');
INSERT INTO `f_system_sort` VALUES ('3', '财务系统_Finance', '1');

-- ----------------------------
-- Table structure for f_template_message
-- ----------------------------
DROP TABLE IF EXISTS `f_template_message`;
CREATE TABLE `f_template_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `primary_industry` varchar(50) NOT NULL,
  `deputy_industry` varchar(50) NOT NULL,
  `example` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_template_message
-- ----------------------------
INSERT INTO `f_template_message` VALUES ('1', 'ZSl3MU4tT4Nib9TVWWZdmJy2idoTXEmZm_UutohHjn8', '订单支付成功', '{{first.DATA}}\n商品信息：{{keyword1.DATA}}\n商品价格：{{keyword2.DATA}}\n下单日期：{{keyword3.DATA}}\n{{remark.DATA}}', '', '', '');

-- ----------------------------
-- Table structure for f_template_message_info
-- ----------------------------
DROP TABLE IF EXISTS `f_template_message_info`;
CREATE TABLE `f_template_message_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` varchar(50) NOT NULL,
  `first` varchar(255) NOT NULL,
  `url` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_template_message_info
-- ----------------------------
INSERT INTO `f_template_message_info` VALUES ('1', 'ZSl3MU4tT4Nib9TVWWZdmJy2idoTXEmZm_UutohHjn8', '恭喜你，下单成功！', 'http://www.flyfly.com/admin/index/index', '欢迎再次下单！', '#1c97f5');

-- ----------------------------
-- Table structure for f_template_message_keywords
-- ----------------------------
DROP TABLE IF EXISTS `f_template_message_keywords`;
CREATE TABLE `f_template_message_keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` varchar(50) NOT NULL,
  `value` varchar(255) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_template_message_keywords
-- ----------------------------
INSERT INTO `f_template_message_keywords` VALUES ('1', 'ZSl3MU4tT4Nib9TVWWZdmJy2idoTXEmZm_UutohHjn8', '巧克力：', '#1c97f5');
INSERT INTO `f_template_message_keywords` VALUES ('2', 'ZSl3MU4tT4Nib9TVWWZdmJy2idoTXEmZm_UutohHjn8', '39.8元', '#1c97f5');
INSERT INTO `f_template_message_keywords` VALUES ('3', 'ZSl3MU4tT4Nib9TVWWZdmJy2idoTXEmZm_UutohHjn8', '2019年01月20日', '#1c97f5');

-- ----------------------------
-- Table structure for f_titles
-- ----------------------------
DROP TABLE IF EXISTS `f_titles`;
CREATE TABLE `f_titles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_titles
-- ----------------------------
INSERT INTO `f_titles` VALUES ('1', '初级职称');
INSERT INTO `f_titles` VALUES ('2', '中级职称');
INSERT INTO `f_titles` VALUES ('3', '高级职称');

-- ----------------------------
-- Table structure for f_todo_list
-- ----------------------------
DROP TABLE IF EXISTS `f_todo_list`;
CREATE TABLE `f_todo_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sponsor` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0' COMMENT '0表示待办，1表示取回，2表示已办，3表示被驳回',
  `is_available` varchar(1) NOT NULL DEFAULT '1',
  `todo_list_id` int(10) unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  `back_reason` text,
  `approve` varchar(20) NOT NULL COMMENT '审批人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_todo_list
-- ----------------------------

-- ----------------------------
-- Table structure for f_web_info
-- ----------------------------
DROP TABLE IF EXISTS `f_web_info`;
CREATE TABLE `f_web_info` (
  `id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `web_title` varchar(20) NOT NULL,
  `web_name` varchar(50) NOT NULL,
  `web_desc` varchar(255) NOT NULL,
  `web_record` varchar(50) NOT NULL COMMENT '网站基础信息表',
  `web_version` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_web_info
-- ----------------------------
INSERT INTO `f_web_info` VALUES ('1', 'FlyFly 后台管理系统', 'FlyFly', '你猜不着，你管不着！！！', '京ICP备08001421号', ' v0.1');

-- ----------------------------
-- Table structure for f_wechat_config
-- ----------------------------
DROP TABLE IF EXISTS `f_wechat_config`;
CREATE TABLE `f_wechat_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(20) NOT NULL,
  `appsecret` varchar(50) NOT NULL,
  `token` varchar(50) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_wechat_config
-- ----------------------------
INSERT INTO `f_wechat_config` VALUES ('1', 'wx5160cc8aaad9a9ec', '67be8d9aae3492d6496c2ae11c782531', 'fengyi', '微信基本信息配置项...', 'flyfly~~~');

-- ----------------------------
-- Table structure for f_wechat_fans
-- ----------------------------
DROP TABLE IF EXISTS `f_wechat_fans`;
CREATE TABLE `f_wechat_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscribe` varchar(1) NOT NULL COMMENT '是否关注公众号',
  `openid` varchar(32) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `language` varchar(10) NOT NULL,
  `country` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `province` varchar(20) NOT NULL,
  `headimgurl` varchar(255) NOT NULL,
  `subscribe_time` varchar(20) NOT NULL,
  `subscribe_scene` varchar(50) NOT NULL COMMENT '关注渠道',
  `fans_tag_id` int(10) unsigned DEFAULT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_wechat_fans
-- ----------------------------
INSERT INTO `f_wechat_fans` VALUES ('1', '1', 'oPqJq1KjvhKhbkEUWm-jHiiFEeJA', '沙朗嘿唷', '2', 'zh_CN', '中国', '贵阳', '贵州', 'http://thirdwx.qlogo.cn/mmopen/C7ibZSZPFvwBlxFc7gd1Md4icCJoY4xtFibgmLSSA4MJlEibSw01K6tq869FcOZes531oOONbgMtHBz0DHEbWU7FFh9mRmnyAGv1/132', '1541677773', 'ADD_SCENE_PROFILE_CARD', null, '1');
INSERT INTO `f_wechat_fans` VALUES ('2', '1', 'oPqJq1Hq451sLfb02nmt21NmLXLA', 'fly fly～～', '1', 'zh_CN', '中国', '大连', '辽宁', 'http://thirdwx.qlogo.cn/mmopen/C7ibZSZPFvwBZHgP1QibBfozzEt4Awodz7UiaoEicNWqpjIyDFVApePibN8f1grTpKxetnLcibPcuSCMJJrPJcydINjJqib42o9VYcK/132', '1547974824', 'ADD_SCENE_QR_CODE', null, '1');
