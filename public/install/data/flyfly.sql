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

SET NAMES utf8;
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
-- Table structure for f_members_type
-- ----------------------------
DROP TABLE IF EXISTS `f_members_type`;
CREATE TABLE `f_members_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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