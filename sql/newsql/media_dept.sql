/*
 Navicat Premium Data Transfer

 Source Server         : guoLinuxDB
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : 192.168.233.3:3306
 Source Schema         : media

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 29/01/2023 10:42:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for media_dept
-- ----------------------------
DROP TABLE IF EXISTS `media_dept`;
CREATE TABLE `media_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '科室ID',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科室名称',
  `dept_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科室编码',
  `dept_num` bigint NULL DEFAULT 0 COMMENT '当前挂号量',
  `dept_leader` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '负责人',
  `dept_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态(0正常 1停用)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `dept_sort` int NULL DEFAULT NULL COMMENT '排序码',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '科室表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media_dept
-- ----------------------------
INSERT INTO `media_dept` VALUES (1, '内科', 'HIS-NK', 1, '陈大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-10 00:52:56', '', 3);
INSERT INTO `media_dept` VALUES (2, '外科', 'HIS-WK', 1, '陈大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 1);
INSERT INTO `media_dept` VALUES (3, '骨科', 'HIS-GK', 1, '陈大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 5);
INSERT INTO `media_dept` VALUES (4, '儿科', 'HIS-EK', 1, '陈大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 2);
INSERT INTO `media_dept` VALUES (5, '妇科', 'HIS-FK', 1, '陈大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 4);
INSERT INTO `media_dept` VALUES (6, '泌尿外科', 'HIS-NK', 1, '陈大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 7);
INSERT INTO `media_dept` VALUES (7, '心内科', 'HIS-XK', 1, '陈大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 6);
INSERT INTO `media_dept` VALUES (8, '血液科', 'HIS-XYK', 1, '陈大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 10);
INSERT INTO `media_dept` VALUES (9, '放射科', 'HIS-FSK', 1, '陈大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 12);
INSERT INTO `media_dept` VALUES (10, '化验科', 'HIS-HSK', 1, '陈大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 11);
INSERT INTO `media_dept` VALUES (11, '精神内科', 'HIS-SJNK', 1, '陈大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-09 23:54:41', '', 9);
INSERT INTO `media_dept` VALUES (12, '神经外科', 'HIS-SJWK', 1, '郭大夫', '13842987453', '0', 'admin', '2023-01-09 23:54:23', '', NULL, NULL, 8);
INSERT INTO `media_dept` VALUES (13, '耳鼻喉科', 'HIS-EBH', 0, '郭大夫', '15898456247', '0', 'admin', '2023-01-10 19:14:59', '', '2023-01-04 01:05:47', NULL, 14);

SET FOREIGN_KEY_CHECKS = 1;
