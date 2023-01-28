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

 Date: 28/01/2023 09:35:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for media_role
-- ----------------------------
DROP TABLE IF EXISTS `media_role`;
CREATE TABLE `media_role`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_auth` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限编码',
  `display` bigint NOT NULL COMMENT '显示顺序',
  `status` bigint NOT NULL COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media_role
-- ----------------------------
INSERT INTO `media_role` VALUES (1, 'admin', 'role:admin', 1, 0, '管理员', 'admin', '2023-01-28 09:09:34', 'admin', '2023-01-28 09:09:34');
INSERT INTO `media_role` VALUES (2, '医生', 'role:doctor', 2, 0, '普通角色', 'admin', '2023-01-28 09:11:03', 'admin', '2023-01-28 09:11:03');
INSERT INTO `media_role` VALUES (3, '护士', 'role:hs', 3, 0, '普通角色', 'admin', '2023-01-27 17:27:02', 'admin', '2023-01-27 17:27:02');
INSERT INTO `media_role` VALUES (4, '挂号员', 'role:ghy', 6, 0, '普通角色', 'admin', '2023-01-27 17:34:15', 'admin', '2023-01-27 17:34:15');
INSERT INTO `media_role` VALUES (5, '收费员', 'role:hs', 4, 0, '普通角色', 'admin', '2023-01-27 17:36:01', 'admin', '2023-01-27 17:36:01');
INSERT INTO `media_role` VALUES (6, '发药员', 'role:hs', 8, 0, '普通角色', 'admin', '2023-01-27 17:36:01', 'admin', '2023-01-27 17:36:01');
INSERT INTO `media_role` VALUES (7, '财务', 'role:hs', 5, 0, '普通角色', 'admin', '2023-01-27 17:36:01', 'admin', '2023-01-27 17:36:01');
INSERT INTO `media_role` VALUES (8, '其他人员', 'role:hs', 7, 0, '普通角色', 'admin', '2023-01-27 17:36:01', 'admin', '2023-01-27 17:36:01');

SET FOREIGN_KEY_CHECKS = 1;
