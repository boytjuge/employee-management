/*
 Navicat Premium Data Transfer

 Source Server         : ระบบจัดการการพนักงาน
 Source Server Type    : MySQL
 Source Server Version : 100408
 Source Host           : localhost:3306
 Source Schema         : self_employee

 Target Server Type    : MySQL
 Target Server Version : 100408
 File Encoding         : 65001

 Date: 16/05/2020 15:06:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id ตารางพนักงาน',
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `emp_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `Idcard` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salary` float(7, 2) NULL DEFAULT NULL,
  `title_id` int(11) NULL DEFAULT NULL,
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES (1, 'สมชาย', 'รักอ่าน', '1001', '1234567890123', 18000.00, 1, '1');
INSERT INTO `employees` VALUES (2, 'สมร', 'จิตดี', '2001', '3215647892583', 15000.00, 3, '1');
INSERT INTO `employees` VALUES (3, 'แดง', 'เขียนงาม', '1002', '3658755525797', 21000.00, 1, '1');
INSERT INTO `employees` VALUES (4, 'วิจิตร', 'เซียนไพ่', '2002', '6325484444445', 17000.00, 1, '1');

-- ----------------------------
-- Table structure for pos_link_emps
-- ----------------------------
DROP TABLE IF EXISTS `pos_link_emps`;
CREATE TABLE `pos_link_emps`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `positions_id` int(11) NULL DEFAULT NULL,
  `emps_id` int(11) NULL DEFAULT NULL,
  `sites_id` int(11) NULL DEFAULT NULL,
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pos_link_emps
-- ----------------------------
INSERT INTO `pos_link_emps` VALUES (1, 5, 1, 1, '1');
INSERT INTO `pos_link_emps` VALUES (2, 6, 2, 2, '1');
INSERT INTO `pos_link_emps` VALUES (3, 2, 3, 1, '1');
INSERT INTO `pos_link_emps` VALUES (4, 3, 4, 2, '1');

-- ----------------------------
-- Table structure for positions
-- ----------------------------
DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id ตำแหน่งพนักงาน ',
  `position_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ชื่อตำแหน่งงาน',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'สถานะ ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of positions
-- ----------------------------
INSERT INTO `positions` VALUES (1, 'ผู้จัดการ', '1');
INSERT INTO `positions` VALUES (2, 'รองผู้จัดการ', '1');
INSERT INTO `positions` VALUES (3, 'พนักงานแคชเชียร์', '1');
INSERT INTO `positions` VALUES (4, 'HR', '1');
INSERT INTO `positions` VALUES (5, 'เจ้าหน้าที่ไอที', '1');
INSERT INTO `positions` VALUES (6, 'แม่บ้าน', '1');
INSERT INTO `positions` VALUES (7, 'พนักงานบัญชี', '1');

-- ----------------------------
-- Table structure for site_link_position
-- ----------------------------
DROP TABLE IF EXISTS `site_link_position`;
CREATE TABLE `site_link_position`  (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `sites_id` int(11) NULL DEFAULT NULL,
  `posisitons_id` int(11) NULL DEFAULT NULL,
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of site_link_position
-- ----------------------------
INSERT INTO `site_link_position` VALUES (1, 1, 1, '1');
INSERT INTO `site_link_position` VALUES (2, 1, 2, '1');
INSERT INTO `site_link_position` VALUES (3, 1, 3, '1');
INSERT INTO `site_link_position` VALUES (4, 1, 4, '1');
INSERT INTO `site_link_position` VALUES (5, 1, 5, '1');
INSERT INTO `site_link_position` VALUES (6, 1, 6, '1');
INSERT INTO `site_link_position` VALUES (7, 1, 7, '1');
INSERT INTO `site_link_position` VALUES (8, 2, 2, '1');
INSERT INTO `site_link_position` VALUES (9, 2, 3, '1');
INSERT INTO `site_link_position` VALUES (10, 2, 5, '1');
INSERT INTO `site_link_position` VALUES (11, 2, 6, '1');

-- ----------------------------
-- Table structure for sites
-- ----------------------------
DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ไอดีสาขา',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ชื่อสาขา',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'รายละเอียดสาขา',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1 = active , 0 = inactive',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sites
-- ----------------------------
INSERT INTO `sites` VALUES (1, 'ขอนแก่น', 'สาขา วัดอดุลย์ราม', '1');
INSERT INTO `sites` VALUES (2, 'ชัยภูมิ', 'สาขา จัตุรัส ', '1');
INSERT INTO `sites` VALUES (3, 'กรุงเทพมหานคร', 'สาขา รามคำแหง', '1');

-- ----------------------------
-- Table structure for titles
-- ----------------------------
DROP TABLE IF EXISTS `titles`;
CREATE TABLE `titles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of titles
-- ----------------------------
INSERT INTO `titles` VALUES (1, 'นาย', '1');
INSERT INTO `titles` VALUES (2, 'นาง', '1');
INSERT INTO `titles` VALUES (3, 'นางสาว', '1');
INSERT INTO `titles` VALUES (4, 'อาจารย์', '1');

SET FOREIGN_KEY_CHECKS = 1;
