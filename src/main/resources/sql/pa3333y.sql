/*
Navicat MySQL Data Transfer

Source Server         : 李鸿飞
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : work

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-03-11 15:57:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `monetary` double DEFAULT NULL COMMENT '消费金额',
  `pay_time` datetime DEFAULT NULL COMMENT '消费时间',
  `pay_type` int(11) DEFAULT NULL COMMENT '消费类型:1现金,2:会员卡',
  `room_type` varchar(255) DEFAULT NULL,
  `room` int(11) DEFAULT NULL,
  `admin_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay
-- ----------------------------
