/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : belibs_dip

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-05-07 23:33:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book_copy
-- ----------------------------
DROP TABLE IF EXISTS `book_copy`;
CREATE TABLE `book_copy` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `barcode` varchar(50) NOT NULL,
  `nonconsume_identifier` varchar(255) DEFAULT NULL,
  `user_owner_aid` int(10) unsigned NOT NULL,
  `parent_aid` int(10) unsigned NOT NULL,
  `product_type_aid` int(10) unsigned NOT NULL,
  `product_type_minor_aid` tinyint(4) unsigned DEFAULT NULL,
  `copy_title` varchar(255) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `weight` float DEFAULT '0',
  `upload_path` varchar(255) DEFAULT NULL,
  `file_upload` varchar(255) DEFAULT NULL,
  `digital_file_type` varchar(100) DEFAULT NULL,
  `use_digital_gen` tinyint(1) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `no_1` varchar(12) DEFAULT NULL,
  `no_2` varchar(12) DEFAULT NULL,
  `no_3` varchar(12) DEFAULT NULL,
  `no_4` varchar(12) DEFAULT NULL,
  `call_number` varchar(48) DEFAULT NULL,
  `cover_price` double unsigned DEFAULT NULL,
  `source` text,
  `note_1` text,
  `note_2` text,
  `note_3` text,
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '1: Digital, 2:Paper',
  `type_minor` tinyint(3) unsigned DEFAULT NULL,
  `possession` tinyint(1) unsigned DEFAULT NULL COMMENT '1:Buy out, 2:Rental',
  `is_license` tinyint(1) unsigned DEFAULT NULL COMMENT '1:License, 0:Not license',
  `is_ebook` tinyint(1) NOT NULL,
  `ebook_concurrence` tinyint(4) unsigned DEFAULT NULL,
  `digital_price` double unsigned DEFAULT NULL,
  `digital_point` double unsigned DEFAULT NULL,
  `paper_price` double unsigned DEFAULT NULL,
  `paper_point` double unsigned DEFAULT NULL,
  `in_stock` tinyint(4) unsigned DEFAULT NULL,
  `rental_period` tinyint(4) unsigned DEFAULT NULL,
  `rental_fee` tinyint(4) unsigned DEFAULT NULL,
  `rental_fee_point` tinyint(4) unsigned DEFAULT NULL,
  `rental_fine_fee` tinyint(4) unsigned DEFAULT NULL,
  `shelf_status` tinyint(1) unsigned DEFAULT NULL COMMENT '1: On shelf, 2:Borrowed, 3:Damage, 4:Lost',
  `shelf_name` varchar(255) DEFAULT NULL,
  `transport_aid` int(10) unsigned DEFAULT NULL,
  `transport_price` int(10) unsigned DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `code` (`barcode`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
