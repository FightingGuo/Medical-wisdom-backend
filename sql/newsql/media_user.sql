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

 Date: 29/01/2023 10:41:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for media_user
-- ----------------------------
DROP TABLE IF EXISTS `media_user`;
CREATE TABLE `media_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码[登录身份]',
  `grade` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '级别',
  `background` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教育背景',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户性别（0男 1女 2未知）',
  `age` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `scheduling` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否排班(0是 1否)',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(0正常 1停用)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media_user
-- ----------------------------
INSERT INTO `media_user` VALUES (1, '超级管理员', 1, '123456', '19805978220', '医师', '本科', '0', '0', '21', '1', '0', 'admin', '2023-01-10 16:49:38', 'admin', '2023-01-10 16:49:38', '');
INSERT INTO `media_user` VALUES (2, '扁鹊', 2, '123456', '13852469874', '主任医师', '博士', '0', '1', '23', '0', '0', 'admin', '2023-01-10 16:49:38', 'admin', '2023-01-10 16:49:38', '');
INSERT INTO `media_user` VALUES (3, '李时珍', 7, '123456', '13454658798', '副主任医师', '本科', '0', '0', '22', '0', '0', 'admin', '2023-01-10 16:49:38', 'admin', '2023-01-10 16:49:38', '');
INSERT INTO `media_user` VALUES (4, '测试a', 10, '123456', '19745645652', '医师', '本科', '0', '1', '30', '0', '0', 'admin', '2023-01-10 16:49:38', 'admin', '2023-01-10 16:49:38', '');
INSERT INTO `media_user` VALUES (5, '测试b', 12, '123456', '18056458978', '副主任医师', '硕士', '0', '0', '31', '0', '0', 'admin', '2023-01-10 16:49:38', 'admin', '2023-01-10 16:49:38', '');
INSERT INTO `media_user` VALUES (6, '测试d', 8, '123456', '18345647898', '副主任医师', '本科', '0', '1', '25', '0', '0', 'admin', '2023-01-10 16:49:38', 'admin', '2023-01-10 16:49:38', '');
INSERT INTO `media_user` VALUES (7, '测试e', 11, '123456', '17855565687', '医师', '高中', '0', '0', '26', '0', '0', 'admin', '2023-01-10 16:49:38', 'admin', '2023-01-10 16:49:38', '');
INSERT INTO `media_user` VALUES (8, '测试f', 3, '123456', '18534521567', '主任医师', '本科', '0', '1', '29', '0', '0', 'admin', '2023-01-10 16:49:38', 'admin', '2023-01-10 16:49:38', '');
INSERT INTO `media_user` VALUES (9, '测试g', 9, '123456', '18465789821', '主任医师', '本科', '0', '0', '35', '0', '0', 'admin', '2023-01-10 16:49:38', 'admin', '2023-01-10 16:49:38', '');
INSERT INTO `media_user` VALUES (10, '测试h', 5, '123456', '16845678987', '医师', '博士', '0', '1', '40', '0', '0', 'admin', '2023-01-10 16:49:38', 'admin', '2023-01-10 16:49:38', '');
INSERT INTO `media_user` VALUES (11, '测试i', 13, '123123', '16987821356', '医师', '本科', '0', '0', '33', '0', '0', 'admin', '2023-01-10 16:49:38', 'admin', '2023-01-10 16:49:38', '');
INSERT INTO `media_user` VALUES (12, '测试j', 4, '123456', '15345698781', '主任医师', '硕士', '0', '1', '32', '0', '0', 'admin', '2023-01-10 16:49:38', 'admin', '2023-01-10 16:49:38', '');
INSERT INTO `media_user` VALUES (13, '测试k', 6, '123456', '16654879823', '副主任医师', '本科', '0', '0', '40', '0', '0', 'admin', '2023-01-10 16:49:38', 'admin', '2023-01-16 16:47:05', '');
INSERT INTO `media_user` VALUES (14, '测试lll', 4, '123456', '19854622441', '副主任医师', '本科', '0', '1', '25', '0', '0', 'admin', '2023-01-16 00:52:39', '', NULL, NULL);
INSERT INTO `media_user` VALUES (15, 'sdqweq', 2, '123456', '15487962554', '主任医师', '博士', '0', '0', '14', '0', '0', 'admin', '2023-01-16 00:56:05', '', NULL, NULL);
INSERT INTO `media_user` VALUES (16, '测试删除', 6, '1234567', '16545687892', '主任医师', '本科', '0', '0', '23', '0', '0', 'admin', '2023-01-16 01:05:42', '', '2023-01-16 01:33:08', NULL);
INSERT INTO `media_user` VALUES (17, '测试kk', 3, '1234567', '17898542246', '医师', '硕士', '0', '0', '21', '0', '0', 'admin', '2023-01-16 16:48:03', '', '2023-01-17 02:18:44', NULL);
INSERT INTO `media_user` VALUES (18, '测试oo', 2, '123456', '18754628445', '主任医师', '本科', '0', '0', '24', '0', '0', 'admin', '2023-01-28 01:34:41', '', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
