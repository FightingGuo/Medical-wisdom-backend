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

 Date: 29/01/2023 10:42:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for media_notice
-- ----------------------------
DROP TABLE IF EXISTS `media_notice`;
CREATE TABLE `media_notice`  (
  `notice_id` bigint NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `notice_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告类型',
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
INSERT INTO `media_notice` VALUES (1, '关于2023年度卫生管理专业资格考试的通知', '通知', '0', '各部门、各科室：\r\n\r\n转安徽省卫健委通知，2023年度卫生管理专业资格考试报名已经开始，现将有关有关事项通知如下：\r\n\r\n一、报名人员应取得医学门类专业或医学院校相关专业学历，并满足《人力资源社会保障部 国家卫生健康委 国家中医药局关于深化卫生专业技术人员职称制度改革的指导意见》（人社部发〔2021〕51号）、《人力资源社会保障部办公厅关于进一步做好职称评审工作的通知》（人社厅发〔2022〕60号）、《关于印发〈安徽省卫生系列卫生管理专业职称评审标准条件（试行）〉的通知》（皖卫人秘〔2022〕128号）中规定的报考条件。报名参加2023年度的考试人员，其取得学历和从事本专业工作年限计算均截止到2022年12月31日。', '2023-01-29 10:19:16', 'admin', NULL, NULL);
INSERT INTO `media_notice` VALUES (2, '关于做好2023年上半年学位论文答辩工作的通知', '公告', '0', '各学科学位点：\r\n\r\n2023年上半年申请学位论文答辩工作已经开始,根据校研究生学院通知文件精神，现将2023年上半年学位论文答辩工作的通知如下：\r\n\r\n一、学位论文质量监控工作（工作程序第一步）\r\n\r\n1.2023年上半年所有统招硕、博士研究生须在2023年2月10日（周五）前将学位论文电子版（要求为doc格式，符合学校学位论文撰写要求规定，以“作者姓名-学号-论文题目”方式命名）和复制比检测汇总表（附件1：纸质版、电子版）以学科为单位交医院研工部，电子版发至邮箱：ayfypyb3665@163.com。', '2023-01-29 10:23:06', 'admin', NULL, NULL);
INSERT INTO `media_notice` VALUES (3, '关于开展2023年度卫生专业技术中、初级资格考试工作的通知', '通知', '0', '各科室：\r\n\r\n根据安徽省卫健委通知要求，现将2023年度全国卫生专业技术资格中、初级资格考试工作有关事项通知如下：\r\n\r\n一、报名条件\r\n\r\n1.报名人员应符合《人力资源社会保障部 国家卫生健康委 国家中医药局关于深化卫生专业技术人员职称制度改革的指导意见》（人社部发〔2021〕51号）、《安徽省人民政府办公厅关于印发安徽省加快医学教育创新发展实施方案的通知》（皖政办〔2020〕23号）中规定的报名条件。', '2023-01-29 10:23:45', 'admin', NULL, NULL);
INSERT INTO `media_notice` VALUES (4, '关于开展我院2022年度个人继续医学教育电子学分审核的通知', '公告', '0', '各科室、各部门：\r\n\r\n2022年度个人继续医学教育电子学分审核工作已开始。请各科室通知本科室人员于2023年2月10日前上网（http://icme.haoyisheng.com）完成个人学分录入和个人学分查询，现将学分录入、审核的具体要求和流程通知如下：\r\n\r\n一、按安徽省继续医学教育委员会办公室的要求，2022年继续医学教育个人年度继续教育学分达标要求和计算形式：\r\n\r\n1、2022年度个人年度继续教育学分达标要求：\r\n\r\n2022年度学分达标计算不分Ⅰ、Ⅱ类继教学分。\r\n\r\n中级、副高、正高：总分≥25；\r\n\r\n初级：学分≥20；', '2023-01-29 10:26:03', 'admin', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
