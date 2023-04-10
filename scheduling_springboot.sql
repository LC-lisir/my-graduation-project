/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : scheduling_face_springboot

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2021-03-29 12:55:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sc_admin
-- ----------------------------
DROP TABLE IF EXISTS `sc_admin`;
CREATE TABLE `sc_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_admin
-- ----------------------------
INSERT INTO `sc_admin` VALUES ('1', 'admin', '123456');

-- ----------------------------
-- Table structure for sc_apply
-- ----------------------------
DROP TABLE IF EXISTS `sc_apply`;
CREATE TABLE `sc_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `start_ts` varchar(255) DEFAULT NULL,
  `end_ts` varchar(255) DEFAULT NULL,
  `cts` varchar(255) DEFAULT NULL,
  `is_audit` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `audit_ts` varchar(255) DEFAULT NULL,
  `employees_id` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_apply
-- ----------------------------
INSERT INTO `sc_apply` VALUES ('6', 'leave', '身体不舒服，需要去医院，已预约', '2020-04-23T00:00', '2020-04-23T00:00', '2020-04-10 18:54:18', '2', '不同意，改天去看医生不行么', '2020-04-10 20:03:08', '1');

-- ----------------------------
-- Table structure for sc_clockin
-- ----------------------------
DROP TABLE IF EXISTS `sc_clockin`;
CREATE TABLE `sc_clockin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employees_id` varchar(11) DEFAULT NULL,
  `cts` varchar(255) DEFAULT NULL,
  `day` varchar(255) DEFAULT NULL,
  `dkstart_ts` varchar(255) DEFAULT NULL,
  `dkend_ts` varchar(255) DEFAULT NULL,
  `is_late` varchar(255) DEFAULT NULL,
  `leave_early` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_clockin
-- ----------------------------

-- ----------------------------
-- Table structure for sc_department
-- ----------------------------
DROP TABLE IF EXISTS `sc_department`;
CREATE TABLE `sc_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(255) DEFAULT NULL,
  `cts` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_department
-- ----------------------------
INSERT INTO `sc_department` VALUES ('1', '车间', '2020-04-09 15:42:20');
INSERT INTO `sc_department` VALUES ('3', '后勤', '2020-04-09 15:43:46');
INSERT INTO `sc_department` VALUES ('4', '流水线', '2020-04-09 16:14:46');

-- ----------------------------
-- Table structure for sc_employees
-- ----------------------------
DROP TABLE IF EXISTS `sc_employees`;
CREATE TABLE `sc_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uno` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  `cts` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `borth` varchar(255) DEFAULT NULL,
  `department_id` varchar(11) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `faceimg` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_employees
-- ----------------------------
INSERT INTO `sc_employees` VALUES ('1', '0001', '123456', '2020-04-09 16:34:42', '男', '2020-04-09', '1', '王小二', 'upimgs/employees/photo/b38ed417ac.jpeg');
INSERT INTO `sc_employees` VALUES ('2', '0002', '123456', '2020-04-09 16:42:42', '女', '2020-04-24', '3', '张海', 'upimgs/employees/photo/c821fbc4ab.jpeg');
INSERT INTO `sc_employees` VALUES ('3', '0003', '123456', '2020-04-10 15:24:56', '女', '2020-04-10', '1', '张晓红', null);
INSERT INTO `sc_employees` VALUES ('4', '0004', '123456', '2020-04-10 15:25:15', '男', '2020-04-02', '1', '赵刚', null);
INSERT INTO `sc_employees` VALUES ('5', '0005', '123456', '2020-04-10 15:26:02', '女', '2020-04-01', '4', '张叶', null);
INSERT INTO `sc_employees` VALUES ('6', '0006', '123456', '2020-04-10 15:26:27', '女', '2020-04-01', '1', '王子情', null);
INSERT INTO `sc_employees` VALUES ('7', '0007', '123456', '2020-04-10 15:26:51', '女', '2020-04-01', '1', '高小青', null);
INSERT INTO `sc_employees` VALUES ('8', '0008', '123456', '2020-04-10 15:27:14', '女', '2020-04-10', '1', '张子枫', null);
INSERT INTO `sc_employees` VALUES ('9', '0009', '123456', '2020-04-10 15:27:44', '女', '2020-04-10', '1', '肖花花', null);
INSERT INTO `sc_employees` VALUES ('10', '0010', '123456', '2020-04-10 15:28:09', '男', '2020-04-09', '1', '吴子豪', null);
INSERT INTO `sc_employees` VALUES ('11', '0011', '123456', '2020-04-10 15:28:39', '男', '2020-04-16', '1', '杨天', 'upimgs/employees/photo/20210329125248a733a8e7cc.jpeg');

-- ----------------------------
-- Table structure for sc_notice
-- ----------------------------
DROP TABLE IF EXISTS `sc_notice`;
CREATE TABLE `sc_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `context` text,
  `cts` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_notice
-- ----------------------------
INSERT INTO `sc_notice` VALUES ('2', '关于2020年劳动节放假安排的通知', '根据国务院办公厅通知精神，现将2020年劳动节放假安排通知如下：\r\n\r\n5月1日（星期五）至5月5日（星期二）放假调休，共5天。\r\n\r\n4月26日（星期日）、5月9日（星期六）上班。', '2020-04-09 19:24:36');
INSERT INTO `sc_notice` VALUES ('3', '关于4月5号复工通知', '4曰5号，流水线和车间复工，请大家带好口罩，避免扎堆，保持间距上下班。上下班需要测量体温，一旦发现发热症状，请立刻自行距离和上报。', '2020-04-10 13:54:23');

