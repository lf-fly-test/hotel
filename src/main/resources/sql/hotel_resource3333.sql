/*
Navicat MySQL Data Transfer

Source Server         : 李鸿飞
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : work

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-03-11 15:56:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hotel_resource
-- ----------------------------
DROP TABLE IF EXISTS `hotel_resource`;
CREATE TABLE `hotel_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `is_del` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel_resource
-- ----------------------------
INSERT INTO `hotel_resource` VALUES ('1', '酒店管理', '-', '0', '1', '0');
INSERT INTO `hotel_resource` VALUES ('2', '房间信息查询', '/room/toShow', '1', '1', '1');
INSERT INTO `hotel_resource` VALUES ('3', '用户入住信息', '/room/toRoomUserShow', '1', '1', '1');
INSERT INTO `hotel_resource` VALUES ('4', '用户信息管理', '/user/toAdminShow', '1', '1', '1');
INSERT INTO `hotel_resource` VALUES ('5', '会员管理', '/user/toShow', '1', '1', '1');
