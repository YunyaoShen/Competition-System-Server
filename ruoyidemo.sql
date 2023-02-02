/*
 Navicat Premium Data Transfer

 Source Server         : syy
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : ruoyidemo

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 02/02/2023 12:35:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES (5, 'sys_tuser', '用户信息表', NULL, NULL, 'SysUser', 'crud', 'com.ruoyi.system', 'system', 'tuser', '单位人员', 'Syy', '0', '/', '{\"parentMenuId\":2004}', 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:08', NULL);
INSERT INTO `gen_table` VALUES (6, 'sys_suser', '学生信息表', NULL, NULL, 'SysSuser', 'crud', 'com.ruoyi.system', 'system', 'suser', '学生账号', 'syy', '0', '/', '{\"parentMenuId\":\"2004\"}', 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10', NULL);
INSERT INTO `gen_table` VALUES (7, 'sys_activity', '竞赛信息表', NULL, NULL, 'SysActivity', 'crud', 'com.ruoyi.system', 'system', 'activity', '竞赛管理', 'syy', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2022-09-08 16:22:43', '', '2022-09-08 18:20:10', NULL);
INSERT INTO `gen_table` VALUES (8, 'sys_organization', '机构信息表', NULL, NULL, 'SysOrganization', 'crud', 'com.ruoyi.system', 'system', 'organization', '机构管理', 'syy', '0', '/', '{\"parentMenuId\":2008}', 'admin', '2022-09-08 17:16:11', '', '2022-09-08 17:18:44', NULL);
INSERT INTO `gen_table` VALUES (9, 'sys_activity_type', '活动类型表', NULL, NULL, 'SysActivityType', 'crud', 'com.ruoyi.system', 'system', 'activitytype', '活动类型', 'syy', '0', '/', '{\"parentMenuId\":2008}', 'admin', '2022-09-08 17:41:04', '', '2022-09-08 17:43:57', NULL);
INSERT INTO `gen_table` VALUES (10, 't_team_activity', '123', NULL, NULL, 'TeamActivity', 'crud', 'com.ruoyi.system', 'system', 'teamactivity', 'useractivity', 'ruoyi', '0', '/', '{}', '', '2022-12-06 19:34:22', '', '2022-12-07 09:02:04', NULL);
INSERT INTO `gen_table` VALUES (12, 't_activity', 'Activity', NULL, NULL, 'Activity', 'crud', 'com.ruoyi.system', 'system', 'activity', 'Activity', 'ruoyi', '0', '/', '{}', '', '2022-12-06 20:29:51', '', '2022-12-06 20:43:36', NULL);
INSERT INTO `gen_table` VALUES (13, 't_user_activity', 'UserActivity', NULL, NULL, 'UserActivity', 'crud', 'com.ruoyi.system', 'system', 'useractivity', 'UserActivity', 'ruoyi', '0', '/', '{}', '', '2022-12-07 05:59:04', '', '2022-12-07 06:35:26', NULL);
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` VALUES (31, '5', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (32, '5', 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (33, '5', 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (34, '5', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (35, '5', 'user_type', '用户类型（00系统用户）', 'varchar(2)', 'String', 'userType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (36, '5', 'orgnization', '所属机构', 'varchar(255)', 'String', 'orgnization', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (37, '5', 'job', '职位', 'varchar(255)', 'String', 'job', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (38, '5', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (39, '5', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (40, '5', 'direction', '研究方向', 'varchar(255)', 'String', 'direction', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (41, '5', 'user_remark', '用户简介', 'varchar(255)', 'String', 'userRemark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (42, '5', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', NULL, '1', 'EQ', 'input', '', 12, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (43, '5', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', NULL, '1', 'EQ', 'input', '', 13, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (44, '5', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 14, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (45, '5', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (46, '5', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, '1', '1', NULL, '1', 'EQ', 'input', '', 16, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (47, '5', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', NULL, '1', 'EQ', 'datetime', '', 17, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (48, '5', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (49, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (50, '5', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 20, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (51, '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 21, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (52, '5', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'textarea', '', 22, 'admin', '2022-09-06 15:24:20', '', '2022-09-07 16:24:09');
INSERT INTO `gen_table_column` VALUES (53, '6', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (54, '6', 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (55, '6', 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (56, '6', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (57, '6', 'user_type', '身份信息', 'int', 'Long', 'userType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (58, '6', 'student_id', '学号', 'int', 'Long', 'studentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (59, '6', 'orgnization', '学校', 'varchar(255)', 'String', 'orgnization', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (60, '6', 'academy', '学院', 'varchar(255)', 'String', 'academy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (61, '6', 'major', '专业', 'varchar(255)', 'String', 'major', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (62, '6', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (63, '6', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (64, '6', 'user_remark', '用户简介', 'varchar(255)', 'String', 'userRemark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 12, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (65, '6', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (66, '6', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (67, '6', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 15, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (68, '6', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (69, '6', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (70, '6', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 18, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (71, '6', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (72, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 20, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (73, '6', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 21, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (74, '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 22, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (75, '6', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 23, 'admin', '2022-09-08 02:33:20', '', '2022-09-08 02:52:10');
INSERT INTO `gen_table_column` VALUES (76, '7', 'activity_id', '竞赛ID', 'bigint', 'Long', 'activityId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-09-08 16:22:44', '', '2022-09-08 18:20:10');
INSERT INTO `gen_table_column` VALUES (77, '7', 'activity_name', '竞赛名称', 'varchar(255)', 'String', 'activityName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-09-08 16:22:44', '', '2022-09-08 18:20:10');
INSERT INTO `gen_table_column` VALUES (78, '7', 'start_time', '开始时间', 'datetime', 'Date', 'startTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2022-09-08 16:22:44', '', '2022-09-08 18:20:10');
INSERT INTO `gen_table_column` VALUES (79, '7', 'end_time', '结束时间', 'datetime', 'Date', 'endTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2022-09-08 16:22:44', '', '2022-09-08 18:20:10');
INSERT INTO `gen_table_column` VALUES (80, '7', 'activity_scale', '比赛规模', 'int', 'Long', 'activityScale', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-09-08 16:22:44', '', '2022-09-08 18:20:10');
INSERT INTO `gen_table_column` VALUES (81, '7', 'activity_declarer', '申报人', 'varchar(255)', 'String', 'activityDeclarer', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-09-08 16:22:44', '', '2022-09-08 18:20:10');
INSERT INTO `gen_table_column` VALUES (82, '7', 'activity_place', '比赛地点', 'varchar(255)', 'String', 'activityPlace', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-09-08 16:22:44', '', '2022-09-08 18:20:10');
INSERT INTO `gen_table_column` VALUES (83, '7', 'activity_organizer', '组织单位', 'varchar(255)', 'String', 'activityOrganizer', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-09-08 16:22:44', '', '2022-09-08 18:20:10');
INSERT INTO `gen_table_column` VALUES (84, '7', 'activity_type', '比赛类型', 'varchar(255)', 'String', 'activityType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 9, 'admin', '2022-09-08 16:22:44', '', '2022-09-08 18:20:10');
INSERT INTO `gen_table_column` VALUES (85, '7', 'activity_state', '0待审核，1审核通过，2审核不通过', 'int', 'Long', 'activityState', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-09-08 16:22:44', '', '2022-09-08 18:20:10');
INSERT INTO `gen_table_column` VALUES (86, '8', 'organization_id', '机构ID', 'bigint', 'Long', 'organizationId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-09-08 17:16:11', '', '2022-09-08 17:18:44');
INSERT INTO `gen_table_column` VALUES (87, '8', 'organization_name', '机构名称', 'varchar(255)', 'String', 'organizationName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-09-08 17:16:11', '', '2022-09-08 17:18:44');
INSERT INTO `gen_table_column` VALUES (88, '8', 'organization_field', '机构地点', 'varchar(255)', 'String', 'organizationField', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-09-08 17:16:11', '', '2022-09-08 17:18:44');
INSERT INTO `gen_table_column` VALUES (89, '8', 'organization_pho', '联系电话', 'varchar(255)', 'String', 'organizationPho', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-09-08 17:16:11', '', '2022-09-08 17:18:44');
INSERT INTO `gen_table_column` VALUES (90, '8', 'organization_remark', '机构给描述', 'varchar(255)', 'String', 'organizationRemark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2022-09-08 17:16:11', '', '2022-09-08 17:18:44');
INSERT INTO `gen_table_column` VALUES (91, '9', 'type_id', '类型ID', 'bigint', 'Long', 'typeId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-09-08 17:41:04', '', '2022-09-08 17:43:57');
INSERT INTO `gen_table_column` VALUES (92, '9', 'type_name', '活动类型', 'varchar(255)', 'String', 'typeName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-09-08 17:41:04', '', '2022-09-08 17:43:57');
INSERT INTO `gen_table_column` VALUES (93, '9', 'type_remark', '活动类型备注', 'varchar(255)', 'String', 'typeRemark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2022-09-08 17:41:04', '', '2022-09-08 17:43:57');
INSERT INTO `gen_table_column` VALUES (94, '10', 'team_id', '队伍编号', 'varchar(48)', 'String', 'teamId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, '', '2022-12-06 19:34:23', '', '2022-12-07 09:02:04');
INSERT INTO `gen_table_column` VALUES (95, '10', 'activity_id', '赛程编号', 'varchar(48)', 'String', 'activityId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, '', '2022-12-06 19:34:23', '', '2022-12-07 09:02:04');
INSERT INTO `gen_table_column` VALUES (96, '10', 'date', '日期', 'bigint', 'Long', 'date', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2022-12-06 19:34:23', '', '2022-12-07 09:02:04');
INSERT INTO `gen_table_column` VALUES (97, '10', 'file_id', '参赛作品', 'varchar(48)', 'String', 'fileId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2022-12-06 19:34:23', '', '2022-12-07 09:02:04');
INSERT INTO `gen_table_column` VALUES (98, '10', 'activity_state', '参赛状态', 'int', 'Long', 'activityState', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, '', '2022-12-06 19:34:23', '', '2022-12-07 09:02:04');
INSERT INTO `gen_table_column` VALUES (104, '12', 'activity_id', '赛程编码', 'varchar(48)', 'String', 'activityId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, '', '2022-12-06 20:29:51', '', '2022-12-06 20:43:36');
INSERT INTO `gen_table_column` VALUES (105, '12', 'activity_name', '赛程名称', 'varchar(255)', 'String', 'activityName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, '', '2022-12-06 20:29:51', '', '2022-12-06 20:43:36');
INSERT INTO `gen_table_column` VALUES (106, '12', 'competition_id', '所属比赛', 'varchar(48)', 'String', 'competitionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2022-12-06 20:29:51', '', '2022-12-06 20:43:36');
INSERT INTO `gen_table_column` VALUES (107, '12', 'order', '轮次', 'bigint', 'Long', 'order', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2022-12-06 20:29:51', '', '2022-12-06 20:43:36');
INSERT INTO `gen_table_column` VALUES (108, '12', 'activity_starttime', '赛程开始时间', 'varchar(48)', 'String', 'activityStarttime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, '', '2022-12-06 20:29:51', '', '2022-12-06 20:43:36');
INSERT INTO `gen_table_column` VALUES (109, '12', 'activity_endtime', '赛程结束时间', 'varchar(48)', 'String', 'activityEndtime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, '', '2022-12-06 20:29:51', '', '2022-12-06 20:43:36');
INSERT INTO `gen_table_column` VALUES (110, '13', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, '', '2022-12-07 05:59:04', '', '2022-12-07 06:35:26');
INSERT INTO `gen_table_column` VALUES (111, '13', 'activity_id', '赛程ID', 'varchar(48)', 'String', 'activityId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, '', '2022-12-07 05:59:04', '', '2022-12-07 06:35:26');
INSERT INTO `gen_table_column` VALUES (112, '13', 'date', '日期', 'bigint', 'Long', 'date', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2022-12-07 05:59:04', '', '2022-12-07 06:35:26');
INSERT INTO `gen_table_column` VALUES (113, '13', 'file_id', '比赛作品', 'varchar(48)', 'String', 'fileId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2022-12-07 05:59:04', '', '2022-12-07 06:35:26');
INSERT INTO `gen_table_column` VALUES (114, '13', 'activity_state', '赛程状态', 'int', 'Long', 'activityState', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, '', '2022-12-07 05:59:04', '', '2022-12-07 06:35:26');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_activity
-- ----------------------------
DROP TABLE IF EXISTS `sys_activity`;
CREATE TABLE `sys_activity` (
  `activity_id` bigint NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(255) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `activity_scale` int DEFAULT NULL,
  `activity_declarer` varchar(255) DEFAULT NULL,
  `activity_place` varchar(255) DEFAULT NULL,
  `activity_organizer` varchar(255) DEFAULT NULL,
  `activity_type` varchar(255) DEFAULT NULL,
  `activity_state` int DEFAULT NULL COMMENT '0待审核，1审核通过，2审核不通过',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_activity
-- ----------------------------
BEGIN;
INSERT INTO `sys_activity` VALUES (3, '测试', '2022-09-05 00:00:00', '2022-09-23 00:00:00', 13, '123', '123', '123', NULL, NULL);
INSERT INTO `sys_activity` VALUES (4, '1231', '2022-09-05 00:00:00', '2022-09-15 00:00:00', 123, '12345', 'cvb', 'wefgh', NULL, NULL);
INSERT INTO `sys_activity` VALUES (5, 'awe', '2022-09-13 00:00:00', '2022-09-23 00:00:00', 123, '12', '122', '1244', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_activity_tuser
-- ----------------------------
DROP TABLE IF EXISTS `sys_activity_tuser`;
CREATE TABLE `sys_activity_tuser` (
  `activity_id` int NOT NULL,
  `activity_admin` int DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_activity_tuser
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_activity_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_activity_type`;
CREATE TABLE `sys_activity_type` (
  `type_id` bigint NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  `type_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_activity_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_activity_type` VALUES (2, '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for sys_competition
-- ----------------------------
DROP TABLE IF EXISTS `sys_competition`;
CREATE TABLE `sys_competition` (
  `competition_id` bigint NOT NULL,
  `competition_scale` bigint DEFAULT NULL,
  `competition_declarer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `competition_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `competition_organizer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `competition_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `competition_state` int DEFAULT NULL COMMENT '0待审核，1审核通过，2审核不通过',
  PRIMARY KEY (`competition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_competition
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-08-27 17:55:59', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-08-27 17:55:59', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-08-27 17:55:59', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2022-08-27 17:55:59', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2022-08-27 17:55:59', 'admin', '2022-09-04 12:01:12', '是否开启注册用户功能（true开启，false关闭）');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-27 17:55:59', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-27 17:55:59', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-27 17:55:59', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-27 17:55:59', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-27 17:55:59', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-27 17:55:59', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-27 17:55:59', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-27 17:55:59', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-27 17:55:59', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-27 17:55:59', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '停用状态');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '登录状态列表');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-08-27 17:55:59', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=793 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-08-27 17:59:11');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-01 17:49:29');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-01 20:37:09');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-01 21:32:10');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-03 17:44:17');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-09-03 18:47:10');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-03 18:47:15');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-03 19:20:41');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-04 00:31:22');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-04 11:53:57');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-04 12:00:37');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-04 12:00:45');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-04 12:01:18');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-09-04 12:01:22');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-04 12:01:26');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-04 12:04:00');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-04 12:04:11');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-04 12:04:22');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码已失效', '2022-09-04 12:10:06');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-04 12:10:12');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-09-05 00:35:25');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-05 00:35:30');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-05 00:51:32');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-05 00:51:40');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-05 00:51:54');
INSERT INTO `sys_logininfor` VALUES (125, 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-05 00:52:01');
INSERT INTO `sys_logininfor` VALUES (126, 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-05 00:52:20');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-05 00:52:39');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-05 00:56:14');
INSERT INTO `sys_logininfor` VALUES (129, 'Syy', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-05 00:56:21');
INSERT INTO `sys_logininfor` VALUES (130, 'Syy', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-05 00:56:49');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-05 00:57:26');
INSERT INTO `sys_logininfor` VALUES (132, 'Syy', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-05 01:13:50');
INSERT INTO `sys_logininfor` VALUES (133, 'Syy', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-09-05 01:13:59');
INSERT INTO `sys_logininfor` VALUES (134, 'Syy', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2022-09-05 01:23:54');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-09-05 01:23:58');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2022-09-05 01:24:08');
INSERT INTO `sys_logininfor` VALUES (137, 'Syy', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '验证码错误', '2022-09-05 01:24:18');
INSERT INTO `sys_logininfor` VALUES (138, 'Syy', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-09-05 01:24:27');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-05 02:51:54');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-05 11:47:09');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-05 21:41:54');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-06 00:56:35');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-06 01:44:28');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-06 02:46:47');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-06 14:57:13');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-06 15:22:55');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-06 15:22:59');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-06 16:46:06');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-06 18:35:17');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-07 01:28:13');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-07 01:33:32');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '登录用户：admin 不存在', '2022-09-07 01:33:58');
INSERT INTO `sys_logininfor` VALUES (153, 'admina', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-07 01:34:07');
INSERT INTO `sys_logininfor` VALUES (154, 'admina', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-07 01:34:24');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-07 01:34:28');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-07 01:38:19');
INSERT INTO `sys_logininfor` VALUES (157, 'Syy', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-07 01:38:31');
INSERT INTO `sys_logininfor` VALUES (158, 'syy', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-07 01:38:47');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-07 01:38:53');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-07 01:42:18');
INSERT INTO `sys_logininfor` VALUES (161, 'Syy', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-07 01:42:27');
INSERT INTO `sys_logininfor` VALUES (162, 'syy', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-07 01:43:24');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-07 01:43:30');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-07 03:41:36');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-09-07 16:03:59');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-07 16:04:05');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-07 17:53:59');
INSERT INTO `sys_logininfor` VALUES (168, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-07 17:54:09');
INSERT INTO `sys_logininfor` VALUES (169, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-07 17:54:21');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-07 17:54:24');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-07 18:32:25');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-08 00:26:22');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-08 02:23:00');
INSERT INTO `sys_logininfor` VALUES (174, 'syy', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-08 02:23:16');
INSERT INTO `sys_logininfor` VALUES (175, 'syy', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-08 02:30:51');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-08 02:31:04');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-09-08 04:32:11');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-08 04:32:14');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-08 05:54:48');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-08 15:17:33');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-08 17:35:59');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-08 18:50:36');
INSERT INTO `sys_logininfor` VALUES (183, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-08 18:50:48');
INSERT INTO `sys_logininfor` VALUES (184, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-08 18:57:11');
INSERT INTO `sys_logininfor` VALUES (185, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-08 18:57:23');
INSERT INTO `sys_logininfor` VALUES (186, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-08 18:57:40');
INSERT INTO `sys_logininfor` VALUES (187, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-08 18:57:51');
INSERT INTO `sys_logininfor` VALUES (188, 'master', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-09-08 19:00:04');
INSERT INTO `sys_logininfor` VALUES (189, 'master', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2022-09-08 19:10:23');
INSERT INTO `sys_logininfor` VALUES (190, 'qwe', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-09-08 19:10:44');
INSERT INTO `sys_logininfor` VALUES (191, 'qwe', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2022-09-08 19:11:09');
INSERT INTO `sys_logininfor` VALUES (192, 'master', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-09-08 19:11:23');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-08 23:07:07');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-08 23:53:11');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-09-08 23:56:17');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 01:51:02');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 03:23:45');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 03:23:52');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-09-09 03:24:45');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 03:51:23');
INSERT INTO `sys_logininfor` VALUES (201, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 03:51:32');
INSERT INTO `sys_logininfor` VALUES (202, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 03:54:28');
INSERT INTO `sys_logininfor` VALUES (203, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 03:54:39');
INSERT INTO `sys_logininfor` VALUES (204, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 03:54:54');
INSERT INTO `sys_logininfor` VALUES (205, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 03:55:31');
INSERT INTO `sys_logininfor` VALUES (206, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 03:56:39');
INSERT INTO `sys_logininfor` VALUES (207, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-09-09 03:56:52');
INSERT INTO `sys_logininfor` VALUES (208, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 03:56:59');
INSERT INTO `sys_logininfor` VALUES (209, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 03:57:08');
INSERT INTO `sys_logininfor` VALUES (210, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 03:57:40');
INSERT INTO `sys_logininfor` VALUES (211, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 03:58:34');
INSERT INTO `sys_logininfor` VALUES (212, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 03:58:54');
INSERT INTO `sys_logininfor` VALUES (213, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 03:59:30');
INSERT INTO `sys_logininfor` VALUES (214, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 05:04:34');
INSERT INTO `sys_logininfor` VALUES (215, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 05:04:46');
INSERT INTO `sys_logininfor` VALUES (216, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 05:04:57');
INSERT INTO `sys_logininfor` VALUES (217, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 05:06:12');
INSERT INTO `sys_logininfor` VALUES (218, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 05:06:20');
INSERT INTO `sys_logininfor` VALUES (219, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 06:43:02');
INSERT INTO `sys_logininfor` VALUES (220, 'master', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 06:49:22');
INSERT INTO `sys_logininfor` VALUES (221, 'master', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '验证码错误', '2022-09-09 06:49:28');
INSERT INTO `sys_logininfor` VALUES (222, 'master', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 06:49:32');
INSERT INTO `sys_logininfor` VALUES (223, 'master', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 06:50:17');
INSERT INTO `sys_logininfor` VALUES (224, 'master', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 06:50:30');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 06:50:49');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 06:50:56');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 06:51:07');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-09-09 06:51:21');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码已失效', '2022-09-09 07:06:25');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 07:06:35');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 07:21:48');
INSERT INTO `sys_logininfor` VALUES (232, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 07:22:01');
INSERT INTO `sys_logininfor` VALUES (233, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 07:22:14');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 07:22:18');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 07:51:36');
INSERT INTO `sys_logininfor` VALUES (236, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 07:51:49');
INSERT INTO `sys_logininfor` VALUES (237, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 07:53:21');
INSERT INTO `sys_logininfor` VALUES (238, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 07:53:29');
INSERT INTO `sys_logininfor` VALUES (239, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 07:53:46');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 07:53:52');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 07:55:08');
INSERT INTO `sys_logininfor` VALUES (242, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 07:55:17');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-09-09 08:33:44');
INSERT INTO `sys_logininfor` VALUES (244, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 08:39:57');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 08:40:02');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 08:42:04');
INSERT INTO `sys_logininfor` VALUES (247, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 08:42:13');
INSERT INTO `sys_logininfor` VALUES (248, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 08:58:27');
INSERT INTO `sys_logininfor` VALUES (249, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-09-09 08:58:39');
INSERT INTO `sys_logininfor` VALUES (250, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 08:58:45');
INSERT INTO `sys_logininfor` VALUES (251, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 09:03:38');
INSERT INTO `sys_logininfor` VALUES (252, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 09:03:50');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2022-09-09 09:08:49');
INSERT INTO `sys_logininfor` VALUES (254, 'master', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-09-09 09:09:02');
INSERT INTO `sys_logininfor` VALUES (255, 'master', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2022-09-09 09:19:29');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-09-09 09:19:34');
INSERT INTO `sys_logininfor` VALUES (257, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 09:34:23');
INSERT INTO `sys_logininfor` VALUES (258, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 09:34:42');
INSERT INTO `sys_logininfor` VALUES (259, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 09:45:40');
INSERT INTO `sys_logininfor` VALUES (260, 'syysyy', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 09:45:51');
INSERT INTO `sys_logininfor` VALUES (261, 'syysyy', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 09:48:10');
INSERT INTO `sys_logininfor` VALUES (262, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 09:48:20');
INSERT INTO `sys_logininfor` VALUES (263, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 09:48:42');
INSERT INTO `sys_logininfor` VALUES (264, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 11:01:23');
INSERT INTO `sys_logininfor` VALUES (265, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 11:01:32');
INSERT INTO `sys_logininfor` VALUES (266, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-09-09 11:02:04');
INSERT INTO `sys_logininfor` VALUES (267, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 11:02:14');
INSERT INTO `sys_logininfor` VALUES (268, 'syy123', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '验证码已失效', '2022-09-09 11:09:08');
INSERT INTO `sys_logininfor` VALUES (269, 'syy123', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 11:09:15');
INSERT INTO `sys_logininfor` VALUES (270, 'syy123', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '用户不存在/密码错误', '2022-09-09 11:09:39');
INSERT INTO `sys_logininfor` VALUES (271, 'syy123', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-09-09 11:10:16');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-22 15:39:12');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码已失效', '2022-09-28 13:14:05');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-28 13:14:12');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-04 15:13:55');
INSERT INTO `sys_logininfor` VALUES (276, 'qwe', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-10-04 15:19:58');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-04 16:30:19');
INSERT INTO `sys_logininfor` VALUES (278, 'master', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-10-04 16:36:01');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-10-04 16:38:42');
INSERT INTO `sys_logininfor` VALUES (280, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-10-04 16:38:58');
INSERT INTO `sys_logininfor` VALUES (281, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-04 16:39:04');
INSERT INTO `sys_logininfor` VALUES (282, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-10-04 16:47:41');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-04 16:47:46');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-10-04 16:50:31');
INSERT INTO `sys_logininfor` VALUES (285, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-10-04 16:50:42');
INSERT INTO `sys_logininfor` VALUES (286, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-04 16:50:46');
INSERT INTO `sys_logininfor` VALUES (287, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-10-04 17:34:53');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-04 17:34:59');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-10-04 17:37:18');
INSERT INTO `sys_logininfor` VALUES (290, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-04 17:37:31');
INSERT INTO `sys_logininfor` VALUES (291, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-10-04 17:37:47');
INSERT INTO `sys_logininfor` VALUES (292, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-04 17:37:59');
INSERT INTO `sys_logininfor` VALUES (293, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-10-04 17:38:30');
INSERT INTO `sys_logininfor` VALUES (294, 'qwe', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-04 17:38:40');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-04 18:25:16');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-05 18:43:30');
INSERT INTO `sys_logininfor` VALUES (297, 'qwe', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-10-05 18:44:43');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-05 21:42:28');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-06 13:08:05');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-13 15:39:51');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-13 16:42:08');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-14 00:42:09');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-14 15:20:31');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-15 16:20:27');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-15 17:08:36');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-10-15 20:12:50');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-15 20:13:03');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-16 23:23:07');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-17 00:29:06');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-17 09:53:20');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码已失效', '2022-10-19 16:13:30');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-19 16:13:34');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-19 16:54:13');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-19 18:42:39');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-10-19 18:43:33');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-19 18:44:33');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-10-19 18:45:15');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-19 18:45:23');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-10-19 18:46:24');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-10-19 18:46:32');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-19 18:46:43');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-10-19 18:47:55');
INSERT INTO `sys_logininfor` VALUES (323, 'qwer', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-19 18:48:04');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-20 18:17:04');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-21 09:01:44');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-21 10:20:48');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-21 12:44:07');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-26 16:34:57');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-26 18:06:11');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-06 15:04:05');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-25 17:37:41');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-27 15:28:39');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-27 16:59:08');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-28 19:11:43');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-29 15:59:10');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-29 16:42:32');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-29 23:12:08');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-11-29 23:14:21');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-29 23:14:28');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-11-29 23:16:36');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-29 23:16:45');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-11-29 23:22:37');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-29 23:22:44');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-11-29 23:26:31');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-29 23:26:40');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-11-29 23:28:02');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-29 23:28:12');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-11-29 23:30:38');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-29 23:30:46');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-11-29 23:30:55');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-30 04:05:12');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-30 06:11:39');
INSERT INTO `sys_logininfor` VALUES (353, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-11-30 08:16:21');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-30 08:16:24');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-11-30 08:33:11');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-30 08:35:37');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-11-30 08:35:43');
INSERT INTO `sys_logininfor` VALUES (358, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码已失效', '2022-11-30 09:09:43');
INSERT INTO `sys_logininfor` VALUES (359, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-30 09:09:47');
INSERT INTO `sys_logininfor` VALUES (360, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 18:48:47');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-01 18:48:56');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 18:59:29');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-01 18:59:51');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 19:01:29');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-01 19:02:57');
INSERT INTO `sys_logininfor` VALUES (366, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 19:11:00');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 19:14:53');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-01 19:32:27');
INSERT INTO `sys_logininfor` VALUES (369, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 19:32:44');
INSERT INTO `sys_logininfor` VALUES (370, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-01 19:32:52');
INSERT INTO `sys_logininfor` VALUES (371, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 19:34:03');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 19:38:55');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-12-01 19:39:14');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 19:39:19');
INSERT INTO `sys_logininfor` VALUES (375, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 19:39:36');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-01 19:40:12');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 19:40:19');
INSERT INTO `sys_logininfor` VALUES (378, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 19:49:59');
INSERT INTO `sys_logininfor` VALUES (379, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-01 19:51:15');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 19:51:22');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-12-01 20:00:51');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 20:00:56');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-01 20:01:40');
INSERT INTO `sys_logininfor` VALUES (384, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 20:01:47');
INSERT INTO `sys_logininfor` VALUES (385, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-01 20:02:55');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 20:03:00');
INSERT INTO `sys_logininfor` VALUES (387, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-01 20:03:25');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 20:03:31');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 20:29:10');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 20:30:15');
INSERT INTO `sys_logininfor` VALUES (391, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 21:14:01');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-01 21:14:26');
INSERT INTO `sys_logininfor` VALUES (393, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-12-01 21:25:33');
INSERT INTO `sys_logininfor` VALUES (394, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-12-01 21:28:30');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 21:29:44');
INSERT INTO `sys_logininfor` VALUES (396, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-01 21:31:14');
INSERT INTO `sys_logininfor` VALUES (397, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 20:22:28');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-12-04 20:22:49');
INSERT INTO `sys_logininfor` VALUES (399, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 20:24:46');
INSERT INTO `sys_logininfor` VALUES (400, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-12-04 21:00:58');
INSERT INTO `sys_logininfor` VALUES (401, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 21:01:54');
INSERT INTO `sys_logininfor` VALUES (402, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 21:12:48');
INSERT INTO `sys_logininfor` VALUES (403, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-12-04 21:30:53');
INSERT INTO `sys_logininfor` VALUES (404, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 21:31:27');
INSERT INTO `sys_logininfor` VALUES (405, '1234334', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '用户不存在/密码错误', '2022-12-04 21:33:05');
INSERT INTO `sys_logininfor` VALUES (406, '1234334', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-12-04 21:33:18');
INSERT INTO `sys_logininfor` VALUES (407, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-12-04 21:40:20');
INSERT INTO `sys_logininfor` VALUES (408, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 21:40:56');
INSERT INTO `sys_logininfor` VALUES (409, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-12-04 21:58:50');
INSERT INTO `sys_logininfor` VALUES (410, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 21:58:55');
INSERT INTO `sys_logininfor` VALUES (411, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-04 22:01:03');
INSERT INTO `sys_logininfor` VALUES (412, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '登录用户：1234334 不存在', '2022-12-04 22:01:33');
INSERT INTO `sys_logininfor` VALUES (413, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '登录用户：1234334 不存在', '2022-12-04 22:01:37');
INSERT INTO `sys_logininfor` VALUES (414, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 22:02:14');
INSERT INTO `sys_logininfor` VALUES (415, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 22:15:55');
INSERT INTO `sys_logininfor` VALUES (416, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 22:27:52');
INSERT INTO `sys_logininfor` VALUES (417, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 22:41:55');
INSERT INTO `sys_logininfor` VALUES (418, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 22:59:34');
INSERT INTO `sys_logininfor` VALUES (419, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 23:10:35');
INSERT INTO `sys_logininfor` VALUES (420, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 23:21:14');
INSERT INTO `sys_logininfor` VALUES (421, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 23:26:28');
INSERT INTO `sys_logininfor` VALUES (422, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 23:46:37');
INSERT INTO `sys_logininfor` VALUES (423, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-04 23:47:14');
INSERT INTO `sys_logininfor` VALUES (424, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-04 23:47:47');
INSERT INTO `sys_logininfor` VALUES (425, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 01:37:05');
INSERT INTO `sys_logininfor` VALUES (426, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 02:52:18');
INSERT INTO `sys_logininfor` VALUES (427, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-12-05 05:09:11');
INSERT INTO `sys_logininfor` VALUES (428, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 05:09:23');
INSERT INTO `sys_logininfor` VALUES (429, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 06:40:34');
INSERT INTO `sys_logininfor` VALUES (430, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 07:11:27');
INSERT INTO `sys_logininfor` VALUES (431, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 07:58:26');
INSERT INTO `sys_logininfor` VALUES (432, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 08:50:03');
INSERT INTO `sys_logininfor` VALUES (433, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-05 09:01:00');
INSERT INTO `sys_logininfor` VALUES (434, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 09:02:27');
INSERT INTO `sys_logininfor` VALUES (435, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-05 09:02:35');
INSERT INTO `sys_logininfor` VALUES (436, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 09:08:03');
INSERT INTO `sys_logininfor` VALUES (437, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-05 09:08:26');
INSERT INTO `sys_logininfor` VALUES (438, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 09:09:40');
INSERT INTO `sys_logininfor` VALUES (439, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-05 09:11:21');
INSERT INTO `sys_logininfor` VALUES (440, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 09:12:04');
INSERT INTO `sys_logininfor` VALUES (441, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 13:03:46');
INSERT INTO `sys_logininfor` VALUES (442, '1233344', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '登录用户：1233344 不存在', '2022-12-05 13:33:00');
INSERT INTO `sys_logininfor` VALUES (443, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 13:33:17');
INSERT INTO `sys_logininfor` VALUES (444, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 15:56:06');
INSERT INTO `sys_logininfor` VALUES (445, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-12-05 16:13:17');
INSERT INTO `sys_logininfor` VALUES (446, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-12-05 17:01:04');
INSERT INTO `sys_logininfor` VALUES (447, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2022-12-05 17:01:38');
INSERT INTO `sys_logininfor` VALUES (448, '1234567', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-12-05 17:01:57');
INSERT INTO `sys_logininfor` VALUES (449, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-05 17:09:28');
INSERT INTO `sys_logininfor` VALUES (450, '1234567', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 17:09:48');
INSERT INTO `sys_logininfor` VALUES (451, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2022-12-05 17:19:12');
INSERT INTO `sys_logininfor` VALUES (452, '1234334', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-12-05 17:19:25');
INSERT INTO `sys_logininfor` VALUES (453, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-05 17:32:13');
INSERT INTO `sys_logininfor` VALUES (454, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 17:32:24');
INSERT INTO `sys_logininfor` VALUES (455, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-05 17:40:22');
INSERT INTO `sys_logininfor` VALUES (456, '1234567', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 17:40:33');
INSERT INTO `sys_logininfor` VALUES (457, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-12-05 18:34:54');
INSERT INTO `sys_logininfor` VALUES (458, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 20:42:44');
INSERT INTO `sys_logininfor` VALUES (459, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-05 20:43:30');
INSERT INTO `sys_logininfor` VALUES (460, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-06 19:33:13');
INSERT INTO `sys_logininfor` VALUES (461, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-06 21:39:28');
INSERT INTO `sys_logininfor` VALUES (462, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-12-06 21:39:40');
INSERT INTO `sys_logininfor` VALUES (463, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-06 21:39:45');
INSERT INTO `sys_logininfor` VALUES (464, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-06 23:12:37');
INSERT INTO `sys_logininfor` VALUES (465, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 00:37:35');
INSERT INTO `sys_logininfor` VALUES (466, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 02:19:16');
INSERT INTO `sys_logininfor` VALUES (467, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 06:34:26');
INSERT INTO `sys_logininfor` VALUES (468, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-07 10:25:59');
INSERT INTO `sys_logininfor` VALUES (469, '20013245345670', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '登录用户：20013245345670 不存在', '2022-12-07 10:26:31');
INSERT INTO `sys_logininfor` VALUES (470, '1234567', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 10:26:47');
INSERT INTO `sys_logininfor` VALUES (471, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 10:27:08');
INSERT INTO `sys_logininfor` VALUES (472, '1234567', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-12-07 10:28:08');
INSERT INTO `sys_logininfor` VALUES (473, '1234567', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 10:28:13');
INSERT INTO `sys_logininfor` VALUES (474, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 10:28:32');
INSERT INTO `sys_logininfor` VALUES (475, '1234567', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 10:39:31');
INSERT INTO `sys_logininfor` VALUES (476, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 10:39:47');
INSERT INTO `sys_logininfor` VALUES (477, '1234567', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 10:55:14');
INSERT INTO `sys_logininfor` VALUES (478, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 10:55:48');
INSERT INTO `sys_logininfor` VALUES (479, '1234567', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 11:02:06');
INSERT INTO `sys_logininfor` VALUES (480, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 11:02:58');
INSERT INTO `sys_logininfor` VALUES (481, '1234567', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 11:07:33');
INSERT INTO `sys_logininfor` VALUES (482, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 11:08:10');
INSERT INTO `sys_logininfor` VALUES (483, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-07 11:09:30');
INSERT INTO `sys_logininfor` VALUES (484, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 11:09:35');
INSERT INTO `sys_logininfor` VALUES (485, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 11:57:06');
INSERT INTO `sys_logininfor` VALUES (486, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 11:57:39');
INSERT INTO `sys_logininfor` VALUES (487, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 12:32:49');
INSERT INTO `sys_logininfor` VALUES (488, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 22:58:29');
INSERT INTO `sys_logininfor` VALUES (489, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-07 23:51:06');
INSERT INTO `sys_logininfor` VALUES (490, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 00:21:38');
INSERT INTO `sys_logininfor` VALUES (491, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 02:32:11');
INSERT INTO `sys_logininfor` VALUES (492, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 03:11:14');
INSERT INTO `sys_logininfor` VALUES (493, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 05:40:02');
INSERT INTO `sys_logininfor` VALUES (494, '1234567', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 06:26:40');
INSERT INTO `sys_logininfor` VALUES (495, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-08 06:28:19');
INSERT INTO `sys_logininfor` VALUES (496, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 06:28:32');
INSERT INTO `sys_logininfor` VALUES (497, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 07:07:57');
INSERT INTO `sys_logininfor` VALUES (498, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 07:56:28');
INSERT INTO `sys_logininfor` VALUES (499, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 09:56:52');
INSERT INTO `sys_logininfor` VALUES (500, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 09:57:29');
INSERT INTO `sys_logininfor` VALUES (501, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 09:59:48');
INSERT INTO `sys_logininfor` VALUES (502, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 10:06:52');
INSERT INTO `sys_logininfor` VALUES (503, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 17:34:49');
INSERT INTO `sys_logininfor` VALUES (504, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 18:57:35');
INSERT INTO `sys_logininfor` VALUES (505, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 19:04:57');
INSERT INTO `sys_logininfor` VALUES (506, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 19:11:54');
INSERT INTO `sys_logininfor` VALUES (507, '1234567', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-12-08 19:14:29');
INSERT INTO `sys_logininfor` VALUES (508, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 19:16:11');
INSERT INTO `sys_logininfor` VALUES (509, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-08 19:22:37');
INSERT INTO `sys_logininfor` VALUES (510, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2022-12-08 19:23:23');
INSERT INTO `sys_logininfor` VALUES (511, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-17 02:08:28');
INSERT INTO `sys_logininfor` VALUES (512, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-12-17 04:41:32');
INSERT INTO `sys_logininfor` VALUES (513, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-17 04:41:32');
INSERT INTO `sys_logininfor` VALUES (514, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-12-17 04:41:37');
INSERT INTO `sys_logininfor` VALUES (515, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-17 04:41:42');
INSERT INTO `sys_logininfor` VALUES (516, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-17 06:56:05');
INSERT INTO `sys_logininfor` VALUES (517, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-17 06:56:43');
INSERT INTO `sys_logininfor` VALUES (518, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-17 06:57:44');
INSERT INTO `sys_logininfor` VALUES (519, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-17 06:58:48');
INSERT INTO `sys_logininfor` VALUES (520, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-17 06:59:18');
INSERT INTO `sys_logininfor` VALUES (521, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-17 07:48:36');
INSERT INTO `sys_logininfor` VALUES (522, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-17 07:49:33');
INSERT INTO `sys_logininfor` VALUES (523, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-17 09:10:43');
INSERT INTO `sys_logininfor` VALUES (524, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-08 15:06:50');
INSERT INTO `sys_logininfor` VALUES (525, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-08 15:20:20');
INSERT INTO `sys_logininfor` VALUES (526, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-08 17:08:15');
INSERT INTO `sys_logininfor` VALUES (527, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-08 18:17:49');
INSERT INTO `sys_logininfor` VALUES (528, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-08 22:18:57');
INSERT INTO `sys_logininfor` VALUES (529, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-08 23:02:39');
INSERT INTO `sys_logininfor` VALUES (530, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-09 12:07:45');
INSERT INTO `sys_logininfor` VALUES (531, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-09 15:28:04');
INSERT INTO `sys_logininfor` VALUES (532, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-09 16:41:48');
INSERT INTO `sys_logininfor` VALUES (533, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-09 18:42:58');
INSERT INTO `sys_logininfor` VALUES (534, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-09 20:13:10');
INSERT INTO `sys_logininfor` VALUES (535, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-09 23:50:23');
INSERT INTO `sys_logininfor` VALUES (536, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-10 13:03:46');
INSERT INTO `sys_logininfor` VALUES (537, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-10 14:19:21');
INSERT INTO `sys_logininfor` VALUES (538, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-10 17:05:54');
INSERT INTO `sys_logininfor` VALUES (539, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-10 17:41:02');
INSERT INTO `sys_logininfor` VALUES (540, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-11 15:00:06');
INSERT INTO `sys_logininfor` VALUES (541, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-11 15:52:21');
INSERT INTO `sys_logininfor` VALUES (542, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-11 23:09:39');
INSERT INTO `sys_logininfor` VALUES (543, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-12 00:40:20');
INSERT INTO `sys_logininfor` VALUES (544, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-12 01:20:21');
INSERT INTO `sys_logininfor` VALUES (545, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-12 23:17:49');
INSERT INTO `sys_logininfor` VALUES (546, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-13 00:51:20');
INSERT INTO `sys_logininfor` VALUES (547, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-13 01:36:09');
INSERT INTO `sys_logininfor` VALUES (548, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-13 02:04:01');
INSERT INTO `sys_logininfor` VALUES (549, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-13 02:04:07');
INSERT INTO `sys_logininfor` VALUES (550, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-13 02:07:03');
INSERT INTO `sys_logininfor` VALUES (551, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-13 02:07:06');
INSERT INTO `sys_logininfor` VALUES (552, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-13 03:37:56');
INSERT INTO `sys_logininfor` VALUES (553, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-13 15:36:40');
INSERT INTO `sys_logininfor` VALUES (554, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-13 18:54:40');
INSERT INTO `sys_logininfor` VALUES (555, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-13 21:13:07');
INSERT INTO `sys_logininfor` VALUES (556, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-13 23:10:22');
INSERT INTO `sys_logininfor` VALUES (557, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-13 23:10:36');
INSERT INTO `sys_logininfor` VALUES (558, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-13 23:11:21');
INSERT INTO `sys_logininfor` VALUES (559, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-13 23:11:26');
INSERT INTO `sys_logininfor` VALUES (560, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-13 23:11:56');
INSERT INTO `sys_logininfor` VALUES (561, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-13 23:12:19');
INSERT INTO `sys_logininfor` VALUES (562, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-13 23:26:10');
INSERT INTO `sys_logininfor` VALUES (563, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-13 23:26:18');
INSERT INTO `sys_logininfor` VALUES (564, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-13 23:29:44');
INSERT INTO `sys_logininfor` VALUES (565, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2023-01-13 23:29:58');
INSERT INTO `sys_logininfor` VALUES (566, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2023-01-13 23:30:04');
INSERT INTO `sys_logininfor` VALUES (567, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-13 23:30:08');
INSERT INTO `sys_logininfor` VALUES (568, '1234334', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-13 23:59:41');
INSERT INTO `sys_logininfor` VALUES (569, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 00:13:24');
INSERT INTO `sys_logininfor` VALUES (570, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 00:26:07');
INSERT INTO `sys_logininfor` VALUES (571, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 00:27:09');
INSERT INTO `sys_logininfor` VALUES (572, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 00:27:39');
INSERT INTO `sys_logininfor` VALUES (573, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 00:28:11');
INSERT INTO `sys_logininfor` VALUES (574, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 00:32:28');
INSERT INTO `sys_logininfor` VALUES (575, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 01:07:30');
INSERT INTO `sys_logininfor` VALUES (576, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 01:23:52');
INSERT INTO `sys_logininfor` VALUES (577, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-14 01:24:45');
INSERT INTO `sys_logininfor` VALUES (578, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '登录用户：1234334 不存在', '2023-01-14 01:24:57');
INSERT INTO `sys_logininfor` VALUES (579, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 01:25:19');
INSERT INTO `sys_logininfor` VALUES (580, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-14 01:25:25');
INSERT INTO `sys_logininfor` VALUES (581, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 01:25:36');
INSERT INTO `sys_logininfor` VALUES (582, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-14 01:30:04');
INSERT INTO `sys_logininfor` VALUES (583, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 01:30:19');
INSERT INTO `sys_logininfor` VALUES (584, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 01:50:56');
INSERT INTO `sys_logininfor` VALUES (585, '1234334', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-14 01:52:13');
INSERT INTO `sys_logininfor` VALUES (586, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 01:53:26');
INSERT INTO `sys_logininfor` VALUES (587, 'LHJ', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-14 03:39:53');
INSERT INTO `sys_logininfor` VALUES (588, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-14 03:47:52');
INSERT INTO `sys_logininfor` VALUES (589, 'LHJ', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-14 03:48:09');
INSERT INTO `sys_logininfor` VALUES (590, 'LHJ', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-14 07:19:57');
INSERT INTO `sys_logininfor` VALUES (591, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-14 07:22:54');
INSERT INTO `sys_logininfor` VALUES (592, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 07:23:06');
INSERT INTO `sys_logininfor` VALUES (593, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-14 07:25:42');
INSERT INTO `sys_logininfor` VALUES (594, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 07:25:59');
INSERT INTO `sys_logininfor` VALUES (595, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-14 07:41:40');
INSERT INTO `sys_logininfor` VALUES (596, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 07:41:54');
INSERT INTO `sys_logininfor` VALUES (597, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-14 07:42:39');
INSERT INTO `sys_logininfor` VALUES (598, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 07:42:52');
INSERT INTO `sys_logininfor` VALUES (599, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-14 07:43:27');
INSERT INTO `sys_logininfor` VALUES (600, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 07:43:37');
INSERT INTO `sys_logininfor` VALUES (601, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-14 07:46:34');
INSERT INTO `sys_logininfor` VALUES (602, 'syy123', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-14 07:46:43');
INSERT INTO `sys_logininfor` VALUES (603, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 16:48:11');
INSERT INTO `sys_logininfor` VALUES (604, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 17:47:05');
INSERT INTO `sys_logininfor` VALUES (605, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 19:20:24');
INSERT INTO `sys_logininfor` VALUES (606, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-14 19:47:11');
INSERT INTO `sys_logininfor` VALUES (607, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 19:47:22');
INSERT INTO `sys_logininfor` VALUES (608, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-14 19:48:23');
INSERT INTO `sys_logininfor` VALUES (609, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 19:48:34');
INSERT INTO `sys_logininfor` VALUES (610, '1234334', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '登录用户：1234334 不存在', '2023-01-14 20:24:28');
INSERT INTO `sys_logininfor` VALUES (611, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-14 20:24:40');
INSERT INTO `sys_logininfor` VALUES (612, '123', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-01-15 02:35:27');
INSERT INTO `sys_logininfor` VALUES (613, '13245765698', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '对不起，您的账号：13245765698审核中', '2023-01-15 02:40:39');
INSERT INTO `sys_logininfor` VALUES (614, '13245765698', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2023-01-15 02:40:43');
INSERT INTO `sys_logininfor` VALUES (615, '13245765698', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '对不起，您的账号：13245765698审核中', '2023-01-15 02:40:48');
INSERT INTO `sys_logininfor` VALUES (616, '13245765698', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2023-01-15 02:41:08');
INSERT INTO `sys_logininfor` VALUES (617, '13245765698', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 02:41:11');
INSERT INTO `sys_logininfor` VALUES (618, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 02:42:26');
INSERT INTO `sys_logininfor` VALUES (619, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '验证码已失效', '2023-01-15 03:00:34');
INSERT INTO `sys_logininfor` VALUES (620, 'admin', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 03:00:41');
INSERT INTO `sys_logininfor` VALUES (621, '123563', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-01-15 03:13:39');
INSERT INTO `sys_logininfor` VALUES (622, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 03:26:07');
INSERT INTO `sys_logininfor` VALUES (623, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 03:27:04');
INSERT INTO `sys_logininfor` VALUES (624, '172030402101', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-01-15 03:27:50');
INSERT INTO `sys_logininfor` VALUES (625, '172030402101', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '对不起，您的账号：172030402101审核中', '2023-01-15 03:28:36');
INSERT INTO `sys_logininfor` VALUES (626, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 03:29:00');
INSERT INTO `sys_logininfor` VALUES (627, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 03:29:25');
INSERT INTO `sys_logininfor` VALUES (628, '172030402101', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 03:29:39');
INSERT INTO `sys_logininfor` VALUES (629, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 03:41:33');
INSERT INTO `sys_logininfor` VALUES (630, 'LHD', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-01-15 12:16:34');
INSERT INTO `sys_logininfor` VALUES (631, 'LHD2', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-01-15 12:17:56');
INSERT INTO `sys_logininfor` VALUES (632, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 12:22:42');
INSERT INTO `sys_logininfor` VALUES (633, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 12:26:28');
INSERT INTO `sys_logininfor` VALUES (634, 'LC', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-01-15 12:27:09');
INSERT INTO `sys_logininfor` VALUES (635, 'FJL', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-01-15 12:28:27');
INSERT INTO `sys_logininfor` VALUES (636, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2023-01-15 12:28:40');
INSERT INTO `sys_logininfor` VALUES (637, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 12:28:43');
INSERT INTO `sys_logininfor` VALUES (638, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 12:48:48');
INSERT INTO `sys_logininfor` VALUES (639, 'LHD', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-01-15 12:50:06');
INSERT INTO `sys_logininfor` VALUES (640, 'LHD2', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-01-15 12:51:05');
INSERT INTO `sys_logininfor` VALUES (641, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 12:55:26');
INSERT INTO `sys_logininfor` VALUES (642, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 12:59:13');
INSERT INTO `sys_logininfor` VALUES (643, 'LC', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-01-15 13:00:09');
INSERT INTO `sys_logininfor` VALUES (644, 'LC2', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-01-15 13:01:21');
INSERT INTO `sys_logininfor` VALUES (645, 'LC3', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-01-15 13:04:13');
INSERT INTO `sys_logininfor` VALUES (646, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 13:04:40');
INSERT INTO `sys_logininfor` VALUES (647, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 13:06:20');
INSERT INTO `sys_logininfor` VALUES (648, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 13:06:32');
INSERT INTO `sys_logininfor` VALUES (649, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 13:12:18');
INSERT INTO `sys_logininfor` VALUES (650, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 13:12:29');
INSERT INTO `sys_logininfor` VALUES (651, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 13:37:11');
INSERT INTO `sys_logininfor` VALUES (652, 'LHD', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 13:37:20');
INSERT INTO `sys_logininfor` VALUES (653, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 13:46:47');
INSERT INTO `sys_logininfor` VALUES (654, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 13:46:56');
INSERT INTO `sys_logininfor` VALUES (655, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 14:31:44');
INSERT INTO `sys_logininfor` VALUES (656, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 14:31:56');
INSERT INTO `sys_logininfor` VALUES (657, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 14:41:54');
INSERT INTO `sys_logininfor` VALUES (658, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 14:42:07');
INSERT INTO `sys_logininfor` VALUES (659, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 16:59:32');
INSERT INTO `sys_logininfor` VALUES (660, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 17:03:04');
INSERT INTO `sys_logininfor` VALUES (661, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 17:03:16');
INSERT INTO `sys_logininfor` VALUES (662, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 17:10:12');
INSERT INTO `sys_logininfor` VALUES (663, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 17:10:25');
INSERT INTO `sys_logininfor` VALUES (664, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 17:11:39');
INSERT INTO `sys_logininfor` VALUES (665, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 17:11:50');
INSERT INTO `sys_logininfor` VALUES (666, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 17:27:12');
INSERT INTO `sys_logininfor` VALUES (667, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 17:27:24');
INSERT INTO `sys_logininfor` VALUES (668, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 18:10:19');
INSERT INTO `sys_logininfor` VALUES (669, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 18:10:29');
INSERT INTO `sys_logininfor` VALUES (670, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 18:53:14');
INSERT INTO `sys_logininfor` VALUES (671, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 18:58:21');
INSERT INTO `sys_logininfor` VALUES (672, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 18:58:33');
INSERT INTO `sys_logininfor` VALUES (673, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 18:58:50');
INSERT INTO `sys_logininfor` VALUES (674, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 18:58:59');
INSERT INTO `sys_logininfor` VALUES (675, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 22:53:50');
INSERT INTO `sys_logininfor` VALUES (676, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 22:55:29');
INSERT INTO `sys_logininfor` VALUES (677, 'LHD', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 22:55:41');
INSERT INTO `sys_logininfor` VALUES (678, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 23:00:13');
INSERT INTO `sys_logininfor` VALUES (679, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 23:00:23');
INSERT INTO `sys_logininfor` VALUES (680, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 23:01:14');
INSERT INTO `sys_logininfor` VALUES (681, 'LHD', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 23:01:25');
INSERT INTO `sys_logininfor` VALUES (682, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 23:02:24');
INSERT INTO `sys_logininfor` VALUES (683, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 23:02:35');
INSERT INTO `sys_logininfor` VALUES (684, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-15 23:02:57');
INSERT INTO `sys_logininfor` VALUES (685, 'LHD', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-15 23:03:11');
INSERT INTO `sys_logininfor` VALUES (686, 'LC', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:03:41');
INSERT INTO `sys_logininfor` VALUES (687, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:09:14');
INSERT INTO `sys_logininfor` VALUES (688, 'LC2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:09:30');
INSERT INTO `sys_logininfor` VALUES (689, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:10:10');
INSERT INTO `sys_logininfor` VALUES (690, 'LC', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:10:23');
INSERT INTO `sys_logininfor` VALUES (691, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:11:32');
INSERT INTO `sys_logininfor` VALUES (692, 'LC2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:11:42');
INSERT INTO `sys_logininfor` VALUES (693, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:12:29');
INSERT INTO `sys_logininfor` VALUES (694, 'LC2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:12:40');
INSERT INTO `sys_logininfor` VALUES (695, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:12:48');
INSERT INTO `sys_logininfor` VALUES (696, 'LC', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:13:00');
INSERT INTO `sys_logininfor` VALUES (697, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:13:55');
INSERT INTO `sys_logininfor` VALUES (698, 'LC2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:14:04');
INSERT INTO `sys_logininfor` VALUES (699, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:15:01');
INSERT INTO `sys_logininfor` VALUES (700, 'LC', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:15:10');
INSERT INTO `sys_logininfor` VALUES (701, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:20:17');
INSERT INTO `sys_logininfor` VALUES (702, 'LC2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:20:27');
INSERT INTO `sys_logininfor` VALUES (703, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:20:54');
INSERT INTO `sys_logininfor` VALUES (704, 'LC', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:21:04');
INSERT INTO `sys_logininfor` VALUES (705, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:23:34');
INSERT INTO `sys_logininfor` VALUES (706, 'LC2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:23:44');
INSERT INTO `sys_logininfor` VALUES (707, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:24:16');
INSERT INTO `sys_logininfor` VALUES (708, 'LC', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:24:26');
INSERT INTO `sys_logininfor` VALUES (709, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:25:56');
INSERT INTO `sys_logininfor` VALUES (710, 'LC2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:26:07');
INSERT INTO `sys_logininfor` VALUES (711, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:26:39');
INSERT INTO `sys_logininfor` VALUES (712, 'LC', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:26:50');
INSERT INTO `sys_logininfor` VALUES (713, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:42:03');
INSERT INTO `sys_logininfor` VALUES (714, 'LC2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:42:15');
INSERT INTO `sys_logininfor` VALUES (715, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:42:26');
INSERT INTO `sys_logininfor` VALUES (716, 'LC', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:42:36');
INSERT INTO `sys_logininfor` VALUES (717, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:57:08');
INSERT INTO `sys_logininfor` VALUES (718, 'LC2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:57:19');
INSERT INTO `sys_logininfor` VALUES (719, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:57:31');
INSERT INTO `sys_logininfor` VALUES (720, 'LC', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:57:40');
INSERT INTO `sys_logininfor` VALUES (721, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-15 23:57:47');
INSERT INTO `sys_logininfor` VALUES (722, 'LC2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-15 23:57:55');
INSERT INTO `sys_logininfor` VALUES (723, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-16 00:11:36');
INSERT INTO `sys_logininfor` VALUES (724, 'LC', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-16 00:11:48');
INSERT INTO `sys_logininfor` VALUES (725, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-16 00:17:53');
INSERT INTO `sys_logininfor` VALUES (726, 'LC2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-16 00:18:08');
INSERT INTO `sys_logininfor` VALUES (727, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-16 00:18:15');
INSERT INTO `sys_logininfor` VALUES (728, 'LC', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-16 00:18:28');
INSERT INTO `sys_logininfor` VALUES (729, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-16 00:22:09');
INSERT INTO `sys_logininfor` VALUES (730, 'LC2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-16 00:22:27');
INSERT INTO `sys_logininfor` VALUES (731, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-16 00:22:46');
INSERT INTO `sys_logininfor` VALUES (732, 'LC', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-16 00:22:59');
INSERT INTO `sys_logininfor` VALUES (733, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-16 00:23:20');
INSERT INTO `sys_logininfor` VALUES (734, 'LC2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-16 00:23:32');
INSERT INTO `sys_logininfor` VALUES (735, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-16 00:23:41');
INSERT INTO `sys_logininfor` VALUES (736, 'LC', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-16 00:23:52');
INSERT INTO `sys_logininfor` VALUES (737, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-16 00:24:13');
INSERT INTO `sys_logininfor` VALUES (738, 'LC2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '验证码错误', '2023-01-16 00:24:24');
INSERT INTO `sys_logininfor` VALUES (739, 'LC2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-16 00:24:27');
INSERT INTO `sys_logininfor` VALUES (740, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-01-16 00:24:32');
INSERT INTO `sys_logininfor` VALUES (741, 'LC', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '验证码错误', '2023-01-16 00:24:42');
INSERT INTO `sys_logininfor` VALUES (742, 'LC', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-01-16 00:24:47');
INSERT INTO `sys_logininfor` VALUES (743, 'LHD', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-16 00:25:26');
INSERT INTO `sys_logininfor` VALUES (744, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-16 00:40:48');
INSERT INTO `sys_logininfor` VALUES (745, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-16 00:40:58');
INSERT INTO `sys_logininfor` VALUES (746, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-16 00:43:53');
INSERT INTO `sys_logininfor` VALUES (747, 'LHD', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-16 00:44:03');
INSERT INTO `sys_logininfor` VALUES (748, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-16 00:49:18');
INSERT INTO `sys_logininfor` VALUES (749, 'LHD2', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-16 00:49:30');
INSERT INTO `sys_logininfor` VALUES (750, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-16 00:50:16');
INSERT INTO `sys_logininfor` VALUES (751, 'LHD', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-16 00:50:28');
INSERT INTO `sys_logininfor` VALUES (752, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-16 00:50:43');
INSERT INTO `sys_logininfor` VALUES (753, 'mater', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '登录用户：mater 不存在', '2023-01-16 00:50:53');
INSERT INTO `sys_logininfor` VALUES (754, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-16 00:51:03');
INSERT INTO `sys_logininfor` VALUES (755, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-16 01:02:55');
INSERT INTO `sys_logininfor` VALUES (756, 'LHD2', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2023-01-16 01:03:10');
INSERT INTO `sys_logininfor` VALUES (757, 'LHD2', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-16 01:03:14');
INSERT INTO `sys_logininfor` VALUES (758, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-01-16 01:03:35');
INSERT INTO `sys_logininfor` VALUES (759, 'LHD', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-16 01:03:46');
INSERT INTO `sys_logininfor` VALUES (760, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-30 16:18:23');
INSERT INTO `sys_logininfor` VALUES (761, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-01-31 18:51:04');
INSERT INTO `sys_logininfor` VALUES (762, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-02-01 16:46:03');
INSERT INTO `sys_logininfor` VALUES (763, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-02-01 18:49:28');
INSERT INTO `sys_logininfor` VALUES (764, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-02-01 19:53:42');
INSERT INTO `sys_logininfor` VALUES (765, 'SYY1', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-02-01 19:55:52');
INSERT INTO `sys_logininfor` VALUES (766, 'SYY2', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-02-01 19:57:18');
INSERT INTO `sys_logininfor` VALUES (767, 'YDJ', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-02-01 19:58:19');
INSERT INTO `sys_logininfor` VALUES (768, 'YDJ2', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '注册成功', '2023-02-01 19:59:14');
INSERT INTO `sys_logininfor` VALUES (769, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-02-01 19:59:26');
INSERT INTO `sys_logininfor` VALUES (770, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-02-01 20:00:19');
INSERT INTO `sys_logininfor` VALUES (771, 'YDJ', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-02-01 20:00:29');
INSERT INTO `sys_logininfor` VALUES (772, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-02-01 20:01:24');
INSERT INTO `sys_logininfor` VALUES (773, 'YDJ2', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-02-01 20:01:37');
INSERT INTO `sys_logininfor` VALUES (774, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-02-01 20:03:41');
INSERT INTO `sys_logininfor` VALUES (775, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2023-02-01 20:03:51');
INSERT INTO `sys_logininfor` VALUES (776, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-02-01 20:03:59');
INSERT INTO `sys_logininfor` VALUES (777, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-02-01 20:05:11');
INSERT INTO `sys_logininfor` VALUES (778, 'YDJ', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-02-01 20:05:20');
INSERT INTO `sys_logininfor` VALUES (779, 'SYY1', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-02-01 20:10:57');
INSERT INTO `sys_logininfor` VALUES (780, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-02-01 20:13:52');
INSERT INTO `sys_logininfor` VALUES (781, 'SYY2', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-02-01 20:14:01');
INSERT INTO `sys_logininfor` VALUES (782, NULL, '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2023-02-01 20:19:56');
INSERT INTO `sys_logininfor` VALUES (783, 'SYY1', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-02-01 20:20:10');
INSERT INTO `sys_logininfor` VALUES (784, NULL, '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2023-02-01 20:49:04');
INSERT INTO `sys_logininfor` VALUES (785, 'YDJ', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-02-01 20:49:16');
INSERT INTO `sys_logininfor` VALUES (786, 'SYY1', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '登录用户：SYY1 不存在', '2023-02-01 21:23:41');
INSERT INTO `sys_logininfor` VALUES (787, 'SYY1', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-02-01 21:23:58');
INSERT INTO `sys_logininfor` VALUES (788, 'YDJ', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-02-01 21:49:37');
INSERT INTO `sys_logininfor` VALUES (789, 'SYY1', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '1', '登录用户：SYY1 不存在', '2023-02-01 22:31:35');
INSERT INTO `sys_logininfor` VALUES (790, 'SYY1', '127.0.0.1', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2023-02-01 22:31:56');
INSERT INTO `sys_logininfor` VALUES (791, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-02-01 22:32:53');
INSERT INTO `sys_logininfor` VALUES (792, 'master', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2023-02-02 11:50:14');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2079 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 6, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-08-27 17:55:59', 'admin', '2022-09-04 00:54:39', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 4, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-08-27 17:55:59', 'admin', '2022-09-04 00:54:21', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 7, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-08-27 17:55:59', 'admin', '2022-09-04 00:54:43', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-08-27 17:55:59', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-08-27 17:55:59', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-08-27 17:55:59', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-08-27 17:55:59', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-08-27 17:55:59', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-08-27 17:55:59', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-08-27 17:55:59', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-08-27 17:55:59', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-08-27 17:55:59', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-08-27 17:55:59', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-08-27 17:55:59', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-08-27 17:55:59', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-08-27 17:55:59', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-08-27 17:55:59', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-08-27 17:55:59', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-08-27 17:55:59', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-08-27 17:55:59', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-08-27 17:55:59', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-08-27 17:55:59', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-08-27 17:55:59', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '竞赛管理', 0, 1, 'competition', NULL, NULL, 1, 0, 'M', '0', '0', '', 'date-range', 'admin', '2022-09-04 00:38:43', 'admin', '2022-09-04 00:39:06', '');
INSERT INTO `sys_menu` VALUES (2001, '竞赛审核', 2000, 1, 'audit', 'system/competition/audit', NULL, 1, 0, 'C', '0', '0', '', 'druid', 'admin', '2022-09-04 00:45:58', 'admin', '2023-01-14 03:57:23', '');
INSERT INTO `sys_menu` VALUES (2003, '竞赛申报', 2000, 3, 'apply', 'system/activity/activityadd', NULL, 1, 0, 'C', '0', '0', 'system:activity:add', 'drag', 'admin', '2022-09-04 00:50:55', 'admin', '2022-09-08 18:46:00', '');
INSERT INTO `sys_menu` VALUES (2004, '人员管理', 0, 2, 'member', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'guide', 'admin', '2022-09-04 00:53:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '人员审核', 2004, 1, 'audit', '', NULL, 1, 0, 'M', '0', '0', '', 'user', 'admin', '2022-09-04 00:56:39', 'admin', '2022-10-14 01:15:39', '');
INSERT INTO `sys_menu` VALUES (2008, '系统设置', 0, 5, 'settings', NULL, NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-09-04 01:00:56', '', '2023-01-11 23:15:19', '');
INSERT INTO `sys_menu` VALUES (2043, '单位人员', 2004, 2, 'tuser', 'system/tuser/index', NULL, 1, 0, 'C', '0', '0', '', 'peoples', 'admin', '2022-09-07 16:25:25', 'admin', '2023-01-14 07:26:19', '单位人员菜单');
INSERT INTO `sys_menu` VALUES (2044, '单位人员查询', 2043, 1, '#', '', NULL, 1, 0, 'F', '0', '0', '', '#', 'admin', '2022-09-07 16:25:25', '', '2023-01-14 07:27:34', '');
INSERT INTO `sys_menu` VALUES (2045, '单位人员新增', 2043, 2, '#', '', NULL, 1, 0, 'F', '0', '0', '', '#', 'admin', '2022-09-07 16:25:25', '', '2023-01-14 07:27:39', '');
INSERT INTO `sys_menu` VALUES (2046, '单位人员修改', 2043, 3, '#', '', NULL, 1, 0, 'F', '0', '0', '', '#', 'admin', '2022-09-07 16:25:25', '', '2023-01-14 07:27:43', '');
INSERT INTO `sys_menu` VALUES (2047, '单位人员删除', 2043, 4, '#', '', NULL, 1, 0, 'F', '0', '0', '', '#', 'admin', '2022-09-07 16:25:25', '', '2023-01-14 07:27:49', '');
INSERT INTO `sys_menu` VALUES (2048, '单位人员导出', 2043, 5, '#', '', NULL, 1, 0, 'F', '0', '0', '', '#', 'admin', '2022-09-07 16:25:25', '', '2023-01-14 07:27:52', '');
INSERT INTO `sys_menu` VALUES (2049, '重置密码', 2043, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', '', '#', 'admin', '2022-09-07 17:00:04', '', '2023-01-14 07:27:56', '');
INSERT INTO `sys_menu` VALUES (2050, '学生账号', 2004, 3, 'suser', 'system/suser/index', NULL, 1, 0, 'C', '0', '0', '', 'example', 'admin', '2022-09-08 02:37:01', 'admin', '2023-01-14 07:26:24', '学生账号菜单');
INSERT INTO `sys_menu` VALUES (2051, '学生账号查询', 2050, 1, '#', '', NULL, 1, 0, 'F', '0', '0', '', '#', 'admin', '2022-09-08 02:37:01', '', '2023-01-14 07:26:57', '');
INSERT INTO `sys_menu` VALUES (2052, '学生账号新增', 2050, 2, '#', '', NULL, 1, 0, 'F', '0', '0', '', '#', 'admin', '2022-09-08 02:37:01', '', '2023-01-14 07:27:04', '');
INSERT INTO `sys_menu` VALUES (2053, '学生账号修改', 2050, 3, '#', '', NULL, 1, 0, 'F', '0', '0', '', '#', 'admin', '2022-09-08 02:37:01', '', '2023-01-14 07:27:10', '');
INSERT INTO `sys_menu` VALUES (2054, '学生账号删除', 2050, 4, '#', '', NULL, 1, 0, 'F', '0', '0', '', '#', 'admin', '2022-09-08 02:37:01', '', '2023-01-14 07:27:15', '');
INSERT INTO `sys_menu` VALUES (2055, '学生账号导出', 2050, 5, '#', '', NULL, 1, 0, 'F', '0', '0', '', '#', 'admin', '2022-09-08 02:37:01', '', '2023-01-14 07:27:20', '');
INSERT INTO `sys_menu` VALUES (2056, '重置密码', 2050, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', '', '#', 'admin', '2022-09-08 02:39:21', '', '2023-01-14 07:27:24', '');
INSERT INTO `sys_menu` VALUES (2057, '机构管理', 2008, 1, 'organization', 'system/organization/index', NULL, 1, 0, 'C', '0', '0', 'system:organization:list', 'component', 'admin', '2022-09-08 17:19:06', 'admin', '2022-09-08 17:19:56', '机构管理菜单');
INSERT INTO `sys_menu` VALUES (2058, '机构管理查询', 2057, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:organization:query', '#', 'admin', '2022-09-08 17:19:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '机构管理新增', 2057, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:organization:add', '#', 'admin', '2022-09-08 17:19:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '机构管理修改', 2057, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:organization:edit', '#', 'admin', '2022-09-08 17:19:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '机构管理删除', 2057, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:organization:remove', '#', 'admin', '2022-09-08 17:19:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '机构管理导出', 2057, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:organization:export', '#', 'admin', '2022-09-08 17:19:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '活动类型', 2008, 1, 'activitytype', 'system/activitytype/index', NULL, 1, 0, 'C', '0', '0', 'system:activitytype:list', 'excel', 'admin', '2022-09-08 17:44:31', 'admin', '2022-09-08 17:52:41', '活动类型菜单');
INSERT INTO `sys_menu` VALUES (2064, '活动类型查询', 2063, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:activitytype:query', '#', 'admin', '2022-09-08 17:44:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '活动类型新增', 2063, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:activitytype:add', '#', 'admin', '2022-09-08 17:44:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '活动类型修改', 2063, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:activitytype:edit', '#', 'admin', '2022-09-08 17:44:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '活动类型删除', 2063, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:activitytype:remove', '#', 'admin', '2022-09-08 17:44:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2068, '活动类型导出', 2063, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:activitytype:export', '#', 'admin', '2022-09-08 17:44:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '竞赛管理', 2000, 1, 'competition', 'system/competition/index', NULL, 1, 0, 'C', '0', '0', '', 'dict', 'admin', '2022-09-08 18:21:03', 'admin', '2022-11-25 17:51:33', '竞赛管理菜单');
INSERT INTO `sys_menu` VALUES (2075, '教师审核', 2005, 1, 'tuser', 'system/audit/tuser/index', NULL, 1, 0, 'C', '0', '0', '', 'form', 'admin', '2022-10-14 01:01:13', 'admin', '2022-10-14 01:20:34', '');
INSERT INTO `sys_menu` VALUES (2076, '学生审核', 2005, 2, 'suser', 'system/audit/suser/index', NULL, 1, 0, 'C', '0', '0', '', 'form', 'admin', '2022-10-14 01:18:40', 'admin', '2022-10-14 01:20:24', '');
INSERT INTO `sys_menu` VALUES (2077, '竞赛评审', 0, 3, 'review', NULL, NULL, 1, 0, 'M', '0', '0', '', 'nested', '', '2023-01-11 23:13:48', '', '2023-01-11 23:15:02', '');
INSERT INTO `sys_menu` VALUES (2078, '我的评审', 2077, 1, 'myreview', 'system/review/index', NULL, 1, 0, 'C', '0', '0', '', 'cascader', '', '2023-01-11 23:14:41', '', '2023-01-13 01:58:54', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-08-27 17:55:59', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-08-27 17:55:59', '', NULL, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=666 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"竞赛管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"competition\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:38:43');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-04 00:38:43\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"竞赛管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"competition\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:39:06');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-08-27 17:55:59\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:39:36');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-08-27 17:55:59\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:39:54');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-08-27 17:55:59\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:39:59');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-08-27 17:55:59\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:40:04');
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"竞赛审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"audit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:45:58');
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/online/index\",\"createTime\":\"2022-09-04 00:45:58\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"竞赛审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"audit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:46:28');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/online/index\",\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"竞赛管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:48:16');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/online/index\",\"createBy\":\"admin\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"竞赛申报\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"apply\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:50:55');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"人员管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"member\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:53:36');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-08-27 17:55:59\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:54:02');
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-08-27 17:55:59\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:54:08');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-08-27 17:55:59\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:54:21');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-08-27 17:55:59\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:54:26');
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-08-27 17:55:59\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:54:30');
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-08-27 17:55:59\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:54:39');
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-08-27 17:55:59\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:54:43');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/online/index\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"人员审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"audit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:56:39');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/online/index\",\"createTime\":\"2022-09-04 00:56:39\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"人员审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"audit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:58:20');
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/online/index\",\"createBy\":\"admin\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"单位人员\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2004,\"path\":\"teacher\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:59:03');
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/online/index\",\"createBy\":\"admin\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生账号\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2004,\"path\":\"student\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 00:59:36');
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"系统设置\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"settings\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 01:00:56');
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/online/index\",\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"role\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 01:01:46');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/online/index\",\"createBy\":\"admin\",\"icon\":\"swagger\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"活动类型\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2008,\"path\":\"activitytype\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 01:02:49');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"机构管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2008,\"path\":\"agency\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 01:03:34');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/online/index\",\"createTime\":\"2022-09-04 01:03:34\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"机构管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2008,\"path\":\"agency\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 01:03:42');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"密码修改\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2008,\"path\":\"password\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 01:04:47');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/online/index\",\"createTime\":\"2022-09-04 01:04:47\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"密码修改\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2008,\"path\":\"password\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 01:04:55');
INSERT INTO `sys_oper_log` VALUES (129, '角色管理', 5, 'com.ruoyi.web.controller.system.SysRoleController.export()', 'POST', 1, 'admin', '', '/system/role/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{}}', NULL, 0, NULL, '2022-09-04 01:20:30');
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_dept', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 01:21:59');
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '', '/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 01:22:34');
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', 'competition_audit', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 01:47:42');
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '', '/tool/gen/2', '127.0.0.1', '内网IP', '{tableIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 01:51:05');
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', 'competition_audit', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 01:51:08');
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"audit\",\"className\":\"CompetitionAudit\",\"columns\":[{\"capJavaField\":\"ActivityId\",\"columnComment\":\"竞赛ID\",\"columnId\":16,\"columnName\":\"activity_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-09-04 01:51:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityName\",\"columnComment\":\"竞赛名称\",\"columnId\":17,\"columnName\":\"activity_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-04 01:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"activityName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":18,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-09-04 01:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"startTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EndTime\",\"columnComment\":\"结束时间\",\"columnId\":19,\"columnName\":\"end_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-09-04 01:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"end', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 01:58:31');
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"audit\",\"className\":\"CompetitionAudit\",\"columns\":[{\"capJavaField\":\"ActivityId\",\"columnComment\":\"竞赛ID\",\"columnId\":16,\"columnName\":\"activity_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-09-04 01:51:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityName\",\"columnComment\":\"竞赛名称\",\"columnId\":17,\"columnName\":\"activity_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-04 01:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"activityName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":18,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-09-04 01:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"startTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EndTime\",\"columnComment\":\"结束时间\",\"columnId\":19,\"columnName\":\"end_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-09-04 01:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"end', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 01:58:31');
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"audit\",\"className\":\"CompetitionAudit\",\"columns\":[{\"capJavaField\":\"ActivityId\",\"columnComment\":\"竞赛ID\",\"columnId\":16,\"columnName\":\"activity_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-09-04 01:51:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityName\",\"columnComment\":\"竞赛名称\",\"columnId\":17,\"columnName\":\"activity_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-04 01:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"activityName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":18,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-09-04 01:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"startTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EndTime\",\"columnComment\":\"结束时间\",\"columnId\":19,\"columnName\":\"end_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-09-04 01:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"end', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 01:58:31');
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-04 01:58:44');
INSERT INTO `sys_oper_log` VALUES (139, '竞赛审核', 1, 'com.ruoyi.web.controller.system.CompetitionAuditController.add()', 'POST', 1, 'admin', '', '/system/audit', '127.0.0.1', '内网IP', '{\"activityName\":\"1232\",\"endTime\":\"2022-09-22 00:00:00\",\"params\":{},\"startTime\":\"2022-09-06 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 02:33:25');
INSERT INTO `sys_oper_log` VALUES (140, '竞赛审核', 3, 'com.ruoyi.web.controller.system.CompetitionAuditController.remove()', 'DELETE', 1, 'admin', '', '/system/audit/1', '127.0.0.1', '内网IP', '{activityIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 02:33:50');
INSERT INTO `sys_oper_log` VALUES (141, '竞赛审核', 1, 'com.ruoyi.web.controller.system.CompetitionAuditController.add()', 'POST', 1, 'admin', '', '/system/audit', '127.0.0.1', '内网IP', '{\"activityName\":\"123\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 02:33:56');
INSERT INTO `sys_oper_log` VALUES (142, '竞赛审核', 2, 'com.ruoyi.web.controller.system.CompetitionAuditController.edit()', 'PUT', 1, 'admin', '', '/system/audit', '127.0.0.1', '内网IP', '{\"activityId\":2,\"activityName\":\"123\",\"endTime\":\"2022-09-23 00:00:00\",\"params\":{},\"startTime\":\"2022-09-06 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 02:34:51');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2022-09-04 11:54:07');
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2022-09-04 11:55:02');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2022-09-04 11:56:29');
INSERT INTO `sys_oper_log` VALUES (146, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 17:55:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 11:58:39');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 11:58:46');
INSERT INTO `sys_oper_log` VALUES (148, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"N\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2022-08-27 17:55:59\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 12:00:30');
INSERT INTO `sys_oper_log` VALUES (149, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2022-08-27 17:55:59\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-04 12:00:30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-04 12:01:12');
INSERT INTO `sys_oper_log` VALUES (150, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 17:55:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2014,2015,2016,2017,2018,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 00:53:45');
INSERT INTO `sys_oper_log` VALUES (151, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-08-27 17:55:59\",\"delFlag\":\"0\",\"email\":\"ry@qq.com\",\"loginDate\":\"2022-09-05 00:52:02\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"Syy\",\"params\":{},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 00:54:37');
INSERT INTO `sys_oper_log` VALUES (152, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '', '/system/user/authRole', '127.0.0.1', '内网IP', '2 [2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 00:54:52');
INSERT INTO `sys_oper_log` VALUES (153, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '', '/system/user/2', '127.0.0.1', '内网IP', '{userIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 00:55:03');
INSERT INTO `sys_oper_log` VALUES (154, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"2498177249@qq.com\",\"nickName\":\"Syy\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"管理员\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"Syy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 00:55:50');
INSERT INTO `sys_oper_log` VALUES (155, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '', '/system/user/authRole', '127.0.0.1', '内网IP', '100 [2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 00:55:58');
INSERT INTO `sys_oper_log` VALUES (156, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 17:55:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2014,2015,2016,2017,2018,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 01:19:55');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/audit/index\",\"createTime\":\"2022-09-04 00:45:58\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"竞赛审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"audit\",\"perms\":\"system:audit:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 01:23:33');
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '', '/tool/gen/3', '127.0.0.1', '内网IP', '{tableIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 02:52:29');
INSERT INTO `sys_oper_log` VALUES (159, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', 'competition_audit', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 02:52:37');
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"audit\",\"className\":\"CompetitionAudit\",\"columns\":[{\"capJavaField\":\"ActivityId\",\"columnId\":20,\"columnName\":\"activity_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-09-05 02:52:37\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityName\",\"columnId\":21,\"columnName\":\"activity_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-05 02:52:37\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"activityName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnId\":22,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-09-05 02:52:37\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"startTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EndTime\",\"columnId\":23,\"columnName\":\"end_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-09-05 02:52:37\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"endTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":4,\"superColumn\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 03:06:43');
INSERT INTO `sys_oper_log` VALUES (161, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"单位管理员\",\"roleId\":100,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 21:49:11');
INSERT INTO `sys_oper_log` VALUES (162, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"单位人员\",\"roleId\":101,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 21:50:02');
INSERT INTO `sys_oper_log` VALUES (163, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":102,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 21:50:25');
INSERT INTO `sys_oper_log` VALUES (164, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-05 00:55:50\",\"delFlag\":\"0\",\"email\":\"2498177249@qq.com\",\"loginDate\":\"2022-09-05 01:24:27\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"Syy\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"管理员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"Syy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 22:05:55');
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2009', '127.0.0.1', '内网IP', '{menuId=2009}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2022-09-05 22:36:51');
INSERT INTO `sys_oper_log` VALUES (166, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 17:55:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2008,2000,2001,2014,2015,2016,2017,2018,2002,2003,2004,2005,2006,2007,2010,2011,2012],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 22:37:03');
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2009', '127.0.0.1', '内网IP', '{menuId=2009}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-05 22:37:08');
INSERT INTO `sys_oper_log` VALUES (168, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-05 00:55:50\",\"delFlag\":\"0\",\"email\":\"2498177249@qq.com\",\"loginDate\":\"2022-09-05 01:24:27\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"Syy1234\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"管理员\",\"roleIds\":[],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"Syy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-06 01:44:46');
INSERT INTO `sys_oper_log` VALUES (169, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-05 00:55:50\",\"delFlag\":\"0\",\"email\":\"2498177249@qq.com\",\"loginDate\":\"2022-09-05 01:24:27\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"Syy1234\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"管理员\",\"roleIds\":[2],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"Syy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-06 02:47:29');
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_tuser', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-06 15:24:20');
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"user\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":31,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"用户账号\",\"columnId\":32,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"用户昵称\",\"columnId\":33,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"用户性别（0男 1女 2未知）\",\"columnId\":34,\"columnName\":\"sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sex\",\"javaType\":\"Str', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-06 15:31:51');
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"user\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":31,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-09-06 15:31:51\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"用户账号\",\"columnId\":32,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-09-06 15:31:51\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"用户昵称\",\"columnId\":33,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-09-06 15:31:51\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"用户性别（0男 1女 2未知）\",\"columnId\":34,\"columnName\":\"sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-06 15:51:59');
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"user\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":31,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-09-06 15:51:59\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"用户账号\",\"columnId\":32,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-09-06 15:51:59\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"用户昵称\",\"columnId\":33,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-09-06 15:51:59\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"用户性别（0男 1女 2未知）\",\"columnId\":34,\"columnName\":\"sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncremen', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-06 15:55:17');
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"user\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":31,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-09-06 15:55:16\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"用户账号\",\"columnId\":32,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-09-06 15:55:16\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"用户昵称\",\"columnId\":33,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-09-06 15:55:16\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"用户性别（0男 1女 2未知）\",\"columnId\":34,\"columnName\":\"sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-06 15:56:37');
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tuser\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":31,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-09-06 15:56:37\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"用户账号\",\"columnId\":32,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-09-06 15:56:37\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"用户昵称\",\"columnId\":33,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-09-06 15:56:37\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"用户性别（0男 1女 2未知）\",\"columnId\":34,\"columnName\":\"sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-06 16:53:40');
INSERT INTO `sys_oper_log` VALUES (176, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-06 16:55:34');
INSERT INTO `sys_oper_log` VALUES (177, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{},\"status\":\"1\",\"userId\":1}', NULL, 1, '不允许操作超级管理员用户', '2022-09-07 01:36:08');
INSERT INTO `sys_oper_log` VALUES (178, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"249@qq.com\",\"nickName\":\"Syy\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"syy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 01:37:24');
INSERT INTO `sys_oper_log` VALUES (179, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 01:39:26');
INSERT INTO `sys_oper_log` VALUES (180, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '', '/system/user/authRole', '127.0.0.1', '内网IP', '101 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 01:40:24');
INSERT INTO `sys_oper_log` VALUES (181, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '', '/system/user/authRole', '127.0.0.1', '内网IP', '101 [3,2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 01:40:30');
INSERT INTO `sys_oper_log` VALUES (182, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-09-05 21:49:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114],\"params\":{},\"remark\":\"单位管理员\",\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 01:42:03');
INSERT INTO `sys_oper_log` VALUES (183, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '', '/system/user/authRole', '127.0.0.1', '内网IP', '101 [2,3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 01:42:12');
INSERT INTO `sys_oper_log` VALUES (184, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2022/09/07/blob_20220907014647A001.jpeg\",\"code\":200}', 0, NULL, '2022-09-07 01:46:47');
INSERT INTO `sys_oper_log` VALUES (185, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"245@qq.com\",\"nickName\":\"Sy\",\"params\":{},\"phonenumber\":\"13222245678\",\"remark\":\"123\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":102,\"userName\":\"qw\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 02:00:46');
INSERT INTO `sys_oper_log` VALUES (186, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '', '/system/user/102', '127.0.0.1', '内网IP', '{userIds=102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 02:02:22');
INSERT INTO `sys_oper_log` VALUES (187, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"qry@qq.com\",\"nickName\":\"st\",\"params\":{},\"phonenumber\":\"13228821615\",\"remark\":\"123\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":103,\"userName\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 02:02:52');
INSERT INTO `sys_oper_log` VALUES (188, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"111@qq.com\",\"nickName\":\"qqq\",\"params\":{},\"phonenumber\":\"13224567876\",\"roleIds\":[],\"status\":\"0\",\"userId\":104,\"userName\":\"12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 02:11:25');
INSERT INTO `sys_oper_log` VALUES (189, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"nickName\":\"123\",\"params\":{},\"phonenumber\":\"13245678652\",\"roleIds\":[],\"status\":\"0\",\"userName\":\"123\"}', '{\"msg\":\"新增用户\'123\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2022-09-07 02:12:49');
INSERT INTO `sys_oper_log` VALUES (190, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"nickName\":\"12323\",\"params\":{},\"phonenumber\":\"13245678652\",\"roleIds\":[],\"status\":\"0\",\"userName\":\"123\"}', '{\"msg\":\"新增用户\'123\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2022-09-07 02:12:56');
INSERT INTO `sys_oper_log` VALUES (191, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"12323\",\"params\":{},\"phonenumber\":\"13245678652\",\"roleIds\":[],\"status\":\"0\",\"userId\":105,\"userName\":\"12312\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 02:13:03');
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '', '/system/user/authRole', '127.0.0.1', '内网IP', '101 [2,3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 02:29:51');
INSERT INTO `sys_oper_log` VALUES (193, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '', '/system/user/authRole', '127.0.0.1', '内网IP', '101 [2,3,4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 02:30:10');
INSERT INTO `sys_oper_log` VALUES (194, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"nickName\":\"1232\",\"params\":{},\"phonenumber\":\"13222245937\",\"roleIds\":[],\"status\":\"0\",\"userName\":\"1232\"}', '{\"msg\":\"新增用户\'1232\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2022-09-07 03:42:34');
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"tuser\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":31,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-09-06 16:53:39\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"用户账号\",\"columnId\":32,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-09-06 16:53:39\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"用户昵称\",\"columnId\":33,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-09-06 16:53:39\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"用户性别（0男 1女 2未知）\",\"columnId\":34,\"columnName\":\"sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-06 15:24:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 16:24:09');
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2006', '127.0.0.1', '内网IP', '{menuId=2006}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2022-09-07 16:26:54');
INSERT INTO `sys_oper_log` VALUES (197, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 17:55:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 16:27:10');
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2006', '127.0.0.1', '内网IP', '{menuId=2006}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 16:27:16');
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/tuser/index\",\"createTime\":\"2022-09-07 16:25:25\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2043,\"menuName\":\"单位人员\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"tuser\",\"perms\":\"system:tuser:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 16:28:10');
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-07 16:31:21');
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"重置密码\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2043,\"perms\":\"system:tuser:resetPwd\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 17:00:04');
INSERT INTO `sys_oper_log` VALUES (202, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 17:24:32');
INSERT INTO `sys_oper_log` VALUES (203, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 17:24:34');
INSERT INTO `sys_oper_log` VALUES (204, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{},\"status\":\"1\",\"userId\":1}', NULL, 1, '不允许操作超级管理员用户', '2022-09-07 17:30:05');
INSERT INTO `sys_oper_log` VALUES (205, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"1234@qq.com\",\"nickName\":\"qwe\",\"params\":{},\"phonenumber\":\"13224567871\",\"roleIds\":[2],\"status\":\"0\",\"userId\":107,\"userName\":\"qwe\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 17:53:51');
INSERT INTO `sys_oper_log` VALUES (206, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 18:00:39');
INSERT INTO `sys_oper_log` VALUES (207, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 18:00:42');
INSERT INTO `sys_oper_log` VALUES (208, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 18:01:00');
INSERT INTO `sys_oper_log` VALUES (209, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 01:37:24\",\"delFlag\":\"0\",\"direction\":\"医学影像学\",\"email\":\"249@qq.com\",\"job\":\"主任\",\"loginDate\":\"2022-09-07 01:42:28\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"Syy\",\"orgnization\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"syy\",\"userRemark\":\"12344\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 18:33:29');
INSERT INTO `sys_oper_log` VALUES (210, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 17:53:51\",\"delFlag\":\"0\",\"email\":\"1234@qq.com\",\"loginDate\":\"2022-09-07 17:54:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"qwe\",\"orgnization\":\"苏州大学\",\"params\":{},\"phonenumber\":\"13224567871\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":107,\"userName\":\"qwe\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-07 18:41:40');
INSERT INTO `sys_oper_log` VALUES (211, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"125544@qq.com\",\"nickName\":\"sds\",\"params\":{},\"phonenumber\":\"13224587922\",\"roleIds\":[],\"status\":\"0\",\"userName\":\"admin\"}', '{\"msg\":\"新增用户\'admin\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2022-09-07 18:58:19');
INSERT INTO `sys_oper_log` VALUES (212, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '', '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0, NULL, '2022-09-08 00:29:24');
INSERT INTO `sys_oper_log` VALUES (213, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '', '/system/user/authRole', '127.0.0.1', '内网IP', '107 [2,3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 01:05:17');
INSERT INTO `sys_oper_log` VALUES (214, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{},\"status\":\"1\",\"userId\":1}', NULL, 1, '不允许操作超级管理员用户', '2022-09-08 01:38:22');
INSERT INTO `sys_oper_log` VALUES (215, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '', '/system/user/1', '127.0.0.1', '内网IP', '{userIds=1}', '{\"msg\":\"当前用户不能删除\",\"code\":500}', 0, NULL, '2022-09-08 01:44:06');
INSERT INTO `sys_oper_log` VALUES (216, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 02:12:38');
INSERT INTO `sys_oper_log` VALUES (217, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 17:55:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2004,2043,2044,2045,2046,2047,2048,2049],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 02:22:28');
INSERT INTO `sys_oper_log` VALUES (218, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '', '/system/user/authRole', '127.0.0.1', '内网IP', '101 [2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 02:22:42');
INSERT INTO `sys_oper_log` VALUES (219, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 02:22:55');
INSERT INTO `sys_oper_log` VALUES (220, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'syy', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"syy\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 02:29:17');
INSERT INTO `sys_oper_log` VALUES (221, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'syy', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"syy\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 02:29:19');
INSERT INTO `sys_oper_log` VALUES (222, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'syy', '', '/system/user/authRole', '127.0.0.1', '内网IP', '107 [2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 02:29:50');
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_suser', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 02:33:20');
INSERT INTO `sys_oper_log` VALUES (224, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"suser\",\"className\":\"SysSuser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":53,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 02:33:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"用户账号\",\"columnId\":54,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 02:33:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"用户昵称\",\"columnId\":55,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 02:33:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"用户性别（0男 1女 2未知）\",\"columnId\":56,\"columnName\":\"sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 02:33:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sex\",\"javaType\":\"S', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 02:35:43');
INSERT INTO `sys_oper_log` VALUES (225, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2007', '127.0.0.1', '内网IP', '{menuId=2007}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 02:36:48');
INSERT INTO `sys_oper_log` VALUES (226, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"重置密码\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2050,\"perms\":\"system:suser:resetPwd\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 02:39:21');
INSERT INTO `sys_oper_log` VALUES (227, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"suser\",\"className\":\"SysSuser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":53,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 02:33:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2022-09-08 02:35:42\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"用户账号\",\"columnId\":54,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 02:33:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2022-09-08 02:35:42\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"用户昵称\",\"columnId\":55,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 02:33:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2022-09-08 02:35:42\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"用户性别（0男 1女 2未知）\",\"columnId\":56,\"columnName\":\"sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 02:33:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 02:52:10');
INSERT INTO `sys_oper_log` VALUES (228, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"gkg@qq.com\",\"nickName\":\"asd\",\"params\":{},\"phonenumber\":\"13224567283\",\"roleIds\":[],\"status\":\"0\",\"userId\":10013224567283,\"userName\":\"asd\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 04:33:05');
INSERT INTO `sys_oper_log` VALUES (229, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/suser/index\",\"createTime\":\"2022-09-08 02:37:01\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2050,\"menuName\":\"学生账号\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"suser\",\"perms\":\"system:suser:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 05:56:02');
INSERT INTO `sys_oper_log` VALUES (230, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 15:18:11');
INSERT INTO `sys_oper_log` VALUES (231, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"jbdkj@qq.com\",\"nickName\":\"asds\",\"params\":{},\"phonenumber\":\"13224565234\",\"roleIds\":[5],\"status\":\"0\",\"userId\":20013224565234,\"userName\":\"asdf\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 15:30:30');
INSERT INTO `sys_oper_log` VALUES (232, '用户管理', 3, 'com.ruoyi.web.controller.system.SysSuserController.remove()', 'DELETE', 1, 'admin', '', '/system/suser/107', '127.0.0.1', '内网IP', '{userIds=107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 15:31:21');
INSERT INTO `sys_oper_log` VALUES (233, '用户管理', 3, 'com.ruoyi.web.controller.system.SysSuserController.remove()', 'DELETE', 1, 'admin', '', '/system/suser/101', '127.0.0.1', '内网IP', '{userIds=101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 15:31:24');
INSERT INTO `sys_oper_log` VALUES (234, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_activity', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 16:22:44');
INSERT INTO `sys_oper_log` VALUES (235, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"activity\",\"className\":\"SysActivity\",\"columns\":[{\"capJavaField\":\"ActivityId\",\"columnComment\":\"竞赛ID\",\"columnId\":76,\"columnName\":\"activity_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 16:22:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityName\",\"columnComment\":\"竞赛名称\",\"columnId\":77,\"columnName\":\"activity_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 16:22:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"activityName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":78,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 16:22:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"startTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EndTime\",\"columnComment\":\"结束时间\",\"columnId\":79,\"columnName\":\"end_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 16:22:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 16:29:07');
INSERT INTO `sys_oper_log` VALUES (236, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-08 16:29:36');
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2012', '127.0.0.1', '内网IP', '{menuId=2012}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 17:15:55');
INSERT INTO `sys_oper_log` VALUES (238, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2011', '127.0.0.1', '内网IP', '{menuId=2011}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 17:16:03');
INSERT INTO `sys_oper_log` VALUES (239, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_organization', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 17:16:11');
INSERT INTO `sys_oper_log` VALUES (240, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"organization\",\"className\":\"SysOrganization\",\"columns\":[{\"capJavaField\":\"OrganizationId\",\"columnComment\":\"机构ID\",\"columnId\":86,\"columnName\":\"organization_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 17:16:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"organizationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrganizationName\",\"columnComment\":\"机构名称\",\"columnId\":87,\"columnName\":\"organization_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 17:16:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"organizationName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrganizationField\",\"columnComment\":\"机构地点\",\"columnId\":88,\"columnName\":\"organization_field\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 17:16:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"organizationField\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrganizationPho\",\"columnComment\":\"联系电话\",\"columnId\":89,\"columnName\":\"organization_pho\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 17:16:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 17:18:44');
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/organization/index\",\"createTime\":\"2022-09-08 17:19:06\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2057,\"menuName\":\"机构管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"organization\",\"perms\":\"system:organization:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 17:19:56');
INSERT INTO `sys_oper_log` VALUES (242, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-08 17:20:14');
INSERT INTO `sys_oper_log` VALUES (243, '机构管理', 1, 'com.ruoyi.web.controller.system.SysOrganizationController.add()', 'POST', 1, 'admin', '', '/system/organization', '127.0.0.1', '内网IP', '{\"organizationField\":\"四排楼\",\"organizationId\":1,\"organizationName\":\"东南大学\",\"organizationPho\":\"13222245937\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 17:36:30');
INSERT INTO `sys_oper_log` VALUES (244, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_activity_type', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 17:41:04');
INSERT INTO `sys_oper_log` VALUES (245, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"activitytype\",\"className\":\"SysActivityType\",\"columns\":[{\"capJavaField\":\"TypeId\",\"columnComment\":\"类型ID\",\"columnId\":91,\"columnName\":\"type_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 17:41:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeName\",\"columnComment\":\"活动类型\",\"columnId\":92,\"columnName\":\"type_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 17:41:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeRemark\",\"columnComment\":\"活动类型备注\",\"columnId\":93,\"columnName\":\"type_remark\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 17:41:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeRemark\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"syy\",\"functionName\":\"活动类型\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{\\\"parentMenuId\\\":2008}\",\"packageName\":\"com.ruoyi.system\",\"params\":{\"parentMenuId\":2008},\"parentMenuId\":\"2008\",\"sub\":false,\"tableComment\":\"活动类型表\",\"tableId\":9,\"tableName\":\"sys_activity_type\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 17:43:57');
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2010', '127.0.0.1', '内网IP', '{menuId=2010}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 17:44:06');
INSERT INTO `sys_oper_log` VALUES (247, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-08 17:44:41');
INSERT INTO `sys_oper_log` VALUES (248, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/activitytype/index\",\"createTime\":\"2022-09-08 17:44:31\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2063,\"menuName\":\"活动类型\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"activitytype\",\"perms\":\"system:activitytype:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 17:52:41');
INSERT INTO `sys_oper_log` VALUES (249, '活动类型', 1, 'com.ruoyi.web.controller.system.SysActivityTypeController.add()', 'POST', 1, 'admin', '', '/system/activitytype', '127.0.0.1', '内网IP', '{\"params\":{},\"typeId\":1,\"typeName\":\"类型1\",\"typeRemark\":\"促销价百事可乐的\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 17:55:17');
INSERT INTO `sys_oper_log` VALUES (250, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '', '/tool/gen/4', '127.0.0.1', '内网IP', '{tableIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:17:40');
INSERT INTO `sys_oper_log` VALUES (251, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"activity\",\"className\":\"SysActivity\",\"columns\":[{\"capJavaField\":\"ActivityId\",\"columnComment\":\"竞赛ID\",\"columnId\":76,\"columnName\":\"activity_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 16:22:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2022-09-08 16:29:07\",\"usableColumn\":false},{\"capJavaField\":\"ActivityName\",\"columnComment\":\"竞赛名称\",\"columnId\":77,\"columnName\":\"activity_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 16:22:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"activityName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2022-09-08 16:29:07\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":78,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 16:22:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"startTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2022-09-08 16:29:07\",\"usableColumn\":false},{\"capJavaField\":\"EndTime\",\"columnComment\":\"结束时间\",\"columnId\":79,\"columnName\":\"end_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 16:22:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:20:10');
INSERT INTO `sys_oper_log` VALUES (252, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2002', '127.0.0.1', '内网IP', '{menuId=2002}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:20:44');
INSERT INTO `sys_oper_log` VALUES (253, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-09-08 18:21:16');
INSERT INTO `sys_oper_log` VALUES (254, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/activity/index\",\"createTime\":\"2022-09-08 18:21:03\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2069,\"menuName\":\"竞赛管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"activity\",\"perms\":\"system:activity:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:35:09');
INSERT INTO `sys_oper_log` VALUES (255, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/online/index\",\"createTime\":\"2022-09-04 00:50:55\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"竞赛申报\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"apply\",\"perms\":\"system:activity:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:38:10');
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/activity/addactivity\",\"createTime\":\"2022-09-04 00:50:55\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"竞赛申报\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"apply\",\"perms\":\"system:activity:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:38:38');
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/activity/activityadd\",\"createTime\":\"2022-09-04 00:50:55\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"竞赛申报\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"apply\",\"perms\":\"system:activity:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:46:00');
INSERT INTO `sys_oper_log` VALUES (258, '竞赛管理', 1, 'com.ruoyi.web.controller.system.SysActivityController.add()', 'POST', 1, 'admin', '', '/system/activity', '127.0.0.1', '内网IP', '{\"activityDeclarer\":\"123\",\"activityId\":3,\"activityName\":\"测试\",\"activityOrganizer\":\"123\",\"activityPlace\":\"123\",\"activityScale\":13,\"endTime\":\"2022-09-23 00:00:00\",\"params\":{},\"startTime\":\"2022-09-05 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:47:14');
INSERT INTO `sys_oper_log` VALUES (259, '竞赛管理', 1, 'com.ruoyi.web.controller.system.SysActivityController.add()', 'POST', 1, 'admin', '', '/system/activity', '127.0.0.1', '内网IP', '{\"activityDeclarer\":\"12345\",\"activityId\":4,\"activityName\":\"1231\",\"activityOrganizer\":\"wefgh\",\"activityPlace\":\"cvb\",\"activityScale\":123,\"endTime\":\"2022-09-15 00:00:00\",\"params\":{},\"startTime\":\"2022-09-05 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:48:22');
INSERT INTO `sys_oper_log` VALUES (260, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 17:55:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2000,2001,2014,2015,2016,2017,2018,2069,2070,2071,2072,2073,2074,2003,2004,2005,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2008,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:49:51');
INSERT INTO `sys_oper_log` VALUES (261, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 01:37:24\",\"delFlag\":\"0\",\"direction\":\"医学影像学\",\"email\":\"249@qq.com\",\"job\":\"主任\",\"loginDate\":\"2022-09-08 02:23:17\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"沈云瑶\",\"orgnization\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[2],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"master\",\"userRemark\":\"12344\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:50:13');
INSERT INTO `sys_oper_log` VALUES (262, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:50:30');
INSERT INTO `sys_oper_log` VALUES (263, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'master', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-09-05 21:49:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2004,2069,2070,2071,2072,2073,2074,2003,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056],\"params\":{},\"remark\":\"单位管理员\",\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"master\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:56:25');
INSERT INTO `sys_oper_log` VALUES (264, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'master', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-09-05 21:50:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2069,2070,2071,2072,2073,2074],\"params\":{},\"remark\":\"单位人员\",\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\",\"updateBy\":\"master\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:56:34');
INSERT INTO `sys_oper_log` VALUES (265, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'master', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 17:53:51\",\"delFlag\":\"0\",\"email\":\"1234@qq.com\",\"loginDate\":\"2022-09-07 17:54:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"qwe\",\"orgnization\":\"苏州大学\",\"params\":{},\"phonenumber\":\"13224567871\",\"roleIds\":[3],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"master\",\"userId\":107,\"userName\":\"qwe\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:56:50');
INSERT INTO `sys_oper_log` VALUES (266, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'master', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"master\",\"userId\":107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 18:57:05');
INSERT INTO `sys_oper_log` VALUES (267, '竞赛管理', 1, 'com.ruoyi.web.controller.system.SysActivityController.add()', 'POST', 1, 'master', '', '/system/activity', '127.0.0.1', '内网IP', '{\"activityDeclarer\":\"12\",\"activityId\":5,\"activityName\":\"awe\",\"activityOrganizer\":\"1244\",\"activityPlace\":\"122\",\"activityScale\":123,\"endTime\":\"2022-09-23 00:00:00\",\"params\":{},\"startTime\":\"2022-09-13 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-08 19:01:09');
INSERT INTO `sys_oper_log` VALUES (268, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'master', '', '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"status\":\"1\"}', NULL, 1, '不允许操作超级管理员角色', '2022-09-08 19:02:32');
INSERT INTO `sys_oper_log` VALUES (269, '机构管理', 5, 'com.ruoyi.web.controller.system.SysOrganizationController.export()', 'POST', 1, 'admin', '', '/system/organization/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2022-09-09 00:09:27');
INSERT INTO `sys_oper_log` VALUES (270, '机构管理', 2, 'com.ruoyi.web.controller.system.SysOrganizationController.edit()', 'PUT', 1, 'admin', '', '/system/organization', '127.0.0.1', '内网IP', '{\"organizationField\":\"四牌楼\",\"organizationId\":1,\"organizationName\":\"东南大学\",\"organizationPho\":\"13222245937\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 00:33:13');
INSERT INTO `sys_oper_log` VALUES (271, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{},\"status\":\"1\",\"userId\":1}', NULL, 1, '不允许操作超级管理员用户', '2022-09-09 03:09:33');
INSERT INTO `sys_oper_log` VALUES (272, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 01:37:24\",\"delFlag\":\"0\",\"direction\":\"医学影像学\",\"email\":\"249@qq.com\",\"job\":\"主任\",\"loginDate\":\"2022-09-09 03:51:33\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[2,3],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"master\",\"userRemark\":\"12344\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 03:52:34');
INSERT INTO `sys_oper_log` VALUES (273, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 01:37:24\",\"delFlag\":\"0\",\"direction\":\"医学影像学\",\"email\":\"249@qq.com\",\"job\":\"主任\",\"loginDate\":\"2022-09-09 03:51:33\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"master\",\"userRemark\":\"12344\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 03:53:00');
INSERT INTO `sys_oper_log` VALUES (274, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 03:55:26');
INSERT INTO `sys_oper_log` VALUES (275, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 01:37:24\",\"delFlag\":\"0\",\"direction\":\"医学影像学\",\"email\":\"249@qq.com\",\"job\":\"主任\",\"loginDate\":\"2022-09-09 03:55:32\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[3,2],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"master\",\"userRemark\":\"12344\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 03:56:26');
INSERT INTO `sys_oper_log` VALUES (276, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 03:58:15');
INSERT INTO `sys_oper_log` VALUES (277, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'master', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 01:37:24\",\"delFlag\":\"0\",\"direction\":\"医学影像学\",\"email\":\"249@qq.com\",\"job\":\"主任\",\"loginDate\":\"2022-09-09 03:59:31\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"master\",\"userId\":101,\"userName\":\"master\",\"userRemark\":\"12344\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 05:04:22');
INSERT INTO `sys_oper_log` VALUES (278, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 01:37:24\",\"delFlag\":\"0\",\"direction\":\"医学影像学\",\"email\":\"249@qq.com\",\"job\":\"主任\",\"loginDate\":\"2022-09-09 05:06:21\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[3,4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"master\",\"userRemark\":\"12344\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 06:51:51');
INSERT INTO `sys_oper_log` VALUES (279, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 17:53:51\",\"delFlag\":\"0\",\"email\":\"1234@qq.com\",\"loginDate\":\"2022-09-08 19:10:45\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"qwet\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13224567871\",\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":107,\"userName\":\"qwe\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 06:52:19');
INSERT INTO `sys_oper_log` VALUES (280, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 06:53:06');
INSERT INTO `sys_oper_log` VALUES (281, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 01:37:24\",\"delFlag\":\"0\",\"direction\":\"医学影像学\",\"email\":\"249@qq.com\",\"job\":\"主任\",\"loginDate\":\"2022-09-09 05:06:21\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[3,4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"master\",\"userRemark\":\"12344\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 06:53:18');
INSERT INTO `sys_oper_log` VALUES (282, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 07:00:32');
INSERT INTO `sys_oper_log` VALUES (283, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 07:01:09');
INSERT INTO `sys_oper_log` VALUES (284, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 07:08:28');
INSERT INTO `sys_oper_log` VALUES (285, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 01:37:24\",\"delFlag\":\"0\",\"direction\":\"医学影像学\",\"email\":\"249@qq.com\",\"job\":\"主任\",\"loginDate\":\"2022-09-09 05:06:21\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[3,4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"master\",\"userRemark\":\"12344\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 07:08:44');
INSERT INTO `sys_oper_log` VALUES (286, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 01:37:24\",\"delFlag\":\"0\",\"direction\":\"医学影像学\",\"email\":\"249@qq.com\",\"job\":\"主任\",\"loginDate\":\"2022-09-09 05:06:21\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[3,4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"master\",\"userRemark\":\"12344\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 07:10:26');
INSERT INTO `sys_oper_log` VALUES (287, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 07:11:25');
INSERT INTO `sys_oper_log` VALUES (288, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 01:37:24\",\"delFlag\":\"0\",\"direction\":\"医学影像学\",\"email\":\"249@qq.com\",\"job\":\"主任1\",\"loginDate\":\"2022-09-09 05:06:21\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[3,4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"master\",\"userRemark\":\"12344\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 07:16:39');
INSERT INTO `sys_oper_log` VALUES (289, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 01:37:24\",\"delFlag\":\"0\",\"direction\":\"医学影像学\",\"email\":\"249123@qq.com\",\"job\":\"主任1\",\"loginDate\":\"2022-09-09 05:06:21\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[3,4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"master\",\"userRemark\":\"12344\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 07:16:59');
INSERT INTO `sys_oper_log` VALUES (290, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 07:19:51');
INSERT INTO `sys_oper_log` VALUES (291, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 17:53:51\",\"delFlag\":\"0\",\"direction\":\"asdf\",\"email\":\"1234@qq.com\",\"loginDate\":\"2022-09-08 19:10:45\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"qwet\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13224567871\",\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":107,\"userName\":\"qwe\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 07:20:08');
INSERT INTO `sys_oper_log` VALUES (292, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 04:33:05\",\"delFlag\":\"0\",\"email\":\"gkg@qq.com\",\"loginIp\":\"\",\"nickName\":\"asd\",\"orgnization\":1,\"orgnizationName\":\"苏州大学\",\"params\":{},\"phonenumber\":\"13224567283\",\"roleIds\":[],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013224567283,\"userName\":\"asd\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 07:38:10');
INSERT INTO `sys_oper_log` VALUES (293, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 04:33:05\",\"delFlag\":\"0\",\"email\":\"gkg@qq.com\",\"loginIp\":\"\",\"nickName\":\"asd\",\"orgnization\":2,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13224567283\",\"roleIds\":[],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013224567283,\"userName\":\"asd\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 07:38:22');
INSERT INTO `sys_oper_log` VALUES (294, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 17:53:51\",\"delFlag\":\"0\",\"direction\":\"asdf\",\"email\":\"1234@qq.com\",\"loginDate\":\"2022-09-09 07:53:30\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"qwet\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13224567871\",\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":107,\"userName\":\"qwe\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 07:54:17');
INSERT INTO `sys_oper_log` VALUES (295, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 01:37:24\",\"delFlag\":\"0\",\"direction\":\"医学影像学\",\"email\":\"249123@qq.com\",\"job\":\"主任1\",\"loginDate\":\"2022-09-09 05:06:21\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[3,4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"master\",\"userRemark\":\"12344\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 08:34:18');
INSERT INTO `sys_oper_log` VALUES (296, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'qwe', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"qwe\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 08:35:06');
INSERT INTO `sys_oper_log` VALUES (297, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'qwe', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 01:37:24\",\"delFlag\":\"0\",\"direction\":\"医学影像学\",\"email\":\"249123@qq.com\",\"job\":\"主任12\",\"loginDate\":\"2022-09-09 05:06:21\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[3,4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"qwe\",\"userId\":101,\"userName\":\"master\",\"userRemark\":\"12344\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 08:35:12');
INSERT INTO `sys_oper_log` VALUES (298, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'qwe', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"qwe\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 08:35:26');
INSERT INTO `sys_oper_log` VALUES (299, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'qwe', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"qwe\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 08:35:28');
INSERT INTO `sys_oper_log` VALUES (300, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 04:33:05\",\"delFlag\":\"0\",\"email\":\"gkg@qq.com\",\"loginIp\":\"\",\"nickName\":\"asd\",\"orgnization\":2,\"orgnizationName\":\"苏州大学\",\"params\":{},\"phonenumber\":\"13224567283\",\"roleIds\":[4],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013224567283,\"userName\":\"asd\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 08:41:29');
INSERT INTO `sys_oper_log` VALUES (301, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'qwe', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"qwe\",\"email\":\"cxc@qq.com\",\"nickName\":\"sasas\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13222245936\",\"roleIds\":[4],\"status\":\"0\",\"userId\":10013222245936,\"userName\":\"syysyy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 08:57:12');
INSERT INTO `sys_oper_log` VALUES (302, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"qwe\",\"createTime\":\"2022-09-09 08:57:12\",\"delFlag\":\"0\",\"email\":\"cxc@qq.com\",\"loginIp\":\"\",\"nickName\":\"sasas\",\"orgnization\":2,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245936\",\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222245936,\"userName\":\"syysyy\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 08:57:51');
INSERT INTO `sys_oper_log` VALUES (303, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'qwe', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"qwe\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 08:58:22');
INSERT INTO `sys_oper_log` VALUES (304, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 01:37:24\",\"delFlag\":\"0\",\"direction\":\"医学影像学\",\"email\":\"249123@qq.com\",\"job\":\"主任12\",\"loginDate\":\"2022-09-09 08:58:45\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"remark\":\"123445\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"master\",\"userRemark\":\"12344\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 08:59:06');
INSERT INTO `sys_oper_log` VALUES (305, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-09-05 21:49:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2004,2069,2070,2071,2072,2073,2074,2003,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056],\"params\":{},\"remark\":\"单位管理员\",\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:06:07');
INSERT INTO `sys_oper_log` VALUES (306, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, 'qwe', '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20013224565234}', NULL, 1, '没有权限访问用户数据！', '2022-09-09 09:06:40');
INSERT INTO `sys_oper_log` VALUES (307, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.changeStatus()', 'PUT', 1, 'qwe', '', '/system/suser/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"userId\":20013224565234}', NULL, 1, '没有权限访问用户数据！', '2022-09-09 09:07:29');
INSERT INTO `sys_oper_log` VALUES (308, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.changeStatus()', 'PUT', 1, 'qwe', '', '/system/suser/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"userId\":20013224565234}', NULL, 1, '没有权限访问用户数据！', '2022-09-09 09:17:54');
INSERT INTO `sys_oper_log` VALUES (309, '用户管理', 3, 'com.ruoyi.web.controller.system.SysSuserController.remove()', 'DELETE', 1, 'qwe', '', '/system/suser/20013224565234', '127.0.0.1', '内网IP', '{userIds=20013224565234}', NULL, 1, '没有权限访问用户数据！', '2022-09-09 09:18:06');
INSERT INTO `sys_oper_log` VALUES (310, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 15:30:30\",\"delFlag\":\"0\",\"email\":\"jbdkj@qq.com\",\"loginIp\":\"\",\"nickName\":\"asdsa\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13224565234\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":20013224565234,\"userName\":\"asdf\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:19:44');
INSERT INTO `sys_oper_log` VALUES (311, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/suser/index\",\"createTime\":\"2022-09-08 02:37:01\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2050,\"menuName\":\"学生账号\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2004,\"path\":\"suser\",\"perms\":\"system:suser:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:24:31');
INSERT INTO `sys_oper_log` VALUES (312, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, 'qwe', '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20013224565234}', NULL, 1, '没有权限访问用户数据！', '2022-09-09 09:24:58');
INSERT INTO `sys_oper_log` VALUES (313, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'qwe', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"qwe\",\"email\":\"sd@qq.com\",\"nickName\":\"111\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13245678909\",\"roleIds\":[5],\"status\":\"0\",\"userId\":20013245678909,\"userName\":\"123111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:25:48');
INSERT INTO `sys_oper_log` VALUES (314, '用户管理', 3, 'com.ruoyi.web.controller.system.SysSuserController.remove()', 'DELETE', 1, 'qwe', '', '/system/suser/20013245678909', '127.0.0.1', '内网IP', '{userIds=20013245678909}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:25:54');
INSERT INTO `sys_oper_log` VALUES (315, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 15:30:30\",\"delFlag\":\"0\",\"email\":\"jbdkj@qq.com\",\"loginIp\":\"\",\"nickName\":\"asdsa\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13224565234\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-09 09:19:44\",\"userId\":20013224565234,\"userName\":\"asdf\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:26:26');
INSERT INTO `sys_oper_log` VALUES (316, '用户管理', 3, 'com.ruoyi.web.controller.system.SysSuserController.remove()', 'DELETE', 1, 'admin', '', '/system/suser/20013224565234', '127.0.0.1', '内网IP', '{userIds=20013224565234}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:26:30');
INSERT INTO `sys_oper_log` VALUES (317, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"sa@qq.com\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13222245937\",\"roleIds\":[5],\"status\":\"0\",\"userName\":\"172030402101\"}', '{\"msg\":\"新增用户\'172030402101\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2022-09-09 09:27:12');
INSERT INTO `sys_oper_log` VALUES (318, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"sa@qq.com\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13222245937\",\"roleIds\":[5],\"status\":\"0\",\"userName\":\"172030402101\"}', '{\"msg\":\"新增用户\'172030402101\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2022-09-09 09:27:16');
INSERT INTO `sys_oper_log` VALUES (319, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"sa@qq.com\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13222245937\",\"roleIds\":[5],\"status\":\"0\",\"userId\":20013222245937,\"userName\":\"172030402101\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:27:56');
INSERT INTO `sys_oper_log` VALUES (320, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"sa@qq.com\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13222245937\",\"roleIds\":[5],\"status\":\"0\",\"userName\":\"172030402101\"}', '{\"msg\":\"新增用户\'172030402101\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2022-09-09 09:27:57');
INSERT INTO `sys_oper_log` VALUES (321, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'qwe', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"qwe\",\"email\":\"sdfg@qq.com\",\"nickName\":\"11111\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13245657821\",\"roleIds\":[5],\"status\":\"0\",\"userId\":20013245657821,\"userName\":\"12233\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:28:50');
INSERT INTO `sys_oper_log` VALUES (322, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, 'qwe', '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"qwe\",\"userId\":20013245657821}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:29:07');
INSERT INTO `sys_oper_log` VALUES (323, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, 'qwe', '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"qwe\",\"userId\":20013222245937}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:29:12');
INSERT INTO `sys_oper_log` VALUES (324, '用户管理', 3, 'com.ruoyi.web.controller.system.SysSuserController.remove()', 'DELETE', 1, 'qwe', '', '/system/suser/20013222245937', '127.0.0.1', '内网IP', '{userIds=20013222245937}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:29:14');
INSERT INTO `sys_oper_log` VALUES (325, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"kgub@qq.com\",\"nickName\":\"qwe\",\"params\":{},\"phonenumber\":\"13452673889\",\"roleIds\":[5],\"status\":\"0\",\"userId\":20013452673889,\"userName\":\"172030402101\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:32:01');
INSERT INTO `sys_oper_log` VALUES (326, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-09 09:32:01\",\"delFlag\":\"0\",\"email\":\"kgub@qq.com\",\"loginIp\":\"\",\"nickName\":\"qwe\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13452673889\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":20013452673889,\"userName\":\"172030402101\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:32:16');
INSERT INTO `sys_oper_log` VALUES (327, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, 'qwe', '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20013452673889}', NULL, 1, '没有权限访问用户数据！', '2022-09-09 09:32:31');
INSERT INTO `sys_oper_log` VALUES (328, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"2345465@qq.com\",\"nickName\":\"234\",\"params\":{},\"phonenumber\":\"13222245678\",\"roleIds\":[5],\"status\":\"0\",\"userId\":20013222245678,\"userName\":\"12341\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:33:18');
INSERT INTO `sys_oper_log` VALUES (329, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-09 09:33:18\",\"delFlag\":\"0\",\"email\":\"2345465@qq.com\",\"loginIp\":\"\",\"nickName\":\"234\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13222245678\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":20013222245678,\"userName\":\"12341\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:33:30');
INSERT INTO `sys_oper_log` VALUES (330, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"chtxyvu@qq.com\",\"nickName\":\"1234565432\",\"orgnization\":2,\"params\":{},\"phonenumber\":\"13256789876\",\"roleIds\":[5],\"status\":\"0\",\"userId\":20013256789876,\"userName\":\"12345\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:36:35');
INSERT INTO `sys_oper_log` VALUES (331, '用户管理', 3, 'com.ruoyi.web.controller.system.SysSuserController.remove()', 'DELETE', 1, 'admin', '', '/system/suser/20013222245678', '127.0.0.1', '内网IP', '{userIds=20013222245678}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:36:45');
INSERT INTO `sys_oper_log` VALUES (332, '用户管理', 3, 'com.ruoyi.web.controller.system.SysSuserController.remove()', 'DELETE', 1, 'admin', '', '/system/suser/20013452673889', '127.0.0.1', '内网IP', '{userIds=20013452673889}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:36:48');
INSERT INTO `sys_oper_log` VALUES (333, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"13186502185@qq.com\",\"nickName\":\"admin\",\"params\":{},\"phonenumber\":\"13186502185\",\"roleIds\":[5],\"status\":\"0\",\"userId\":20013186502185,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:38:13');
INSERT INTO `sys_oper_log` VALUES (334, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"sdfghj@qq.com\",\"nickName\":\"12321\",\"params\":{},\"phonenumber\":\"13222245937\",\"roleIds\":[5],\"status\":\"0\",\"userId\":20013222245937,\"userName\":\"12321\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:39:53');
INSERT INTO `sys_oper_log` VALUES (335, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-09 09:39:53\",\"delFlag\":\"0\",\"email\":\"sdfghj@qq.com\",\"loginIp\":\"\",\"nickName\":\"12321\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13222245937\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":20013222245937,\"userName\":\"12321\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:40:00');
INSERT INTO `sys_oper_log` VALUES (336, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"lkujythrsasdfgh@qq.com\",\"nickName\":\"8765432\",\"params\":{},\"phonenumber\":\"13245345670\",\"roleIds\":[5],\"status\":\"0\",\"userId\":20013245345670,\"userName\":\"1234567\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:43:57');
INSERT INTO `sys_oper_log` VALUES (337, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-09 09:43:57\",\"delFlag\":\"0\",\"email\":\"lkujythrsasdfgh@qq.com\",\"loginIp\":\"\",\"nickName\":\"8765432\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13245345670\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":20013245345670,\"userName\":\"1234567\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:44:03');
INSERT INTO `sys_oper_log` VALUES (338, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, 'master', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-09 09:43:57\",\"delFlag\":\"0\",\"email\":\"lkujythrsasdfgh@qq.com\",\"loginIp\":\"\",\"nickName\":\"8765432\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13245345670\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"master\",\"updateTime\":\"2022-09-09 09:44:03\",\"userId\":20013245345670,\"userName\":\"1234567\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:44:14');
INSERT INTO `sys_oper_log` VALUES (339, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, 'master', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-09 09:39:53\",\"delFlag\":\"0\",\"email\":\"sdfghj@qq.com\",\"loginIp\":\"\",\"nickName\":\"12321\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"master\",\"updateTime\":\"2022-09-09 09:40:00\",\"userId\":20013222245937,\"userName\":\"12321\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:44:20');
INSERT INTO `sys_oper_log` VALUES (340, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, 'master', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-09 09:39:53\",\"delFlag\":\"0\",\"email\":\"sdfghj@qq.com\",\"loginIp\":\"\",\"nickName\":\"12321\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222245937\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"master\",\"updateTime\":\"2022-09-09 09:44:20\",\"userId\":20013222245937,\"userName\":\"12321566778\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:44:29');
INSERT INTO `sys_oper_log` VALUES (341, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":10013222245936}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:45:14');
INSERT INTO `sys_oper_log` VALUES (342, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"qwe\",\"createTime\":\"2022-09-09 08:57:12\",\"delFlag\":\"0\",\"email\":\"cxc@qq.com\",\"loginIp\":\"\",\"nickName\":\"sasas\",\"orgnization\":2,\"orgnizationName\":\"苏州大学\",\"params\":{},\"phonenumber\":\"13222245936\",\"roleIds\":[3],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222245936,\"userName\":\"syysyy\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:45:21');
INSERT INTO `sys_oper_log` VALUES (343, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, 'master', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-09 09:43:57\",\"delFlag\":\"0\",\"email\":\"lkujythrsasdfgh@qq.com\",\"loginIp\":\"\",\"nickName\":\"8765432\",\"orgnization\":2,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13245345670\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"master\",\"updateTime\":\"2022-09-09 09:44:14\",\"userId\":20013245345670,\"userName\":\"1234567\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:45:34');
INSERT INTO `sys_oper_log` VALUES (344, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, 'syysyy', '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"syysyy\",\"userId\":20013245345670}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:46:18');
INSERT INTO `sys_oper_log` VALUES (345, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.changeStatus()', 'PUT', 1, 'syysyy', '', '/system/suser/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"syysyy\",\"userId\":20013245345670}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:46:22');
INSERT INTO `sys_oper_log` VALUES (346, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.changeStatus()', 'PUT', 1, 'syysyy', '', '/system/suser/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"syysyy\",\"userId\":20013245345670}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:46:24');
INSERT INTO `sys_oper_log` VALUES (347, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-09 09:43:57\",\"delFlag\":\"0\",\"email\":\"lkujythrsasdfgh@qq.com\",\"loginIp\":\"\",\"nickName\":\"8765432\",\"orgnization\":1,\"orgnizationName\":\"苏州大学\",\"params\":{},\"phonenumber\":\"13245345670\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-09 09:46:24\",\"userId\":20013245345670,\"userName\":\"1234567\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:46:51');
INSERT INTO `sys_oper_log` VALUES (348, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"t75676@qq.com\",\"nickName\":\"545267698\",\"orgnization\":2,\"params\":{},\"phonenumber\":\"13535358756\",\"roleIds\":[5],\"status\":\"0\",\"userId\":20013535358756,\"userName\":\"765556786\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:47:23');
INSERT INTO `sys_oper_log` VALUES (349, '用户管理', 3, 'com.ruoyi.web.controller.system.SysSuserController.remove()', 'DELETE', 1, 'admin', '', '/system/suser/20013245345670', '127.0.0.1', '内网IP', '{userIds=20013245345670}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:48:01');
INSERT INTO `sys_oper_log` VALUES (350, '用户管理', 3, 'com.ruoyi.web.controller.system.SysSuserController.remove()', 'DELETE', 1, 'admin', '', '/system/suser/20013222245937', '127.0.0.1', '内网IP', '{userIds=20013222245937}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:48:04');
INSERT INTO `sys_oper_log` VALUES (351, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:48:35');
INSERT INTO `sys_oper_log` VALUES (352, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"3434@qq.com\",\"nickName\":\"12232435\",\"params\":{},\"phonenumber\":\"13245638733\",\"roleIds\":[5],\"status\":\"0\",\"userId\":20013245638733,\"userName\":\"1234334\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:49:22');
INSERT INTO `sys_oper_log` VALUES (353, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-09 09:49:22\",\"delFlag\":\"0\",\"email\":\"3434@qq.com\",\"loginIp\":\"\",\"nickName\":\"12232435\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13245638733\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":20013245638733,\"userName\":\"1234334\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 09:49:31');
INSERT INTO `sys_oper_log` VALUES (354, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'master', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 17:55:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,2000,2001,2014,2015,2016,2017,2018,2069,2070,2071,2072,2073,2074,2003,2004,2043,2044,2045,2046,2047,2048,2049,2005,2050,2051,2052,2053,2054,2055,2056,2008,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,1,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"master\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 11:04:16');
INSERT INTO `sys_oper_log` VALUES (355, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'master', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"2498177249@qq.com\",\"nickName\":\"沈云瑶\",\"params\":{},\"phonenumber\":\"13222245937\",\"roleIds\":[4,3],\"status\":\"0\",\"userName\":\"syy123\"}', '{\"msg\":\"新增用户\'syy123\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2022-09-09 11:07:58');
INSERT INTO `sys_oper_log` VALUES (356, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'master', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"master\",\"email\":\"2498177249@qq.com\",\"nickName\":\"沈云瑶\",\"params\":{},\"phonenumber\":\"13222459872\",\"roleIds\":[4,3],\"status\":\"0\",\"userId\":10013222459872,\"userName\":\"syy123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 11:08:36');
INSERT INTO `sys_oper_log` VALUES (357, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'master', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"master\",\"createTime\":\"2022-09-09 11:08:36\",\"delFlag\":\"0\",\"email\":\"2498177249@qq.com\",\"loginIp\":\"\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13222459872\",\"roleIds\":[3,4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"master\",\"userId\":10013222459872,\"userName\":\"syy123\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 11:08:45');
INSERT INTO `sys_oper_log` VALUES (358, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'master', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"master\",\"userId\":10013222459872}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 11:09:53');
INSERT INTO `sys_oper_log` VALUES (359, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'master', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-09-05 21:50:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2069,2070,2071,2072,2073,2074,2003],\"params\":{},\"remark\":\"单位人员\",\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\",\"updateBy\":\"master\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-09 11:26:17');
INSERT INTO `sys_oper_log` VALUES (360, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-04 15:19:34');
INSERT INTO `sys_oper_log` VALUES (361, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-04 16:35:37');
INSERT INTO `sys_oper_log` VALUES (362, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '', '/system/user/authRole', '127.0.0.1', '内网IP', '10013222459872 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-04 16:48:27');
INSERT INTO `sys_oper_log` VALUES (363, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":10013222459872}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-04 16:48:42');
INSERT INTO `sys_oper_log` VALUES (364, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 04:33:05\",\"delFlag\":\"0\",\"email\":\"gkg@qq.com\",\"loginIp\":\"\",\"nickName\":\"asd\",\"orgnization\":1,\"orgnizationName\":\"苏州大学\",\"params\":{},\"phonenumber\":\"13224567283\",\"roleIds\":[],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013224567283,\"userName\":\"asd\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-04 16:49:34');
INSERT INTO `sys_oper_log` VALUES (365, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '', '/system/user/authRole', '127.0.0.1', '内网IP', '10013224567283 [4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-04 16:49:49');
INSERT INTO `sys_oper_log` VALUES (366, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'master', '', '/system/user/authRole', '127.0.0.1', '内网IP', '10013222459872 [4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-04 17:38:25');
INSERT INTO `sys_oper_log` VALUES (367, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '', '/system/user/authRole', '127.0.0.1', '内网IP', '10013222459872 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-05 18:45:32');
INSERT INTO `sys_oper_log` VALUES (368, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013224567283}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-13 16:59:27');
INSERT INTO `sys_oper_log` VALUES (369, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '', '/system/user/10013224567283', '127.0.0.1', '内网IP', '{userIds=10013224567283}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-13 17:09:20');
INSERT INTO `sys_oper_log` VALUES (370, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/tuser/index\",\"createTime\":\"2022-09-07 16:25:25\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2043,\"menuName\":\"单位人员\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2004,\"path\":\"tuser\",\"perms\":\"system:tuser:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 00:59:56');
INSERT INTO `sys_oper_log` VALUES (371, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/suser/index\",\"createTime\":\"2022-09-08 02:37:01\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2050,\"menuName\":\"学生账号\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2004,\"path\":\"suser\",\"perms\":\"system:suser:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 01:00:07');
INSERT INTO `sys_oper_log` VALUES (372, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"单位人员审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 01:01:13');
INSERT INTO `sys_oper_log` VALUES (373, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-10-14 01:01:13\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2075,\"menuName\":\"单位人员审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"tuser\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 01:10:25');
INSERT INTO `sys_oper_log` VALUES (374, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-09-04 00:56:39\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"人员审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"audit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 01:10:47');
INSERT INTO `sys_oper_log` VALUES (375, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-10-14 01:01:13\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2075,\"menuName\":\"单位人员审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"tuser\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 01:12:02');
INSERT INTO `sys_oper_log` VALUES (376, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/audit/tuser/index\",\"createTime\":\"2022-10-14 01:01:13\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2075,\"menuName\":\"单位人员审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"tuser\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 01:12:45');
INSERT INTO `sys_oper_log` VALUES (377, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/audit/tuser/index\",\"createTime\":\"2022-10-14 01:01:13\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2075,\"menuName\":\"单位人员审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"tuser\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 01:14:14');
INSERT INTO `sys_oper_log` VALUES (378, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-09-04 00:56:39\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"人员审核\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"audit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 01:15:39');
INSERT INTO `sys_oper_log` VALUES (379, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/audit/tuser/index\",\"createTime\":\"2022-10-14 01:01:13\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2075,\"menuName\":\"单位人员审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"tuser\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 01:16:03');
INSERT INTO `sys_oper_log` VALUES (380, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/audit/tuser/index\",\"createTime\":\"2022-10-14 01:01:13\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2075,\"menuName\":\"单位人员\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"tuser\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 01:17:40');
INSERT INTO `sys_oper_log` VALUES (381, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/audit/suser/index\",\"createBy\":\"admin\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生账号\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2005,\"path\":\"suser\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 01:18:40');
INSERT INTO `sys_oper_log` VALUES (382, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/audit/suser/index\",\"createTime\":\"2022-10-14 01:18:40\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2076,\"menuName\":\"学生审核\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2005,\"path\":\"suser\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 01:20:24');
INSERT INTO `sys_oper_log` VALUES (383, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/audit/tuser/index\",\"createTime\":\"2022-10-14 01:01:13\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2075,\"menuName\":\"教师审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"tuser\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 01:20:34');
INSERT INTO `sys_oper_log` VALUES (384, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'PUT', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:38:28');
INSERT INTO `sys_oper_log` VALUES (385, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'PUT', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:38:33');
INSERT INTO `sys_oper_log` VALUES (386, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'PUT', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:48:38');
INSERT INTO `sys_oper_log` VALUES (387, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'PUT', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:48:40');
INSERT INTO `sys_oper_log` VALUES (388, '活动类型', 3, 'com.ruoyi.web.controller.system.SysActivityTypeController.remove()', 'DELETE', 1, 'admin', '', '/system/activitytype/1', '127.0.0.1', '内网IP', '{typeIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 17:15:53');
INSERT INTO `sys_oper_log` VALUES (389, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '', '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{\"dataScope\":\"\"},\"status\":\"2\",\"userId\":1}', NULL, 0, NULL, '2022-10-15 18:18:02');
INSERT INTO `sys_oper_log` VALUES (390, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '', '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{\"dataScope\":\"\"},\"status\":\"2\",\"userId\":1}', NULL, 0, NULL, '2022-10-15 18:18:45');
INSERT INTO `sys_oper_log` VALUES (391, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '', '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{\"dataScope\":\"\"},\"userId\":1}', NULL, 0, NULL, '2022-10-15 18:19:19');
INSERT INTO `sys_oper_log` VALUES (392, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '', '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{\"dataScope\":\"\"},\"userId\":1}', NULL, 0, NULL, '2022-10-15 18:24:30');
INSERT INTO `sys_oper_log` VALUES (393, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '', '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{\"dataScope\":\"\"},\"userId\":1}', NULL, 0, NULL, '2022-10-15 18:25:33');
INSERT INTO `sys_oper_log` VALUES (394, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '', '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{\"dataScope\":\"\"},\"userId\":1}', NULL, 0, NULL, '2022-10-15 18:28:37');
INSERT INTO `sys_oper_log` VALUES (395, '用户管理', 5, 'com.ruoyi.web.controller.system.SysSuserController.export()', 'POST', 1, 'admin', '', '/system/suser/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0, NULL, '2022-10-15 18:29:02');
INSERT INTO `sys_oper_log` VALUES (396, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '', '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{\"dataScope\":\"\"},\"userId\":1}', NULL, 0, NULL, '2022-10-15 18:30:10');
INSERT INTO `sys_oper_log` VALUES (397, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserauditController.export()', 'POST', 1, 'admin', '', '/system/tuseraudit/export', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{\"dataScope\":\"\"},\"userId\":1}', NULL, 0, NULL, '2022-10-15 18:30:40');
INSERT INTO `sys_oper_log` VALUES (398, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '', '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{\"dataScope\":\"\"},\"userId\":1}', NULL, 0, NULL, '2022-10-15 18:31:22');
INSERT INTO `sys_oper_log` VALUES (399, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserauditController.export()', 'POST', 1, 'admin', '', '/system/tuseraudit/export', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{\"dataScope\":\"\"},\"userId\":1}', NULL, 0, NULL, '2022-10-15 18:32:41');
INSERT INTO `sys_oper_log` VALUES (400, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '', '/system/user/10013222245936', '127.0.0.1', '内网IP', '{userIds=10013222245936}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 18:35:00');
INSERT INTO `sys_oper_log` VALUES (401, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"13222245936@qq.com\",\"nickName\":\"gun\",\"params\":{},\"phonenumber\":\"13222245936\",\"roleIds\":[4],\"status\":\"0\",\"userName\":\"gun\"}', '{\"msg\":\"新增用户\'gun\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2022-10-15 18:35:35');
INSERT INTO `sys_oper_log` VALUES (402, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 17:53:51\",\"delFlag\":\"0\",\"direction\":\"asdf\",\"email\":\"1234@qq.com\",\"loginDate\":\"2022-10-05 18:44:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"qwet\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13224567871\",\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":107,\"userName\":\"qwe\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 19:44:42');
INSERT INTO `sys_oper_log` VALUES (403, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 17:53:51\",\"delFlag\":\"0\",\"direction\":\"asdf\",\"email\":\"1234@qq.com\",\"loginDate\":\"2022-10-05 18:44:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"qwet\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13224567871\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":107,\"userName\":\"qwe\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 19:44:50');
INSERT INTO `sys_oper_log` VALUES (404, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"dsaf@qq.com\",\"nickName\":\"qwer\",\"params\":{},\"phonenumber\":\"13222245998\",\"roleIds\":[],\"status\":\"0\",\"userId\":10013222245998,\"userName\":\"qwer\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 19:45:36');
INSERT INTO `sys_oper_log` VALUES (405, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:45:36\",\"delFlag\":\"0\",\"email\":\"dsaf@qq.com\",\"loginIp\":\"\",\"nickName\":\"qwer\",\"params\":{},\"phonenumber\":\"13222245998\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222245998,\"userName\":\"qwer\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 19:49:27');
INSERT INTO `sys_oper_log` VALUES (406, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:45:36\",\"delFlag\":\"0\",\"email\":\"dsaf@qq.com\",\"loginIp\":\"\",\"nickName\":\"qwer\",\"params\":{},\"phonenumber\":\"13222245998\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222245998,\"userName\":\"qwer\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 19:54:13');
INSERT INTO `sys_oper_log` VALUES (407, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"dsaf@qq.com\",\"nickName\":\"qaz\",\"params\":{},\"phonenumber\":\"13222245768\",\"roleIds\":[4],\"status\":\"0\",\"userName\":\"qaz\"}', '{\"msg\":\"新增用户\'qaz\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2022-10-15 19:56:36');
INSERT INTO `sys_oper_log` VALUES (408, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"dsaf@qq.com\",\"nickName\":\"qazq\",\"params\":{},\"phonenumber\":\"13222245768\",\"roleIds\":[4],\"status\":\"0\",\"userName\":\"qazq\"}', '{\"msg\":\"新增用户\'qazq\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2022-10-15 19:56:43');
INSERT INTO `sys_oper_log` VALUES (409, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"dsaffff@qq.com\",\"nickName\":\"qazq\",\"params\":{},\"phonenumber\":\"13222245768\",\"roleIds\":[4],\"status\":\"0\",\"userId\":10013222245768,\"userName\":\"qazq\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 19:56:49');
INSERT INTO `sys_oper_log` VALUES (410, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:45:36\",\"delFlag\":\"0\",\"email\":\"dsaf@qq.com\",\"loginIp\":\"\",\"nickName\":\"qwer\",\"params\":{},\"phonenumber\":\"13222245998\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222245998,\"userName\":\"qwer\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 20:02:56');
INSERT INTO `sys_oper_log` VALUES (411, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:45:36\",\"delFlag\":\"0\",\"email\":\"dsaf@qq.com\",\"loginIp\":\"\",\"nickName\":\"qwer\",\"params\":{},\"phonenumber\":\"13222245998\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222245998,\"userName\":\"qwer\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 20:03:18');
INSERT INTO `sys_oper_log` VALUES (412, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:45:36\",\"delFlag\":\"0\",\"email\":\"dsaf@qq.com\",\"loginIp\":\"\",\"nickName\":\"qwer\",\"params\":{},\"phonenumber\":\"13222245998\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222245998,\"userName\":\"qwer\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 20:04:18');
INSERT INTO `sys_oper_log` VALUES (413, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:45:36\",\"delFlag\":\"0\",\"email\":\"dsaf@qq.com\",\"loginIp\":\"\",\"nickName\":\"qwer\",\"params\":{},\"phonenumber\":\"13222245998\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222245998,\"userName\":\"qwer\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 20:07:35');
INSERT INTO `sys_oper_log` VALUES (414, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:45:36\",\"delFlag\":\"0\",\"email\":\"dsaf@qq.com\",\"loginIp\":\"\",\"nickName\":\"qwer\",\"params\":{},\"phonenumber\":\"13222245998\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222245998,\"userName\":\"qwer\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 20:08:08');
INSERT INTO `sys_oper_log` VALUES (415, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:45:36\",\"delFlag\":\"0\",\"email\":\"dsaf@qq.com\",\"loginIp\":\"\",\"nickName\":\"qwer\",\"params\":{},\"phonenumber\":\"13222245998\",\"roleIds\":[4],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222245998,\"userName\":\"qwer\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 20:18:30');
INSERT INTO `sys_oper_log` VALUES (416, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 17:53:51\",\"delFlag\":\"0\",\"direction\":\"asdf\",\"email\":\"1234@qq.com\",\"loginDate\":\"2022-10-05 18:44:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"qwet\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13224567871\",\"roleIds\":[3],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":107,\"userName\":\"qwe\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 20:18:40');
INSERT INTO `sys_oper_log` VALUES (417, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 17:53:51\",\"delFlag\":\"0\",\"direction\":\"asdf\",\"email\":\"1234@qq.com\",\"loginDate\":\"2022-10-05 18:44:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"qwet\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13224567871\",\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":107,\"userName\":\"qwe\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 20:18:47');
INSERT INTO `sys_oper_log` VALUES (418, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserauditController.export()', 'POST', 1, 'admin', '', '/system/tuseraudit/export', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{\"dataScope\":\"\"},\"userId\":1}', NULL, 0, NULL, '2022-10-17 00:29:21');
INSERT INTO `sys_oper_log` VALUES (419, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '', '/system/user/authRole', '127.0.0.1', '内网IP', '10013222245768 [3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-17 10:06:06');
INSERT INTO `sys_oper_log` VALUES (420, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '', '/system/user/10013222245998', '127.0.0.1', '内网IP', '{userIds=10013222245998}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-19 17:32:48');
INSERT INTO `sys_oper_log` VALUES (421, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '', '/system/user/10013222245998', '127.0.0.1', '内网IP', '{userIds=10013222245998}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-19 17:33:46');
INSERT INTO `sys_oper_log` VALUES (422, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":10013222245936}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-19 17:50:25');
INSERT INTO `sys_oper_log` VALUES (423, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222245936}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-19 17:50:28');
INSERT INTO `sys_oper_log` VALUES (424, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":10013222245936}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-19 17:51:15');
INSERT INTO `sys_oper_log` VALUES (425, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222245936}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-19 17:52:11');
INSERT INTO `sys_oper_log` VALUES (426, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222245998}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-19 17:55:05');
INSERT INTO `sys_oper_log` VALUES (427, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 123456', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2022-10-19 18:43:06');
INSERT INTO `sys_oper_log` VALUES (428, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2022-10-19 18:45:00');
INSERT INTO `sys_oper_log` VALUES (429, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2022-10-19 18:45:43');
INSERT INTO `sys_oper_log` VALUES (430, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123456 123456', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2022-10-19 18:47:03');
INSERT INTO `sys_oper_log` VALUES (431, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123456 123456', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2022-10-19 18:47:05');
INSERT INTO `sys_oper_log` VALUES (432, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123456 123456', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2022-10-19 18:47:13');
INSERT INTO `sys_oper_log` VALUES (433, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2022-10-19 18:47:29');
INSERT INTO `sys_oper_log` VALUES (434, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":10013222245998}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-19 18:47:48');
INSERT INTO `sys_oper_log` VALUES (435, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'qwer', '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 1234567', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2022-10-19 18:48:19');
INSERT INTO `sys_oper_log` VALUES (436, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'qwer', '', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:45:36\",\"delFlag\":\"0\",\"email\":\"dsafa@qq.com\",\"loginIp\":\"\",\"nickName\":\"qwer\",\"params\":{},\"phonenumber\":\"13222245998\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":10013222245998,\"userName\":\"qwer\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-19 18:49:17');
INSERT INTO `sys_oper_log` VALUES (437, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'qwer', '', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:45:36\",\"delFlag\":\"0\",\"email\":\"dsafa@qq.com\",\"loginIp\":\"\",\"nickName\":\"qwer\",\"params\":{},\"phonenumber\":\"13222245999\",\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":10013222245998,\"userName\":\"qwer\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-19 18:49:47');
INSERT INTO `sys_oper_log` VALUES (438, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'qwer', '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 1234567', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2022-10-19 18:50:37');
INSERT INTO `sys_oper_log` VALUES (439, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'qwer', '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 1234567', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2022-10-19 18:52:40');
INSERT INTO `sys_oper_log` VALUES (440, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'qwer', '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 1234567', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2022-10-19 18:56:23');
INSERT INTO `sys_oper_log` VALUES (441, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'qwer', '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 1234567', '{\"msg\":\"123456修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2022-10-19 18:58:02');
INSERT INTO `sys_oper_log` VALUES (442, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'qwer', '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 1234567', '{\"msg\":\"null修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2022-10-19 18:59:21');
INSERT INTO `sys_oper_log` VALUES (443, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'qwer', '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 1234567', '{\"msg\":\"qwer修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2022-10-19 19:12:04');
INSERT INTO `sys_oper_log` VALUES (444, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'PUT', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-10-20 18:21:27');
INSERT INTO `sys_oper_log` VALUES (445, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'PUT', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '', '{\"msg\":\"当前用户不能\",\"code\":500}', 0, NULL, '2022-10-20 18:24:51');
INSERT INTO `sys_oper_log` VALUES (446, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'PUT', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '', '{\"msg\":\"当前用户不能\",\"code\":500}', 0, NULL, '2022-10-20 18:25:28');
INSERT INTO `sys_oper_log` VALUES (447, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'PUT', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '[10013222459872] 0', '{\"msg\":\"当前用户不能\",\"code\":500}', 0, NULL, '2022-10-20 18:27:53');
INSERT INTO `sys_oper_log` VALUES (448, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'PUT', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '[10013222459872] 0', '{\"msg\":\"当前用户不能\",\"code\":500}', 0, NULL, '2022-10-20 18:35:02');
INSERT INTO `sys_oper_log` VALUES (449, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'PUT', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '', '{\"msg\":\"当前用户不能\",\"code\":500}', 0, NULL, '2022-10-20 18:39:23');
INSERT INTO `sys_oper_log` VALUES (450, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '', '{\"msg\":\"当前用户不能\",\"code\":500}', 0, NULL, '2022-10-20 18:51:35');
INSERT INTO `sys_oper_log` VALUES (451, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '', '{\"msg\":\"当前用户不能\",\"code\":500}', 0, NULL, '2022-10-20 18:57:57');
INSERT INTO `sys_oper_log` VALUES (452, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\"}', '{\"msg\":\"当前用户不能\",\"code\":500}', 0, NULL, '2022-10-21 09:07:07');
INSERT INTO `sys_oper_log` VALUES (453, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '', '{\"msg\":\"当前用户不能\",\"code\":500}', 0, NULL, '2022-10-21 09:17:16');
INSERT INTO `sys_oper_log` VALUES (454, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\"}', '{\"msg\":\"当前用户不能\",\"code\":500}', 0, NULL, '2022-10-21 09:21:02');
INSERT INTO `sys_oper_log` VALUES (455, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"userIds\":[10013222459872],\"status\":\"0\"}', '{\"msg\":\"当前用户不能\",\"code\":500}', 0, NULL, '2022-10-21 09:23:12');
INSERT INTO `sys_oper_log` VALUES (456, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013222459872]}', '{\"msg\":\"当前用户不能\",\"code\":500}', 0, NULL, '2022-10-21 09:30:42');
INSERT INTO `sys_oper_log` VALUES (457, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013222459872]}', '{\"msg\":\"当前用户不能\",\"code\":500}', 0, NULL, '2022-10-21 09:31:27');
INSERT INTO `sys_oper_log` VALUES (458, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013224567283]}', NULL, 1, 'class java.lang.String cannot be cast to class java.lang.Long (java.lang.String and java.lang.Long are in module java.base of loader \'bootstrap\')', '2022-10-21 10:21:07');
INSERT INTO `sys_oper_log` VALUES (459, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013224567283]}', NULL, 1, 'class java.util.ArrayList cannot be cast to class [Ljava.lang.Long; (java.util.ArrayList and [Ljava.lang.Long; are in module java.base of loader \'bootstrap\')', '2022-10-21 10:26:47');
INSERT INTO `sys_oper_log` VALUES (460, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013224567283]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-21 10:37:42');
INSERT INTO `sys_oper_log` VALUES (461, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":10013222459872}', NULL, 1, 'class java.lang.Long cannot be cast to class java.util.ArrayList (java.lang.Long and java.util.ArrayList are in module java.base of loader \'bootstrap\')', '2022-10-21 10:38:13');
INSERT INTO `sys_oper_log` VALUES (462, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":10013222459872}', NULL, 1, 'class java.lang.Long cannot be cast to class java.util.ArrayList (java.lang.Long and java.util.ArrayList are in module java.base of loader \'bootstrap\')', '2022-10-21 10:38:35');
INSERT INTO `sys_oper_log` VALUES (463, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":10013222459872}', NULL, 1, 'class java.lang.Long cannot be cast to class java.util.ArrayList (java.lang.Long and java.util.ArrayList are in module java.base of loader \'bootstrap\')', '2022-10-21 10:39:12');
INSERT INTO `sys_oper_log` VALUES (464, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":10013222459872}', NULL, 1, 'class java.lang.Long cannot be cast to class java.util.ArrayList (java.lang.Long and java.util.ArrayList are in module java.base of loader \'bootstrap\')', '2022-10-21 10:41:33');
INSERT INTO `sys_oper_log` VALUES (465, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":10013222459872}', NULL, 1, 'class java.lang.Long cannot be cast to class java.util.ArrayList (java.lang.Long and java.util.ArrayList are in module java.base of loader \'bootstrap\')', '2022-10-21 10:49:37');
INSERT INTO `sys_oper_log` VALUES (466, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":10013222459872}', '{\"msg\":\"userService.updateUserStatus(status,userIds)\",\"code\":500}', 0, NULL, '2022-10-21 10:50:23');
INSERT INTO `sys_oper_log` VALUES (467, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013222459872]}', '{\"msg\":\"userService.updateUserStatus(status,userIds)\",\"code\":500}', 0, NULL, '2022-10-21 10:50:56');
INSERT INTO `sys_oper_log` VALUES (468, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":10013222459872}', '{\"msg\":\"userService.updateUserStatus(status,userIds)\",\"code\":500}', 0, NULL, '2022-10-21 10:51:36');
INSERT INTO `sys_oper_log` VALUES (469, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":10013222459872}', NULL, 1, 'class java.lang.Long cannot be cast to class java.util.ArrayList (java.lang.Long and java.util.ArrayList are in module java.base of loader \'bootstrap\')', '2022-10-21 10:53:02');
INSERT INTO `sys_oper_log` VALUES (470, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '', '/system/user/10013224567283', '127.0.0.1', '内网IP', '{userIds=10013224567283}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-21 10:54:04');
INSERT INTO `sys_oper_log` VALUES (471, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '', '/system/user/10013222245936,10013222245998', '127.0.0.1', '内网IP', '{userIds=10013222245936,10013222245998}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-21 10:54:20');
INSERT INTO `sys_oper_log` VALUES (472, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"userIds\":10013222459872}', NULL, 1, '', '2022-10-21 11:04:40');
INSERT INTO `sys_oper_log` VALUES (473, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":10013222459872}', NULL, 1, 'class java.lang.Long cannot be cast to class java.util.ArrayList (java.lang.Long and java.util.ArrayList are in module java.base of loader \'bootstrap\')', '2022-10-21 11:05:22');
INSERT INTO `sys_oper_log` VALUES (474, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"3\",\"userIds\":[]}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n### The error may exist in file [/Users/shenyunyao/Desktop/竞赛系统开发/源文件/RuoYi-Vue/ruoyi-system/target/classes/mapper/system/SysUserauditMapper.xml]\n### The error may involve com.ruoyi.system.mapper.SysUserauditMapper.updateUserStatus-Inline\n### The error occurred while setting parameters\n### SQL: update sys_tuser set status = ? where user_id in\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2022-10-21 11:10:48');
INSERT INTO `sys_oper_log` VALUES (475, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"3\",\"userIds\":[]}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n### The error may exist in file [/Users/shenyunyao/Desktop/竞赛系统开发/源文件/RuoYi-Vue/ruoyi-system/target/classes/mapper/system/SysUserauditMapper.xml]\n### The error may involve com.ruoyi.system.mapper.SysUserauditMapper.updateUserStatus-Inline\n### The error occurred while setting parameters\n### SQL: update sys_tuser set status = ? where user_id in\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2022-10-21 11:11:34');
INSERT INTO `sys_oper_log` VALUES (476, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"3\",\"userIds\":[10013222459872]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-21 11:12:45');
INSERT INTO `sys_oper_log` VALUES (477, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013222459872,10013224567283]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-21 11:13:31');
INSERT INTO `sys_oper_log` VALUES (478, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:45:36\",\"delFlag\":\"0\",\"email\":\"dsafa@qq.com\",\"loginDate\":\"2022-10-19 18:48:04\",\"loginIp\":\"\",\"nickName\":\"qwer\",\"params\":{},\"phonenumber\":\"13222245999\",\"roleIds\":[3],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222245998,\"userName\":\"qwer\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-21 11:21:48');
INSERT INTO `sys_oper_log` VALUES (479, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:45:36\",\"delFlag\":\"0\",\"email\":\"dsafa@qq.com\",\"loginDate\":\"2022-10-19 18:48:04\",\"loginIp\":\"\",\"nickName\":\"qwer\",\"params\":{},\"phonenumber\":\"13222245999\",\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222245998,\"userName\":\"qwer\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-21 11:22:05');
INSERT INTO `sys_oper_log` VALUES (480, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013222459872]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-21 11:23:41');
INSERT INTO `sys_oper_log` VALUES (481, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":10013222459872}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-21 11:33:51');
INSERT INTO `sys_oper_log` VALUES (482, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10013222459872}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-21 11:33:55');
INSERT INTO `sys_oper_log` VALUES (483, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013224567283]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-26 18:45:13');
INSERT INTO `sys_oper_log` VALUES (484, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, 'admin', '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013222459872,10013224567283]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-26 18:45:28');
INSERT INTO `sys_oper_log` VALUES (485, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2070', '127.0.0.1', '内网IP', '{menuId=2070}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2022-11-25 17:41:00');
INSERT INTO `sys_oper_log` VALUES (486, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 17:55:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,1,2004,2005,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2008,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:41:27');
INSERT INTO `sys_oper_log` VALUES (487, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2014', '127.0.0.1', '内网IP', '{menuId=2014}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:41:36');
INSERT INTO `sys_oper_log` VALUES (488, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2015', '127.0.0.1', '内网IP', '{menuId=2015}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:41:46');
INSERT INTO `sys_oper_log` VALUES (489, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2016', '127.0.0.1', '内网IP', '{menuId=2016}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:41:49');
INSERT INTO `sys_oper_log` VALUES (490, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2017', '127.0.0.1', '内网IP', '{menuId=2017}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:41:52');
INSERT INTO `sys_oper_log` VALUES (491, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2018', '127.0.0.1', '内网IP', '{menuId=2018}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:41:55');
INSERT INTO `sys_oper_log` VALUES (492, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2070', '127.0.0.1', '内网IP', '{menuId=2070}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2022-11-25 17:42:07');
INSERT INTO `sys_oper_log` VALUES (493, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-09-05 21:49:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2004,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056],\"params\":{},\"remark\":\"单位管理员\",\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:42:26');
INSERT INTO `sys_oper_log` VALUES (494, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2070', '127.0.0.1', '内网IP', '{menuId=2070}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2022-11-25 17:42:41');
INSERT INTO `sys_oper_log` VALUES (495, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-09-05 21:50:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"单位人员\",\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:43:01');
INSERT INTO `sys_oper_log` VALUES (496, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2070', '127.0.0.1', '内网IP', '{menuId=2070}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:43:14');
INSERT INTO `sys_oper_log` VALUES (497, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2071', '127.0.0.1', '内网IP', '{menuId=2071}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:43:18');
INSERT INTO `sys_oper_log` VALUES (498, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2072', '127.0.0.1', '内网IP', '{menuId=2072}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:43:20');
INSERT INTO `sys_oper_log` VALUES (499, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2073', '127.0.0.1', '内网IP', '{menuId=2073}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:43:22');
INSERT INTO `sys_oper_log` VALUES (500, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/2074', '127.0.0.1', '内网IP', '{menuId=2074}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:43:26');
INSERT INTO `sys_oper_log` VALUES (501, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/competition/index\",\"createTime\":\"2022-09-08 18:21:03\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2069,\"menuName\":\"竞赛管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"competition\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:45:00');
INSERT INTO `sys_oper_log` VALUES (502, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/competition/index\",\"createTime\":\"2022-09-08 18:21:03\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2069,\"menuName\":\"竞赛管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"competition\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:51:33');
INSERT INTO `sys_oper_log` VALUES (503, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, 'admin', '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"13222245654@qq.com\",\"nickName\":\"1231231313\",\"params\":{},\"phonenumber\":\"13222245654\",\"roleIds\":[5],\"status\":\"0\",\"userId\":20013222245654,\"userName\":\"123123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-30 04:07:41');
INSERT INTO `sys_oper_log` VALUES (504, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":20013245638733}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-01 21:30:26');
INSERT INTO `sys_oper_log` VALUES (505, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, 'admin', '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":20013245638733}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-04 20:24:15');
INSERT INTO `sys_oper_log` VALUES (506, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, NULL, '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20013245638733}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-05 08:49:34');
INSERT INTO `sys_oper_log` VALUES (507, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, NULL, '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20013245638733}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-05 09:09:50');
INSERT INTO `sys_oper_log` VALUES (508, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, NULL, '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20013245345670}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-05 17:01:25');
INSERT INTO `sys_oper_log` VALUES (509, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, NULL, '', '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_team_activity', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-06 19:34:23');
INSERT INTO `sys_oper_log` VALUES (510, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, NULL, '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"activity\",\"className\":\"TTeamActivity\",\"columns\":[{\"capJavaField\":\"TeamId\",\"columnId\":94,\"columnName\":\"team_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 19:34:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"teamId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityId\",\"columnId\":95,\"columnName\":\"activity_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 19:34:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnId\":96,\"columnName\":\"date\",\"columnType\":\"bigint\",\"createBy\":\"\",\"createTime\":\"2022-12-06 19:34:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"date\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FileId\",\"columnId\":97,\"columnName\":\"file_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 19:34:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"fileId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":4,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityState\",\"col', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-06 19:45:57');
INSERT INTO `sys_oper_log` VALUES (511, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, NULL, '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"activity\",\"className\":\"TeamActivity\",\"columns\":[{\"capJavaField\":\"TeamId\",\"columnId\":94,\"columnName\":\"team_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 19:34:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"teamId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2022-12-06 19:45:57\",\"usableColumn\":false},{\"capJavaField\":\"ActivityId\",\"columnId\":95,\"columnName\":\"activity_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 19:34:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2022-12-06 19:45:57\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnId\":96,\"columnName\":\"date\",\"columnType\":\"bigint\",\"createBy\":\"\",\"createTime\":\"2022-12-06 19:34:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"date\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2022-12-06 19:45:57\",\"usableColumn\":false},{\"capJavaField\":\"FileId\",\"columnId\":97,\"columnName\":\"file_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 19:34:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"fileId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":4,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-06 19:47:14');
INSERT INTO `sys_oper_log` VALUES (512, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, NULL, '', '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_activity', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-06 20:02:07');
INSERT INTO `sys_oper_log` VALUES (513, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, NULL, '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"activity\",\"className\":\"Activity\",\"columns\":[{\"capJavaField\":\"ActivityId\",\"columnId\":99,\"columnName\":\"activity_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:02:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CompetitionId\",\"columnId\":100,\"columnName\":\"competition_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"competitionId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Order\",\"columnId\":101,\"columnName\":\"order\",\"columnType\":\"bigint\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"order\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityStarttime\",\"columnId\":102,\"columnName\":\"activity_starttime\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"activityStarttime\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-06 20:02:32');
INSERT INTO `sys_oper_log` VALUES (514, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, NULL, '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"activity\",\"className\":\"Activity\",\"columns\":[{\"capJavaField\":\"ActivityId\",\"columnId\":99,\"columnName\":\"activity_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:02:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2022-12-06 20:02:32\",\"usableColumn\":false},{\"capJavaField\":\"CompetitionId\",\"columnId\":100,\"columnName\":\"competition_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"competitionId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2022-12-06 20:02:32\",\"usableColumn\":false},{\"capJavaField\":\"Order\",\"columnId\":101,\"columnName\":\"order\",\"columnType\":\"bigint\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"order\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2022-12-06 20:02:32\",\"usableColumn\":false},{\"capJavaField\":\"ActivityStarttime\",\"columnId\":102,\"columnName\":\"activity_starttime\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"activityStarttime\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-06 20:04:01');
INSERT INTO `sys_oper_log` VALUES (515, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, NULL, '', '/tool/gen/11', '127.0.0.1', '内网IP', '{tableIds=11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-06 20:29:47');
INSERT INTO `sys_oper_log` VALUES (516, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, NULL, '', '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_activity', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-06 20:29:51');
INSERT INTO `sys_oper_log` VALUES (517, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, NULL, '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"activity\",\"className\":\"Activity\",\"columns\":[{\"capJavaField\":\"ActivityId\",\"columnId\":104,\"columnName\":\"activity_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:29:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityName\",\"columnId\":105,\"columnName\":\"activity_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:29:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"activityName\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CompetitionId\",\"columnId\":106,\"columnName\":\"competition_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:29:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"competitionId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Order\",\"columnId\":107,\"columnName\":\"order\",\"columnType\":\"bigint\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:29:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"order\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":4,\"su', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-06 20:30:27');
INSERT INTO `sys_oper_log` VALUES (518, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, NULL, '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"activity\",\"className\":\"Activity\",\"columns\":[{\"capJavaField\":\"ActivityId\",\"columnId\":104,\"columnName\":\"activity_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:29:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2022-12-06 20:30:27\",\"usableColumn\":false},{\"capJavaField\":\"ActivityName\",\"columnId\":105,\"columnName\":\"activity_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:29:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"activityName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2022-12-06 20:30:27\",\"usableColumn\":false},{\"capJavaField\":\"CompetitionId\",\"columnId\":106,\"columnName\":\"competition_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:29:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"competitionId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2022-12-06 20:30:27\",\"usableColumn\":false},{\"capJavaField\":\"Order\",\"columnId\":107,\"columnName\":\"order\",\"columnType\":\"bigint\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:29:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-06 20:41:13');
INSERT INTO `sys_oper_log` VALUES (519, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, NULL, '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"activity\",\"className\":\"Activity\",\"columns\":[{\"capJavaField\":\"ActivityId\",\"columnComment\":\"赛程编码\",\"columnId\":104,\"columnName\":\"activity_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:29:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2022-12-06 20:41:13\",\"usableColumn\":false},{\"capJavaField\":\"ActivityName\",\"columnComment\":\"赛程名称\",\"columnId\":105,\"columnName\":\"activity_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:29:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"activityName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2022-12-06 20:41:13\",\"usableColumn\":false},{\"capJavaField\":\"CompetitionId\",\"columnComment\":\"所属比赛\",\"columnId\":106,\"columnName\":\"competition_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:29:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"competitionId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2022-12-06 20:41:13\",\"usableColumn\":false},{\"capJavaField\":\"Order\",\"columnComment\":\"轮次\",\"columnId\":107,\"columnName\":\"order\",\"columnType\":\"bigint\",\"createBy\":\"\",\"createTime\":\"2022-12-06 20:29:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-06 20:43:36');
INSERT INTO `sys_oper_log` VALUES (520, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, NULL, '', '/tool/gen/importTable', '127.0.0.1', '内网IP', 't_user_activity', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 05:59:04');
INSERT INTO `sys_oper_log` VALUES (521, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, NULL, '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"activity\",\"className\":\"UserActivity\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":110,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"\",\"createTime\":\"2022-12-07 05:59:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ActivityId\",\"columnComment\":\"赛程ID\",\"columnId\":111,\"columnName\":\"activity_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-07 05:59:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnComment\":\"日期\",\"columnId\":112,\"columnName\":\"date\",\"columnType\":\"bigint\",\"createBy\":\"\",\"createTime\":\"2022-12-07 05:59:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"date\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FileId\",\"columnComment\":\"比赛作品\",\"columnId\":113,\"columnName\":\"file_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-07 05:59:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"fileId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sor', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 06:00:50');
INSERT INTO `sys_oper_log` VALUES (522, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, NULL, '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"useractivity\",\"className\":\"UserActivity\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":110,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"\",\"createTime\":\"2022-12-07 05:59:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2022-12-07 06:00:50\",\"usableColumn\":false},{\"capJavaField\":\"ActivityId\",\"columnComment\":\"赛程ID\",\"columnId\":111,\"columnName\":\"activity_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-07 05:59:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2022-12-07 06:00:50\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnComment\":\"日期\",\"columnId\":112,\"columnName\":\"date\",\"columnType\":\"bigint\",\"createBy\":\"\",\"createTime\":\"2022-12-07 05:59:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"date\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2022-12-07 06:00:50\",\"usableColumn\":false},{\"capJavaField\":\"FileId\",\"columnComment\":\"比赛作品\",\"columnId\":113,\"columnName\":\"file_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-07 05:59:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"fileI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 06:35:26');
INSERT INTO `sys_oper_log` VALUES (523, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, NULL, '', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"teamactivity\",\"className\":\"TeamActivity\",\"columns\":[{\"capJavaField\":\"TeamId\",\"columnComment\":\"队伍编号\",\"columnId\":94,\"columnName\":\"team_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 19:34:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"teamId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2022-12-06 19:47:14\",\"usableColumn\":false},{\"capJavaField\":\"ActivityId\",\"columnComment\":\"赛程编号\",\"columnId\":95,\"columnName\":\"activity_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 19:34:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"activityId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2022-12-06 19:47:14\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnComment\":\"日期\",\"columnId\":96,\"columnName\":\"date\",\"columnType\":\"bigint\",\"createBy\":\"\",\"createTime\":\"2022-12-06 19:34:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"date\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2022-12-06 19:47:14\",\"usableColumn\":false},{\"capJavaField\":\"FileId\",\"columnComment\":\"参赛作品\",\"columnId\":97,\"columnName\":\"file_id\",\"columnType\":\"varchar(48)\",\"createBy\":\"\",\"createTime\":\"2022-12-06 19:34:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"fi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 09:02:04');
INSERT INTO `sys_oper_log` VALUES (524, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, NULL, '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20013245345670}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 10:25:51');
INSERT INTO `sys_oper_log` VALUES (525, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 17:53:51\",\"delFlag\":\"0\",\"direction\":\"asdf\",\"email\":\"1234@qq.com\",\"loginDate\":\"2022-10-05 18:44:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"李浩杰\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13224567871\",\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":107,\"userName\":\"LHJ\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-08 22:20:14');
INSERT INTO `sys_oper_log` VALUES (526, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:56:49\",\"delFlag\":\"0\",\"email\":\"dsaffff@qq.com\",\"loginIp\":\"\",\"nickName\":\"叶宋玉\",\"params\":{},\"phonenumber\":\"13222245768\",\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":10013222245768,\"userName\":\"YSY\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-08 22:20:34');
INSERT INTO `sys_oper_log` VALUES (527, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, NULL, '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-08 22:26:42');
INSERT INTO `sys_oper_log` VALUES (528, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, NULL, '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":10013222245768}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-08 22:26:48');
INSERT INTO `sys_oper_log` VALUES (529, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013222459872,10013224567283]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-09 15:44:40');
INSERT INTO `sys_oper_log` VALUES (530, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"13245765698@qq.com\",\"nickName\":\"13245765698\",\"params\":{},\"phonenumber\":\"13245765698\",\"roleIds\":[4],\"status\":\"0\",\"userId\":10013245765698,\"userName\":\"13245765698\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-09 17:08:05');
INSERT INTO `sys_oper_log` VALUES (531, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"13245765697@qq.com\",\"nickName\":\"13245765697\",\"params\":{},\"phonenumber\":\"13245765697\",\"roleIds\":[4],\"status\":\"0\",\"userId\":10013245765697,\"userName\":\"13245765697\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-09 17:08:24');
INSERT INTO `sys_oper_log` VALUES (532, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"13245765693@qq.com\",\"nickName\":\"13245765693\",\"params\":{},\"phonenumber\":\"13245765693\",\"roleIds\":[4],\"status\":\"0\",\"userId\":10013245765693,\"userName\":\"13245765693\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-09 17:08:49');
INSERT INTO `sys_oper_log` VALUES (533, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"13245765696@qq.com\",\"nickName\":\"13245765696\",\"params\":{},\"phonenumber\":\"13245765696\",\"roleIds\":[4],\"status\":\"0\",\"userId\":10013245765696,\"userName\":\"13245765696\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-09 17:09:26');
INSERT INTO `sys_oper_log` VALUES (534, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"13245765633@qq.com\",\"nickName\":\"13245765633\",\"params\":{},\"phonenumber\":\"13245765633\",\"roleIds\":[4],\"status\":\"0\",\"userId\":10013245765633,\"userName\":\"13245765633\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-09 17:10:01');
INSERT INTO `sys_oper_log` VALUES (535, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, NULL, '', '/system/user/10013245765696,10013245765693', '127.0.0.1', '内网IP', '{userIds=10013245765696,10013245765693}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-10 00:44:16');
INSERT INTO `sys_oper_log` VALUES (536, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"竞赛评审\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"review\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:13:48');
INSERT INTO `sys_oper_log` VALUES (537, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的评审\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2077,\"path\":\"review\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:14:41');
INSERT INTO `sys_oper_log` VALUES (538, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-01-11 23:13:48\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2077,\"menuName\":\"竞赛评审\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"review\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:15:02');
INSERT INTO `sys_oper_log` VALUES (539, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-04 01:00:56\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"系统设置\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"settings\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:15:09');
INSERT INTO `sys_oper_log` VALUES (540, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-04 01:00:56\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"系统设置\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"settings\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:15:19');
INSERT INTO `sys_oper_log` VALUES (541, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/review/index\",\"createTime\":\"2023-01-11 23:14:41\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2078,\"menuName\":\"我的评审\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2077,\"path\":\"myreview\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:17:46');
INSERT INTO `sys_oper_log` VALUES (542, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/review/index\",\"createTime\":\"2023-01-11 23:14:41\",\"icon\":\"cascader\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2078,\"menuName\":\"我的评审\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2077,\"path\":\"myreview\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 01:58:24');
INSERT INTO `sys_oper_log` VALUES (543, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/review/index\",\"createTime\":\"2023-01-11 23:14:41\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2078,\"menuName\":\"我的评审\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2077,\"path\":\"myreview\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 01:58:54');
INSERT INTO `sys_oper_log` VALUES (544, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, NULL, '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 17:55:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,2000,2001,2069,2003,2004,2005,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2077,2078,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,2008,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 23:09:51');
INSERT INTO `sys_oper_log` VALUES (545, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, NULL, '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 23:10:10');
INSERT INTO `sys_oper_log` VALUES (546, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, NULL, '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 17:55:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2069,2003,2004,2005,2075,2076,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2077,2078,2008,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 23:11:52');
INSERT INTO `sys_oper_log` VALUES (547, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:56:49\",\"delFlag\":\"0\",\"email\":\"dsaffff@qq.com\",\"loginIp\":\"\",\"nickName\":\"叶宋玉\",\"params\":{},\"phonenumber\":\"13222245768\",\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":10013222245768,\"userName\":\"YSY\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 23:15:22');
INSERT INTO `sys_oper_log` VALUES (548, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, NULL, '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 23:15:32');
INSERT INTO `sys_oper_log` VALUES (549, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013245765698]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 23:18:33');
INSERT INTO `sys_oper_log` VALUES (550, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 17:53:51\",\"delFlag\":\"0\",\"direction\":\"asdf\",\"email\":\"1234@qq.com\",\"loginDate\":\"2022-10-05 18:44:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"李浩杰\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13224567871\",\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":107,\"userName\":\"LHJ\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 23:30:41');
INSERT INTO `sys_oper_log` VALUES (551, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 17:53:51\",\"delFlag\":\"0\",\"direction\":\"asdf\",\"email\":\"1234@qq.com\",\"loginDate\":\"2022-10-05 18:44:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"李浩杰\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13224567871\",\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":107,\"userName\":\"LHJ\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 23:30:50');
INSERT INTO `sys_oper_log` VALUES (552, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, NULL, '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20013222245654}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 23:32:01');
INSERT INTO `sys_oper_log` VALUES (553, '活动类型', 1, 'com.ruoyi.web.controller.system.SysActivityTypeController.add()', 'POST', 1, NULL, '', '/system/activitytype', '127.0.0.1', '内网IP', '{\"params\":{},\"typeId\":2,\"typeName\":\"1\",\"typeRemark\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-13 23:33:10');
INSERT INTO `sys_oper_log` VALUES (554, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, NULL, '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 17:55:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2069,2004,2005,2075,2076,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2077,2078,2008,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 02:12:54');
INSERT INTO `sys_oper_log` VALUES (555, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, NULL, '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-09-05 21:50:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2069],\"params\":{},\"remark\":\"单位人员\",\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 03:39:12');
INSERT INTO `sys_oper_log` VALUES (556, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, NULL, '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 03:39:33');
INSERT INTO `sys_oper_log` VALUES (557, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/competition/audit\",\"createTime\":\"2022-09-04 00:45:58\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"竞赛审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"audit\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 03:57:23');
INSERT INTO `sys_oper_log` VALUES (558, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, NULL, '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-09-05 21:50:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2069,2077,2078],\"params\":{},\"remark\":\"单位人员\",\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 04:09:35');
INSERT INTO `sys_oper_log` VALUES (559, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, NULL, '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 17:55:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2069,2004,2005,2075,2076,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2077,2078,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,2008,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:21:08');
INSERT INTO `sys_oper_log` VALUES (560, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, NULL, '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-09-05 21:49:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2069,2004,2005,2075,2076,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2077,2078],\"params\":{},\"remark\":\"单位管理员\",\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:21:44');
INSERT INTO `sys_oper_log` VALUES (561, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, NULL, '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-09-05 21:49:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2069,2004,2005,2075,2076,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2077,2078],\"params\":{},\"remark\":\"单位管理员\",\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:22:34');
INSERT INTO `sys_oper_log` VALUES (562, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, NULL, '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-09-05 21:50:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2069,2077,2078],\"params\":{},\"remark\":\"单位人员\",\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:22:46');
INSERT INTO `sys_oper_log` VALUES (563, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-07 17:53:51\",\"delFlag\":\"0\",\"direction\":\"asdf\",\"email\":\"1234@qq.com\",\"loginDate\":\"2023-01-14 07:19:57\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"李浩杰\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13224567871\",\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":107,\"userName\":\"LHJ\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:24:02');
INSERT INTO `sys_oper_log` VALUES (564, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:56:49\",\"delFlag\":\"0\",\"email\":\"dsaffff@qq.com\",\"loginIp\":\"\",\"nickName\":\"叶宋玉\",\"orgnization\":2,\"params\":{},\"phonenumber\":\"13222245768\",\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":10013222245768,\"userName\":\"YSY\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:24:11');
INSERT INTO `sys_oper_log` VALUES (565, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"qwe\",\"createTime\":\"2022-09-09 08:57:12\",\"delFlag\":\"0\",\"email\":\"cxc@qq.com\",\"loginDate\":\"2022-09-09 09:45:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"sasas\",\"orgnization\":2,\"orgnizationName\":\"苏州大学\",\"params\":{},\"phonenumber\":\"13222245936\",\"roleIds\":[4],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":10013222245936,\"userName\":\"syysyy\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:24:18');
INSERT INTO `sys_oper_log` VALUES (566, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:45:36\",\"delFlag\":\"0\",\"email\":\"dsafa@qq.com\",\"loginDate\":\"2022-10-19 18:48:04\",\"loginIp\":\"\",\"nickName\":\"qwer\",\"orgnization\":2,\"params\":{},\"phonenumber\":\"13222245999\",\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":10013222245998,\"userName\":\"qwer\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:24:25');
INSERT INTO `sys_oper_log` VALUES (567, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"master\",\"createTime\":\"2022-09-09 11:08:36\",\"delFlag\":\"0\",\"email\":\"7249@qq.com\",\"loginDate\":\"2022-09-09 11:10:16\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"沈云瑶\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13222459872\",\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"administrator\",\"roleName\":\"单位管理员\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":10013222459872,\"userName\":\"syy123\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:24:31');
INSERT INTO `sys_oper_log` VALUES (568, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-08 04:33:05\",\"delFlag\":\"0\",\"email\":\"gkg@qq.com\",\"loginIp\":\"\",\"nickName\":\"asd\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13224567283\",\"roleIds\":[4],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":10013224567283,\"userName\":\"asd\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:24:41');
INSERT INTO `sys_oper_log` VALUES (569, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-01-09 17:10:01\",\"delFlag\":\"0\",\"email\":\"13245765633@qq.com\",\"loginIp\":\"\",\"nickName\":\"13245765633\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13245765633\",\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":10013245765633,\"userName\":\"13245765633\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:24:54');
INSERT INTO `sys_oper_log` VALUES (570, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-01-09 17:08:24\",\"delFlag\":\"0\",\"email\":\"13245765697@qq.com\",\"loginIp\":\"\",\"nickName\":\"13245765697\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13245765697\",\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":10013245765697,\"userName\":\"13245765697\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:25:01');
INSERT INTO `sys_oper_log` VALUES (571, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/tuser/index\",\"createTime\":\"2022-09-07 16:25:25\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2043,\"menuName\":\"单位人员\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2004,\"path\":\"tuser\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:26:19');
INSERT INTO `sys_oper_log` VALUES (572, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/suser/index\",\"createTime\":\"2022-09-08 02:37:01\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2050,\"menuName\":\"学生账号\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2004,\"path\":\"suser\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:26:24');
INSERT INTO `sys_oper_log` VALUES (573, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-09-08 02:37:01\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2051,\"menuName\":\"学生账号查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2050,\"path\":\"#\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:26:57');
INSERT INTO `sys_oper_log` VALUES (574, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-09-08 02:37:01\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2052,\"menuName\":\"学生账号新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2050,\"path\":\"#\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:27:04');
INSERT INTO `sys_oper_log` VALUES (575, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-09-08 02:37:01\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2053,\"menuName\":\"学生账号修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2050,\"path\":\"#\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:27:10');
INSERT INTO `sys_oper_log` VALUES (576, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-09-08 02:37:01\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2054,\"menuName\":\"学生账号删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2050,\"path\":\"#\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:27:15');
INSERT INTO `sys_oper_log` VALUES (577, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-09-08 02:37:01\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2055,\"menuName\":\"学生账号导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2050,\"path\":\"#\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:27:20');
INSERT INTO `sys_oper_log` VALUES (578, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-08 02:39:21\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2056,\"menuName\":\"重置密码\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2050,\"path\":\"\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:27:24');
INSERT INTO `sys_oper_log` VALUES (579, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-09-07 16:25:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2044,\"menuName\":\"单位人员查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2043,\"path\":\"#\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:27:34');
INSERT INTO `sys_oper_log` VALUES (580, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-09-07 16:25:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2045,\"menuName\":\"单位人员新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2043,\"path\":\"#\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:27:39');
INSERT INTO `sys_oper_log` VALUES (581, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-09-07 16:25:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2046,\"menuName\":\"单位人员修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2043,\"path\":\"#\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:27:43');
INSERT INTO `sys_oper_log` VALUES (582, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-09-07 16:25:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2047,\"menuName\":\"单位人员删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2043,\"path\":\"#\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:27:49');
INSERT INTO `sys_oper_log` VALUES (583, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2022-09-07 16:25:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2048,\"menuName\":\"单位人员导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2043,\"path\":\"#\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:27:52');
INSERT INTO `sys_oper_log` VALUES (584, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, NULL, '', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-09-07 17:00:04\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2049,\"menuName\":\"重置密码\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2043,\"path\":\"\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:27:56');
INSERT INTO `sys_oper_log` VALUES (585, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013245765697]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:39:50');
INSERT INTO `sys_oper_log` VALUES (586, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, NULL, '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":10013245765697}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:40:03');
INSERT INTO `sys_oper_log` VALUES (587, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, NULL, '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 17:55:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2,2001,2069,2004,2005,2075,2076,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2077,2078,109,1046,1047,1048,111,112,113,2008,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:43:24');
INSERT INTO `sys_oper_log` VALUES (588, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, NULL, '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":10013222459872}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 07:46:30');
INSERT INTO `sys_oper_log` VALUES (589, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserauditController.export()', 'POST', 1, NULL, '', '/system/tuseraudit/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"},\"userId\":101}', NULL, 0, NULL, '2023-01-14 17:12:45');
INSERT INTO `sys_oper_log` VALUES (590, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserauditController.export()', 'POST', 1, NULL, '', '/system/tuseraudit/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"},\"userId\":101}', NULL, 0, NULL, '2023-01-14 17:12:47');
INSERT INTO `sys_oper_log` VALUES (591, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, NULL, '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"userId\":10013245765697}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 17:21:49');
INSERT INTO `sys_oper_log` VALUES (592, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, NULL, '', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"userId\":10013245765697}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 17:21:51');
INSERT INTO `sys_oper_log` VALUES (593, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013245765698]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 19:25:24');
INSERT INTO `sys_oper_log` VALUES (594, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"3\",\"userIds\":[10013222245998]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 19:42:15');
INSERT INTO `sys_oper_log` VALUES (595, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013222245998]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 19:42:48');
INSERT INTO `sys_oper_log` VALUES (596, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/suseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"3\",\"userIds\":[20013535358756]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 19:46:29');
INSERT INTO `sys_oper_log` VALUES (597, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/suseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"3\",\"userIds\":[20013535358756]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 19:46:34');
INSERT INTO `sys_oper_log` VALUES (598, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/suseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[20013535358756]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 19:46:38');
INSERT INTO `sys_oper_log` VALUES (599, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, NULL, '', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 17:55:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2,2001,2069,2004,2005,2075,2076,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2077,2078,109,1046,1047,1048,111,112,113,2008,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068],\"params\":{},\"remark\":\"管理员\",\"roleId\":2,\"roleKey\":\"master\",\"roleName\":\"管理员\",\"roleSort\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 19:47:54');
INSERT INTO `sys_oper_log` VALUES (600, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, NULL, '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20013222245654}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 19:50:31');
INSERT INTO `sys_oper_log` VALUES (601, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, NULL, '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-11-30 04:07:41\",\"delFlag\":\"0\",\"email\":\"13222245654@qq.com\",\"loginIp\":\"\",\"nickName\":\"1231231313\",\"orgnization\":1,\"params\":{},\"phonenumber\":\"13222245654\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateTime\":\"2023-01-14 19:50:31\",\"userId\":20013222245654,\"userName\":\"123123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 19:50:39');
INSERT INTO `sys_oper_log` VALUES (602, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.changeStatus()', 'PUT', 1, NULL, '', '/system/suser/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"userId\":20013535358756}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 19:50:53');
INSERT INTO `sys_oper_log` VALUES (603, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.changeStatus()', 'PUT', 1, NULL, '', '/system/suser/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"userId\":20013535358756}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 19:50:55');
INSERT INTO `sys_oper_log` VALUES (604, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, NULL, '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-09 09:49:22\",\"delFlag\":\"0\",\"email\":\"343422@qq.com\",\"loginIp\":\"\",\"nickName\":\"12232435\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13245638733\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateTime\":\"2022-12-05 09:09:49\",\"userId\":20013245638733,\"userName\":\"1234334\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-14 19:51:04');
INSERT INTO `sys_oper_log` VALUES (605, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/suseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[20013535358757]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 03:29:22');
INSERT INTO `sys_oper_log` VALUES (606, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, NULL, '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"sds@qq.com\",\"nickName\":\"1231231\",\"params\":{},\"phonenumber\":\"13258968652\",\"roleIds\":[5],\"sex\":\"0\",\"status\":\"0\",\"userId\":20013258968652,\"userName\":\"12312312\",\"userType\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 12:24:17');
INSERT INTO `sys_oper_log` VALUES (607, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013245765701]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 12:29:04');
INSERT INTO `sys_oper_log` VALUES (608, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-01-15 12:16:34\",\"delFlag\":\"0\",\"direction\":\"生物大数据\",\"email\":\"13289756321@qq.com\",\"job\":\"教授\",\"loginIp\":\"\",\"nickName\":\"刘宏德\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13289756321\",\"remark\":\"生物大数据\",\"roleIds\":[4],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":10013245765701,\"userName\":\"LHD\",\"userRemark\":\"生物大数据\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 12:29:49');
INSERT INTO `sys_oper_log` VALUES (609, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"direction\":\"123\",\"email\":\"123123@qq.com\",\"nickName\":\"1232132\",\"params\":{},\"phonenumber\":\"13986526398\",\"roleIds\":[4],\"status\":\"0\",\"userId\":10013986526398,\"userName\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 12:30:41');
INSERT INTO `sys_oper_log` VALUES (610, '用户管理', 1, 'com.ruoyi.web.controller.system.SysSuserController.add()', 'POST', 1, NULL, '', '/system/suser', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"213@qq.com\",\"nickName\":\"45456\",\"params\":{},\"phonenumber\":\"19932658953\",\"roleIds\":[5],\"sex\":\"0\",\"status\":\"0\",\"userId\":20019932658953,\"userName\":\"45646\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 12:57:21');
INSERT INTO `sys_oper_log` VALUES (611, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013895696347]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 13:04:55');
INSERT INTO `sys_oper_log` VALUES (612, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-01-15 12:50:05\",\"delFlag\":\"0\",\"direction\":\"123\",\"email\":\"51454@qq.com\",\"job\":\"123\",\"loginIp\":\"\",\"nickName\":\"LHD\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13895696347\",\"remark\":\"123\",\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":10013895696347,\"userName\":\"LHD\",\"userRemark\":\"123\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 13:12:45');
INSERT INTO `sys_oper_log` VALUES (613, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/suseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[20013245896999]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 13:14:45');
INSERT INTO `sys_oper_log` VALUES (614, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, NULL, '', '/system/user/authRole', '127.0.0.1', '内网IP', '10013222245936 [3,4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 13:35:19');
INSERT INTO `sys_oper_log` VALUES (615, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, NULL, '', '/system/user/authRole', '127.0.0.1', '内网IP', '10013224567283 [4,3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 13:35:37');
INSERT INTO `sys_oper_log` VALUES (616, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, NULL, '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":10013895696347}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 13:37:05');
INSERT INTO `sys_oper_log` VALUES (617, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013698564785]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 13:40:01');
INSERT INTO `sys_oper_log` VALUES (618, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/suseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[20017896563268,20019963258974]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 13:40:09');
INSERT INTO `sys_oper_log` VALUES (619, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, NULL, '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20013245896999}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 13:40:33');
INSERT INTO `sys_oper_log` VALUES (620, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, NULL, '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20017896563268}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 13:40:41');
INSERT INTO `sys_oper_log` VALUES (621, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, NULL, '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20019963258974}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 13:40:47');
INSERT INTO `sys_oper_log` VALUES (622, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, NULL, '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20019963258974}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 13:44:41');
INSERT INTO `sys_oper_log` VALUES (623, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, NULL, '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":10013698564785}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 13:44:53');
INSERT INTO `sys_oper_log` VALUES (624, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456789 123456789', '{\"msg\":\"null修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 13:45:10');
INSERT INTO `sys_oper_log` VALUES (625, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123123123 123456789', '{\"msg\":\"null修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 13:45:21');
INSERT INTO `sys_oper_log` VALUES (626, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123123 123456789', '{\"msg\":\"null修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 13:45:26');
INSERT INTO `sys_oper_log` VALUES (627, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123123 123456789', '{\"msg\":\"null修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 13:45:38');
INSERT INTO `sys_oper_log` VALUES (628, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"null修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 13:48:13');
INSERT INTO `sys_oper_log` VALUES (629, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"null修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 13:48:21');
INSERT INTO `sys_oper_log` VALUES (630, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"null修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 13:48:47');
INSERT INTO `sys_oper_log` VALUES (631, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"null修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 13:49:53');
INSERT INTO `sys_oper_log` VALUES (632, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"null修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 14:05:34');
INSERT INTO `sys_oper_log` VALUES (633, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"null修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 14:06:38');
INSERT INTO `sys_oper_log` VALUES (634, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"null修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 14:09:09');
INSERT INTO `sys_oper_log` VALUES (635, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"null修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 14:11:07');
INSERT INTO `sys_oper_log` VALUES (636, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"null修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 14:12:01');
INSERT INTO `sys_oper_log` VALUES (637, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"admin修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 14:19:27');
INSERT INTO `sys_oper_log` VALUES (638, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"admin修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 14:20:13');
INSERT INTO `sys_oper_log` VALUES (639, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"admin修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 14:24:21');
INSERT INTO `sys_oper_log` VALUES (640, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"admin修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 14:29:05');
INSERT INTO `sys_oper_log` VALUES (641, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"admin修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 14:37:10');
INSERT INTO `sys_oper_log` VALUES (642, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, NULL, '', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"上传图片异常，请联系管理员\",\"code\":500}', 0, NULL, '2023-01-15 14:53:09');
INSERT INTO `sys_oper_log` VALUES (643, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, NULL, '', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"上传图片异常，请联系管理员\",\"code\":500}', 0, NULL, '2023-01-15 16:59:44');
INSERT INTO `sys_oper_log` VALUES (644, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"admin修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 17:07:53');
INSERT INTO `sys_oper_log` VALUES (645, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123123', '{\"msg\":\"admin修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 17:24:29');
INSERT INTO `sys_oper_log` VALUES (646, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"admin修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-01-15 17:50:14');
INSERT INTO `sys_oper_log` VALUES (647, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, NULL, '', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'admin123 123456789', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 18:55:35');
INSERT INTO `sys_oper_log` VALUES (648, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, NULL, '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":10013698564785}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 22:54:22');
INSERT INTO `sys_oper_log` VALUES (649, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, NULL, '', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":10013895696347}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 22:54:30');
INSERT INTO `sys_oper_log` VALUES (650, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, NULL, '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20017896563268}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 22:54:46');
INSERT INTO `sys_oper_log` VALUES (651, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, NULL, '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20019963258974}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 22:54:54');
INSERT INTO `sys_oper_log` VALUES (652, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"3\",\"userIds\":[10013245765697]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 22:56:17');
INSERT INTO `sys_oper_log` VALUES (653, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013245765697]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 22:56:23');
INSERT INTO `sys_oper_log` VALUES (654, '用户管理', 3, 'com.ruoyi.web.controller.system.SysSuserController.remove()', 'DELETE', 1, NULL, '', '/system/suser/20013535358757', '127.0.0.1', '内网IP', '{userIds=20013535358757}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 22:56:41');
INSERT INTO `sys_oper_log` VALUES (655, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.changeStatus()', 'PUT', 1, NULL, '', '/system/suser/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"userId\":20019963258974}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 22:56:46');
INSERT INTO `sys_oper_log` VALUES (656, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.changeStatus()', 'PUT', 1, NULL, '', '/system/suser/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"userId\":20019963258974}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 22:56:49');
INSERT INTO `sys_oper_log` VALUES (657, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.resetPwd()', 'PUT', 1, NULL, '', '/system/suser/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"userId\":20017896563268}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 22:56:58');
INSERT INTO `sys_oper_log` VALUES (658, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, NULL, '', '/system/suser', '127.0.0.1', '内网IP', '{\"academy\":\"123\",\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-01-15 13:01:21\",\"delFlag\":\"0\",\"email\":\"dd@qq.com\",\"loginIp\":\"\",\"major\":\"123\",\"nickName\":\"LC2\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13245896999\",\"remark\":\"123\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"studentId\":123,\"updateTime\":\"2023-01-15 13:40:33\",\"userId\":20013245896999,\"userName\":\"LC2\",\"userRemark\":\"123\",\"userType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 22:58:22');
INSERT INTO `sys_oper_log` VALUES (659, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, NULL, '', '/system/suser', '127.0.0.1', '内网IP', '{\"academy\":\"123\",\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-01-15 13:01:21\",\"delFlag\":\"0\",\"email\":\"dd@qq.com\",\"loginIp\":\"\",\"major\":\"123\",\"nickName\":\"LC2\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13245896999\",\"remark\":\"123\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"studentId\":123,\"updateTime\":\"2023-01-15 22:58:22\",\"userId\":20013245896999,\"userName\":\"LC2\",\"userRemark\":\"123\",\"userType\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 22:58:28');
INSERT INTO `sys_oper_log` VALUES (660, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, NULL, '', '/system/suser', '127.0.0.1', '内网IP', '{\"academy\":\"123\",\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-01-15 13:01:21\",\"delFlag\":\"0\",\"email\":\"dd@qq.com\",\"loginIp\":\"\",\"major\":\"123\",\"nickName\":\"LC2\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13245896999\",\"remark\":\"123\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"studentId\":123,\"updateTime\":\"2023-01-15 22:58:28\",\"userId\":20013245896999,\"userName\":\"LC2\",\"userRemark\":\"123\",\"userType\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 22:58:34');
INSERT INTO `sys_oper_log` VALUES (661, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserController.edit()', 'PUT', 1, NULL, '', '/system/suser', '127.0.0.1', '内网IP', '{\"academy\":\"123\",\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-01-15 13:01:21\",\"delFlag\":\"0\",\"email\":\"dd@qq.com\",\"loginIp\":\"\",\"major\":\"123\",\"nickName\":\"LC2\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13245896999\",\"remark\":\"1234\",\"roleIds\":[5],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":5,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"studentId\":123,\"updateTime\":\"2023-01-15 22:58:34\",\"userId\":20013245896999,\"userName\":\"LC2\",\"userRemark\":\"123\",\"userType\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-15 22:58:40');
INSERT INTO `sys_oper_log` VALUES (662, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013186502556]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 19:59:55');
INSERT INTO `sys_oper_log` VALUES (663, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, NULL, '', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-02-01 19:58:19\",\"delFlag\":\"0\",\"direction\":\"纳米\",\"email\":\"354654@qq.com\",\"job\":\"教师\",\"loginIp\":\"\",\"nickName\":\"YDJ\",\"orgnization\":1,\"orgnizationName\":\"东南大学\",\"params\":{},\"phonenumber\":\"13186502556\",\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"teacher\",\"roleName\":\"单位人员\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":10013186502556,\"userName\":\"YDJ\",\"userType\":\"00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 20:00:07');
INSERT INTO `sys_oper_log` VALUES (664, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/tuseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[10013186508963]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 20:00:49');
INSERT INTO `sys_oper_log` VALUES (665, '用户管理', 2, 'com.ruoyi.web.controller.system.SysSuserauditController.changeStatus()', 'POST', 1, NULL, '', '/system/suseraudit/changeStatus', '127.0.0.1', '内网IP', '{\"status\":\"0\",\"userIds\":[20013186502266,20013186502299]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 20:00:56');
COMMIT;

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `organization_id` bigint NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(255) DEFAULT NULL,
  `organization_field` varchar(255) DEFAULT NULL,
  `organization_pho` varchar(255) DEFAULT NULL,
  `organization_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
BEGIN;
INSERT INTO `sys_organization` VALUES (1, '东南大学', '四牌楼', '13222245937', NULL);
INSERT INTO `sys_organization` VALUES (2, '苏州大学', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-08-27 17:55:59', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-08-27 17:55:59', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件链接',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint DEFAULT NULL COMMENT '文件大小（kb）',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '逻辑删除（0正常，1禁用）',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '唯一标识',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='资源管理表';

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
BEGIN;
INSERT INTO `sys_resources` VALUES (2, 'github错误', 'http://localhost:8989/profile/upload/2022/03/28/github错误_20220328203011A004.txt', 'txt', 0, 0, '4fc092efa410f6b076f244e8aa407bcc', 'admin', '2022-03-28 20:30:12', NULL, '2022-03-28 20:30:12');
INSERT INTO `sys_resources` VALUES (3, 'myblog现', 'http://localhost:8989/profile/upload/2022/03/28/myblog现_20220328205445A002.7z', '7z', 31960, 0, 'c4f89d541e2482fd2fc8741ce4bd0780', 'admin', '2022-03-28 20:31:56', 'admin', '2022-03-28 20:54:47');
INSERT INTO `sys_resources` VALUES (4, 'wallhaven-72x61v2', 'http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v2_20220328204945A001.jpg', 'jpg', 1125, 0, 'b7fd7c7fdaeddf5447ba433b1f153c36', 'admin', '2022-03-28 20:49:46', NULL, '2022-03-28 20:49:45');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-08-27 17:55:59', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '管理员', 'master', 2, '2', 1, 1, '0', '0', 'admin', '2022-08-27 17:55:59', 'admin', '2023-01-14 19:47:54', '管理员');
INSERT INTO `sys_role` VALUES (3, '单位管理员', 'administrator', 3, '1', 1, 1, '0', '0', 'admin', '2022-09-05 21:49:11', 'admin', '2023-01-14 07:22:34', '单位管理员');
INSERT INTO `sys_role` VALUES (4, '单位人员', 'teacher', 4, '1', 1, 1, '0', '0', 'admin', '2022-09-05 21:50:02', 'admin', '2023-01-14 07:22:46', '单位人员');
INSERT INTO `sys_role` VALUES (5, '学生', 'student', 5, '1', 1, 1, '0', '0', 'admin', '2022-09-05 21:50:25', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2043);
INSERT INTO `sys_role_menu` VALUES (2, 2044);
INSERT INTO `sys_role_menu` VALUES (2, 2045);
INSERT INTO `sys_role_menu` VALUES (2, 2046);
INSERT INTO `sys_role_menu` VALUES (2, 2047);
INSERT INTO `sys_role_menu` VALUES (2, 2048);
INSERT INTO `sys_role_menu` VALUES (2, 2049);
INSERT INTO `sys_role_menu` VALUES (2, 2050);
INSERT INTO `sys_role_menu` VALUES (2, 2051);
INSERT INTO `sys_role_menu` VALUES (2, 2052);
INSERT INTO `sys_role_menu` VALUES (2, 2053);
INSERT INTO `sys_role_menu` VALUES (2, 2054);
INSERT INTO `sys_role_menu` VALUES (2, 2055);
INSERT INTO `sys_role_menu` VALUES (2, 2056);
INSERT INTO `sys_role_menu` VALUES (2, 2057);
INSERT INTO `sys_role_menu` VALUES (2, 2058);
INSERT INTO `sys_role_menu` VALUES (2, 2059);
INSERT INTO `sys_role_menu` VALUES (2, 2060);
INSERT INTO `sys_role_menu` VALUES (2, 2061);
INSERT INTO `sys_role_menu` VALUES (2, 2062);
INSERT INTO `sys_role_menu` VALUES (2, 2063);
INSERT INTO `sys_role_menu` VALUES (2, 2064);
INSERT INTO `sys_role_menu` VALUES (2, 2065);
INSERT INTO `sys_role_menu` VALUES (2, 2066);
INSERT INTO `sys_role_menu` VALUES (2, 2067);
INSERT INTO `sys_role_menu` VALUES (2, 2068);
INSERT INTO `sys_role_menu` VALUES (2, 2069);
INSERT INTO `sys_role_menu` VALUES (2, 2075);
INSERT INTO `sys_role_menu` VALUES (2, 2076);
INSERT INTO `sys_role_menu` VALUES (2, 2077);
INSERT INTO `sys_role_menu` VALUES (2, 2078);
INSERT INTO `sys_role_menu` VALUES (3, 2000);
INSERT INTO `sys_role_menu` VALUES (3, 2004);
INSERT INTO `sys_role_menu` VALUES (3, 2005);
INSERT INTO `sys_role_menu` VALUES (3, 2043);
INSERT INTO `sys_role_menu` VALUES (3, 2044);
INSERT INTO `sys_role_menu` VALUES (3, 2045);
INSERT INTO `sys_role_menu` VALUES (3, 2046);
INSERT INTO `sys_role_menu` VALUES (3, 2047);
INSERT INTO `sys_role_menu` VALUES (3, 2048);
INSERT INTO `sys_role_menu` VALUES (3, 2049);
INSERT INTO `sys_role_menu` VALUES (3, 2050);
INSERT INTO `sys_role_menu` VALUES (3, 2051);
INSERT INTO `sys_role_menu` VALUES (3, 2052);
INSERT INTO `sys_role_menu` VALUES (3, 2053);
INSERT INTO `sys_role_menu` VALUES (3, 2054);
INSERT INTO `sys_role_menu` VALUES (3, 2055);
INSERT INTO `sys_role_menu` VALUES (3, 2056);
INSERT INTO `sys_role_menu` VALUES (3, 2069);
INSERT INTO `sys_role_menu` VALUES (3, 2075);
INSERT INTO `sys_role_menu` VALUES (3, 2076);
INSERT INTO `sys_role_menu` VALUES (3, 2077);
INSERT INTO `sys_role_menu` VALUES (3, 2078);
INSERT INTO `sys_role_menu` VALUES (4, 2000);
INSERT INTO `sys_role_menu` VALUES (4, 2069);
INSERT INTO `sys_role_menu` VALUES (4, 2077);
INSERT INTO `sys_role_menu` VALUES (4, 2078);
COMMIT;

-- ----------------------------
-- Table structure for sys_suser
-- ----------------------------
DROP TABLE IF EXISTS `sys_suser`;
CREATE TABLE `sys_suser` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `user_type` int DEFAULT NULL COMMENT '身份信息',
  `student_id` bigint DEFAULT NULL,
  `orgnization` bigint DEFAULT NULL,
  `academy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户邮箱',
  `user_remark` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '头像地址',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20019963258975 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_suser
-- ----------------------------
BEGIN;
INSERT INTO `sys_suser` VALUES (1, 'admin', 'admin', '0', NULL, NULL, NULL, NULL, NULL, '13186502185', '13186502185@qq.com', NULL, '$2a$10$M7LREUVKaW6TSmoEif5Hs.5be19uTRTmqBeWzW8wuPeaQRGTvHUR2', '', '0', '0', '', NULL, 'admin', '2022-09-09 09:38:13', '', NULL, NULL);
INSERT INTO `sys_suser` VALUES (20013186502266, 'SYY1', 'Syy', '0', 0, 224453, 1, '电子学院', '计算机', '13186502266', '123@qq.com', NULL, '$2a$10$9R97ngjos1zMLRPwPVL2JurIufmP3Wd2Tyf7T97wXC9FK4XzhoZl.', '', '0', '0', '', NULL, '', '2023-02-01 19:55:52', '', NULL, NULL);
INSERT INTO `sys_suser` VALUES (20013186502299, 'SYY2', 'SYY2', '1', 0, 224455, 1, '电子学院', '计算机', '13186502299', '123456@qq.com', NULL, '$2a$10$334EWE5Wjz6Arl5Aq180RuwX2Q3HnA3/fhfjxFV3LGo.zcNYYoxjm', '', '0', '0', '', NULL, '', '2023-02-01 19:57:18', '', NULL, NULL);
INSERT INTO `sys_suser` VALUES (20013222245654, '123123', '1231231313', '0', NULL, NULL, 1, NULL, NULL, '13222245654', '13222245654@qq.com', NULL, '$2a$10$4OF6285qPQNgaLHOPpdzKuqenakR7m0go1USYE2nedWYvVk3bCoIO', '', '0', '0', '', NULL, 'admin', '2022-11-30 04:07:41', '', '2023-01-14 19:50:39', NULL);
INSERT INTO `sys_suser` VALUES (20013222245937, '12321566778', '12321', '0', NULL, NULL, 1, NULL, NULL, '13222245937', 'sdfghj@qq.com', NULL, '$2a$10$C./AaCyaY.GEgy9z4azb2e0DjP1cKGMzgSlIwVaQFEeRkOeTLvt/a', '', '0', '0', '', NULL, 'admin', '2022-09-09 09:39:53', 'master', '2022-09-09 09:44:28', NULL);
INSERT INTO `sys_suser` VALUES (20013245345670, '1234567', '8765432', '0', NULL, NULL, 1, NULL, NULL, '13245345670', 'lkujythrsasdfgh@qq.com', NULL, '$2a$10$2ifQPUf6xL9udqADX2T5VuvAGMqNnOaSQjtksp.MYoI7PN47O.FUi', '', '0', '0', '', NULL, 'admin', '2022-09-09 09:43:57', 'admin', '2022-12-07 10:25:51', NULL);
INSERT INTO `sys_suser` VALUES (20013245638733, '1234334', '12232435', '0', NULL, NULL, 1, NULL, NULL, '13245638733', '343422@qq.com', NULL, '$2a$10$YSuIDq1V3CDGQCj84Uctr.aUY3YkqXRVlZpTFsAskb9izCXEhv9Di', '', '0', '0', '', NULL, 'admin', '2022-09-09 09:49:22', 'admin', '2023-01-14 19:51:03', NULL);
INSERT INTO `sys_suser` VALUES (20013245896999, 'LC2', 'LC2', '1', 0, 123, 1, '123', '123', '13245896999', 'dd@qq.com', '123', '$2a$10$QW7Q9AxoqnAyQuQ1POrEKeGyoyNeUFwMTORZBRzCHTpzkuqvNsK7a', '', '0', '0', '', NULL, '', '2023-01-15 13:01:21', '', '2023-01-15 22:58:40', '1234');
INSERT INTO `sys_suser` VALUES (20013258968652, '12312312', '1231231', '0', 0, NULL, NULL, NULL, NULL, '13258968652', 'sds@qq.com', NULL, '$2a$10$/6jTrrOGIpDkFGVPaEvbhOp1ewZ5imfe3/bKDSm82zXdGtqIaRvXy', '', '0', '0', '', NULL, '', '2023-01-15 12:24:17', '', NULL, NULL);
INSERT INTO `sys_suser` VALUES (20013535358756, '765556786', '545267698', '0', NULL, NULL, 2, NULL, NULL, '13535358756', 't75676@qq.com', NULL, '$2a$10$PaJZi/g0UakDthm1ZmQe7ez8C9DRCXyK8mzJx8g5GtmvLUsYbxKdu', '', '2', '0', '', NULL, 'admin', '2022-09-09 09:47:23', '', '2023-01-14 19:50:55', NULL);
INSERT INTO `sys_suser` VALUES (20013535358757, '172030402101', '12345678963', '0', 123, 123, 1, '123', '123', '13245936589', '123@qq.com', '123', '$2a$10$P0xwf847.OWFe1OhV7Ox4uMuvlSqU0/8LlmJReA0AWTKoKVnr3z9u', '', '0', '2', '', NULL, '', '2023-01-15 03:27:50', '', NULL, '123123');
INSERT INTO `sys_suser` VALUES (20017896563268, 'LC3', 'LC3', '0', 0, 172030402101, 1, '22', '22', '17896563268', '3545@qq.com', '12', '$2a$10$x.qeKjL3a0.fALUdO2muXu3rl8fFDIw4W6KQgFt0lXKGUqFM.ic7m', '', '0', '0', '', NULL, '', '2023-01-15 13:04:13', '', '2023-01-15 22:56:58', '123');
INSERT INTO `sys_suser` VALUES (20019963258974, 'LC', 'LC', '0', 0, 123, 1, '12', '123', '19963258974', '12@qq.com', '12', '$2a$10$vaplG1enOh9waYzIlJYBNuX5gNCo1YcPJhRYK3njMTuAHEi52JLfG', '', '0', '0', '', NULL, '', '2023-01-15 13:00:09', '', '2023-01-15 22:56:49', '123');
COMMIT;

-- ----------------------------
-- Table structure for sys_tuser
-- ----------------------------
DROP TABLE IF EXISTS `sys_tuser`;
CREATE TABLE `sys_tuser` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `orgnization` bigint DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户邮箱',
  `direction` varchar(255) DEFAULT NULL,
  `user_remark` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '头像地址',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10013986526399 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_tuser
-- ----------------------------
BEGIN;
INSERT INTO `sys_tuser` VALUES (1, 'admin', 'admin', '1', '00', NULL, NULL, '', '', NULL, NULL, '$2a$10$EDm5bM4mvSdgSLJDhoDIvu7v7UNsm5Zjx1Kr8vOXl5LuwOrjU57mG', '/profile/avatar/2022/09/07/blob_20220907014647A001.jpeg', '0', '0', '127.0.0.1', '2023-01-16 00:40:59', '', NULL, '', '2023-01-16 00:40:58', NULL);
INSERT INTO `sys_tuser` VALUES (101, 'master', '沈云瑶', '0', '00', 1, '主任12', '13222245937', '249123@qq.com', '医学影像学', '12344', '$2a$10$giNystejDBIcnmcraRBZgOzqJ1KcYyxaUkhDYTLhcqwAI46gcOo4y', '', '0', '0', '127.0.0.1', '2023-02-02 11:50:14', 'admin', '2022-09-07 01:37:24', 'admin', '2023-02-02 11:50:14', '123445');
INSERT INTO `sys_tuser` VALUES (107, 'LHJ', '李浩杰', '0', '00', 1, NULL, '13224567871', '1234@qq.com', 'asdf', NULL, '$2a$10$Eeej93ugurQUtfYGobO8kew4BiMdOeaKzG49XizKQh/oW1S9MWMw.', '', '0', '0', '127.0.0.1', '2023-01-14 07:19:57', 'admin', '2022-09-07 17:53:51', 'admin', '2023-01-14 07:24:02', NULL);
INSERT INTO `sys_tuser` VALUES (10013186502556, 'YDJ', 'YDJ', '0', '00', 1, '教师', '13186502556', '354654@qq.com', '纳米', NULL, '$2a$10$w0BgiwVGykyq7khgbuFwW.xuTwUhYcnTS2ocGDd12AVrvQSkhL3bm', '', '0', '0', '127.0.0.1', '2023-02-01 21:49:37', '', '2023-02-01 19:58:19', '', '2023-02-01 21:49:37', NULL);
INSERT INTO `sys_tuser` VALUES (10013186508963, 'YDJ2', 'YDJ2', '0', '00', 1, '123', '13186508963', 'sdsd@qq.com', '1223', NULL, '$2a$10$K4YoDUS2ykps7I6Nat9.qeM3RMbBp.gp2f/SjBh039M3/Ycu1tyIC', '', '0', '0', '127.0.0.1', '2023-02-01 20:01:37', '', '2023-02-01 19:59:14', '', '2023-02-01 20:01:37', NULL);
INSERT INTO `sys_tuser` VALUES (10013222245768, 'YSY', '叶宋玉', '0', '00', 2, NULL, '13222245768', 'dsaffff@qq.com', NULL, NULL, '$2a$10$As93LeWyplZgwqKT1YUN2.pA6u3wUWHs4SDT466ac81fgmr2FOj6S', '', '0', '0', '', NULL, 'admin', '2022-10-15 19:56:49', '', '2023-01-14 07:24:11', NULL);
INSERT INTO `sys_tuser` VALUES (10013222245936, 'syysyy', 'sasas', '0', '00', 2, NULL, '13222245936', 'cxc@qq.com', NULL, NULL, '$2a$10$VMIpnN4Z3OgGuUyfcut4runfaJcb51to1jLt/koxWZcTBon/QAm5y', '', '0', '0', '127.0.0.1', '2022-09-09 09:45:52', 'qwe', '2022-09-09 08:57:12', 'admin', '2023-01-14 07:24:18', NULL);
INSERT INTO `sys_tuser` VALUES (10013222245998, 'qwer', 'qwer', '0', '00', 2, NULL, '13222245999', 'dsafa@qq.com', NULL, NULL, '$2a$10$3gjw6zEVuFTB/THslQ8i5uU0BrTeMfNG/wl0CcRO4RCUiYckt2I/q', '', '0', '0', '', '2022-10-19 18:48:04', 'admin', '2022-10-15 19:45:36', 'admin', '2023-01-14 07:24:25', NULL);
INSERT INTO `sys_tuser` VALUES (10013222459872, 'syy123', '沈云瑶', '0', '00', 1, NULL, '13222459872', '7249@qq.com', NULL, NULL, '$2a$10$gVoeT.hzyQMTu8m9FhX2suoSjcNhd19JXB/ZMWd6MvqC3qTTMs2A6', '', '0', '0', '127.0.0.1', '2023-01-14 07:46:43', 'master', '2022-09-09 11:08:36', 'admin', '2023-01-14 07:46:43', NULL);
INSERT INTO `sys_tuser` VALUES (10013224567283, 'asd', 'asd', '0', '00', 1, NULL, '13224567283', 'gkg@qq.com', NULL, NULL, '$2a$10$csumilWYEgqH3Ub963zDXOckC2jbahM89CJ2lsAqkr7IiIoCHdRqi', '', '0', '0', '', NULL, 'admin', '2022-09-08 04:33:05', 'admin', '2023-01-14 07:24:41', NULL);
INSERT INTO `sys_tuser` VALUES (10013245765633, '13245765633', '13245765633', '0', '00', 1, NULL, '13245765633', '13245765633@qq.com', NULL, NULL, '$2a$10$4nvQWP9yo3N3.lt5C62LzusaCy1cY6RU3vrawMRvjZdsT/TZdfmAi', '', '0', '0', '', NULL, '', '2023-01-09 17:10:01', '', '2023-01-14 07:24:54', NULL);
INSERT INTO `sys_tuser` VALUES (10013245765693, '13245765693', '13245765693', '0', '00', NULL, NULL, '13245765693', '13245765693@qq.com', NULL, NULL, '$2a$10$7.I.00PqvWOSwFIOJLwjKeU5fnE0ZA4Ig4r2yoCCYgxyWl9hDO8BC', '', '0', '0', '', NULL, '', '2023-01-09 17:08:49', '', NULL, NULL);
INSERT INTO `sys_tuser` VALUES (10013245765696, '13245765696', '13245765696', '0', '00', NULL, NULL, '13245765696', '13245765696@qq.com', NULL, NULL, '$2a$10$hIIakfYRkAievEoZK61uUe56t5S3pnv4vkxsdxv6ExI5kP7ut9jUO', '', '0', '0', '', NULL, '', '2023-01-09 17:09:26', '', NULL, NULL);
INSERT INTO `sys_tuser` VALUES (10013245765697, '13245765697', '13245765697', '0', '00', 1, NULL, '13245765697', '13245765697@qq.com', NULL, NULL, '$2a$10$sc7Yxbu3FKifvW7KQB7qDu9ySrkGM5W4PE9mSFLz9UIDTGKjkf.uS', '', '0', '0', '', NULL, '', '2023-01-09 17:08:24', '', '2023-01-14 17:21:51', NULL);
INSERT INTO `sys_tuser` VALUES (10013245765698, '13245765698', '13245765698', '0', '00', NULL, NULL, '13245765698', '13245765698@qq.com', NULL, NULL, '$2a$10$xP5zy3nyV9G9zubFZqSIJ.iwzgeBJN04v/pvQmrNj6gZWksFdyKhC', '', '3', '0', '127.0.0.1', '2023-01-15 02:41:12', '', '2023-01-09 17:08:05', '', '2023-01-15 02:41:12', NULL);
INSERT INTO `sys_tuser` VALUES (10013245765700, '123563', '123563', '0', '00', 1, '123', '13245965633', '123@qq.com', '123', '123', '$2a$10$eaYkoLR3DY4YZ.g4qLCiMOoepNJdfJocLt7Nv0k1J8eJeXCjEA6HC', '', '2', '0', '', NULL, '', '2023-01-15 03:13:39', '', NULL, '123123');
INSERT INTO `sys_tuser` VALUES (10013698564785, 'LHD2', 'LHD2', '0', '00', 1, '123', '13698564785', 'sdsd@qq.com', '123', '123', '$2a$10$XNAvNARw0fEUa2mtETREqe9WDTggED2B2Obgqe4fLn.cFd4P81WSq', '', '0', '0', '127.0.0.1', '2023-01-16 01:03:14', '', '2023-01-15 12:51:05', '', '2023-01-16 01:03:14', '123');
INSERT INTO `sys_tuser` VALUES (10013895696347, 'LHD', 'LHD', '0', '00', 1, '123', '13895696347', '51454@qq.com', '123', '123', '$2a$10$4UOgf54YTi9q32qhOdz0gefX4EzoJxYGQk7cH7LZKdCMGCnCZXvHS', '', '0', '0', '127.0.0.1', '2023-01-16 01:03:46', '', '2023-01-15 12:50:05', '', '2023-01-16 01:03:46', '123');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-09-06 00:56:35', 'admin', '2022-08-27 17:55:59', '', '2022-09-06 00:56:35', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', 'Syy', '00', 'ry@qq.com', '15666666666', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2022-09-05 00:52:02', 'admin', '2022-08-27 17:55:59', 'admin', '2022-09-05 00:54:37', '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, 'Syy', 'Syy123', '00', '2498177249@qq.com', '13222245937', '0', '', '$2a$10$1pDHNpOJ7Bc5YdAeb/Y12OlEUk6wpOPTqxMsJBUDwv4x0XG9bwV7W', '0', '0', '127.0.0.1', '2022-09-05 01:24:27', 'admin', '2022-09-05 00:55:50', 'admin', '2022-09-05 22:05:55', '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 2);
INSERT INTO `sys_user_role` VALUES (101, 2);
INSERT INTO `sys_user_role` VALUES (103, 2);
INSERT INTO `sys_user_role` VALUES (107, 3);
INSERT INTO `sys_user_role` VALUES (10013186502556, 3);
INSERT INTO `sys_user_role` VALUES (10013186508963, 4);
INSERT INTO `sys_user_role` VALUES (10013222245768, 3);
INSERT INTO `sys_user_role` VALUES (10013222245936, 3);
INSERT INTO `sys_user_role` VALUES (10013222245936, 4);
INSERT INTO `sys_user_role` VALUES (10013222245998, 4);
INSERT INTO `sys_user_role` VALUES (10013222459872, 4);
INSERT INTO `sys_user_role` VALUES (10013224567283, 3);
INSERT INTO `sys_user_role` VALUES (10013224567283, 4);
INSERT INTO `sys_user_role` VALUES (10013245765633, 4);
INSERT INTO `sys_user_role` VALUES (10013245765697, 4);
INSERT INTO `sys_user_role` VALUES (10013245765698, 4);
INSERT INTO `sys_user_role` VALUES (10013698564785, 4);
INSERT INTO `sys_user_role` VALUES (10013895696347, 3);
INSERT INTO `sys_user_role` VALUES (10013986526398, 4);
INSERT INTO `sys_user_role` VALUES (20013186502266, 5);
INSERT INTO `sys_user_role` VALUES (20013186502299, 5);
INSERT INTO `sys_user_role` VALUES (20013222245654, 5);
INSERT INTO `sys_user_role` VALUES (20013245638733, 5);
INSERT INTO `sys_user_role` VALUES (20013245896999, 5);
INSERT INTO `sys_user_role` VALUES (20013258968652, 5);
INSERT INTO `sys_user_role` VALUES (20013535358756, 5);
INSERT INTO `sys_user_role` VALUES (20017896563268, 5);
INSERT INTO `sys_user_role` VALUES (20019932658953, 5);
INSERT INTO `sys_user_role` VALUES (20019963258974, 5);
COMMIT;

-- ----------------------------
-- Table structure for t_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity` (
  `activity_id` varchar(48) NOT NULL,
  `activity_name` varchar(255) DEFAULT NULL,
  `competition_id` varchar(48) NOT NULL,
  `ordernum` bigint NOT NULL,
  `activity_starttime` bigint DEFAULT NULL,
  `activity_endtime` bigint DEFAULT NULL,
  `review_status` int DEFAULT NULL COMMENT '0未评审\n1已经发布评审',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_activity
-- ----------------------------
BEGIN;
INSERT INTO `t_activity` VALUES ('017f65f5-5836-4f4b-be3f-aac815a912dc', '初赛', '67b3d996-bee2-4b43-9a9f-4db255c3ecde', 1, 1673452800000, 1673712000000, 1);
INSERT INTO `t_activity` VALUES ('1', '初赛', 'd77c3aa9-b8ce-4eea-ac36-024ce288b41b', 1, 1670601600000, 1672329600000, 1);
INSERT INTO `t_activity` VALUES ('250291df-753f-4ea1-8966-a83ed28ad246', '复赛', '0929d640-32c2-4a4e-811d-2f48ffcc79fd', 2, 1673539200000, 1673625600000, 1);
INSERT INTO `t_activity` VALUES ('2557072a-2ebe-4ca6-a1d9-d67971184ff5', '决赛', '0929d640-32c2-4a4e-811d-2f48ffcc79fd', 3, 1673625600000, 1673712000000, 1);
INSERT INTO `t_activity` VALUES ('55a947e3-156c-4050-b7f8-67d2f1eb0323', '复赛', '35ce1e1c-a484-4a09-ba0f-e7cd9abe957f', 2, 1671033600000, 1671465600000, 1);
INSERT INTO `t_activity` VALUES ('5f485137-9752-4309-91ff-e2368872ae87', '复赛', '39e72a4f-f8ea-4369-a617-cb048275aaf7', 2, 1675180800000, 1676563200000, 0);
INSERT INTO `t_activity` VALUES ('74a2681a-0457-4e0c-8113-15b0eefcd5f0', 'qw', '7a1f8517-ad36-419c-8d96-5d05a7731c40', 1, 1675180800000, 1675353600000, 0);
INSERT INTO `t_activity` VALUES ('873d433e-3215-49be-b812-eaded4d1fa9a', '复赛', '67b3d996-bee2-4b43-9a9f-4db255c3ecde', 2, 1673539200000, 1673712000000, 1);
INSERT INTO `t_activity` VALUES ('9382b41d-b69a-4a02-b343-b1efba3569e3', '初赛', '39e72a4f-f8ea-4369-a617-cb048275aaf7', 1, 1671984000000, 1675094400000, 1);
INSERT INTO `t_activity` VALUES ('9f321825-9104-487f-976d-8d65c51b1830', '决赛', '35ce1e1c-a484-4a09-ba0f-e7cd9abe957f', 3, 1670860800000, 1672243200000, 1);
INSERT INTO `t_activity` VALUES ('ab638668-8129-403d-87f4-a8f9700278d8', '决赛', 'd77c3aa9-b8ce-4eea-ac36-024ce288b41b', 3, 1673020800000, 1674230400000, 1);
INSERT INTO `t_activity` VALUES ('ac0edcc2-9df2-4a6f-a078-1a5e8d621eb6', '初赛', '35ce1e1c-a484-4a09-ba0f-e7cd9abe957f', 1, 1670256000000, 1670515200000, 1);
INSERT INTO `t_activity` VALUES ('b7e28f96-f130-4955-b0d7-fd316f49022d', '复赛', 'd77c3aa9-b8ce-4eea-ac36-024ce288b41b', 2, 1672502400000, 1672934400000, 1);
INSERT INTO `t_activity` VALUES ('e4aff3ad-68dc-4ea3-a505-3d4e8df07f72', '初赛', '0929d640-32c2-4a4e-811d-2f48ffcc79fd', 1, 1673366400000, 1673452800000, 1);
COMMIT;

-- ----------------------------
-- Table structure for t_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_apply`;
CREATE TABLE `t_apply` (
  `apply_id` varchar(48) NOT NULL,
  `apply_time` bigint DEFAULT NULL,
  `apply_content` varchar(255) DEFAULT NULL,
  `apply_state` int DEFAULT NULL,
  `team_id` varchar(48) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `apply_dispose_time` bigint DEFAULT NULL,
  PRIMARY KEY (`apply_id`),
  KEY `FK_T_APPLY_REFERENCE_T_TEAM` (`team_id`),
  KEY `FK_T_APPLY_REFERENCE_T_USER` (`user_id`),
  CONSTRAINT `t_apply_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `t_team` (`team_id`),
  CONSTRAINT `t_apply_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_suser` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_apply
-- ----------------------------
BEGIN;
INSERT INTO `t_apply` VALUES ('1cf97de2-9ccb-4c96-adaf-602215848236', 1673799493543, '', 1, 'b26680ef-ac2e-4b5c-8673-d38ac43719b6', 20013245896999, 1673799514899);
INSERT INTO `t_apply` VALUES ('271044c9-6318-4b32-a27c-d2f3a13fd55c', 1673798243016, '', 1, 'b26680ef-ac2e-4b5c-8673-d38ac43719b6', 20013245896999, 1673798264479);
INSERT INTO `t_apply` VALUES ('2a55abf7-d231-44cd-89fa-b22009b0cf01', 1670231329878, '123123', 1, '73fd14b0-5370-4c3f-bf4a-d790b70ff33c', 20013245345670, 1670231999502);
INSERT INTO `t_apply` VALUES ('3cb0fb7b-922f-4869-a419-d3012eb8c4f5', 1675253992805, '514354', 1, 'c27daf1f-1d7e-482e-b345-25d635ac5e44', 20013186502299, 1675254031332);
INSERT INTO `t_apply` VALUES ('568ba5b1-45c1-4dec-a979-b458831ab4f9', 1673795384799, '123', 1, 'b26680ef-ac2e-4b5c-8673-d38ac43719b6', 20013245896999, 1673795595502);
INSERT INTO `t_apply` VALUES ('67592e67-2419-4fcb-b628-676ff7363aed', 1673797339398, '', 1, 'b26680ef-ac2e-4b5c-8673-d38ac43719b6', 20013245896999, 1673797365065);
INSERT INTO `t_apply` VALUES ('69f9837c-39a3-4545-953e-1c6d65a98516', 1673795400572, '1223', 2, 'b26680ef-ac2e-4b5c-8673-d38ac43719b6', 20013245896999, 1673795437036);
INSERT INTO `t_apply` VALUES ('d9adcf69-5ce0-489b-bfc5-ed8ea48ce43b', 1673796250139, '', 1, 'b26680ef-ac2e-4b5c-8673-d38ac43719b6', 20013245896999, 1673796275168);
INSERT INTO `t_apply` VALUES ('f951225c-877b-4a8c-a0a4-5289133702bf', 1670231667562, '', 2, '73fd14b0-5370-4c3f-bf4a-d790b70ff33c', 20013245345670, 1670244186679);
INSERT INTO `t_apply` VALUES ('fc0ece42-de53-4557-b090-6a00fb91fd9c', 1673799760779, '', 1, 'b26680ef-ac2e-4b5c-8673-d38ac43719b6', 20013245896999, 1673799784663);
INSERT INTO `t_apply` VALUES ('ff8e847d-676f-4c67-83a8-3ad023a352fc', 1673799820270, '', 1, 'b26680ef-ac2e-4b5c-8673-d38ac43719b6', 20013245896999, 1673799837003);
COMMIT;

-- ----------------------------
-- Table structure for t_competition
-- ----------------------------
DROP TABLE IF EXISTS `t_competition`;
CREATE TABLE `t_competition` (
  `competition_id` varchar(48) NOT NULL,
  `competition_name` varchar(96) DEFAULT NULL,
  `competition_state` int DEFAULT NULL,
  `competition_file` varchar(255) DEFAULT NULL,
  `competition_content` varchar(255) DEFAULT NULL,
  `competition_type` varchar(64) DEFAULT NULL,
  `competition_time` varchar(48) DEFAULT NULL,
  `competition_stoptime` bigint DEFAULT NULL,
  `competition_level` int DEFAULT NULL,
  `competition_site` varchar(64) DEFAULT NULL,
  `competition_people_sum` int DEFAULT NULL,
  PRIMARY KEY (`competition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_competition
-- ----------------------------
BEGIN;
INSERT INTO `t_competition` VALUES ('0929d640-32c2-4a4e-811d-2f48ffcc79fd', '2023生物医学竞赛2', 2, NULL, '2023生物医学竞赛2', '知识竞赛', '2022 年 12 月 29 日', NULL, 4, '线上', 2);
INSERT INTO `t_competition` VALUES ('2d49c1f9-77a7-4dbf-85bb-87c9c0ff0eaa', '20232023', 2, NULL, '2023', '科技竞赛', '', NULL, 2, '2023', 2);
INSERT INTO `t_competition` VALUES ('35ce1e1c-a484-4a09-ba0f-e7cd9abe957f', 'test22', 2, NULL, 'test2', '学科竞赛', '2022 年 12 月 28 日', NULL, 4, 'test2', 1);
INSERT INTO `t_competition` VALUES ('39e72a4f-f8ea-4369-a617-cb048275aaf7', '生物竞赛3', 1, NULL, '生物竞赛3', '学科竞赛', '2023 年 2 月 9 日', NULL, 3, '线上', 2);
INSERT INTO `t_competition` VALUES ('67b3d996-bee2-4b43-9a9f-4db255c3ecde', '2023生物医学竞赛1', 1, NULL, '2023生物医学竞赛1', '创新创业', '2023 年 1 月 3 日', NULL, 3, '线上', 1);
INSERT INTO `t_competition` VALUES ('7a1f8517-ad36-419c-8d96-5d05a7731c40', 'jingsaiaaaa', 1, NULL, 'jingsaiaaaa', '数学竞赛', '2023 年 2 月 22 日', NULL, 3, 'jingsaiaaaa', 2);
INSERT INTO `t_competition` VALUES ('caa6d728-1499-4b32-be5c-0ed20b316900', '哈哈哈哈', 2, NULL, '哈哈哈哈', '科技竞赛', '2023 年 1 月 31 日', NULL, 4, '哈哈哈哈', 5);
INSERT INTO `t_competition` VALUES ('d77c3aa9-b8ce-4eea-ac36-024ce288b41b', 'test13', 1, NULL, 'test1', '学科竞赛', '2022 年 12 月 20 日', NULL, 3, 'test1', 2);
COMMIT;

-- ----------------------------
-- Table structure for t_competitiontype
-- ----------------------------
DROP TABLE IF EXISTS `t_competitiontype`;
CREATE TABLE `t_competitiontype` (
  `competition_type_id` varchar(48) NOT NULL,
  `competition_type_name` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`competition_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_competitiontype
-- ----------------------------
BEGIN;
INSERT INTO `t_competitiontype` VALUES ('1', '创新创业');
INSERT INTO `t_competitiontype` VALUES ('2', '学科竞赛');
INSERT INTO `t_competitiontype` VALUES ('3', '知识竞赛');
INSERT INTO `t_competitiontype` VALUES ('4', '体育竞赛');
INSERT INTO `t_competitiontype` VALUES ('5', '电子竞技');
INSERT INTO `t_competitiontype` VALUES ('6', '数学竞赛');
INSERT INTO `t_competitiontype` VALUES ('7', '科技竞赛');
COMMIT;

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file` (
  `file_id` varchar(48) NOT NULL,
  `competition_id` varchar(48) DEFAULT NULL,
  `notification_id` varchar(48) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `FK_T_FILE_REFERENCE_T_COMPET` (`competition_id`),
  KEY `FK_T_FILE_REFERENCE_T_NOTIFI` (`notification_id`),
  CONSTRAINT `t_file_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `t_competition` (`competition_id`),
  CONSTRAINT `t_file_ibfk_2` FOREIGN KEY (`notification_id`) REFERENCES `t_notification` (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_file
-- ----------------------------
BEGIN;
INSERT INTO `t_file` VALUES ('0e8a4a3b-519d-4402-b7e6-1628b8b47320', '39e72a4f-f8ea-4369-a617-cb048275aaf7', NULL, '医学影像期末课程论文.docx', '/Users/shenyunyao/Desktop/file/39e72a4f-f8ea-4369-a617-cb048275aaf7/医学影像期末课程论文.docx');
INSERT INTO `t_file` VALUES ('17f0cb13-8d13-433f-a603-0c035ae7c731', 'd77c3aa9-b8ce-4eea-ac36-024ce288b41b', NULL, '图片1.png', '/Users/shenyunyao/Desktop/file/d77c3aa9-b8ce-4eea-ac36-024ce288b41b/图片1.png');
INSERT INTO `t_file` VALUES ('3f5eb797-5626-4a60-b6cc-a73e03892553', '35ce1e1c-a484-4a09-ba0f-e7cd9abe957f', NULL, 'PPT-沈云瑶.pptx', '/Users/shenyunyao/Desktop/file/35ce1e1c-a484-4a09-ba0f-e7cd9abe957f/PPT-沈云瑶.pptx');
INSERT INTO `t_file` VALUES ('4ced09e0-dd62-4ebc-b318-83dc02fcc315', '0929d640-32c2-4a4e-811d-2f48ffcc79fd', NULL, 'WechatIMG63.jpeg', '/Users/shenyunyao/Desktop/file/0929d640-32c2-4a4e-811d-2f48ffcc79fd/WechatIMG63.jpeg');
INSERT INTO `t_file` VALUES ('51a46cf9-dbc9-4db5-bb37-74ce2becaca2', 'd77c3aa9-b8ce-4eea-ac36-024ce288b41b', NULL, '稿子-沈云瑶.docx', '/Users/shenyunyao/Desktop/file/d77c3aa9-b8ce-4eea-ac36-024ce288b41b/稿子-沈云瑶.docx');
INSERT INTO `t_file` VALUES ('5988487e-028c-44d5-b095-8bc2220190d3', '67b3d996-bee2-4b43-9a9f-4db255c3ecde', NULL, '沈云瑶刺激.docx', '/Users/shenyunyao/Desktop/file/67b3d996-bee2-4b43-9a9f-4db255c3ecde/沈云瑶刺激.docx');
INSERT INTO `t_file` VALUES ('7122a6a0-9889-46f6-bbf2-6a31c6e0ebc7', '35ce1e1c-a484-4a09-ba0f-e7cd9abe957f', NULL, '20190227165350584.jpeg', '/Users/shenyunyao/Desktop/file/35ce1e1c-a484-4a09-ba0f-e7cd9abe957f/20190227165350584.jpeg');
INSERT INTO `t_file` VALUES ('abc3a262-0257-4c9b-9aeb-74aee5242c98', 'caa6d728-1499-4b32-be5c-0ed20b316900', NULL, '沈云瑶刺激.docx', '/Users/shenyunyao/Desktop/file/caa6d728-1499-4b32-be5c-0ed20b316900/沈云瑶刺激.docx');
INSERT INTO `t_file` VALUES ('b7101736-7541-4218-83e9-39b81f59b830', '39e72a4f-f8ea-4369-a617-cb048275aaf7', NULL, '0317.pdf', '/Users/shenyunyao/Desktop/file/39e72a4f-f8ea-4369-a617-cb048275aaf7/0317.pdf');
COMMIT;

-- ----------------------------
-- Table structure for t_notification
-- ----------------------------
DROP TABLE IF EXISTS `t_notification`;
CREATE TABLE `t_notification` (
  `notification_id` varchar(48) NOT NULL,
  `notification_content` varchar(255) DEFAULT NULL,
  `notification_time` bigint DEFAULT NULL,
  `notification_title` varchar(48) DEFAULT NULL,
  `notification_type` int DEFAULT NULL,
  `notification_state` int DEFAULT NULL,
  `notification_file` varchar(255) DEFAULT NULL,
  `notification_longtime` bigint DEFAULT NULL,
  `competition_id` varchar(48) DEFAULT NULL,
  `acuser_id` bigint DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_notification
-- ----------------------------
BEGIN;
INSERT INTO `t_notification` VALUES ('0333042b-e022-46e0-ba9e-46958806254e', NULL, 1673653662108, '哈哈哈哈', 0, 1, NULL, NULL, 'caa6d728-1499-4b32-be5c-0ed20b316900', NULL);
INSERT INTO `t_notification` VALUES ('12dde782-2b6a-4b00-91b6-b65b65b113c3', NULL, 1673794793705, '2023生物医学竞赛1', 0, 1, NULL, NULL, '67b3d996-bee2-4b43-9a9f-4db255c3ecde', 10013895696347);
INSERT INTO `t_notification` VALUES ('16971cce-b03b-45b0-abef-eb63e9b5aa4e', NULL, 1673794930892, '2023生物医学竞赛2', 0, 1, NULL, NULL, '0929d640-32c2-4a4e-811d-2f48ffcc79fd', 10013895696347);
INSERT INTO `t_notification` VALUES ('5bb89fa2-0dcf-41f6-a458-ef71ba2d008e', NULL, 1675253017257, '生物竞赛3', 0, 1, NULL, NULL, '39e72a4f-f8ea-4369-a617-cb048275aaf7', 10013186502556);
INSERT INTO `t_notification` VALUES ('6f866e1c-f4f3-441e-967e-a1d2f902474b', NULL, 1675262026813, 'jingsaiaaaa', 0, 1, NULL, NULL, '7a1f8517-ad36-419c-8d96-5d05a7731c40', 10013186502556);
INSERT INTO `t_notification` VALUES ('918ed009-5533-423e-9353-bdbd9272cf31', NULL, 1670228044638, 'test1', 0, 1, NULL, NULL, 'd77c3aa9-b8ce-4eea-ac36-024ce288b41b', 107);
INSERT INTO `t_notification` VALUES ('a101a101-5b83-4d7c-8ba6-4da3dad7049c', NULL, 1673642099795, '2023', 0, 1, NULL, NULL, '2d49c1f9-77a7-4dbf-85bb-87c9c0ff0eaa', 107);
INSERT INTO `t_notification` VALUES ('ee6527b2-f14f-4015-99d8-48e3e59f495e', NULL, 1670228082435, 'test2', 0, 1, NULL, NULL, '35ce1e1c-a484-4a09-ba0f-e7cd9abe957f', 10013222245768);
COMMIT;

-- ----------------------------
-- Table structure for t_review
-- ----------------------------
DROP TABLE IF EXISTS `t_review`;
CREATE TABLE `t_review` (
  `review_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tuser_id` bigint NOT NULL,
  `competition_id` varchar(48) DEFAULT NULL,
  `activity_id` varchar(48) DEFAULT NULL,
  `competition_type` int DEFAULT NULL COMMENT '0 单人\n1 多人',
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_review
-- ----------------------------
BEGIN;
INSERT INTO `t_review` VALUES ('0b9d3881-eb6f-41de-b6ca-73f89a07f05e', 10013186502556, '39e72a4f-f8ea-4369-a617-cb048275aaf7', '9382b41d-b69a-4a02-b343-b1efba3569e3', 1);
INSERT INTO `t_review` VALUES ('2c1e8d99-ab79-4032-a538-8cd573c99680', 10013895696347, '0929d640-32c2-4a4e-811d-2f48ffcc79fd', '2557072a-2ebe-4ca6-a1d9-d67971184ff5', 1);
INSERT INTO `t_review` VALUES ('3daf7418-4077-46a7-978a-233d324b7ed1', 107, '35ce1e1c-a484-4a09-ba0f-e7cd9abe957f', '9f321825-9104-487f-976d-8d65c51b1830', 0);
INSERT INTO `t_review` VALUES ('3e5e4be9-9b74-4ca0-a005-45c093708ffe', 10013698564785, '0929d640-32c2-4a4e-811d-2f48ffcc79fd', '250291df-753f-4ea1-8966-a83ed28ad246', 1);
INSERT INTO `t_review` VALUES ('4992c2f9-3114-49c4-acd7-cff7d7412514', 10013222245768, '67b3d996-bee2-4b43-9a9f-4db255c3ecde', '873d433e-3215-49be-b812-eaded4d1fa9a', 0);
INSERT INTO `t_review` VALUES ('5664cb68-84af-4004-b306-a7cb1f00d1ea', 10013895696347, '0929d640-32c2-4a4e-811d-2f48ffcc79fd', 'e4aff3ad-68dc-4ea3-a505-3d4e8df07f72', 1);
INSERT INTO `t_review` VALUES ('63ac3044-7419-40ca-8019-218dc02a594c', 10013222245768, '35ce1e1c-a484-4a09-ba0f-e7cd9abe957f', '55a947e3-156c-4050-b7f8-67d2f1eb0323', 0);
INSERT INTO `t_review` VALUES ('7c238465-fe5d-43fd-82c8-a6e8f981eab7', 107, 'd77c3aa9-b8ce-4eea-ac36-024ce288b41b', '1', 1);
INSERT INTO `t_review` VALUES ('89655c87-bfc8-4928-b745-da3851b44f35', 107, '35ce1e1c-a484-4a09-ba0f-e7cd9abe957f', '55a947e3-156c-4050-b7f8-67d2f1eb0323', 0);
INSERT INTO `t_review` VALUES ('8d6090be-b9ad-4b6f-a59e-e0fbed3e1932', 10013222245936, 'd77c3aa9-b8ce-4eea-ac36-024ce288b41b', 'ab638668-8129-403d-87f4-a8f9700278d8', 1);
INSERT INTO `t_review` VALUES ('ca3abbfa-cbb5-439d-bf01-219017d65083', 10013222245768, 'd77c3aa9-b8ce-4eea-ac36-024ce288b41b', 'b7e28f96-f130-4955-b0d7-fd316f49022d', 1);
INSERT INTO `t_review` VALUES ('d1fd9a34-2e21-46fd-9d43-df39c40692c5', 107, '35ce1e1c-a484-4a09-ba0f-e7cd9abe957f', 'ac0edcc2-9df2-4a6f-a078-1a5e8d621eb6', 0);
INSERT INTO `t_review` VALUES ('d3498ba1-19c6-4011-b3f9-00b4e154e694', 10013895696347, '67b3d996-bee2-4b43-9a9f-4db255c3ecde', '017f65f5-5836-4f4b-be3f-aac815a912dc', 0);
INSERT INTO `t_review` VALUES ('d9f66d39-b80f-4438-b1d9-258362b4621b', 10013222245768, '35ce1e1c-a484-4a09-ba0f-e7cd9abe957f', 'ac0edcc2-9df2-4a6f-a078-1a5e8d621eb6', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_review_team
-- ----------------------------
DROP TABLE IF EXISTS `t_review_team`;
CREATE TABLE `t_review_team` (
  `review_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `team_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `review_state` int DEFAULT NULL COMMENT '0 代评审\n1已评审',
  PRIMARY KEY (`review_id`,`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_review_team
-- ----------------------------
BEGIN;
INSERT INTO `t_review_team` VALUES ('0b9d3881-eb6f-41de-b6ca-73f89a07f05e', 'c27daf1f-1d7e-482e-b345-25d635ac5e44', 1);
INSERT INTO `t_review_team` VALUES ('2c1e8d99-ab79-4032-a538-8cd573c99680', 'b26680ef-ac2e-4b5c-8673-d38ac43719b6', 1);
INSERT INTO `t_review_team` VALUES ('3e5e4be9-9b74-4ca0-a005-45c093708ffe', 'b26680ef-ac2e-4b5c-8673-d38ac43719b6', 1);
INSERT INTO `t_review_team` VALUES ('5664cb68-84af-4004-b306-a7cb1f00d1ea', 'b26680ef-ac2e-4b5c-8673-d38ac43719b6', 1);
INSERT INTO `t_review_team` VALUES ('7c238465-fe5d-43fd-82c8-a6e8f981eab7', '73fd14b0-5370-4c3f-bf4a-d790b70ff33c', 1);
INSERT INTO `t_review_team` VALUES ('8d6090be-b9ad-4b6f-a59e-e0fbed3e1932', '73fd14b0-5370-4c3f-bf4a-d790b70ff33c', 1);
INSERT INTO `t_review_team` VALUES ('ca3abbfa-cbb5-439d-bf01-219017d65083', '73fd14b0-5370-4c3f-bf4a-d790b70ff33c', 1);
COMMIT;

-- ----------------------------
-- Table structure for t_review_user
-- ----------------------------
DROP TABLE IF EXISTS `t_review_user`;
CREATE TABLE `t_review_user` (
  `review_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `review_state` int DEFAULT NULL COMMENT '0 未被打分\n1 已经被打分',
  PRIMARY KEY (`review_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_review_user
-- ----------------------------
BEGIN;
INSERT INTO `t_review_user` VALUES ('3daf7418-4077-46a7-978a-233d324b7ed1', 20013245345670, 1);
INSERT INTO `t_review_user` VALUES ('4992c2f9-3114-49c4-acd7-cff7d7412514', 20019963258974, 0);
INSERT INTO `t_review_user` VALUES ('63ac3044-7419-40ca-8019-218dc02a594c', 20013535358756, 1);
INSERT INTO `t_review_user` VALUES ('89655c87-bfc8-4928-b745-da3851b44f35', 20013245345670, 1);
INSERT INTO `t_review_user` VALUES ('d1fd9a34-2e21-46fd-9d43-df39c40692c5', 20013245345670, 1);
INSERT INTO `t_review_user` VALUES ('d1fd9a34-2e21-46fd-9d43-df39c40692c5', 20013245638733, 1);
INSERT INTO `t_review_user` VALUES ('d3498ba1-19c6-4011-b3f9-00b4e154e694', 20019963258974, 1);
INSERT INTO `t_review_user` VALUES ('d9f66d39-b80f-4438-b1d9-258362b4621b', 20013535358756, 1);
COMMIT;

-- ----------------------------
-- Table structure for t_team
-- ----------------------------
DROP TABLE IF EXISTS `t_team`;
CREATE TABLE `t_team` (
  `team_id` varchar(48) NOT NULL,
  `captain_id` bigint DEFAULT NULL,
  `team_name` varchar(48) DEFAULT NULL,
  `team_state` int DEFAULT NULL,
  `team_headcount` int DEFAULT NULL,
  `competition_id` varchar(48) DEFAULT NULL,
  `team_content` varchar(255) DEFAULT NULL,
  `apply_time` bigint DEFAULT NULL,
  `audit_state` int DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  KEY `FK_T_TEAM_REFERENCE_T_USER` (`captain_id`),
  KEY `FK_T_TEAM_REFERENCE_T_COMPETITION` (`competition_id`),
  CONSTRAINT `t_team_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `t_competition` (`competition_id`),
  CONSTRAINT `t_team_ibfk_2` FOREIGN KEY (`captain_id`) REFERENCES `sys_suser` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_team
-- ----------------------------
BEGIN;
INSERT INTO `t_team` VALUES ('73fd14b0-5370-4c3f-bf4a-d790b70ff33c', 20013245638733, 'SYY', 3, 2, 'd77c3aa9-b8ce-4eea-ac36-024ce288b41b', '1231213', 1670385434627, 1);
INSERT INTO `t_team` VALUES ('aa4d521e-3ca2-4ba6-84e0-5d9358ea47a6', 20013186502266, 'asasasa', 3, 1, '7a1f8517-ad36-419c-8d96-5d05a7731c40', 'asa', 1675262842924, 0);
INSERT INTO `t_team` VALUES ('b26680ef-ac2e-4b5c-8673-d38ac43719b6', 20019963258974, '东南王者', 3, 2, '0929d640-32c2-4a4e-811d-2f48ffcc79fd', '王者', 1673799848244, 1);
INSERT INTO `t_team` VALUES ('c27daf1f-1d7e-482e-b345-25d635ac5e44', 20013186502266, 'DDDD', 3, 2, '39e72a4f-f8ea-4369-a617-cb048275aaf7', '123456', 1675254180110, 1);
COMMIT;

-- ----------------------------
-- Table structure for t_team_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_team_activity`;
CREATE TABLE `t_team_activity` (
  `team_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activity_id` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` bigint DEFAULT NULL,
  `file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `activity_state` int DEFAULT '0' COMMENT '0 待评审\n1 成功加入下一个赛段\n2 未能成功加入下一个赛段',
  `score` int DEFAULT NULL,
  PRIMARY KEY (`team_id`,`activity_id`),
  KEY `t_team_activity_ibfk_2` (`activity_id`),
  CONSTRAINT `t_team_activity_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `t_team` (`team_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_team_activity_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `t_activity` (`activity_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_team_activity
-- ----------------------------
BEGIN;
INSERT INTO `t_team_activity` VALUES ('73fd14b0-5370-4c3f-bf4a-d790b70ff33c', '1', 1670435422006, '154cd542-9407-4c0e-b5ae-1656675575a2', 1, 88);
INSERT INTO `t_team_activity` VALUES ('73fd14b0-5370-4c3f-bf4a-d790b70ff33c', 'ab638668-8129-403d-87f4-a8f9700278d8', 1673622149017, '38b5b75e-a17f-4ca8-8750-8a51b6e9191b', 1, 100);
INSERT INTO `t_team_activity` VALUES ('73fd14b0-5370-4c3f-bf4a-d790b70ff33c', 'b7e28f96-f130-4955-b0d7-fd316f49022d', 1673622042829, 'a510b113-433a-497c-9f2c-cf648e3dfc68', 1, 56);
INSERT INTO `t_team_activity` VALUES ('b26680ef-ac2e-4b5c-8673-d38ac43719b6', '250291df-753f-4ea1-8966-a83ed28ad246', 1673801276173, 'c85523cd-c8e8-4b0a-8c11-425d0be68965', 1, 89);
INSERT INTO `t_team_activity` VALUES ('b26680ef-ac2e-4b5c-8673-d38ac43719b6', '2557072a-2ebe-4ca6-a1d9-d67971184ff5', 1673802210306, 'e04576e3-3603-454e-ba13-244ab1fba12a', 1, 88);
INSERT INTO `t_team_activity` VALUES ('b26680ef-ac2e-4b5c-8673-d38ac43719b6', 'e4aff3ad-68dc-4ea3-a505-3d4e8df07f72', 1673800569390, '79fb93e5-6ad3-40ed-be9e-bc9d868d036b', 1, 99);
INSERT INTO `t_team_activity` VALUES ('c27daf1f-1d7e-482e-b345-25d635ac5e44', '5f485137-9752-4309-91ff-e2368872ae87', 1675257542453, '0629b972-028a-4128-b0e1-315d663ca5c0', 0, NULL);
INSERT INTO `t_team_activity` VALUES ('c27daf1f-1d7e-482e-b345-25d635ac5e44', '9382b41d-b69a-4a02-b343-b1efba3569e3', 1675255369437, '38633ce1-e68e-472b-bb03-5194c6f33060', 1, 85);
COMMIT;

-- ----------------------------
-- Table structure for t_user_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_user_activity`;
CREATE TABLE `t_user_activity` (
  `user_id` bigint NOT NULL,
  `activity_id` varchar(48) NOT NULL,
  `date` bigint DEFAULT NULL,
  `file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `activity_state` int DEFAULT '0',
  `score` int DEFAULT NULL,
  PRIMARY KEY (`activity_id`,`user_id`),
  KEY `t_user_activity_ibfk_1` (`user_id`),
  CONSTRAINT `t_user_activity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_suser` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_user_activity_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `t_activity` (`activity_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_user_activity
-- ----------------------------
BEGIN;
INSERT INTO `t_user_activity` VALUES (20019963258974, '017f65f5-5836-4f4b-be3f-aac815a912dc', 1673800626381, 'b066cb0a-ba5e-4fb7-a5a4-452fd6824508', 1, 88);
INSERT INTO `t_user_activity` VALUES (20013245345670, '55a947e3-156c-4050-b7f8-67d2f1eb0323', 1673618465485, '1826f78c-c3bb-4854-bf32-e9b1e9d9e160', 1, 89);
INSERT INTO `t_user_activity` VALUES (20013535358756, '55a947e3-156c-4050-b7f8-67d2f1eb0323', 1673619459233, '1826f78c-c3bb-4854-bf32-e9b1e9d9e160', 2, 22);
INSERT INTO `t_user_activity` VALUES (20019963258974, '873d433e-3215-49be-b812-eaded4d1fa9a', 1673803431337, 'fa445429-53b1-49e4-bdaf-c313fa39a780', 0, NULL);
INSERT INTO `t_user_activity` VALUES (20013245345670, '9f321825-9104-487f-976d-8d65c51b1830', 1673621861948, '1826f78c-c3bb-4854-bf32-e9b1e9d9e160', 1, 89);
INSERT INTO `t_user_activity` VALUES (20013245345670, 'ac0edcc2-9df2-4a6f-a078-1a5e8d621eb6', 1673168909270, '1826f78c-c3bb-4854-bf32-e9b1e9d9e160', 1, 85);
INSERT INTO `t_user_activity` VALUES (20013245638733, 'ac0edcc2-9df2-4a6f-a078-1a5e8d621eb6', 1670431470266, '1826f78c-c3bb-4854-bf32-e9b1e9d9e160', 2, 55);
INSERT INTO `t_user_activity` VALUES (20013535358756, 'ac0edcc2-9df2-4a6f-a078-1a5e8d621eb6', 1670431470266, '1826f78c-c3bb-4854-bf32-e9b1e9d9e160', 1, 90);
COMMIT;

-- ----------------------------
-- Table structure for t_user_competition
-- ----------------------------
DROP TABLE IF EXISTS `t_user_competition`;
CREATE TABLE `t_user_competition` (
  `competition_id` varchar(48) NOT NULL,
  `user_id` bigint NOT NULL,
  `date` bigint DEFAULT NULL,
  `win_ranking` int DEFAULT NULL,
  `win_level_name` varchar(48) DEFAULT NULL,
  `audit_state` int DEFAULT NULL,
  PRIMARY KEY (`competition_id`,`user_id`),
  KEY `FK_T_USER_C_REFERENCE_T_USER` (`user_id`),
  CONSTRAINT `t_user_competition_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `t_competition` (`competition_id`),
  CONSTRAINT `t_user_competition_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_suser` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_user_competition
-- ----------------------------
BEGIN;
INSERT INTO `t_user_competition` VALUES ('35ce1e1c-a484-4a09-ba0f-e7cd9abe957f', 20013245345670, 1670228443695, NULL, NULL, 1);
INSERT INTO `t_user_competition` VALUES ('35ce1e1c-a484-4a09-ba0f-e7cd9abe957f', 20013245638733, 1670497975524, NULL, NULL, 1);
INSERT INTO `t_user_competition` VALUES ('67b3d996-bee2-4b43-9a9f-4db255c3ecde', 20019963258974, 1673797149005, NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for t_user_team
-- ----------------------------
DROP TABLE IF EXISTS `t_user_team`;
CREATE TABLE `t_user_team` (
  `user_id` bigint NOT NULL,
  `team_id` varchar(48) NOT NULL,
  PRIMARY KEY (`user_id`,`team_id`),
  KEY `FK_T_USER_T_REFERENCE_T_TEAM` (`team_id`),
  CONSTRAINT `t_user_team_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `t_team` (`team_id`),
  CONSTRAINT `t_user_team_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_suser` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_user_team
-- ----------------------------
BEGIN;
INSERT INTO `t_user_team` VALUES (20013245345670, '73fd14b0-5370-4c3f-bf4a-d790b70ff33c');
INSERT INTO `t_user_team` VALUES (20013245638733, '73fd14b0-5370-4c3f-bf4a-d790b70ff33c');
INSERT INTO `t_user_team` VALUES (20013186502266, 'aa4d521e-3ca2-4ba6-84e0-5d9358ea47a6');
INSERT INTO `t_user_team` VALUES (20013245896999, 'b26680ef-ac2e-4b5c-8673-d38ac43719b6');
INSERT INTO `t_user_team` VALUES (20019963258974, 'b26680ef-ac2e-4b5c-8673-d38ac43719b6');
INSERT INTO `t_user_team` VALUES (20013186502266, 'c27daf1f-1d7e-482e-b345-25d635ac5e44');
INSERT INTO `t_user_team` VALUES (20013186502299, 'c27daf1f-1d7e-482e-b345-25d635ac5e44');
COMMIT;

-- ----------------------------
-- Table structure for t_workfile
-- ----------------------------
DROP TABLE IF EXISTS `t_workfile`;
CREATE TABLE `t_workfile` (
  `file_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_workfile
-- ----------------------------
BEGIN;
INSERT INTO `t_workfile` VALUES ('0629b972-028a-4128-b0e1-315d663ca5c0', '期末报告-生物纳米技术-224453-沈云瑶.pdf', '/Users/shenyunyao/Desktop/file/5f485137-9752-4309-91ff-e2368872ae87/期末报告-生物纳米技术-224453-沈云瑶.pdf');
INSERT INTO `t_workfile` VALUES ('154cd542-9407-4c0e-b5ae-1656675575a2', '稿子.docx', '/Users/shenyunyao/Desktop/file/1/稿子.docx');
INSERT INTO `t_workfile` VALUES ('1826f78c-c3bb-4854-bf32-e9b1e9d9e160', 'WechatIMG2157.png', '/Users/shenyunyao/Desktop/file/ac0edcc2-9df2-4a6f-a078-1a5e8d621eb6/WechatIMG2157.png');
INSERT INTO `t_workfile` VALUES ('23fafaf6-ce1f-4d0b-b492-e29888f423d0', 'WechatIMG2156.png', '/Users/shenyunyao/Desktop/file/1/WechatIMG2156.png');
INSERT INTO `t_workfile` VALUES ('38633ce1-e68e-472b-bb03-5194c6f33060', '0317.pdf', '/Users/shenyunyao/Desktop/file/9382b41d-b69a-4a02-b343-b1efba3569e3/0317.pdf');
INSERT INTO `t_workfile` VALUES ('38b5b75e-a17f-4ca8-8750-8a51b6e9191b', '图片1.png', '/Users/shenyunyao/Desktop/file/ab638668-8129-403d-87f4-a8f9700278d8/图片1.png');
INSERT INTO `t_workfile` VALUES ('398f71fe-e7e1-487e-bd4b-41ce059a7cd2', '副本和我一起养蜜蜂.docx', '/Users/shenyunyao/Desktop/file/ac0edcc2-9df2-4a6f-a078-1a5e8d621eb6/副本和我一起养蜜蜂.docx');
INSERT INTO `t_workfile` VALUES ('3f5eb797', 'PPT-沈云瑶.pptx', '/Users/shenyunyao/Desktop/file/35ce1e1c-a484-4a09-ba0f-e7cd9abe957f/PPT-沈云瑶.pptx');
INSERT INTO `t_workfile` VALUES ('55cfc225-9e9a-42b4-8f13-14f7b8e9d838', '沈云瑶刺激.docx', '/Users/shenyunyao/Desktop/file/b7e28f96-f130-4955-b0d7-fd316f49022d/沈云瑶刺激.docx');
INSERT INTO `t_workfile` VALUES ('79fb93e5-6ad3-40ed-be9e-bc9d868d036b', 'method.docx', '/Users/shenyunyao/Desktop/file/e4aff3ad-68dc-4ea3-a505-3d4e8df07f72/method.docx');
INSERT INTO `t_workfile` VALUES ('82d8d603-2d34-4218-b261-1202567b1034', 'WechatIMG2156.png', '/Users/shenyunyao/Desktop/file/ac0edcc2-9df2-4a6f-a078-1a5e8d621eb6/WechatIMG2156.png');
INSERT INTO `t_workfile` VALUES ('9730844c-614c-4911-889b-8a88487a784b', 'WechatIMG2156.png', '/Users/shenyunyao/Desktop/file/ac0edcc2-9df2-4a6f-a078-1a5e8d621eb6/WechatIMG2156.png');
INSERT INTO `t_workfile` VALUES ('a510b113-433a-497c-9f2c-cf648e3dfc68', '沈云瑶刺激.docx', '/Users/shenyunyao/Desktop/file/b7e28f96-f130-4955-b0d7-fd316f49022d/沈云瑶刺激.docx');
INSERT INTO `t_workfile` VALUES ('a7df7d75-9e5a-4c84-9123-1ee3d29ec869', 'cristhian.potes-204.zip', '/Users/shenyunyao/Desktop/file/1/cristhian.potes-204.zip');
INSERT INTO `t_workfile` VALUES ('adb612c1-ea2b-4491-95f5-2cf93dcfab37', 'WechatIMG2156.png', '/Users/shenyunyao/Desktop/file/ac0edcc2-9df2-4a6f-a078-1a5e8d621eb6/WechatIMG2156.png');
INSERT INTO `t_workfile` VALUES ('afc8daa1-95b4-491c-9b90-90baff159948', 'WechatIMG2156.png', '/Users/shenyunyao/Desktop/file/55a947e3-156c-4050-b7f8-67d2f1eb0323/WechatIMG2156.png');
INSERT INTO `t_workfile` VALUES ('b066cb0a-ba5e-4fb7-a5a4-452fd6824508', '0317.pdf', '/Users/shenyunyao/Desktop/file/017f65f5-5836-4f4b-be3f-aac815a912dc/0317.pdf');
INSERT INTO `t_workfile` VALUES ('b1a2bea9-a3f6-4718-89d4-0bcb06d7bb3e', 'WechatIMG2156.png', '/Users/shenyunyao/Desktop/file/ac0edcc2-9df2-4a6f-a078-1a5e8d621eb6/WechatIMG2156.png');
INSERT INTO `t_workfile` VALUES ('b51ee7bf-99d7-44a6-95d7-b926909f93c4', '20190227165350584.jpeg', '/Users/shenyunyao/Desktop/file/b7e28f96-f130-4955-b0d7-fd316f49022d/20190227165350584.jpeg');
INSERT INTO `t_workfile` VALUES ('bbbc5b22-763a-40e2-818c-ba0c2110d7ca', 'WechatIMG2156.png', '/Users/shenyunyao/Desktop/file/ac0edcc2-9df2-4a6f-a078-1a5e8d621eb6/WechatIMG2156.png');
INSERT INTO `t_workfile` VALUES ('c85523cd-c8e8-4b0a-8c11-425d0be68965', '2116330.pdf', '/Users/shenyunyao/Desktop/file/250291df-753f-4ea1-8966-a83ed28ad246/2116330.pdf');
INSERT INTO `t_workfile` VALUES ('e04576e3-3603-454e-ba13-244ab1fba12a', '图片1.png', '/Users/shenyunyao/Desktop/file/2557072a-2ebe-4ca6-a1d9-d67971184ff5/图片1.png');
INSERT INTO `t_workfile` VALUES ('e7ba43e6-e6dc-418e-9a2b-14c7050a1a3a', 'WechatIMG2156.png', '/Users/shenyunyao/Desktop/file/ac0edcc2-9df2-4a6f-a078-1a5e8d621eb6/WechatIMG2156.png');
INSERT INTO `t_workfile` VALUES ('fa445429-53b1-49e4-bdaf-c313fa39a780', '生物纳米技术-沈云瑶-224453.pdf', '/Users/shenyunyao/Desktop/file/873d433e-3215-49be-b812-eaded4d1fa9a/生物纳米技术-沈云瑶-224453.pdf');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
