/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : medicine

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2019-10-28 15:49:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hospital
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_name` varchar(255) NOT NULL,
  `hospital_address` varchar(255) NOT NULL,
  `contace_information` varchar(255) NOT NULL,
  `sales_person_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hospital
-- ----------------------------

-- ----------------------------
-- Table structure for hospital_med_inventory
-- ----------------------------
DROP TABLE IF EXISTS `hospital_med_inventory`;
CREATE TABLE `hospital_med_inventory` (
  `id` int(11) NOT NULL,
  `med_price_id` int(11) NOT NULL,
  `med_inventory` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hospital_med_inventory
-- ----------------------------

-- ----------------------------
-- Table structure for med_information
-- ----------------------------
DROP TABLE IF EXISTS `med_information`;
CREATE TABLE `med_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `med_name` varchar(255) NOT NULL,
  `production_date` datetime NOT NULL,
  `shelf_life` varchar(255) NOT NULL,
  `speciality` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of med_information
-- ----------------------------

-- ----------------------------
-- Table structure for med_inventory
-- ----------------------------
DROP TABLE IF EXISTS `med_inventory`;
CREATE TABLE `med_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `med_information_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of med_inventory
-- ----------------------------

-- ----------------------------
-- Table structure for med_price
-- ----------------------------
DROP TABLE IF EXISTS `med_price`;
CREATE TABLE `med_price` (
  `id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `med_information_id` int(11) NOT NULL,
  `med_price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of med_price
-- ----------------------------

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `patient_information_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient
-- ----------------------------

-- ----------------------------
-- Table structure for patient_information
-- ----------------------------
DROP TABLE IF EXISTS `patient_information`;
CREATE TABLE `patient_information` (
  `id` int(11) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `patient_sex` varchar(255) NOT NULL,
  `patient_age` int(11) NOT NULL,
  `patient_contact_information` varchar(255) NOT NULL,
  `patient_illness` varchar(255) NOT NULL,
  `buy_med_information` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient_information
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'user findAll', '/user/findAll.do');
INSERT INTO `permission` VALUES ('2', 'user findById', '/user/findById.do');
INSERT INTO `permission` VALUES ('3', 'role findAll', '/role/findAll');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ADMIN', 'VIP');
INSERT INTO `role` VALUES ('2', 'FOX', 'VIP');
INSERT INTO `role` VALUES ('3', 'aaa', 'VIP');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permissionId` int(11) NOT NULL DEFAULT '0',
  `roleId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('2', '1');
INSERT INTO `role_permission` VALUES ('3', '1');

-- ----------------------------
-- Table structure for sales_person
-- ----------------------------
DROP TABLE IF EXISTS `sales_person`;
CREATE TABLE `sales_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salesperson_name` varchar(255) NOT NULL,
  `contact_information` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sales_person
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `power` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'tom', '$2a$10$8jyBOsY1Rlyy/L7y9zUTIe1bRAI4av9O9MGHJVlT3aRIAn4TBDcZO', '13643653012', '山西省', '1');
INSERT INTO `users` VALUES ('2', 'can', '$2a$10$5L02Wk.Ub6jvWvnCz1MICus96CrNOK5JLBwhEKVXbPS/.O6wqYSRW', '15034599322', '贵州省', '1');
INSERT INTO `users` VALUES ('3', 'fox', '$2a$10$fYeP6kLcFzUl5H41RbvU1uD16Mbo0NTlmFuVeb1eg5u4aJg.vRYji', null, '山西运城', '0');
INSERT INTO `users` VALUES ('4', 'king', '$2a$10$E1fFk3QzTnagviJM8yw.Y.y/8Zp3Rar1Dx4iUEseENpBgB3yyuWXm', null, '陕西西安', '0');
INSERT INTO `users` VALUES ('5', 'zf', '$2a$10$tRjmsjAs8EO.KqMO4C2FmOx35dNYhQVEVwNnqwMZ4UzP63oBZloYW', '159789456123', '陕西西安', '1');

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `userId` int(11) NOT NULL DEFAULT '0',
  `roleId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('1', '1');
INSERT INTO `users_role` VALUES ('1', '2');
