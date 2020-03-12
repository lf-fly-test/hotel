/*
Navicat MySQL Data Transfer

Source Server         : 李鸿飞
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : work

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-03-11 15:57:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room` varchar(255) DEFAULT NULL COMMENT '房间',
  `room_type` varchar(255) DEFAULT NULL COMMENT '房间类型',
  `room_price` double(10,2) DEFAULT NULL COMMENT '价格',
  `room_status` varchar(255) DEFAULT NULL COMMENT '房间状态 0空闲  1：预约中  2：预约成功 ，已入住',
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', '1904', '总统套房', '5200.00', '0', 'zs');
INSERT INTO `room` VALUES ('2', '1905', '双人间', '5800.00', '2', '111');
INSERT INTO `room` VALUES ('3', '1906', '主题套房', '10000.00', '2', 'cc');
INSERT INTO `room` VALUES ('4', '1907', '标准间', '4000.00', '2', 'cc');