-- ----------------------------
-- Table structure for sc_schedul
-- ----------------------------
DROP TABLE IF EXISTS `sc_schedul`;
CREATE TABLE `sc_schedul` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) DEFAULT NULL,
  `start_ts` varchar(255) DEFAULT NULL,
  `end_ts` varchar(255) DEFAULT NULL,
  `cts` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_schedul
-- ----------------------------
INSERT INTO `sc_schedul` VALUES ('1', '早班', '08:00', '16:00', '2020-04-09 18:28:39');
INSERT INTO `sc_schedul` VALUES ('2', '午班', '14:00', '22:00', '2020-04-09 18:29:20');
INSERT INTO `sc_schedul` VALUES ('3', '晚班', '16:00', '00:00', '2020-04-09 18:29:48');

-- ----------------------------
-- Table structure for sc_schedul_manager
-- ----------------------------
DROP TABLE IF EXISTS `sc_schedul_manager`;
CREATE TABLE `sc_schedul_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_ts` varchar(255) DEFAULT NULL,
  `end_ts` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `employees_id` varchar(255) DEFAULT NULL,
  `cts` varchar(255) DEFAULT NULL,
  `day` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_schedul_manager
-- ----------------------------
INSERT INTO `sc_schedul_manager` VALUES ('192', '08:00', '16:00', ' ', '11', '2020-04-10 17:57:28', '2020-05-29', 'days');
INSERT INTO `sc_schedul_manager` VALUES ('193', '08:00', '16:00', ' ', '11', '2020-04-10 17:57:28', '2020-05-30', 'days');
INSERT INTO `sc_schedul_manager` VALUES ('194', '08:00', '16:00', ' ', '11', '2020-04-10 17:57:28', '2020-05-31', 'days');
INSERT INTO `sc_schedul_manager` VALUES ('195', '08:00', '16:00', ' ', '11', '2020-04-10 17:57:28', '2020-06-01', 'days');
INSERT INTO `sc_schedul_manager` VALUES ('196', '08:00', '16:00', ' ', '11', '2020-04-10 17:57:28', '2020-06-02', 'days');
INSERT INTO `sc_schedul_manager` VALUES ('197', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-01', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('198', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-02', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('199', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-03', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('200', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-04', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('201', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-05', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('202', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-06', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('203', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-07', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('204', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-08', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('205', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-09', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('206', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-10', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('207', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-11', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('208', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-12', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('209', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-13', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('210', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-14', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('211', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-15', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('212', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-16', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('213', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-17', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('214', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-18', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('215', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-19', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('216', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-20', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('217', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-21', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('218', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-22', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('219', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-23', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('220', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-24', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('221', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-25', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('222', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-26', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('223', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-27', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('224', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-28', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('225', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-29', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('226', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-30', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('227', '14:00', '22:00', ' ', '1', '2020-04-10 19:41:26', '2020-05-31', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('228', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-01', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('229', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-02', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('230', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-03', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('231', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-04', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('232', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-05', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('233', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-06', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('234', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-07', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('235', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-08', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('236', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-09', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('237', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-10', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('238', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-11', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('239', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-12', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('240', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-13', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('241', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-14', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('242', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-15', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('243', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-16', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('244', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-17', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('245', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-18', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('246', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-19', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('247', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-20', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('248', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-21', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('249', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-22', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('250', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-23', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('251', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-24', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('252', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-25', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('253', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-26', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('254', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-27', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('255', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-28', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('256', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-29', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('257', '16:00', '00:00', ' ', '1', '2020-04-10 20:04:57', '2020-04-30', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('258', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-01', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('259', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-02', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('260', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-03', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('261', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-04', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('262', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-05', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('263', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-06', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('264', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-07', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('265', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-08', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('266', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-09', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('267', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-10', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('268', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-11', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('269', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-12', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('270', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-13', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('271', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-14', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('272', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-15', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('273', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-16', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('274', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-17', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('275', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-18', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('276', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-19', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('277', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-20', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('278', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-21', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('279', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-22', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('280', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-23', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('281', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-24', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('282', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-25', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('283', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-26', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('284', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-27', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('285', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-28', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('286', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-29', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('287', '14:00', '22:00', ' ', '11', '2020-09-30 19:33:17', '2020-09-30', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('288', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-01', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('289', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-02', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('290', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-03', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('291', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-04', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('292', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-05', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('293', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-06', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('294', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-07', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('295', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-08', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('296', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-09', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('297', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-10', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('298', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-11', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('299', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-12', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('300', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-13', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('301', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-14', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('302', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-15', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('303', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-16', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('304', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-17', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('305', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-18', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('306', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-19', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('307', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-20', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('308', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-21', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('309', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-22', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('310', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-23', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('311', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-24', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('312', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-25', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('313', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-26', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('314', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-27', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('315', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-28', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('316', '13:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-29', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('317', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-30', 'month');
INSERT INTO `sc_schedul_manager` VALUES ('318', '08:00', '16:00', ' ', '11', '2021-03-29 12:29:38', '2021-03-31', 'month');
