/*
Navicat MySQL Data Transfer

Source Server         : 李鸿飞
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : work

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-03-11 15:57:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for room_user
-- ----------------------------
DROP TABLE IF EXISTS `room_user`;
CREATE TABLE `room_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `user_sex` int(11) DEFAULT NULL COMMENT '性别',
  `room` varchar(11) DEFAULT NULL COMMENT '房间号',
  `room_type` varchar(255) DEFAULT NULL COMMENT '房间类型',
  `start_time` datetime DEFAULT NULL COMMENT '入住时间',
  `end_time` datetime DEFAULT NULL COMMENT '退房时间',
  `room_status` int(11) DEFAULT NULL COMMENT '入住状态 0空闲 1预约中 3已入住',
  `is_del` int(11) DEFAULT NULL COMMENT '显示状态 1正常  2删除',
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_user
-- ----------------------------
INSERT INTO `room_user` VALUES ('1', '请问', '1', '1904', 'sdasda', '2020-03-03 00:00:00', '2020-03-11 10:28:53', '0', '2', '1');
INSERT INTO `room_user` VALUES ('2', 'qwe', '1', '1903', 'asdasdasd', '2020-03-07 00:00:00', '2020-03-11 00:11:38', '0', '2', '2');
INSERT INTO `room_user` VALUES ('3', 'as', '2', '1906', 'qweqwe', '2020-03-07 00:00:00', '2020-03-09 00:00:00', '0', '2', '3');
INSERT INTO `room_user` VALUES ('4', 'az', '1', '1904', 'asdasd', '2020-03-08 00:00:00', '2020-03-11 10:28:53', '0', '2', '4');
INSERT INTO `room_user` VALUES ('5', 'as', '2', '1903', 'qweqwe', '2020-03-04 00:00:00', '2020-03-11 00:11:38', '0', '2', '5');
INSERT INTO `room_user` VALUES ('8', 'as', '1', '1904', '总统套房', '2020-03-10 14:39:50', '2020-03-11 10:28:53', '0', '2', '6');
INSERT INTO `room_user` VALUES ('9', 'as', '1', '1904', '总统套房', '2020-03-10 14:58:18', '2020-03-11 10:28:53', '0', '2', '7');
INSERT INTO `room_user` VALUES ('10', 'as', '2', '1904', '总统套房', '2020-03-10 18:38:32', '2020-03-11 10:28:53', '0', '2', '8');
INSERT INTO `room_user` VALUES ('11', 'qw', '1', '1904', '总统套房', '2020-03-10 19:31:24', '2020-03-11 10:28:53', '0', '2', '9');
INSERT INTO `room_user` VALUES ('12', 'zx', '1', '1904', '总统套房', '2020-03-10 19:32:47', '2020-03-11 10:28:53', '0', '2', '1');
INSERT INTO `room_user` VALUES ('13', 'zz', '2', '1904', '总统套房', '2020-03-10 19:32:47', '2020-03-11 10:28:53', '0', '2', '10');
INSERT INTO `room_user` VALUES ('14', 'as', '2', '1904', '总统套房', '2020-03-10 19:37:05', '2020-03-11 10:28:53', '0', '2', '11');
INSERT INTO `room_user` VALUES ('15', 'as', '2', '1904', '总统套房', '2020-03-10 19:39:38', '2020-03-11 10:28:53', '0', '2', '12');
INSERT INTO `room_user` VALUES ('16', 'aa', '2', '1903', 'qwqwe', '2020-03-10 19:42:09', '2020-03-11 00:11:38', '0', '2', '13');
INSERT INTO `room_user` VALUES ('17', 'aa', '2', '1903', 'qwqwe', '2020-03-10 20:04:28', '2020-03-11 00:11:38', '0', '2', '14');
INSERT INTO `room_user` VALUES ('18', 'qw', '1', '1903', 'qwqwe', '2020-03-10 20:06:19', '2020-03-11 00:11:38', '0', '2', '15');
INSERT INTO `room_user` VALUES ('19', 'qw', '2', '1903', 'qwqwe', '2020-03-10 20:09:34', '2020-03-11 00:11:38', '0', '2', '16');
INSERT INTO `room_user` VALUES ('20', 'as', '2', '1903', 'qwqwe', '2020-03-10 20:09:51', '2020-03-11 00:11:38', '0', '2', '18');
INSERT INTO `room_user` VALUES ('21', 'aaaa', '2', '1903', 'qwqwe', '2020-03-10 20:09:51', '2020-03-11 00:11:38', '0', '2', '19');
INSERT INTO `room_user` VALUES ('22', 'ww', null, '1904', '总统套房', '2020-03-10 22:32:44', '2020-03-11 10:28:53', '0', '2', '20');
INSERT INTO `room_user` VALUES ('23', 'cc', '1', '1903', 'qwqwe', '2020-03-11 00:07:06', '2020-03-11 00:11:38', '0', '2', '21');
INSERT INTO `room_user` VALUES ('24', 'qw', '2', '1903', 'qwqwe', '2020-03-11 00:07:33', '2020-03-11 00:11:38', '0', '2', '22');
INSERT INTO `room_user` VALUES ('25', 'zz', '2', '1903', 'qwqwe', '2020-03-11 00:07:33', '2020-03-11 00:11:38', '0', '2', '23');
INSERT INTO `room_user` VALUES ('26', 'ww', '1', '1903', 'qwqwe', '2020-03-11 00:11:01', '2020-03-11 00:11:38', '0', '2', '24');
INSERT INTO `room_user` VALUES ('27', 'qw', '2', '1903', 'qwqwe', '2020-03-11 00:11:27', '2020-03-11 00:11:38', '0', '2', '25');
INSERT INTO `room_user` VALUES ('28', 'aaaa', '2', '1903', 'qwqwe', '2020-03-11 00:11:27', '2020-03-11 00:11:38', '0', '2', '26');
INSERT INTO `room_user` VALUES ('29', 'ih', '2', '1903', 'qwqwe', '2020-03-11 00:11:27', '2020-03-11 00:11:38', '0', '2', '27');
INSERT INTO `room_user` VALUES ('30', 'cc', '1', '1904', '总统套房', '2020-03-11 10:27:52', '2020-03-11 10:28:53', '0', '2', '28');
INSERT INTO `room_user` VALUES ('31', 'ghgh', '1', '1904', '总统套房', '2020-03-11 10:28:16', '2020-03-11 10:28:53', '0', '2', null);
INSERT INTO `room_user` VALUES ('32', 'aaaa', '2', '1904', '总统套房', '2020-03-11 10:28:16', '2020-03-11 10:28:53', '0', '2', null);
INSERT INTO `room_user` VALUES ('33', 'ih', '2', '1904', '总统套房', '2020-03-11 10:28:16', '2020-03-11 10:28:53', '0', '2', null);
