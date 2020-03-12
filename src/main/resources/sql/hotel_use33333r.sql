/*
Navicat MySQL Data Transfer

Source Server         : 李鸿飞
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : work

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-03-11 15:56:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hotel_user
-- ----------------------------
DROP TABLE IF EXISTS `hotel_user`;
CREATE TABLE `hotel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_pwd` varchar(255) DEFAULT NULL,
  `user_level` int(11) DEFAULT NULL COMMENT '1是普通住户， 2是管理员 ， 3是老板',
  `user_phone` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_sex` int(11) DEFAULT NULL COMMENT '1是男，2是女',
  `is_vip` int(11) DEFAULT NULL COMMENT '1是会员，2不是会员',
  `vip_level` int(11) DEFAULT NULL COMMENT '会员等级  1是黄金  2是白金 3是黑金',
  `vip_points` int(255) DEFAULT NULL COMMENT '会员积分',
  `is_del` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel_user
-- ----------------------------
INSERT INTO `hotel_user` VALUES ('2', '李鸿飞', '202cb962ac59075b964b07152d234b70', '3', '15234724520', '15234724520@163.com', '1', '1', '1', '1', '1', '1', null);
INSERT INTO `hotel_user` VALUES ('3', 'aa', '202cb962ac59075b964b07152d234b70', '3', '123', '123', '1', '1', '1', '1', '1', '2', null);
INSERT INTO `hotel_user` VALUES ('4', 'bb', '202cb962ac59075b964b07152d234b70', '2', '123', '12', '123', '13', '1', '123', '1', '1', null);
INSERT INTO `hotel_user` VALUES ('5', 'cc', '202cb962ac59075b964b07152d234b70', '1', '13111111111', '123456@qq.com', '1', null, null, null, '1', null, null);
