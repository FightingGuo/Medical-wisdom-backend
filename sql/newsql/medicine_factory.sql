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

 Date: 31/01/2023 08:35:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for medicine_factory
-- ----------------------------
DROP TABLE IF EXISTS `medicine_factory`;
CREATE TABLE `medicine_factory`  (
  `factory_id` bigint NOT NULL COMMENT '厂家ID',
  `factory_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂家名称',
  `factory_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂家编码',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `telephoneNum` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂家电话',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂家地址',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`factory_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medicine_factory
-- ----------------------------
INSERT INTO `medicine_factory` VALUES (1, '云南白药集团股份有限公司', '000538', '雷XX', '0597-24136512', 'ynby', '0', '0', '云南省昆明市呈贡区云南白药街3686号\n', 'admin', '2023-01-30 08:59:19', 'admin', '2023-01-30 09:38:03');
INSERT INTO `medicine_factory` VALUES (2, '上海医药集团有限公司', '1812538', '陈XX', '0597-65412478', 'shyy', '0', '0', '上海市太仓路200号上海医药大厦', 'admin', '2023-01-30 09:00:30', 'admin', '2023-01-30 09:38:03');
INSERT INTO `medicine_factory` VALUES (3, '中国医药集团总公司', '1238571', '郭XX', '0871-84126543', 'zgyy', '0', '0', '北京市海淀区知春路20号', 'admin', '2023-01-30 09:01:32', 'admin', '2023-01-30 09:38:03');
INSERT INTO `medicine_factory` VALUES (4, '广州医药集团有限公司', '1031377', '李XX', '0415-63541235', 'gzyy', '0', '0', '广州市荔湾区沙面北街45号', 'admin', '2023-01-30 09:02:24', 'admin', '2023-01-30 09:38:03');
INSERT INTO `medicine_factory` VALUES (5, '哈药集团有限公司', '7278456', '赵XX', '0364-45621364', 'hyjt', '0', '0', '哈尔滨市利民开发区利民西四大街68号', 'admin', '2023-01-30 09:03:27', 'admin', '2023-01-30 09:38:03');
INSERT INTO `medicine_factory` VALUES (6, '华北制药集团有限责任公司', '700814', '孙XX', '0478-65471236', 'hbzy', '0', '0', '河北省石家庄市和平东路388号', 'admin', '2023-01-30 09:04:28', 'admin', '2023-01-30 09:38:03');
INSERT INTO `medicine_factory` VALUES (7, '西南医药集团有限公司', '54123644', '许XX', '0178-86457821', 'xnyy', '0', '0', '成都市武侯区武兴路38号', 'admin', '2023-01-30 09:06:00', 'admin', '2023-01-30 09:38:03');
INSERT INTO `medicine_factory` VALUES (8, '北京同仁堂集团有限责任公司', '5697874', '林XX', '0543-78789954', 'bjtyt', '0', '0', '北京市东城区东兴隆街52号', 'admin', '2023-01-30 09:37:22', 'admin', '2023-01-30 09:37:51');
INSERT INTO `medicine_factory` VALUES (9, '湖南九芝堂股份有限公司 ', '85236', '吴XX', '0984-48446549', 'jzt', '0', '0', '长沙市高新区桐梓坡西路339号', 'admin', '2023-01-30 09:08:33', 'admin', '2023-01-30 09:38:03');

SET FOREIGN_KEY_CHECKS = 1;
