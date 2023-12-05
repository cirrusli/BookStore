/*
 Navicat MySQL Data Transfer

 Source Server         : 本机MySQL
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : bookstore

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 20/10/2022 22:23:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` float(100, 0) NOT NULL,
  `sales` int(100) NOT NULL,
  `stock` int(100) NOT NULL,
  `img_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, '解忧杂货店', '东野圭吾', 27, 999, 8, 'static/img/解忧杂货店.jpg');
INSERT INTO `books` VALUES (2, '边城', '沈从文', 23, 107, 93, 'static/img/边城.jpg');
INSERT INTO `books` VALUES (3, '中国哲学史', '冯友兰', 88, 1, 0, 'static/img/中国哲学史.jpg');
INSERT INTO `books` VALUES (4, '忽然七日', ' 劳伦', 19, 106, 94, 'static/img/忽然七日.jpg');
INSERT INTO `books` VALUES (5, '苏东坡传', '林语堂', 19, 100, 100, 'static/img/苏东坡传.jpg');
INSERT INTO `books` VALUES (6, '百年孤独', '马尔克斯', 29, 100, 100, 'static/img/百年孤独.jpg');
INSERT INTO `books` VALUES (7, '扶桑', '严歌苓', 20, 102, 98, 'static/img/扶桑.jpg');
INSERT INTO `books` VALUES (8, '给孩子的诗', '北岛', 22, 102, 98, 'static/img/给孩子的诗.jpg');
INSERT INTO `books` VALUES (9, '为奴十二年', '所罗门', 16, 101, 99, 'static/img/为奴十二年.jpg');
INSERT INTO `books` VALUES (10, '平凡的世界', '路遥', 55, 101, 99, 'static/img/平凡的世界.jpg');
INSERT INTO `books` VALUES (11, '悟空传', '今何在', 14, 103, 97, 'static/img/悟空传.jpg');
INSERT INTO `books` VALUES (12, '硬派健身', '斌卡', 31, 101, 99, 'static/img/硬派健身.jpg');
INSERT INTO `books` VALUES (13, '从晚清到民国', '唐德刚', 40, 100, 100, 'static/img/从晚清到民国.jpg');
INSERT INTO `books` VALUES (14, '三体', '刘慈欣', 56, 100, 100, 'static/img/三体.jpg');
INSERT INTO `books` VALUES (15, '看见', '柴静', 19, 102, 98, 'static/img/看见.jpg');
INSERT INTO `books` VALUES (16, '活着', '余华', 11, 100, 100, 'static/img/活着.jpg');
INSERT INTO `books` VALUES (17, '小王子', '安托万', 19, 100, 100, 'static/img/小王子.jpg');
INSERT INTO `books` VALUES (18, '我们仨', '杨绛', 11, 100, 100, 'static/img/我们仨.jpg');
INSERT INTO `books` VALUES (19, 'Go语言学习笔记', '雨痕', 66, 106, 94, 'static/img/Go语言学习笔记.jpg');
INSERT INTO `books` VALUES (20, '皮囊', '蔡崇达', 24, 100, 100, 'static/img/皮囊.jpg');
INSERT INTO `books` VALUES (21, '恰到好处的幸福', '毕淑敏', 16, 100, 100, 'static/img/恰到好处的幸福.jpg');
INSERT INTO `books` VALUES (22, '大数据预测', '埃里克', 37, 101, 99, 'static/img/大数据预测.jpg');
INSERT INTO `books` VALUES (23, '人月神话', '布鲁克斯', 56, 100, 100, 'static/img/人月神话.jpg');
INSERT INTO `books` VALUES (24, 'C语言入门经典', '霍尔顿', 45, 101, 99, 'static/img/C语言入门经典.jpg');
INSERT INTO `books` VALUES (25, '数学之美', '吴军', 30, 100, 100, 'static/img/数学之美.jpg');
INSERT INTO `books` VALUES (26, 'Java编程思想', '埃史尔', 70, 100, 100, 'static/img/Java编程思想.jpg');
INSERT INTO `books` VALUES (27, '设计模式之禅', '秦小波', 20, 100, 100, 'static/img/设计模式之禅.jpg');
INSERT INTO `books` VALUES (28, '图解机器学习', '杉山将', 34, 100, 100, 'static/img/图解机器学习.jpg');
INSERT INTO `books` VALUES (29, '艾伦图灵传', '安德鲁', 47, 100, 100, 'static/img/艾伦图灵传.jpg');
INSERT INTO `books` VALUES (30, '教父', '马里奥普佐', 29, 100, 100, 'static/img/教父.jpg');

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `COUNT` int(11) NOT NULL,
  `amount` double(11, 2) NOT NULL,
  `book_id` int(11) NOT NULL,
  `cart_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk1`(`book_id`) USING BTREE,
  INDEX `fk2`(`cart_id`) USING BTREE,
  CONSTRAINT `fk1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk2` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
INSERT INTO `cart_items` VALUES (1, 1, 23.00, 2, 'f0c9dd45-7053-4058-65c6-5eabe51d82c2');

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_amount` double(11, 2) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES ('f0c9dd45-7053-4058-65c6-5eabe51d82c2', 1, 23.00, 4);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `COUNT` int(11) NOT NULL,
  `amount` double(11, 2) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double(11, 2) NOT NULL,
  `img_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (1, 6, 396.00, 'Go语言学习笔记', '雨痕', 66.00, 'static/img/Go语言学习笔记.jpg', 'de95c7e0-a7e6-41d0-71b1-a6e028f104f0');
INSERT INTO `order_items` VALUES (8, 1, 23.00, '边城', '沈从文', 23.00, 'static/img/边城.jpg', 'a7f97fd2-60ea-4269-741f-467352eb5a6e');
INSERT INTO `order_items` VALUES (9, 1, 23.00, '边城', '沈从文', 23.00, 'static/img/边城.jpg', 'd2d990ee-4e4b-4ec7-69a1-950d8763c6e8');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_amount` double(11, 2) NOT NULL,
  `state` int(11) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('a7f97fd2-60ea-4269-741f-467352eb5a6e', '2022-05-26 18:39:49', 1, 23.00, 2, 3);
INSERT INTO `orders` VALUES ('d2d990ee-4e4b-4ec7-69a1-950d8763c6e8', '2022-07-09 15:30:16', 1, 23.00, 1, 5);
INSERT INTO `orders` VALUES ('de95c7e0-a7e6-41d0-71b1-a6e028f104f0', '2022-05-26 15:37:18', 6, 396.00, 2, 1);

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `session_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`session_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PASSWORD` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


SET FOREIGN_KEY_CHECKS = 1;
