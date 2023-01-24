/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : easyweb-shiro

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 25/08/2020 22:36:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary`  (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典id',
  `dict_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典标识',
  `dict_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_code`(`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES (1, 'sex', '性别', 1, '', 0, '2020-03-15 13:04:39', '2020-03-15 13:04:39');
INSERT INTO `sys_dictionary` VALUES (2, 'organization_type', '机构类型', 2, '', 0, '2020-03-16 00:32:36', '2020-03-16 00:32:36');

-- ----------------------------
-- Table structure for sys_dictionary_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary_data`;
CREATE TABLE `sys_dictionary_data`  (
  `dict_data_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典项id',
  `dict_id` int(11) NOT NULL COMMENT '字典id',
  `dict_data_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典项标识',
  `dict_data_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典项名称',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`dict_data_id`) USING BTREE,
  INDEX `dict_id`(`dict_id`) USING BTREE,
  CONSTRAINT `sys_dictionary_data_ibfk_1` FOREIGN KEY (`dict_id`) REFERENCES `sys_dictionary` (`dict_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionary_data
-- ----------------------------
INSERT INTO `sys_dictionary_data` VALUES (1, 1, 'male', '男', 1, '', 0, '2020-03-15 13:07:28', '2020-03-15 13:07:28');
INSERT INTO `sys_dictionary_data` VALUES (2, 1, 'female', '女', 2, '', 0, '2020-03-15 13:07:41', '2020-03-15 15:58:04');
INSERT INTO `sys_dictionary_data` VALUES (3, 2, 'company', '公司', 1, '', 0, '2020-03-16 00:34:32', '2020-03-16 00:34:32');
INSERT INTO `sys_dictionary_data` VALUES (4, 2, 'subsidiary', '子公司', 2, '', 0, '2020-03-16 00:35:02', '2020-03-16 00:35:02');
INSERT INTO `sys_dictionary_data` VALUES (5, 2, 'department', '部门', 3, '', 0, '2020-03-16 00:35:18', '2020-03-16 00:35:18');
INSERT INTO `sys_dictionary_data` VALUES (6, 2, 'group', '小组', 4, '', 0, '2020-03-16 00:35:36', '2020-03-16 00:35:36');

-- ----------------------------
-- Table structure for sys_login_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_record`;
CREATE TABLE `sys_login_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `os` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `device` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备名',
  `browser` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `oper_type` int(11) NOT NULL COMMENT '操作类型,0登录成功,1登录失败,2退出登录,3刷新token',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_record
-- ----------------------------
INSERT INTO `sys_login_record` VALUES (1, 'admin', 'Windows 10', 'Windows 10', 'Chrome', '192.168.1.6', 0, NULL, '2020-08-11 14:06:54', '2020-08-11 14:06:54');
INSERT INTO `sys_login_record` VALUES (2, 'admin', 'Windows 10', 'Windows 10', 'Chrome', '192.168.1.6', 0, NULL, '2020-08-11 14:56:50', '2020-08-11 14:56:50');
INSERT INTO `sys_login_record` VALUES (3, 'admin', 'Windows 10', 'Windows 10', 'Chrome', '192.168.1.6', 0, NULL, '2020-08-13 09:01:42', '2020-08-13 09:01:42');
INSERT INTO `sys_login_record` VALUES (4, 'admin', 'Windows 10', 'Windows 10', 'Chrome', '192.168.1.6', 0, NULL, '2020-08-13 10:00:17', '2020-08-13 10:00:17');
INSERT INTO `sys_login_record` VALUES (5, 'admin', 'Windows 10', 'Windows 10', 'Chrome', '192.168.1.6', 0, NULL, '2020-08-13 10:11:18', '2020-08-13 10:11:18');
INSERT INTO `sys_login_record` VALUES (6, 'admin', 'Windows 10', 'Windows 10', 'Chrome', '192.168.1.6', 0, NULL, '2020-08-13 10:25:05', '2020-08-13 10:25:05');
INSERT INTO `sys_login_record` VALUES (7, 'admin', 'Windows 10', 'Windows 10', 'Chrome', '192.168.1.6', 1, '验证码错误', '2020-08-13 10:29:28', '2020-08-13 10:29:28');
INSERT INTO `sys_login_record` VALUES (8, 'admin', 'Windows 10', 'Windows 10', 'Chrome', '192.168.1.6', 1, '验证码错误', '2020-08-13 10:29:35', '2020-08-13 10:29:35');
INSERT INTO `sys_login_record` VALUES (9, 'admin', 'Windows 10', 'Windows 10', 'Chrome', '192.168.1.6', 0, NULL, '2020-08-13 10:32:04', '2020-08-13 10:32:04');
INSERT INTO `sys_login_record` VALUES (10, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-13 10:48:08', '2020-08-13 10:48:08');
INSERT INTO `sys_login_record` VALUES (11, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-13 10:52:36', '2020-08-13 10:52:36');
INSERT INTO `sys_login_record` VALUES (12, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-13 11:19:58', '2020-08-13 11:19:58');
INSERT INTO `sys_login_record` VALUES (13, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-13 17:25:34', '2020-08-13 17:25:34');
INSERT INTO `sys_login_record` VALUES (14, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-14 08:59:39', '2020-08-14 08:59:39');
INSERT INTO `sys_login_record` VALUES (15, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-14 09:08:55', '2020-08-14 09:08:55');
INSERT INTO `sys_login_record` VALUES (16, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-14 10:05:52', '2020-08-14 10:05:52');
INSERT INTO `sys_login_record` VALUES (17, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-14 11:01:51', '2020-08-14 11:01:51');
INSERT INTO `sys_login_record` VALUES (18, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-14 11:09:00', '2020-08-14 11:09:00');
INSERT INTO `sys_login_record` VALUES (19, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-14 13:49:31', '2020-08-14 13:49:31');
INSERT INTO `sys_login_record` VALUES (20, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-14 15:51:04', '2020-08-14 15:51:04');
INSERT INTO `sys_login_record` VALUES (21, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-14 16:30:49', '2020-08-14 16:30:49');
INSERT INTO `sys_login_record` VALUES (22, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-14 17:24:54', '2020-08-14 17:24:54');
INSERT INTO `sys_login_record` VALUES (23, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-14 17:57:12', '2020-08-14 17:57:12');
INSERT INTO `sys_login_record` VALUES (24, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-14 18:09:10', '2020-08-14 18:09:10');
INSERT INTO `sys_login_record` VALUES (25, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 1, '验证码错误', '2020-08-14 18:59:48', '2020-08-14 18:59:48');
INSERT INTO `sys_login_record` VALUES (26, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-14 18:59:55', '2020-08-14 18:59:55');
INSERT INTO `sys_login_record` VALUES (27, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-14 19:02:14', '2020-08-14 19:02:14');
INSERT INTO `sys_login_record` VALUES (28, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-14 19:22:43', '2020-08-14 19:22:43');
INSERT INTO `sys_login_record` VALUES (29, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-15 09:22:23', '2020-08-15 09:22:23');
INSERT INTO `sys_login_record` VALUES (30, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-15 10:12:01', '2020-08-15 10:12:01');
INSERT INTO `sys_login_record` VALUES (31, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-15 11:47:58', '2020-08-15 11:47:58');
INSERT INTO `sys_login_record` VALUES (32, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-15 20:16:17', '2020-08-15 20:16:17');
INSERT INTO `sys_login_record` VALUES (33, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-15 20:21:15', '2020-08-15 20:21:15');
INSERT INTO `sys_login_record` VALUES (34, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-15 22:41:19', '2020-08-15 22:41:19');
INSERT INTO `sys_login_record` VALUES (35, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-16 08:34:28', '2020-08-16 08:34:28');
INSERT INTO `sys_login_record` VALUES (36, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-16 10:55:03', '2020-08-16 10:55:03');
INSERT INTO `sys_login_record` VALUES (37, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-16 16:04:23', '2020-08-16 16:04:23');
INSERT INTO `sys_login_record` VALUES (38, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-16 17:04:01', '2020-08-16 17:04:01');
INSERT INTO `sys_login_record` VALUES (39, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-16 20:19:31', '2020-08-16 20:19:31');
INSERT INTO `sys_login_record` VALUES (40, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-16 21:37:32', '2020-08-16 21:37:32');
INSERT INTO `sys_login_record` VALUES (41, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-17 08:33:12', '2020-08-17 08:33:12');
INSERT INTO `sys_login_record` VALUES (42, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-17 14:45:54', '2020-08-17 14:45:54');
INSERT INTO `sys_login_record` VALUES (43, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-18 11:38:18', '2020-08-18 11:38:18');
INSERT INTO `sys_login_record` VALUES (44, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-18 11:42:55', '2020-08-18 11:42:55');
INSERT INTO `sys_login_record` VALUES (45, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-18 13:24:23', '2020-08-18 13:24:23');
INSERT INTO `sys_login_record` VALUES (46, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-18 13:27:06', '2020-08-18 13:27:06');
INSERT INTO `sys_login_record` VALUES (47, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-18 19:04:04', '2020-08-18 19:04:04');
INSERT INTO `sys_login_record` VALUES (48, 'teacher_01', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-18 19:28:43', '2020-08-18 19:28:43');
INSERT INTO `sys_login_record` VALUES (49, 'teacher_01', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-18 21:35:14', '2020-08-18 21:35:14');
INSERT INTO `sys_login_record` VALUES (50, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 1, '验证码错误', '2020-08-18 21:37:52', '2020-08-18 21:37:52');
INSERT INTO `sys_login_record` VALUES (51, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-18 21:38:01', '2020-08-18 21:38:01');
INSERT INTO `sys_login_record` VALUES (52, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-19 09:32:11', '2020-08-19 09:32:11');
INSERT INTO `sys_login_record` VALUES (53, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-19 11:16:43', '2020-08-19 11:16:43');
INSERT INTO `sys_login_record` VALUES (54, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-19 12:21:09', '2020-08-19 12:21:09');
INSERT INTO `sys_login_record` VALUES (55, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-19 13:33:22', '2020-08-19 13:33:22');
INSERT INTO `sys_login_record` VALUES (56, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-19 14:58:23', '2020-08-19 14:58:23');
INSERT INTO `sys_login_record` VALUES (57, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-19 18:47:50', '2020-08-19 18:47:50');
INSERT INTO `sys_login_record` VALUES (58, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-19 20:35:35', '2020-08-19 20:35:35');
INSERT INTO `sys_login_record` VALUES (59, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-19 20:36:57', '2020-08-19 20:36:57');
INSERT INTO `sys_login_record` VALUES (60, 'admin', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-19 22:50:23', '2020-08-19 22:50:23');
INSERT INTO `sys_login_record` VALUES (61, 'teacher_01', 'Windows 10', 'Windows 10', 'Chrome 65', '192.168.1.6', 0, NULL, '2020-08-19 23:00:37', '2020-08-19 23:00:37');
INSERT INTO `sys_login_record` VALUES (62, 'admin', 'Windows 10', 'Windows 10', 'Chrome', '192.168.1.6', 0, NULL, '2020-08-20 10:04:39', '2020-08-20 10:04:39');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级id,0是顶级',
  `menu_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `menu_icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单地址',
  `menu_type` int(11) NULL DEFAULT 0 COMMENT '类型,0菜单,1按钮',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `authority` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `target` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '_self' COMMENT '打开位置',
  `icon_color` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标颜色',
  `hide` int(11) NOT NULL DEFAULT 0 COMMENT '是否隐藏,0否,1是',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', 'layui-icon layui-icon-set-sm', NULL, 0, 1, NULL, '_self', NULL, 0, 0, '2020-02-26 12:51:23', '2020-03-21 18:47:00');
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', NULL, 'sys/user', 0, 1, 'sys:user:view', '_self', NULL, 0, 0, '2020-02-26 12:51:55', '2020-03-21 18:45:26');
INSERT INTO `sys_menu` VALUES (3, 2, '查询用户', NULL, NULL, 1, 1, 'sys:user:list', '_self', NULL, 0, 0, '2020-02-26 12:52:06', '2020-03-21 18:45:28');
INSERT INTO `sys_menu` VALUES (4, 2, '添加用户', NULL, NULL, 1, 2, 'sys:user:save', '_self', NULL, 0, 0, '2020-02-26 12:52:26', '2020-03-21 18:45:29');
INSERT INTO `sys_menu` VALUES (5, 2, '修改用户', NULL, NULL, 1, 3, 'sys:user:update', '_self', NULL, 0, 0, '2020-02-26 12:52:50', '2020-03-21 18:45:30');
INSERT INTO `sys_menu` VALUES (6, 2, '删除用户', NULL, NULL, 1, 4, 'sys:user:remove', '_self', NULL, 0, 0, '2020-02-26 12:53:13', '2020-03-21 18:45:32');
INSERT INTO `sys_menu` VALUES (7, 1, '角色管理', NULL, 'sys/role', 0, 2, 'sys:role:view', '_self', NULL, 0, 0, '2020-03-13 13:29:08', '2020-03-21 18:45:33');
INSERT INTO `sys_menu` VALUES (8, 7, '查询角色', NULL, NULL, 1, 1, 'sys:role:list', '_self', NULL, 0, 0, '2020-03-13 13:30:41', '2020-03-21 18:45:34');
INSERT INTO `sys_menu` VALUES (9, 7, '添加角色', NULL, NULL, 1, 2, 'sys:role:save', '_self', NULL, 0, 0, '2020-03-15 13:02:07', '2020-03-21 18:45:35');
INSERT INTO `sys_menu` VALUES (10, 7, '修改角色', NULL, NULL, 1, 3, 'sys:role:update', '_self', NULL, 0, 0, '2020-03-15 13:02:49', '2020-03-21 18:45:36');
INSERT INTO `sys_menu` VALUES (11, 7, '删除角色', NULL, NULL, 1, 4, 'sys:role:remove', '_self', NULL, 0, 0, '2020-03-20 17:58:51', '2020-03-21 18:45:38');
INSERT INTO `sys_menu` VALUES (12, 1, '菜单管理', NULL, 'sys/menu', 0, 3, 'sys:menu:view', '_self', NULL, 0, 0, '2020-03-21 01:07:13', '2020-03-21 18:45:39');
INSERT INTO `sys_menu` VALUES (13, 12, '查询菜单', NULL, NULL, 1, 1, 'sys:menu:list', '_self', NULL, 0, 0, '2020-03-21 16:43:30', '2020-03-21 18:45:40');
INSERT INTO `sys_menu` VALUES (14, 12, '添加菜单', NULL, NULL, 1, 2, 'sys:menu:save', '_self', NULL, 0, 0, '2020-03-21 16:43:54', '2020-03-21 18:45:41');
INSERT INTO `sys_menu` VALUES (15, 12, '修改菜单', NULL, NULL, 1, 3, 'sys:menu:update', '_self', NULL, 0, 1, '2020-03-21 18:24:17', '2020-08-13 10:50:33');
INSERT INTO `sys_menu` VALUES (16, 12, '删除菜单', NULL, NULL, 1, 4, 'sys:menu:remove', '_self', NULL, 0, 1, '2020-03-21 18:24:18', '2020-08-13 10:50:31');
INSERT INTO `sys_menu` VALUES (17, 1, '机构管理', '', 'sys/organization', 0, 4, 'sys:org:view', '_self', NULL, 1, 1, '2020-03-21 18:24:20', '2020-08-13 10:49:56');
INSERT INTO `sys_menu` VALUES (18, 17, '查询机构', NULL, NULL, 1, 1, 'sys:org:list', '_self', NULL, 0, 1, '2020-03-21 18:24:21', '2020-08-13 10:49:53');
INSERT INTO `sys_menu` VALUES (19, 17, '添加机构', NULL, NULL, 1, 2, 'sys:org:save', '_self', NULL, 0, 1, '2020-03-21 18:24:22', '2020-08-13 10:49:49');
INSERT INTO `sys_menu` VALUES (20, 17, '修改机构', NULL, NULL, 1, 3, 'sys:org:update', '_self', NULL, 0, 1, '2020-03-21 18:24:24', '2020-08-13 10:49:45');
INSERT INTO `sys_menu` VALUES (21, 17, '删除机构', NULL, NULL, 1, 4, 'sys:org:remove', '_self', NULL, 0, 1, '2020-03-21 18:24:25', '2020-08-13 10:49:39');
INSERT INTO `sys_menu` VALUES (22, 1, '字典管理', NULL, 'sys/dict', 0, 5, 'sys:dict:view', '_self', NULL, 0, 1, '2020-03-21 18:24:26', '2020-08-13 10:49:33');
INSERT INTO `sys_menu` VALUES (23, 22, '查询字典', NULL, NULL, 1, 1, 'sys:dict:list', '_self', NULL, 0, 1, '2020-03-21 18:24:27', '2020-08-13 10:49:27');
INSERT INTO `sys_menu` VALUES (24, 22, '添加字典', NULL, NULL, 1, 2, 'sys:dict:save', '_self', NULL, 0, 1, '2020-03-21 18:24:28', '2020-08-13 10:49:24');
INSERT INTO `sys_menu` VALUES (25, 22, '修改字典', NULL, NULL, 1, 3, 'sys:dict:update', '_self', NULL, 0, 1, '2020-03-21 18:24:29', '2020-08-13 10:49:19');
INSERT INTO `sys_menu` VALUES (26, 22, '删除字典', NULL, NULL, 1, 4, 'sys:dict:remove', '_self', NULL, 0, 1, '2020-03-21 18:24:31', '2020-08-13 10:49:14');
INSERT INTO `sys_menu` VALUES (27, 0, '日志管理', 'layui-icon layui-icon-list', NULL, 0, 2, NULL, '_self', NULL, 0, 1, '2020-03-21 18:24:32', '2020-08-13 10:50:28');
INSERT INTO `sys_menu` VALUES (28, 27, '登录日志', NULL, 'sys/loginRecord', 0, 1, 'sys:login_record:view', '_self', NULL, 0, 1, '2020-03-21 18:24:33', '2020-08-13 10:50:26');
INSERT INTO `sys_menu` VALUES (29, 27, '操作日志', NULL, 'sys/operRecord', 0, 2, 'sys:oper_record:view', '_self', NULL, 0, 1, '2020-03-21 18:24:34', '2020-08-13 10:50:23');
INSERT INTO `sys_menu` VALUES (30, 27, '数据监控', NULL, 'druid', 0, 3, NULL, '_self', NULL, 0, 1, '2020-03-21 18:24:35', '2020-08-13 10:50:22');
INSERT INTO `sys_menu` VALUES (31, 0, '系统工具', 'layui-icon layui-icon-slider', NULL, 0, 3, NULL, '_self', NULL, 0, 1, '2020-03-21 18:24:36', '2020-08-13 10:50:19');
INSERT INTO `sys_menu` VALUES (32, 31, '文件管理', NULL, 'file/manage', 0, 1, 'sys:file:view', '_self', NULL, 0, 1, '2020-03-21 18:24:38', '2020-08-13 10:50:18');
INSERT INTO `sys_menu` VALUES (33, 32, '查询文件', NULL, NULL, 1, 1, 'sys:file:list', '_self', NULL, 0, 1, '2020-03-21 18:24:39', '2020-08-13 10:50:15');
INSERT INTO `sys_menu` VALUES (34, 32, '删除文件', NULL, NULL, 1, 2, 'sys:file:remove', '_self', NULL, 0, 1, '2020-03-21 18:24:40', '2020-08-13 10:50:13');
INSERT INTO `sys_menu` VALUES (35, 31, '发送邮件', NULL, 'sys/email', 0, 2, 'sys:email:view', '_self', NULL, 0, 1, '2020-03-21 18:24:41', '2020-08-13 10:50:11');
INSERT INTO `sys_menu` VALUES (36, 31, '项目生成', NULL, NULL, 0, 3, NULL, '_self', NULL, 0, 1, '2020-03-21 18:24:42', '2020-08-13 10:50:08');
INSERT INTO `sys_menu` VALUES (37, 12, '修改菜单', '', '', 1, 3, 'sys:menu:update', '_self', NULL, 0, 0, '2020-08-13 10:51:25', '2020-08-13 10:51:25');
INSERT INTO `sys_menu` VALUES (38, 12, '删除菜单', '', '', 1, 4, 'sys:menu:remove', '_self', NULL, 0, 0, '2020-08-13 10:52:06', '2020-08-13 10:52:06');
INSERT INTO `sys_menu` VALUES (39, 1, '课程管理', 'layui-icon layui-icon-app', 'course/course', 0, 2, '', '_self', NULL, 0, 1, '2020-08-13 10:55:33', '2020-08-13 10:56:37');
INSERT INTO `sys_menu` VALUES (40, 0, '课程管理', 'layui-icon layui-icon-app', '', 0, 2, '', '_self', NULL, 0, 0, '2020-08-13 10:56:28', '2020-08-13 10:56:28');
INSERT INTO `sys_menu` VALUES (41, 0, '教师管理', 'layui-icon layui-icon-username', '', 0, 3, '', '_self', NULL, 0, 0, '2020-08-13 11:00:59', '2020-08-13 11:00:59');
INSERT INTO `sys_menu` VALUES (42, 41, '教师管理', '', 'course/teacher', 0, 1, 'course:teacher:view', '_self', NULL, 0, 0, '2020-08-13 11:12:19', '2020-08-13 11:12:19');
INSERT INTO `sys_menu` VALUES (43, 42, '查询教师', '', '', 1, 1, 'course:teacher:list', '_self', NULL, 0, 1, '2020-08-13 11:13:41', '2020-08-13 11:19:38');
INSERT INTO `sys_menu` VALUES (44, 42, '添加教师', '', '', 1, 2, 'course:teacher:save', '_self', NULL, 0, 1, '2020-08-13 11:14:02', '2020-08-13 11:19:35');
INSERT INTO `sys_menu` VALUES (45, 42, '修改教师', '', '', 1, 3, 'course:teacher:update', '_self', NULL, 0, 1, '2020-08-13 11:14:20', '2020-08-13 11:19:33');
INSERT INTO `sys_menu` VALUES (46, 42, '删除教师', '', '', 1, 4, 'course:teacher:remove', '_self', NULL, 0, 1, '2020-08-13 11:14:36', '2020-08-13 11:19:31');
INSERT INTO `sys_menu` VALUES (47, 40, '课程管理', '', 'course/course', 0, 1, 'course:course:view', '_self', NULL, 0, 0, '2020-08-13 11:17:08', '2020-08-13 11:17:08');
INSERT INTO `sys_menu` VALUES (48, 40, '类别管理', '', 'course/classify', 0, 5, '', '_self', NULL, 0, 0, '2020-08-14 09:08:33', '2020-08-15 20:20:43');
INSERT INTO `sys_menu` VALUES (49, 40, '视频管理', '', 'course/video', 0, 6, '', '_self', NULL, 0, 0, '2020-08-14 17:48:26', '2020-08-15 20:20:50');
INSERT INTO `sys_menu` VALUES (50, 0, '导航菜单', 'layui-icon layui-icon-app', '', 0, 4, '', '_self', NULL, 0, 0, '2020-08-14 18:08:14', '2020-08-14 18:10:23');
INSERT INTO `sys_menu` VALUES (51, 50, '导航菜单', '', 'course/menu', 0, 1, '', '_self', NULL, 0, 0, '2020-08-14 18:08:40', '2020-08-14 18:08:40');
INSERT INTO `sys_menu` VALUES (52, 0, '轮播管理', 'layui-icon layui-icon-component', '', 0, 5, '', '_self', NULL, 0, 0, '2020-08-14 19:01:29', '2020-08-14 19:01:59');
INSERT INTO `sys_menu` VALUES (53, 52, '轮播管理', '', 'course/lunbo', 0, 1, '', '_self', NULL, 0, 0, '2020-08-14 19:01:54', '2020-08-14 19:01:54');
INSERT INTO `sys_menu` VALUES (54, 40, '公共课程管理', '', 'course/course/ggkc', 0, 2, '', '_self', NULL, 0, 0, '2020-08-15 20:18:16', '2020-08-15 20:18:16');
INSERT INTO `sys_menu` VALUES (55, 40, '专业课程管理', '', 'course/course/zykc', 0, 3, '', '_self', NULL, 0, 0, '2020-08-15 20:19:04', '2020-08-15 20:19:04');
INSERT INTO `sys_menu` VALUES (56, 40, '免费课程管理', '', 'course/course/mfkc', 0, 4, '', '_self', NULL, 0, 0, '2020-08-15 20:20:31', '2020-08-15 20:20:31');
INSERT INTO `sys_menu` VALUES (57, 0, '订单管理', 'layui-icon layui-icon-cart-simple', '', 0, 6, '', '_self', NULL, 0, 0, '2020-08-18 11:41:45', '2020-08-18 11:41:45');
INSERT INTO `sys_menu` VALUES (58, 57, '订单管理', '', 'course/order', 0, 1, '', '_self', NULL, 0, 0, '2020-08-18 11:42:30', '2020-08-18 11:42:30');
INSERT INTO `sys_menu` VALUES (59, 0, '通知管理', 'layui-icon layui-icon-speaker', '', 0, 7, '', '_self', NULL, 0, 0, '2020-08-18 13:25:14', '2020-08-18 13:25:14');
INSERT INTO `sys_menu` VALUES (60, 59, '通知管理', '', 'course/notice', 0, 1, '', '_self', NULL, 0, 0, '2020-08-18 13:25:40', '2020-08-18 13:25:40');
INSERT INTO `sys_menu` VALUES (61, 0, '礼品管理', 'layui-icon layui-icon-star', '', 0, 8, '', '_self', NULL, 0, 0, '2020-08-18 13:26:25', '2020-08-18 13:26:25');
INSERT INTO `sys_menu` VALUES (62, 61, '礼品管理', '', 'course/present', 0, 1, '', '_self', NULL, 0, 0, '2020-08-18 13:26:45', '2020-08-18 13:26:45');
INSERT INTO `sys_menu` VALUES (63, 40, '课程审核', '', 'course/release', 0, 6, '', '_self', NULL, 0, 0, '2020-08-19 20:36:36', '2020-08-19 20:36:36');

-- ----------------------------
-- Table structure for sys_oper_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_record`;
CREATE TABLE `sys_oper_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `model` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作模块',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作方法',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `request_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `oper_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用方法',
  `param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返回结果',
  `ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `comments` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `spend_time` int(11) NULL DEFAULT NULL COMMENT '请求耗时,单位毫秒',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '状态,0成功,1异常',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `sys_oper_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 206 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_record
-- ----------------------------
INSERT INTO `sys_oper_record` VALUES (1, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 91, 0, '2020-08-11 14:56:55', '2020-08-11 14:56:55');
INSERT INTO `sys_oper_record` VALUES (2, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 12, 0, '2020-08-11 14:56:56', '2020-08-11 14:56:56');
INSERT INTO `sys_oper_record` VALUES (3, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 15, 0, '2020-08-11 14:56:58', '2020-08-11 14:56:58');
INSERT INTO `sys_oper_record` VALUES (4, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.egao.common.system.controller.OrganizationController.list', '{}', NULL, '192.168.1.6', NULL, 17, 0, '2020-08-11 14:56:59', '2020-08-11 14:56:59');
INSERT INTO `sys_oper_record` VALUES (5, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.egao.common.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"organizationId\":[\"1\"]}', NULL, '192.168.1.6', NULL, 8, 0, '2020-08-11 14:56:59', '2020-08-11 14:56:59');
INSERT INTO `sys_oper_record` VALUES (6, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.egao.common.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 11, 0, '2020-08-11 14:57:00', '2020-08-11 14:57:00');
INSERT INTO `sys_oper_record` VALUES (7, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.egao.common.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictId\":[\"1\"]}', NULL, '192.168.1.6', NULL, 20, 0, '2020-08-11 14:57:00', '2020-08-11 14:57:00');
INSERT INTO `sys_oper_record` VALUES (8, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 28, 0, '2020-08-13 10:00:22', '2020-08-13 10:00:22');
INSERT INTO `sys_oper_record` VALUES (9, 1, '用户管理', '添加', '/sys/user/save', 'POST', 'com.egao.common.system.controller.UserController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 69, 0, '2020-08-13 10:01:26', '2020-08-13 10:01:26');
INSERT INTO `sys_oper_record` VALUES (10, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 34, 0, '2020-08-13 10:01:26', '2020-08-13 10:01:26');
INSERT INTO `sys_oper_record` VALUES (11, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 20, 0, '2020-08-13 10:48:45', '2020-08-13 10:48:45');
INSERT INTO `sys_oper_record` VALUES (12, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.1.6', NULL, 32, 0, '2020-08-13 10:48:58', '2020-08-13 10:48:58');
INSERT INTO `sys_oper_record` VALUES (13, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 21, 0, '2020-08-13 10:48:58', '2020-08-13 10:48:58');
INSERT INTO `sys_oper_record` VALUES (14, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"26\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 15, 0, '2020-08-13 10:49:14', '2020-08-13 10:49:14');
INSERT INTO `sys_oper_record` VALUES (15, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 14, 0, '2020-08-13 10:49:14', '2020-08-13 10:49:14');
INSERT INTO `sys_oper_record` VALUES (16, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"25\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 16, 0, '2020-08-13 10:49:19', '2020-08-13 10:49:19');
INSERT INTO `sys_oper_record` VALUES (17, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 9, 0, '2020-08-13 10:49:19', '2020-08-13 10:49:19');
INSERT INTO `sys_oper_record` VALUES (18, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"24\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 17, 0, '2020-08-13 10:49:24', '2020-08-13 10:49:24');
INSERT INTO `sys_oper_record` VALUES (19, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 17, 0, '2020-08-13 10:49:24', '2020-08-13 10:49:24');
INSERT INTO `sys_oper_record` VALUES (20, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"23\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 13, 0, '2020-08-13 10:49:27', '2020-08-13 10:49:27');
INSERT INTO `sys_oper_record` VALUES (21, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 9, 0, '2020-08-13 10:49:27', '2020-08-13 10:49:27');
INSERT INTO `sys_oper_record` VALUES (22, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"22\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 18, 0, '2020-08-13 10:49:33', '2020-08-13 10:49:33');
INSERT INTO `sys_oper_record` VALUES (23, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 16, 0, '2020-08-13 10:49:33', '2020-08-13 10:49:33');
INSERT INTO `sys_oper_record` VALUES (24, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"21\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 15, 0, '2020-08-13 10:49:39', '2020-08-13 10:49:39');
INSERT INTO `sys_oper_record` VALUES (25, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 10, 0, '2020-08-13 10:49:39', '2020-08-13 10:49:39');
INSERT INTO `sys_oper_record` VALUES (26, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"20\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 12, 0, '2020-08-13 10:49:45', '2020-08-13 10:49:45');
INSERT INTO `sys_oper_record` VALUES (27, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 10, 0, '2020-08-13 10:49:45', '2020-08-13 10:49:45');
INSERT INTO `sys_oper_record` VALUES (28, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"19\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 12, 0, '2020-08-13 10:49:49', '2020-08-13 10:49:49');
INSERT INTO `sys_oper_record` VALUES (29, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 11, 0, '2020-08-13 10:49:49', '2020-08-13 10:49:49');
INSERT INTO `sys_oper_record` VALUES (30, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"18\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 13, 0, '2020-08-13 10:49:53', '2020-08-13 10:49:53');
INSERT INTO `sys_oper_record` VALUES (31, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 10, 0, '2020-08-13 10:49:53', '2020-08-13 10:49:53');
INSERT INTO `sys_oper_record` VALUES (32, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"17\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 12, 0, '2020-08-13 10:49:56', '2020-08-13 10:49:56');
INSERT INTO `sys_oper_record` VALUES (33, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 9, 0, '2020-08-13 10:49:56', '2020-08-13 10:49:56');
INSERT INTO `sys_oper_record` VALUES (34, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"36\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 14, 0, '2020-08-13 10:50:08', '2020-08-13 10:50:08');
INSERT INTO `sys_oper_record` VALUES (35, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 8, 0, '2020-08-13 10:50:08', '2020-08-13 10:50:08');
INSERT INTO `sys_oper_record` VALUES (36, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"35\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 15, 0, '2020-08-13 10:50:11', '2020-08-13 10:50:11');
INSERT INTO `sys_oper_record` VALUES (37, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 9, 0, '2020-08-13 10:50:11', '2020-08-13 10:50:11');
INSERT INTO `sys_oper_record` VALUES (38, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"34\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 10, 0, '2020-08-13 10:50:13', '2020-08-13 10:50:13');
INSERT INTO `sys_oper_record` VALUES (39, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 10, 0, '2020-08-13 10:50:13', '2020-08-13 10:50:13');
INSERT INTO `sys_oper_record` VALUES (40, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"33\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 9, 0, '2020-08-13 10:50:15', '2020-08-13 10:50:15');
INSERT INTO `sys_oper_record` VALUES (41, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 9, 0, '2020-08-13 10:50:15', '2020-08-13 10:50:15');
INSERT INTO `sys_oper_record` VALUES (42, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"32\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 10, 0, '2020-08-13 10:50:18', '2020-08-13 10:50:18');
INSERT INTO `sys_oper_record` VALUES (43, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-13 10:50:18', '2020-08-13 10:50:18');
INSERT INTO `sys_oper_record` VALUES (44, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"31\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 9, 0, '2020-08-13 10:50:19', '2020-08-13 10:50:19');
INSERT INTO `sys_oper_record` VALUES (45, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-13 10:50:19', '2020-08-13 10:50:19');
INSERT INTO `sys_oper_record` VALUES (46, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"30\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 11, 0, '2020-08-13 10:50:22', '2020-08-13 10:50:22');
INSERT INTO `sys_oper_record` VALUES (47, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 9, 0, '2020-08-13 10:50:22', '2020-08-13 10:50:22');
INSERT INTO `sys_oper_record` VALUES (48, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"29\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 12, 0, '2020-08-13 10:50:23', '2020-08-13 10:50:23');
INSERT INTO `sys_oper_record` VALUES (49, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-13 10:50:23', '2020-08-13 10:50:23');
INSERT INTO `sys_oper_record` VALUES (50, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"28\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 12, 0, '2020-08-13 10:50:26', '2020-08-13 10:50:26');
INSERT INTO `sys_oper_record` VALUES (51, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 8, 0, '2020-08-13 10:50:26', '2020-08-13 10:50:26');
INSERT INTO `sys_oper_record` VALUES (52, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"27\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 11, 0, '2020-08-13 10:50:28', '2020-08-13 10:50:28');
INSERT INTO `sys_oper_record` VALUES (53, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-13 10:50:28', '2020-08-13 10:50:28');
INSERT INTO `sys_oper_record` VALUES (54, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"16\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 13, 0, '2020-08-13 10:50:31', '2020-08-13 10:50:31');
INSERT INTO `sys_oper_record` VALUES (55, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 8, 0, '2020-08-13 10:50:31', '2020-08-13 10:50:31');
INSERT INTO `sys_oper_record` VALUES (56, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"15\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 10, 0, '2020-08-13 10:50:33', '2020-08-13 10:50:33');
INSERT INTO `sys_oper_record` VALUES (57, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 9, 0, '2020-08-13 10:50:33', '2020-08-13 10:50:33');
INSERT INTO `sys_oper_record` VALUES (58, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 28, 0, '2020-08-13 10:51:25', '2020-08-13 10:51:25');
INSERT INTO `sys_oper_record` VALUES (59, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-13 10:51:25', '2020-08-13 10:51:25');
INSERT INTO `sys_oper_record` VALUES (60, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 11, 0, '2020-08-13 10:52:06', '2020-08-13 10:52:06');
INSERT INTO `sys_oper_record` VALUES (61, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-13 10:52:06', '2020-08-13 10:52:06');
INSERT INTO `sys_oper_record` VALUES (62, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 96, 0, '2020-08-13 10:52:13', '2020-08-13 10:52:13');
INSERT INTO `sys_oper_record` VALUES (63, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 12, 0, '2020-08-13 10:52:13', '2020-08-13 10:52:13');
INSERT INTO `sys_oper_record` VALUES (64, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.1.6', NULL, 24, 0, '2020-08-13 10:52:15', '2020-08-13 10:52:15');
INSERT INTO `sys_oper_record` VALUES (65, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.1.6', NULL, 46, 0, '2020-08-13 10:52:21', '2020-08-13 10:52:21');
INSERT INTO `sys_oper_record` VALUES (66, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-13 10:52:45', '2020-08-13 10:52:45');
INSERT INTO `sys_oper_record` VALUES (67, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 11, 0, '2020-08-13 10:55:33', '2020-08-13 10:55:33');
INSERT INTO `sys_oper_record` VALUES (68, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 10, 0, '2020-08-13 10:55:33', '2020-08-13 10:55:33');
INSERT INTO `sys_oper_record` VALUES (69, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.1.6', NULL, 15, 0, '2020-08-13 10:55:56', '2020-08-13 10:55:56');
INSERT INTO `sys_oper_record` VALUES (70, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-13 10:55:56', '2020-08-13 10:55:56');
INSERT INTO `sys_oper_record` VALUES (71, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 13, 0, '2020-08-13 10:56:28', '2020-08-13 10:56:28');
INSERT INTO `sys_oper_record` VALUES (72, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-13 10:56:28', '2020-08-13 10:56:28');
INSERT INTO `sys_oper_record` VALUES (73, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"39\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 13, 0, '2020-08-13 10:56:37', '2020-08-13 10:56:37');
INSERT INTO `sys_oper_record` VALUES (74, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 6, 0, '2020-08-13 10:56:37', '2020-08-13 10:56:37');
INSERT INTO `sys_oper_record` VALUES (75, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 13, 0, '2020-08-13 11:00:59', '2020-08-13 11:00:59');
INSERT INTO `sys_oper_record` VALUES (76, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-13 11:00:59', '2020-08-13 11:00:59');
INSERT INTO `sys_oper_record` VALUES (77, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 8, 0, '2020-08-13 11:01:09', '2020-08-13 11:01:09');
INSERT INTO `sys_oper_record` VALUES (78, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.1.6', NULL, 11, 0, '2020-08-13 11:01:11', '2020-08-13 11:01:11');
INSERT INTO `sys_oper_record` VALUES (79, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 26, 0, '2020-08-13 11:12:19', '2020-08-13 11:12:19');
INSERT INTO `sys_oper_record` VALUES (80, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 15, 0, '2020-08-13 11:12:19', '2020-08-13 11:12:19');
INSERT INTO `sys_oper_record` VALUES (81, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 14, 0, '2020-08-13 11:13:41', '2020-08-13 11:13:41');
INSERT INTO `sys_oper_record` VALUES (82, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-13 11:13:41', '2020-08-13 11:13:41');
INSERT INTO `sys_oper_record` VALUES (83, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 14, 0, '2020-08-13 11:14:02', '2020-08-13 11:14:02');
INSERT INTO `sys_oper_record` VALUES (84, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-13 11:14:02', '2020-08-13 11:14:02');
INSERT INTO `sys_oper_record` VALUES (85, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 10, 0, '2020-08-13 11:14:20', '2020-08-13 11:14:20');
INSERT INTO `sys_oper_record` VALUES (86, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 8, 0, '2020-08-13 11:14:20', '2020-08-13 11:14:20');
INSERT INTO `sys_oper_record` VALUES (87, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 15, 0, '2020-08-13 11:14:36', '2020-08-13 11:14:36');
INSERT INTO `sys_oper_record` VALUES (88, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 10, 0, '2020-08-13 11:14:36', '2020-08-13 11:14:36');
INSERT INTO `sys_oper_record` VALUES (89, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 17, 0, '2020-08-13 11:17:08', '2020-08-13 11:17:08');
INSERT INTO `sys_oper_record` VALUES (90, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 5, 0, '2020-08-13 11:17:08', '2020-08-13 11:17:08');
INSERT INTO `sys_oper_record` VALUES (91, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"46\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 29, 0, '2020-08-13 11:19:31', '2020-08-13 11:19:31');
INSERT INTO `sys_oper_record` VALUES (92, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 13, 0, '2020-08-13 11:19:31', '2020-08-13 11:19:31');
INSERT INTO `sys_oper_record` VALUES (93, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"45\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 11, 0, '2020-08-13 11:19:33', '2020-08-13 11:19:33');
INSERT INTO `sys_oper_record` VALUES (94, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 6, 0, '2020-08-13 11:19:33', '2020-08-13 11:19:33');
INSERT INTO `sys_oper_record` VALUES (95, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"44\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 9, 0, '2020-08-13 11:19:35', '2020-08-13 11:19:35');
INSERT INTO `sys_oper_record` VALUES (96, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 8, 0, '2020-08-13 11:19:35', '2020-08-13 11:19:35');
INSERT INTO `sys_oper_record` VALUES (97, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.egao.common.system.controller.MenuController.remove', '{\"id\":[\"43\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 10, 0, '2020-08-13 11:19:38', '2020-08-13 11:19:38');
INSERT INTO `sys_oper_record` VALUES (98, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 9, 0, '2020-08-13 11:19:38', '2020-08-13 11:19:38');
INSERT INTO `sys_oper_record` VALUES (99, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.1.6', NULL, 21, 0, '2020-08-13 11:19:46', '2020-08-13 11:19:46');
INSERT INTO `sys_oper_record` VALUES (100, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.1.6', NULL, 27, 0, '2020-08-13 11:19:50', '2020-08-13 11:19:50');
INSERT INTO `sys_oper_record` VALUES (101, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 40, 0, '2020-08-14 09:02:10', '2020-08-14 09:02:10');
INSERT INTO `sys_oper_record` VALUES (102, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-14 09:02:10', '2020-08-14 09:02:10');
INSERT INTO `sys_oper_record` VALUES (103, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 15, 0, '2020-08-14 09:02:11', '2020-08-14 09:02:11');
INSERT INTO `sys_oper_record` VALUES (104, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 18, 0, '2020-08-14 09:08:33', '2020-08-14 09:08:33');
INSERT INTO `sys_oper_record` VALUES (105, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 17, 0, '2020-08-14 09:08:33', '2020-08-14 09:08:33');
INSERT INTO `sys_oper_record` VALUES (106, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.1.6', NULL, 33, 0, '2020-08-14 09:08:43', '2020-08-14 09:08:43');
INSERT INTO `sys_oper_record` VALUES (107, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.1.6', NULL, 36, 0, '2020-08-14 09:08:45', '2020-08-14 09:08:45');
INSERT INTO `sys_oper_record` VALUES (108, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 28, 0, '2020-08-14 17:47:56', '2020-08-14 17:47:56');
INSERT INTO `sys_oper_record` VALUES (109, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 16, 0, '2020-08-14 17:48:26', '2020-08-14 17:48:26');
INSERT INTO `sys_oper_record` VALUES (110, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 19, 0, '2020-08-14 17:48:26', '2020-08-14 17:48:26');
INSERT INTO `sys_oper_record` VALUES (111, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 13, 0, '2020-08-14 17:56:58', '2020-08-14 17:56:58');
INSERT INTO `sys_oper_record` VALUES (112, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 28, 0, '2020-08-14 17:56:59', '2020-08-14 17:56:59');
INSERT INTO `sys_oper_record` VALUES (113, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.1.6', NULL, 26, 0, '2020-08-14 17:57:01', '2020-08-14 17:57:01');
INSERT INTO `sys_oper_record` VALUES (114, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.1.6', NULL, 66, 0, '2020-08-14 17:57:03', '2020-08-14 17:57:03');
INSERT INTO `sys_oper_record` VALUES (115, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-14 18:07:38', '2020-08-14 18:07:38');
INSERT INTO `sys_oper_record` VALUES (116, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 21, 0, '2020-08-14 18:08:14', '2020-08-14 18:08:14');
INSERT INTO `sys_oper_record` VALUES (117, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 9, 0, '2020-08-14 18:08:14', '2020-08-14 18:08:14');
INSERT INTO `sys_oper_record` VALUES (118, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 12, 0, '2020-08-14 18:08:40', '2020-08-14 18:08:40');
INSERT INTO `sys_oper_record` VALUES (119, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-14 18:08:40', '2020-08-14 18:08:40');
INSERT INTO `sys_oper_record` VALUES (120, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.1.6', NULL, 30, 0, '2020-08-14 18:08:54', '2020-08-14 18:08:54');
INSERT INTO `sys_oper_record` VALUES (121, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 6, 0, '2020-08-14 18:08:54', '2020-08-14 18:08:54');
INSERT INTO `sys_oper_record` VALUES (122, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 12, 0, '2020-08-14 18:08:56', '2020-08-14 18:08:56');
INSERT INTO `sys_oper_record` VALUES (123, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.1.6', NULL, 13, 0, '2020-08-14 18:08:57', '2020-08-14 18:08:57');
INSERT INTO `sys_oper_record` VALUES (124, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.1.6', NULL, 27, 0, '2020-08-14 18:08:59', '2020-08-14 18:08:59');
INSERT INTO `sys_oper_record` VALUES (125, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 71, 0, '2020-08-14 18:10:12', '2020-08-14 18:10:12');
INSERT INTO `sys_oper_record` VALUES (126, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 6, 0, '2020-08-14 18:10:13', '2020-08-14 18:10:13');
INSERT INTO `sys_oper_record` VALUES (127, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.1.6', NULL, 14, 0, '2020-08-14 18:10:23', '2020-08-14 18:10:23');
INSERT INTO `sys_oper_record` VALUES (128, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 8, 0, '2020-08-14 18:10:23', '2020-08-14 18:10:23');
INSERT INTO `sys_oper_record` VALUES (129, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 10, 0, '2020-08-14 18:10:26', '2020-08-14 18:10:26');
INSERT INTO `sys_oper_record` VALUES (130, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 10, 0, '2020-08-14 19:00:11', '2020-08-14 19:00:11');
INSERT INTO `sys_oper_record` VALUES (131, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 23, 0, '2020-08-14 19:01:29', '2020-08-14 19:01:29');
INSERT INTO `sys_oper_record` VALUES (132, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 11, 0, '2020-08-14 19:01:29', '2020-08-14 19:01:29');
INSERT INTO `sys_oper_record` VALUES (133, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 17, 0, '2020-08-14 19:01:31', '2020-08-14 19:01:31');
INSERT INTO `sys_oper_record` VALUES (134, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 13, 0, '2020-08-14 19:01:54', '2020-08-14 19:01:54');
INSERT INTO `sys_oper_record` VALUES (135, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 36, 0, '2020-08-14 19:01:54', '2020-08-14 19:01:54');
INSERT INTO `sys_oper_record` VALUES (136, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.1.6', NULL, 26, 0, '2020-08-14 19:01:59', '2020-08-14 19:01:59');
INSERT INTO `sys_oper_record` VALUES (137, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 10, 0, '2020-08-14 19:01:59', '2020-08-14 19:01:59');
INSERT INTO `sys_oper_record` VALUES (138, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.1.6', NULL, 32, 0, '2020-08-14 19:02:02', '2020-08-14 19:02:02');
INSERT INTO `sys_oper_record` VALUES (139, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.1.6', NULL, 33, 0, '2020-08-14 19:02:05', '2020-08-14 19:02:05');
INSERT INTO `sys_oper_record` VALUES (140, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 45, 0, '2020-08-15 10:16:15', '2020-08-15 10:16:15');
INSERT INTO `sys_oper_record` VALUES (141, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 10, 0, '2020-08-15 10:16:16', '2020-08-15 10:16:16');
INSERT INTO `sys_oper_record` VALUES (142, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 12, 0, '2020-08-15 20:16:25', '2020-08-15 20:16:25');
INSERT INTO `sys_oper_record` VALUES (143, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 30, 0, '2020-08-15 20:18:16', '2020-08-15 20:18:16');
INSERT INTO `sys_oper_record` VALUES (144, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 6, 0, '2020-08-15 20:18:16', '2020-08-15 20:18:16');
INSERT INTO `sys_oper_record` VALUES (145, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 17, 0, '2020-08-15 20:19:04', '2020-08-15 20:19:04');
INSERT INTO `sys_oper_record` VALUES (146, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 10, 0, '2020-08-15 20:19:04', '2020-08-15 20:19:04');
INSERT INTO `sys_oper_record` VALUES (147, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 42, 0, '2020-08-15 20:20:31', '2020-08-15 20:20:31');
INSERT INTO `sys_oper_record` VALUES (148, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 31, 0, '2020-08-15 20:20:31', '2020-08-15 20:20:31');
INSERT INTO `sys_oper_record` VALUES (149, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.1.6', NULL, 29, 0, '2020-08-15 20:20:43', '2020-08-15 20:20:43');
INSERT INTO `sys_oper_record` VALUES (150, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 11, 0, '2020-08-15 20:20:43', '2020-08-15 20:20:43');
INSERT INTO `sys_oper_record` VALUES (151, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.egao.common.system.controller.MenuController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.1.6', NULL, 17, 0, '2020-08-15 20:20:50', '2020-08-15 20:20:50');
INSERT INTO `sys_oper_record` VALUES (152, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 9, 0, '2020-08-15 20:20:50', '2020-08-15 20:20:50');
INSERT INTO `sys_oper_record` VALUES (153, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 29, 0, '2020-08-15 20:20:55', '2020-08-15 20:20:55');
INSERT INTO `sys_oper_record` VALUES (154, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.1.6', NULL, 31, 0, '2020-08-15 20:20:58', '2020-08-15 20:20:58');
INSERT INTO `sys_oper_record` VALUES (155, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.1.6', NULL, 75, 0, '2020-08-15 20:21:04', '2020-08-15 20:21:04');
INSERT INTO `sys_oper_record` VALUES (156, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 17, 0, '2020-08-18 11:40:42', '2020-08-18 11:40:42');
INSERT INTO `sys_oper_record` VALUES (157, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 55, 0, '2020-08-18 11:41:45', '2020-08-18 11:41:45');
INSERT INTO `sys_oper_record` VALUES (158, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 18, 0, '2020-08-18 11:41:45', '2020-08-18 11:41:45');
INSERT INTO `sys_oper_record` VALUES (159, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 15, 0, '2020-08-18 11:42:30', '2020-08-18 11:42:30');
INSERT INTO `sys_oper_record` VALUES (160, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 9, 0, '2020-08-18 11:42:30', '2020-08-18 11:42:30');
INSERT INTO `sys_oper_record` VALUES (161, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 19, 0, '2020-08-18 11:42:35', '2020-08-18 11:42:35');
INSERT INTO `sys_oper_record` VALUES (162, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.1.6', NULL, 22, 0, '2020-08-18 11:42:37', '2020-08-18 11:42:37');
INSERT INTO `sys_oper_record` VALUES (163, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.1.6', NULL, 51, 0, '2020-08-18 11:42:40', '2020-08-18 11:42:40');
INSERT INTO `sys_oper_record` VALUES (164, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 9, 0, '2020-08-18 13:24:28', '2020-08-18 13:24:28');
INSERT INTO `sys_oper_record` VALUES (165, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 16, 0, '2020-08-18 13:25:14', '2020-08-18 13:25:14');
INSERT INTO `sys_oper_record` VALUES (166, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 15, 0, '2020-08-18 13:25:14', '2020-08-18 13:25:14');
INSERT INTO `sys_oper_record` VALUES (167, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 11, 0, '2020-08-18 13:25:40', '2020-08-18 13:25:40');
INSERT INTO `sys_oper_record` VALUES (168, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 6, 0, '2020-08-18 13:25:40', '2020-08-18 13:25:40');
INSERT INTO `sys_oper_record` VALUES (169, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 15, 0, '2020-08-18 13:26:25', '2020-08-18 13:26:25');
INSERT INTO `sys_oper_record` VALUES (170, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 5, 0, '2020-08-18 13:26:25', '2020-08-18 13:26:25');
INSERT INTO `sys_oper_record` VALUES (171, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 11, 0, '2020-08-18 13:26:45', '2020-08-18 13:26:45');
INSERT INTO `sys_oper_record` VALUES (172, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 8, 0, '2020-08-18 13:26:45', '2020-08-18 13:26:45');
INSERT INTO `sys_oper_record` VALUES (173, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 19, 0, '2020-08-18 13:26:47', '2020-08-18 13:26:47');
INSERT INTO `sys_oper_record` VALUES (174, 1, '角色管理', '删除', '/sys/role/remove', 'GET', 'com.egao.common.system.controller.RoleController.remove', '{\"id\":[\"3\"]}', '{\"msg\":\"删除成功\",\"code\":0}', '192.168.1.6', NULL, 18, 0, '2020-08-18 13:26:51', '2020-08-18 13:26:51');
INSERT INTO `sys_oper_record` VALUES (175, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 9, 0, '2020-08-18 13:26:51', '2020-08-18 13:26:51');
INSERT INTO `sys_oper_record` VALUES (176, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.1.6', NULL, 23, 0, '2020-08-18 13:26:53', '2020-08-18 13:26:53');
INSERT INTO `sys_oper_record` VALUES (177, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.1.6', NULL, 29, 0, '2020-08-18 13:26:57', '2020-08-18 13:26:57');
INSERT INTO `sys_oper_record` VALUES (178, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 63, 0, '2020-08-18 19:27:04', '2020-08-18 19:27:04');
INSERT INTO `sys_oper_record` VALUES (179, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 12, 0, '2020-08-18 19:27:12', '2020-08-18 19:27:12');
INSERT INTO `sys_oper_record` VALUES (180, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 7, 0, '2020-08-18 19:27:15', '2020-08-18 19:27:15');
INSERT INTO `sys_oper_record` VALUES (181, 1, '角色管理', '修改', '/sys/role/update', 'POST', 'com.egao.common.system.controller.RoleController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.1.6', NULL, 39, 0, '2020-08-18 19:27:35', '2020-08-18 19:27:35');
INSERT INTO `sys_oper_record` VALUES (182, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 6, 0, '2020-08-18 19:27:35', '2020-08-18 19:27:35');
INSERT INTO `sys_oper_record` VALUES (183, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 23, 0, '2020-08-18 19:27:55', '2020-08-18 19:27:55');
INSERT INTO `sys_oper_record` VALUES (184, 1, '用户管理', '修改', '/sys/user/update', 'POST', 'com.egao.common.system.controller.UserController.update', NULL, '{\"msg\":\"修改成功\",\"code\":0}', '192.168.1.6', NULL, 36, 0, '2020-08-18 19:28:02', '2020-08-18 19:28:02');
INSERT INTO `sys_oper_record` VALUES (185, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 32, 0, '2020-08-18 19:28:02', '2020-08-18 19:28:02');
INSERT INTO `sys_oper_record` VALUES (186, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 8, 0, '2020-08-18 19:28:03', '2020-08-18 19:28:03');
INSERT INTO `sys_oper_record` VALUES (187, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"2\"]}', NULL, '192.168.1.6', NULL, 26, 0, '2020-08-18 19:28:07', '2020-08-18 19:28:07');
INSERT INTO `sys_oper_record` VALUES (188, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/2', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.1.6', NULL, 12, 0, '2020-08-18 19:28:18', '2020-08-18 19:28:18');
INSERT INTO `sys_oper_record` VALUES (189, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 20, 0, '2020-08-19 09:33:54', '2020-08-19 09:33:54');
INSERT INTO `sys_oper_record` VALUES (190, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 30, 0, '2020-08-19 10:01:01', '2020-08-19 10:01:01');
INSERT INTO `sys_oper_record` VALUES (191, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 46, 0, '2020-08-19 12:21:18', '2020-08-19 12:21:18');
INSERT INTO `sys_oper_record` VALUES (192, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 11, 0, '2020-08-19 12:21:29', '2020-08-19 12:21:29');
INSERT INTO `sys_oper_record` VALUES (193, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 10, 0, '2020-08-19 12:21:33', '2020-08-19 12:21:33');
INSERT INTO `sys_oper_record` VALUES (194, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 23, 0, '2020-08-19 13:34:58', '2020-08-19 13:34:58');
INSERT INTO `sys_oper_record` VALUES (195, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 38, 0, '2020-08-19 13:35:58', '2020-08-19 13:35:58');
INSERT INTO `sys_oper_record` VALUES (196, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 38, 0, '2020-08-19 20:35:51', '2020-08-19 20:35:51');
INSERT INTO `sys_oper_record` VALUES (197, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.egao.common.system.controller.MenuController.save', NULL, '{\"msg\":\"添加成功\",\"code\":0}', '192.168.1.6', NULL, 26, 0, '2020-08-19 20:36:36', '2020-08-19 20:36:36');
INSERT INTO `sys_oper_record` VALUES (198, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.egao.common.system.controller.MenuController.list', '{}', NULL, '192.168.1.6', NULL, 15, 0, '2020-08-19 20:36:36', '2020-08-19 20:36:36');
INSERT INTO `sys_oper_record` VALUES (199, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 31, 0, '2020-08-19 20:36:38', '2020-08-19 20:36:38');
INSERT INTO `sys_oper_record` VALUES (200, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.1.6', NULL, 85, 0, '2020-08-19 20:36:41', '2020-08-19 20:36:41');
INSERT INTO `sys_oper_record` VALUES (201, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.egao.common.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.1.6', NULL, 289, 0, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_oper_record` VALUES (202, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.egao.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 117, 0, '2020-08-19 22:50:31', '2020-08-19 22:50:31');
INSERT INTO `sys_oper_record` VALUES (203, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.egao.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.1.6', NULL, 14, 0, '2020-08-19 22:50:43', '2020-08-19 22:50:43');
INSERT INTO `sys_oper_record` VALUES (204, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"2\"]}', NULL, '192.168.1.6', NULL, 37, 0, '2020-08-19 22:50:45', '2020-08-19 22:50:45');
INSERT INTO `sys_oper_record` VALUES (205, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.egao.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.1.6', NULL, 15, 0, '2020-08-19 22:50:50', '2020-08-19 22:50:50');

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization`  (
  `organization_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '机构id',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级id,0是顶级',
  `organization_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构名称',
  `organization_full_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构全称',
  `organization_type` int(11) NOT NULL COMMENT '机构类型',
  `leader_id` int(11) NULL DEFAULT NULL COMMENT '负责人id',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`organization_id`) USING BTREE,
  INDEX `leader_id`(`leader_id`) USING BTREE,
  CONSTRAINT `sys_organization_ibfk_1` FOREIGN KEY (`leader_id`) REFERENCES `sys_user` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织机构' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES (1, 0, 'XXX公司', 'XXXXXXXXX科技有限公司', 3, NULL, 1, '', 0, '2020-03-15 13:14:55', '2020-03-21 15:12:49');
INSERT INTO `sys_organization` VALUES (2, 1, '研发部', '研发部', 5, NULL, 2, '', 0, '2020-03-15 13:15:16', '2020-03-16 00:43:09');
INSERT INTO `sys_organization` VALUES (3, 2, '高教组', '高等教育行业项目组', 6, NULL, 3, '', 0, '2020-03-15 13:15:45', '2020-03-16 00:42:49');
INSERT INTO `sys_organization` VALUES (4, 2, '政务组', '政务行业项目组', 6, NULL, 4, '', 0, '2020-03-15 13:16:15', '2020-03-16 00:42:54');
INSERT INTO `sys_organization` VALUES (5, 2, '制造组', '生产制造行业项目组', 6, NULL, 5, '', 0, '2020-03-15 13:16:37', '2020-03-21 15:13:05');
INSERT INTO `sys_organization` VALUES (6, 2, '仿真组', '虚拟仿真行业项目组', 6, NULL, 6, '', 0, '2020-03-15 13:16:57', '2020-03-16 00:43:03');
INSERT INTO `sys_organization` VALUES (7, 1, '测试部', '测试部', 5, NULL, 6, '', 0, '2020-03-15 13:17:19', '2020-03-16 00:43:14');
INSERT INTO `sys_organization` VALUES (8, 1, '设计部', 'UI设计部门', 5, NULL, 7, '', 0, '2020-03-15 13:17:56', '2020-03-16 00:43:18');
INSERT INTO `sys_organization` VALUES (9, 1, '市场部', '市场部', 5, NULL, 8, '', 0, '2020-03-15 13:18:15', '2020-03-16 00:43:23');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', '管理员', 0, '2020-02-26 15:18:37', '2020-03-21 15:15:54');
INSERT INTO `sys_role` VALUES (2, '教师', 'teacher', '教师', 0, '2020-02-26 15:18:52', '2020-08-18 19:27:35');
INSERT INTO `sys_role` VALUES (3, '游客', 'guest', '游客', 1, '2020-02-26 15:19:49', '2020-08-18 13:26:51');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sys_role_permission_role`(`role_id`) USING BTREE,
  INDEX `menu_id`(`menu_id`) USING BTREE,
  CONSTRAINT `sys_role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 306 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (261, 2, 40, '2020-08-18 19:28:18', '2020-08-18 19:28:18');
INSERT INTO `sys_role_menu` VALUES (262, 2, 47, '2020-08-18 19:28:18', '2020-08-18 19:28:18');
INSERT INTO `sys_role_menu` VALUES (263, 2, 54, '2020-08-18 19:28:18', '2020-08-18 19:28:18');
INSERT INTO `sys_role_menu` VALUES (264, 2, 55, '2020-08-18 19:28:18', '2020-08-18 19:28:18');
INSERT INTO `sys_role_menu` VALUES (265, 2, 56, '2020-08-18 19:28:18', '2020-08-18 19:28:18');
INSERT INTO `sys_role_menu` VALUES (266, 2, 48, '2020-08-18 19:28:18', '2020-08-18 19:28:18');
INSERT INTO `sys_role_menu` VALUES (267, 2, 49, '2020-08-18 19:28:18', '2020-08-18 19:28:18');
INSERT INTO `sys_role_menu` VALUES (268, 2, 59, '2020-08-18 19:28:18', '2020-08-18 19:28:18');
INSERT INTO `sys_role_menu` VALUES (269, 2, 60, '2020-08-18 19:28:18', '2020-08-18 19:28:18');
INSERT INTO `sys_role_menu` VALUES (270, 1, 1, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (271, 1, 2, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (272, 1, 3, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (273, 1, 4, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (274, 1, 5, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (275, 1, 6, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (276, 1, 7, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (277, 1, 8, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (278, 1, 9, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (279, 1, 10, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (280, 1, 11, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (281, 1, 12, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (282, 1, 13, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (283, 1, 14, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (284, 1, 37, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (285, 1, 38, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (286, 1, 40, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (287, 1, 47, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (288, 1, 54, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (289, 1, 55, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (290, 1, 56, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (291, 1, 48, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (292, 1, 49, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (293, 1, 63, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (294, 1, 41, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (295, 1, 42, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (296, 1, 50, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (297, 1, 51, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (298, 1, 52, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (299, 1, 53, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (300, 1, 57, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (301, 1, 58, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (302, 1, 59, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (303, 1, 60, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (304, 1, 61, '2020-08-19 20:36:46', '2020-08-19 20:36:46');
INSERT INTO `sys_role_menu` VALUES (305, 1, 62, '2020-08-19 20:36:46', '2020-08-19 20:36:46');

-- ----------------------------
-- Table structure for sys_two_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_two_user`;
CREATE TABLE `sys_two_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `nick_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `email_verified` int(1) NOT NULL DEFAULT 0 COMMENT '邮箱是否验证,0否,1是',
  `true_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `introduction` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `present` int(11) NULL DEFAULT NULL COMMENT '积分',
  `state` int(1) NOT NULL DEFAULT 0 COMMENT '状态,0正常,1冻结',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_two_user
-- ----------------------------
INSERT INTO `sys_two_user` VALUES (1, 'student_01', '670b14728ad9902aecba32e22fa4f6bd', '学生_01', NULL, 1, '15535353535', NULL, 0, NULL, NULL, NULL, '学生_01学生_01学生_01学生_01', 800, 0, 0, '2020-08-13 10:01:26', '2020-08-19 22:38:08');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `nick_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `email_verified` int(1) NOT NULL DEFAULT 0 COMMENT '邮箱是否验证,0否,1是',
  `true_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `introduction` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `organization_id` int(11) NULL DEFAULT NULL COMMENT '机构id',
  `state` int(1) NOT NULL DEFAULT 0 COMMENT '状态,0正常,1冻结',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `organization_id`(`organization_id`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `sys_organization` (`organization_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '管理员', NULL, 1, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, '2020-01-13 14:43:52', '2020-03-21 12:49:48');
INSERT INTO `sys_user` VALUES (2, 'teacher_01', '670b14728ad9902aecba32e22fa4f6bd', '教师_01', NULL, 1, '15535353535', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, '2020-08-13 10:01:26', '2020-08-13 10:01:26');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sys_user_role`(`user_id`) USING BTREE,
  INDEX `FK_sys_user_role_role`(`role_id`) USING BTREE,
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1, '2020-03-12 23:20:08', '2020-03-21 15:18:00');
INSERT INTO `sys_user_role` VALUES (3, 2, 2, '2020-08-18 19:28:02', '2020-08-18 19:28:02');

-- ----------------------------
-- Table structure for t_classify
-- ----------------------------
DROP TABLE IF EXISTS `t_classify`;
CREATE TABLE `t_classify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_classify
-- ----------------------------
INSERT INTO `t_classify` VALUES (1, 'Java后端技术', 1, 'Java后端技术');
INSERT INTO `t_classify` VALUES (2, '微信小程序', 2, '微信小程序');
INSERT INTO `t_classify` VALUES (3, '数据库', 3, '数据库');
INSERT INTO `t_classify` VALUES (4, '前端技术', 4, '前端技术');
INSERT INTO `t_classify` VALUES (5, 'C#后端技术', 5, 'C#后端技术');

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类别',
  `content` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `teacher_id` int(10) NULL DEFAULT NULL COMMENT '教师id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `classify_id` int(10) NULL DEFAULT NULL COMMENT '分类id',
  `ggkc` int(10) NULL DEFAULT 0 COMMENT '公共课程',
  `zykc` int(10) NULL DEFAULT 0 COMMENT '专业课程',
  `mfkc` int(10) NULL DEFAULT 0 COMMENT '免费课程',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES (1, 'SpringMvc视频教程', 'http://localhost:8081/getFileURL/file/20200814/mybatis-plus.jpg', 'free', '<p><img src=\"http://localhost:8081/getFileURL/file/20200814/mybatis-plus(1).jpg\" alt=\"mybatis-plus.jpg\"></p><p>Spring MVC属于SpringFrameWork的后续产品，已经融合在Spring Web Flow里面。</p><p>Spring 框架提供了构建 Web 应用程序的全功能 MVC 模块。</p><p>使用 Spring 可插入的 MVC 架构，从而在使用Spring进行WEB开发时，</p><p>可以选择使用Spring的Spring MVC框架或集成其他MVC开发框架，</p><p>如Struts1(现在一般不用)，Struts 2(一般老项目使用)等等21312312321。</p>', 1, '2020-08-14 17:43:29', 1, 1, 0, 1);
INSERT INTO `t_course` VALUES (2, 'SpringBoot快速入门视频教程', 'http://localhost:8081/getFileURL/file/20200816/springboot.jpg', 'free', '<p>Spring Boot是由Pivotal团队提供的全新框架，其设计目的是用来简化新Spring应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。通过这种方式，Spring Boot致力于在蓬勃发展的快速应用开发领域(rapid application development)成为领导者。</p><p><br></p>', 1, '2020-08-16 09:14:53', 1, 1, 1, 1);
INSERT INTO `t_course` VALUES (3, 'Spring4视频教程', 'http://localhost:8081/getFileURL/file/20200816/spring4.jpg', 'free', '<p><span>Spring框架是一个开放源代码的J2EE应用程序框架，由Rod Johnson发起，是针对bean的生命周期进行管理的轻量级容器（lightweight container）。 Spring解决了开发者在J2EE开发中遇到的许多常见的问题，提供了功能强大IOC、AOP及Web MVC等功能。Spring可以单独应用于构筑应用程序，也可以和Struts、Webwork、Tapestry等众多Web框架组合使用，并且可以与 Swing等桌面应用程序AP组合。因此， Spring不仅仅能应用于JEE应用程序之中，也可以应用于桌面应用程序以及小应用程序之中。Spring框架主要由七部分组成，分别是 Spring Core、 Spring AOP、 Spring ORM、 Spring DAO、Spring Context、 Spring Web和 Spring Web MVC。 [1]</span></p>', 2, '2020-08-16 09:16:36', 1, 0, 0, 1);
INSERT INTO `t_course` VALUES (4, 'vue视频教程', 'http://localhost:8081/getFileURL/file/20200816/vue.jpg', 'audition', '<p><img src=\"http://localhost:8081/getFileURL/file/20200816/vue23.jpg\" alt=\"vue23.jpg\"></p><p>Vue.js（读音 /vjuː/, 类似于 view） 是一套构建用户界面的渐进式框架。</p><p>Vue 只关注视图层， 采用自底向上增量开发的设计。</p><p>Vue 的目标是通过尽可能简单的 API 实现响应的数据绑定和组合的视图组件。</p><p>Vue 学习起来非常简单，本教程基于 Vue 2.1.8 版本测试。</p>', 2, '2020-08-16 09:18:46', 4, 1, 0, 0);
INSERT INTO `t_course` VALUES (5, 'mysql数据库视频教程', 'http://localhost:8081/getFileURL/file/20200816/mysql.jpg', 'audition', '<p>MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件之一。</p><p><br>&nbsp; &nbsp;MySQL是一种关系型数据库管理系统，关系数据库将数据保存在不同的表中，而不是将所有数据放在一个大仓库内，这样就增加了速度并提高了灵活性。</p><p><br>&nbsp; &nbsp; MySQL所使用的 SQL 语言是用于访问数据库的最常用标准化语言。MySQL 软件采用了双授权政策，分为社区版和商业版，由于其体积小、速度快、总体拥有成本低，尤其是开放源码这一特点，一般中小型网站的开发都选择 MySQL 作为网站数据库。</p>', 1, '2020-08-16 09:20:50', 3, 0, 1, 0);
INSERT INTO `t_course` VALUES (6, 'Shiro视频教程', 'http://localhost:8081/getFileURL/file/20200816/shiro.jpg', 'audition', '<p><span>Apache Shiro（读作“sheeroh”，即日语“城”）是一个开源安全框架，提供身份验证、授权、密码学和会话管理。Shiro框架直观、易用，同时也能提供健壮的安全性。</span></p>', 1, '2020-08-16 09:22:40', 1, 1, 0, 0);
INSERT INTO `t_course` VALUES (7, 'Layui框架视频教程', 'http://localhost:8081/getFileURL/file/20200816/layui.jpg', 'free', '<p><span>layui（谐音：类UI) 是一款采用自身模块规范编写的前端 UI 框架，遵循原生 HTML/CSS/JS 的书写与组织形式，门槛极低，拿来即用。其外在极简，却又不失饱满的内在，体积轻盈，组件丰盈，从核心代码到 API 的每一处细节都经过精心雕琢，非常适合界面的快速开发。layui 首个版本发布于 2016 年金秋，她区别于那些基于 MVVM 底层的 UI 框架，却并非逆道而行，而是信奉返璞归真之道。准确地说，她更多是为服务端程序员量身定做，你无需涉足各种前端工具的复杂配置，只需面对浏览器本身，让一切你所需要的元素与交互，从这里信手拈来。</span></p>', 1, '2020-08-16 09:24:14', 4, 0, 1, 1);
INSERT INTO `t_course` VALUES (8, 'SpringBoot打造电影网站视频教程', 'http://localhost:8081/getFileURL/file/20200816/dianying.jpg', 'audition', '<p><span>本系统采用SpringBoot架构，数据访问层采用Spring Data Jpa，业务控制层采用SpringMvc，安全框架采用Spring Security以及采用thymeleaf模版引擎和restful风格；本视频教程详细讲解了次系统的完整开发，亮点是SpringBoot的综合应用，以及thymeleaf模版引擎的应用；</span></p><p><span><img src=\"http://localhost:8081/getFileURL/file/20200816/20200712065841.png\" alt=\"20200712065841.png\"><br></span></p>', 2, '2020-08-16 20:24:33', 1, 0, 0, 0);
INSERT INTO `t_course` VALUES (9, 'mycat视频教程', 'http://localhost:8081/getFileURL/file/20200816/mycat.jpg', 'free', '<p><img src=\"http://localhost:8081/getFileURL/file/20200816/mycat2.jpg\" alt=\"mycat2.jpg\"></p><p><strong>MyCAT&nbsp;</strong><span>是一个彻底开源的，面向企业应用开发的“大数据库集群” 支持事务、ACID、可以替代Mysql的加强版数据库 ? 一个可以视为“Mysql”集群的企业级数据库，用来替代昂贵的Oracle集群 ? 一个融合内存缓存技术、Nosql技术、HDFS大数据的新型SQL Server ? 结合传统数据库和新型分布式数据仓库的新一代企业级数据库产品 ? 一个新颖的数据库中间件产品。</span></p>', 1, '2020-08-16 20:28:10', 3, 1, 1, 1);
INSERT INTO `t_course` VALUES (10, 'springboot项目实战', 'http://localhost:8081/getFileURL/file/20200819/springboot.jpg', 'free', '<p><img src=\"http://localhost:8081/getFileURL/file/20200819/mysql.jpg\" alt=\"mysql.jpg\"></p><p>springboot项目实战springboot项目实战springboot项目实战</p><p>springboot项目实战springboot项目实战springboot项目实战</p><p>springboot项目实战springboot项目实战springboot项目实战</p>', 1, '2020-08-19 22:52:26', 1, 1, 1, 1);

-- ----------------------------
-- Table structure for t_lunbo
-- ----------------------------
DROP TABLE IF EXISTS `t_lunbo`;
CREATE TABLE `t_lunbo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_lunbo
-- ----------------------------
INSERT INTO `t_lunbo` VALUES (1, '图片0001', 'http://localhost:8081/getFileURL/file/20200814/tupian001(3).jpg', 1);
INSERT INTO `t_lunbo` VALUES (2, '图片002', 'http://localhost:8081/getFileURL/file/20200814/tupian002.png', 2);
INSERT INTO `t_lunbo` VALUES (3, '图片003', 'http://localhost:8081/getFileURL/file/20200814/tupian003.jpg', 3);

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, '首页', '/default/default', 1, 'layui-icon layui-icon-home');
INSERT INTO `t_menu` VALUES (2, '课程', '/default/course', 2, 'layui-icon layui-icon-app');
INSERT INTO `t_menu` VALUES (3, '商品兑换', '/default/present', 3, 'layui-icon layui-icon-star');
INSERT INTO `t_menu` VALUES (4, '课程资料发布', '/default/release', 4, 'layui-icon layui-icon-release');
INSERT INTO `t_menu` VALUES (5, '用户发布', '/default/releases', 5, 'layui-icon layui-icon-username');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `teacher_id` int(10) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (1, '最新课程发布通知2020-08-18', '<p><img src=\"http://localhost:8081/getFileURL/file/20200818/mycat.jpg\" alt=\"mycat.jpg\"></p><p>最新课程发布通知2020-08-18</p><p>最新课程发布通知2020-08-18</p>', 1, '2020-08-18 14:11:59');
INSERT INTO `t_notice` VALUES (2, '最新课程通知-0000002', '<p><img src=\"http://localhost:8081/getFileURL/file/20200818/mysql.jpg\" alt=\"mysql.jpg\"></p><p>最新课程通知-0000002最新课程通知-0000002最新课程通知-0000002</p><p>最新课程通知-0000002最新课程通知-0000002最新课程通知-0000002</p>', 2, '2020-08-18 21:36:03');
INSERT INTO `t_notice` VALUES (3, '通知0000000000002', '<p>通知0000000000002通知0000000000002通知0000000000002通知0000000000002通知0000000000002</p>', 1, '2020-08-19 23:00:12');
INSERT INTO `t_notice` VALUES (4, '最新课程通知-00003', '<p>最新课程通知-00003最新课程通知-00003最新课程通知-00003最新课程通知-00003</p><p>最新课程通知-00003最新课程通知-00003最新课程通知-00003最新课程通知-00003</p><p>最新课程通知-00003最新课程通知-00003最新课程通知-00003最新课程通知-00003</p>', 2, '2020-08-19 23:01:10');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int(10) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jine` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `course_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (1, 'COURSE533379', 'SpringBoot打造电影网站视频教程', 1, '2020-08-17 19:19:08', '支付宝', '200', 8);
INSERT INTO `t_order` VALUES (2, 'COURSE169737', 'vue视频教程', 1, '2020-08-19 22:57:19', '支付宝', '200', NULL);

-- ----------------------------
-- Table structure for t_present
-- ----------------------------
DROP TABLE IF EXISTS `t_present`;
CREATE TABLE `t_present`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `integral` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_present
-- ----------------------------
INSERT INTO `t_present` VALUES (1, '小商品-0000001', 'http://localhost:8081/getFileURL/file/20200818/gyp456.jpg', 300, '2020-08-18 14:21:21');
INSERT INTO `t_present` VALUES (2, '小商品-00000002', 'http://localhost:8081/getFileURL/file/20200819/gyp123.jpg', 300, '2020-08-19 22:59:42');

-- ----------------------------
-- Table structure for t_release
-- ----------------------------
DROP TABLE IF EXISTS `t_release`;
CREATE TABLE `t_release`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int(10) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_release
-- ----------------------------
INSERT INTO `t_release` VALUES (2, '自己整理的考试要点20条', 'http://localhost:8081/getFileURL/file/20200819/需求(1).txt', 'http://localhost:8081/getFileURL/file/20200819/需求(1).txt', 1, '2020-08-19 19:16:29', 1, 'http://localhost:8081/getFileURL/file/20200816/mycat.jpg');
INSERT INTO `t_release` VALUES (3, '2020考研注意事项', '<p>1、2020考研注意事项1</p><p>2、2020考研注意事项2</p><p>3、2020考研注意事项3</p><p>4、2020考研注意事项</p>', 'http://localhost:8081/getFileURL/file/20200819/需求(2).txt', 1, '2020-08-19 19:22:42', 1, 'http://localhost:8081/getFileURL/file/20200816/mycat.jpg');
INSERT INTO `t_release` VALUES (6, '重要资料重要资料重要资料重要资料', '<p><img src=\"http://localhost:8081/getFileURL/file/20200819/mycat2(1).jpg\" alt=\"mycat2.jpg\"></p><p>重要资料重要资料重要资料重要资料重要资料重要资料重要资料重要资料重要资料重要资料重要资料</p>', 'http://localhost:8081/getFileURL/file/20200819/需求(3).txt', 1, '2020-08-19 22:58:39', 1, 'http://localhost:8081/getFileURL/file/20200819/mycat2.jpg');

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nickName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `imageName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES (1, '张三', '一枚java全栈架构讲师...', 'http://localhost:8081/getFileURL/file/20200813/123ad.jpg', 2);
INSERT INTO `t_teacher` VALUES (2, '李四', 'java架构师一枚', 'http://localhost:8081/getFileURL/file/20200813/12312.jpg', NULL);

-- ----------------------------
-- Table structure for t_video
-- ----------------------------
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `sort` int(10) NULL DEFAULT NULL,
  `course_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_video
-- ----------------------------
INSERT INTO `t_video` VALUES (1, '第一章节01', 'http://localhost:8081/getFileURL/file/20200814/shipin001(2).mp4', '2020-08-14 17:42:25', 1, 1);
INSERT INTO `t_video` VALUES (2, '第二章节02', 'http://localhost:8081/getFileURL/file/20200814/shipin001(3).mp4', '2020-08-14 17:47:27', 2, 1);
INSERT INTO `t_video` VALUES (3, '第三章节03', 'http://localhost:8081/getFileURL/file/20200814/shipin001(4).mp4', '2020-08-14 17:47:49', 3, 1);
INSERT INTO `t_video` VALUES (4, '第一章节', 'http://localhost:8081/getFileURL/file/20200819/shipin001.mp4', '2020-08-19 22:52:52', 1, 10);
INSERT INTO `t_video` VALUES (5, '第二章节', 'http://localhost:8081/getFileURL/file/20200819/shipin001(1).mp4', '2020-08-19 22:53:12', 2, 10);

SET FOREIGN_KEY_CHECKS = 1;
