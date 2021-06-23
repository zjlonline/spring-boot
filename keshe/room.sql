/*
Navicat MySQL Data Transfer

Source Server         : lab1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : room

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2021-06-14 17:02:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for apartinfo
-- ----------------------------
DROP TABLE IF EXISTS `apartinfo`;
CREATE TABLE `apartinfo` (
  `sushe` int(255) NOT NULL,
  `room` int(255) NOT NULL,
  `max` int(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  KEY `room` (`room`),
  KEY `11` (`sushe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apartinfo
-- ----------------------------
INSERT INTO `apartinfo` VALUES ('3', '310', '4', '华软');
INSERT INTO `apartinfo` VALUES ('3', '304', '4', '华软');
INSERT INTO `apartinfo` VALUES ('3', '307', '4', '华软');
INSERT INTO `apartinfo` VALUES ('3', '308', '4', '华软');
INSERT INTO `apartinfo` VALUES ('3', '309', '4', '华软');
INSERT INTO `apartinfo` VALUES ('3', '310', '4', '华软');
INSERT INTO `apartinfo` VALUES ('3', '320', '4', '华软');
INSERT INTO `apartinfo` VALUES ('2', '310', '4', '华软');

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img` (
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of img
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `clas` varchar(255) DEFAULT NULL,
  `sushe` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sushe` (`sushe`),
  KEY `33` (`room`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('14', 'lj', '男', 'jsj', '华软', '3', '3', '320', null);
INSERT INTO `student` VALUES ('2', '2', '男', '计算机', '华软', '3', '3', '308', null);
INSERT INTO `student` VALUES ('3', '3', '男', '计算机', '华软', '3', '3', '307', null);
INSERT INTO `student` VALUES ('4', '4', '男', '计算机', '华软', '3', '3', '309', null);
INSERT INTO `student` VALUES ('5', '5', '男', '计算机', '华软', '3', '3', '310', null);
INSERT INTO `student` VALUES ('6', '6', '男', '计算机', '华软', '3', '3', '304', null);
INSERT INTO `student` VALUES ('19', '19', '男', '计算机', '华软', '3', '2', '310', null);
INSERT INTO `student` VALUES ('7', '7', '男', '计算机', '华软', '3', '2', '310', null);
INSERT INTO `student` VALUES ('9', '9', '男', '计算机', '华软', '3', '3', '307', null);
INSERT INTO `student` VALUES ('10', '10', '男', '计算机', '华软', '3', '3', '306', null);
INSERT INTO `student` VALUES ('11', '11', '男', '计算机', '华软', '3', '3', '309', null);
INSERT INTO `student` VALUES ('12', '12', '男', '计算机', '华软', '3', '3', '310', null);
INSERT INTO `student` VALUES ('13', '13', '男', '计算机', '华软', '3', '3', '310', null);
INSERT INTO `student` VALUES ('15', 'kl', '男', 'jsj', 'gr', '3', '3', '309', null);
INSERT INTO `student` VALUES ('16', '16', '男', 'jsj', 'hr', '3', '3', '310', null);
INSERT INTO `student` VALUES ('36', '777', '男', 'jsj', 'hr', '3', '3', '310', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', 'admin');
INSERT INTO `user` VALUES ('zjl', '123456789');
INSERT INTO `user` VALUES ('123', '123');
INSERT INTO `user` VALUES ('321', '321');
INSERT INTO `user` VALUES ('cjx', 'cjx');
INSERT INTO `user` VALUES ('ysh', 'ysh');
