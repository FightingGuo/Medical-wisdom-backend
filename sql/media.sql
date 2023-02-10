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

 Date: 10/02/2023 15:56:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint NOT NULL,
  `sched_time` bigint NOT NULL,
  `priority` int NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000185731D5F9878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000185731D5F9878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000185731D5F9878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint NOT NULL,
  `checkin_interval` bigint NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', '郭昊晨1675932777573', 1675933561239, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint NOT NULL,
  `repeat_interval` bigint NOT NULL,
  `times_triggered` bigint NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int NULL DEFAULT NULL,
  `int_prop_2` int NULL DEFAULT NULL,
  `long_prop_1` bigint NULL DEFAULT NULL,
  `long_prop_2` bigint NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint NULL DEFAULT NULL,
  `prev_fire_time` bigint NULL DEFAULT NULL,
  `priority` int NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint NOT NULL,
  `end_time` bigint NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1675932780000, -1, 5, 'PAUSED', 'CRON', 1675932777000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1675932780000, -1, 5, 'PAUSED', 'CRON', 1675932777000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1675932780000, -1, 5, 'PAUSED', 'CRON', 1675932777000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '科室表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media_dept
-- ----------------------------
INSERT INTO `media_dept` VALUES (1, '内科', 'HIS-NK', 1, '陈大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-10 00:52:56', '', 3);
INSERT INTO `media_dept` VALUES (2, '外科', 'HIS-WK', 1, '李大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 1);
INSERT INTO `media_dept` VALUES (3, '骨科', 'HIS-GK', 1, '林大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 5);
INSERT INTO `media_dept` VALUES (4, '儿科', 'HIS-EK', 1, '吴大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 2);
INSERT INTO `media_dept` VALUES (5, '妇科', 'HIS-FK', 1, '赵大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 4);
INSERT INTO `media_dept` VALUES (6, '泌尿外科', 'HIS-NK', 1, '钱大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 7);
INSERT INTO `media_dept` VALUES (7, '心内科', 'HIS-XK', 1, '孙大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 6);
INSERT INTO `media_dept` VALUES (8, '血液科', 'HIS-XYK', 1, '雷大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 10);
INSERT INTO `media_dept` VALUES (9, '放射科', 'HIS-FSK', 1, '卢大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 12);
INSERT INTO `media_dept` VALUES (10, '化验科', 'HIS-HSK', 1, '余大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-04 01:05:47', '', 11);
INSERT INTO `media_dept` VALUES (11, '精神内科', 'HIS-SJNK', 1, '佘大夫', '18612345678', '0', 'admin', '2023-01-04 01:05:47', 'admin', '2023-01-09 23:54:41', '', 9);
INSERT INTO `media_dept` VALUES (12, '神经外科', 'HIS-SJWK', 1, '严大夫', '13842987453', '0', 'admin', '2023-01-09 23:54:23', 'admin', '2023-02-03 16:56:50', NULL, 8);
INSERT INTO `media_dept` VALUES (13, '耳鼻喉科', 'HIS-EBH', 0, '郭大夫', '15898456247', '0', 'admin', '2023-01-10 19:14:59', 'admin', '2023-01-04 01:05:47', NULL, 14);

-- ----------------------------
-- Table structure for media_notice
-- ----------------------------
DROP TABLE IF EXISTS `media_notice`;
CREATE TABLE `media_notice`  (
  `notice_id` bigint NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告类型',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标致（0存在 2删除）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0 正常 1停用）',
  `notice_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公告内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media_notice
-- ----------------------------
INSERT INTO `media_notice` VALUES (1, '关于2023年度卫生管理专业资格考试的通知', '2', '0', '0', '<p>各部门、各科室：</p><p><br></p><p>转安徽省卫健委通知，2023年度卫生管理专业资格考试报名已经开始，现将有关有关事项通知如下：</p><p><br></p><p>一、报名人员应取得医学门类专业或医学院校相关专业学历，并满足《人力资源社会保障部 国家卫生健康委 国家中医药局关于深化卫生专业技术人员职称制度改革的指导意见》（人社部发〔2021〕51号）、《人力资源社会保障部办公厅关于进一步做好职称评审工作的通知》（人社厅发〔2022〕60号）、《关于印发〈安徽省卫生系列卫生管理专业职称评审标准条件（试行）〉的通知》（皖卫人秘〔2022〕128号）中规定的报考条件。报名参加2023年度的考试人员，其取得学历和从事本专业工作年限计算均截止到2022年12月31日。</p>', '2023-01-29 10:19:16', 'admin', '2023-01-29 01:35:42', 'admin');
INSERT INTO `media_notice` VALUES (2, '关于做好2023年上半年学位论文答辩工作的通知', '1', '0', '0', '各学科学位点：\r\n\r\n2023年上半年申请学位论文答辩工作已经开始,根据校研究生学院通知文件精神，现将2023年上半年学位论文答辩工作的通知如下：\r\n\r\n一、学位论文质量监控工作（工作程序第一步）\r\n\r\n1.2023年上半年所有统招硕、博士研究生须在2023年2月10日（周五）前将学位论文电子版（要求为doc格式，符合学校学位论文撰写要求规定，以“作者姓名-学号-论文题目”方式命名）和复制比检测汇总表（附件1：纸质版、电子版）以学科为单位交医院研工部，电子版发至邮箱：ayfypyb3665@163.com。', '2023-01-29 10:23:06', 'admin', NULL, NULL);
INSERT INTO `media_notice` VALUES (3, '关于开展2023年度卫生专业技术中、初级资格考试工作的通知', '2', '0', '0', '各科室：\r\n\r\n根据安徽省卫健委通知要求，现将2023年度全国卫生专业技术资格中、初级资格考试工作有关事项通知如下：\r\n\r\n一、报名条件\r\n\r\n1.报名人员应符合《人力资源社会保障部 国家卫生健康委 国家中医药局关于深化卫生专业技术人员职称制度改革的指导意见》（人社部发〔2021〕51号）、《安徽省人民政府办公厅关于印发安徽省加快医学教育创新发展实施方案的通知》（皖政办〔2020〕23号）中规定的报名条件。', '2023-01-29 10:23:45', 'admin', NULL, NULL);
INSERT INTO `media_notice` VALUES (5, '2022年福建省立医院专项招聘紧缺急需人才方案', '1', '0', '0', '<p>	<span style=\"color: rgb(64, 64, 64);\">福建省立医院是福建省卫健委直属单位、非营利性三级甲等综合医院，创建于1937年，是全省临床诊疗、医学教育、医学研究和预防保健中心。医院编制床位2500张，在职员工3700多名，其中卫生专业技术人员3200多名，拥有享受国务院政府特殊津贴专家、国家卫生计生突出贡献中青年专家、美国护理科学院院士、国家百千万人才工程人选等一大批知名专家。医院拥有6个国家级临床重点专科建设项目，10个省级临床重点专科建设项目，9个国家级基地（中心），15个省级质控中心；拥有福建省心血管病、急诊医学、老年病、胃肠病及核医学科等5个省级研究所，急诊医学、老年医学、重症医学等3个临床医学中心，心血管病等4个省级重点实验室。医院具有从本科、硕士、博士、博士后到毕业后继续教育的完整教学体系，其中博士后工作站1个，博士培养点21个，硕士培养点35个，国家级住培基地、专培基地27个。因工作需要，拟向社会公开招聘紧缺急需人才8名（编内），具体方案如下：</span></p>', '2023-01-29 01:31:25', 'admin', NULL, NULL);

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
INSERT INTO `media_role` VALUES (2, '医生', 'role:doctor', 2, '0', '0', '普通角色', 'admin', '2023-01-27 22:07:25', 'admin', '2023-01-29 23:15:11');
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

-- ----------------------------
-- Table structure for media_scheduling
-- ----------------------------
DROP TABLE IF EXISTS `media_scheduling`;
CREATE TABLE `media_scheduling`  (
  `scheduling_id` bigint NOT NULL,
  `user_id` bigint NULL DEFAULT NULL COMMENT '医生id',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '科室id',
  `scheduling_day` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排班时间（1周一 2周二 3周三 4周四 5周五 6周六  7周日）',
  `subsection_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分段类型(1上午 2下午 3晚上)',
  `scheduling_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排班类型（1门诊 2急诊）',
  `create_time` datetime NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`scheduling_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media_scheduling
-- ----------------------------
INSERT INTO `media_scheduling` VALUES (1, 3, 2, '2', '1', '1', '2023-02-07 09:19:50', 'admin', NULL, NULL);

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
INSERT INTO `media_user` VALUES (2, '扁鹊', 2, '123456', '13852469874', '主任医师', '博士', '0', '1', '23', '0', '1', 'admin', '2023-01-10 16:49:38', 'admin', '2023-01-10 16:49:38', '');
INSERT INTO `media_user` VALUES (3, '李时珍', 7, '1234561', '13454658798', '副主任医师', '本科', '0', '0', '22', '0', '0', 'admin', '2023-01-10 16:49:38', 'admin', '2023-01-29 18:00:01', '');
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
INSERT INTO `media_user` VALUES (19, '测试ll', 7, 'abc123', '19845216423', '主任医师', '本科', '0', '0', '26', '0', '0', 'admin', '2023-01-30 18:56:56', '', NULL, NULL);

-- ----------------------------
-- Table structure for medicine_factory
-- ----------------------------
DROP TABLE IF EXISTS `medicine_factory`;
CREATE TABLE `medicine_factory`  (
  `factory_id` bigint NOT NULL COMMENT '厂家ID',
  `factory_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂家名称',
  `factory_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂家编码',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `telephone_num` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂家电话',
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

-- ----------------------------
-- Table structure for medicine_info
-- ----------------------------
DROP TABLE IF EXISTS `medicine_info`;
CREATE TABLE `medicine_info`  (
  `medicine_id` bigint NOT NULL AUTO_INCREMENT COMMENT '药品ID',
  `medicine_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `medicine_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品编码',
  `factory_id` bigint NOT NULL COMMENT '生产厂家ID',
  `medicine_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品类型',
  `prescription_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处方类型',
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `medicine_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '药品价格',
  `stock` bigint NULL DEFAULT NULL COMMENT '商品库存',
  `warn_value` bigint NULL DEFAULT NULL COMMENT '预警值',
  `convert_quantity` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '换算量',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`medicine_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medicine_info
-- ----------------------------
INSERT INTO `medicine_info` VALUES (1, '土茯苓', 'tfl4521', 5, '中草药', '中药处方', 'g', 3.14, 11511, 1000, '1', '0', '0', 'admin', '2023-01-31 09:11:47', NULL, NULL);
INSERT INTO `medicine_info` VALUES (2, '阿莫西林', 'amxl4571', 3, '西药', '西药处方', 'g', 6.66, 10000, 2000, '2', '0', '0', 'admin', '2023-01-31 09:13:00', NULL, NULL);
INSERT INTO `medicine_info` VALUES (3, '奥美拉唑肠', 'amlx4569', 1, '西药', '西药处方', 'g', 5.12, 16000, 1000, '1', '0', '0', 'admin', '2023-01-31 09:13:54', NULL, NULL);
INSERT INTO `medicine_info` VALUES (4, '龙胆草', 'ldc4579', 6, '中草药', '中药处方', 'g', 2.14, 20000, 5000, '1', '0', '0', 'admin', '2023-01-31 09:14:55', NULL, NULL);
INSERT INTO `medicine_info` VALUES (5, '生地黄', 'sdh4523', 2, '中草药', '中药处方', 'g', 4.11, 7000, 1000, '2', '0', '0', 'admin', '2023-01-31 09:15:58', NULL, '2023-02-09 00:30:16');
INSERT INTO `medicine_info` VALUES (6, '赤芍', 'cs4577', 4, '中草药', '中药处方', 'g', 6.14, 7000, 1500, '1', '0', '0', 'admin', '2023-01-31 09:16:44', NULL, NULL);
INSERT INTO `medicine_info` VALUES (7, '银柴胡', 'ych4536', 9, '中草药', '中药处方', 'g', 2.65, 8000, 2000, '1', '0', '0', 'admin', '2023-01-31 09:17:52', NULL, NULL);
INSERT INTO `medicine_info` VALUES (8, '复方氨酚烷氨', 'afyq4566', 1, '西药', '西药处方', 'g', 10.00, 6000, 1000, '1', '0', '0', 'admin', '2023-01-31 09:19:21', NULL, NULL);
INSERT INTO `medicine_info` VALUES (9, '氯雷他定', 'lltd4527', 7, '西药', '西药处方', 'g', 8.88, 25000, 5000, '2', '0', '0', 'admin', '2023-01-31 09:20:10', NULL, NULL);
INSERT INTO `medicine_info` VALUES (10, '蒙脱石散', 'mtss4598', 8, '西药', '西药处方', 'g', 6.45, 10000, 5000, '1', '0', '0', 'admin', '2023-01-31 09:20:56', NULL, NULL);
INSERT INTO `medicine_info` VALUES (11, '洛美沙星', 'lmsx4561', 2, '西药', '西药处方', 'g', 9.54, 9000, 2000, '1', '0', '0', 'admin', '2023-01-31 09:21:44', NULL, NULL);
INSERT INTO `medicine_info` VALUES (12, '番泻叶', 'fxy4564', 4, '中草药', '中药处方', 'g', 5.14, 22000, 1000, '1', '0', '0', 'admin', '2023-01-31 09:23:02', NULL, NULL);
INSERT INTO `medicine_info` VALUES (13, '头孢克洛', 'tbkl4525', 3, '西药', '西药处方', 'g', 9.14, 10000, 4000, '1', '0', '0', 'admin', '2023-01-31 09:25:29', NULL, NULL);
INSERT INTO `medicine_info` VALUES (14, '左氧氟沙星', 'zfysx4581', 6, '西药', '西药处方', 'g', 8.41, 10000, 2000, '2', '0', '0', 'admin', '2023-01-31 09:26:17', NULL, NULL);
INSERT INTO `medicine_info` VALUES (15, '血余炭', 'xyt4583', 8, '中草药', '中药处方', 'g', 5.46, 18000, 2000, '1', '0', '0', 'admin', '2023-01-31 09:27:08', NULL, NULL);
INSERT INTO `medicine_info` VALUES (16, '三七', 'sq4593', 2, '中草药', '中药处方', 'g', 6.45, 8500, 1500, '2', '0', '0', 'admin', '2023-01-31 09:28:05', NULL, NULL);
INSERT INTO `medicine_info` VALUES (17, '生地黄', 'sdh4533', 7, '中草药', '中药处方', 'g', 9.45, 20000, 4500, '1', '0', '0', 'admin', '2023-01-31 09:29:07', 'admin', '2023-01-31 01:47:55');
INSERT INTO `medicine_info` VALUES (18, '头孢来星', 'tblx4578', 4, '西药', '西药处方', 'g', 6.66, 9500, 2500, '1', '0', '0', 'admin', '2023-01-31 00:58:27', NULL, NULL);
INSERT INTO `medicine_info` VALUES (19, '淡竹叶', 'dzy4531', 7, '中草药', '中药处方', 'g', 3.35, 9500, 2500, '2', '0', '0', 'admin', '2023-01-31 01:26:28', NULL, NULL);

-- ----------------------------
-- Table structure for medicine_purchase
-- ----------------------------
DROP TABLE IF EXISTS `medicine_purchase`;
CREATE TABLE `medicine_purchase`  (
  `pur_id` varchar(21) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单据ID',
  `supplier_id` bigint NULL DEFAULT NULL COMMENT '供应商ID',
  `medicine_id` bigint NULL DEFAULT NULL COMMENT '药品ID',
  `pur_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '采购状态； 1未提交 2待审核 3审核通过 4审核失败 5作废 6入库成功 ',
  `pur_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购者',
  `pur_time` datetime NULL DEFAULT NULL COMMENT '入库时间',
  `pur_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '采购单价',
  `pur_count` bigint NULL DEFAULT NULL COMMENT '采购数量',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pur_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medicine_purchase
-- ----------------------------
INSERT INTO `medicine_purchase` VALUES ('CG1236654987985463210', 5, 3, '3', 'admin', '2023-02-02 09:41:37', 1.50, 10000, '0', 'admin', '2023-02-02 09:41:42', NULL, NULL);
INSERT INTO `medicine_purchase` VALUES ('CG1271358119477379072', 2, 1, '3', 'admin', '2023-02-02 09:39:10', 1.31, 6511, '0', 'admin', '2023-02-02 09:39:18', NULL, NULL);
INSERT INTO `medicine_purchase` VALUES ('CG3541236645214523654', 3, 12, '2', 'admin', '2023-02-02 13:36:50', 2.33, 15000, '0', 'admin', '2023-02-02 13:36:56', NULL, NULL);
INSERT INTO `medicine_purchase` VALUES ('CG3652132214569874512', 1, 4, '1', 'admin', '2023-02-02 13:37:06', 1.36, 10000, '2', 'admin', '2023-02-02 13:37:19', NULL, NULL);
INSERT INTO `medicine_purchase` VALUES ('CG6542165489789546321', 4, 15, '2', 'admin', '2023-02-02 13:37:09', 2.20, 10000, '0', 'admin', '2023-02-02 13:37:21', NULL, NULL);
INSERT INTO `medicine_purchase` VALUES ('CG7022463395384020992', 6, 5, '2', 'admin', '2023-02-09 00:30:16', 3.13, 1000, '0', 'admin', '2023-02-09 00:30:16', NULL, NULL);

-- ----------------------------
-- Table structure for medicine_supplier
-- ----------------------------
DROP TABLE IF EXISTS `medicine_supplier`;
CREATE TABLE `medicine_supplier`  (
  `supplier_id` bigint NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `supplier_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `telephone_num` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机号',
  `bank_count` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medicine_supplier
-- ----------------------------
INSERT INTO `medicine_supplier` VALUES (1, '云南英广贺易有限公司\n', '陈XX', '15652345698', '6379865245129741669', '云南省昆明市官渡区六甲街道办事处海公馆花园', '0', '0', 'admin', '2023-02-01 09:01:18', NULL, NULL);
INSERT INTO `medicine_supplier` VALUES (2, '厦门贺竹贸易有限公司', '李XX', '19845126998', '6379428744532958364', '厦门市湖里区长乐路350号7036室之6', '0', '0', 'admin', '2023-02-01 09:04:55', NULL, NULL);
INSERT INTO `medicine_supplier` VALUES (3, '上海益贺贸易有限公司', '赵XX', '18423648745', '6379874167930954736', '上海市奉贤区望园南路2288弄1号412室', '0', '0', 'admin', '2023-02-01 09:04:58', NULL, NULL);
INSERT INTO `medicine_supplier` VALUES (4, '广州市贺易时贸易有限公司', '郭XX', '18054632879', '6379371486856759135', '广州市天河区华观路1963号1栋321-208房', '0', '0', 'admin', '2023-02-01 09:07:16', 'admin', '2023-02-02 00:35:43');
INSERT INTO `medicine_supplier` VALUES (5, '广州市森大贸易有限公司', '林XX', '15023659874', '6547214539874652451', ' 广州市天河区天河北路243号中信广场4606室', '0', '0', 'admin', '2023-01-31 19:06:43', 'admin', '2023-01-31 19:35:31');
INSERT INTO `medicine_supplier` VALUES (6, '长春高新创投集团', '陈XX', '19854632441', '8541123654789632147', '吉林省长春市同志街2400号火炬大厦5层', '0', '0', 'admin', '2023-02-08 23:10:09', NULL, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-01-02 23:33:03', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-01-02 23:33:03', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-01-02 23:33:03', '', NULL, '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-02 23:33:01', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-02 23:33:01', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-02 23:33:01', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-02 23:33:01', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-02 23:33:01', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-02 23:33:01', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-02 23:33:01', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-02 23:33:01', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-02 23:33:01', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-01-02 23:33:01', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 1, '未提交', '1', 'sys_purchase_status', NULL, NULL, 'Y', '0', 'admin', '2023-02-02 11:35:09', '', NULL, '未提交');
INSERT INTO `sys_dict_data` VALUES (30, 2, '待审核', '2', 'sys_purchase_status', NULL, NULL, 'N', '0', 'admin', '2023-02-02 11:35:52', '', NULL, '待审核');
INSERT INTO `sys_dict_data` VALUES (31, 3, '审核失败', '3', 'sys_purchase_status', NULL, NULL, 'N', '0', 'admin', '2023-02-02 11:36:24', '', NULL, '审核失败');
INSERT INTO `sys_dict_data` VALUES (32, 4, '审核成功', '4', 'sys_purchase_status', NULL, NULL, 'N', '0', 'admin', '2023-02-02 11:37:00', '', NULL, '审核成功');
INSERT INTO `sys_dict_data` VALUES (33, 5, '作废', '5', 'sys_purchase_status', NULL, NULL, 'N', '0', 'admin', '2023-02-02 11:37:39', '', NULL, '作废');
INSERT INTO `sys_dict_data` VALUES (34, 6, '入库成功', '6', 'sys_purchase_status', NULL, NULL, 'N', '0', 'admin', '2023-02-02 11:38:07', '', NULL, '入库成功');
INSERT INTO `sys_dict_data` VALUES (35, 1, '门诊', '1', 'his_scheduling_type', NULL, NULL, 'Y', '0', 'admin', '2023-02-06 11:29:26', '', NULL, '门诊');
INSERT INTO `sys_dict_data` VALUES (36, 2, '急诊', '2', 'his_scheduling_type', NULL, NULL, 'N', '0', 'admin', '2023-02-06 11:30:04', '', NULL, '急诊');
INSERT INTO `sys_dict_data` VALUES (37, 1, '上午', '1', 'his_subsection_type', NULL, NULL, 'N', '0', 'admin', '2023-02-06 11:30:43', '', NULL, '上午');
INSERT INTO `sys_dict_data` VALUES (38, 2, '下午', '2', 'his_subsection_type', NULL, NULL, 'N', '0', 'admin', '2023-02-06 11:31:06', '', NULL, '下午');
INSERT INTO `sys_dict_data` VALUES (39, 3, '晚上', '3', 'his_subsection_type', NULL, NULL, 'N', '0', 'admin', '2023-02-06 11:31:26', '', NULL, '晚上');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '采购状态', 'sys_purchase_status', '0', 'admin', '2023-02-02 11:33:18', '', NULL, '订单状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-01-02 23:33:03', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-01-02 23:33:03', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-01-02 23:33:03', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 241 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-03 00:52:48');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-01-03 21:40:20');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-03 21:40:31');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-03 21:40:40');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-03 22:13:11');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-03 22:13:15');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-03 23:16:13');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-03 23:57:13');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-04 01:36:00');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-04 17:59:44');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-09 18:48:30');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-09 22:28:32');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-09 23:52:19');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 19:10:22');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 19:32:59');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-10 19:44:57');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 21:47:10');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 22:31:50');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-10 22:32:50');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 22:32:52');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-11 01:02:59');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-11 17:20:47');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-11 18:15:22');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-11 18:15:32');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-11 18:15:35');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-11 19:38:23');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-11 21:52:50');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-11 21:52:53');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-11 22:44:12');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-11 23:18:13');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 01:38:35');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-01-12 02:49:16');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 02:49:20');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 04:21:58');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 17:55:03');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 19:20:02');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 21:33:40');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 22:20:51');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-15 17:07:28');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-15 17:07:31');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-15 17:56:37');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-15 18:25:39');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-15 21:39:32');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-15 22:35:22');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-15 22:36:39');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 00:32:59');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-16 01:04:29');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 01:04:57');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 01:38:37');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 16:40:31');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 16:43:47');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 17:44:47');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 19:24:16');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 19:46:18');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 19:49:20');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 19:52:04');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 20:14:11');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-17 02:18:21');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 02:18:23');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 02:36:39');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 02:48:07');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-27 16:34:45');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-27 16:34:47');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-27 18:14:33');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-27 19:38:20');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-27 22:29:24');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-27 22:29:29');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-28 00:33:05');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-28 16:42:51');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-28 17:21:32');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-28 19:50:38');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-28 21:54:36');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-29 00:03:10');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-29 00:08:44');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-29 00:28:25');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-29 00:30:45');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-29 00:30:55');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-29 01:09:35');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-29 16:32:35');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-29 17:13:08');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-29 17:13:11');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-29 17:59:36');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-29 19:59:53');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-29 19:59:57');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-29 20:32:41');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-29 21:45:25');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-29 23:05:25');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-30 02:36:58');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-30 03:10:58');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-30 17:32:17');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-30 18:16:05');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-30 18:16:08');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-30 18:47:47');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-30 21:50:09');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-30 21:50:11');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-30 22:29:25');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-31 00:55:37');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-31 16:13:42');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-31 18:07:22');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-31 18:07:42');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-31 18:07:45');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-31 18:09:58');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-31 18:16:31');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-31 18:23:36');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-31 18:23:39');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-31 22:58:18');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-01 18:13:14');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-01 18:56:33');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-01 18:56:38');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-02-01 18:56:38');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-01 19:54:28');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-01 21:40:53');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-01 23:46:23');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-01 23:46:32');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-02 00:53:07');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-02 16:36:56');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-02 16:37:01');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-02 16:56:46');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-02 16:59:23');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-02 17:46:29');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-02 17:46:32');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-02 19:46:36');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-02 21:38:23');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-02 22:23:32');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-03 01:04:12');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 16:56:46');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 17:39:05');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 18:25:33');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 19:55:35');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-02-06 21:58:46');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 21:58:48');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 22:37:59');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-07 00:55:20');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 00:55:23');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-07 00:58:09');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 00:58:11');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 01:07:56');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 16:39:38');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 16:52:41');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 23:20:53');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-08 18:51:00');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-08 21:38:26');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2068 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-01-02 23:33:02', 'admin', '2023-02-03 01:04:36', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 11, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-01-02 23:33:02', 'admin', '2023-01-29 22:13:09', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 12, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-01-02 23:33:02', 'admin', '2023-01-29 22:13:17', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 10, 'http://ruoyi.vip', NULL, 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2023-01-02 23:33:02', 'admin', '2023-01-28 17:49:34', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '1', '0', 'system:user:list', 'user', 'admin', '2023-01-02 23:33:02', 'admin', '2023-01-29 22:12:57', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '1', '0', 'system:role:list', 'peoples', 'admin', '2023-01-02 23:33:02', 'admin', '2023-01-28 17:41:09', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-01-02 23:33:02', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '1', '0', 'system:dept:list', 'tree', 'admin', '2023-01-02 23:33:02', 'admin', '2023-01-10 22:04:03', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '1', '0', 'system:post:list', 'post', 'admin', '2023-01-02 23:33:02', 'admin', '2023-01-10 22:05:03', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-01-02 23:33:02', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-01-02 23:33:02', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-01-02 23:33:02', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-01-02 23:33:02', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '1', '0', 'monitor:online:list', 'online', 'admin', '2023-01-02 23:33:02', 'admin', '2023-01-10 22:05:59', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-01-02 23:33:02', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-01-02 23:33:02', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-01-02 23:33:02', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-01-02 23:33:02', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-01-02 23:33:02', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-01-02 23:33:02', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-01-02 23:33:02', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-01-02 23:33:02', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-01-02 23:33:02', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-01-02 23:33:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '医院管理', 0, 4, 'media', NULL, 1, 0, 'M', '0', '0', '', 'server', 'admin', '2023-01-04 00:24:16', 'admin', '2023-02-03 01:04:30', '');
INSERT INTO `sys_menu` VALUES (2001, '科室管理', 2000, 1, 'dept', 'media/dept/index', 1, 0, 'C', '0', '0', 'media:dept:list', 'build', 'admin', '2023-01-04 00:30:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '科室查询', 2001, 1, '', NULL, 1, 0, 'F', '0', '0', 'media:dept:query', '#', 'admin', '2023-01-04 00:32:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '科室添加', 2001, 2, '', NULL, 1, 0, 'F', '0', '0', 'media:dept:add', '#', 'admin', '2023-01-04 00:35:08', 'admin', '2023-01-04 00:37:54', '');
INSERT INTO `sys_menu` VALUES (2005, '科室修改', 2001, 3, '', NULL, 1, 0, 'F', '0', '0', 'media:dept:edit', '#', 'admin', '2023-01-04 00:35:59', 'admin', '2023-01-10 00:50:06', '');
INSERT INTO `sys_menu` VALUES (2007, '科室删除', 2001, 4, '', NULL, 1, 0, 'F', '0', '0', 'media:dept:remove', '#', 'admin', '2023-01-10 00:27:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '用户管理', 2000, 2, 'user', 'media/user/index', 1, 0, 'C', '0', '0', 'media:user:list', 'color', 'admin', '2023-01-10 00:29:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '用户查询', 2008, 1, '', NULL, 1, 0, 'F', '0', '0', 'media:user:query', '#', 'admin', '2023-01-10 00:32:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '用户添加', 2008, 2, '', NULL, 1, 0, 'F', '0', '0', 'media:user:add', '#', 'admin', '2023-01-10 00:32:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '用户修改', 2008, 3, '', NULL, 1, 0, 'F', '0', '0', 'media:user:update', '#', 'admin', '2023-01-10 00:34:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '用户删除', 2008, 4, '', NULL, 1, 0, 'F', '0', '0', 'media:user:remove', '#', 'admin', '2023-01-10 00:34:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '重置密码', 2008, 5, '', NULL, 1, 0, 'F', '0', '0', 'media:user:resetUserPwd', '#', 'admin', '2023-01-10 00:37:59', 'admin', '2023-01-11 17:21:07', '');
INSERT INTO `sys_menu` VALUES (2015, '分配角色', 2008, 6, '', NULL, 1, 0, 'F', '0', '0', 'media:user:role', '#', 'admin', '2023-01-10 00:56:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '角色管理', 2000, 3, 'role', 'media/role/index', 1, 0, 'C', '0', '0', 'media:role:list', 'peoples', 'admin', '2023-01-27 18:44:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '角色查询', 2017, 1, '', NULL, 1, 0, 'F', '0', '0', 'media:role:query', '#', 'admin', '2023-01-27 18:45:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '角色修改', 2017, 2, '', NULL, 1, 0, 'F', '0', '0', 'media:role:edit', '#', 'admin', '2023-01-27 18:46:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '角色添加', 2017, 3, '', NULL, 1, 0, 'F', '0', '0', 'media:role:add', '#', 'admin', '2023-01-27 18:46:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '角色删除', 2017, 4, '', NULL, 1, 0, 'F', '0', '0', 'media:role:remove', '#', 'admin', '2023-01-27 18:47:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '通知公告', 2000, 6, 'notice', 'media/notice/index', 1, 0, 'C', '0', '0', 'media:notice:list', 'clipboard', 'admin', '2023-01-28 17:59:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '公告查询', 2023, 1, '', NULL, 1, 0, 'F', '0', '0', 'media:notice:query', '#', 'admin', '2023-01-28 17:59:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '公告添加', 2023, 2, '', NULL, 1, 0, 'F', '0', '0', 'media:notice:add', '#', 'admin', '2023-01-28 18:00:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '公告修改', 2023, 3, '', NULL, 1, 0, 'F', '0', '0', 'media:notice:edit', '#', 'admin', '2023-01-28 18:01:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '公告删除', 2023, 4, '', NULL, 1, 0, 'F', '0', '0', 'media:notice:remove', '#', 'admin', '2023-01-28 18:01:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '查看内容', 2023, 5, '', NULL, 1, 0, 'F', '0', '0', 'media:notice:inspect', '#', 'admin', '2023-01-28 19:58:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '药品进销存', 0, 4, 'drug', NULL, 1, 0, 'M', '0', '0', '', 'dashboard', 'admin', '2023-01-29 01:44:54', 'admin', '2023-02-07 00:58:46', '');
INSERT INTO `sys_menu` VALUES (2031, '生产厂家', 2030, 1, 'factory', 'medicine/factory/index', 1, 0, 'C', '0', '0', 'medicine:factory:list', 'chart', 'admin', '2023-01-29 16:38:19', 'admin', '2023-01-31 16:47:28', '');
INSERT INTO `sys_menu` VALUES (2032, '生产厂家查询', 2031, 1, '', NULL, 1, 0, 'F', '0', '0', 'medicine:factory:query', '#', 'admin', '2023-01-29 16:39:17', 'admin', '2023-01-29 17:13:40', '');
INSERT INTO `sys_menu` VALUES (2033, '生产厂家添加', 2031, 2, '', NULL, 1, 0, 'F', '0', '0', 'medicine:factory:add', '#', 'admin', '2023-01-29 16:39:57', 'admin', '2023-01-29 17:13:55', '');
INSERT INTO `sys_menu` VALUES (2034, '生产厂家修改', 2031, 3, '', NULL, 1, 0, 'F', '0', '0', 'medicine:factory:edit', '#', 'admin', '2023-01-29 16:40:49', 'admin', '2023-01-29 17:14:00', '');
INSERT INTO `sys_menu` VALUES (2035, '生产厂家删除', 2031, 4, '', NULL, 1, 0, 'F', '0', '0', 'medicine:factory:remove', '#', 'admin', '2023-01-29 16:41:21', 'admin', '2023-01-29 17:14:06', '');
INSERT INTO `sys_menu` VALUES (2036, '查看详细地址', 2031, 5, '', NULL, 1, 0, 'F', '0', '0', 'medicine:factory:inspect', '#', 'admin', '2023-01-29 23:09:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '药品信息', 2030, 2, 'info', 'medicine/info/index', 1, 0, 'C', '0', '0', 'medicine:info:list', 'dict', 'admin', '2023-01-30 17:34:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '药品信息查询', 2037, 1, '', NULL, 1, 0, 'F', '0', '0', 'medicine:info:query', '#', 'admin', '2023-01-30 17:35:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '药品信息添加', 2037, 2, '', NULL, 1, 0, 'F', '0', '0', 'medicine:info:add', '#', 'admin', '2023-01-30 17:35:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '药品信息修改', 2037, 3, '', NULL, 1, 0, 'F', '0', '0', 'medicine:info:edit', '#', 'admin', '2023-01-30 17:36:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '药品信息删除', 2037, 4, '', NULL, 1, 0, 'F', '0', '0', 'medicine:info:remove', '#', 'admin', '2023-01-30 17:36:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '供应商', 2030, 3, 'supplier', 'medicine/supplier/index', 1, 0, 'C', '0', '0', 'medicine:supplier:list', 'shopping', 'admin', '2023-01-31 16:42:17', 'admin', '2023-01-31 16:47:36', '');
INSERT INTO `sys_menu` VALUES (2043, '供应商查询', 2042, 1, '', NULL, 1, 0, 'F', '0', '0', 'medicine:supplier:query', '#', 'admin', '2023-01-31 16:42:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '供应商添加', 2042, 2, '', NULL, 1, 0, 'F', '0', '0', 'medicine:supplier:add', '#', 'admin', '2023-01-31 16:44:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '供应商修改', 2042, 3, '', NULL, 1, 0, 'F', '0', '0', 'medicine:supplier:edit', '#', 'admin', '2023-01-31 16:44:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '供应商删除', 2042, 4, '', NULL, 1, 0, 'F', '0', '0', 'medicine:supplier:remove', '#', 'admin', '2023-01-31 16:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '采购入库', 2030, 4, 'purchase', 'medicine/purchase/index', 1, 0, 'C', '0', '0', 'medicine:purchase:list', 'guide', 'admin', '2023-02-01 18:14:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '采购查询', 2047, 1, '', NULL, 1, 0, 'F', '0', '0', 'medicine:purchase:query', '#', 'admin', '2023-02-01 18:15:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '采购新增', 2047, 2, '', NULL, 1, 0, 'F', '0', '0', 'medicine:purchase:add', '#', 'admin', '2023-02-01 18:16:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '采购修改', 2047, 3, '', NULL, 1, 0, 'F', '0', '0', 'medicine:purchase:edit', '#', 'admin', '2023-02-01 18:16:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '采购删除', 2047, 4, '', NULL, 1, 0, 'F', '0', '0', 'medicine:purchase:remove', '#', 'admin', '2023-02-01 18:17:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '提交入库', 2047, 6, '', NULL, 1, 0, 'F', '0', '0', 'medicine:purchase:submit', '#', 'admin', '2023-02-01 18:18:25', 'admin', '2023-02-01 18:57:00', '');
INSERT INTO `sys_menu` VALUES (2053, '提交审核', 2047, 5, '', NULL, 1, 0, 'F', '0', '0', 'medicine:purchase:audit', '#', 'admin', '2023-02-01 18:57:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '入库审核', 2030, 5, 'check', 'medicine/check/index', 1, 0, 'C', '0', '0', 'medicine:check:list', 'upload', 'admin', '2023-02-02 18:58:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '审核通过', 2054, 1, '', NULL, 1, 0, 'F', '0', '0', 'medicine:check:accesss', '#', 'admin', '2023-02-02 18:58:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '审核作废', 2054, 2, '', NULL, 1, 0, 'F', '0', '0', 'medicine:check:invalid', '#', 'admin', '2023-02-02 18:59:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '数据统计', 0, 5, 'revenue', NULL, 1, 0, 'M', '0', '0', '', 'search', 'admin', '2023-02-07 00:58:33', 'admin', '2023-02-07 01:00:46', '');
INSERT INTO `sys_menu` VALUES (2068, '收支统计', 2067, 1, 'income', 'revenue/income/index', 1, 0, 'C', '0', '0', 'revenue:income:list', 'money', 'admin', '2023-02-07 01:00:23', 'admin', '2023-02-07 01:05:32', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-01-02 23:33:03', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-01-02 23:33:03', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 377 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '操作日志', 9, 'com.ruoyi.project.monitor.controller.SysOperlogController.clean()', 'DELETE', 1, 'admin', NULL, '/monitor/operlog/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-28 18:06:34');
INSERT INTO `sys_oper_log` VALUES (2, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"5\",\"menuName\":\"查看内容\",\"params\":{},\"parentId\":2027,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"media:notice:view\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-28 19:57:21');
INSERT INTO `sys_oper_log` VALUES (3, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2028', '127.0.0.1', '内网IP', '{menuId=2028}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-28 19:57:28');
INSERT INTO `sys_oper_log` VALUES (4, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"5\",\"menuName\":\"查看内容\",\"params\":{},\"parentId\":2023,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"media:notice:inspect\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-28 19:58:19');
INSERT INTO `sys_oper_log` VALUES (5, '通知公告', 2, 'com.ruoyi.project.media.controller.MediaNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/media/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"公告\",\"params\":{},\"noticeId\":4,\"noticeTitle\":\"关于开展我院2022年度个人继续医学教育电子学分审核的通知\",\"noticeContent\":\"<p>各科室、各部门：</p><p><br></p><p>2022年度个人继续医学教育电子学分审核工作已开始。请各科室通知本科室人员于2023年2月10日前上网（http://icme.haoyisheng.com）完成个人学分录入和个人学分查询，现将学分录入、审核的具体要求和流程通知如下：dsa</p><p><br></p><p>一、按安徽省继续医学教育委员会办公室的要求，2022年继续医学教育个人年度继续教育学分达标要求和计算形式：</p><p><br></p><p>1、2022年度个人年度继续教育学分达标要求：</p><p><br></p><p>2022年度学分达标计算不分Ⅰ、Ⅱ类继教学分。</p><p><br></p><p>中级、副高、正高：总分≥25；</p><p><br></p><p>初级：学分≥20；</p>\",\"createBy\":\"admin\",\"createTime\":1674959163000,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-28 23:06:12');
INSERT INTO `sys_oper_log` VALUES (6, '通知公告', 2, 'com.ruoyi.project.media.controller.MediaNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/media/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"公告\",\"updateTime\":1674918372000,\"params\":{},\"noticeId\":4,\"noticeTitle\":\"关于开展我院2022年度个人继续医学教育电子学分审核的通知\",\"noticeContent\":\"<p>各科室、各部门：</p><p><br></p><p>2022年度个人继续医学教育电子学分审核工作已开始。请各科室通知本科室人员于2023年2月10日前上网（http://icme.haoyisheng.com）完成个人学分录入和个人学分查询，现将学分录入、审核的具体要求和流程通知如下：</p><p><br></p><p>一、按安徽省继续医学教育委员会办公室的要求，2022年继续医学教育个人年度继续教育学分达标要求和计算形式：</p><p><br></p><p>1、2022年度个人年度继续教育学分达标要求：</p><p><br></p><p>2022年度学分达标计算不分Ⅰ、Ⅱ类继教学分。</p><p><br></p><p>中级、副高、正高：总分≥25；</p><p><br></p><p>初级：学分≥20；</p>\",\"createBy\":\"admin\",\"createTime\":1674959163000,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-28 23:06:19');
INSERT INTO `sys_oper_log` VALUES (7, '通知公告', 3, 'com.ruoyi.project.media.controller.MediaNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/media/notice/4', '127.0.0.1', '内网IP', '{noticeIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 00:31:34');
INSERT INTO `sys_oper_log` VALUES (8, '通知公告', 3, 'com.ruoyi.project.media.controller.MediaNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/media/notice/3', '127.0.0.1', '内网IP', '{noticeIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 00:35:01');
INSERT INTO `sys_oper_log` VALUES (9, '通知公告', 1, 'com.ruoyi.project.media.controller.MediaNoticeController.add()', 'POST', 1, 'admin', NULL, '/media/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"2\",\"params\":{},\"noticeTitle\":\"2022年福建省立医院专项招聘紧缺急需人才方案\",\"noticeContent\":\"<p>\\t<span style=\\\"color: rgb(64, 64, 64);\\\">福建省立医院是福建省卫健委直属单位、非营利性三级甲等综合医院，创建于1937年，是全省临床诊疗、医学教育、医学研究和预防保健中心。医院编制床位2500张，在职员工3700多名，其中卫生专业技术人员3200多名，拥有享受国务院政府特殊津贴专家、国家卫生计生突出贡献中青年专家、美国护理科学院院士、国家百千万人才工程人选等一大批知名专家。医院拥有6个国家级临床重点专科建设项目，10个省级临床重点专科建设项目，9个国家级基地（中心），15个省级质控中心；拥有福建省心血管病、急诊医学、老年病、胃肠病及核医学科等5个省级研究所，急诊医学、老年医学、重症医学等3个临床医学中心，心血管病等4个省级重点实验室。医院具有从本科、硕士、博士、博士后到毕业后继续教育的完整教学体系，其中博士后工作站1个，博士培养点21个，硕士培养点35个，国家级住培基地、专培基地27个。因工作需要，拟向社会公开招聘紧缺急需人才8名（编内），具体方案如下：</span></p>\",\"createBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 01:31:25');
INSERT INTO `sys_oper_log` VALUES (10, '通知公告', 2, 'com.ruoyi.project.media.controller.MediaNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/media/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"1\",\"delFlag\":\"0\",\"params\":{},\"noticeId\":1,\"noticeTitle\":\"关于2023年度卫生管理专业资格考试的通知\",\"noticeContent\":\"各部门、各科室：\\r\\n\\r\\n转安徽省卫健委通知，2023年度卫生管理专业资格考试报名已经开始，现将有关有关事项通知如下：\\r\\n\\r\\n一、报名人员应取得医学门类专业或医学院校相关专业学历，并满足《人力资源社会保障部 国家卫生健康委 国家中医药局关于深化卫生专业技术人员职称制度改革的指导意见》（人社部发〔2021〕51号）、《人力资源社会保障部办公厅关于进一步做好职称评审工作的通知》（人社厅发〔2022〕60号）、《关于印发〈安徽省卫生系列卫生管理专业职称评审标准条件（试行）〉的通知》（皖卫人秘〔2022〕128号）中规定的报考条件。报名参加2023年度的考试人员，其取得学历和从事本专业工作年限计算均截止到2022年12月31日。\",\"createBy\":\"admin\",\"createTime\":1674958756000,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 01:34:47');
INSERT INTO `sys_oper_log` VALUES (11, '通知公告', 2, 'com.ruoyi.project.media.controller.MediaNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/media/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"2\",\"updateTime\":1674927287000,\"delFlag\":\"0\",\"params\":{},\"noticeId\":1,\"noticeTitle\":\"关于2023年度卫生管理专业资格考试的通知\",\"noticeContent\":\"<p>各部门、各科室：</p><p><br></p><p>转安徽省卫健委通知，2023年度卫生管理专业资格考试报名已经开始，现将有关有关事项通知如下：</p><p><br></p><p>一、报名人员应取得医学门类专业或医学院校相关专业学历，并满足《人力资源社会保障部 国家卫生健康委 国家中医药局关于深化卫生专业技术人员职称制度改革的指导意见》（人社部发〔2021〕51号）、《人力资源社会保障部办公厅关于进一步做好职称评审工作的通知》（人社厅发〔2022〕60号）、《关于印发〈安徽省卫生系列卫生管理专业职称评审标准条件（试行）〉的通知》（皖卫人秘〔2022〕128号）中规定的报考条件。报名参加2023年度的考试人员，其取得学历和从事本专业工作年限计算均截止到2022年12月31日。</p>\",\"createBy\":\"admin\",\"createTime\":1674958756000,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 01:34:55');
INSERT INTO `sys_oper_log` VALUES (12, '通知公告', 2, 'com.ruoyi.project.media.controller.MediaNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/media/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"1\",\"updateTime\":1674927295000,\"delFlag\":\"0\",\"params\":{},\"noticeId\":1,\"noticeTitle\":\"关于2023年度卫生管理专业资格考试的通知\",\"noticeContent\":\"<p>各部门、各科室：</p><p><br></p><p>转安徽省卫健委通知，2023年度卫生管理专业资格考试报名已经开始，现将有关有关事项通知如下：</p><p><br></p><p>一、报名人员应取得医学门类专业或医学院校相关专业学历，并满足《人力资源社会保障部 国家卫生健康委 国家中医药局关于深化卫生专业技术人员职称制度改革的指导意见》（人社部发〔2021〕51号）、《人力资源社会保障部办公厅关于进一步做好职称评审工作的通知》（人社厅发〔2022〕60号）、《关于印发〈安徽省卫生系列卫生管理专业职称评审标准条件（试行）〉的通知》（皖卫人秘〔2022〕128号）中规定的报考条件。报名参加2023年度的考试人员，其取得学历和从事本专业工作年限计算均截止到2022年12月31日。</p>\",\"createBy\":\"admin\",\"createTime\":1674958756000,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 01:35:38');
INSERT INTO `sys_oper_log` VALUES (13, '通知公告', 2, 'com.ruoyi.project.media.controller.MediaNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/media/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"2\",\"updateTime\":1674927338000,\"delFlag\":\"0\",\"params\":{},\"noticeId\":1,\"noticeTitle\":\"关于2023年度卫生管理专业资格考试的通知\",\"noticeContent\":\"<p>各部门、各科室：</p><p><br></p><p>转安徽省卫健委通知，2023年度卫生管理专业资格考试报名已经开始，现将有关有关事项通知如下：</p><p><br></p><p>一、报名人员应取得医学门类专业或医学院校相关专业学历，并满足《人力资源社会保障部 国家卫生健康委 国家中医药局关于深化卫生专业技术人员职称制度改革的指导意见》（人社部发〔2021〕51号）、《人力资源社会保障部办公厅关于进一步做好职称评审工作的通知》（人社厅发〔2022〕60号）、《关于印发〈安徽省卫生系列卫生管理专业职称评审标准条件（试行）〉的通知》（皖卫人秘〔2022〕128号）中规定的报考条件。报名参加2023年度的考试人员，其取得学历和从事本专业工作年限计算均截止到2022年12月31日。</p>\",\"createBy\":\"admin\",\"createTime\":1674958756000,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 01:35:43');
INSERT INTO `sys_oper_log` VALUES (14, '通知公告', 3, 'com.ruoyi.project.media.controller.MediaNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/media/notice/3,5', '127.0.0.1', '内网IP', '{noticeIds=3,5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 01:36:56');
INSERT INTO `sys_oper_log` VALUES (15, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"dashboard\",\"orderNum\":\"6\",\"menuName\":\"药品进销存管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"drug\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 01:44:55');
INSERT INTO `sys_oper_log` VALUES (16, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":\"1\",\"menuName\":\"生产厂家维护\",\"params\":{},\"parentId\":2030,\"isCache\":\"0\",\"path\":\"factory\",\"component\":\"drug/factory/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"drug:factory:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 16:38:19');
INSERT INTO `sys_oper_log` VALUES (17, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"生产厂家查询\",\"params\":{},\"parentId\":2031,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"drug:factory:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 16:39:17');
INSERT INTO `sys_oper_log` VALUES (18, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"生产厂家添加\",\"params\":{},\"parentId\":2031,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"drug:factory:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 16:39:57');
INSERT INTO `sys_oper_log` VALUES (19, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"生产厂家修改\",\"params\":{},\"parentId\":2031,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"drug:factory:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 16:40:49');
INSERT INTO `sys_oper_log` VALUES (20, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"4\",\"menuName\":\"生产厂家删除\",\"params\":{},\"parentId\":2031,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"drug:factory:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 16:41:21');
INSERT INTO `sys_oper_log` VALUES (21, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"4\",\"menuName\":\"生产厂家删除\",\"params\":{},\"parentId\":2031,\"isCache\":\"0\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"drug:factory:remove\",\"status\":\"0\"}', '{\"msg\":\"新增菜单\'生产厂家删除\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2023-01-29 16:41:21');
INSERT INTO `sys_oper_log` VALUES (22, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":\"1\",\"menuName\":\"生产厂家维护\",\"params\":{},\"parentId\":2030,\"isCache\":\"0\",\"path\":\"factory\",\"component\":\"medicine/factory/index\",\"children\":[],\"createTime\":1674981499000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2031,\"menuType\":\"C\",\"perms\":\"drug:factory:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 17:13:30');
INSERT INTO `sys_oper_log` VALUES (23, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"生产厂家查询\",\"params\":{},\"parentId\":2031,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1674981557000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2032,\"menuType\":\"F\",\"perms\":\"medicine:factory:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 17:13:40');
INSERT INTO `sys_oper_log` VALUES (24, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":\"1\",\"menuName\":\"生产厂家维护\",\"params\":{},\"parentId\":2030,\"isCache\":\"0\",\"path\":\"factory\",\"component\":\"medicine/factory/index\",\"children\":[],\"createTime\":1674981499000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2031,\"menuType\":\"C\",\"perms\":\"medicine:factory:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 17:13:49');
INSERT INTO `sys_oper_log` VALUES (25, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"生产厂家添加\",\"params\":{},\"parentId\":2031,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1674981597000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2033,\"menuType\":\"F\",\"perms\":\"medicine:factory:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 17:13:55');
INSERT INTO `sys_oper_log` VALUES (26, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"3\",\"menuName\":\"生产厂家修改\",\"params\":{},\"parentId\":2031,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1674981649000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2034,\"menuType\":\"F\",\"perms\":\"medicine:factory:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 17:14:00');
INSERT INTO `sys_oper_log` VALUES (27, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"4\",\"menuName\":\"生产厂家删除\",\"params\":{},\"parentId\":2031,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1674981681000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2035,\"menuType\":\"F\",\"perms\":\"medicine:factory:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 17:14:06');
INSERT INTO `sys_oper_log` VALUES (28, '用户管理', 2, 'com.ruoyi.project.media.controller.MediaUserController.edit()', 'PUT', 1, 'admin', NULL, '/media/user', '127.0.0.1', '内网IP', '{\"deptName\":\"心内科\",\"sex\":\"0\",\"deptId\":7,\"admin\":false,\"remark\":\"\",\"params\":{},\"userName\":\"李时珍\",\"userId\":3,\"createBy\":\"admin\",\"password\":\"1234561\",\"phoneNumber\":\"13454658798\",\"createTime\":1673340578000,\"updateBy\":\"admin\",\"background\":\"本科\",\"grade\":\"副主任医师\",\"scheduling\":\"0\",\"age\":\"22\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 18:00:01');
INSERT INTO `sys_oper_log` VALUES (29, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"user\",\"orderNum\":\"1\",\"menuName\":\"用户管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"user\",\"component\":\"system/user/index\",\"children\":[],\"createTime\":1672673582000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":100,\"menuType\":\"C\",\"perms\":\"system:user:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 22:12:57');
INSERT INTO `sys_oper_log` VALUES (30, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"11\",\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1672673582000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 22:13:09');
INSERT INTO `sys_oper_log` VALUES (31, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tool\",\"orderNum\":\"12\",\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1672673582000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 22:13:17');
INSERT INTO `sys_oper_log` VALUES (32, '厂家管理', 3, 'com.ruoyi.project.medicine.controller.GenFactoryController.remove()', 'DELETE', 1, 'admin', NULL, '/medicine/factory/9', '127.0.0.1', '内网IP', '{factoryIds=9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 22:57:03');
INSERT INTO `sys_oper_log` VALUES (33, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"5\",\"menuName\":\"查看详细地址\",\"params\":{},\"parentId\":2031,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:factory:inspect\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 23:09:07');
INSERT INTO `sys_oper_log` VALUES (34, '厂家管理', 2, 'com.ruoyi.project.medicine.controller.GenFactoryController.changeStatus()', 'PUT', 1, 'admin', NULL, '/medicine/factory/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-01-29 23:11:55');
INSERT INTO `sys_oper_log` VALUES (35, '角色管理', 2, 'com.ruoyi.project.media.controller.MediaRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/media/role/changeStatus', '127.0.0.1', '内网IP', '{\"roleId\":1,\"admin\":true,\"params\":{},\"status\":\"1\"}', 'null', 1, '不允许操作超级管理员角色', '2023-01-29 23:14:52');
INSERT INTO `sys_oper_log` VALUES (36, '角色管理', 2, 'com.ruoyi.project.media.controller.MediaRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/media/role/changeStatus', '127.0.0.1', '内网IP', '{\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 23:14:54');
INSERT INTO `sys_oper_log` VALUES (37, '角色管理', 2, 'com.ruoyi.project.media.controller.MediaRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/media/role/changeStatus', '127.0.0.1', '内网IP', '{\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 23:15:11');
INSERT INTO `sys_oper_log` VALUES (38, '厂家管理', 2, 'com.ruoyi.project.medicine.controller.GenFactoryController.changeStatus()', 'PUT', 1, 'admin', NULL, '/medicine/factory/changeStatus', '127.0.0.1', '内网IP', '{\"factoryId\":1,\"params\":{},\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 23:16:02');
INSERT INTO `sys_oper_log` VALUES (39, '厂家管理', 2, 'com.ruoyi.project.medicine.controller.GenFactoryController.changeStatus()', 'PUT', 1, 'admin', NULL, '/medicine/factory/changeStatus', '127.0.0.1', '内网IP', '{\"factoryId\":1,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-29 23:16:04');
INSERT INTO `sys_oper_log` VALUES (40, '厂家管理', 3, 'com.ruoyi.project.medicine.controller.GenFactoryController.remove()', 'DELETE', 1, 'admin', NULL, '/medicine/factory/8,9', '127.0.0.1', '内网IP', '{factoryIds=8,9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-30 03:17:29');
INSERT INTO `sys_oper_log` VALUES (41, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"dict\",\"orderNum\":\"2\",\"menuName\":\"药品信息\",\"params\":{},\"parentId\":2030,\"isCache\":\"0\",\"path\":\"info\",\"component\":\"medicine/info/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"medicine:info:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-30 17:34:12');
INSERT INTO `sys_oper_log` VALUES (42, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"药品信息查询\",\"params\":{},\"parentId\":2037,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:info:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-30 17:35:23');
INSERT INTO `sys_oper_log` VALUES (43, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"药品信息添加\",\"params\":{},\"parentId\":2037,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:info:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-30 17:35:52');
INSERT INTO `sys_oper_log` VALUES (44, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"药品信息修改\",\"params\":{},\"parentId\":2037,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:info:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-30 17:36:15');
INSERT INTO `sys_oper_log` VALUES (45, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"4\",\"menuName\":\"药品信息删除\",\"params\":{},\"parentId\":2037,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:info:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-30 17:36:40');
INSERT INTO `sys_oper_log` VALUES (46, '用户管理', 1, 'com.ruoyi.project.media.controller.MediaUserController.add()', 'POST', 1, 'admin', NULL, '/media/user', '127.0.0.1', '内网IP', '{\"sex\":\"0\",\"deptId\":7,\"admin\":false,\"params\":{},\"userName\":\"测试ll\",\"userId\":19,\"createBy\":\"admin\",\"password\":\"abc123\",\"phoneNumber\":\"19845216423\",\"background\":\"本科\",\"grade\":\"主任医师\",\"scheduling\":\"0\",\"age\":\"26\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-30 18:56:56');
INSERT INTO `sys_oper_log` VALUES (47, '厂家管理', 1, 'com.ruoyi.project.medicine.controller.MedicineInfoController.add()', 'POST', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"1\",\"medicineCode\":\"tblx4578\",\"medicinePrice\":1234,\"factoryId\":4,\"params\":{},\"warnValue\":2500,\"medicineName\":\"头孢来星\",\"createBy\":\"admin\",\"unit\":\"g\",\"convertQuantity\":\"1\",\"medicineType\":\"1\",\"stock\":9500,\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'factoryCode\' in \'class com.ruoyi.project.medicine.domain.MedicineInfo\'', '2023-01-31 00:41:12');
INSERT INTO `sys_oper_log` VALUES (48, '厂家管理', 1, 'com.ruoyi.project.medicine.controller.MedicineInfoController.add()', 'POST', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"1\",\"medicineCode\":\"tblx4578\",\"medicinePrice\":1234,\"factoryId\":4,\"params\":{},\"warnValue\":2500,\"medicineName\":\"头孢来星\",\"createBy\":\"admin\",\"unit\":\"g\",\"convertQuantity\":\"1\",\"medicineType\":\"1\",\"stock\":9500,\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'factoryCode\' in \'class com.ruoyi.project.medicine.domain.MedicineInfo\'', '2023-01-31 00:41:27');
INSERT INTO `sys_oper_log` VALUES (49, '厂家管理', 1, 'com.ruoyi.project.medicine.controller.MedicineInfoController.add()', 'POST', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"1\",\"medicineCode\":\"tblx4578\",\"medicinePrice\":1234,\"factoryId\":4,\"params\":{},\"warnValue\":2500,\"medicineName\":\"头孢来星\",\"createBy\":\"admin\",\"unit\":\"g\",\"convertQuantity\":\"1\",\"medicineType\":\"1\",\"stock\":9500,\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'contact\' in \'class com.ruoyi.project.medicine.domain.MedicineInfo\'', '2023-01-31 00:44:00');
INSERT INTO `sys_oper_log` VALUES (50, '厂家管理', 1, 'com.ruoyi.project.medicine.controller.MedicineInfoController.add()', 'POST', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"1\",\"medicineCode\":\"tblx4578\",\"medicinePrice\":1234,\"factoryId\":4,\"params\":{},\"warnValue\":2500,\"medicineName\":\"头孢来星\",\"createBy\":\"admin\",\"unit\":\"g\",\"convertQuantity\":\"1\",\"medicineType\":\"1\",\"stock\":9500,\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicineInfoMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicineInfoMapper.insertMedicineInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_info(          medicine_name,           medicine_code,           factory_id,           medicine_type,           prescription_type,           unit,           medicine_price,           stock,           warn_value,           convert_quantity,           status,           create_by,          create_time         )         values (          ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,          sysdate()         )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2023-01-31 00:44:45');
INSERT INTO `sys_oper_log` VALUES (51, '厂家管理', 1, 'com.ruoyi.project.medicine.controller.MedicineInfoController.add()', 'POST', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"1\",\"medicineCode\":\"tblx4578\",\"medicinePrice\":1234,\"factoryId\":4,\"params\":{},\"warnValue\":2500,\"medicineName\":\"头孢来星\",\"createBy\":\"admin\",\"unit\":\"g\",\"convertQuantity\":\"1\",\"medicineType\":\"1\",\"stock\":9500,\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'convert_quantity\' at row 1\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicineInfoMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicineInfoMapper.insertMedicineInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_info(          medicine_name,           medicine_code,           factory_id,           medicine_type,           prescription_type,           unit,           medicine_price,           stock,           warn_value,           convert_quantity,           status,           create_by,          create_time         )         values (          ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,          sysdate()         )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'convert_quantity\' at row 1\n; Data truncation: Data too long for column \'convert_quantity\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'convert_quantity\' at row 1', '2023-01-31 00:47:03');
INSERT INTO `sys_oper_log` VALUES (52, '厂家管理', 1, 'com.ruoyi.project.medicine.controller.MedicineInfoController.add()', 'POST', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"1\",\"medicineCode\":\"tblx4578\",\"medicinePrice\":6.66,\"factoryId\":4,\"params\":{},\"warnValue\":2500,\"medicineName\":\"头孢来星\",\"createBy\":\"admin\",\"unit\":\"g\",\"convertQuantity\":\"1\",\"medicineType\":\"1\",\"stock\":9500,\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'convert_quantity\' at row 1\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicineInfoMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicineInfoMapper.insertMedicineInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_info(          medicine_name,           medicine_code,           factory_id,           medicine_type,           prescription_type,           unit,           medicine_price,           stock,           warn_value,           convert_quantity,           status,           create_by,          create_time         )         values (          ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,          sysdate()         )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'convert_quantity\' at row 1\n; Data truncation: Data too long for column \'convert_quantity\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'convert_quantity\' at row 1', '2023-01-31 00:50:18');
INSERT INTO `sys_oper_log` VALUES (53, '厂家管理', 1, 'com.ruoyi.project.medicine.controller.MedicineInfoController.add()', 'POST', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"1\",\"medicineCode\":\"tblx4578\",\"medicinePrice\":6.66,\"factoryId\":4,\"params\":{},\"warnValue\":2500,\"medicineName\":\"头孢来星\",\"createBy\":\"admin\",\"unit\":\"g\",\"convertQuantity\":\"1\",\"medicineType\":\"1\",\"stock\":9500,\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'convert_quantity\' at row 1\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicineInfoMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicineInfoMapper.insertMedicineInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_info(          medicine_name,           medicine_code,           factory_id,           medicine_type,           prescription_type,           unit,           medicine_price,           stock,           warn_value,           convert_quantity,           status,           create_by,          create_time         )         values (          ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,          sysdate()         )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'convert_quantity\' at row 1\n; Data truncation: Data too long for column \'convert_quantity\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'convert_quantity\' at row 1', '2023-01-31 00:56:09');
INSERT INTO `sys_oper_log` VALUES (54, '厂家管理', 1, 'com.ruoyi.project.medicine.controller.MedicineInfoController.add()', 'POST', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"1\",\"medicineCode\":\"tblx4578\",\"medicinePrice\":6.66,\"factoryId\":4,\"params\":{},\"warnValue\":2500,\"medicineName\":\"头孢来星\",\"createBy\":\"admin\",\"unit\":\"g\",\"convertQuantity\":\"1\",\"medicineType\":\"1\",\"stock\":9500,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 00:58:27');
INSERT INTO `sys_oper_log` VALUES (55, '厂家管理', 2, 'com.ruoyi.project.medicine.controller.MedicineInfoController.changeStatus()', 'PUT', 1, 'admin', NULL, '/medicine/info/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-01-31 00:59:17');
INSERT INTO `sys_oper_log` VALUES (56, '厂家管理', 1, 'com.ruoyi.project.medicine.controller.MedicineInfoController.add()', 'POST', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"中药处方\",\"medicineCode\":\"dzy4531\",\"medicinePrice\":3.35,\"factoryId\":7,\"params\":{},\"warnValue\":2500,\"medicineName\":\"淡竹叶\",\"createBy\":\"admin\",\"unit\":\"g\",\"convertQuantity\":\"2\",\"medicineType\":\"中草药\",\"stock\":10000,\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect integer value: \'中草药\' for column \'stock\' at row 1\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicineInfoMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicineInfoMapper.insertMedicineInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_info(          medicine_name,           medicine_code,           factory_id,           medicine_type,           prescription_type,           unit,           medicine_price,           stock,           warn_value,           convert_quantity,           status,           create_by,          create_time         )         values (          ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,          sysdate()         )\r\n### Cause: java.sql.SQLException: Incorrect integer value: \'中草药\' for column \'stock\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect integer value: \'中草药\' for column \'stock\' at row 1; nested exception is java.sql.SQLException: Incorrect integer value: \'中草药\' for column \'stock\' at row 1', '2023-01-31 01:03:44');
INSERT INTO `sys_oper_log` VALUES (57, '厂家管理', 1, 'com.ruoyi.project.medicine.controller.MedicineInfoController.add()', 'POST', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"中药处方\",\"medicineCode\":\"dzy4531\",\"medicinePrice\":3.35,\"factoryId\":7,\"params\":{},\"warnValue\":2500,\"medicineName\":\"淡竹叶\",\"createBy\":\"admin\",\"unit\":\"g\",\"convertQuantity\":\"2\",\"medicineType\":\"中草药\",\"stock\":10000,\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect integer value: \'中草药\' for column \'stock\' at row 1\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicineInfoMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicineInfoMapper.insertMedicineInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_info(          medicine_name,           medicine_code,           factory_id,           medicine_type,           prescription_type,           unit,           medicine_price,           stock,           warn_value,           convert_quantity,           status,           create_by,          create_time         )         values (          ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,          sysdate()         )\r\n### Cause: java.sql.SQLException: Incorrect integer value: \'中草药\' for column \'stock\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect integer value: \'中草药\' for column \'stock\' at row 1; nested exception is java.sql.SQLException: Incorrect integer value: \'中草药\' for column \'stock\' at row 1', '2023-01-31 01:12:01');
INSERT INTO `sys_oper_log` VALUES (58, '厂家管理', 1, 'com.ruoyi.project.medicine.controller.MedicineInfoController.add()', 'POST', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"中药处方\",\"medicineCode\":\"dzy4531\",\"medicinePrice\":3.35,\"factoryId\":7,\"params\":{},\"warnValue\":2500,\"medicineName\":\"淡竹叶\",\"createBy\":\"admin\",\"unit\":\"g\",\"convertQuantity\":\"2\",\"medicineType\":\"中草药\",\"stock\":9500,\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect integer value: \'中草药\' for column \'stock\' at row 1\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicineInfoMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicineInfoMapper.insertMedicineInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_info(          medicine_name,           medicine_code,           factory_id,           medicine_type,           prescription_type,           unit,           medicine_price,           stock,           warn_value,           convert_quantity,           status,           create_by,          create_time         )         values (          ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,          sysdate()         )\r\n### Cause: java.sql.SQLException: Incorrect integer value: \'中草药\' for column \'stock\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect integer value: \'中草药\' for column \'stock\' at row 1; nested exception is java.sql.SQLException: Incorrect integer value: \'中草药\' for column \'stock\' at row 1', '2023-01-31 01:12:26');
INSERT INTO `sys_oper_log` VALUES (59, '厂家管理', 1, 'com.ruoyi.project.medicine.controller.MedicineInfoController.add()', 'POST', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"中药处方\",\"medicineCode\":\"dzy4531\",\"medicinePrice\":3.35,\"factoryId\":7,\"params\":{},\"warnValue\":2500,\"medicineName\":\"淡竹叶\",\"createBy\":\"admin\",\"unit\":\"g\",\"convertQuantity\":\"2\",\"medicineType\":\"中草药\",\"stock\":9500,\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect integer value: \'中草药\' for column \'stock\' at row 1\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicineInfoMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicineInfoMapper.insertMedicineInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_info(          medicine_name,           medicine_code,           factory_id,           medicine_type,           prescription_type,           unit,           medicine_price,           stock,           warn_value,           convert_quantity,           status,           create_by,          create_time         )         values (          ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,          sysdate()         )\r\n### Cause: java.sql.SQLException: Incorrect integer value: \'中草药\' for column \'stock\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect integer value: \'中草药\' for column \'stock\' at row 1; nested exception is java.sql.SQLException: Incorrect integer value: \'中草药\' for column \'stock\' at row 1', '2023-01-31 01:17:07');
INSERT INTO `sys_oper_log` VALUES (60, '厂家管理', 1, 'com.ruoyi.project.medicine.controller.MedicineInfoController.add()', 'POST', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"中药处方\",\"medicineCode\":\"dzy4531\",\"medicinePrice\":3.35,\"factoryId\":7,\"params\":{},\"warnValue\":2500,\"medicineName\":\"淡竹叶\",\"createBy\":\"admin\",\"unit\":\"g\",\"convertQuantity\":\"2\",\"medicineType\":\"中草药\",\"stock\":9500,\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect integer value: \'中草药\' for column \'stock\' at row 1\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicineInfoMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicineInfoMapper.insertMedicineInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_info(          medicine_name,           medicine_code,           factory_id,           medicine_type,           prescription_type,           unit,           medicine_price,           stock,           warn_value,           convert_quantity,           status,           create_by,          create_time         )         values (          ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,           ?,          sysdate()         )\r\n### Cause: java.sql.SQLException: Incorrect integer value: \'中草药\' for column \'stock\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect integer value: \'中草药\' for column \'stock\' at row 1; nested exception is java.sql.SQLException: Incorrect integer value: \'中草药\' for column \'stock\' at row 1', '2023-01-31 01:23:51');
INSERT INTO `sys_oper_log` VALUES (61, '厂家管理', 1, 'com.ruoyi.project.medicine.controller.MedicineInfoController.add()', 'POST', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"中药处方\",\"medicineCode\":\"dzy4531\",\"medicinePrice\":3.35,\"factoryId\":7,\"params\":{},\"warnValue\":2500,\"medicineName\":\"淡竹叶\",\"createBy\":\"admin\",\"unit\":\"g\",\"convertQuantity\":\"2\",\"medicineType\":\"中草药\",\"stock\":9500,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 01:26:28');
INSERT INTO `sys_oper_log` VALUES (62, '厂家管理', 2, 'com.ruoyi.project.medicine.controller.MedicineInfoController.changeStatus()', 'PUT', 1, 'admin', NULL, '/medicine/info/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-01-31 01:26:38');
INSERT INTO `sys_oper_log` VALUES (63, '厂家管理', 2, 'com.ruoyi.project.medicine.controller.MedicineInfoController.changeStatus()', 'PUT', 1, 'admin', NULL, '/medicine/info/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-01-31 01:26:41');
INSERT INTO `sys_oper_log` VALUES (64, '厂家管理', 2, 'com.ruoyi.project.medicine.controller.MedicineInfoController.changeStatus()', 'PUT', 1, 'admin', NULL, '/medicine/info/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-01-31 01:28:07');
INSERT INTO `sys_oper_log` VALUES (65, '用户管理', 2, 'com.ruoyi.project.media.controller.MediaUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/media/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":2,\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 01:33:37');
INSERT INTO `sys_oper_log` VALUES (66, '厂家管理', 2, 'com.ruoyi.project.medicine.controller.MedicineInfoController.changeStatus()', 'PUT', 1, 'admin', NULL, '/medicine/info/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-01-31 01:35:13');
INSERT INTO `sys_oper_log` VALUES (67, '厂家管理', 2, 'com.ruoyi.project.medicine.controller.MedicineInfoController.changeStatus()', 'PUT', 1, 'admin', NULL, '/medicine/info/changeStatus', '127.0.0.1', '内网IP', '{\"medicineId\":18,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 01:36:57');
INSERT INTO `sys_oper_log` VALUES (68, '厂家管理', 3, 'com.ruoyi.project.medicine.controller.MedicineInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/medicine/info/18,19', '127.0.0.1', '内网IP', '{infoIds=18,19}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 01:37:13');
INSERT INTO `sys_oper_log` VALUES (69, '厂家管理', 2, 'com.ruoyi.project.medicine.controller.MedicineInfoController.edit()', 'PUT', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"中药处方\",\"medicineCode\":\"sdh4533\",\"medicinePrice\":9.45,\"factoryId\":7,\"medicineId\":17,\"factoryName\":\"西南医药集团有限公司\",\"delFlag\":\"0\",\"params\":{},\"warnValue\":4500,\"medicineName\":\"生地黄\",\"unit\":\"g\",\"convertQuantity\":\"1\",\"medicineType\":\"中草药\",\"stock\":20000,\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', '2023-01-31 01:38:50');
INSERT INTO `sys_oper_log` VALUES (70, '厂家管理', 2, 'com.ruoyi.project.medicine.controller.MedicineInfoController.edit()', 'PUT', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"中药处方\",\"medicineCode\":\"sdh4533\",\"medicinePrice\":9.45,\"factoryId\":7,\"medicineId\":17,\"factoryName\":\"西南医药集团有限公司\",\"delFlag\":\"0\",\"params\":{},\"warnValue\":4500,\"medicineName\":\"生地黄\",\"unit\":\"g\",\"convertQuantity\":\"1\",\"medicineType\":\"中草药\",\"stock\":20000,\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', '2023-01-31 01:38:57');
INSERT INTO `sys_oper_log` VALUES (71, '药品信息管理', 2, 'com.ruoyi.project.medicine.controller.MedicineInfoController.edit()', 'PUT', 1, 'admin', NULL, '/medicine/info', '127.0.0.1', '内网IP', '{\"prescriptionType\":\"中药处方\",\"medicineCode\":\"sdh4533\",\"medicinePrice\":9.45,\"factoryId\":7,\"medicineId\":17,\"factoryName\":\"西南医药集团有限公司\",\"delFlag\":\"0\",\"params\":{},\"warnValue\":4500,\"medicineName\":\"生地黄\",\"unit\":\"g\",\"updateBy\":\"admin\",\"convertQuantity\":\"1\",\"medicineType\":\"中草药\",\"stock\":20000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 01:47:55');
INSERT INTO `sys_oper_log` VALUES (72, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"shopping\",\"orderNum\":\"3\",\"menuName\":\"供应商维护\",\"params\":{},\"parentId\":2030,\"isCache\":\"0\",\"path\":\"supplier\",\"component\":\"medicine/supplier/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"medicine:supplier:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 16:42:17');
INSERT INTO `sys_oper_log` VALUES (73, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"供应商查询\",\"params\":{},\"parentId\":2042,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:supplier:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 16:42:51');
INSERT INTO `sys_oper_log` VALUES (74, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"供应商添加\",\"params\":{},\"parentId\":2042,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:supplier:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 16:44:02');
INSERT INTO `sys_oper_log` VALUES (75, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"供应商修改\",\"params\":{},\"parentId\":2042,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:supplier:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 16:44:31');
INSERT INTO `sys_oper_log` VALUES (76, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"4\",\"menuName\":\"供应商删除\",\"params\":{},\"parentId\":2042,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:supplier:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 16:44:59');
INSERT INTO `sys_oper_log` VALUES (77, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":\"1\",\"menuName\":\"生产厂家\",\"params\":{},\"parentId\":2030,\"isCache\":\"0\",\"path\":\"factory\",\"component\":\"medicine/factory/index\",\"children\":[],\"createTime\":1674981499000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2031,\"menuType\":\"C\",\"perms\":\"medicine:factory:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 16:47:28');
INSERT INTO `sys_oper_log` VALUES (78, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"shopping\",\"orderNum\":\"3\",\"menuName\":\"供应商\",\"params\":{},\"parentId\":2030,\"isCache\":\"0\",\"path\":\"supplier\",\"component\":\"medicine/supplier/index\",\"children\":[],\"createTime\":1675154537000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2042,\"menuType\":\"C\",\"perms\":\"medicine:supplier:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 16:47:36');
INSERT INTO `sys_oper_log` VALUES (79, '供应商管理', 1, 'com.ruoyi.project.medicine.controller.SupplierController.add()', 'POST', 1, 'admin', NULL, '/medicine/supplier', '127.0.0.1', '内网IP', '{\"supplierName\":\"广州市森大贸易有限公司\",\"telephoneNum\":\"15023659874\",\"params\":{},\"createBy\":\"admin\",\"contact\":\"林XX\",\"bankCount\":\"6547214539874652451\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 19:06:43');
INSERT INTO `sys_oper_log` VALUES (80, '供应商管理', 2, 'com.ruoyi.project.medicine.controller.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/medicine/supplier', '127.0.0.1', '内网IP', '{\"supplierName\":\"广州市森大贸易有限公司\",\"address\":\" 广州市天河区天河北路233号中信广场4606室\",\"supplierId\":5,\"telephoneNum\":\"15023659874\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1675163203000,\"updateBy\":\"admin\",\"contact\":\"林XX\",\"bankCount\":\"6547214539874652451\",\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'medicineId\' in \'class com.ruoyi.project.medicine.domain.Supplier\'', '2023-01-31 19:08:17');
INSERT INTO `sys_oper_log` VALUES (81, '供应商管理', 2, 'com.ruoyi.project.medicine.controller.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/medicine/supplier', '127.0.0.1', '内网IP', '{\"supplierName\":\"广州市森大贸易有限公司\",\"address\":\" 广州市天河区天河北路233号中信广场4606室\",\"supplierId\":5,\"telephoneNum\":\"15023659874\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1675163203000,\"updateBy\":\"admin\",\"contact\":\"林XX\",\"bankCount\":\"6547214539874652451\",\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'medicineId\' in \'class com.ruoyi.project.medicine.domain.Supplier\'', '2023-01-31 19:08:21');
INSERT INTO `sys_oper_log` VALUES (82, '供应商管理', 2, 'com.ruoyi.project.medicine.controller.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/medicine/supplier', '127.0.0.1', '内网IP', '{\"supplierName\":\"广州市森大贸易有限公司\",\"address\":\" 广州市天河区天河北路233号中信广场4606室\",\"supplierId\":5,\"telephoneNum\":\"15023659874\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1675163203000,\"updateBy\":\"admin\",\"contact\":\"林XX\",\"bankCount\":\"6547214539874652451\",\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'medicineId\' in \'class com.ruoyi.project.medicine.domain.Supplier\'', '2023-01-31 19:08:27');
INSERT INTO `sys_oper_log` VALUES (83, '供应商管理', 2, 'com.ruoyi.project.medicine.controller.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/medicine/supplier', '127.0.0.1', '内网IP', '{\"supplierName\":\"广州市森大贸易有限公司\",\"address\":\" 广州市天河区天河北路233号中信广场4606室\",\"supplierId\":5,\"telephoneNum\":\"15023659874\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1675163203000,\"updateBy\":\"admin\",\"contact\":\"林XX\",\"bankCount\":\"6547214539874652451\",\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'medicineId\' in \'class com.ruoyi.project.medicine.domain.Supplier\'', '2023-01-31 19:11:50');
INSERT INTO `sys_oper_log` VALUES (84, '供应商管理', 2, 'com.ruoyi.project.medicine.controller.SupplierController.changeStatus()', 'PUT', 1, 'admin', NULL, '/medicine/supplier/changeStatus', '127.0.0.1', '内网IP', '{\"supplierId\":5,\"params\":{},\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 19:15:25');
INSERT INTO `sys_oper_log` VALUES (85, '供应商管理', 2, 'com.ruoyi.project.medicine.controller.SupplierController.changeStatus()', 'PUT', 1, 'admin', NULL, '/medicine/supplier/changeStatus', '127.0.0.1', '内网IP', '{\"supplierId\":5,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 19:15:27');
INSERT INTO `sys_oper_log` VALUES (86, '供应商管理', 3, 'com.ruoyi.project.medicine.controller.SupplierController.remove()', 'DELETE', 1, 'admin', NULL, '/medicine/supplier/5', '127.0.0.1', '内网IP', '{supplierIds=5}', 'null', 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'supplierId\' not found. Available parameters are [array, supplierIds]', '2023-01-31 19:15:30');
INSERT INTO `sys_oper_log` VALUES (87, '供应商管理', 3, 'com.ruoyi.project.medicine.controller.SupplierController.remove()', 'DELETE', 1, 'admin', NULL, '/medicine/supplier/5,4', '127.0.0.1', '内网IP', '{supplierIds=5,4}', 'null', 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'supplierId\' not found. Available parameters are [array, supplierIds]', '2023-01-31 19:16:06');
INSERT INTO `sys_oper_log` VALUES (88, '药品信息管理', 3, 'com.ruoyi.project.medicine.controller.MedicineInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/medicine/info/19', '127.0.0.1', '内网IP', '{infoIds=19}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 19:18:17');
INSERT INTO `sys_oper_log` VALUES (89, '药品信息管理', 3, 'com.ruoyi.project.medicine.controller.MedicineInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/medicine/info/18,17', '127.0.0.1', '内网IP', '{infoIds=18,17}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 19:18:35');
INSERT INTO `sys_oper_log` VALUES (90, '供应商管理', 3, 'com.ruoyi.project.medicine.controller.SupplierController.remove()', 'DELETE', 1, 'admin', NULL, '/medicine/supplier/5', '127.0.0.1', '内网IP', '{supplierIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 19:21:32');
INSERT INTO `sys_oper_log` VALUES (91, '供应商管理', 3, 'com.ruoyi.project.medicine.controller.SupplierController.remove()', 'DELETE', 1, 'admin', NULL, '/medicine/supplier/4', '127.0.0.1', '内网IP', '{supplierIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 19:21:35');
INSERT INTO `sys_oper_log` VALUES (92, '供应商管理', 2, 'com.ruoyi.project.medicine.controller.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/medicine/supplier', '127.0.0.1', '内网IP', '{\"supplierName\":\"广州市森大贸易有限公司\",\"address\":\" 广州市天河区天河北路223号中信广场4606室\",\"supplierId\":5,\"telephoneNum\":\"15023659874\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1675163203000,\"updateBy\":\"admin\",\"contact\":\"林XX\",\"bankCount\":\"6547214539874652451\",\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.builder.BuilderException: Parsing error was found in mapping #{}.  Check syntax #{property|(expression), var1=value1, var2=value2, ...} ', '2023-01-31 19:22:02');
INSERT INTO `sys_oper_log` VALUES (93, '供应商管理', 2, 'com.ruoyi.project.medicine.controller.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/medicine/supplier', '127.0.0.1', '内网IP', '{\"supplierName\":\"广州市森大贸易有限公司\",\"address\":\" 广州市天河区天河北路243号中信广场4606室\",\"supplierId\":5,\"telephoneNum\":\"15023659874\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1675163203000,\"updateBy\":\"admin\",\"contact\":\"林XX\",\"bankCount\":\"6547214539874652451\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 19:35:31');
INSERT INTO `sys_oper_log` VALUES (94, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"dashboard\",\"orderNum\":\"6\",\"menuName\":\"药品进销存\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"drug\",\"children\":[],\"createTime\":1674927894000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2030,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-31 23:01:39');
INSERT INTO `sys_oper_log` VALUES (95, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"采购入库\",\"params\":{},\"parentId\":2030,\"isCache\":\"0\",\"path\":\"purchase\",\"component\":\"medicine/purchase/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"medicine:purchase:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 18:14:52');
INSERT INTO `sys_oper_log` VALUES (96, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"采购查询\",\"params\":{},\"parentId\":2047,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:purchase:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 18:15:37');
INSERT INTO `sys_oper_log` VALUES (97, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"采购新增\",\"params\":{},\"parentId\":2047,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:purchase:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 18:16:16');
INSERT INTO `sys_oper_log` VALUES (98, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"采购修改\",\"params\":{},\"parentId\":2047,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:purchase:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 18:16:45');
INSERT INTO `sys_oper_log` VALUES (99, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"4\",\"menuName\":\"采购删除\",\"params\":{},\"parentId\":2047,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:purchase:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 18:17:18');
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"5\",\"menuName\":\"提交入库\",\"params\":{},\"parentId\":2047,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:purchase:submit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 18:18:26');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"6\",\"menuName\":\"提交入库\",\"params\":{},\"parentId\":2047,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1675246705000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2052,\"menuType\":\"F\",\"perms\":\"medicine:purchase:submit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 18:57:00');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"5\",\"menuName\":\"提交审核\",\"params\":{},\"parentId\":2047,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:purchase:audit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 18:57:56');
INSERT INTO `sys_oper_log` VALUES (103, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', 'null', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'s.supplier_id\' in \'field list\'\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\SupplierMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select s.supplier_id, s.supplier_name         from medicine_supplier\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'s.supplier_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'s.supplier_id\' in \'field list\'', '2023-02-01 22:15:01');
INSERT INTO `sys_oper_log` VALUES (104, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 22:15:52');
INSERT INTO `sys_oper_log` VALUES (105, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 22:20:37');
INSERT INTO `sys_oper_log` VALUES (106, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 22:25:48');
INSERT INTO `sys_oper_log` VALUES (107, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 22:28:07');
INSERT INTO `sys_oper_log` VALUES (108, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 22:34:32');
INSERT INTO `sys_oper_log` VALUES (109, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 22:34:58');
INSERT INTO `sys_oper_log` VALUES (110, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 22:42:50');
INSERT INTO `sys_oper_log` VALUES (111, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 22:45:47');
INSERT INTO `sys_oper_log` VALUES (112, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 22:51:42');
INSERT INTO `sys_oper_log` VALUES (113, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 22:56:24');
INSERT INTO `sys_oper_log` VALUES (114, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 23:08:48');
INSERT INTO `sys_oper_log` VALUES (115, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 23:10:59');
INSERT INTO `sys_oper_log` VALUES (116, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 23:11:44');
INSERT INTO `sys_oper_log` VALUES (117, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 23:12:22');
INSERT INTO `sys_oper_log` VALUES (118, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 23:35:34');
INSERT INTO `sys_oper_log` VALUES (119, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 23:38:39');
INSERT INTO `sys_oper_log` VALUES (120, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":0}', 0, NULL, '2023-02-01 23:46:23');
INSERT INTO `sys_oper_log` VALUES (121, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 23:46:36');
INSERT INTO `sys_oper_log` VALUES (122, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 23:50:43');
INSERT INTO `sys_oper_log` VALUES (123, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-01 23:56:32');
INSERT INTO `sys_oper_log` VALUES (124, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":0}', 0, NULL, '2023-02-01 23:56:35');
INSERT INTO `sys_oper_log` VALUES (125, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":0}', 0, NULL, '2023-02-01 23:56:43');
INSERT INTO `sys_oper_log` VALUES (126, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":0}', 0, NULL, '2023-02-01 23:58:20');
INSERT INTO `sys_oper_log` VALUES (127, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":0}', 0, NULL, '2023-02-01 23:58:43');
INSERT INTO `sys_oper_log` VALUES (128, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":0}', 0, NULL, '2023-02-02 00:00:12');
INSERT INTO `sys_oper_log` VALUES (129, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":0}', 0, NULL, '2023-02-02 00:00:25');
INSERT INTO `sys_oper_log` VALUES (130, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":0}', 0, NULL, '2023-02-02 00:00:38');
INSERT INTO `sys_oper_log` VALUES (131, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":0}', 0, NULL, '2023-02-02 00:12:43');
INSERT INTO `sys_oper_log` VALUES (132, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:12:44');
INSERT INTO `sys_oper_log` VALUES (133, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"params\":{}}', '{\"msg\":\"审核已入库,请问重复提交~\",\"code\":500}', 0, NULL, '2023-02-02 00:12:54');
INSERT INTO `sys_oper_log` VALUES (134, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:21:00');
INSERT INTO `sys_oper_log` VALUES (135, '供应商管理', 3, 'com.ruoyi.project.medicine.controller.SupplierController.remove()', 'DELETE', 1, 'admin', NULL, '/medicine/supplier/5,4', '127.0.0.1', '内网IP', '{supplierIds=5,4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-02 00:22:50');
INSERT INTO `sys_oper_log` VALUES (136, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:25:07');
INSERT INTO `sys_oper_log` VALUES (137, '采购管理', 3, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.remove()', 'DELETE', 1, 'admin', NULL, '/medicine/purchase/CG6542165489789546321', '127.0.0.1', '内网IP', '{purchaseIds=CG6542165489789546321}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-02 00:25:11');
INSERT INTO `sys_oper_log` VALUES (138, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:25:31');
INSERT INTO `sys_oper_log` VALUES (139, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":0}', 0, NULL, '2023-02-02 00:25:35');
INSERT INTO `sys_oper_log` VALUES (140, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"params\":{}}', '{\"msg\":\"审核已入库,请问重复提交~\",\"code\":500}', 0, NULL, '2023-02-02 00:27:07');
INSERT INTO `sys_oper_log` VALUES (141, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"params\":{}}', '{\"msg\":\"审核已入库,请问重复提交~\",\"code\":500}', 0, NULL, '2023-02-02 00:27:12');
INSERT INTO `sys_oper_log` VALUES (142, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:31:29');
INSERT INTO `sys_oper_log` VALUES (143, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:33:24');
INSERT INTO `sys_oper_log` VALUES (144, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":0}', 0, NULL, '2023-02-02 00:33:32');
INSERT INTO `sys_oper_log` VALUES (145, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":0}', 0, NULL, '2023-02-02 00:33:38');
INSERT INTO `sys_oper_log` VALUES (146, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"params\":{}}', '{\"msg\":\"审核已入库,请问重复提交~\",\"code\":500}', 0, NULL, '2023-02-02 00:34:52');
INSERT INTO `sys_oper_log` VALUES (147, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"params\":{}}', '{\"msg\":\"审核已入库,请问重复提交~\",\"code\":500}', 0, NULL, '2023-02-02 00:34:57');
INSERT INTO `sys_oper_log` VALUES (148, '供应商管理', 2, 'com.ruoyi.project.medicine.controller.SupplierController.changeStatus()', 'PUT', 1, 'admin', NULL, '/medicine/supplier/changeStatus', '127.0.0.1', '内网IP', '{\"supplierId\":4,\"params\":{},\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-02 00:35:24');
INSERT INTO `sys_oper_log` VALUES (149, '供应商管理', 2, 'com.ruoyi.project.medicine.controller.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/medicine/supplier', '127.0.0.1', '内网IP', '{\"supplierName\":\"广州市贺易时贸易有限公司\",\"address\":\"广州市天河区华观路1963号1栋321-208房\",\"supplierId\":4,\"telephoneNum\":\"18054632879\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1675213636000,\"updateBy\":\"admin\",\"contact\":\"郭XX\",\"bankCount\":\"6379371486856759135\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-02 00:35:43');
INSERT INTO `sys_oper_log` VALUES (150, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:41:19');
INSERT INTO `sys_oper_log` VALUES (151, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:42:01');
INSERT INTO `sys_oper_log` VALUES (152, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":0}', 0, NULL, '2023-02-02 00:42:04');
INSERT INTO `sys_oper_log` VALUES (153, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:45:00');
INSERT INTO `sys_oper_log` VALUES (154, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:45:28');
INSERT INTO `sys_oper_log` VALUES (155, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:46:53');
INSERT INTO `sys_oper_log` VALUES (156, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"params\":{}}', '{\"msg\":\"审核已入库,请问重复提交~\",\"code\":500}', 0, NULL, '2023-02-02 00:47:12');
INSERT INTO `sys_oper_log` VALUES (157, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:51:32');
INSERT INTO `sys_oper_log` VALUES (158, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"params\":{}}', '{\"msg\":\"审核已入库,请问重复提交~\",\"code\":500}', 0, NULL, '2023-02-02 00:51:45');
INSERT INTO `sys_oper_log` VALUES (159, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:53:07');
INSERT INTO `sys_oper_log` VALUES (160, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:53:54');
INSERT INTO `sys_oper_log` VALUES (161, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"params\":{}}', '{\"msg\":\"审核已入库,请问重复提交~\",\"code\":500}', 0, NULL, '2023-02-02 00:54:08');
INSERT INTO `sys_oper_log` VALUES (162, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:54:31');
INSERT INTO `sys_oper_log` VALUES (163, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 00:55:12');
INSERT INTO `sys_oper_log` VALUES (164, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:04:14');
INSERT INTO `sys_oper_log` VALUES (165, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:04:37');
INSERT INTO `sys_oper_log` VALUES (166, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:05:36');
INSERT INTO `sys_oper_log` VALUES (167, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:07:05');
INSERT INTO `sys_oper_log` VALUES (168, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:10:13');
INSERT INTO `sys_oper_log` VALUES (169, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG1236654987985463210\",\"params\":{}}', '{\"msg\":\"审核已入库,请问重复提交~\",\"code\":500}', 0, NULL, '2023-02-02 01:10:21');
INSERT INTO `sys_oper_log` VALUES (170, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG3652132214569874512\",\"params\":{}}', '{\"msg\":\"审核已入库,请问重复提交~\",\"code\":500}', 0, NULL, '2023-02-02 01:10:42');
INSERT INTO `sys_oper_log` VALUES (171, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:13:02');
INSERT INTO `sys_oper_log` VALUES (172, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG1236654987985463210\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 01:13:06');
INSERT INTO `sys_oper_log` VALUES (173, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG6542165489789546321\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 01:13:14');
INSERT INTO `sys_oper_log` VALUES (174, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG6542165489789546321\",\"params\":{}}', '{\"msg\":\"审核已入库,请问重复提交~\",\"code\":500}', 0, NULL, '2023-02-02 01:13:55');
INSERT INTO `sys_oper_log` VALUES (175, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG3652132214569874512\",\"params\":{}}', '{\"msg\":\"审核已入库,请问重复提交~\",\"code\":500}', 0, NULL, '2023-02-02 01:14:00');
INSERT INTO `sys_oper_log` VALUES (176, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:17:19');
INSERT INTO `sys_oper_log` VALUES (177, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG1236654987985463210\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 01:17:29');
INSERT INTO `sys_oper_log` VALUES (178, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG1236654987985463210\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交入库成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 01:17:33');
INSERT INTO `sys_oper_log` VALUES (179, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:21:58');
INSERT INTO `sys_oper_log` VALUES (180, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG1271358119477379072\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交入库成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 01:22:05');
INSERT INTO `sys_oper_log` VALUES (181, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG3652132214569874512\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交入库成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 01:22:27');
INSERT INTO `sys_oper_log` VALUES (182, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:23:22');
INSERT INTO `sys_oper_log` VALUES (183, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG6542165489789546321\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 01:26:45');
INSERT INTO `sys_oper_log` VALUES (184, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG1236654987985463210\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交入库成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 01:26:45');
INSERT INTO `sys_oper_log` VALUES (185, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG6542165489789546321\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 01:26:45');
INSERT INTO `sys_oper_log` VALUES (186, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:27:04');
INSERT INTO `sys_oper_log` VALUES (187, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:27:25');
INSERT INTO `sys_oper_log` VALUES (188, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG1236654987985463210\",\"params\":{},\"purStatus\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 01:27:54');
INSERT INTO `sys_oper_log` VALUES (189, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG1236654987985463210\",\"params\":{},\"purStatus\":\"2\",\"updateBy\":\"admin\"}', '{\"msg\":\"提交入库成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 01:28:00');
INSERT INTO `sys_oper_log` VALUES (190, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG1271358119477379072\",\"params\":{},\"purStatus\":\"2\",\"updateBy\":\"admin\"}', '{\"msg\":\"提交入库成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 01:31:11');
INSERT INTO `sys_oper_log` VALUES (191, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG1271358119477379072\",\"params\":{},\"purStatus\":\"2\",\"updateBy\":\"admin\"}', '{\"msg\":\"提交入库成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 01:34:04');
INSERT INTO `sys_oper_log` VALUES (192, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:34:33');
INSERT INTO `sys_oper_log` VALUES (193, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:35:00');
INSERT INTO `sys_oper_log` VALUES (194, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG1236654987985463210\",\"params\":{},\"purStatus\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"提交入库成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 01:36:46');
INSERT INTO `sys_oper_log` VALUES (195, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:39:04');
INSERT INTO `sys_oper_log` VALUES (196, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG1271358119477379072\",\"params\":{},\"purStatus\":\"2\"}', '{\"msg\":\"审核未通过或未提交,请重新提交审核后重试~\",\"code\":500}', 0, NULL, '2023-02-02 01:39:34');
INSERT INTO `sys_oper_log` VALUES (197, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:40:13');
INSERT INTO `sys_oper_log` VALUES (198, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG1271358119477379072\",\"params\":{},\"purStatus\":\"2\"}', '{\"msg\":\"审核未通过或未提交,请重新提交审核后重试~\",\"code\":500}', 0, NULL, '2023-02-02 01:40:17');
INSERT INTO `sys_oper_log` VALUES (199, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG3541236645214523654\",\"params\":{},\"purStatus\":\"3\",\"updateBy\":\"admin\"}', '{\"msg\":\"提交入库成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 01:40:22');
INSERT INTO `sys_oper_log` VALUES (200, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG6542165489789546321\",\"params\":{},\"purStatus\":\"5\"}', '{\"msg\":\"审核已作废,请问重新提交审核~\",\"code\":500}', 0, NULL, '2023-02-02 01:40:25');
INSERT INTO `sys_oper_log` VALUES (201, '采购管理', 3, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.remove()', 'DELETE', 1, 'admin', NULL, '/medicine/purchase/CG3652132214569874512', '127.0.0.1', '内网IP', '{purchaseIds=CG3652132214569874512}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-02 01:40:41');
INSERT INTO `sys_oper_log` VALUES (202, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 01:41:45');
INSERT INTO `sys_oper_log` VALUES (203, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 16:37:08');
INSERT INTO `sys_oper_log` VALUES (204, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG1271358119477379072\",\"params\":{},\"purStatus\":\"2\"}', '{\"msg\":\"审核未通过或未提交,请重新提交审核后重试~\",\"code\":500}', 0, NULL, '2023-02-02 16:38:18');
INSERT INTO `sys_oper_log` VALUES (205, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG1271358119477379072\",\"params\":{},\"purStatus\":\"2\"}', '{\"msg\":\"已处于提交状态！\",\"code\":500}', 0, NULL, '2023-02-02 16:38:38');
INSERT INTO `sys_oper_log` VALUES (206, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 16:56:55');
INSERT INTO `sys_oper_log` VALUES (207, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 16:58:42');
INSERT INTO `sys_oper_log` VALUES (208, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 16:59:24');
INSERT INTO `sys_oper_log` VALUES (209, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:05:04');
INSERT INTO `sys_oper_log` VALUES (210, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:11:34');
INSERT INTO `sys_oper_log` VALUES (211, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:12:43');
INSERT INTO `sys_oper_log` VALUES (212, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:13:39');
INSERT INTO `sys_oper_log` VALUES (213, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:16:06');
INSERT INTO `sys_oper_log` VALUES (214, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:17:52');
INSERT INTO `sys_oper_log` VALUES (215, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:27:38');
INSERT INTO `sys_oper_log` VALUES (216, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:28:56');
INSERT INTO `sys_oper_log` VALUES (217, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:31:21');
INSERT INTO `sys_oper_log` VALUES (218, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:41:05');
INSERT INTO `sys_oper_log` VALUES (219, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:46:10');
INSERT INTO `sys_oper_log` VALUES (220, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:46:13');
INSERT INTO `sys_oper_log` VALUES (221, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:46:33');
INSERT INTO `sys_oper_log` VALUES (222, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:48:47');
INSERT INTO `sys_oper_log` VALUES (223, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:51:49');
INSERT INTO `sys_oper_log` VALUES (224, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:51:52');
INSERT INTO `sys_oper_log` VALUES (225, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:56:24');
INSERT INTO `sys_oper_log` VALUES (226, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 17:59:24');
INSERT INTO `sys_oper_log` VALUES (227, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 18:00:05');
INSERT INTO `sys_oper_log` VALUES (228, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 18:01:36');
INSERT INTO `sys_oper_log` VALUES (229, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 18:07:00');
INSERT INTO `sys_oper_log` VALUES (230, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 18:08:17');
INSERT INTO `sys_oper_log` VALUES (231, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 18:08:57');
INSERT INTO `sys_oper_log` VALUES (232, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 18:14:40');
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"upload\",\"orderNum\":\"5\",\"menuName\":\"入库审核\",\"params\":{},\"parentId\":2030,\"isCache\":\"0\",\"path\":\"check\",\"component\":\"medicine/check/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"medicine:check:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-02 18:58:07');
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"审核通过\",\"params\":{},\"parentId\":2054,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:check:accesss\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-02 18:58:46');
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"审核作废\",\"params\":{},\"parentId\":2054,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"medicine:check:invalid\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-02 18:59:32');
INSERT INTO `sys_oper_log` VALUES (236, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 19:46:43');
INSERT INTO `sys_oper_log` VALUES (237, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 22:51:41');
INSERT INTO `sys_oper_log` VALUES (238, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 22:52:25');
INSERT INTO `sys_oper_log` VALUES (239, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 22:52:44');
INSERT INTO `sys_oper_log` VALUES (240, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 22:58:12');
INSERT INTO `sys_oper_log` VALUES (241, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 22:58:12');
INSERT INTO `sys_oper_log` VALUES (242, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 22:58:18');
INSERT INTO `sys_oper_log` VALUES (243, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 23:00:08');
INSERT INTO `sys_oper_log` VALUES (244, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 23:00:35');
INSERT INTO `sys_oper_log` VALUES (245, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 23:14:22');
INSERT INTO `sys_oper_log` VALUES (246, '采购管理', 2, 'com.ruoyi.project.medicine.controller.CheckAccessController.AuditAccess()', 'PUT', 1, 'admin', NULL, '/medicine/check/auditAccess/CG1236654987985463210,CG1271358119477379072', '127.0.0.1', '内网IP', '[\"CG1236654987985463210\",\"CG1271358119477379072\"]', '{\"msg\":\"操作成功\",\"code\":200,\"data\":2}', 0, NULL, '2023-02-02 23:20:46');
INSERT INTO `sys_oper_log` VALUES (247, '采购管理', 2, 'com.ruoyi.project.medicine.controller.CheckAccessController.invalidCheck()', 'PUT', 1, 'admin', NULL, '/medicine/check/invalidCheck/CG3541236645214523654', '127.0.0.1', '内网IP', '[\"CG3541236645214523654\"]', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 23:20:53');
INSERT INTO `sys_oper_log` VALUES (248, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 23:34:31');
INSERT INTO `sys_oper_log` VALUES (249, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 23:34:54');
INSERT INTO `sys_oper_log` VALUES (250, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG1236654987985463210\",\"params\":{},\"purStatus\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 23:35:00');
INSERT INTO `sys_oper_log` VALUES (251, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG1271358119477379072\",\"params\":{},\"purStatus\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 23:35:03');
INSERT INTO `sys_oper_log` VALUES (252, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 23:35:18');
INSERT INTO `sys_oper_log` VALUES (253, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG1271358119477379072\",\"params\":{},\"purStatus\":\"2\"}', '{\"msg\":\"审核未通过或未提交,请重新提交审核后重试~\",\"code\":500}', 0, NULL, '2023-02-02 23:36:12');
INSERT INTO `sys_oper_log` VALUES (254, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG3541236645214523654\",\"params\":{},\"purStatus\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 23:37:01');
INSERT INTO `sys_oper_log` VALUES (255, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 23:37:17');
INSERT INTO `sys_oper_log` VALUES (256, '采购管理', 2, 'com.ruoyi.project.medicine.controller.CheckAccessController.submitEntryDB()', 'PUT', 1, 'admin', NULL, '/medicine/check/submitEntryDB', '127.0.0.1', '内网IP', '{\"purId\":\"CG1236654987985463210\",\"params\":{},\"purStatus\":\"2\"}', '{\"msg\":\"审核未通过或未提交,请重新提交审核后重试~\",\"code\":500}', 0, NULL, '2023-02-02 23:46:04');
INSERT INTO `sys_oper_log` VALUES (257, '采购管理', 2, 'com.ruoyi.project.medicine.controller.CheckAccessController.AuditAccess()', 'PUT', 1, 'admin', NULL, '/medicine/check/auditAccess/CG1236654987985463210', '127.0.0.1', '内网IP', '[\"CG1236654987985463210\"]', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 23:46:11');
INSERT INTO `sys_oper_log` VALUES (258, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 23:47:21');
INSERT INTO `sys_oper_log` VALUES (259, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG6542165489789546321\",\"params\":{},\"purStatus\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 23:47:25');
INSERT INTO `sys_oper_log` VALUES (260, '采购管理', 2, 'com.ruoyi.project.medicine.controller.CheckAccessController.AuditAccess()', 'PUT', 1, 'admin', NULL, '/medicine/check/auditAccess/CG1271358119477379072', '127.0.0.1', '内网IP', '[\"CG1271358119477379072\"]', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-02 23:51:50');
INSERT INTO `sys_oper_log` VALUES (261, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-02 23:52:03');
INSERT INTO `sys_oper_log` VALUES (262, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":\"4\",\"menuName\":\"医院管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"media\",\"children\":[],\"createTime\":1672763056000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-03 01:04:30');
INSERT INTO `sys_oper_log` VALUES (263, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"1\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1672673582000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-03 01:04:36');
INSERT INTO `sys_oper_log` VALUES (264, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-05 17:02:45');
INSERT INTO `sys_oper_log` VALUES (265, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG3541236645214523654\",\"params\":{},\"purStatus\":\"2\"}', '{\"msg\":\"已处于提交状态！\",\"code\":500}', 0, NULL, '2023-02-05 17:02:54');
INSERT INTO `sys_oper_log` VALUES (266, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"1\",\"menuName\":\"门诊挂号\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"path\":\"seedoctor\",\"component\":\"seedoctor/reglist/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"seedoctor:reglist:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 17:46:10');
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"eye\",\"orderNum\":\"6\",\"menuName\":\"我的排班\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"path\":\"mywork\",\"component\":\"seedoctor/mywork/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"seedoctor:mywork:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 17:48:08');
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"根据id获取患者档案\",\"params\":{},\"parentId\":2057,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"seedoctor:patient:record\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 17:50:10');
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"获取患者列表\",\"params\":{},\"parentId\":2057,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"seedoctor:patient:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 17:50:53');
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"已存在患者\",\"params\":{},\"parentId\":2057,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1675590610000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2059,\"menuType\":\"F\",\"perms\":\"seedoctor:patient:record\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 18:26:29');
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"已存在患者挂号\",\"params\":{},\"parentId\":2057,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1675590610000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2059,\"menuType\":\"F\",\"perms\":\"seedoctor:patient:record\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 18:26:48');
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2060', '127.0.0.1', '内网IP', '{menuId=2060}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 18:27:17');
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"获取患者列表\",\"params\":{},\"parentId\":2057,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"seedocotr:patient:getPatient\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 18:51:07');
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"通过身份证获取患者信息\",\"params\":{},\"parentId\":2057,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"seedoctor:patient:getPatientById\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 18:52:49');
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"2\",\"menuName\":\"挂号列表\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"path\":\"reglist\",\"component\":\"seedoctor/reglist/list\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"seedoctor:reglist:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 18:57:33');
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"2\",\"menuName\":\"挂号列表\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"path\":\"reglist\",\"component\":\"seedoctor/reglist/list\",\"children\":[],\"createTime\":1675594653000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2063,\"menuType\":\"C\",\"perms\":\"seedoctor:reglist:index\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 18:58:05');
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"2\",\"menuName\":\"挂号列表\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"path\":\"reglist\",\"component\":\"seedoctor/reglist/index\",\"children\":[],\"createTime\":1675594653000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2063,\"menuType\":\"C\",\"perms\":\"seedoctor:reglist:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 18:58:22');
INSERT INTO `sys_oper_log` VALUES (278, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"2\",\"menuName\":\"挂号列表\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"path\":\"reglist\",\"component\":\"seedoctor/reglist/index\",\"children\":[],\"createTime\":1675594653000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2063,\"menuType\":\"C\",\"perms\":\"seedoctor:reglist:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 18:58:23');
INSERT INTO `sys_oper_log` VALUES (279, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"1\",\"menuName\":\"门诊挂号\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"path\":\"registration\",\"component\":\"seedoctor/registration/index\",\"children\":[],\"createTime\":1675590370000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2057,\"menuType\":\"C\",\"perms\":\"seedoctor:registration:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 18:59:15');
INSERT INTO `sys_oper_log` VALUES (280, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"6\",\"menuName\":\"患者库\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"path\":\"patient\",\"component\":\"seedoctor/patient/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"seedoctor:pateient:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 19:01:13');
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2062', '127.0.0.1', '内网IP', '{menuId=2062}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 19:03:00');
INSERT INTO `sys_oper_log` VALUES (282, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2061', '127.0.0.1', '内网IP', '{menuId=2061}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 19:03:15');
INSERT INTO `sys_oper_log` VALUES (283, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"根据患者id获取档案\",\"params\":{},\"parentId\":2064,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"seedoctor:patient:record\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 19:03:53');
INSERT INTO `sys_oper_log` VALUES (284, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2059', '127.0.0.1', '内网IP', '{menuId=2059}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 19:05:07');
INSERT INTO `sys_oper_log` VALUES (285, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"根据患者身份证获取信息\",\"params\":{},\"parentId\":2057,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"seedoctor:registration:getPatientByIdCard\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 19:06:34');
INSERT INTO `sys_oper_log` VALUES (286, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2016', '127.0.0.1', '内网IP', '{menuId=2016}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2023-02-06 22:38:38');
INSERT INTO `sys_oper_log` VALUES (287, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2063', '127.0.0.1', '内网IP', '{menuId=2063}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-06 22:38:42');
INSERT INTO `sys_oper_log` VALUES (288, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2057', '127.0.0.1', '内网IP', '{menuId=2057}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2023-02-06 22:38:45');
INSERT INTO `sys_oper_log` VALUES (289, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2066', '127.0.0.1', '内网IP', '{menuId=2066}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-06 22:38:51');
INSERT INTO `sys_oper_log` VALUES (290, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2065', '127.0.0.1', '内网IP', '{menuId=2065}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-06 22:38:55');
INSERT INTO `sys_oper_log` VALUES (291, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2064', '127.0.0.1', '内网IP', '{menuId=2064}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-06 22:38:58');
INSERT INTO `sys_oper_log` VALUES (292, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2058', '127.0.0.1', '内网IP', '{menuId=2058}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-06 22:39:01');
INSERT INTO `sys_oper_log` VALUES (293, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2057', '127.0.0.1', '内网IP', '{menuId=2057}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-06 22:39:04');
INSERT INTO `sys_oper_log` VALUES (294, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2016', '127.0.0.1', '内网IP', '{menuId=2016}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-06 22:39:07');
INSERT INTO `sys_oper_log` VALUES (295, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-06 22:47:11');
INSERT INTO `sys_oper_log` VALUES (296, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"money\",\"orderNum\":\"4\",\"menuName\":\"收支统计\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"revenue\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 00:58:33');
INSERT INTO `sys_oper_log` VALUES (297, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"dashboard\",\"orderNum\":\"4\",\"menuName\":\"药品进销存\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"drug\",\"children\":[],\"createTime\":1674927894000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2030,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 00:58:46');
INSERT INTO `sys_oper_log` VALUES (298, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"money\",\"orderNum\":\"5\",\"menuName\":\"收支统计\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"revenue\",\"children\":[],\"createTime\":1675702713000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2067,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 00:58:51');
INSERT INTO `sys_oper_log` VALUES (299, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"money\",\"orderNum\":\"5\",\"menuName\":\"数据统计\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"revenue\",\"children\":[],\"createTime\":1675702713000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2067,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 00:59:24');
INSERT INTO `sys_oper_log` VALUES (300, '菜单管理', 1, 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"money\",\"orderNum\":\"1\",\"menuName\":\"收支统计\",\"params\":{},\"parentId\":2067,\"isCache\":\"0\",\"path\":\"income\",\"component\":\"revenue/income/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"revenue:income:index\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 01:00:23');
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"search\",\"orderNum\":\"5\",\"menuName\":\"数据统计\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"revenue\",\"children\":[],\"createTime\":1675702713000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2067,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 01:00:46');
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"money\",\"orderNum\":\"1\",\"menuName\":\"收支统计\",\"params\":{},\"parentId\":2067,\"isCache\":\"0\",\"path\":\"income\",\"component\":\"revenue/income/list\",\"children\":[],\"createTime\":1675702823000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2068,\"menuType\":\"C\",\"perms\":\"revenue:income:index\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 01:05:19');
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"money\",\"orderNum\":\"1\",\"menuName\":\"收支统计\",\"params\":{},\"parentId\":2067,\"isCache\":\"0\",\"path\":\"income\",\"component\":\"revenue/income/index\",\"children\":[],\"createTime\":1675702823000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2068,\"menuType\":\"C\",\"perms\":\"revenue:income:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 01:05:32');
INSERT INTO `sys_oper_log` VALUES (304, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-07 23:21:06');
INSERT INTO `sys_oper_log` VALUES (305, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-07 23:23:25');
INSERT INTO `sys_oper_log` VALUES (306, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-07 23:32:51');
INSERT INTO `sys_oper_log` VALUES (307, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-07 23:35:00');
INSERT INTO `sys_oper_log` VALUES (308, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-07 23:35:39');
INSERT INTO `sys_oper_log` VALUES (309, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-07 23:36:44');
INSERT INTO `sys_oper_log` VALUES (310, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-07 23:37:21');
INSERT INTO `sys_oper_log` VALUES (311, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-07 23:38:05');
INSERT INTO `sys_oper_log` VALUES (312, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-07 23:44:42');
INSERT INTO `sys_oper_log` VALUES (313, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-07 23:52:04');
INSERT INTO `sys_oper_log` VALUES (314, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-07 23:52:27');
INSERT INTO `sys_oper_log` VALUES (315, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-07 23:54:06');
INSERT INTO `sys_oper_log` VALUES (316, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-07 23:54:09');
INSERT INTO `sys_oper_log` VALUES (317, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-07 23:56:06');
INSERT INTO `sys_oper_log` VALUES (318, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG1236654987985463210\",\"params\":{},\"purStatus\":\"3\"}', '{\"msg\":\"审核已通过请勿重复提交\",\"code\":500}', 0, NULL, '2023-02-08 00:05:09');
INSERT INTO `sys_oper_log` VALUES (319, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 00:24:58');
INSERT INTO `sys_oper_log` VALUES (320, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 18:51:08');
INSERT INTO `sys_oper_log` VALUES (321, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG1236654987985463210\",\"params\":{},\"purStatus\":\"3\"}', '{\"msg\":\"审核已通过请勿重复提交\",\"code\":500}', 0, NULL, '2023-02-08 18:51:15');
INSERT INTO `sys_oper_log` VALUES (322, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG1236654987985463210\",\"params\":{},\"purStatus\":\"3\"}', '{\"msg\":\"审核已通过请勿重复提交\",\"code\":500}', 0, NULL, '2023-02-08 18:51:21');
INSERT INTO `sys_oper_log` VALUES (323, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG3541236645214523654\",\"params\":{},\"purStatus\":\"2\"}', '{\"msg\":\"已处于提交状态！\",\"code\":500}', 0, NULL, '2023-02-08 18:52:16');
INSERT INTO `sys_oper_log` VALUES (324, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG1236654987985463210\",\"params\":{},\"purStatus\":\"3\"}', '{\"msg\":\"审核已通过请勿重复提交\",\"code\":500}', 0, NULL, '2023-02-08 18:52:35');
INSERT INTO `sys_oper_log` VALUES (325, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 19:28:10');
INSERT INTO `sys_oper_log` VALUES (326, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 19:32:45');
INSERT INTO `sys_oper_log` VALUES (327, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 19:35:23');
INSERT INTO `sys_oper_log` VALUES (328, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 19:36:21');
INSERT INTO `sys_oper_log` VALUES (329, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 19:36:30');
INSERT INTO `sys_oper_log` VALUES (330, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 19:38:40');
INSERT INTO `sys_oper_log` VALUES (331, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 19:44:16');
INSERT INTO `sys_oper_log` VALUES (332, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 19:47:27');
INSERT INTO `sys_oper_log` VALUES (333, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 19:48:19');
INSERT INTO `sys_oper_log` VALUES (334, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 19:48:31');
INSERT INTO `sys_oper_log` VALUES (335, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 19:49:13');
INSERT INTO `sys_oper_log` VALUES (336, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 20:01:41');
INSERT INTO `sys_oper_log` VALUES (337, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 21:38:37');
INSERT INTO `sys_oper_log` VALUES (338, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 21:44:04');
INSERT INTO `sys_oper_log` VALUES (339, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 21:51:18');
INSERT INTO `sys_oper_log` VALUES (340, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 21:55:37');
INSERT INTO `sys_oper_log` VALUES (341, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 22:20:21');
INSERT INTO `sys_oper_log` VALUES (342, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 22:20:21');
INSERT INTO `sys_oper_log` VALUES (343, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 22:20:31');
INSERT INTO `sys_oper_log` VALUES (344, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 22:20:31');
INSERT INTO `sys_oper_log` VALUES (345, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 22:21:35');
INSERT INTO `sys_oper_log` VALUES (346, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 22:41:11');
INSERT INTO `sys_oper_log` VALUES (347, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"}]}', 0, NULL, '2023-02-08 22:43:49');
INSERT INTO `sys_oper_log` VALUES (348, '供应商管理', 1, 'com.ruoyi.project.medicine.controller.SupplierController.add()', 'POST', 1, 'admin', NULL, '/medicine/supplier', '127.0.0.1', '内网IP', '{\"supplierName\":\"长春高新\",\"address\":\"吉林省长春市同志街2400号火炬大厦5层\",\"telephoneNum\":\"15463249879\",\"params\":{},\"createBy\":\"admin\",\"contact\":\"陈XX\",\"bankCount\":\"CC8745123654125436982\",\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'bank_count\' at row 1\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\SupplierMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.SupplierMapper.insertSupplier-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_supplier(          supplier_name,           contact,           telephone_num,           bank_count,           address,           status,           create_by,          create_time         )         values (          ?,           ?,           ?,           ?,           ?,           ?,           ?,          sysdate()         )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'bank_count\' at row 1\n; Data truncation: Data too long for column \'bank_count\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'bank_count\' at row 1', '2023-02-08 22:47:36');
INSERT INTO `sys_oper_log` VALUES (349, '供应商管理', 1, 'com.ruoyi.project.medicine.controller.SupplierController.add()', 'POST', 1, 'admin', NULL, '/medicine/supplier', '127.0.0.1', '内网IP', '{\"supplierName\":\"长春高新\",\"address\":\"吉林省长春市同志街2400号火炬大厦5层\",\"telephoneNum\":\"15463249879\",\"params\":{},\"createBy\":\"admin\",\"contact\":\"陈XX\",\"bankCount\":\"CC8745123654125436982\",\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'bank_count\' at row 1\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\SupplierMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.SupplierMapper.insertSupplier-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_supplier(          supplier_name,           contact,           telephone_num,           bank_count,           address,           status,           create_by,          create_time         )         values (          ?,           ?,           ?,           ?,           ?,           ?,           ?,          sysdate()         )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'bank_count\' at row 1\n; Data truncation: Data too long for column \'bank_count\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'bank_count\' at row 1', '2023-02-08 22:47:43');
INSERT INTO `sys_oper_log` VALUES (350, '供应商管理', 1, 'com.ruoyi.project.medicine.controller.SupplierController.add()', 'POST', 1, 'admin', NULL, '/medicine/supplier', '127.0.0.1', '内网IP', '{\"supplierName\":\"长春高新创投集团\",\"address\":\"吉林省长春市同志街2400号火炬大厦5层\",\"telephoneNum\":\"19854632441\",\"params\":{},\"createBy\":\"admin\",\"contact\":\"陈XX\",\"bankCount\":\"8541123654789632147\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 23:10:09');
INSERT INTO `sys_oper_log` VALUES (351, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"},{\"supplierId\":6,\"supplierName\":\"长春高新创投集团\"}]}', 0, NULL, '2023-02-08 23:10:18');
INSERT INTO `sys_oper_log` VALUES (352, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"},{\"supplierId\":6,\"supplierName\":\"长春高新创投集团\"}]}', 0, NULL, '2023-02-08 23:12:21');
INSERT INTO `sys_oper_log` VALUES (353, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"},{\"supplierId\":6,\"supplierName\":\"长春高新创投集团\"}]}', 0, NULL, '2023-02-08 23:15:54');
INSERT INTO `sys_oper_log` VALUES (354, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"},{\"supplierId\":6,\"supplierName\":\"长春高新创投集团\"}]}', 0, NULL, '2023-02-08 23:16:59');
INSERT INTO `sys_oper_log` VALUES (355, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"},{\"supplierId\":6,\"supplierName\":\"长春高新创投集团\"}]}', 0, NULL, '2023-02-08 23:17:42');
INSERT INTO `sys_oper_log` VALUES (356, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"},{\"supplierId\":6,\"supplierName\":\"长春高新创投集团\"}]}', 0, NULL, '2023-02-08 23:18:56');
INSERT INTO `sys_oper_log` VALUES (357, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"},{\"supplierId\":6,\"supplierName\":\"长春高新创投集团\"}]}', 0, NULL, '2023-02-08 23:19:12');
INSERT INTO `sys_oper_log` VALUES (358, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"},{\"supplierId\":6,\"supplierName\":\"长春高新创投集团\"}]}', 0, NULL, '2023-02-08 23:22:47');
INSERT INTO `sys_oper_log` VALUES (359, '采购管理', 1, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.add()', 'POST', 1, 'admin', NULL, '/medicine/purchase', '127.0.0.1', '内网IP', '{\"params\":{},\"purTotal\":1000,\"createBy\":\"admin\",\"purName\":\"admin\",\"purPrice\":3.13}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'pur_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicinePurchaseMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicinePurchaseMapper.insertMedicinePurchase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_purchase(                                        pur_price,                     pur_name,                     create_by,          create_time         )values (                                        ?,                     ?,                     ?,          sysdate()         )\r\n### Cause: java.sql.SQLException: Field \'pur_id\' doesn\'t have a default value\n; Field \'pur_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'pur_id\' doesn\'t have a default value', '2023-02-08 23:23:16');
INSERT INTO `sys_oper_log` VALUES (360, '采购管理', 1, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.add()', 'POST', 1, 'admin', NULL, '/medicine/purchase', '127.0.0.1', '内网IP', '{\"params\":{},\"purTotal\":1000,\"createBy\":\"admin\",\"purName\":\"admin\",\"purPrice\":3.13}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'pur_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicinePurchaseMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicinePurchaseMapper.insertMedicinePurchase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_purchase(                                        pur_price,                     pur_name,                     create_by,          create_time         )values (                                        ?,                     ?,                     ?,          sysdate()         )\r\n### Cause: java.sql.SQLException: Field \'pur_id\' doesn\'t have a default value\n; Field \'pur_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'pur_id\' doesn\'t have a default value', '2023-02-08 23:28:27');
INSERT INTO `sys_oper_log` VALUES (361, '采购管理', 1, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.add()', 'POST', 1, 'admin', NULL, '/medicine/purchase', '127.0.0.1', '内网IP', '{\"purCount\":1000,\"params\":{},\"purTotal\":1000,\"createBy\":\"admin\",\"purName\":\"admin\",\"purPrice\":3.13}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'pur_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicinePurchaseMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicinePurchaseMapper.insertMedicinePurchase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_purchase(                                        pur_price,           pur_count,           pur_name,                     create_by,          create_time         )values (                                        ?,           ?,           ?,                     ?,          sysdate()         )\r\n### Cause: java.sql.SQLException: Field \'pur_id\' doesn\'t have a default value\n; Field \'pur_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'pur_id\' doesn\'t have a default value', '2023-02-08 23:28:27');
INSERT INTO `sys_oper_log` VALUES (362, '采购管理', 1, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.add()', 'POST', 1, 'admin', NULL, '/medicine/purchase', '127.0.0.1', '内网IP', '{\"purCount\":1000,\"params\":{},\"purTotal\":1000,\"createBy\":\"admin\",\"purName\":\"admin\",\"purPrice\":3.13}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'pur_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicinePurchaseMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicinePurchaseMapper.insertMedicinePurchase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_purchase(                                        pur_price,           pur_count,           pur_name,                     create_by,          create_time         )values (                                        ?,           ?,           ?,                     ?,          sysdate()         )\r\n### Cause: java.sql.SQLException: Field \'pur_id\' doesn\'t have a default value\n; Field \'pur_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'pur_id\' doesn\'t have a default value', '2023-02-08 23:29:19');
INSERT INTO `sys_oper_log` VALUES (363, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"},{\"supplierId\":6,\"supplierName\":\"长春高新创投集团\"}]}', 0, NULL, '2023-02-08 23:30:57');
INSERT INTO `sys_oper_log` VALUES (364, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"},{\"supplierId\":6,\"supplierName\":\"长春高新创投集团\"}]}', 0, NULL, '2023-02-08 23:40:20');
INSERT INTO `sys_oper_log` VALUES (365, '采购管理', 1, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.add()', 'POST', 1, 'admin', NULL, '/medicine/purchase', '127.0.0.1', '内网IP', '{\"supplierId\":6,\"medicineId\":5,\"purCount\":1000,\"params\":{},\"createBy\":\"admin\",\"purName\":\"admin\",\"purPrice\":3.13}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'admin\', \n        sysdate()\n        )\' at line 19\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicinePurchaseMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicinePurchaseMapper.insertMedicinePurchase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_purchase(                    supplier_id,           medicine_id,           pur_price,           pur_count,           pur_name,                     create_by,          create_time         )values (                    ?,           ?,           ?,           ?,           ?,          sysdate()          ?,          sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'admin\', \n        sysdate()\n        )\' at line 19\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'admin\', \n        sysdate()\n        )\' at line 19', '2023-02-08 23:40:37');
INSERT INTO `sys_oper_log` VALUES (366, '采购管理', 1, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.add()', 'POST', 1, 'admin', NULL, '/medicine/purchase', '127.0.0.1', '内网IP', '{\"supplierId\":6,\"medicineId\":5,\"purCount\":1000,\"params\":{},\"createBy\":\"admin\",\"purName\":\"admin\",\"purPrice\":3.13}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'admin\', \n        sysdate()\n        )\' at line 19\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicinePurchaseMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicinePurchaseMapper.insertMedicinePurchase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_purchase(                    supplier_id,           medicine_id,           pur_price,           pur_count,           pur_name,                     create_by,          create_time         )values (                    ?,           ?,           ?,           ?,           ?,          sysdate()          ?,          sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'admin\', \n        sysdate()\n        )\' at line 19\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'admin\', \n        sysdate()\n        )\' at line 19', '2023-02-08 23:40:51');
INSERT INTO `sys_oper_log` VALUES (367, '采购管理', 1, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.add()', 'POST', 1, 'admin', NULL, '/medicine/purchase', '127.0.0.1', '内网IP', '{\"supplierId\":6,\"medicineId\":5,\"purId\":\"CG7022457537778438144\",\"purCount\":1000,\"params\":{},\"createBy\":\"admin\",\"purName\":\"admin\",\"purPrice\":3.13}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'admin\', \n        sysdate()\n        )\' at line 19\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicinePurchaseMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicinePurchaseMapper.insertMedicinePurchase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_purchase(          pur_id,           supplier_id,           medicine_id,           pur_price,           pur_count,           pur_name,                     create_by,          create_time         )values (          ?,           ?,           ?,           ?,           ?,           ?,          sysdate()          ?,          sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'admin\', \n        sysdate()\n        )\' at line 19\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'admin\', \n        sysdate()\n        )\' at line 19', '2023-02-09 00:07:00');
INSERT INTO `sys_oper_log` VALUES (368, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"},{\"supplierId\":6,\"supplierName\":\"长春高新创投集团\"}]}', 0, NULL, '2023-02-09 00:07:06');
INSERT INTO `sys_oper_log` VALUES (369, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"},{\"supplierId\":6,\"supplierName\":\"长春高新创投集团\"}]}', 0, NULL, '2023-02-09 00:10:24');
INSERT INTO `sys_oper_log` VALUES (370, '采购管理', 1, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.add()', 'POST', 1, 'admin', NULL, '/medicine/purchase', '127.0.0.1', '内网IP', '{\"supplierId\":6,\"medicineId\":5,\"purId\":\"CG7022458464677679104\",\"purCount\":1000,\"params\":{},\"createBy\":\"admin\",\"purName\":\"admin\",\"purPrice\":3.13}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'admin\', \n        sysdate()\n        )\' at line 19\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicinePurchaseMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicinePurchaseMapper.insertMedicinePurchase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_purchase(          pur_id,           supplier_id,           medicine_id,           pur_price,           pur_count,           pur_name,                     create_by,          create_time         )values (          ?,           ?,           ?,           ?,           ?,           ?,          sysdate()          ?,          sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'admin\', \n        sysdate()\n        )\' at line 19\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'admin\', \n        sysdate()\n        )\' at line 19', '2023-02-09 00:10:41');
INSERT INTO `sys_oper_log` VALUES (371, '采购管理', 1, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.add()', 'POST', 1, 'admin', NULL, '/medicine/purchase', '127.0.0.1', '内网IP', '{\"supplierId\":6,\"medicineId\":5,\"purId\":\"CG7022459284462784512\",\"purCount\":1000,\"params\":{},\"createBy\":\"admin\",\"purName\":\"admin\",\"purPrice\":3.13}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [D:\\WorkSpace\\RuoYi-Vue-fast-master\\target\\classes\\mybatis\\medicine\\MedicinePurchaseMapper.xml]\r\n### The error may involve com.ruoyi.project.medicine.mapper.MedicinePurchaseMapper.insertMedicinePurchase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into medicine_purchase(          pur_id,           supplier_id,           medicine_id,           pur_price,           pur_count,           pur_name,                     create_by,          create_time         )values (          ?,           ?,           ?,           ?,           ?,           ?,          sysdate(),          ?,          sysdate()         )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2023-02-09 00:13:56');
INSERT INTO `sys_oper_log` VALUES (372, '采购管理', 1, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.add()', 'POST', 1, 'admin', NULL, '/medicine/purchase', '127.0.0.1', '内网IP', '{\"supplierId\":6,\"medicineId\":5,\"purId\":\"CG7022462809729159168\",\"purCount\":1000,\"params\":{},\"createBy\":\"admin\",\"purName\":\"admin\",\"purPrice\":3.13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 00:29:54');
INSERT INTO `sys_oper_log` VALUES (373, '采购管理', 1, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.add()', 'POST', 1, 'admin', NULL, '/medicine/purchase', '127.0.0.1', '内网IP', '{\"supplierId\":6,\"medicineId\":5,\"purId\":\"CG7022463395384020992\",\"purCount\":1000,\"params\":{},\"createBy\":\"admin\",\"purName\":\"admin\",\"purPrice\":3.13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 00:30:16');
INSERT INTO `sys_oper_log` VALUES (374, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"},{\"supplierId\":6,\"supplierName\":\"长春高新创投集团\"}]}', 0, NULL, '2023-02-09 00:32:11');
INSERT INTO `sys_oper_log` VALUES (375, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"},{\"supplierId\":6,\"supplierName\":\"长春高新创投集团\"}]}', 0, NULL, '2023-02-09 00:35:48');
INSERT INTO `sys_oper_log` VALUES (376, '供应商管理', 0, 'com.ruoyi.project.medicine.controller.SupplierController.getSupplierList()', 'GET', 1, 'admin', NULL, '/medicine/supplier/getSupplierList', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"supplierId\":1,\"supplierName\":\"云南英广贺易有限公司\\n\"},{\"supplierId\":2,\"supplierName\":\"厦门贺竹贸易有限公司\"},{\"supplierId\":3,\"supplierName\":\"上海益贺贸易有限公司\"},{\"supplierId\":4,\"supplierName\":\"广州市贺易时贸易有限公司\"},{\"supplierId\":5,\"supplierName\":\"广州市森大贸易有限公司\"},{\"supplierId\":6,\"supplierName\":\"长春高新创投集团\"}]}', 0, NULL, '2023-02-09 00:37:25');
INSERT INTO `sys_oper_log` VALUES (377, '采购管理', 2, 'com.ruoyi.project.medicine.controller.MedicinePurchaseController.submitAudit()', 'PUT', 1, 'admin', NULL, '/medicine/purchase/submitAudit', '127.0.0.1', '内网IP', '{\"purId\":\"CG7022463395384020992\",\"params\":{},\"purStatus\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"提交审核成功\",\"code\":200,\"data\":1}', 0, NULL, '2023-02-09 00:37:29');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-01-02 23:33:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-01-02 23:33:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-01-02 23:33:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-01-02 23:33:01', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-01-02 23:33:02', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '智慧医疗', '00', 'zhyl@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-01-02 23:33:01', 'admin', '2023-01-02 23:33:01', '', '2023-01-10 22:24:51', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-01-02 23:33:01', 'admin', '2023-01-02 23:33:01', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, 100, 'wqewea', 'qewqe', '00', 'ewqwe@qq.com', '15487965442', '0', '', '$2a$10$6JmSmwm.tD0zCScSPHhZf./bswH2EkhkFt2FIMw5TQjbLzjZ5v3B.', '0', '0', '', NULL, 'admin', '2023-01-16 01:04:29', '', NULL, 'sda');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 2);

SET FOREIGN_KEY_CHECKS = 1;
