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

 Date: 29/01/2023 10:42:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for media_role
-- ----------------------------
DROP TABLE IF EXISTS `media_role`;
CREATE TABLE `media_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_auth` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限编码',
  `role_sort` bigint NULL DEFAULT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否禁用 （0正常 2删除）',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media_role
-- ----------------------------
INSERT INTO `media_role` VALUES (1, 'admin', 'role:admin', 1, '0', '0', '管理员', 'admin', '2023-01-27 22:07:25', 'admin', '2023-01-27 22:07:25');
INSERT INTO `media_role` VALUES (2, '医生', 'role:doctor', 2, '0', '0', '普通角色', 'admin', '2023-01-27 22:07:25', 'admin', '2023-01-27 22:07:25');
INSERT INTO `media_role` VALUES (3, '护士', 'role:hs', 3, '0', '0', '普通角色', 'admin', '2023-01-27 22:07:25', 'admin', '2023-01-27 22:07:25');
INSERT INTO `media_role` VALUES (4, '挂号员', 'role:ghy', 6, '0', '0', '普通角色', 'admin', '2023-01-27 22:07:25', 'admin', '2023-01-27 22:07:25');
INSERT INTO `media_role` VALUES (5, '收费员', 'role:sfy', 4, '0', '0', '普通角色', 'admin', '2023-01-27 22:07:25', 'admin', '2023-01-27 22:07:25');
INSERT INTO `media_role` VALUES (6, '发药员', 'role:fyy', 8, '0', '0', '普通角色', 'admin', '2023-01-27 22:07:25', 'admin', '2023-01-27 22:07:25');
INSERT INTO `media_role` VALUES (7, '财务', 'role:cw', 5, '0', '0', '普通角色', 'admin', '2023-01-27 22:07:25', 'admin', '2023-01-27 22:07:25');
INSERT INTO `media_role` VALUES (8, '其他人员', 'role:other', 7, '0', '0', '普通角色', 'admin', '2023-01-27 22:07:25', 'admin', '2023-01-27 22:07:25');
INSERT INTO `media_role` VALUES (9, '测试药师', 'role:cshs', 9, '0', '0', '普通角色', 'admin', '2023-01-28 17:20:36', NULL, NULL);
INSERT INTO `media_role` VALUES (10, '主管医师', 'role:zgys', 5, '0', '0', '管理员', 'admin', '2023-01-28 17:22:08', NULL, NULL);
INSERT INTO `media_role` VALUES (11, '主管医师', 'role:zgys', 11, '0', '0', '管理员', 'admin', '2023-01-28 17:24:50', NULL, NULL);
INSERT INTO `media_role` VALUES (12, '主管医师', 'role:zgys', 13, '0', '0', '管理员', 'admin', '2023-01-28 17:24:50', 'admin', '2023-01-28 17:36:41');
INSERT INTO `media_role` VALUES (13, '主管医师', 'role:zgys', 12, '0', '0', '管理员', 'admin', '2023-01-28 17:33:30', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
