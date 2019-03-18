/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : db_database10

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2017-06-21 13:14:19
*/

SET FOREIGN_KEY_CHECKS=0;
--
-- Create schema db_database10
--

CREATE DATABASE IF NOT EXISTS db_database10;
USE db_database10;
-- ----------------------------
-- Table structure for `tb_course`
-- ----------------------------
DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '课程编号',
  `name` varchar(40) NOT NULL COMMENT '课程名称',
  `schooltime` varchar(40) NOT NULL COMMENT '上课时间',
  `addr` varchar(50) NOT NULL COMMENT '上课地点',
  `credit` decimal(3,0) NOT NULL COMMENT '课程学分',
  `courseInfo` varchar(100) NOT NULL COMMENT '课程介绍',
  `teacherName` varchar(20) NOT NULL COMMENT '授课教师',
  `teacherInfo` varchar(100) NOT NULL COMMENT '教师介绍',
  `isFinish` bit(1) NOT NULL COMMENT '是否结课',
  `specialtyId` int(10) unsigned NOT NULL COMMENT '专业编号',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_course
-- ----------------------------
INSERT INTO `tb_course` VALUES ('1', '网络信息安全', '每周一8点到10点', 'w102', '2', '专业选修课程', '欧阳老师', '拥有多年教学经验的优秀教师', '', '1');
INSERT INTO `tb_course` VALUES ('2', 'Java程序设计', '每周一、周四上午', 'w102', '4', '基础必修课', '毛老师', '一位优秀的教师', '', '1');
INSERT INTO `tb_course` VALUES ('3', '计算机维护', '每周一晚上', 'w101', '2', '计算机知识', '陈老师', '优秀的教师', '', '2');
INSERT INTO `tb_course` VALUES ('4', '设计模式', '每周二8点到10点', 'w101', '5', '这里是介绍', '张老师', '新来的一个老师', '', '2');
INSERT INTO `tb_course` VALUES ('5', 'J2EE', '每周日', 'W102', '3', '这是一门很难的课', '陈积富', '老师有着丰富的教学经验.....', '', '3');
INSERT INTO `tb_course` VALUES ('6', '数据结构', '周二晚上', 'w102', '4', '很难的课程', '黄老师', '老师有着丰富的教学经验', '', '4');
INSERT INTO `tb_course` VALUES ('7', '算法分析设计', '周三晚上', 'w101', '2', '算法设计', '涂老师', '翻转课堂教育', '', '5');
INSERT INTO `tb_course` VALUES ('8', '艺术导论', '周三下午', 'C108', '2', '开启艺术人生', '薛老师', '知识渊博', '', '1');
INSERT INTO `tb_course` VALUES ('9', 'DV制作', '周三上午', 'C407', '2', 'DV后期', '李老师', '专业能力强', '', '1');
INSERT INTO `tb_course` VALUES ('10', '摄影学', '周一上午、周四下午', 'C211', '2', '摄影科学', '王老师', '系统化教学', '', '1');

-- ----------------------------
-- Table structure for `tb_specialty`
-- ----------------------------
DROP TABLE IF EXISTS `tb_specialty`;
CREATE TABLE `tb_specialty` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '专业编号',
  `enterYear` varchar(4) NOT NULL COMMENT '入学年份',
  `name` varchar(40) NOT NULL COMMENT '专业名称',
  `langthYear` varchar(10) NOT NULL COMMENT '学制',
  `isFinish` bit(1) NOT NULL COMMENT '是否毕业',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_specialty
-- ----------------------------
INSERT INTO `tb_specialty` VALUES ('1', '2016', '数码设计', '4', '');
INSERT INTO `tb_specialty` VALUES ('2', '2015', '国际金融', '4', '');
INSERT INTO `tb_specialty` VALUES ('3', '2015', '软件工程', '4', '');
INSERT INTO `tb_specialty` VALUES ('4', '2014', '商务英语', '4', '');
INSERT INTO `tb_specialty` VALUES ('5', '2014', '现经管', '4', '');

