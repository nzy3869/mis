/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : mis

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-06-03 11:42:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_s_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_s_resource`;
CREATE TABLE `t_s_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reid` varchar(45) NOT NULL COMMENT '资源名',
  `rename` varchar(45) NOT NULL COMMENT '资源中文名',
  `type` varchar(1) DEFAULT NULL COMMENT '类型',
  `enabled` varchar(1) DEFAULT NULL COMMENT '启用状态',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `pid` int(45) DEFAULT NULL COMMENT '父资源id',
  `revalue` varchar(45) DEFAULT NULL COMMENT '资源值',
  `leaf` varchar(1) DEFAULT NULL COMMENT '是否叶子节点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_resource
-- ----------------------------

-- ----------------------------
-- Table structure for t_s_role
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role`;
CREATE TABLE `t_s_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roid` varchar(45) NOT NULL COMMENT '角色英文名',
  `roname` varchar(45) NOT NULL COMMENT '角色中文名',
  `enabled` varchar(1) DEFAULT NULL COMMENT '启用状态',
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_s_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role_resource`;
CREATE TABLE `t_s_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for t_s_user
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user`;
CREATE TABLE `t_s_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL COMMENT '用户名',
  `uname` varchar(45) NOT NULL COMMENT '中文名',
  `sex` varchar(1) DEFAULT NULL COMMENT '性别',
  `tel` varchar(45) DEFAULT NULL COMMENT '电话',
  `enabled` varchar(1) DEFAULT 'Y' COMMENT '启用状态',
  `password` varchar(45) NOT NULL COMMENT '密码',
  `create_date` varchar(45) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_user
-- ----------------------------
INSERT INTO `t_s_user` VALUES ('2', 'nzy', '牛志远', null, null, 'Y', '123', null, null);
INSERT INTO `t_s_user` VALUES ('3', 'nzy1', '牛志远1', null, null, 'Y', '1233', null, null);
INSERT INTO `t_s_user` VALUES ('7', 'abc', '测试', '1', '13323233232', 'Y', '123', null, null);
INSERT INTO `t_s_user` VALUES ('10', '1234', 'retret', '1', '6436', 'Y', '123', null, null);
INSERT INTO `t_s_user` VALUES ('11', 'test1', '测试账号1', '0', '17857024940', null, '123', null, null);

-- ----------------------------
-- Table structure for t_s_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user_role`;
CREATE TABLE `t_s_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(18) DEFAULT NULL,
  `sex` char(2) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('6', 'admin', '男', '22');
INSERT INTO `tb_user` VALUES ('7', 'admin1', '男', '22');
INSERT INTO `tb_user` VALUES ('8', 'admin2', '男', '22');