-- ----------------------------
-- Table structure for `tb_stucourse`
-- ----------------------------
DROP TABLE IF EXISTS `tb_stucourse`;
CREATE TABLE `tb_stucourse` (
  `stuID` int(10) unsigned NOT NULL COMMENT '学生编号',
  `courseID` int(10) unsigned NOT NULL COMMENT '课程编号',
  `id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_stucourse
-- ----------------------------
INSERT INTO `tb_stucourse` VALUES ('6', '1', '3');
INSERT INTO `tb_stucourse` VALUES ('11', '1', '4');
INSERT INTO `tb_stucourse` VALUES ('10', '1', '5');
INSERT INTO `tb_stucourse` VALUES ('12', '1', '6');
INSERT INTO `tb_stucourse` VALUES ('12', '2', '7');
INSERT INTO `tb_stucourse` VALUES ('7', '2', '8');
INSERT INTO `tb_stucourse` VALUES ('10', '2', '9');
INSERT INTO `tb_stucourse` VALUES ('7', '7', '10');
INSERT INTO `tb_stucourse` VALUES ('44', '6', '11');
INSERT INTO `tb_stucourse` VALUES ('45', '7', '12');
INSERT INTO `tb_stucourse` VALUES ('46', '1', '13');
INSERT INTO `tb_stucourse` VALUES ('47', '1', '14');
INSERT INTO `tb_stucourse` VALUES ('48', '1', '15');
INSERT INTO `tb_stucourse` VALUES ('49', '1', '16');
INSERT INTO `tb_stucourse` VALUES ('50', '1', '17');
INSERT INTO `tb_stucourse` VALUES ('51', '1', '18');
INSERT INTO `tb_stucourse` VALUES ('52', '1', '19');
INSERT INTO `tb_stucourse` VALUES ('53', '1', '20');
INSERT INTO `tb_stucourse` VALUES ('54', '1', '21');
INSERT INTO `tb_stucourse` VALUES ('55', '1', '22');
INSERT INTO `tb_stucourse` VALUES ('56', '1', '23');

-- ----------------------------
-- Table structure for `tb_stuuser`
-- ----------------------------
DROP TABLE IF EXISTS `tb_stuuser`;
CREATE TABLE `tb_stuuser` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '学生编号',
  `stuName` varchar(20) NOT NULL COMMENT '学生姓名',
  `stuNo` varchar(15) NOT NULL COMMENT '学号',
  `specialtyId` int(10) unsigned NOT NULL COMMENT '专业编号',
  `stuSex` varchar(2) NOT NULL COMMENT '性别',
  `birthday` varchar(10) NOT NULL COMMENT '出生日期',
  `homeAddr` varchar(50) NOT NULL COMMENT '家庭住址',
  `tel` varchar(20) NOT NULL COMMENT '联系电话',
  `addr` varchar(50) NOT NULL COMMENT '现住址',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_stuuser
-- ----------------------------
INSERT INTO `tb_stuuser` VALUES ('5', '李四', '123456', '1', '男', '1997-06-26', '江西省南昌市', '1500000123', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('6', '张三', '654321', '1', '男', '1997-01-21', '江西省南昌市', '1507894136', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('7', '王二', '555555', '1', '男', '1996-08-01', '江西省南昌市', '0431-84972266', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('10', '麻子', '0154111', '1', '男', '1996-06-01', '江西省南昌市', '136987066', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('11', '蔡鑫', '006', '1', '男', '1997-03-24', '江西省南昌市', '15797651235', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('12', '邓松松', '007', '1', '男', '1996-06-28', '江西省南昌市', '130000066', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('15', '万领顶', '008', '1', '男', '1998-06-26', '江西省南昌市', '1507918111', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('30', '取个', '0154140', '2', '女', '1998-06-26', '江西省南昌市', '1507918111', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('31', '名字', '0154141', '2', '女', '1998-06-26', '江西省南昌市', '1369765888', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('33', '真难', '0154142', '2', '女', '1998-06-26', '江西省南昌市', '13649785125', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('35', '还要', '0154143', '4', '男', '1998-03-01', '江西省南昌市', '13645754485', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('36', '取名字', '0154145', '4', '女', '1998-03-02', '江西省南昌市', '17856412235', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('37', '杨林', '0154156', '7', '男', '1996-07-21', '江西省南昌市', '1530987822', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('38', '明天', '0154157', '5', '男', '1996-05-24', '江西省南昌市', '167894215', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('39', '会更好', '0153122', '4', '女', '1997-04-26', '江西省南昌市', '150545148625', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('40', '小华', '0153123', '4', '男', '1997-04-12', '江西省南昌市', '15078915623', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('43', '小明', '0154125', '3', '男', '1997-05-05', '江西省南昌市', '13705621560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('44', '张明', '0153178', '4', '女', '1997-09-09', '江西省南昌市', '138258454255', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('45', '李明', '0153145', '5', '女', '1998-02-03', '江西省南昌市', '13956426988', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('46', '张新阳', '0155110', '3', '男', '1997-05-05', '江西省南昌市', '13712621560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('47', '张琪琪', '0155111', '3', '女', '1997-05-05', '江西省南昌市', '1454565621560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('48', '张建硕', '0155112', '3', '男', '1997-05-05', '江西省南昌市', '1374521560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('49', '张俊杰', '0155113', '3', '男', '1998-06-24', '江西省南昌市', '13705624560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('50', '张展铭', '0155114', '3', '男', '1998-04-05', '江西省南昌市', '13805621560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('51', '张春华', '0155115', '3', '男', '1997-07-05', '江西省南昌市', '15805621560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('52', '张诗涵', '0155116', '3', '女', '1998-11-12', '江西省南昌市', '134546542180', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('53', '张雨欣', '0155117', '3', '女', '1997-2-14', '江西省南昌市', '1168523410', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('54', '张玉婷', '0155118', '3', '女', '1998-05-05', '江西省南昌市', '145423138560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('55', '张雅静', '0155119', '3', '女', '1997-04-13', '江西省南昌市', '15079721560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('56', '张轩', '0155120', '3', '男', '1997-04-13', '江西省南昌市', '15075689560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('57', '李亚平', '0155123', '1', '女', '1997-04-13', '江西省南昌市', '15045621560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('58', '张雅静', '0155124', '1', '女', '1997-04-13', '江西省南昌市', '150565621560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('60', '李娜', '0155125', '1', '女', '1998-04-13', '江西省南昌市', '15043621560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('61', '李小林', '0155128', '1', '男', '1995-12-13', '江西省南昌市', '15037891560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('62', '李林', '0155129', '1', '女', '1997-04-15', '江西省南昌市', '13789521560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('63', '李慧', '0155130', '1', '女', '1997-04-27', '江西省南昌市', '15067821560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('64', '李红妮', '0155131', '1', '女', '1998-06-24', '江西省南昌市', '15036721560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('65', '李倩', '0155132', '1', '女', '1998-04-13', '江西省南昌市', '1376251560', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('66', '李文雅', '0155133', '1', '女', '1998-10-13', '江西省南昌市', '137062635687', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('67', '李文婷', '0155178', '1', '女', '1998-10-13', '江西省南昌市', '138662635687', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('68', '李文博', '0155145', '1', '男', '1998-10-13', '江西省南昌市', '137367635687', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('69', '李国文', '0155146', '1', '男', '1998-10-13', '江西省南昌市', '138956635687', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('70', '李文文', '0155148', '1', '女', '1998-10-13', '江西省南昌市', '139664635687', '江西省南昌市');
INSERT INTO `tb_stuuser` VALUES ('80', '李昊', '0155127', '1', '男', '1997-04-13', '江西省南昌市', '13756621560', '江西省南昌市');

-- ----------------------------
-- Table structure for `tb_userlogin`
-- ----------------------------
DROP TABLE IF EXISTS `tb_userlogin`;
CREATE TABLE `tb_userlogin` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '用户编号',
  `loginName` varchar(20) NOT NULL COMMENT '登录名称',
  `pwd` varchar(20) NOT NULL COMMENT '登录密码',
  `type` varchar(1) NOT NULL COMMENT '用户类型',
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_userlogin
-- ----------------------------
INSERT INTO `tb_userlogin` VALUES ('1', 'mr', 'mrsoft', '1', 'mr@mr.com');
INSERT INTO `tb_userlogin` VALUES ('2', 'user', '111', '2', '111@mr.com');
INSERT INTO `tb_userlogin` VALUES ('5', 'user2', 'user', '2', 'user');
INSERT INTO `tb_userlogin` VALUES ('6', 'user', '111', '2', '111@mr.com');
INSERT INTO `tb_userlogin` VALUES ('7', 'user1', '555', '2', '111@mr.com');
INSERT INTO `tb_userlogin` VALUES ('8', 'user3', '111', '2', '111@mr.com');
INSERT INTO `tb_userlogin` VALUES ('9', 'user4', '111', '2', '111@mr.com');
INSERT INTO `tb_userlogin` VALUES ('10', 'user5', '111', '2', '111@mr.com');
INSERT INTO `tb_userlogin` VALUES ('11', 'user6', '111', '2', '111@mr.com');
INSERT INTO `tb_userlogin` VALUES ('12', 'user7', '111', '2', '111@mr.com');
INSERT INTO `tb_userlogin` VALUES ('36', 'user9', '3', '2', '3');
INSERT INTO `tb_userlogin` VALUES ('37', 'user10', '3', '2', '3');
INSERT INTO `tb_userlogin` VALUES ('38', 'user11', '3', '2', '3');
INSERT INTO `tb_userlogin` VALUES ('39', 'user12', '3', '2', '3');
INSERT INTO `tb_userlogin` VALUES ('40', 'user22', '111', '2', 'mr');
INSERT INTO `tb_userlogin` VALUES ('41', '2223', '33', '2', '33');
INSERT INTO `tb_userlogin` VALUES ('42', 'cdd', 'cdd', '2', 'we@163.com');
INSERT INTO `tb_userlogin` VALUES ('43', '小明', '000000', '2', '88@88.com');
INSERT INTO `tb_userlogin` VALUES ('44', '00', '000000', '2', '88@88.com');
INSERT INTO `tb_userlogin` VALUES ('45', '88', '88888888', '2', '99@99');
