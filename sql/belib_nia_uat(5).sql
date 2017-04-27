-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2017 at 11:10 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belib_nia_uat`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `weight` float DEFAULT '0',
  `in_home` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '0:Not show in homepage, 1:Show in homepage',
  `is_new` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_highlight` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `description` text,
  `ref_link` text,
  `target` varchar(50) NOT NULL,
  `upload_path` varchar(255) DEFAULT NULL,
  `cover_image_file_type` varchar(5) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `total_view` int(10) UNSIGNED DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ads_category`
--

CREATE TABLE `ads_category` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(100) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `weight` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ads_category`
--

INSERT INTO `ads_category` (`aid`, `cid`, `user_owner_aid`, `name`, `weight`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 'ask-librarian', 1, 'Ask Librarian', 2, 1, '2014-08-12 18:36:25', 1, '2014-08-12 20:52:08', 1),
(2, 'data-subscription', 1, 'Data Subscription', 8, 1, '2014-08-12 18:37:25', 1, '2014-08-12 20:52:49', 1),
(3, 'new-release', 1, 'New  Release', 1, 1, '2014-08-12 18:37:59', 1, '2014-08-12 20:51:54', 1),
(4, 'product', 1, 'E-Book / E-Magazine', 6, 1, '2014-08-12 18:38:18', 1, '2014-08-12 20:52:41', 1),
(5, 'login', 1, 'Login', 4, 1, '2014-08-12 18:38:53', 1, '2014-08-12 20:52:56', 1),
(6, 'sign-up', 1, 'Sign Up', 3, 1, '2014-08-12 18:39:06', 1, '2014-08-12 20:52:22', 1),
(7, 'my-account', 1, 'My account', 5, 1, '2014-08-12 20:18:11', 1, '2014-08-12 20:52:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `weight` float DEFAULT '0',
  `description` text,
  `ref_link` text,
  `target` varchar(50) NOT NULL,
  `upload_path` varchar(255) DEFAULT NULL,
  `cover_image_file_type` varchar(5) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`aid`, `cid`, `user_owner_aid`, `title`, `weight`, `description`, `ref_link`, `target`, `upload_path`, `cover_image_file_type`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 'FHISLW7z1O54', 1, 'banner', 0, NULL, '#', '_self', 'uploads/dip/banner/FHISLW7z1O54/', '.png', 1, '2016-10-25 13:43:19', 6, '2017-03-22 17:47:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `product_main_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `publisher_aid` int(10) UNSIGNED DEFAULT NULL,
  `title` text,
  `author` text,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '0:Not Active, 1:Active',
  `weight` float DEFAULT '0',
  `is_new` tinyint(4) DEFAULT '0',
  `is_recommended` tinyint(4) DEFAULT '0',
  `is_home` tinyint(4) UNSIGNED DEFAULT '0',
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `upload_path` text,
  `cover_image_file_type` varchar(5) DEFAULT NULL,
  `uri` text,
  `tag` longtext,
  `total_copy` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_view` int(10) UNSIGNED DEFAULT '0',
  `total_view_web` int(10) UNSIGNED DEFAULT '0',
  `total_view_device` int(10) UNSIGNED DEFAULT '0',
  `total_download` int(10) UNSIGNED DEFAULT '0',
  `total_download_web` int(10) UNSIGNED DEFAULT '0',
  `total_download_device` int(10) UNSIGNED DEFAULT '0',
  `total_read` int(10) UNSIGNED DEFAULT '0',
  `total_read_web` int(10) UNSIGNED DEFAULT '0',
  `total_read_device` int(10) UNSIGNED DEFAULT '0',
  `total_rental` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `best_price` int(10) UNSIGNED DEFAULT NULL,
  `has_paper` tinyint(1) UNSIGNED DEFAULT NULL,
  `has_ebook` tinyint(1) UNSIGNED DEFAULT NULL,
  `has_license` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `reward_point` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `review_point` int(10) UNSIGNED DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `bcc_status` tinyint(4) NOT NULL,
  `cover_image` varchar(500) NOT NULL,
  `thumbnail_image` varchar(500) NOT NULL,
  `large_image` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`aid`, `cid`, `user_owner_aid`, `product_main_aid`, `product_type_aid`, `publisher_aid`, `title`, `author`, `status`, `weight`, `is_new`, `is_recommended`, `is_home`, `publish_date`, `expired_date`, `category`, `upload_path`, `cover_image_file_type`, `uri`, `tag`, `total_copy`, `total_view`, `total_view_web`, `total_view_device`, `total_download`, `total_download_web`, `total_download_device`, `total_read`, `total_read_web`, `total_read_device`, `total_rental`, `best_price`, `has_paper`, `has_ebook`, `has_license`, `reward_point`, `review_point`, `created_date`, `created_by`, `updated_date`, `updated_by`, `bcc_status`, `cover_image`, `thumbnail_image`, `large_image`) VALUES
(1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 0, '', '', ''),
(2, '000002', 1, 3, 1, 30, 'สิ่งแวดล้อม', '', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',2,', 'uploads/dip/book/1/000002/', '.jpg', NULL, '', 1, 26, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 12, 0, '2017-03-31 16:56:44', 1, '2017-03-31 17:10:21', 1, 0, '', '', ''),
(3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `book_copy`
--

CREATE TABLE `book_copy` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `barcode` varchar(50) NOT NULL,
  `nonconsume_identifier` varchar(255) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `product_type_minor_aid` tinyint(4) UNSIGNED DEFAULT NULL,
  `copy_title` varchar(255) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `weight` float DEFAULT '0',
  `upload_path` varchar(255) DEFAULT NULL,
  `file_upload` varchar(255) DEFAULT NULL,
  `use_digital_gen` tinyint(1) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `no_1` varchar(12) DEFAULT NULL,
  `no_2` varchar(12) DEFAULT NULL,
  `no_3` varchar(12) DEFAULT NULL,
  `no_4` varchar(12) DEFAULT NULL,
  `call_number` varchar(48) DEFAULT NULL,
  `cover_price` double UNSIGNED DEFAULT NULL,
  `source` text,
  `note_1` text,
  `note_2` text,
  `note_3` text,
  `type` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1: Digital, 2:Paper',
  `type_minor` tinyint(3) UNSIGNED DEFAULT NULL,
  `possession` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1:Buy out, 2:Rental',
  `is_license` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1:License, 0:Not license',
  `is_ebook` tinyint(1) NOT NULL,
  `ebook_concurrence` tinyint(4) UNSIGNED DEFAULT NULL,
  `digital_price` double UNSIGNED DEFAULT NULL,
  `digital_point` double UNSIGNED DEFAULT NULL,
  `paper_price` double UNSIGNED DEFAULT NULL,
  `paper_point` double UNSIGNED DEFAULT NULL,
  `in_stock` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_period` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fee` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fee_point` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fine_fee` tinyint(4) UNSIGNED DEFAULT NULL,
  `shelf_status` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1: On shelf, 2:Borrowed, 3:Damage, 4:Lost',
  `shelf_name` varchar(255) DEFAULT NULL,
  `transport_aid` int(10) UNSIGNED DEFAULT NULL,
  `transport_price` int(10) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_copy`
--

INSERT INTO `book_copy` (`aid`, `cid`, `barcode`, `nonconsume_identifier`, `user_owner_aid`, `parent_aid`, `product_type_aid`, `product_type_minor_aid`, `copy_title`, `publish_date`, `expired_date`, `weight`, `upload_path`, `file_upload`, `use_digital_gen`, `status`, `no_1`, `no_2`, `no_3`, `no_4`, `call_number`, `cover_price`, `source`, `note_1`, `note_2`, `note_3`, `type`, `type_minor`, `possession`, `is_license`, `is_ebook`, `ebook_concurrence`, `digital_price`, `digital_point`, `paper_price`, `paper_point`, `in_stock`, `rental_period`, `rental_fee`, `rental_fee_point`, `rental_fine_fee`, `shelf_status`, `shelf_name`, `transport_aid`, `transport_price`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 'phemSQp69uzF', '1234567890', '', 1, 1, 1, 2, 'อภินิหาร', '2017-03-21', NULL, 0, 'uploads/nia/book_copy/2017/03/1234567890_phemSQp69uzF/', NULL, 0, 1, '01', '03', '2015', '', '01 03 2015', 999, '', NULL, NULL, NULL, 2, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, '2', 0, 0, '2017-03-21 15:03:41', 1, '2017-04-05 09:42:27', 1),
(2, 'kFhG4Iu9lm6C', 'B1234567890', '', 1, 2, 1, 3, 'สิ่งแวดล้อม222', '2017-03-31', NULL, 0, 'uploads/dip/book_copy/2017/03/B1234567890_kFhG4Iu9lm6C/', NULL, 0, 1, '', '', '', '', '', 180, '', NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, '2017-03-31 16:57:50', 1, '2017-03-31 17:10:21', 1),
(3, 'oXEpOcJNd6W6', 'PB000001', '', 1, 3, 1, 2, 'Test 2', '2017-03-31', NULL, 0, 'uploads/dip/book_copy/2017/03/PB000001_oXEpOcJNd6W6/', NULL, 0, 1, '', '', '', '', '', 199, '', NULL, NULL, NULL, 2, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '3', 0, 0, '2017-03-31 17:00:28', 1, '2017-04-18 16:43:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `book_field`
--

CREATE TABLE `book_field` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `sequence` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `product_main_field_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `tag` varchar(6) NOT NULL,
  `ind1_cd` char(1) DEFAULT NULL,
  `ind2_cd` char(1) DEFAULT NULL,
  `subfield_cd` char(1) NOT NULL,
  `field_data` text,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `product_main_aid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_field`
--

INSERT INTO `book_field` (`parent_aid`, `sequence`, `product_type_aid`, `product_main_field_aid`, `name`, `user_owner_aid`, `tag`, `ind1_cd`, `ind2_cd`, `subfield_cd`, `field_data`, `created_date`, `created_by`, `updated_date`, `updated_by`, `product_main_aid`) VALUES
(1, 10, 1, 10, 'Item/Issue No.', 1, '050', '', '', 'b', '1', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1, 0),
(1, 9, 1, 9, 'Publish Year', 1, '050', '', '', 'b', '2015', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1, 0),
(1, 8, 1, 8, 'Author ID', 1, '050', '', '', 'b', '03', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1, 0),
(1, 7, 1, 7, 'Classification No.', 1, '050', '', '', 'a', '01', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1, 0),
(1, 6, 1, 6, 'ISBN', 1, '020', '', '', 'a', '1234567890', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1, 0),
(1, 5, 1, 5, 'Subject', 1, '650', '', '', 'a', 'อภินิหาร', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1, 0),
(1, 4, 1, 4, 'Total pages', 1, '300', '', '', 'a', '120', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1, 0),
(1, 3, 1, 3, 'Description', 1, '520', '', '', 'a', 'อภินิหาร', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1, 0),
(1, 2, 1, 2, 'Author', 1, '100', '', '', 'a', 'ชื่อผู้แต่งแสดงตรงนี้ครับ', '2017-03-21 15:13:31', 1, '2017-04-04 16:49:13', 1, 0),
(1, 1, 1, 1, 'Title', 1, '245', '', '', 'a', 'อภินิหาร', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1, 0),
(1, 11, 1, 11, 'Place of publication', 1, '260', '', '', 'a', 'bkk', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1, 0),
(1, 12, 1, 12, 'Name of publisher', 1, '260', '', '', 'b', 'bkk', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1, 0),
(1, 13, 1, 13, 'Date of publication', 1, '260', '', '', 'c', '02-2015', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1, 0),
(2, 1, 1, 27, 'Title', 1, '245', '', '', 'a', 'สิ่งแวดล้อม', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1, 0),
(2, 8, 1, 34, 'Date of publication', 1, '260', '', '', 'c', '20 มิ.ย.56', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1, 0),
(2, 7, 1, 33, 'Name of publisher', 1, '260', '', '', 'b', 'สสส', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1, 0),
(2, 6, 1, 32, 'ISBN', 1, '020', '', '', 'a', '1234567890', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1, 0),
(2, 5, 1, 31, 'Subject', 1, '650', '', '', 'a', 'สิ่งแวดล้อม', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1, 0),
(2, 4, 1, 30, 'Total pages', 1, '300', '', '', 'a', '120', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1, 0),
(2, 2, 1, 28, 'Author', 1, '100', '', '', 'a', '', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1, 0),
(2, 3, 1, 29, 'Description', 1, '520', '', '', 'a', 'สิ่งแวดล้อม', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1, 0),
(3, 11, 1, 11, 'Place of publication', 1, '260', '', '', 'a', '', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1, 0),
(3, 12, 1, 12, 'Name of publisher', 1, '260', '', '', 'b', '', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1, 0),
(3, 10, 1, 10, 'Item/Issue No.', 1, '050', '', '', 'b', '', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1, 0),
(3, 9, 1, 9, 'Publish Year', 1, '050', '', '', 'b', '', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1, 0),
(3, 8, 1, 8, 'Author ID', 1, '050', '', '', 'b', '', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1, 0),
(3, 7, 1, 7, 'Classification No.', 1, '050', '', '', 'a', '', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1, 0),
(3, 6, 1, 6, 'ISBN', 1, '020', '', '', 'a', '32659875421', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1, 0),
(3, 5, 1, 5, 'Subject', 1, '650', '', '', 'a', 'Test 2', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1, 0),
(3, 4, 1, 4, 'Total pages', 1, '300', '', '', 'a', '199', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1, 0),
(3, 3, 1, 3, 'Description', 1, '520', '', '', 'a', 'Test 2', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1, 0),
(3, 2, 1, 2, 'Author', 1, '100', '', '', 'a', 'Test 2', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1, 0),
(3, 1, 1, 1, 'Title', 1, '245', '', '', 'a', 'Test 2', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1, 0),
(3, 13, 1, 13, 'Date of publication', 1, '260', '', '', 'c', '', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `book_ref_product_category`
--

CREATE TABLE `book_ref_product_category` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `product_category_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `user_owner_aid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_ref_product_category`
--

INSERT INTO `book_ref_product_category` (`parent_aid`, `product_category_aid`, `product_type_aid`, `user_owner_aid`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `book_ref_user_section`
--

CREATE TABLE `book_ref_user_section` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `copy_aid` int(10) UNSIGNED NOT NULL,
  `user_section_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `rental_period` tinyint(3) UNSIGNED DEFAULT NULL,
  `rental_fee` tinyint(3) UNSIGNED DEFAULT NULL,
  `rental_fee_point` tinyint(3) UNSIGNED DEFAULT NULL,
  `rental_fine_fee` tinyint(3) UNSIGNED DEFAULT NULL,
  `renew_time` tinyint(3) UNSIGNED DEFAULT NULL,
  `renew_period` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_ref_user_section`
--

INSERT INTO `book_ref_user_section` (`parent_aid`, `copy_aid`, `user_section_aid`, `product_type_aid`, `user_owner_aid`, `rental_period`, `rental_fee`, `rental_fee_point`, `rental_fine_fee`, `renew_time`, `renew_period`) VALUES
(1, 1, 1, 1, 1, 7, 0, 0, 10, 0, 0),
(1, 1, 2, 1, 1, 7, 0, 0, 20, 0, 0),
(1, 1, 3, 1, 1, 5, 0, 0, 30, 0, 0),
(3, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0),
(3, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0),
(3, 3, 3, 1, 1, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `book_tag`
--

CREATE TABLE `book_tag` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `aid` int(10) UNSIGNED NOT NULL,
  `issue_aid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `comment` text,
  `parent_aid` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `like_total` int(10) UNSIGNED DEFAULT NULL,
  `dislike_total` int(10) UNSIGNED DEFAULT NULL,
  `report_total` int(10) UNSIGNED DEFAULT NULL,
  `comment_name` varchar(255) DEFAULT NULL,
  `comment_email` varchar(255) DEFAULT NULL,
  `ip` varchar(12) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_msg`
--

CREATE TABLE `contact_msg` (
  `aid` int(10) UNSIGNED NOT NULL,
  `contact_topic_aid` int(10) UNSIGNED DEFAULT NULL,
  `data` longtext,
  `ip` varchar(15) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_topic`
--

CREATE TABLE `contact_topic` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(64) DEFAULT NULL,
  `email` longtext NOT NULL,
  `weight` double DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact_topic`
--

INSERT INTO `contact_topic` (`aid`, `cid`, `user_owner_aid`, `name`, `url`, `email`, `weight`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, NULL, 1, 'Trouble Logging in', 'trouble-loggin-in', 'nia.library@nia.go.th,yaowaluk_tarn@bookdose.com', 4, 1, '2014-06-24 00:00:00', 1, '2014-06-24 00:00:00', 1),
(2, NULL, 1, 'Trouble Signing Up', 'trouble-signing-up', 'nia.library@nia.go.th,yaowaluk_tarn@bookdose.com', 5, 1, '2014-06-24 00:00:00', 1, '2014-06-24 00:00:00', 1),
(3, NULL, 1, 'Others', 'others', 'nia.library@nia.go.th,yaowaluk_tarn@bookdose.com', 999, 1, '2014-06-24 00:00:00', 1, '2014-06-24 00:00:00', 1),
(4, NULL, 1, 'Customer Service', 'customer-service', 'nia.library@nia.go.th,yaowaluk_tarn@bookdose.com', 2, 1, '2014-06-24 00:00:00', 1, '2014-06-24 00:00:00', 1),
(5, NULL, 1, 'Book and Product Inquiry', 'book-and-product-inquiry', 'nia.library@nia.go.th,yaowaluk_tarn@bookdose.com', 1, 1, '2014-06-24 00:00:00', 1, '2014-06-24 00:00:00', 1),
(6, NULL, 1, 'Suggestion', 'suggestion', 'nia.library@nia.go.th,yaowaluk_tarn@bookdose.com', 3, 1, '2014-06-24 00:00:00', 1, '2014-06-24 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `copy_buyout`
--

CREATE TABLE `copy_buyout` (
  `user_aid` int(10) UNSIGNED NOT NULL,
  `copy_aid` int(10) UNSIGNED NOT NULL,
  `parent_aid` int(11) NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL,
  `product_type_cid` varchar(12) NOT NULL,
  `price` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `copy_download`
--

CREATE TABLE `copy_download` (
  `aid` int(10) UNSIGNED NOT NULL,
  `order_main_aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `copy_aid` int(10) UNSIGNED NOT NULL,
  `parent_aid` int(11) NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `product_type_cid` varchar(12) NOT NULL,
  `is_license` tinyint(1) UNSIGNED DEFAULT NULL,
  `price_cover` decimal(10,2) UNSIGNED DEFAULT NULL,
  `price_currency` varchar(12) DEFAULT NULL,
  `price_actual` decimal(10,2) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `device` varchar(12) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `channel` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1 = Website, 2 = Ipad',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `device_message`
--

CREATE TABLE `device_message` (
  `aid` int(10) UNSIGNED NOT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '0:log out , 1:still login',
  `message` text,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `device_register`
--

CREATE TABLE `device_register` (
  `device` varchar(8) NOT NULL DEFAULT '',
  `device_id` varchar(50) NOT NULL DEFAULT '',
  `device_token` varchar(255) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `receive_msg` tinyint(3) UNSIGNED NOT NULL,
  `user_owner_aid` int(10) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `event_main_aid` int(10) UNSIGNED NOT NULL,
  `event_upload_aid` int(10) UNSIGNED DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `weight` float DEFAULT '0',
  `is_public` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `is_home` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '0:Not show in homepage, 1:Show in homepage',
  `is_recommended` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_highlight` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `event_start_date` datetime NOT NULL,
  `event_end_date` datetime NOT NULL,
  `is_all_day` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `description` text,
  `ref_link` text,
  `upload_path` varchar(255) DEFAULT NULL,
  `cover_image_file_type` varchar(5) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `posted_email` varchar(255) DEFAULT NULL,
  `posted_ref` text,
  `total_view` int(10) UNSIGNED DEFAULT '0',
  `total_comment` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `total_join` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`aid`, `cid`, `user_owner_aid`, `event_main_aid`, `event_upload_aid`, `title`, `location`, `weight`, `is_public`, `is_home`, `is_recommended`, `is_highlight`, `event_start_date`, `event_end_date`, `is_all_day`, `description`, `ref_link`, `upload_path`, `cover_image_file_type`, `category`, `status`, `posted_by`, `posted_email`, `posted_ref`, `total_view`, `total_comment`, `total_join`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 'hTKnaEiQQ1TQ', 1, 1, 0, 'ว่ายน้ำกันมั้ย', 'สระแถวออฟฟิศ', 0, 0, 1, 0, 0, '2014-11-21 18:00:00', '2014-11-21 20:00:00', 0, 'dfdfdfdfdfd<br>', '', 'uploads/eastwater/event/2014/11/hTKnaEiQQ1TQ/', NULL, '', 1, 1, '0', '0', 0, 0, 0, '2014-09-27 08:01:47', 1, '2014-11-09 01:12:37', 8),
(2, '8qHR0177gPMw', 1, 1, 0, 'งานสัมมนา เรื่องการใช้น้ำอย่างรู้คุณค่า ใช้น้ำอย่างประหยัด', 'สำนักงาน 2 ศูนย์ 2', 0, 0, 1, 0, 0, '2014-11-16 09:00:00', '2014-11-16 18:00:00', 0, '', '', 'uploads/eastwater/event/2014/11/8qHR0177gPMw/', NULL, ',1,', 1, 8, '0', '0', 1, 0, 3, '2014-09-27 11:49:19', 8, '2014-11-05 04:25:22', 8),
(3, 'Xhf8cxpqKP6e', 1, 1, 0, 'Sugar is Slowly Killing You: 4 Clever and Healthy Ways to Replace Sugar', 'ศูนย์ประชุมแห่งชาติสิริกิตย์', 0, 0, 1, 0, 0, '2014-10-27 00:00:00', '2014-10-28 00:00:00', 1, '<p style="margin: 0px 0px 18px; font-size: 19px; font-weight: 300; line-height: 34px; letter-spacing: 0.008rem; color: rgb(87, 87, 86); font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, San-serif; font-style: normal; font-variant: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Sugar is the cocaine of the food world.</p><p style="margin: 0px 0px 18px; font-size: 19px; font-weight: 300; line-height: 34px; letter-spacing: 0.008rem; color: rgb(87, 87, 86); font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, San-serif; font-style: normal; font-variant: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">How’s that for an opening?</p><p style="margin: 0px 0px 18px; font-size: 19px; font-weight: 300; line-height: 34px; letter-spacing: 0.008rem; color: rgb(87, 87, 86); font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, San-serif; font-style: normal; font-variant: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">When you look at the detrimental effects that sugar has on our bodies and the terrible impact it has on our health, it’s not hard to look at it as similar&nbsp;to another white, purified extraction.</p><p style="margin: 0px 0px 18px; font-size: 19px; font-weight: 300; line-height: 34px; letter-spacing: 0.008rem; color: rgb(87, 87, 86); font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, San-serif; font-style: normal; font-variant: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">If there was an absolute number one nutrition tip I could give you, and a lot of others would agree, it would be&nbsp;to remove or drastically reduce refined sugar consumption.</p><h2 style="margin: 40px 0px 12px; font-family: \'Droid Serif\', Georgia, Serif; font-weight: 700; line-height: 40px; color: rgb(53, 53, 53); text-rendering: optimizelegibility; font-size: 28px; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Why is sugar so bad?</h2><p style="margin: 0px 0px 18px; font-size: 19px; font-weight: 300; line-height: 34px; letter-spacing: 0.008rem; color: rgb(87, 87, 86); font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, San-serif; font-style: normal; font-variant: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">When consumed, refined sugar leads to spikes in blood sugar and releases of insulin by the pancreas. Unless there is some physical activity coming up, the sugar needs to be stored somewhere as a backup energy source.</p><p style="margin: 0px 0px 18px; font-size: 19px; font-weight: 300; line-height: 34px; letter-spacing: 0.008rem; color: rgb(87, 87, 86); font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, San-serif; font-style: normal; font-variant: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">That is essentially what fat is; it is a reserve fuel tank. Insulin is known as the fat producing and storing hormone. The sugar that is consumed ends up being stored as fat and, over time, can lead to obesity.</p><p style="margin: 0px 0px 18px; font-size: 19px; font-weight: 300; line-height: 34px; letter-spacing: 0.008rem; color: rgb(87, 87, 86); font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, San-serif; font-style: normal; font-variant: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Consistent sugar intake creates insulin resistance in the body. The pancreas gets used to pumping out so much insulin that it becomes resistant to insulin, and now you’re looking at developing type 2 diabetes.</p><p style="margin: 0px 0px 18px; font-size: 19px; font-weight: 300; line-height: 34px; letter-spacing: 0.008rem; color: rgb(87, 87, 86); font-family: Roboto, \'Helvetica Neue\', Helvetica, Arial, San-serif; font-style: normal; font-variant: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Side note: Type 2 diabetes was always known as adult onset diabetes, but with it showing up so much in teens and even pre-teens, it is now classified as type 2 diabetes.</p>', '', 'uploads/eastwater/event/2014/10/Xhf8cxpqKP6e/', NULL, ',2,', 1, 8, '0', '0', 9, 0, 1, '2014-10-13 16:37:42', 8, '2014-10-14 22:50:11', 8),
(4, 'P9DPhxgWQVXn', 1, 1, 0, 'From Entrepreneur to Thought Leader', '', 0, 0, 1, 0, 0, '2014-10-30 08:00:00', '2014-10-31 17:00:00', 0, '<span style="color: rgb(51, 51, 51); font-family: sans-serif; font-size: 15.4545450210571px; line-height: 21.8181819915772px;">Do you have what it takes to be a thought leader in your industry?</span><br>', 'http://www.inc.com/john-rampton/from-entrepreneur-to-thought-leader-do-you-have-what-it-takes.html', 'uploads/eastwater/event/2014/10/P9DPhxgWQVXn/', NULL, ',2,', 1, 8, '0', '0', 4, 0, 2, '2014-10-13 20:42:40', 8, '2014-10-14 23:17:49', 8),
(5, 'Ixa9czRo97hS', 1, 1, 0, 'Karaoke Party for MamiPunPun', 'Super Ke ', 0, 0, 1, 1, 1, '2014-10-21 18:00:00', '2014-10-21 23:30:00', 0, 'จัดไปคนละ 2 เพลง แบบ The Voice', '', 'uploads/eastwater/event/2014/10/Ixa9czRo97hS/', '.jpg', ',2,', 1, 9, '0', '0', 1, 0, 0, '2014-10-16 17:52:59', 9, '2014-10-16 17:52:59', 9),
(6, '4Rwk7Dg0Iaz8', 1, 1, 0, 'EastWater project progress meeting', 'Bookdose Office', 0, 0, 1, 0, 0, '2014-11-18 13:00:00', '2014-11-18 15:00:00', 0, '<ol><li><span style="line-height: 1.428571429;">Update project progress</span></li><li><span style="line-height: 1.428571429;">Follow up the remaining tasks</span><br></li><li><span style="line-height: 1.428571429;">Follow up the remaining issues in mydonedone.com</span></li></ol>', '', 'uploads/eastwater/event/2014/11/4Rwk7Dg0Iaz8/', NULL, ',1,2,', 1, 8, '0', '0', 5, 0, 0, '2014-10-25 01:20:48', 8, '2014-11-09 01:08:12', 8),
(7, 'cWqiiEqVfcUK', 1, 1, 0, 'Bookdose project progress meeting', 'Bookdose Office', 0, 0, 1, 0, 0, '2014-11-18 10:00:00', '2014-11-18 13:00:00', 0, '', '', 'uploads/eastwater/event/2014/11/cWqiiEqVfcUK/', NULL, ',1,2,', 1, 8, '0', '0', 11, 0, 0, '2014-10-25 01:21:45', 8, '2014-11-09 01:07:50', 8),
(8, 'bHJrAlewJBWZ', 1, 1, 0, '  อีสท์วอเตอร์  โดย ยูยู บริษัทในเครือ เดินหน้าขยายธุรกิจประปา ล่าสุดจับมือเทศบาลตำบลหัวรอ จ.พิษณุโลก ผลิตน้ำประปาแก้ปัญหาขาดแคลนน้ำ', 'เทศบาลตำบลหัวรอ อ.เมือง จ.พิษณุโลก', 0, 0, 1, 1, 1, '2014-11-04 09:00:00', '2014-11-04 11:00:00', 0, '<p align="left" style="color: rgb(102, 102, 102); font-family: Tahoma, Arial, Helvetica; line-height: normal;"><font size="4">&nbsp;บริษัท ยูนิเวอร์แซล ยูทีลิตี้ส์ จำกัด หรือ ยูยู บริษัทในเครือ บริษัท จัดการและพัฒนาทรัพยากรน้ำภาคตะวันออก จำกัด (มหาชน)&nbsp; หรือ อีสท์วอเตอร์&nbsp; ลงนามสัญญาซื้อขายน้ำประปาในเขตเทศบาลตำบลหัวรอ&nbsp; อำเภอเมือง&nbsp; จังหวัดพิษณุโลก&nbsp; ระหว่าง&nbsp; บริษัท ยูนิเวอร์แซล ยูทีลิตี้ส์ จำกัด หรือยูยู&nbsp; และ เทศบาลตำบลหัวรอ&nbsp; อ.เมือง จ.พิษณุโลก โดยลงทุนก่อสร้างระบบผลิตน้ำประปา วางท่อส่งน้ำประปา และดำเนินการผลิตน้ำประปาส่งไปยังสถานีจ่ายน้ำประปาของทางเทศบาล&nbsp; คาดผลิตน้ำประปาได้วันละ 7,200 ลบ.ม. ต่อวัน เพื่อบริการน้ำประปาให้กับชุมชนในเขตเทศบาลตำบลหัวรอได้ถึง 10,000 ครัวเรือน ช่วยยกระดับความเป็นอยู่ และคุณภาพชีวิตของประชาชนในเขตเทศบาลตำบลหัวรอ ให้มีน้ำประปาใช้อย่างเพียงพอ สะอาด และได้มาตรฐาน</font></p><p style="color: rgb(102, 102, 102); font-family: Tahoma, Arial, Helvetica; line-height: normal; text-align: -webkit-center;"></p><p align="left" style="color: rgb(102, 102, 102); font-family: Tahoma, Arial, Helvetica; line-height: normal; text-align: justify;"><font size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;บริษัท ยูนิเวอร์แซล ยูทีลิตี้ส์ จำกัด หรือ (ยูยู) บริษัทในเครือ บริษัท จัดการและพัฒนาทรัพยากรน้ำภาคตะวันออก จำกัด (มหาชน) หรืออีสท์วอเตอร์&nbsp; ซึ่งดำเนินธุรกิจการบริหารกิจการประปาแบบครบวงจร ครอบคลุมถึงระบบผลิตและจำหน่ายน้ำประปา ตลอดจนงานบริการผู้ใช้น้ำ&nbsp;อาทิ&nbsp;การอ่านมาตรวัดน้ำ&nbsp;และจัดเก็บค่าน้ำประปา&nbsp;เป็นต้น&nbsp;โดยบริษัท ยูยู มีผลงานและประสบการณ์ในการได้รับโครงการสัมปทานประปากว่า 10 โครงการ&nbsp;&nbsp;ล่าสุดเดินหน้าขยายธุรกิจบริหารกิจการประปาให้กับเทศบาลตำบลหัวรอ&nbsp;อ.เมือง จ.พิษณุโลก&nbsp;โดยเมื่อเร็วๆ นี้ ได้มีการลงนามในสัญญาซื้อขายน้ำประปาในเขตเทศบาลตำบลหัวรอ&nbsp;ซึ่งทางยูยู จะเป็นผู้ลงทุนก่อสร้างระบบผลิต&nbsp;วางท่อส่งน้ำ&nbsp; และดำเนินการผลิตน้ำประปาส่งไปยังสถานีจ่ายน้ำประปาของทางเทศบาล&nbsp;ตลอดจนดูแล ควบคุม&nbsp;และบำรุงรักษาระบบผลิตน้ำประปาให้ได้คุณภาพมาตรฐานของการประปาส่วนภูมิภาค&nbsp;&nbsp; ระยะเวลาของสัญญา&nbsp; 30 ปี โดยมีปริมาณน้ำซื้อขายขั้นต่ำ ในปีที่ 1-3 ปริมาณ 6,000 ลบ.ม.ต่อวัน&nbsp;และ ปีที่ 4-30 ปริมาณ 10,000 ลบ.ม.ต่อวัน&nbsp;&nbsp;&nbsp;&nbsp;</font></p><p style="color: rgb(102, 102, 102); font-family: Tahoma, Arial, Helvetica; line-height: normal; text-align: justify;"><font size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;โครงการผลิตน้ำประปาเพื่อจำหน่ายให้กับเทศบาลตำบลหัวรอ อ.เมือง จ.พิษณุโลก มีแนวคิดมาจากเทศบาลตำบลหัวรอเน้นจะให้บริการน้ำประปาเองในราคาค่าน้ำประปาที่เหมาะสม โดยปัจจุบันเทศบาลตำบลหัวรอมีการบริหารจัดการระบบผลิตและจ่ายน้ำประปาโดยคณะกรรมการหมู่บ้าน การประปาเทศบาลนครพิษณุโลก และการประปาส่วนภูมิภาค</font></p><p style="color: rgb(102, 102, 102); font-family: Tahoma, Arial, Helvetica; line-height: normal; text-align: justify;"><font size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;สำหรับโครงการนี้&nbsp;ยูยู ใช้เงินลงทุนในโครงการก่อสร้างระบบผลิตและวางท่อจ่ายน้ำประปาทั้งสิ้น&nbsp;82&nbsp;ล้านบาท มีพื้นที่ให้บริการน้ำประปาบริการให้กับชุมชนในเขตเทศบาลตำบลหัวรอ อ.เมือง จ.พิษณุโลก&nbsp; ประมาณ 10,000 ครัวเรือน&nbsp; โดยมีความต้องการใช้น้ำในปัจจุบัน ประมาณ&nbsp; 6,500&nbsp; ลบ.ม.ต่อวัน&nbsp; และในอีก 30 ปีข้างหน้า&nbsp; ประมาณ 17,000 ลบ.ม.ต่อวัน&nbsp; ที่ผ่านมาชุมชนในเขตเทศบาลตำบลหัวรอมีการใช้น้ำจากระบบผลิตน้ำประปาหมู่บ้านของแต่ละหมู่บ้าน ซึ่งไม่เพียงพอ และคุณภาพไม่ได้มาตรฐาน โดยประโยชน์ที่ได้รับร่วมกันในครั้งนี้คือ การยกระดับความเป็นอยู่ และคุณภาพชีวิตของประชาชนเทศบาลตำบลหัวรอ ให้มีน้ำประปาใช้อย่างเพียงพอ สะอาด และได้มาตรฐาน</font></p><p style="color: rgb(102, 102, 102); font-family: Tahoma, Arial, Helvetica; line-height: normal; text-align: justify;"><font size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ด้านระบบผลิตน้ำประปา จะประกอบไปด้วย&nbsp; สถานีสูบน้ำดิบ และ สถานีผลิตน้ำประปา&nbsp; โดยแหล่งน้ำดิบที่ใช้ในการผลิตน้ำประปาจะสูบจากแม่น้ำน่าน&nbsp; ซึ่งมีปริมาณน้ำท่าเฉลี่ย 7,400 ล้านลบ.ม. ต่อปี&nbsp; (ข้อมูลจากกรมชลประทาน)&nbsp; ซึ่งเป็นแหล่งน้ำดิบที่มีคุณภาพและปริมาณที่เพียงพอต่อความต้องการใช้น้ำของเทศบาลตำบลหัวรอ&nbsp;&nbsp;เนื่องจากระดับน้ำในแม่น้ำน่านในช่วงฤดูฝนและฤดูแล้งมีความแตกต่างกันประมาณ 20 เมตร&nbsp; ดังนั้นสถานีสูบน้ำดิบจึงใช้แบบแพลอย และเครื่องสูบน้ำดิบชนิดหอยโข่ง&nbsp; สำหรับสถานีผลิตน้ำประปาเป็นระบบผลิตน้ำประปาแบบ Mobile Plant&nbsp;&nbsp;สำหรับระบบท่อส่งน้ำประปาจะลงทุนวางท่อส่งน้ำประปาไปยังสถานีจ่ายน้ำเดิมของเทศบาลตำบลหัวรอ&nbsp;&nbsp; และมีแผนที่จะขยายการลงทุนวางท่อส่งน้ำเพิ่มเติมเพื่อให้ครอบคลุมทุกพื้นที่ต่อไป</font></p><p align="left" style="color: rgb(102, 102, 102); font-family: Tahoma, Arial, Helvetica; line-height: normal;"><font size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ข้อมูลทั่วไปของเทศบาลตำบลหัวรอ ตั้งอยู่ในเขตอำเภอเมือง จังหวัดพิษณุโลก&nbsp; อยู่ทางทิศเหนือของจังหวัด มีเนื้อที่ประมาณ 88.80 ตารางกิโลเมตร หรือประมาณ 55,500 ไร่&nbsp; มีจำนวนประชากรรวม 21,289 คน จำนวนครัวเรือน 9,637 ครัวเรือน โดยมีความต้องการใช้น้ำประปาในปี 2557&nbsp; ประมาณ&nbsp; 8,600 &nbsp;ลบ.ม.ต่อวัน หากคิดพื้นที่บริการ 70% จะทำให้มีความต้องการใช้น้ำเฉลี่ยประมาณ 6,000 ลบ.ม.ต่อวัน&nbsp; ปัจจุบันเทศบาลตำบลหัวรอมีสถานีผลิตน้ำประปาหมู่บ้านทั้งหมด 7 แห่ง กำลังผลิตรวม 3,120 ลบ.ม.ต่อวัน</font></p><p align="left" style="color: rgb(102, 102, 102); font-family: Tahoma, Arial, Helvetica; line-height: normal;"><font size="4"><br></font></p><p align="left" style="color: rgb(102, 102, 102); font-family: Tahoma, Arial, Helvetica; line-height: normal;"><font size="4"><br></font></p><p align="left" style="text-align: right; color: rgb(102, 102, 102); font-family: Tahoma, Arial, Helvetica; line-height: normal;"><img src="http://www.eastwater.com/Portals/0/EWG%20News/2557/May/IMG_1164.JPG" alt="" align="none"><img src="http://www.eastwater.com/Portals/0/EWG%20News/2557/May/IMG_1182.JPG" style="color: rgb(121, 121, 121); font-family: \'Open Sans\', sans-serif; font-size: 13px; line-height: 1.428571429;" alt="" align="none"><font size="4"><br></font></p>', '', 'uploads/eastwater/event/2014/11/bHJrAlewJBWZ/', '.JPG', ',3,', 1, 9, '0', '0', 8, 0, 0, '2014-11-04 15:41:13', 9, '2014-11-04 15:43:37', 9),
(9, '6jDJ9LFEsFp8', 1, 1, 0, 'ลอยลอยกระทงกันเต๊อะะะะ', 'สะพานพระราม 8', 0, 0, 1, 0, 0, '2014-11-14 19:00:00', '2014-11-14 22:00:00', 0, '', '', 'uploads/eastwater/event/2014/11/6jDJ9LFEsFp8/', NULL, ',3,', 1, 8, '0', '0', 0, 0, 0, '2014-11-06 22:53:00', 8, '2014-11-09 01:06:58', 8),
(12, 'UCvE1HP42CnP', 1, 1, 0, 'การประกวด InnoWAVE Project#3   รอบชิงชนะเลิศ', 'ห้องอบรมชั้น 26', 0, 0, 1, 0, 1, '2014-12-18 09:00:00', '2014-12-18 17:00:00', 0, '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="http://ewg-ic.eastwater.com/uploads/eastwater/userfiles/LOGO%20InnoWAVE%203.png" alt="" width="416" height="360" /></p>\n<h1 style="text-align: center;">การประกวด InnoWAVE Project#3 รอบชิงชนะเลิศ</h1>\n<h1 style="text-align: center;">ห้องอบรมชั้น 26 อาคารอีสท์วอเตอร์</h1>\n<h1 style="text-align: center;">เวลา 9.00-17.00น.</h1>\n<p>&nbsp;</p>', '', 'uploads/eastwater/event/2014/12/UCvE1HP42CnP/', NULL, ',4,', 1, 24, '0', '0', 20, 0, 0, '2014-12-11 10:40:59', 24, '2014-12-19 13:12:25', 13),
(35, 'i0dckyMDSAw2', 1, 1, 0, 'กำหนดการส่งสวัสดิการ พ.ค.58', '', 0, 1, 1, 1, 1, '2015-05-12 00:00:00', '2015-05-12 00:00:00', 0, '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="http://ewg-ic.eastwater.com/uploads/eastwater/userfiles/HR%20Calendar.jpg" alt="" width="525" height="394" /></p>', '', 'uploads/eastwater/event/2015/05/i0dckyMDSAw2/', NULL, ',4,', 1, 17, NULL, NULL, 53, 0, 1, '2015-01-20 13:58:31', 17, '2015-05-11 10:46:08', 457),
(53, '96u3ALlt0YQZ', 1, 1, 0, 'P-EX04 การจัดทำ Work System', 'ห้องอบรมชั้น 26', 0, 1, 1, 1, 1, '2015-03-12 09:00:00', '2015-03-13 16:00:00', 0, '', '', 'uploads/eastwater/event/2015/03/96u3ALlt0YQZ/', '.JPG', ',6,', 1, 24, NULL, NULL, 32, 0, 1, '2015-02-23 10:59:09', 24, '2015-02-23 12:47:44', 17),
(39, 'PEQ0AvXWHgV7', 1, 1, 0, 'คณะกรรมการบริษัทสวัสดีปีใหม่ ', 'จ.ระยอง และ จ.ชลบุรี', 0, 1, 1, 0, 0, '2015-01-20 00:00:00', '2015-01-21 00:00:00', 0, '', '', 'uploads/eastwater/event/2015/01/PEQ0AvXWHgV7/', NULL, '', 1, 17, NULL, NULL, 5, 0, 0, '2015-01-20 15:30:54', 17, '2015-01-20 15:31:11', 17),
(54, 'IbuHyXFSbzXH', 1, 1, 0, 'ปฐมนิเทศพนักงานใหม่ ครั้งที่ 1/2558', 'พื้นที่ปฏิบัติการ ', 0, 1, 1, 1, 1, '2015-03-26 09:00:00', '2015-03-27 16:00:00', 0, '<p>ปฐมนิเทศพนักงานใหม่ ครั้งที่ 1/2558</p>', '', 'uploads/eastwater/event/2015/03/IbuHyXFSbzXH/', '.JPG', ',6,', 1, 24, NULL, NULL, 48, 0, 1, '2015-02-23 11:12:51', 24, '2015-03-31 17:32:18', 427),
(44, 'h7kh4Wulfd9g', 1, 1, 0, 'กำหนดส่งสวัสดิการ มี.ค. 58', '', 0, 1, 1, 0, 0, '2015-03-12 08:30:00', '2015-03-12 17:30:00', 0, '', '', 'uploads/eastwater/event/2015/03/h7kh4Wulfd9g/', '.jpg', ',4,', 1, 17, NULL, NULL, 32, 0, 1, '2015-01-22 15:22:14', 17, '2015-02-06 14:21:30', 17),
(45, 'nYyXL7qvA7YS', 1, 1, 0, 'บริจาคโลหิต ครั้งที่ 1 / 58', 'ห้องประชุมชั้น 26 อาคารอีสท์วอเตอร์', 0, 1, 1, 0, 0, '2015-01-27 08:30:00', '2015-01-27 12:00:00', 0, '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="http://ewg-ic.eastwater.com/uploads/eastwater/userfiles/%E0%B8%9A%E0%B8%A3%E0%B8%B4%E0%B8%88%E0%B8%B2%E0%B8%84%E0%B9%82%E0%B8%A5%E0%B8%AB%E0%B8%B4%E0%B8%95.JPG" alt="" width="648" height="486" /></p>', '', 'uploads/eastwater/event/2015/01/nYyXL7qvA7YS/', NULL, ',4,', 1, 17, NULL, NULL, 0, 0, 0, '2015-01-26 11:02:07', 17, '2015-01-26 11:02:07', 17),
(29, 'Zz9D8OIPWvjh', 1, 1, 0, 'EWG New Year Party 2015', 'โรงแรมรอยัลฮิลล์ กอล์ฟ รีสอร์ท แอนด์ สปา', 0, 1, 1, 0, 0, '2015-01-16 00:00:00', '2015-01-17 00:00:00', 1, '<p style="text-align: center;"><img src="http://ewg-ic.eastwater.com/uploads/eastwater/userfiles/Slide1.JPG" alt="" width="336" height="252" /><img src="http://ewg-ic.eastwater.com/uploads/eastwater/userfiles/Slide2.JPG" alt="" width="336" height="252" /><img src="http://ewg-ic.eastwater.com/uploads/eastwater/userfiles/Slide3.JPG" alt="" width="336" height="252" /><img src="http://ewg-ic.eastwater.com/uploads/eastwater/userfiles/Slide4.JPG" alt="" width="336" height="252" /><img src="http://ewg-ic.eastwater.com/uploads/eastwater/userfiles/Slide5.JPG" alt="" width="336" height="252" /><img src="http://ewg-ic.eastwater.com/uploads/eastwater/userfiles/Slide6.JPG" alt="" width="336" height="252" /><img src="http://ewg-ic.eastwater.com/uploads/eastwater/userfiles/Slide7.JPG" alt="" width="336" height="252" /><img src="http://ewg-ic.eastwater.com/uploads/eastwater/userfiles/Slide8.JPG" alt="" width="336" height="252" /><img src="http://ewg-ic.eastwater.com/uploads/eastwater/userfiles/Slide9.JPG" alt="" width="336" height="251" /></p>', '', 'uploads/eastwater/event/2015/01/Zz9D8OIPWvjh/', NULL, ',4,', 1, 17, NULL, NULL, 7, 0, 0, '2015-01-12 13:14:51', 17, '2015-01-16 13:56:16', 9),
(62, 'GNIFt725UaOg', 1, 1, 0, 'การประชุมผู้ถือหุ้นประจำปี 2557', 'สโมสรกองทัพบก ถ.วิภาวดีรังสิต', 0, 1, 1, 0, 0, '2015-04-27 13:00:00', '2015-04-27 16:00:00', 0, '', '', 'uploads/eastwater/event/2015/04/GNIFt725UaOg/', NULL, ',4,', 0, 17, NULL, NULL, 0, 0, 0, '2015-04-23 13:23:35', 17, '2015-04-24 12:07:43', 9),
(63, 'JGUl4Asx9vwX', 1, 1, 0, 'การประชุมผู้ถือหุ้นประจำปี 2557', 'สโมสรกองทัพบก ถ.วิภาวดีรังสิต', 0, 1, 1, 0, 0, '2015-04-27 13:00:00', '2015-04-27 16:00:00', 0, '', '', 'uploads/eastwater/event/2015/04/JGUl4Asx9vwX/', NULL, '', 0, 17, NULL, NULL, 0, 0, 0, '2015-04-23 13:23:45', 17, '2015-04-24 12:07:50', 9),
(64, 'xveh5Z0gUSPi', 1, 1, 0, 'การประชุมผู้ถือหุ้นประจำปี 2557', 'สโมสรกองทัพบก ถ.วิภาวดีรังสิต', 0, 1, 1, 0, 0, '2015-04-27 13:00:00', '2015-04-27 16:00:00', 0, '', '', 'uploads/eastwater/event/2015/04/xveh5Z0gUSPi/', NULL, '', 1, 17, NULL, NULL, 9, 0, 0, '2015-04-23 13:23:49', 17, '2015-04-23 13:23:49', 17),
(65, 'K8QE0RqWx1KJ', 1, 1, 0, 'บริจาคโลหิต ครั้ง 3/2558', '', 0, 1, 1, 0, 0, '2015-05-15 08:30:00', '2015-05-15 12:00:00', 0, '', '', 'uploads/eastwater/event/2015/05/K8QE0RqWx1KJ/', NULL, ',4,', 1, 17, NULL, NULL, 17, 0, 0, '2015-05-15 10:53:59', 17, '2015-05-15 10:53:59', 17),
(72, '1QLdRKgt5ZN7', 1, 1, 0, 'Test ส่ง', 'ชั้น 24', 0, 0, 1, 0, 0, '2015-05-15 17:00:00', '2015-05-16 18:00:00', 0, '', '', 'uploads/eastwater/event/2015/05/1QLdRKgt5ZN7/', NULL, ',6,', 1, 22, NULL, NULL, 1, 0, 0, '2015-05-15 17:21:17', 22, '2015-05-15 17:48:44', 22),
(56, 'gFxgXu8ghdsx', 1, 1, 0, 'Project Implementation & Contract Management', 'ห้องอบรมชั้น 26', 0, 1, 1, 1, 1, '2015-03-31 09:30:00', '2015-03-31 16:30:00', 0, '', '', 'uploads/eastwater/event/2015/03/gFxgXu8ghdsx/', '.JPG', ',6,', 1, 24, NULL, NULL, 25, 0, 1, '2015-02-23 11:15:14', 24, '2015-02-23 12:47:31', 17),
(57, 'RCSj6HsCXBzW', 1, 1, 0, 'งานทำบุญเนื่องในวันมาฆบูชา', 'โถงชั้น 1 อาคารอีสท์วอเตอร์', 0, 1, 1, 0, 0, '2015-03-03 08:30:00', '2015-03-03 09:30:00', 0, '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="http://ewg-ic.eastwater.com/uploads/eastwater/userfiles/P3.jpg" alt="" width="630" height="354" /></p>\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="http://ewg-ic.eastwater.com/uploads/eastwater/userfiles/P4.jpg" alt="" width="630" height="354" /></p>', '', 'uploads/eastwater/event/2015/03/RCSj6HsCXBzW/', NULL, '', 1, 32, NULL, NULL, 19, 0, 3, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(75, 'fFwf7iscEV5I', 1, 1, 0, 'Test ', '', 0, 0, 1, 0, 0, '2015-12-07 08:00:00', '2015-12-07 09:00:00', 0, '', '', 'uploads/eastwater/event/2015/12/fFwf7iscEV5I/', NULL, '', 1, 9, NULL, NULL, 1, 0, 0, '2015-12-08 10:53:15', 9, '2015-12-08 10:53:15', 9),
(76, 'IOUxJDhQPlwD', 1, 1, 0, 'วธ.เปิด \'ศูนย์วัฒนธรรมอาเซียน\' ด้านวัฒนธรรมที่มีชีวิตแห่งแรกในอาเซียน', '495', 0, 0, 1, 0, 0, '2016-07-08 00:00:00', '2016-07-08 00:00:00', 1, '', '', 'uploads/eastwater/event/2016/07/IOUxJDhQPlwD/', NULL, ',6,', 1, 16, NULL, NULL, 3, 0, 1, '2016-07-06 12:00:03', 16, '2016-07-06 12:00:03', 16),
(77, '1qE8lHYKohG5', 1, 1, 0, 'ประชุมประจำปี', '', 0, 0, 1, 0, 0, '2017-01-01 00:00:00', '2017-01-01 00:00:00', 1, '<p><img src="http://eastwater.belibs.com/uploads/eastwater/userfiles/thai-food-health.jpg" alt="" width="370" height="276" /></p>', '', 'uploads/eastwater/event/2017/01/1qE8lHYKohG5/', NULL, ',4,', 1, 16, NULL, NULL, 0, 0, 0, '2016-10-28 15:39:51', 16, '2016-10-28 15:39:51', 16),
(78, '29vksXUn10vx', 1, 1, 0, 'test', '', 0, 0, 1, 0, 0, '2016-10-31 00:00:00', '2016-10-31 00:00:00', 1, '', '', 'uploads/eastwater/event/2016/10/29vksXUn10vx/', NULL, ',4,', 1, 16, NULL, NULL, 0, 0, 0, '2016-10-28 15:48:00', 16, '2016-10-28 15:48:00', 16),
(79, 'QfC0bN9i8IQZ', 1, 1, 0, 'test', '', 0, 0, 1, 0, 0, '2016-11-10 00:00:00', '2016-11-10 00:00:00', 1, '<p>1111</p>', '', 'uploads/eastwater/event/2016/11/QfC0bN9i8IQZ/', NULL, ',4,', 1, 16, NULL, NULL, 0, 0, 0, '2016-10-28 16:17:08', 16, '2016-10-28 16:17:08', 16),
(80, 'NEG2zjU7Aibh', 1, 1, 0, 'test d', '', 0, 0, 1, 0, 0, '2016-12-21 00:00:00', '2016-12-21 00:00:00', 1, '<p>d665785678578585768</p>', '', 'uploads/eastwater/event/2016/12/NEG2zjU7Aibh/', NULL, ',4,', 1, 16, NULL, NULL, 0, 0, 0, '2016-10-28 16:18:00', 16, '2016-10-28 16:18:00', 16),
(81, 'Gqeu8uQsPzhX', 1, 1, 0, 'Bookdose เปิดตัวเข้าหลักทรัพย์วันแรก', '', 0, 1, 1, 1, 1, '2017-04-18 00:00:00', '2017-04-19 00:00:00', 0, '<p>Bookdose เปิดตัวเข้าหลักทรัพย์วันแรก</p>\r\n<p>&nbsp;</p>', '', 'uploads/dip/event/2017/04/Gqeu8uQsPzhX/', '.jpg', ',6,5,4,', 1, 1, NULL, NULL, 6, 0, 0, '2017-04-18 14:45:38', 1, '2017-04-18 14:50:54', 1),
(82, 'fMbXwF9T7UH0', 1, 1, 0, 'Bookdose เปิดตัวเข้าหลักทรัพย์วันแรก', 'Head Office', 0, 1, 1, 1, 1, '2017-04-24 00:00:00', '2017-04-30 00:00:00', 0, '<p>hhhhhhhhhhhhhhhhh</p>\r\n<p>hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh</p>', '', 'uploads/dip/event/2017/04/fMbXwF9T7UH0/', '.jpg', ',6,5,4,', 1, 1, NULL, NULL, 2, 0, 0, '2017-04-24 10:35:10', 1, '2017-04-24 10:35:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `event_category`
--

CREATE TABLE `event_category` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `event_main_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(24) NOT NULL,
  `weight` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event_category`
--

INSERT INTO `event_category` (`aid`, `cid`, `user_owner_aid`, `event_main_aid`, `name`, `url`, `weight`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(6, NULL, 1, 1, 'Training', 'training', 0, 1, '2014-12-18 16:33:29', 17, '2017-03-23 11:22:09', 1),
(5, NULL, 1, 1, 'CSR Activity', 'csr-activity', 0, 1, '2014-11-20 14:40:56', 17, '2014-11-20 14:40:56', 17),
(4, NULL, 1, 1, 'HR Activity', 'hr-activity', 0, 1, '2014-11-20 14:40:47', 17, '2014-11-20 14:40:47', 17);

-- --------------------------------------------------------

--
-- Table structure for table `event_comment`
--

CREATE TABLE `event_comment` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `parent_event_aid` int(10) UNSIGNED NOT NULL,
  `parent_comment_aid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `total_wow` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED DEFAULT '1',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_comment_user_activity`
--

CREATE TABLE `event_comment_user_activity` (
  `event_comment_aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `status_wow` tinyint(1) UNSIGNED DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_gallery`
--

CREATE TABLE `event_gallery` (
  `aid` int(10) UNSIGNED NOT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `event_aid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `file_name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `weight` float DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_main`
--

CREATE TABLE `event_main` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(24) NOT NULL,
  `weight` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event_main`
--

INSERT INTO `event_main` (`aid`, `cid`, `user_owner_aid`, `name`, `url`, `weight`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, NULL, 1, 'Events', 'event', 0, 1, '2014-09-25 06:42:11', 8, '2017-04-18 14:52:16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `event_upload`
--

CREATE TABLE `event_upload` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `event_main_aid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `description` text,
  `ref_link` text,
  `upload_path` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `cover_image_file_type` varchar(5) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `posted_by` int(11) UNSIGNED DEFAULT NULL,
  `posted_email` varchar(255) DEFAULT NULL,
  `posted_ref` text,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_user_activity_join`
--

CREATE TABLE `event_user_activity_join` (
  `event_aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `has_joined` tinyint(1) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event_user_activity_join`
--

INSERT INTO `event_user_activity_join` (`event_aid`, `user_aid`, `has_joined`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(2, 8, 1, '2014-10-13 21:07:21', 8, '2014-10-13 21:07:21', 8),
(2, 13, 1, '2014-10-15 17:34:18', 13, '2014-10-15 17:35:08', 13),
(3, 13, 0, '2014-10-15 17:34:50', 13, '2014-10-15 17:35:09', 13),
(2, 9, 1, '2014-10-16 17:53:58', 9, '2014-10-16 17:53:58', 9),
(3, 9, 1, '2014-10-16 17:54:00', 9, '2014-10-16 17:54:00', 9),
(4, 9, 1, '2014-10-24 10:28:06', 9, '2014-10-24 10:28:06', 9),
(4, 8, 1, '2014-10-24 19:15:14', 8, '2014-10-24 19:15:14', 8),
(9, 9, NULL, '2014-11-09 01:06:58', 8, '2014-11-09 01:06:58', 8),
(9, 8, NULL, '2014-11-09 01:06:58', 8, '2014-11-09 01:06:58', 8),
(9, 3, NULL, '2014-11-09 01:06:58', 8, '2014-11-09 01:06:58', 8),
(9, 5, NULL, '2014-11-09 01:06:58', 8, '2014-11-09 01:06:58', 8),
(9, 6, NULL, '2014-11-09 01:06:58', 8, '2014-11-09 01:06:58', 8),
(9, 4, NULL, '2014-11-09 01:06:58', 8, '2014-11-09 01:06:58', 8),
(7, 9, NULL, '2014-11-09 01:07:50', 8, '2014-11-09 01:07:50', 8),
(7, 3, NULL, '2014-11-09 01:07:50', 8, '2014-11-09 01:07:50', 8),
(7, 5, NULL, '2014-11-09 01:07:50', 8, '2014-11-09 01:07:50', 8),
(7, 6, NULL, '2014-11-09 01:07:50', 8, '2014-11-09 01:07:50', 8),
(7, 4, NULL, '2014-11-09 01:07:50', 8, '2014-11-09 01:07:50', 8),
(6, 9, NULL, '2014-11-09 01:08:00', 8, '2014-11-09 01:08:00', 8),
(6, 8, NULL, '2014-11-09 01:08:00', 8, '2014-11-09 01:08:00', 8),
(1, 9, NULL, '2014-11-09 01:09:27', 8, '2014-11-09 01:09:27', 8),
(1, 8, NULL, '2014-11-09 01:09:27', 8, '2014-11-09 01:09:27', 8),
(1, 3, NULL, '2014-11-09 01:09:27', 8, '2014-11-09 01:09:27', 8),
(1, 5, NULL, '2014-11-09 01:09:27', 8, '2014-11-09 01:09:27', 8),
(1, 6, NULL, '2014-11-09 01:09:27', 8, '2014-11-09 01:09:27', 8),
(1, 4, NULL, '2014-11-09 01:09:27', 8, '2014-11-09 01:09:27', 8),
(10, 15, NULL, '2014-12-11 10:38:01', 18, '2014-12-11 10:38:01', 18),
(10, 11, 1, '2014-12-11 10:38:01', 18, '2014-12-22 09:58:22', 11),
(10, 13, NULL, '2014-12-11 10:38:01', 18, '2014-12-11 10:38:01', 18),
(11, 15, NULL, '2014-12-11 10:39:43', 35, '2014-12-11 10:39:43', 35),
(11, 11, NULL, '2014-12-11 10:39:43', 35, '2014-12-11 10:39:43', 35),
(11, 13, NULL, '2014-12-11 10:39:43', 35, '2014-12-11 10:39:43', 35),
(12, 9, NULL, '2014-12-11 11:19:44', 24, '2014-12-11 11:19:44', 24),
(12, 15, NULL, '2014-12-11 11:19:44', 24, '2014-12-11 11:19:44', 24),
(12, 11, NULL, '2014-12-11 11:19:44', 24, '2014-12-11 11:19:44', 24),
(12, 13, NULL, '2014-12-11 11:19:44', 24, '2014-12-11 11:19:44', 24),
(12, 12, NULL, '2014-12-11 11:19:44', 24, '2014-12-11 11:19:44', 24),
(10, 9, 1, '2014-12-22 10:19:09', 13, '2014-12-22 10:19:48', 9),
(12, 8, NULL, '2014-12-11 11:19:44', 24, '2014-12-11 11:19:44', 24),
(12, 3, NULL, '2014-12-11 11:19:44', 24, '2014-12-11 11:19:44', 24),
(15, 15, NULL, '2014-12-25 17:47:34', 13, '2014-12-25 17:47:34', 13),
(12, 6, NULL, '2014-12-11 11:19:44', 24, '2014-12-11 11:19:44', 24),
(15, 12, NULL, '2014-12-25 17:47:34', 13, '2014-12-25 17:47:34', 13),
(13, 13, 1, '2014-12-19 13:12:05', 13, '2014-12-19 13:39:45', 13),
(13, 9, NULL, '2014-12-19 13:12:05', 13, '2014-12-19 13:12:05', 13),
(15, 11, NULL, '2014-12-25 17:47:34', 13, '2014-12-25 17:47:34', 13),
(15, 13, NULL, '2014-12-25 17:47:34', 13, '2014-12-25 17:47:34', 13),
(15, 9, NULL, '2014-12-25 17:47:34', 13, '2014-12-25 17:47:34', 13),
(15, 8, NULL, '2014-12-25 17:47:34', 13, '2014-12-25 17:47:34', 13),
(15, 3, NULL, '2014-12-25 17:47:34', 13, '2014-12-25 17:47:34', 13),
(15, 6, NULL, '2014-12-25 17:47:34', 13, '2014-12-25 17:47:34', 13),
(18, 15, NULL, '2015-01-05 11:56:47', 9, '2015-01-05 11:56:47', 9),
(19, 12, NULL, '2015-01-07 10:46:49', 16, '2015-01-07 10:46:49', 16),
(18, 11, NULL, '2015-01-05 11:56:47', 9, '2015-01-05 11:56:47', 9),
(19, 15, NULL, '2015-01-07 10:46:49', 16, '2015-01-07 10:46:49', 16),
(18, 9, NULL, '2015-01-05 11:56:47', 9, '2015-01-05 11:56:47', 9),
(18, 8, NULL, '2015-01-05 11:56:47', 9, '2015-01-05 11:56:47', 9),
(18, 3, NULL, '2015-01-05 11:56:47', 9, '2015-01-05 11:56:47', 9),
(18, 6, NULL, '2015-01-05 11:56:47', 9, '2015-01-05 11:56:47', 9),
(19, 11, NULL, '2015-01-07 10:46:49', 16, '2015-01-07 10:46:49', 16),
(19, 13, NULL, '2015-01-07 10:46:49', 16, '2015-01-07 10:46:49', 16),
(19, 9, NULL, '2015-01-07 10:46:49', 16, '2015-01-07 10:46:49', 16),
(19, 8, NULL, '2015-01-07 10:46:49', 16, '2015-01-07 10:46:49', 16),
(19, 3, NULL, '2015-01-07 10:46:49', 16, '2015-01-07 10:46:49', 16),
(19, 6, NULL, '2015-01-07 10:46:49', 16, '2015-01-07 10:46:49', 16),
(20, 15, NULL, '2015-01-07 12:47:36', 16, '2015-01-07 12:47:36', 16),
(20, 12, NULL, '2015-01-07 12:47:36', 16, '2015-01-07 12:47:36', 16),
(20, 11, NULL, '2015-01-07 12:47:36', 16, '2015-01-07 12:47:36', 16),
(20, 13, NULL, '2015-01-07 12:47:36', 16, '2015-01-07 12:47:36', 16),
(20, 9, NULL, '2015-01-07 12:47:36', 16, '2015-01-07 12:47:36', 16),
(20, 8, NULL, '2015-01-07 12:47:36', 16, '2015-01-07 12:47:36', 16),
(20, 3, NULL, '2015-01-07 12:47:36', 16, '2015-01-07 12:47:36', 16),
(20, 6, NULL, '2015-01-07 12:47:36', 16, '2015-01-07 12:47:36', 16),
(21, 15, NULL, '2015-01-07 13:04:33', 16, '2015-01-07 13:04:33', 16),
(21, 12, NULL, '2015-01-07 13:04:33', 16, '2015-01-07 13:04:33', 16),
(21, 11, NULL, '2015-01-07 13:04:33', 16, '2015-01-07 13:04:33', 16),
(21, 13, NULL, '2015-01-07 13:04:33', 16, '2015-01-07 13:04:33', 16),
(21, 9, NULL, '2015-01-07 13:04:33', 16, '2015-01-07 13:04:33', 16),
(21, 8, NULL, '2015-01-07 13:04:33', 16, '2015-01-07 13:04:33', 16),
(21, 3, NULL, '2015-01-07 13:04:33', 16, '2015-01-07 13:04:33', 16),
(21, 6, NULL, '2015-01-07 13:04:33', 16, '2015-01-07 13:04:33', 16),
(22, 15, NULL, '2015-01-07 13:29:36', 16, '2015-01-07 13:29:36', 16),
(22, 12, NULL, '2015-01-07 13:29:36', 16, '2015-01-07 13:29:36', 16),
(22, 11, NULL, '2015-01-07 13:29:36', 16, '2015-01-07 13:29:36', 16),
(22, 13, NULL, '2015-01-07 13:29:36', 16, '2015-01-07 13:29:36', 16),
(22, 9, NULL, '2015-01-07 13:29:36', 16, '2015-01-07 13:29:36', 16),
(22, 8, NULL, '2015-01-07 13:29:36', 16, '2015-01-07 13:29:36', 16),
(22, 3, NULL, '2015-01-07 13:29:36', 16, '2015-01-07 13:29:36', 16),
(22, 6, NULL, '2015-01-07 13:29:36', 16, '2015-01-07 13:29:36', 16),
(23, 15, NULL, '2015-01-07 13:58:08', 8, '2015-01-07 13:58:08', 8),
(23, 12, NULL, '2015-01-07 13:58:08', 8, '2015-01-07 13:58:08', 8),
(23, 11, NULL, '2015-01-07 13:58:08', 8, '2015-01-07 13:58:08', 8),
(23, 13, NULL, '2015-01-07 13:58:08', 8, '2015-01-07 13:58:08', 8),
(23, 9, NULL, '2015-01-07 13:58:08', 8, '2015-01-07 13:58:08', 8),
(23, 8, NULL, '2015-01-07 13:58:08', 8, '2015-01-07 13:58:08', 8),
(23, 3, NULL, '2015-01-07 13:58:08', 8, '2015-01-07 13:58:08', 8),
(23, 6, NULL, '2015-01-07 13:58:08', 8, '2015-01-07 13:58:08', 8),
(24, 15, NULL, '2015-01-07 14:49:19', 16, '2015-01-07 14:49:19', 16),
(24, 12, NULL, '2015-01-07 14:49:19', 16, '2015-01-07 14:49:19', 16),
(24, 11, NULL, '2015-01-07 14:49:19', 16, '2015-01-07 14:49:19', 16),
(24, 13, NULL, '2015-01-07 14:49:19', 16, '2015-01-07 14:49:19', 16),
(24, 9, NULL, '2015-01-07 14:49:19', 16, '2015-01-07 14:49:19', 16),
(24, 8, NULL, '2015-01-07 14:49:19', 16, '2015-01-07 14:49:19', 16),
(24, 3, NULL, '2015-01-07 14:49:19', 16, '2015-01-07 14:49:19', 16),
(24, 6, NULL, '2015-01-07 14:49:19', 16, '2015-01-07 14:49:19', 16),
(26, 15, NULL, '2015-01-07 17:31:31', 8, '2015-01-07 17:31:31', 8),
(26, 11, NULL, '2015-01-07 17:31:31', 8, '2015-01-07 17:31:31', 8),
(26, 13, NULL, '2015-01-07 17:31:31', 8, '2015-01-07 17:31:31', 8),
(26, 12, NULL, '2015-01-07 17:31:31', 8, '2015-01-07 17:31:31', 8),
(26, 9, NULL, '2015-01-07 17:31:31', 8, '2015-01-07 17:31:31', 8),
(25, 8, NULL, '2015-01-07 16:42:58', 16, '2015-01-07 16:42:58', 16),
(26, 3, NULL, '2015-01-07 17:31:31', 8, '2015-01-07 17:31:31', 8),
(26, 8, NULL, '2015-01-07 17:31:31', 8, '2015-01-07 17:31:31', 8),
(26, 6, NULL, '2015-01-07 17:31:31', 8, '2015-01-07 17:31:31', 8),
(25, 15, NULL, '2015-01-07 17:36:13', 16, '2015-01-07 17:36:13', 16),
(25, 12, NULL, '2015-01-07 17:36:13', 16, '2015-01-07 17:36:13', 16),
(25, 11, NULL, '2015-01-07 17:36:13', 16, '2015-01-07 17:36:13', 16),
(25, 13, NULL, '2015-01-07 17:36:13', 16, '2015-01-07 17:36:13', 16),
(25, 9, NULL, '2015-01-07 17:36:13', 16, '2015-01-07 17:36:13', 16),
(25, 3, NULL, '2015-01-07 17:36:13', 16, '2015-01-07 17:36:13', 16),
(25, 6, NULL, '2015-01-07 17:36:13', 16, '2015-01-07 17:36:13', 16),
(27, 15, NULL, '2015-01-07 17:48:55', 16, '2015-01-07 17:48:55', 16),
(27, 12, NULL, '2015-01-07 17:48:55', 16, '2015-01-07 17:48:55', 16),
(27, 11, NULL, '2015-01-07 17:48:55', 16, '2015-01-07 17:48:55', 16),
(27, 13, NULL, '2015-01-07 17:48:55', 16, '2015-01-07 17:48:55', 16),
(27, 9, NULL, '2015-01-07 17:48:55', 16, '2015-01-07 17:48:55', 16),
(27, 8, NULL, '2015-01-07 17:48:55', 16, '2015-01-07 17:48:55', 16),
(27, 3, NULL, '2015-01-07 17:48:55', 16, '2015-01-07 17:48:55', 16),
(27, 6, NULL, '2015-01-07 17:48:55', 16, '2015-01-07 17:48:55', 16),
(28, 15, NULL, '2015-01-07 18:18:05', 16, '2015-01-07 18:18:05', 16),
(28, 12, NULL, '2015-01-07 18:18:05', 16, '2015-01-07 18:18:05', 16),
(28, 11, NULL, '2015-01-07 18:18:05', 16, '2015-01-07 18:18:05', 16),
(28, 13, NULL, '2015-01-07 18:18:05', 16, '2015-01-07 18:18:05', 16),
(28, 9, NULL, '2015-01-07 18:18:05', 16, '2015-01-07 18:18:05', 16),
(28, 8, NULL, '2015-01-07 18:18:05', 16, '2015-01-07 18:18:05', 16),
(28, 3, NULL, '2015-01-07 18:18:05', 16, '2015-01-07 18:18:05', 16),
(28, 6, NULL, '2015-01-07 18:18:05', 16, '2015-01-07 18:18:05', 16),
(30, 15, NULL, '2015-01-12 15:09:17', 16, '2015-01-12 15:09:17', 16),
(30, 12, NULL, '2015-01-12 15:09:17', 16, '2015-01-12 15:09:17', 16),
(30, 11, NULL, '2015-01-12 15:09:17', 16, '2015-01-12 15:09:17', 16),
(30, 13, NULL, '2015-01-12 15:09:17', 16, '2015-01-12 15:09:17', 16),
(30, 9, NULL, '2015-01-12 15:09:17', 16, '2015-01-12 15:09:17', 16),
(30, 8, NULL, '2015-01-12 15:09:17', 16, '2015-01-12 15:09:17', 16),
(30, 3, NULL, '2015-01-12 15:09:17', 16, '2015-01-12 15:09:17', 16),
(30, 6, NULL, '2015-01-12 15:09:17', 16, '2015-01-12 15:09:17', 16),
(31, 15, NULL, '2015-01-12 18:32:18', 16, '2015-01-12 18:32:18', 16),
(31, 12, NULL, '2015-01-12 18:32:18', 16, '2015-01-12 18:32:18', 16),
(31, 11, NULL, '2015-01-12 18:32:18', 16, '2015-01-12 18:32:18', 16),
(31, 13, NULL, '2015-01-12 18:32:18', 16, '2015-01-12 18:32:18', 16),
(31, 9, NULL, '2015-01-12 18:32:18', 16, '2015-01-12 18:32:18', 16),
(31, 8, NULL, '2015-01-12 18:32:18', 16, '2015-01-12 18:32:18', 16),
(31, 3, NULL, '2015-01-12 18:32:18', 16, '2015-01-12 18:32:18', 16),
(31, 6, NULL, '2015-01-12 18:32:18', 16, '2015-01-12 18:32:18', 16),
(32, 8, NULL, '2015-01-12 18:40:26', 8, '2015-01-12 18:40:26', 8),
(32, 3, NULL, '2015-01-12 18:40:26', 8, '2015-01-12 18:40:26', 8),
(32, 6, NULL, '2015-01-12 18:40:26', 8, '2015-01-12 18:40:26', 8),
(33, 8, NULL, '2015-01-12 18:47:51', 8, '2015-01-12 18:47:51', 8),
(33, 3, NULL, '2015-01-12 18:47:51', 8, '2015-01-12 18:47:51', 8),
(33, 6, NULL, '2015-01-12 18:47:51', 8, '2015-01-12 18:47:51', 8),
(34, 9, NULL, '2015-01-16 12:08:11', 16, '2015-01-16 12:08:11', 16),
(34, 15, NULL, '2015-01-16 12:36:51', 16, '2015-01-16 12:36:51', 16),
(34, 12, NULL, '2015-01-16 12:36:51', 16, '2015-01-16 12:36:51', 16),
(34, 11, NULL, '2015-01-16 12:36:51', 16, '2015-01-16 12:36:51', 16),
(34, 13, NULL, '2015-01-16 12:36:51', 16, '2015-01-16 12:36:51', 16),
(34, 8, NULL, '2015-01-16 12:36:51', 16, '2015-01-16 12:36:51', 16),
(34, 3, NULL, '2015-01-16 12:36:51', 16, '2015-01-16 12:36:51', 16),
(34, 6, NULL, '2015-01-16 12:36:51', 16, '2015-01-16 12:36:51', 16),
(37, 15, NULL, '2015-01-20 14:41:39', 16, '2015-01-20 14:41:39', 16),
(38, 15, NULL, '2015-01-20 15:14:08', 16, '2015-01-20 15:14:08', 16),
(38, 9, NULL, '2015-01-20 15:39:46', 16, '2015-01-20 15:39:46', 16),
(35, 9, 1, '2015-01-20 15:15:47', 16, '2015-01-31 14:27:45', 0),
(57, 116, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 101, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 115, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 24, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 321, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 34, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 329, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 330, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 320, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 319, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 30, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(43, 9, NULL, '2015-01-22 15:08:22', 16, '2015-01-22 15:08:22', 16),
(57, 322, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 457, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 328, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 288, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 323, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 318, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 327, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(43, 3, NULL, '2015-01-22 15:08:22', 16, '2015-01-22 15:08:22', 16),
(43, 6, NULL, '2015-01-22 15:08:22', 16, '2015-01-22 15:08:22', 16),
(43, 12, NULL, '2015-01-22 15:08:22', 16, '2015-01-22 15:08:22', 16),
(43, 8, NULL, '2015-01-22 15:08:22', 16, '2015-01-22 15:08:22', 16),
(44, 17, 0, '2015-01-22 15:22:14', 17, '2015-01-23 11:05:31', 17),
(57, 35, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 299, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 291, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(43, 15, NULL, '2015-01-22 15:08:22', 16, '2015-01-22 15:08:22', 16),
(57, 292, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 289, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 302, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 298, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 294, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 25, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 38, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 308, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 22, 1, '2015-02-25 13:36:25', 32, '2015-02-25 16:58:24', 22),
(43, 11, NULL, '2015-01-22 15:08:22', 16, '2015-01-22 15:08:22', 16),
(57, 343, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 198, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(40, 15, NULL, '2015-01-20 16:39:50', 16, '2015-01-20 16:39:50', 16),
(57, 315, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 197, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 314, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 23, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 347, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 333, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 207, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 36, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 206, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 346, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 360, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 351, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 354, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 353, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 344, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 282, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 307, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 359, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 37, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 350, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(41, 9, NULL, '2015-01-21 18:03:44', 16, '2015-01-21 18:03:44', 16),
(42, 9, 1, '2015-01-21 18:04:42', 16, '2015-01-28 14:27:50', 0),
(57, 268, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 336, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 195, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 341, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 348, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 17, 1, '2015-02-25 13:36:25', 32, '2015-02-25 14:24:31', 17),
(57, 331, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 339, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 46, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 208, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 202, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 334, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 358, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 312, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 356, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 338, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 337, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 21, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 317, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 31, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(40, 17, 0, '2015-01-20 16:58:50', 16, '2015-01-23 11:05:25', 17),
(57, 424, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 345, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 310, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 32, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 45, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 352, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 33, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 342, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 284, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 26, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 40, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 286, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 276, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 270, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 269, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 20, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 277, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 267, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 273, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 264, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 278, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 266, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 271, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 265, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 275, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 272, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 279, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 274, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 280, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(48, 3, NULL, '2015-01-27 13:14:36', 9, '2015-01-27 13:14:36', 9),
(48, 12, NULL, '2015-01-27 13:14:36', 9, '2015-01-27 13:14:36', 9),
(49, 9, 1, '2015-01-27 14:58:39', 16, '2015-01-27 16:39:38', 0),
(48, 13, NULL, '2015-01-27 13:14:36', 9, '2015-01-27 13:14:36', 9),
(51, 9, 1, '2015-01-27 15:04:47', 16, '2015-01-29 12:32:05', 0),
(48, 15, NULL, '2015-01-27 13:14:36', 9, '2015-01-27 13:14:36', 9),
(48, 8, NULL, '2015-01-27 13:14:36', 9, '2015-01-27 13:14:36', 9),
(48, 9, 1, '2015-01-27 13:14:36', 9, '2015-01-28 14:28:48', 0),
(48, 6, NULL, '2015-01-27 13:14:36', 9, '2015-01-27 13:14:36', 9),
(50, 9, 1, '2015-01-27 15:02:38', 16, '2015-01-28 14:27:27', 0),
(48, 11, NULL, '2015-01-27 13:14:36', 9, '2015-01-27 13:14:36', 9),
(57, 306, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 423, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(52, 517, NULL, '2015-01-28 10:16:21', 16, '2015-01-28 10:16:21', 16),
(57, 295, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 293, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 303, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(52, 9, 1, '2015-01-28 10:16:21', 16, '2015-01-29 12:32:00', 0),
(51, 15, NULL, '2015-01-27 17:55:39', 16, '2015-01-27 17:55:39', 16),
(57, 301, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 305, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 296, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 290, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(44, 9, 1, '2015-01-28 03:27:11', 0, '2015-02-27 14:58:41', 0),
(57, 456, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(43, 13, NULL, '2015-01-22 15:08:22', 16, '2015-01-22 15:08:22', 16),
(57, 363, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 364, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 365, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 368, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 39, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 44, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 283, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 201, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 192, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 199, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 194, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 203, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 49, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 51, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 205, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 98, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 27, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 52, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 196, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 200, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 28, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 50, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 427, 0, '2015-02-27 14:55:20', 0, '2015-02-27 14:55:30', 0),
(57, 75, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 91, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 94, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 124, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 84, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 74, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 73, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 76, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 81, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 64, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 89, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 79, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 93, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 70, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 87, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 82, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 77, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 71, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 88, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 86, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(54, 427, 0, '2015-02-27 14:55:34', 0, '2015-02-27 14:55:40', 0),
(57, 72, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 85, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 80, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 83, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 90, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 92, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 78, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 109, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 62, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 67, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 99, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 97, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 104, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 55, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 56, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 100, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 63, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 95, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 59, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 69, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 113, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 68, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 111, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 54, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 106, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 112, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 103, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 105, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 57, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 114, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 117, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 108, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 110, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 107, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 102, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 96, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 42, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 66, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 53, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 43, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 61, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(57, 65, NULL, '2015-02-25 13:36:25', 32, '2015-02-25 13:36:25', 32),
(60, 9, NULL, '2015-04-01 10:07:01', 427, '2015-04-01 10:07:01', 427),
(72, 554, NULL, '2015-05-15 17:48:44', 22, '2015-05-15 17:48:44', 22),
(61, 15, NULL, '2015-04-01 10:09:22', 9, '2015-04-01 10:09:22', 9),
(61, 3, NULL, '2015-04-01 10:09:22', 9, '2015-04-01 10:09:22', 9),
(61, 9, 1, '2015-04-01 10:09:22', 9, '2015-04-01 10:11:22', 0),
(72, 307, NULL, '2015-05-15 17:21:17', 22, '2015-05-15 17:21:17', 22),
(61, 8, NULL, '2015-04-01 10:09:22', 9, '2015-04-01 10:09:22', 9),
(71, 17, NULL, '2015-05-15 16:28:38', 16, '2015-05-15 16:28:38', 16),
(61, 11, NULL, '2015-04-01 10:09:22', 9, '2015-04-01 10:09:22', 9),
(56, 427, 1, '2015-03-30 09:44:11', 0, '2015-03-30 09:44:11', 0),
(61, 12, NULL, '2015-04-01 10:09:22', 9, '2015-04-01 10:09:22', 9),
(71, 9, NULL, '2015-05-15 16:28:38', 16, '2015-05-15 16:28:38', 16),
(61, 517, NULL, '2015-04-01 10:09:22', 9, '2015-04-01 10:09:22', 9),
(61, 13, NULL, '2015-04-01 10:09:22', 9, '2015-04-01 10:09:22', 9),
(61, 6, NULL, '2015-04-01 10:09:22', 9, '2015-04-01 10:09:22', 9),
(72, 17, NULL, '2015-05-15 17:21:17', 22, '2015-05-15 17:21:17', 22),
(72, 22, NULL, '2015-05-15 17:21:17', 22, '2015-05-15 17:21:17', 22),
(56, 9, 0, '2015-02-27 14:58:47', 0, '2015-02-27 14:58:48', 0),
(58, 9, NULL, '2015-03-27 13:29:12', 16, '2015-03-27 13:29:12', 16),
(58, 15, NULL, '2015-03-27 13:29:12', 16, '2015-03-27 13:29:12', 16),
(53, 9, 1, '2015-02-27 14:58:15', 0, '2015-02-27 15:15:18', 0),
(54, 9, 1, '2015-02-27 14:58:16', 0, '2015-02-27 14:58:16', 0),
(56, 22, 0, '2015-03-27 14:20:03', 0, '2015-03-27 14:23:27', 0),
(57, 9, 1, '2015-02-27 14:58:07', 0, '2015-02-27 15:10:51', 0),
(39, 191, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 190, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 189, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 301, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 303, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 296, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 295, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 293, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 306, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 305, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 290, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 423, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 294, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 302, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 25, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 292, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 289, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 298, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 291, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 35, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 299, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 38, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 365, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 364, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 456, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 368, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 39, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 363, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 44, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 320, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 319, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 321, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 457, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 24, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 327, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 323, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 34, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 329, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 322, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 330, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 328, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 318, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 226, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 222, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 447, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 243, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 213, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 461, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 225, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 209, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 229, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 223, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 254, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 231, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 215, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 249, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 217, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 238, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 253, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 250, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 251, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 252, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 239, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 218, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 219, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 260, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 261, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 29, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 257, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 459, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 458, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 263, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 246, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 210, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 240, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 248, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 255, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 244, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 232, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 259, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 214, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 212, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 234, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 247, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 221, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 256, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 242, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 241, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 228, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 224, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 245, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 460, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 227, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 230, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 220, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 236, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 258, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 262, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 237, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 235, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 30, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 288, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 284, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 40, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 26, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 286, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 283, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 265, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 20, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 267, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 272, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 279, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 266, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 278, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 273, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 269, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 274, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 275, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 264, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 280, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 270, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 277, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 276, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 271, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 268, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 352, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 37, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 359, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 46, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 45, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 350, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 356, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 17, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 347, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 360, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 353, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 354, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 351, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 36, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 348, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 358, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 336, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 31, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 331, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 343, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 338, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 337, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 341, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 344, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 346, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 33, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 32, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 342, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 334, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 339, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 333, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 345, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 314, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 21, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 424, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 308, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 315, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 317, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 23, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 22, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 312, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 310, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 307, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 282, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 206, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 207, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 208, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 198, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 202, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 195, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 197, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 199, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 192, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 201, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 28, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 196, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 203, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 27, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 200, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 205, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 194, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 51, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 52, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 49, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 50, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 126, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 140, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 131, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 130, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 127, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 152, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 146, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 141, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 150, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 138, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 153, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 128, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 147, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 135, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 144, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 134, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 137, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 142, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 151, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 132, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 136, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 125, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 143, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 145, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 148, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 149, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 133, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 129, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 139, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 184, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 164, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 165, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 180, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 176, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 171, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 163, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 157, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 172, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 156, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 173, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 154, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 167, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 182, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 168, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 187, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 162, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 178, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 175, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 170, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 183, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 158, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 179, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 181, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 188, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 177, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 174, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 186, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 185, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 161, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 169, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 159, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 160, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 155, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 166, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 98, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 116, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 101, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 115, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 108, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 111, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 102, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 96, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 109, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 105, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 113, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 117, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 99, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 114, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 106, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 110, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 97, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 112, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 107, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 95, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 100, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 104, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 103, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 66, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 68, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 69, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 65, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 67, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 121, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 119, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 120, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 123, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 122, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 118, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 62, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 55, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 54, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 42, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 43, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 53, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 57, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 56, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 63, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 61, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 59, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 64, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 84, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 71, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 76, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 83, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 80, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 79, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 74, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 85, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 70, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 72, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 77, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 73, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 75, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17);
INSERT INTO `event_user_activity_join` (`event_aid`, `user_aid`, `has_joined`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(39, 78, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 81, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 82, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 86, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 93, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 87, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 90, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 88, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 91, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 94, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 92, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 89, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(39, 124, NULL, '2015-01-20 15:30:54', 17, '2015-01-20 15:30:54', 17),
(75, 12, NULL, '2015-12-08 10:53:15', 9, '2015-12-08 10:53:15', 9),
(75, 9, NULL, '2015-12-08 10:53:15', 9, '2015-12-08 10:53:15', 9),
(76, 15, 1, '2016-07-06 12:00:03', 16, '2016-07-06 12:08:32', 15),
(76, 12, NULL, '2016-07-06 12:00:03', 16, '2016-07-06 12:00:03', 16),
(76, 11, NULL, '2016-07-06 12:00:03', 16, '2016-07-06 12:00:03', 16),
(76, 13, NULL, '2016-07-06 12:00:03', 16, '2016-07-06 12:00:03', 16),
(76, 9, NULL, '2016-07-06 12:00:03', 16, '2016-07-06 12:00:03', 16),
(76, 517, NULL, '2016-07-06 12:00:03', 16, '2016-07-06 12:00:03', 16),
(76, 8, NULL, '2016-07-06 12:00:03', 16, '2016-07-06 12:00:03', 16),
(76, 3, NULL, '2016-07-06 12:00:03', 16, '2016-07-06 12:00:03', 16),
(76, 6, NULL, '2016-07-06 12:00:03', 16, '2016-07-06 12:00:03', 16),
(77, 11, NULL, '2016-10-28 15:39:51', 16, '2016-10-28 15:39:51', 16),
(78, 11, NULL, '2016-10-28 15:48:00', 16, '2016-10-28 15:48:00', 16),
(79, 11, NULL, '2016-10-28 16:17:08', 16, '2016-10-28 16:17:08', 16),
(80, 11, NULL, '2016-10-28 16:18:00', 16, '2016-10-28 16:18:00', 16);

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE `holiday` (
  `aid` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `holiday_weekend`
--

CREATE TABLE `holiday_weekend` (
  `user_owner_aid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sun` tinyint(1) NOT NULL DEFAULT '0',
  `mon` tinyint(1) NOT NULL DEFAULT '0',
  `tue` tinyint(1) NOT NULL DEFAULT '0',
  `wed` tinyint(1) NOT NULL DEFAULT '0',
  `thu` tinyint(1) NOT NULL DEFAULT '0',
  `fri` tinyint(1) NOT NULL DEFAULT '0',
  `sat` tinyint(1) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `holiday_weekend`
--

INSERT INTO `holiday_weekend` (`user_owner_aid`, `sun`, `mon`, `tue`, `wed`, `thu`, `fri`, `sat`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 1, 0, 0, 0, 0, 0, 1, '2012-05-18 16:00:22', 2, '2016-12-19 10:51:07', 33);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `aid` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) NOT NULL,
  `page` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `browser` varchar(128) DEFAULT NULL,
  `browser_detail` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `data` longtext,
  `flag` varchar(50) DEFAULT NULL,
  `owner_user_aid` int(10) UNSIGNED DEFAULT NULL,
  `owner_detail` text,
  `ip` varchar(15) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`aid`, `type`, `page`, `controller`, `action`, `title`, `browser`, `browser_detail`, `description`, `data`, `flag`, `owner_user_aid`, `owner_detail`, `ip`, `created_date`, `created_by`) VALUES
(1, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:78:"[kiatkajohn@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '127.0.0.1', '2017-02-10 13:29:38', 0),
(2, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'kiatkajohn@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '127.0.0.1', '2017-02-10 13:29:38', 0),
(3, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'kiatkajohn@bookdose.com[11] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '127.0.0.1', '2017-02-10 13:32:09', 11),
(4, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Login failed. yaowaluk@bookdose.com login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '127.0.0.1', '2017-02-10 13:32:30', 0),
(5, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:76:"[yaowaluk@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '127.0.0.1', '2017-02-10 13:32:30', 0),
(6, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'yaowaluk@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '127.0.0.1', '2017-02-10 13:32:30', 0),
(7, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'yaowaluk@bookdose.com[6] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '127.0.0.1', '2017-02-10 13:32:37', 6),
(8, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:76:"[yaowaluk@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '127.0.0.1', '2017-02-10 14:53:25', 0),
(9, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'yaowaluk@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '127.0.0.1', '2017-02-10 14:53:25', 0),
(10, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'yaowaluk@bookdose.com[6] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '127.0.0.1', '2017-02-10 14:58:03', 6),
(11, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:76:"[yaowaluk@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '127.0.0.1', '2017-02-10 14:58:51', 0),
(12, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'yaowaluk@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '127.0.0.1', '2017-02-10 14:58:51', 0),
(13, 'status', 'admin/user-section/save', 'user_section_back_controller', 'save', 'Backend : Insert section', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[student] just added into database.', 'a:6:{s:14:"user_owner_aid";s:1:"1";s:4:"name";s:7:"student";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:10:"is_default";s:1:"1";s:3:"aid";i:1;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '127.0.0.1', '2017-02-10 15:04:43', 6),
(14, 'status', 'admin/user-section/save', 'user_section_back_controller', 'save', 'Backend : Update section', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[Student] has been updated.', 'a:6:{s:14:"user_owner_aid";s:1:"1";s:4:"name";s:7:"Student";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:10:"is_default";s:1:"1";s:3:"aid";s:1:"1";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '127.0.0.1', '2017-02-10 15:05:07', 6),
(15, 'status', 'admin/user-section/save', 'user_section_back_controller', 'save', 'Backend : Insert section', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[Teacher] just added into database.', 'a:6:{s:14:"user_owner_aid";s:1:"1";s:4:"name";s:7:"Teacher";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:10:"is_default";b:0;s:3:"aid";i:2;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '127.0.0.1', '2017-02-10 15:08:14', 6),
(16, 'status', 'admin/user-section/save', 'user_section_back_controller', 'save', 'Backend : Insert section', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[General] just added into database.', 'a:6:{s:14:"user_owner_aid";s:1:"1";s:4:"name";s:7:"General";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:10:"is_default";b:0;s:3:"aid";i:3;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '127.0.0.1', '2017-02-10 15:09:24', 6),
(17, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'yaowaluk@bookdose.com[6] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '127.0.0.1', '2017-02-10 16:10:31', 6),
(18, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-14 15:37:27', 0),
(19, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-03-14 15:37:27', 0),
(20, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-14 15:37:27', 0),
(21, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-20 09:49:49', 0),
(22, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-03-20 09:49:49', 0),
(23, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-20 09:49:49', 0),
(24, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-21 10:02:03', 0),
(25, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-03-21 10:02:03', 0),
(26, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-21 10:02:03', 0),
(27, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-21 10:51:51', 0),
(28, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-03-21 10:51:51', 0),
(29, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-21 10:51:51', 0),
(30, 'status', 'admin/questionaire/save', 'questionaire_back_controller', 'save_and_publish', 'Admin : Update questionnaire', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[bbbbb] has been updated.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-21 11:44:13', 1),
(31, 'status', 'admin/questionaire-category/save', 'questionaire_category_back_controller', 'save', 'Backend : Insert questionaire category', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[Bookdose] just added into database.', 'a:6:{s:14:"user_owner_aid";s:1:"1";s:4:"name";s:8:"Bookdose";s:3:"url";s:10:"bookdosw-q";s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:3:"aid";i:8;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-21 12:19:53', 1),
(32, 'status', 'admin/product-category/save', 'product_category_back_controller', 'save', 'Backend : Insert product category', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[Book-Cat1] just added into database.', 'a:7:{s:14:"user_owner_aid";s:1:"1";s:4:"name";s:9:"Book-Cat1";s:3:"url";s:9:"book-cat1";s:16:"product_main_aid";s:1:"1";s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:3:"aid";i:1;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-21 14:59:49', 1),
(33, 'status', 'admin/product/book/save', 'product_book_back_controller', 'save', 'Backend : Insert book', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[อภินิหาร][1] just added into database.', 'a:26:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"1";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"30";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-21";s:12:"expired_date";N;s:12:"reward_point";s:2:"12";s:8:"category";s:3:",1,";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:1;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-21 15:02:10', 1),
(34, 'status', 'admin/product/book-copy/save', 'product_book_copy_back_controller', 'save', 'Backend : Insert book copy', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[barcode=1234567890] of [อภินิหาร] just added into database.', 'a:39:{s:10:"parent_aid";s:1:"1";s:16:"product_type_aid";s:1:"1";s:21:"nonconsume_identifier";s:0:"";s:14:"user_owner_aid";s:1:"1";s:3:"cid";s:12:"phemSQp69uzF";s:12:"publish_date";s:10:"2017-03-21";s:12:"expired_date";N;s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:10:"copy_title";s:24:"อภินิหาร";s:11:"cover_price";s:3:"999";s:6:"source";s:0:"";s:4:"no_1";s:2:"01";s:4:"no_2";s:2:"03";s:4:"no_3";s:4:"2015";s:4:"no_4";s:0:"";s:22:"product_type_minor_aid";s:1:"2";s:4:"type";s:1:"2";s:10:"type_minor";s:1:"3";s:10:"possession";s:1:"2";s:8:"is_ebook";i:0;s:10:"is_license";s:0:"";s:17:"ebook_concurrence";s:0:"";s:13:"digital_price";s:0:"";s:13:"digital_point";s:0:"";s:11:"paper_price";s:1:"0";s:11:"paper_point";s:1:"0";s:13:"transport_aid";s:1:"0";s:15:"transport_price";s:0:"";s:8:"in_stock";s:1:"0";s:13:"rental_period";s:0:"";s:10:"rental_fee";b:0;s:16:"rental_fee_point";b:0;s:15:"rental_fine_fee";b:0;s:12:"shelf_status";s:1:"1";s:10:"shelf_name";s:1:"2";s:7:"barcode";s:10:"1234567890";s:11:"upload_path";s:54:"uploads/nia/book_copy/2017/03/1234567890_phemSQp69uzF/";s:15:"use_digital_gen";b:0;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-21 15:03:41', 1),
(35, 'status', 'admin/product/book/save', 'product_book_back_controller', 'save', 'Admin : Update book', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[อภินิหาร][1] has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"1";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"30";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-21";s:12:"expired_date";N;s:12:"reward_point";s:2:"12";s:8:"category";s:3:",1,";s:3:"tag";s:0:"";s:3:"aid";s:1:"1";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-21 15:13:31', 1),
(36, 'status', 'admin/questionaire/save', 'questionaire_back_controller', 'save_and_publish', 'Admin : Update questionnaire', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[สำรวจความคิดเห็นพนักงานเกี่ยวกับการจัดงานปีใหม่ 16-17 มกราคม 2558] has been updated.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-21 15:35:40', 1),
(37, 'status', 'admin/questionaire/save', 'questionaire_back_controller', 'save_and_publish', 'Admin : Update questionnaire', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[สำรวจความคิดเห็นพนักงานเกี่ยวกับการจัดงานปีใหม่ 16-17 มกราคม 2558] has been updated.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-21 15:36:10', 1),
(38, 'status', 'admin/questionaire/save', 'questionaire_back_controller', 'save_and_publish', 'Backend : Insert questionnaire', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[Bookdose ฆำพอ] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-21 15:41:22', 1),
(39, 'status', 'admin/questionaire-category/save', 'questionaire_category_back_controller', 'save', 'Backend : Update questionaire category', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[Bookdose] has been updated.', 'a:6:{s:14:"user_owner_aid";s:1:"1";s:4:"name";s:8:"Bookdose";s:3:"url";s:10:"bookdosw-q";s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:3:"aid";s:1:"8";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-21 15:42:23', 1),
(40, 'status', 'admin/questionaire/save', 'questionaire_back_controller', 'save_and_publish', 'Admin : Update questionnaire', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[Bookdose 9999] has been updated.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-21 15:52:21', 1),
(41, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-22 14:00:59', 0),
(42, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-03-22 14:00:59', 0),
(43, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-22 14:00:59', 0),
(44, 'status', 'admin/questionaire/save', 'questionaire_back_controller', 'save_and_publish', 'Admin : Update questionnaire', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Bookdose 9999] has been updated.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-22 14:31:36', 1),
(45, 'status', 'admin/questionaire/save', 'questionaire_back_controller', 'save_and_publish', 'Admin : Update questionnaire', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Bookdose 9999] has been updated.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-22 15:53:51', 1),
(46, 'status', 'admin/questionaire/save', 'questionaire_back_controller', 'save_and_publish', 'Admin : Update questionnaire', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Bookdose 9999] has been updated.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-22 16:56:27', 1),
(47, 'debug', 'admin/questionaire/save', 'questionaire_back_controller', 'save_and_publish', 'Questionnaire : Send emails to all staff about new questionnaire has been published.', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[subject = Bookdose 9999] [to_emails = a.s.i.tgets@gmail.com,suriyasak@bookdose.com,wantana@bookdose.com,wutthiphat@bookdose.com,wuttichai@bookdose.com,nattapong@bookdose.com,pimchanok@bookdose.com,nakharin@bookdose.com] Bookdose 9999', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-22 16:56:48', 1),
(48, 'status', 'admin/questionaire/save', 'questionaire_back_controller', 'save_and_publish', 'Admin : Update questionnaire', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Bookdose 9999] has been updated.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-22 17:08:03', 1),
(49, 'debug', 'admin/questionaire/save', 'questionaire_back_controller', 'save_and_publish', 'Questionnaire : Send emails to all staff about new questionnaire has been published.', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[subject = Bookdose 9999] [to_emails = a.s.i.tgets@gmail.com,suriyasak@bookdose.com,wantana@bookdose.com,wutthiphat@bookdose.com,wuttichai@bookdose.com,nattapong@bookdose.com,pimchanok@bookdose.com,nakharin@bookdose.com] Bookdose 9999', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-22 17:08:21', 1),
(50, 'status', 'registration/save', 'registration_controller', 'save', 'Online registration', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[18] just saved into database. Wating for send email.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-22 17:12:19', 0),
(51, 'debug', 'registration/save', 'registration_controller', 'save', 'Online registration email', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[anon@bookdose.com] \r\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">\r\n<head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\r\n<title>http://www.nialib.com</title>\r\n<style type="text/css">\r\nbody{background-color:#FFF; margin:0; padding:0; color:#366092} \r\ntd{padding:5px 0;font-size:12px; font-family:Tahoma; color:#366092;} \r\n.hcenter{text-align:center;}\r\n.hright{text-align:right;}\r\n.hleft{text-align:left;}\r\n.linedown{border-bottom:1px solid #CCC;}\r\n.header{font-size:12px;color:#FFF;background-color:#366092;font-weight:bold;}\r\n.h2{font-size:24px;font-weight:normal;}\r\n.footer{padding:0px}\r\n.bill-header{font-size:12px;font-weight:normal;padding:0px;}\r\na.button{padding:10px;text-decoration:none;font-weight:bold;border-radius:5px;min-width:200px;}\r\na.confirm{color:#465821;background-color:#9CC746;}\r\na.cancel{color:#621C1A;background-color:#CE3B37;}\r\n\r\n</style>\r\n</head>\r\n<body>\r\n<table cellspacing="0" cellpadding="0" border="0" width="800">\r\n<tr valign="bottom">\r\n<td width="20">&nbsp;</td>\r\n<td width="200" height="100" class=""><a href="http://www.nialib.com"><img src="http://belib-nia.local/styles/dip/images/background/logo-mail.png" alt="http://www.nialib.com" /></a></td>\r\n<td height="100" class="">&nbsp;</td>\r\n<td width="20">&nbsp;</td>\r\n</tr>\r\n<tr valign="bottom">\r\n<td width="20">&nbsp;</td>\r\n<td width="200" height="" class="hcenter h2">&nbsp;</td>\r\n<td height="" class="">&nbsp;</td>\r\n<td width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td width="20">&nbsp;</td>\r\n<td colspan="2">\r\n\r\n<table cellspacing="0" cellpadding="0" border="0" width="100%">\r\n	<tr><td class="hcenter h2">Account  Activation</td></tr>\r\n	<tr><td>Dear <strong>anon@bookdose.com</strong> [],</td></tr>\r\n	<tr><td>&nbsp;</td></tr>\r\n	<tr><td>Thank you for signing up to ห้องสมุดสื่อทรัพยากรออนไลน์. Your account is now pending for activation. Please activate your account by clicking on below link:</td></tr>\r\n	<tr><td><a href="http://belib-nia.local/activation/anon@bookdose.com/W4nci57S">http://belib-nia.local/activation/anon@bookdose.com/W4nci57S</a></td></tr>\r\n	<tr><td>After activation is completed, you can use your registered Username () and password to access to <a href="http://belib-nia.local/login">ห้องสมุดสื่อทรัพยากรออนไลน์</a></td></tr>\r\n	<tr><td>If you have any inquires and troubles, please contact us at <a href="mailto:nia.library@nia.go.th" >nia.library@nia.go.th<a></td></tr>\r\n</table>\r\n\r\n</td>\r\n<td width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer" colspan="2">&nbsp;</td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer hleft" colspan="2"> Best regards,</td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer hleft" colspan="2">ห้องสมุดสื่อทรัพยากรออนไลน์</td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer" colspan="2">&nbsp;</td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer hleft" colspan="2">Email : <a href="mailto:nia.library@nia.go.th" >nia.library@nia.go.th<a></td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer hleft" colspan="2">Website : <a href="http://www.nialib.com">http://www.nialib.com</a></td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n</table>\r\n</body>\r\n</html>\r\n', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-22 17:12:19', 0),
(52, 'status', 'registration/save', 'registration_controller', 'save', 'Online registration', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Welcome email sent success.[18] just been submitted.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-22 17:12:29', 0),
(53, 'status', 'activation/anon@bookdose.com/W4nci57S', 'activation_controller', 'index', 'User activation', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'anon@bookdose.com[18] just been activated.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-22 17:13:14', 0),
(54, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-03-22 17:13:27', 0),
(55, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'anon@bookdose.com just login for the first time. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-22 17:13:27', 0),
(56, 'status', 'admin/questionaire/save', 'questionaire_back_controller', 'save_and_publish', 'Admin : Update questionnaire', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Bookdose 9999] has been updated.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-22 17:14:43', 1),
(57, 'debug', 'admin/questionaire/save', 'questionaire_back_controller', 'save_and_publish', 'Questionnaire : Send emails to all staff about new questionnaire has been published.', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[subject = Bookdose 9999] [to_emails = a.s.i.tgets@gmail.com,suriyasak@bookdose.com,wantana@bookdose.com,wutthiphat@bookdose.com,wuttichai@bookdose.com,nattapong@bookdose.com,pimchanok@bookdose.com,nakharin@bookdose.com,anon@bookdose.com] Bookdose 9999', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-22 17:15:07', 1),
(58, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. anon@bookdose.com login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-22 17:21:52', 0),
(59, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-03-22 17:21:52', 0),
(60, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'anon@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-22 17:21:52', 0),
(61, 'status', 'admin/banner/save', 'banner_back_controller', 'save', 'Backend : Update banner', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Banner has been updated.', 'a:10:{s:14:"user_owner_aid";s:1:"1";s:5:"title";s:6:"banner";s:6:"weight";s:1:"0";s:8:"ref_link";s:1:"#";s:6:"target";s:5:"_self";s:6:"status";s:1:"1";s:3:"aid";s:1:"1";s:3:"cid";s:12:"FHISLW7z1O54";s:11:"upload_path";s:32:"uploads/dip/banner/FHISLW7z1O54/";s:21:"cover_image_file_type";s:4:".png";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-22 17:47:29', 1),
(62, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-23 10:21:09', 0),
(63, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-03-23 10:21:09', 0),
(64, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-23 10:21:09', 0),
(65, 'status', 'admin/event-category/save', 'event_category_back_controller', 'save', 'Backend : Update event category', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Training] has been updated.', 'a:7:{s:14:"user_owner_aid";s:1:"1";s:4:"name";s:8:"Training";s:3:"url";s:8:"training";s:14:"event_main_aid";s:1:"1";s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:3:"aid";s:1:"6";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-23 11:22:09', 1),
(66, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-24 15:14:00', 0),
(67, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-03-24 15:14:00', 0),
(68, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-24 15:14:00', 0),
(69, 'status', 'admin/user/ajax-set-value/3086370343', 'user_back_controller', 'ajax_set_value', 'Backend : User', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Set value : "status" has been set to "0" for kittipojn@gmail.com [aid = 4].', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-24 16:24:03', 1),
(70, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 10:13:01', 0),
(71, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 10:13:01', 0),
(72, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 10:13:01', 0),
(73, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 13:32:21', 0),
(74, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 13:32:21', 0),
(75, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 13:32:21', 0),
(76, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'oui@momothinks.com[1] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-30 14:56:32', 1),
(77, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 14:58:14', 0),
(78, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 14:58:14', 0),
(79, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 14:58:14', 0),
(80, 'status', 'login/verify', 'login_controller', 'verify', 'Trying to connect LDAP server...', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:67:"[nirat@eastwater.com] is trying to authenticate with LDAP server...";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:29:02', 0),
(81, 'status', 'login/verify', 'login_controller', 'verify', 'Failed to connect LDAP Server, cannot authenticate user "nirat"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:62:"Cannot connect LDAP Server. Can\'t contact LDAP server [nirat].";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:29:02', 0),
(82, 'status', 'login/verify', 'login_controller', 'verify', 'Trying to connect LDAP server...', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:66:"[nirat@bookdose.com] is trying to authenticate with LDAP server...";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:29:06', 0),
(83, 'status', 'login/verify', 'login_controller', 'verify', 'Failed to connect LDAP Server, cannot authenticate user "nirat"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:62:"Cannot connect LDAP Server. Can\'t contact LDAP server [nirat].";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:29:06', 0),
(84, 'status', 'login/verify', 'login_controller', 'verify', 'Trying to connect LDAP server...', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:66:"[nirat@bookdose.com] is trying to authenticate with LDAP server...";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:29:10', 0),
(85, 'status', 'login/verify', 'login_controller', 'verify', 'Failed to connect LDAP Server, cannot authenticate user "nirat"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:62:"Cannot connect LDAP Server. Can\'t contact LDAP server [nirat].";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:29:10', 0),
(86, 'status', 'login/verify', 'login_controller', 'verify', 'Trying to connect LDAP server...', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:67:"[admin@eastwater.com] is trying to authenticate with LDAP server...";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:29:16', 0),
(87, 'status', 'login/verify', 'login_controller', 'verify', 'Failed to connect LDAP Server, cannot authenticate user "admin"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:62:"Cannot connect LDAP Server. Can\'t contact LDAP server [admin].";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:29:16', 0),
(88, 'status', 'login/verify', 'login_controller', 'verify', 'Trying to connect LDAP server...', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:66:"[nirat@bookdose.com] is trying to authenticate with LDAP server...";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:30:27', 0),
(89, 'status', 'login/verify', 'login_controller', 'verify', 'Failed to connect LDAP Server, cannot authenticate user "nirat"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:62:"Cannot connect LDAP Server. Can\'t contact LDAP server [nirat].";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:30:27', 0),
(90, 'status', 'login/verify', 'login_controller', 'verify', 'Trying to connect LDAP server...', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:53:"[nirat] is trying to authenticate with LDAP server...";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:31:43', 0),
(91, 'status', 'login/verify', 'login_controller', 'verify', 'Failed to connect LDAP Server, cannot authenticate user "nirat"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:62:"Cannot connect LDAP Server. Can\'t contact LDAP server [nirat].";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:31:43', 0),
(92, 'status', 'login/verify', 'login_controller', 'verify', 'Trying to connect LDAP server...', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:53:"[admin] is trying to authenticate with LDAP server...";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:31:51', 0),
(93, 'status', 'login/verify', 'login_controller', 'verify', 'Failed to connect LDAP Server, cannot authenticate user "admin"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:62:"Cannot connect LDAP Server. Can\'t contact LDAP server [admin].";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:31:51', 0),
(94, 'status', 'login/verify', 'login_controller', 'verify', 'Trying to connect LDAP server...', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:53:"[nirat] is trying to authenticate with LDAP server...";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:31:56', 0),
(95, 'status', 'login/verify', 'login_controller', 'verify', 'Failed to connect LDAP Server, cannot authenticate user "nirat"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:62:"Cannot connect LDAP Server. Can\'t contact LDAP server [nirat].";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:31:56', 0),
(96, 'status', 'login/verify', 'login_controller', 'verify', 'Trying to connect LDAP server...', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:53:"[admin] is trying to authenticate with LDAP server...";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:32:01', 0),
(97, 'status', 'login/verify', 'login_controller', 'verify', 'Failed to connect LDAP Server, cannot authenticate user "admin"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:62:"Cannot connect LDAP Server. Can\'t contact LDAP server [admin].";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:32:01', 0),
(98, 'status', 'login/verify', 'login_controller', 'verify', 'Trying to connect LDAP server...', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:53:"[admin] is trying to authenticate with LDAP server...";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:32:06', 0),
(99, 'status', 'login/verify', 'login_controller', 'verify', 'Failed to connect LDAP Server, cannot authenticate user "admin"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:62:"Cannot connect LDAP Server. Can\'t contact LDAP server [admin].";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:32:06', 0),
(100, 'status', 'login/verify', 'login_controller', 'verify', 'Trying to connect LDAP server...', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:53:"[nirat] is trying to authenticate with LDAP server...";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:33:58', 0),
(101, 'status', 'login/verify', 'login_controller', 'verify', 'Failed to connect LDAP Server, cannot authenticate user "nirat"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:62:"Cannot connect LDAP Server. Can\'t contact LDAP server [nirat].";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:33:58', 0),
(102, 'status', 'login/verify', 'login_controller', 'verify', 'Trying to connect LDAP server...', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:66:"[nirat@bookdose.com] is trying to authenticate with LDAP server...";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:35:05', 0),
(103, 'status', 'login/verify', 'login_controller', 'verify', 'Failed to connect LDAP Server, cannot authenticate user "nirat@bookdose.com"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:75:"Cannot connect LDAP Server. Can\'t contact LDAP server [nirat@bookdose.com].";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:35:05', 0),
(104, 'status', 'login/verify', 'login_controller', 'verify', 'Trying to connect LDAP server...', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:56:"[bookdose] is trying to authenticate with LDAP server...";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:35:13', 0),
(105, 'status', 'login/verify', 'login_controller', 'verify', 'Failed to connect LDAP Server, cannot authenticate user "bookdose"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:65:"Cannot connect LDAP Server. Can\'t contact LDAP server [bookdose].";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 15:35:13', 0),
(106, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 16:05:26', 0),
(107, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 16:05:26', 0),
(108, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 16:05:26', 0),
(109, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'oui@momothinks.com[1] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-30 16:06:21', 1),
(110, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 16:06:32', 0);
INSERT INTO `log` (`aid`, `type`, `page`, `controller`, `action`, `title`, `browser`, `browser_detail`, `description`, `data`, `flag`, `owner_user_aid`, `owner_detail`, `ip`, `created_date`, `created_by`) VALUES
(111, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 16:06:32', 0),
(112, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-30 16:06:32', 0),
(113, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-31 11:13:09', 0),
(114, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-03-31 11:13:09', 0),
(115, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-03-31 11:13:09', 0),
(116, 'status', 'admin/product/book/save', 'product_book_back_controller', 'save', 'Backend : Insert book', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[สิ่งแวดล้อม][2] just added into database.', 'a:26:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"3";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"30";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:2:"12";s:8:"category";s:0:"";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:2;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 16:56:44', 1),
(117, 'status', 'admin/product/book-copy/save', 'product_book_copy_back_controller', 'save', 'Backend : Insert book copy', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[barcode=B1234567890] of [สิ่งแวดล้อม] just added into database.', 'a:39:{s:10:"parent_aid";s:1:"2";s:16:"product_type_aid";s:1:"1";s:21:"nonconsume_identifier";s:0:"";s:14:"user_owner_aid";s:1:"1";s:3:"cid";s:12:"kFhG4Iu9lm6C";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:10:"copy_title";s:36:"สิ่งแวดล้อม222";s:11:"cover_price";s:3:"180";s:6:"source";s:0:"";s:4:"no_1";s:0:"";s:4:"no_2";s:0:"";s:4:"no_3";s:0:"";s:4:"no_4";s:0:"";s:22:"product_type_minor_aid";s:1:"3";s:4:"type";s:1:"1";s:10:"type_minor";s:1:"1";s:10:"possession";s:1:"1";s:8:"is_ebook";i:1;s:10:"is_license";s:0:"";s:17:"ebook_concurrence";s:0:"";s:13:"digital_price";s:1:"0";s:13:"digital_point";s:1:"0";s:11:"paper_price";s:0:"";s:11:"paper_point";s:0:"";s:13:"transport_aid";s:0:"";s:15:"transport_price";s:0:"";s:8:"in_stock";s:0:"";s:13:"rental_period";s:0:"";s:10:"rental_fee";b:0;s:16:"rental_fee_point";b:0;s:15:"rental_fine_fee";b:0;s:12:"shelf_status";s:1:"1";s:10:"shelf_name";s:0:"";s:7:"barcode";s:11:"B1234567890";s:11:"upload_path";s:55:"uploads/dip/book_copy/2017/03/B1234567890_kFhG4Iu9lm6C/";s:15:"use_digital_gen";b:0;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 16:57:50', 1),
(118, 'status', 'admin/product/book/save', 'product_book_back_controller', 'save', 'Admin : Update book', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[สิ่งแวดล้อม][2] has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"3";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"30";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:2:"12";s:8:"category";s:0:"";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 16:58:28', 1),
(119, 'status', 'admin/product/book/save', 'product_book_back_controller', 'save', 'Backend : Insert book', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Test 2][3] just added into database.', 'a:26:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"1";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"14";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:2:"20";s:8:"category";s:3:",1,";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:3;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:00:00', 1),
(120, 'status', 'admin/product/book-copy/save', 'product_book_copy_back_controller', 'save', 'Backend : Insert book copy', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[barcode=PB000001] of [Test 2] just added into database.', 'a:39:{s:10:"parent_aid";s:1:"3";s:16:"product_type_aid";s:1:"1";s:21:"nonconsume_identifier";s:0:"";s:14:"user_owner_aid";s:1:"1";s:3:"cid";s:12:"oXEpOcJNd6W6";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:10:"copy_title";s:6:"Test 2";s:11:"cover_price";s:3:"199";s:6:"source";s:0:"";s:4:"no_1";s:0:"";s:4:"no_2";s:0:"";s:4:"no_3";s:0:"";s:4:"no_4";s:0:"";s:22:"product_type_minor_aid";s:1:"2";s:4:"type";s:1:"2";s:10:"type_minor";s:1:"3";s:10:"possession";s:1:"2";s:8:"is_ebook";i:0;s:10:"is_license";s:0:"";s:17:"ebook_concurrence";s:0:"";s:13:"digital_price";s:0:"";s:13:"digital_point";s:0:"";s:11:"paper_price";s:1:"0";s:11:"paper_point";s:1:"0";s:13:"transport_aid";s:1:"0";s:15:"transport_price";s:0:"";s:8:"in_stock";s:1:"0";s:13:"rental_period";s:0:"";s:10:"rental_fee";b:0;s:16:"rental_fee_point";b:0;s:15:"rental_fine_fee";b:0;s:12:"shelf_status";s:1:"1";s:10:"shelf_name";s:1:"3";s:7:"barcode";s:8:"PB000001";s:11:"upload_path";s:52:"uploads/dip/book_copy/2017/03/PB000001_oXEpOcJNd6W6/";s:15:"use_digital_gen";b:0;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:00:28', 1),
(121, 'status', 'admin/product/book/save', 'product_book_back_controller', 'save', 'Admin : Update book', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[สิ่งแวดล้อม][2] has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"3";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"30";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:2:"12";s:8:"category";s:0:"";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:01:01', 1),
(122, 'status', 'admin/product/magazine-main/save', 'product_magazine_main_back_controller', 'save', 'Backend : Insert magazine', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Max Bild][1] just added into database.', 'a:8:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"2";s:16:"product_type_aid";s:1:"2";s:13:"publisher_aid";s:2:"39";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:5:"title";s:8:"Max Bild";s:3:"aid";i:1;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:02:46', 1),
(123, 'status', 'admin/product/magazine-main/save', 'product_magazine_main_back_controller', 'save', 'Admin : Update magazine', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Max Bild][1] has been updated.', 'a:8:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"2";s:16:"product_type_aid";s:1:"2";s:13:"publisher_aid";s:2:"39";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:5:"title";s:8:"Max Bild";s:3:"aid";s:1:"1";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:02:52', 1),
(124, 'status', 'admin/product/magazine/save', 'product_magazine_back_controller', 'save', 'Backend : Insert magazine', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Max Bild Vol. 1 Issue. 1][1] just added into database.', 'a:30:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"2";s:16:"product_type_aid";s:1:"2";s:17:"magazine_main_aid";s:1:"1";s:6:"volumn";s:1:"1";s:5:"issue";s:1:"1";s:4:"desc";s:0:"";s:13:"publisher_aid";s:2:"39";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:0:"";s:8:"category";s:0:"";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:1;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:03:17', 1),
(125, 'status', 'admin/product/magazine-copy/save', 'product_magazine_copy_back_controller', 'save', 'Backend : Insert magazine copy', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[barcode=PB000002] of [Max Bild Vol. 1 Issue. 1] just added into database.', 'a:39:{s:10:"parent_aid";s:1:"1";s:16:"product_type_aid";s:1:"2";s:21:"nonconsume_identifier";s:0:"";s:14:"user_owner_aid";s:1:"1";s:3:"cid";s:12:"Q8y9XtJJJne1";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:10:"copy_title";s:0:"";s:11:"cover_price";s:3:"199";s:6:"source";s:0:"";s:4:"no_1";s:0:"";s:4:"no_2";s:0:"";s:4:"no_3";s:0:"";s:4:"no_4";s:0:"";s:22:"product_type_minor_aid";s:1:"2";s:4:"type";s:1:"2";s:10:"type_minor";s:1:"4";s:10:"possession";s:1:"2";s:8:"is_ebook";i:0;s:10:"is_license";s:0:"";s:17:"ebook_concurrence";s:0:"";s:13:"digital_price";s:0:"";s:13:"digital_point";s:0:"";s:11:"paper_price";s:1:"0";s:11:"paper_point";s:1:"0";s:13:"transport_aid";s:1:"0";s:15:"transport_price";s:0:"";s:8:"in_stock";s:1:"0";s:13:"rental_period";s:0:"";s:10:"rental_fee";b:0;s:16:"rental_fee_point";b:0;s:15:"rental_fine_fee";b:0;s:12:"shelf_status";s:1:"1";s:10:"shelf_name";s:0:"";s:7:"barcode";s:8:"PB000002";s:11:"upload_path";s:56:"uploads/dip/magazine_copy/2017/03/PB000002_Q8y9XtJJJne1/";s:15:"use_digital_gen";b:0;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:03:32', 1),
(126, 'status', 'admin/product/vdo/save', 'product_vdo_back_controller', 'save', 'Backend : Insert vdo', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[พลังงาน][1] just added into database.', 'a:26:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"5";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:0:"";s:8:"category";s:0:"";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:1;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:06:08', 1),
(127, 'status', 'admin/product-category/save', 'product_category_back_controller', 'save', 'Backend : Insert product category', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[สิ่งแวดล้แม] just added into database.', 'a:7:{s:14:"user_owner_aid";s:1:"1";s:4:"name";s:33:"สิ่งแวดล้แม";s:3:"url";s:33:"สิ่งแวดล้แม";s:16:"product_main_aid";s:1:"3";s:6:"weight";s:0:"";s:6:"status";s:1:"1";s:3:"aid";i:2;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:10:08', 1),
(128, 'status', 'admin/product/book/save', 'product_book_back_controller', 'save', 'Admin : Update book', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[สิ่งแวดล้อม][2] has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"3";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"30";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:2:"12";s:8:"category";s:3:",2,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:10:21', 1),
(129, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-03 10:26:13', 0),
(130, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-03 10:26:13', 0),
(131, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-03 10:26:13', 0),
(132, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'oui@momothinks.com[1] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-03 10:57:07', 1),
(133, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-03 13:17:38', 0),
(134, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-03 13:17:38', 0),
(135, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-03 13:17:38', 0),
(136, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-04 16:34:41', 0),
(137, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-04 16:34:41', 0),
(138, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-04 16:34:41', 0),
(139, 'status', 'admin/product/book-field/save', 'product_book_field_back_controller', 'save', 'Admin : Update book field', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[name=Author][sequence=2][field_data=ชื่อผู้แต่งแสดงตรงนี้ครับ] of [อภินิหาร][1] has been updated.', 'a:5:{s:10:"parent_aid";s:1:"1";s:16:"product_type_aid";s:1:"1";s:7:"ind1_cd";s:0:"";s:7:"ind2_cd";s:0:"";s:10:"field_data";s:75:"ชื่อผู้แต่งแสดงตรงนี้ครับ";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-04 16:49:13', 1),
(140, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-05 09:08:35', 0),
(141, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-05 09:08:35', 0),
(142, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-05 09:08:35', 0),
(143, 'status', 'admin/product/magazine-main/save', 'product_magazine_main_back_controller', 'save', 'Backend : Insert magazine', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Bookdose][2] just added into database.', 'a:8:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"4";s:16:"product_type_aid";s:1:"2";s:13:"publisher_aid";s:2:"37";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:5:"title";s:8:"Bookdose";s:3:"aid";i:2;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 09:09:52', 1),
(144, 'status', 'admin/product/magazine/save', 'product_magazine_back_controller', 'save', 'Backend : Insert magazine', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Bookdose Issue. 1][2] just added into database.', 'a:30:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"4";s:16:"product_type_aid";s:1:"2";s:17:"magazine_main_aid";s:1:"2";s:6:"volumn";N;s:5:"issue";s:1:"1";s:4:"desc";s:0:"";s:13:"publisher_aid";s:2:"37";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:2:"11";s:8:"category";s:0:"";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:2;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 09:11:50', 1),
(145, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-05 09:22:02', 0),
(146, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-05 09:22:02', 0),
(147, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-05 09:22:02', 0),
(148, 'status', 'admin/product/magazine-copy/save', 'product_magazine_copy_back_controller', 'save', 'Backend : Insert magazine copy', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[barcode=DB000001] of [Bookdose Issue. 1] just added into database.', 'a:39:{s:10:"parent_aid";s:1:"2";s:16:"product_type_aid";s:1:"2";s:21:"nonconsume_identifier";s:0:"";s:14:"user_owner_aid";s:1:"1";s:3:"cid";s:12:"t5M1kfyoPuZf";s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:10:"copy_title";s:0:"";s:11:"cover_price";s:3:"125";s:6:"source";s:0:"";s:4:"no_1";s:0:"";s:4:"no_2";s:0:"";s:4:"no_3";s:0:"";s:4:"no_4";s:0:"";s:22:"product_type_minor_aid";s:1:"3";s:4:"type";s:1:"1";s:10:"type_minor";s:1:"2";s:10:"possession";s:1:"1";s:8:"is_ebook";i:1;s:10:"is_license";s:0:"";s:17:"ebook_concurrence";s:0:"";s:13:"digital_price";s:1:"0";s:13:"digital_point";s:1:"0";s:11:"paper_price";s:0:"";s:11:"paper_point";s:0:"";s:13:"transport_aid";s:0:"";s:15:"transport_price";s:0:"";s:8:"in_stock";s:0:"";s:13:"rental_period";s:0:"";s:10:"rental_fee";b:0;s:16:"rental_fee_point";b:0;s:15:"rental_fine_fee";b:0;s:12:"shelf_status";s:1:"1";s:10:"shelf_name";s:0:"";s:7:"barcode";s:8:"DB000001";s:11:"upload_path";s:56:"uploads/dip/magazine_copy/2017/04/DB000001_t5M1kfyoPuZf/";s:15:"use_digital_gen";b:0;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 09:23:52', 1),
(149, 'status', 'admin/product/magazine-copy/save', 'product_magazine_copy_back_controller', 'save', 'Admin : Update magazine copy', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[barcode=DB000001] of [Bookdose Issue. 1] has been updated.', 'a:40:{s:10:"parent_aid";s:1:"2";s:16:"product_type_aid";s:1:"2";s:21:"nonconsume_identifier";s:0:"";s:14:"user_owner_aid";s:1:"1";s:3:"aid";s:1:"2";s:3:"cid";s:12:"t5M1kfyoPuZf";s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:10:"copy_title";s:0:"";s:11:"cover_price";s:3:"125";s:6:"source";s:0:"";s:4:"no_1";s:0:"";s:4:"no_2";s:0:"";s:4:"no_3";s:0:"";s:4:"no_4";s:0:"";s:22:"product_type_minor_aid";s:1:"3";s:4:"type";s:1:"1";s:10:"type_minor";s:1:"2";s:10:"possession";s:1:"1";s:8:"is_ebook";i:1;s:10:"is_license";s:0:"";s:17:"ebook_concurrence";s:0:"";s:13:"digital_price";s:1:"0";s:13:"digital_point";s:1:"0";s:11:"paper_price";s:0:"";s:11:"paper_point";s:0:"";s:13:"transport_aid";s:0:"";s:15:"transport_price";s:0:"";s:8:"in_stock";s:0:"";s:13:"rental_period";s:0:"";s:10:"rental_fee";b:0;s:16:"rental_fee_point";b:0;s:15:"rental_fine_fee";b:0;s:12:"shelf_status";s:1:"1";s:10:"shelf_name";s:0:"";s:7:"barcode";s:8:"DB000001";s:11:"upload_path";s:56:"uploads/dip/magazine_copy/2017/04/DB000001_t5M1kfyoPuZf/";s:15:"use_digital_gen";b:0;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 09:24:47', 1),
(150, 'status', 'admin/product-category/save', 'product_category_back_controller', 'save', 'Backend : Insert product category', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Bookdose Mag] just added into database.', 'a:7:{s:14:"user_owner_aid";s:1:"1";s:4:"name";s:12:"Bookdose Mag";s:3:"url";s:12:"bookdose-mag";s:16:"product_main_aid";s:1:"4";s:6:"weight";s:0:"";s:6:"status";s:1:"1";s:3:"aid";i:3;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 09:25:45', 1),
(151, 'status', 'admin/product/magazine/save', 'product_magazine_back_controller', 'save', 'Admin : Update magazine', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Bookdose Issue. 1][2] has been updated.', 'a:19:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"4";s:16:"product_type_aid";s:1:"2";s:17:"magazine_main_aid";s:1:"2";s:6:"volumn";N;s:5:"issue";s:1:"1";s:4:"desc";s:0:"";s:13:"publisher_aid";s:2:"37";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:2:"11";s:8:"category";s:3:",3,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 09:26:43', 1),
(152, 'status', 'admin/product/magazine/save', 'product_magazine_back_controller', 'save', 'Admin : Update magazine', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Bookdose Issue. 1][2] has been updated.', 'a:19:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"4";s:16:"product_type_aid";s:1:"2";s:17:"magazine_main_aid";s:1:"2";s:6:"volumn";N;s:5:"issue";s:1:"1";s:4:"desc";s:0:"";s:13:"publisher_aid";s:2:"37";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:2:"11";s:8:"category";s:3:",3,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 09:27:17', 1),
(153, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. anon@bookdose.com login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-05 09:43:14', 0),
(154, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-05 09:43:14', 0),
(155, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'anon@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-05 09:43:14', 0),
(156, 'status', 'admin/product/magazine/save', 'product_magazine_back_controller', 'save', 'Admin : Update magazine', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Bookdose Issue. 1][2] has been updated.', 'a:19:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"4";s:16:"product_type_aid";s:1:"2";s:17:"magazine_main_aid";s:1:"2";s:6:"volumn";N;s:5:"issue";s:1:"1";s:4:"desc";s:0:"";s:13:"publisher_aid";s:2:"37";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:2:"11";s:8:"category";s:3:",3,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 10:22:40', 1),
(157, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-05 14:28:22', 0),
(158, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-05 14:28:22', 0),
(159, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-05 14:28:22', 0),
(160, 'status', 'admin/product-category/save', 'product_category_back_controller', 'save', 'Backend : Insert product category', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[Bookdose Gallery] just added into database.', 'a:7:{s:14:"user_owner_aid";s:1:"1";s:4:"name";s:16:"Bookdose Gallery";s:3:"url";s:16:"bookdose-gallery";s:16:"product_main_aid";s:1:"9";s:6:"weight";s:0:"";s:6:"status";s:1:"1";s:3:"aid";i:4;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 15:03:30', 1),
(161, 'status', 'admin/product/vdo/save', 'product_vdo_back_controller', 'save', 'Backend : Insert vdo', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[-][1] just added into database.', 'a:26:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:0:"";s:8:"category";s:3:",4,";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:1;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 15:04:44', 1),
(162, 'status', 'admin/product/vdo/save', 'product_vdo_back_controller', 'save', 'Backend : Insert vdo', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[-][2] just added into database.', 'a:26:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:0:"";s:8:"category";s:3:",4,";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:2;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 15:05:47', 1),
(163, 'status', 'admin/product/vdo/save', 'product_vdo_back_controller', 'save', 'Admin : Update vdo', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[test][2] has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:1:"0";s:8:"category";s:3:",4,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 15:10:40', 1),
(164, 'status', 'admin/product/vdo-gallerys/save', 'product_vdo_gallerys_back_controller', 'save', 'Backend : Insert photo gallery', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[title=][file =220170504160249m48e.jpg] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:02:49', 1),
(165, 'status', 'admin/product/vdo-gallerys/save', 'product_vdo_gallerys_back_controller', 'save', 'Backend : Insert photo gallery', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[title=][file =220170504160249mkce.jpg] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:02:49', 1),
(166, 'status', 'admin/product/vdo-gallerys/save', 'product_vdo_gallerys_back_controller', 'save', 'Backend : Insert photo gallery', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[title=][file =220170504160249B7u2.jpg] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:02:49', 1),
(167, 'status', 'admin/product/vdo-gallerys/save', 'product_vdo_gallerys_back_controller', 'save', 'Backend : Insert photo gallery', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[title=][file =220170504160249uI1x.jpg] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:02:49', 1),
(168, 'status', 'admin/product/vdo-gallerys/save', 'product_vdo_gallerys_back_controller', 'save', 'Backend : Insert photo gallery', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[title=][file =220170504160249zbhe.jpg] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:02:49', 1),
(169, 'status', 'admin/product/vdo/ajax-delete-one/5523773050', 'product_vdo_back_controller', 'ajax_delete_one', 'Backend : Delete vdo', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '- [aid = 1] has been deleted.', 'a:45:{s:3:"aid";s:1:"1";s:3:"cid";s:6:"000001";s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:1:"0";s:5:"title";s:1:"-";s:6:"author";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";s:1:"0";s:14:"is_recommended";s:1:"0";s:7:"is_home";s:1:"0";s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:8:"category";s:3:",4,";s:11:"upload_path";s:25:"uploads/dip/vdo/1/000001/";s:21:"cover_image_file_type";s:4:".jpg";s:3:"uri";s:0:"";s:3:"tag";s:0:"";s:10:"total_copy";s:1:"0";s:10:"total_view";s:1:"2";s:14:"total_view_web";s:1:"2";s:17:"total_view_device";s:1:"0";s:14:"total_download";s:1:"0";s:18:"total_download_web";s:1:"0";s:21:"total_download_device";s:1:"0";s:10:"total_read";s:1:"0";s:14:"total_read_web";s:1:"0";s:17:"total_read_device";s:1:"0";s:12:"total_rental";s:1:"0";s:10:"best_price";s:1:"0";s:9:"has_paper";N;s:9:"has_ebook";s:1:"0";s:11:"has_license";s:1:"0";s:12:"reward_point";s:1:"0";s:12:"review_point";s:1:"0";s:12:"created_date";s:19:"2017-04-05 15:04:44";s:10:"created_by";s:1:"1";s:12:"updated_date";s:19:"2017-04-05 15:04:45";s:10:"updated_by";s:1:"1";s:10:"bcc_status";s:1:"0";s:11:"cover_image";s:0:"";s:15:"thumbnail_image";s:0:"";s:11:"large_image";s:0:"";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:39:43', 1),
(170, 'status', 'admin/product/vdo/save', 'product_vdo_back_controller', 'save', 'Admin : Update vdo', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[test][2] has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:1:"0";s:8:"category";s:3:",4,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:41:02', 1),
(171, 'status', 'admin/product/vdo/save', 'product_vdo_back_controller', 'save', 'Admin : Update vdo', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[test][2] has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:1:"0";s:8:"category";s:3:",4,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:42:46', 1),
(172, 'status', 'admin/product/vdo/save', 'product_vdo_back_controller', 'save', 'Admin : Update vdo', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[-][2] has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"0";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:1:"0";s:8:"category";s:3:",4,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:43:26', 1),
(173, 'status', 'admin/product/vdo/save', 'product_vdo_back_controller', 'save', 'Backend : Insert vdo', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[ทดสอบ][3] just added into database.', 'a:26:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:0:"";s:8:"category";s:3:",4,";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:3;}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:45:30', 1),
(174, 'status', 'admin/product/vdo-gallerys/save', 'product_vdo_gallerys_back_controller', 'save', 'Backend : Insert photo gallery', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[title=][file =320170504164633QsqV.jpg] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:46:33', 1),
(175, 'status', 'admin/product/vdo-gallerys/save', 'product_vdo_gallerys_back_controller', 'save', 'Backend : Insert photo gallery', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[title=][file =32017050416463389UP.jpg] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:46:33', 1),
(176, 'status', 'admin/product/vdo-gallerys/save', 'product_vdo_gallerys_back_controller', 'save', 'Backend : Insert photo gallery', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[title=][file =3201705041646332rm4.jpg] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:46:33', 1),
(177, 'status', 'admin/product/vdo-gallerys/save', 'product_vdo_gallerys_back_controller', 'save', 'Backend : Insert photo gallery', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[title=][file =320170504164633tW8g.jpg] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:46:33', 1),
(178, 'status', 'admin/product/vdo-gallerys/save', 'product_vdo_gallerys_back_controller', 'save', 'Backend : Insert photo gallery', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[title=][file =320170504164633trU3.jpg] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:46:33', 1),
(179, 'status', 'admin/product/vdo-gallerys/save', 'product_vdo_gallerys_back_controller', 'save', 'Backend : Insert photo gallery', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[title=][file =320170504164633STO3.jpg] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:46:33', 1),
(180, 'status', 'admin/product/vdo-gallerys/save', 'product_vdo_gallerys_back_controller', 'save', 'Backend : Insert photo gallery', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[title=][file =320170504164633Hyu2.jpg] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:46:33', 1),
(181, 'status', 'admin/product/vdo-gallerys/save', 'product_vdo_gallerys_back_controller', 'save', 'Backend : Insert photo gallery', 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '[title=][file =320170504164633UCJ3.jpg] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:46:34', 1),
(182, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-06 16:45:44', 0),
(183, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-06 16:45:44', 0),
(184, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-06 16:45:44', 0),
(185, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-07 11:30:20', 0),
(186, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-07 11:30:20', 0),
(187, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-07 11:30:20', 0),
(188, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-10 17:05:29', 0),
(189, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-10 17:05:29', 0),
(190, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-10 17:05:29', 0),
(191, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-11 10:00:08', 0),
(192, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-11 10:00:08', 0),
(193, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-11 10:00:08', 0),
(194, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-12 16:23:45', 0),
(195, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-12 16:23:45', 0),
(196, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-12 16:23:45', 0),
(197, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-18 10:54:33', 0),
(198, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-18 10:54:33', 0),
(199, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-18 10:54:33', 0),
(200, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'oui@momothinks.com[1] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-18 10:58:19', 1);
INSERT INTO `log` (`aid`, `type`, `page`, `controller`, `action`, `title`, `browser`, `browser_detail`, `description`, `data`, `flag`, `owner_user_aid`, `owner_detail`, `ip`, `created_date`, `created_by`) VALUES
(201, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-18 12:13:41', 0),
(202, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-18 12:13:41', 0),
(203, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-18 12:13:41', 0),
(204, 'status', 'admin/event/save', 'event_back_controller', 'save', 'Backend : Insert event', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Bookdose เปิดตัวเข้าหลักทรัพย์วันแรก] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-18 14:45:38', 1),
(205, 'status', 'admin/event/save', 'event_back_controller', 'save', 'Admin : Update event', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Bookdose เปิดตัวเข้าหลักทรัพย์วันแรก] has been updated.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-18 14:50:54', 1),
(206, 'status', 'admin/event-main/save', 'event_main_back_controller', 'save', 'Backend : Update event main', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Events] has been updated.', 'a:6:{s:14:"user_owner_aid";s:1:"1";s:4:"name";s:6:"Events";s:3:"url";s:6:"events";s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:3:"aid";s:1:"1";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-18 14:51:39', 1),
(207, 'status', 'admin/event-main/save', 'event_main_back_controller', 'save', 'Backend : Update event main', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Events] has been updated.', 'a:6:{s:14:"user_owner_aid";s:1:"1";s:4:"name";s:6:"Events";s:3:"url";s:5:"event";s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:3:"aid";s:1:"1";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-18 14:52:16', 1),
(208, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-18 16:17:47', 0),
(209, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-18 16:17:47', 0),
(210, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-18 16:17:47', 0),
(211, 'status', 'admin/product/book/save', 'product_book_back_controller', 'save', 'Admin : Update book', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Test 2][3] has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"1";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"14";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:2:"20";s:8:"category";s:3:",1,";s:3:"tag";s:0:"";s:3:"aid";s:1:"3";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-18 16:38:46', 1),
(212, 'status', 'admin/product/book/save', 'product_book_back_controller', 'save', 'Admin : Update book', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Test 2][3] has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"1";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"14";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:2:"20";s:8:"category";s:3:",1,";s:3:"tag";s:0:"";s:3:"aid";s:1:"3";}', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-18 16:43:27', 1),
(213, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-20 09:49:16', 0),
(214, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-20 09:49:16', 0),
(215, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-20 09:49:16', 0),
(216, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-20 13:17:44', 0),
(217, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-20 13:17:44', 0),
(218, 'status', 'admin/user/save', 'user_back_controller', 'save', 'Admin : Update user', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com [aid = 18] has been updated with point [0].', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-20 13:18:55', 1),
(219, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com[18] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-20 13:19:40', 18),
(220, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-20 13:20:05', 0),
(221, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-20 13:20:05', 0),
(222, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-24 09:53:49', 0),
(223, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-24 09:53:49', 0),
(224, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-24 09:53:49', 0),
(225, 'status', 'admin/event/save', 'event_back_controller', 'save', 'Backend : Insert event', 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '[Bookdose เปิดตัวเข้าหลักทรัพย์วันแรก] just added into database.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-24 10:35:10', 1),
(226, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-24 11:37:54', 0),
(227, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-24 11:37:54', 0),
(228, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-24 11:37:54', 0),
(229, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 09:27:19', 0),
(230, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 09:27:19', 0),
(231, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 09:27:19', 0),
(232, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:28:55', 0),
(233, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:28:55', 0),
(234, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:28:55', 0),
(235, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'oui@momothinks.com[1] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-25 11:30:04', 1),
(236, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. anon@bookdose.com login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:30:41', 0),
(237, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:30:41', 0),
(238, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:30:41', 0),
(239, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com[18] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-25 11:37:35', 18),
(240, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:38:39', 0),
(241, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:60:"[admin] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:38:39', 0),
(242, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'admin just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:38:39', 0),
(243, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'oui@momothinks.com[1] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-25 11:42:29', 1),
(244, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:42:54', 0),
(245, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:42:54', 0),
(246, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com[18] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-25 11:46:20', 18),
(247, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:46:27', 0),
(248, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:46:27', 0),
(249, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com[18] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-25 11:46:35', 18),
(250, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. anon@bookdose.com login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:46:48', 0),
(251, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:46:48', 0),
(252, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 11:46:48', 0),
(253, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com[18] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-25 11:46:56', 18),
(254, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. anon@bookdose.com login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 12:05:50', 0),
(255, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. anon@bookdose.com login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 12:05:52', 0),
(256, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. anon@bookdose.com login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 12:06:02', 0),
(257, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. anon@bookdose.com login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 12:06:10', 0),
(258, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. anon@bookdose.com login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 12:06:19', 0),
(259, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. anon@bookdose.com login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 12:06:30', 0),
(260, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 12:06:54', 0),
(261, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. anon@bookdose.com login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 12:07:01', 0),
(262, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 12:07:24', 0),
(263, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. anon@bookdose.com login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 13:58:38', 0),
(264, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 14:00:10', 0),
(265, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 14:02:54', 0),
(266, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 14:03:06', 0),
(267, 'debug', 'forgot/verify', 'forgot_controller', 'verify', 'Forgot password email', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '[anon@bookdose.com] \r\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">\r\n<head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\r\n<title>http://www.nialib.com</title>\r\n<style type="text/css">\r\nbody{background-color:#FFF; margin:0; padding:0; color:#366092} \r\ntd{padding:5px 0;font-size:12px; font-family:Tahoma; color:#366092;} \r\n.hcenter{text-align:center;}\r\n.hright{text-align:right;}\r\n.hleft{text-align:left;}\r\n.linedown{border-bottom:1px solid #CCC;}\r\n.header{font-size:12px;color:#FFF;background-color:#366092;font-weight:bold;}\r\n.h2{font-size:24px;font-weight:normal;}\r\n.footer{padding:0px}\r\n.bill-header{font-size:12px;font-weight:normal;padding:0px;}\r\na.button{padding:10px;text-decoration:none;font-weight:bold;border-radius:5px;min-width:200px;}\r\na.confirm{color:#465821;background-color:#9CC746;}\r\na.cancel{color:#621C1A;background-color:#CE3B37;}\r\n\r\n</style>\r\n</head>\r\n<body>\r\n<table cellspacing="0" cellpadding="0" border="0" width="800">\r\n<tr valign="bottom">\r\n<td width="20">&nbsp;</td>\r\n<td width="200" height="100" class=""><a href="http://www.nialib.com"><img src="http://belib-nia.local/styles/dip/images/background/logo-mail.png" alt="http://www.nialib.com" /></a></td>\r\n<td height="100" class="">&nbsp;</td>\r\n<td width="20">&nbsp;</td>\r\n</tr>\r\n<tr valign="bottom">\r\n<td width="20">&nbsp;</td>\r\n<td width="200" height="" class="hcenter h2">&nbsp;</td>\r\n<td height="" class="">&nbsp;</td>\r\n<td width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td width="20">&nbsp;</td>\r\n<td colspan="2">\r\n\r\n<table cellspacing="0" cellpadding="0" border="0" width="100%">\r\n	<tr><td class="hcenter h2">Request Reset Password</td></tr>\r\n	<tr><td>Dear <strong>Anon Dechpala</strong> [anon@bookdose.com],</td></tr>\r\n	<tr><td>&nbsp;</td></tr>\r\n	<tr><td>You have got this email because your account has been requested to reset new password. For setting new password, please go to: </td></tr>\r\n	<tr><td><a href="http://belib-nia.local/forgot/change/anon@bookdose.com/ZCu6p85g">http://belib-nia.local/forgot/change/anon@bookdose.com/ZCu6p85g</a></td></tr>\r\n	<tr><td>If you suspect this request not made by you, please contact us immediately at <a href="mailto:nia.library@nia.go.th" >nia.library@nia.go.th<a></td></tr>\r\n</table>\r\n\r\n</td>\r\n<td width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer" colspan="2">&nbsp;</td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer hleft" colspan="2"> Best regards,</td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer hleft" colspan="2">ห้องสมุดสื่อทรัพยากรออนไลน์</td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer" colspan="2">&nbsp;</td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer hleft" colspan="2">Email : <a href="mailto:nia.library@nia.go.th" >nia.library@nia.go.th<a></td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer hleft" colspan="2">Website : <a href="http://www.nialib.com">http://www.nialib.com</a></td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n</table>\r\n</body>\r\n</html>\r\n', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 14:04:07', 0),
(268, 'status', 'forgot/verify', 'forgot_controller', 'verify', 'Forgot password request', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com[18] just submitted forgot password form. Confirm code is ZCu6p85g. Email sent success.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 14:04:10', 0),
(269, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 14:05:17', 0),
(270, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 14:05:17', 0),
(271, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com[18] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-25 14:33:38', 18),
(272, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 14:39:42', 0),
(273, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-25 14:39:42', 0),
(274, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-26 17:52:02', 0),
(275, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-26 17:52:02', 0),
(276, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 11:23:41', 0),
(277, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 11:23:48', 0),
(278, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 11:23:48', 0),
(279, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 53.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 11:55:11', 0),
(280, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 53.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 11:55:19', 0),
(281, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 53.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', 'Login failed. admin login with incorrect password.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 11:55:25', 0),
(282, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 53.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 11:55:40', 0),
(283, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 53.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', 'anon@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 11:55:40', 0),
(284, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 13:20:52', 0),
(285, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 13:20:52', 0),
(286, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'anon@bookdose.com[18] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-27 15:02:58', 18),
(287, 'status', 'logout', 'login_controller', 'logout', 'Logout', 'Unknown Windows OS/Firefox 53.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', 'anon@bookdose.com[18] just log out.', 's:0:"";', '', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-27 15:48:38', 18),
(288, 'status', 'registration/save', 'registration_controller', 'save', 'Online registration', 'Unknown Windows OS/Firefox 53.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', '[19] just saved into database. Wating for send email.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 17:28:47', 0),
(289, 'debug', 'registration/save', 'registration_controller', 'save', 'Online registration email', 'Unknown Windows OS/Firefox 53.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', '[kasinee.nut@gmail.com] \r\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">\r\n<head>\r\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\r\n<title>http://www.nialib.com</title>\r\n<style type="text/css">\r\nbody{background-color:#FFF; margin:0; padding:0; color:#366092} \r\ntd{padding:5px 0;font-size:12px; font-family:Tahoma; color:#366092;} \r\n.hcenter{text-align:center;}\r\n.hright{text-align:right;}\r\n.hleft{text-align:left;}\r\n.linedown{border-bottom:1px solid #CCC;}\r\n.header{font-size:12px;color:#FFF;background-color:#366092;font-weight:bold;}\r\n.h2{font-size:24px;font-weight:normal;}\r\n.footer{padding:0px}\r\n.bill-header{font-size:12px;font-weight:normal;padding:0px;}\r\na.button{padding:10px;text-decoration:none;font-weight:bold;border-radius:5px;min-width:200px;}\r\na.confirm{color:#465821;background-color:#9CC746;}\r\na.cancel{color:#621C1A;background-color:#CE3B37;}\r\n\r\n</style>\r\n</head>\r\n<body>\r\n<table cellspacing="0" cellpadding="0" border="0" width="800">\r\n<tr valign="bottom">\r\n<td width="20">&nbsp;</td>\r\n<td width="200" height="100" class=""><a href="http://www.nialib.com"><img src="http://dip-elibs.local/styles/dip/images/background/logo-mail.png" alt="http://www.nialib.com" /></a></td>\r\n<td height="100" class="">&nbsp;</td>\r\n<td width="20">&nbsp;</td>\r\n</tr>\r\n<tr valign="bottom">\r\n<td width="20">&nbsp;</td>\r\n<td width="200" height="" class="hcenter h2">&nbsp;</td>\r\n<td height="" class="">&nbsp;</td>\r\n<td width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td width="20">&nbsp;</td>\r\n<td colspan="2">\r\n\r\n<table cellspacing="0" cellpadding="0" border="0" width="100%">\r\n	<tr><td class="hcenter h2">Account  Activation</td></tr>\r\n	<tr><td>Dear <strong>kasinee.nut@gmail.com</strong> [],</td></tr>\r\n	<tr><td>&nbsp;</td></tr>\r\n	<tr><td>Thank you for signing up to ห้องสมุดสื่อทรัพยากรออนไลน์. Your account is now pending for activation. Please activate your account by clicking on below link:</td></tr>\r\n	<tr><td><a href="http://dip-elibs.local/activation/kasinee.nut@gmail.com/Gwg1y9aD">http://dip-elibs.local/activation/kasinee.nut@gmail.com/Gwg1y9aD</a></td></tr>\r\n	<tr><td>After activation is completed, you can use your registered Username () and password to access to <a href="http://dip-elibs.local/login">ห้องสมุดสื่อทรัพยากรออนไลน์</a></td></tr>\r\n	<tr><td>If you have any inquires and troubles, please contact us at <a href="mailto:nia.library@nia.go.th" >nia.library@nia.go.th<a></td></tr>\r\n</table>\r\n\r\n</td>\r\n<td width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer" colspan="2">&nbsp;</td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer hleft" colspan="2"> Best regards,</td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer hleft" colspan="2">ห้องสมุดสื่อทรัพยากรออนไลน์</td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer" colspan="2">&nbsp;</td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer hleft" colspan="2">Email : <a href="mailto:nia.library@nia.go.th" >nia.library@nia.go.th<a></td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td class="footer" width="20">&nbsp;</td>\r\n<td class="footer hleft" colspan="2">Website : <a href="http://www.nialib.com">http://www.nialib.com</a></td>\r\n<td class="footer" width="20">&nbsp;</td>\r\n</tr>\r\n</table>\r\n</body>\r\n</html>\r\n', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 17:28:47', 0),
(290, 'status', 'registration/save', 'registration_controller', 'save', 'Online registration', 'Unknown Windows OS/Firefox 53.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', 'Welcome email sent success.[19] just been submitted.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 17:28:52', 0),
(291, 'status', 'activation/kasinee.nut@gmail.com/Gwg1y9aD', 'activation_controller', 'index', 'User activation', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'kasinee.nut@gmail.com[19] just been activated.', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 17:30:08', 0),
(292, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Access', 's:76:"[kasinee.nut@gmail.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 17:30:27', 0),
(293, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'kasinee.nut@gmail.com just login for the first time. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 17:30:27', 0),
(294, 'status', 'login/verify', 'login_controller', 'verify', 'Start checking some conditions', 'Unknown Windows OS/Firefox 53.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', 'Access', 's:72:"[anon@bookdose.com] Start checking some conditions after authentication.";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 17:51:01', 0),
(295, 'status', 'login/verify', 'login_controller', 'verify', 'Login from "Login Page"', 'Unknown Windows OS/Firefox 53.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', 'anon@bookdose.com just login. remember : []', 's:0:"";', '', 1, '[N/A] aid = 1', '::1', '2017-04-27 17:51:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `log_access_product`
--

CREATE TABLE `log_access_product` (
  `user_aid` int(10) UNSIGNED NOT NULL,
  `copy_aid` int(10) UNSIGNED NOT NULL,
  `parent_aid` int(11) NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log_paysbuy`
--

CREATE TABLE `log_paysbuy` (
  `aid` int(10) UNSIGNED NOT NULL,
  `result` varchar(255) DEFAULT NULL,
  `apCode` varchar(255) DEFAULT NULL,
  `amt` varchar(255) DEFAULT NULL,
  `fee` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `confirm_cs` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `owner_user_aid` int(10) UNSIGNED DEFAULT NULL,
  `owner_detail` text,
  `ip` varchar(15) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log_product`
--

CREATE TABLE `log_product` (
  `aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `title` text,
  `action` varchar(255) DEFAULT NULL COMMENT 'I:Insert , U:Update, D:Delete',
  `status` tinyint(1) UNSIGNED NOT NULL,
  `browser` varchar(128) DEFAULT NULL,
  `browser_detail` varchar(255) DEFAULT NULL,
  `description` text,
  `data` longtext,
  `flag` varchar(50) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED DEFAULT NULL,
  `user_owner_detail` text,
  `ip` varchar(15) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log_product`
--

INSERT INTO `log_product` (`aid`, `user_aid`, `parent_aid`, `product_type_aid`, `title`, `action`, `status`, `browser`, `browser_detail`, `description`, `data`, `flag`, `user_owner_aid`, `user_owner_detail`, `ip`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 1, 1, 1, 'อภินิหาร', 'I', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'New book has been added.', 'a:26:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"1";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"30";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-21";s:12:"expired_date";N;s:12:"reward_point";s:2:"12";s:8:"category";s:3:",1,";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:1;}', 'book-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-21 15:02:10', 1, '2017-03-21 15:02:10', 1),
(2, 1, 1, 1, 'อภินิหาร', 'U', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Book copy [barcode = 1234567890] has been added', 'a:39:{s:10:"parent_aid";s:1:"1";s:16:"product_type_aid";s:1:"1";s:21:"nonconsume_identifier";s:0:"";s:14:"user_owner_aid";s:1:"1";s:3:"cid";s:12:"phemSQp69uzF";s:12:"publish_date";s:10:"2017-03-21";s:12:"expired_date";N;s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:10:"copy_title";s:24:"อภินิหาร";s:11:"cover_price";s:3:"999";s:6:"source";s:0:"";s:4:"no_1";s:2:"01";s:4:"no_2";s:2:"03";s:4:"no_3";s:4:"2015";s:4:"no_4";s:0:"";s:22:"product_type_minor_aid";s:1:"2";s:4:"type";s:1:"2";s:10:"type_minor";s:1:"3";s:10:"possession";s:1:"2";s:8:"is_ebook";i:0;s:10:"is_license";s:0:"";s:17:"ebook_concurrence";s:0:"";s:13:"digital_price";s:0:"";s:13:"digital_point";s:0:"";s:11:"paper_price";s:1:"0";s:11:"paper_point";s:1:"0";s:13:"transport_aid";s:1:"0";s:15:"transport_price";s:0:"";s:8:"in_stock";s:1:"0";s:13:"rental_period";s:0:"";s:10:"rental_fee";b:0;s:16:"rental_fee_point";b:0;s:15:"rental_fine_fee";b:0;s:12:"shelf_status";s:1:"1";s:10:"shelf_name";s:1:"2";s:7:"barcode";s:10:"1234567890";s:11:"upload_path";s:54:"uploads/nia/book_copy/2017/03/1234567890_phemSQp69uzF/";s:15:"use_digital_gen";b:0;}', 'copy-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-21 15:03:41', 1, '2017-03-21 15:03:41', 1),
(3, 1, 1, 1, 'อภินิหาร', 'U', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'General info has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"1";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"30";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-21";s:12:"expired_date";N;s:12:"reward_point";s:2:"12";s:8:"category";s:3:",1,";s:3:"tag";s:0:"";s:3:"aid";s:1:"1";}', 'book-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1),
(4, 1, 2, 1, 'สิ่งแวดล้อม', 'I', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'New book has been added.', 'a:26:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"3";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"30";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:2:"12";s:8:"category";s:0:"";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:2;}', 'book-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 16:56:44', 1, '2017-03-31 16:56:44', 1),
(5, 1, 2, 1, 'สิ่งแวดล้อม', 'U', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Book copy [barcode = B1234567890] has been added', 'a:39:{s:10:"parent_aid";s:1:"2";s:16:"product_type_aid";s:1:"1";s:21:"nonconsume_identifier";s:0:"";s:14:"user_owner_aid";s:1:"1";s:3:"cid";s:12:"kFhG4Iu9lm6C";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:10:"copy_title";s:36:"สิ่งแวดล้อม222";s:11:"cover_price";s:3:"180";s:6:"source";s:0:"";s:4:"no_1";s:0:"";s:4:"no_2";s:0:"";s:4:"no_3";s:0:"";s:4:"no_4";s:0:"";s:22:"product_type_minor_aid";s:1:"3";s:4:"type";s:1:"1";s:10:"type_minor";s:1:"1";s:10:"possession";s:1:"1";s:8:"is_ebook";i:1;s:10:"is_license";s:0:"";s:17:"ebook_concurrence";s:0:"";s:13:"digital_price";s:1:"0";s:13:"digital_point";s:1:"0";s:11:"paper_price";s:0:"";s:11:"paper_point";s:0:"";s:13:"transport_aid";s:0:"";s:15:"transport_price";s:0:"";s:8:"in_stock";s:0:"";s:13:"rental_period";s:0:"";s:10:"rental_fee";b:0;s:16:"rental_fee_point";b:0;s:15:"rental_fine_fee";b:0;s:12:"shelf_status";s:1:"1";s:10:"shelf_name";s:0:"";s:7:"barcode";s:11:"B1234567890";s:11:"upload_path";s:55:"uploads/dip/book_copy/2017/03/B1234567890_kFhG4Iu9lm6C/";s:15:"use_digital_gen";b:0;}', 'copy-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 16:57:50', 1, '2017-03-31 16:57:50', 1),
(6, 1, 2, 1, 'สิ่งแวดล้อม', 'U', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'General info has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"3";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"30";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:2:"12";s:8:"category";s:0:"";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', 'book-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 16:58:28', 1, '2017-03-31 16:58:28', 1),
(7, 1, 3, 1, 'Test 2', 'I', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'New book has been added.', 'a:26:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"1";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"14";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:2:"20";s:8:"category";s:3:",1,";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:3;}', 'book-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:00:00', 1, '2017-03-31 17:00:00', 1),
(8, 1, 3, 1, 'Test 2', 'U', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Book copy [barcode = PB000001] has been added', 'a:39:{s:10:"parent_aid";s:1:"3";s:16:"product_type_aid";s:1:"1";s:21:"nonconsume_identifier";s:0:"";s:14:"user_owner_aid";s:1:"1";s:3:"cid";s:12:"oXEpOcJNd6W6";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:10:"copy_title";s:6:"Test 2";s:11:"cover_price";s:3:"199";s:6:"source";s:0:"";s:4:"no_1";s:0:"";s:4:"no_2";s:0:"";s:4:"no_3";s:0:"";s:4:"no_4";s:0:"";s:22:"product_type_minor_aid";s:1:"2";s:4:"type";s:1:"2";s:10:"type_minor";s:1:"3";s:10:"possession";s:1:"2";s:8:"is_ebook";i:0;s:10:"is_license";s:0:"";s:17:"ebook_concurrence";s:0:"";s:13:"digital_price";s:0:"";s:13:"digital_point";s:0:"";s:11:"paper_price";s:1:"0";s:11:"paper_point";s:1:"0";s:13:"transport_aid";s:1:"0";s:15:"transport_price";s:0:"";s:8:"in_stock";s:1:"0";s:13:"rental_period";s:0:"";s:10:"rental_fee";b:0;s:16:"rental_fee_point";b:0;s:15:"rental_fine_fee";b:0;s:12:"shelf_status";s:1:"1";s:10:"shelf_name";s:1:"3";s:7:"barcode";s:8:"PB000001";s:11:"upload_path";s:52:"uploads/dip/book_copy/2017/03/PB000001_oXEpOcJNd6W6/";s:15:"use_digital_gen";b:0;}', 'copy-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:00:28', 1, '2017-03-31 17:00:28', 1),
(9, 1, 2, 1, 'สิ่งแวดล้อม', 'U', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'General info has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"3";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"30";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:2:"12";s:8:"category";s:0:"";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', 'book-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:01:01', 1, '2017-03-31 17:01:01', 1),
(10, 1, 1, 2, 'Max Bild', 'I', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'New magazine has been added.', 'a:8:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"2";s:16:"product_type_aid";s:1:"2";s:13:"publisher_aid";s:2:"39";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:5:"title";s:8:"Max Bild";s:3:"aid";i:1;}', 'magazine-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:02:46', 1, '2017-03-31 17:02:46', 1),
(11, 1, 1, 2, 'Max Bild', 'U', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'General info has been updated.', 'a:8:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"2";s:16:"product_type_aid";s:1:"2";s:13:"publisher_aid";s:2:"39";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:5:"title";s:8:"Max Bild";s:3:"aid";s:1:"1";}', 'magazine-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:02:52', 1, '2017-03-31 17:02:52', 1),
(12, 1, 1, 2, 'Max Bild Vol. 1 Issue. 1', 'I', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'New magazine has been added.', 'a:30:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"2";s:16:"product_type_aid";s:1:"2";s:17:"magazine_main_aid";s:1:"1";s:6:"volumn";s:1:"1";s:5:"issue";s:1:"1";s:4:"desc";s:0:"";s:13:"publisher_aid";s:2:"39";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:0:"";s:8:"category";s:0:"";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:1;}', 'magazine-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(13, 1, 1, 2, 'Max Bild Vol. 1 Issue. 1', 'U', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Magazine copy [barcode = PB000002] has been added', 'a:39:{s:10:"parent_aid";s:1:"1";s:16:"product_type_aid";s:1:"2";s:21:"nonconsume_identifier";s:0:"";s:14:"user_owner_aid";s:1:"1";s:3:"cid";s:12:"Q8y9XtJJJne1";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:10:"copy_title";s:0:"";s:11:"cover_price";s:3:"199";s:6:"source";s:0:"";s:4:"no_1";s:0:"";s:4:"no_2";s:0:"";s:4:"no_3";s:0:"";s:4:"no_4";s:0:"";s:22:"product_type_minor_aid";s:1:"2";s:4:"type";s:1:"2";s:10:"type_minor";s:1:"4";s:10:"possession";s:1:"2";s:8:"is_ebook";i:0;s:10:"is_license";s:0:"";s:17:"ebook_concurrence";s:0:"";s:13:"digital_price";s:0:"";s:13:"digital_point";s:0:"";s:11:"paper_price";s:1:"0";s:11:"paper_point";s:1:"0";s:13:"transport_aid";s:1:"0";s:15:"transport_price";s:0:"";s:8:"in_stock";s:1:"0";s:13:"rental_period";s:0:"";s:10:"rental_fee";b:0;s:16:"rental_fee_point";b:0;s:15:"rental_fine_fee";b:0;s:12:"shelf_status";s:1:"1";s:10:"shelf_name";s:0:"";s:7:"barcode";s:8:"PB000002";s:11:"upload_path";s:56:"uploads/dip/magazine_copy/2017/03/PB000002_Q8y9XtJJJne1/";s:15:"use_digital_gen";b:0;}', 'copy-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:03:32', 1, '2017-03-31 17:03:32', 1),
(14, 1, 1, 3, 'พลังงาน', 'I', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'New vdo has been added.', 'a:26:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"5";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:0:"";s:8:"category";s:0:"";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:1;}', 'vdo-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:06:08', 1, '2017-03-31 17:06:08', 1),
(15, 1, 2, 1, 'สิ่งแวดล้อม', 'U', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'General info has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"3";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"30";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:2:"12";s:8:"category";s:3:",2,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', 'book-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1),
(16, 1, 1, 1, 'อภินิหาร', 'U', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Field [Author] has been updated', 'a:5:{s:10:"parent_aid";s:1:"1";s:16:"product_type_aid";s:1:"1";s:7:"ind1_cd";s:0:"";s:7:"ind2_cd";s:0:"";s:10:"field_data";s:75:"ชื่อผู้แต่งแสดงตรงนี้ครับ";}', 'field-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-04 16:49:13', 1, '2017-04-04 16:49:13', 1),
(17, 1, 2, 2, 'Bookdose', 'I', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'New magazine has been added.', 'a:8:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"4";s:16:"product_type_aid";s:1:"2";s:13:"publisher_aid";s:2:"37";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:5:"title";s:8:"Bookdose";s:3:"aid";i:2;}', 'magazine-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 09:09:52', 1, '2017-04-05 09:09:52', 1),
(18, 1, 2, 2, 'Bookdose Issue. 1', 'I', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'New magazine has been added.', 'a:30:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"4";s:16:"product_type_aid";s:1:"2";s:17:"magazine_main_aid";s:1:"2";s:6:"volumn";N;s:5:"issue";s:1:"1";s:4:"desc";s:0:"";s:13:"publisher_aid";s:2:"37";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:2:"11";s:8:"category";s:0:"";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:2;}', 'magazine-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 09:11:50', 1, '2017-04-05 09:11:50', 1),
(19, 1, 2, 2, 'Bookdose Issue. 1', 'U', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Magazine copy [barcode = DB000001] has been added', 'a:39:{s:10:"parent_aid";s:1:"2";s:16:"product_type_aid";s:1:"2";s:21:"nonconsume_identifier";s:0:"";s:14:"user_owner_aid";s:1:"1";s:3:"cid";s:12:"t5M1kfyoPuZf";s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:10:"copy_title";s:0:"";s:11:"cover_price";s:3:"125";s:6:"source";s:0:"";s:4:"no_1";s:0:"";s:4:"no_2";s:0:"";s:4:"no_3";s:0:"";s:4:"no_4";s:0:"";s:22:"product_type_minor_aid";s:1:"3";s:4:"type";s:1:"1";s:10:"type_minor";s:1:"2";s:10:"possession";s:1:"1";s:8:"is_ebook";i:1;s:10:"is_license";s:0:"";s:17:"ebook_concurrence";s:0:"";s:13:"digital_price";s:1:"0";s:13:"digital_point";s:1:"0";s:11:"paper_price";s:0:"";s:11:"paper_point";s:0:"";s:13:"transport_aid";s:0:"";s:15:"transport_price";s:0:"";s:8:"in_stock";s:0:"";s:13:"rental_period";s:0:"";s:10:"rental_fee";b:0;s:16:"rental_fee_point";b:0;s:15:"rental_fine_fee";b:0;s:12:"shelf_status";s:1:"1";s:10:"shelf_name";s:0:"";s:7:"barcode";s:8:"DB000001";s:11:"upload_path";s:56:"uploads/dip/magazine_copy/2017/04/DB000001_t5M1kfyoPuZf/";s:15:"use_digital_gen";b:0;}', 'copy-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 09:23:52', 1, '2017-04-05 09:23:52', 1),
(20, 1, 2, 2, 'Bookdose Issue. 1', 'U', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'Magazine copy [barcode = DB000001] has been updated', 'a:40:{s:10:"parent_aid";s:1:"2";s:16:"product_type_aid";s:1:"2";s:21:"nonconsume_identifier";s:0:"";s:14:"user_owner_aid";s:1:"1";s:3:"aid";s:1:"2";s:3:"cid";s:12:"t5M1kfyoPuZf";s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:6:"weight";s:1:"0";s:6:"status";s:1:"1";s:10:"copy_title";s:0:"";s:11:"cover_price";s:3:"125";s:6:"source";s:0:"";s:4:"no_1";s:0:"";s:4:"no_2";s:0:"";s:4:"no_3";s:0:"";s:4:"no_4";s:0:"";s:22:"product_type_minor_aid";s:1:"3";s:4:"type";s:1:"1";s:10:"type_minor";s:1:"2";s:10:"possession";s:1:"1";s:8:"is_ebook";i:1;s:10:"is_license";s:0:"";s:17:"ebook_concurrence";s:0:"";s:13:"digital_price";s:1:"0";s:13:"digital_point";s:1:"0";s:11:"paper_price";s:0:"";s:11:"paper_point";s:0:"";s:13:"transport_aid";s:0:"";s:15:"transport_price";s:0:"";s:8:"in_stock";s:0:"";s:13:"rental_period";s:0:"";s:10:"rental_fee";b:0;s:16:"rental_fee_point";b:0;s:15:"rental_fine_fee";b:0;s:12:"shelf_status";s:1:"1";s:10:"shelf_name";s:0:"";s:7:"barcode";s:8:"DB000001";s:11:"upload_path";s:56:"uploads/dip/magazine_copy/2017/04/DB000001_t5M1kfyoPuZf/";s:15:"use_digital_gen";b:0;}', 'copy-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 09:24:47', 1, '2017-04-05 09:24:47', 1),
(21, 1, 2, 2, 'Bookdose Issue. 1', 'U', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'General info has been updated.', 'a:19:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"4";s:16:"product_type_aid";s:1:"2";s:17:"magazine_main_aid";s:1:"2";s:6:"volumn";N;s:5:"issue";s:1:"1";s:4:"desc";s:0:"";s:13:"publisher_aid";s:2:"37";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:2:"11";s:8:"category";s:3:",3,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', 'magazine-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 09:26:43', 1, '2017-04-05 09:26:43', 1),
(22, 1, 2, 2, 'Bookdose Issue. 1', 'U', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'General info has been updated.', 'a:19:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"4";s:16:"product_type_aid";s:1:"2";s:17:"magazine_main_aid";s:1:"2";s:6:"volumn";N;s:5:"issue";s:1:"1";s:4:"desc";s:0:"";s:13:"publisher_aid";s:2:"37";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:2:"11";s:8:"category";s:3:",3,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', 'magazine-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 09:27:17', 1, '2017-04-05 09:27:17', 1),
(23, 1, 2, 2, 'Bookdose Issue. 1', 'U', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'General info has been updated.', 'a:19:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"4";s:16:"product_type_aid";s:1:"2";s:17:"magazine_main_aid";s:1:"2";s:6:"volumn";N;s:5:"issue";s:1:"1";s:4:"desc";s:0:"";s:13:"publisher_aid";s:2:"37";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:2:"11";s:8:"category";s:3:",3,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', 'magazine-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(24, 1, 1, 3, '-', 'I', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'New vdo has been added.', 'a:26:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:0:"";s:8:"category";s:3:",4,";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:1;}', 'vdo-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 15:04:44', 1, '2017-04-05 15:04:44', 1),
(25, 1, 2, 3, '-', 'I', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'New vdo has been added.', 'a:26:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:0:"";s:8:"category";s:3:",4,";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:2;}', 'vdo-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 15:05:47', 1, '2017-04-05 15:05:47', 1),
(26, 1, 2, 3, 'test', 'U', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'General info has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:1:"0";s:8:"category";s:3:",4,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', 'vdo-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 15:10:40', 1, '2017-04-05 15:10:40', 1),
(27, 1, 1, 3, '-', 'D', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Vdo has been deleted.', 'a:45:{s:3:"aid";s:1:"1";s:3:"cid";s:6:"000001";s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:1:"0";s:5:"title";s:1:"-";s:6:"author";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";s:1:"0";s:14:"is_recommended";s:1:"0";s:7:"is_home";s:1:"0";s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:8:"category";s:3:",4,";s:11:"upload_path";s:25:"uploads/dip/vdo/1/000001/";s:21:"cover_image_file_type";s:4:".jpg";s:3:"uri";s:0:"";s:3:"tag";s:0:"";s:10:"total_copy";s:1:"0";s:10:"total_view";s:1:"2";s:14:"total_view_web";s:1:"2";s:17:"total_view_device";s:1:"0";s:14:"total_download";s:1:"0";s:18:"total_download_web";s:1:"0";s:21:"total_download_device";s:1:"0";s:10:"total_read";s:1:"0";s:14:"total_read_web";s:1:"0";s:17:"total_read_device";s:1:"0";s:12:"total_rental";s:1:"0";s:10:"best_price";s:1:"0";s:9:"has_paper";N;s:9:"has_ebook";s:1:"0";s:11:"has_license";s:1:"0";s:12:"reward_point";s:1:"0";s:12:"review_point";s:1:"0";s:12:"created_date";s:19:"2017-04-05 15:04:44";s:10:"created_by";s:1:"1";s:12:"updated_date";s:19:"2017-04-05 15:04:45";s:10:"updated_by";s:1:"1";s:10:"bcc_status";s:1:"0";s:11:"cover_image";s:0:"";s:15:"thumbnail_image";s:0:"";s:11:"large_image";s:0:"";}', 'vdo-delete', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:39:43', 1, '2017-04-05 16:39:43', 1),
(28, 1, 2, 3, 'test', 'U', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'General info has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:1:"0";s:8:"category";s:3:",4,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', 'vdo-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:41:02', 1, '2017-04-05 16:41:02', 1),
(29, 1, 2, 3, 'test', 'U', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'General info has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:1:"0";s:8:"category";s:3:",4,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', 'vdo-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:42:46', 1, '2017-04-05 16:42:46', 1),
(30, 1, 2, 3, '-', 'U', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'General info has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"0";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:1:"0";s:8:"category";s:3:",4,";s:3:"tag";s:0:"";s:3:"aid";s:1:"2";}', 'vdo-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:43:26', 1, '2017-04-05 16:43:26', 1),
(31, 1, 3, 3, 'ทดสอบ', 'I', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'New vdo has been added.', 'a:26:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"9";s:16:"product_type_aid";s:1:"3";s:13:"publisher_aid";s:0:"";s:6:"status";s:1:"1";s:6:"weight";s:0:"";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-04-05";s:12:"expired_date";N;s:12:"reward_point";s:0:"";s:8:"category";s:3:",4,";s:3:"tag";s:0:"";s:10:"total_view";i:0;s:14:"total_view_web";i:0;s:17:"total_view_device";i:0;s:14:"total_download";i:0;s:18:"total_download_web";i:0;s:21:"total_download_device";i:0;s:10:"total_read";i:0;s:14:"total_read_web";i:0;s:17:"total_read_device";i:0;s:12:"total_rental";i:0;s:12:"review_point";i:0;s:3:"aid";i:3;}', 'vdo-add', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-05 16:45:30', 1, '2017-04-05 16:45:30', 1),
(32, 1, 3, 1, 'Test 2', 'U', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'General info has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"1";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"14";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";b:0;s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:2:"20";s:8:"category";s:3:",1,";s:3:"tag";s:0:"";s:3:"aid";s:1:"3";}', 'book-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-18 16:38:46', 1, '2017-04-18 16:38:46', 1),
(33, 1, 3, 1, 'Test 2', 'U', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', 'General info has been updated.', 'a:15:{s:14:"user_owner_aid";s:1:"1";s:16:"product_main_aid";s:1:"1";s:16:"product_type_aid";s:1:"1";s:13:"publisher_aid";s:2:"14";s:6:"status";s:1:"1";s:6:"weight";s:1:"0";s:6:"is_new";b:0;s:14:"is_recommended";b:0;s:7:"is_home";s:1:"1";s:12:"publish_date";s:10:"2017-03-31";s:12:"expired_date";N;s:12:"reward_point";s:2:"20";s:8:"category";s:3:",1,";s:3:"tag";s:0:"";s:3:"aid";s:1:"3";}', 'book-update', 1, '[Bookdose Co., Ltd.] aid = 1', '::1', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `log_webservice`
--

CREATE TABLE `log_webservice` (
  `aid` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) NOT NULL,
  `page` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `browser` varchar(128) DEFAULT NULL,
  `browser_detail` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `flag` varchar(50) DEFAULT NULL,
  `owner_user_aid` int(10) UNSIGNED DEFAULT NULL,
  `owner_detail` text,
  `ip` varchar(15) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `magazine`
--

CREATE TABLE `magazine` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `product_main_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `magazine_main_aid` int(10) UNSIGNED DEFAULT NULL,
  `volumn` int(10) UNSIGNED DEFAULT NULL,
  `issue` int(10) UNSIGNED DEFAULT NULL,
  `desc` text,
  `publisher_aid` int(10) UNSIGNED DEFAULT NULL,
  `title` text,
  `author` text,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '0:Not Active, 1:Active',
  `weight` float DEFAULT '0',
  `is_new` tinyint(4) DEFAULT '0',
  `is_recommended` tinyint(4) DEFAULT '0',
  `is_home` tinyint(4) UNSIGNED DEFAULT '0',
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `upload_path` text,
  `cover_image_file_type` varchar(5) DEFAULT NULL,
  `uri` text,
  `tag` longtext,
  `total_copy` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_view` int(10) UNSIGNED DEFAULT '0',
  `total_view_web` int(10) UNSIGNED DEFAULT '0',
  `total_view_device` int(10) UNSIGNED DEFAULT '0',
  `total_download` int(10) UNSIGNED DEFAULT '0',
  `total_download_web` int(10) UNSIGNED DEFAULT '0',
  `total_download_device` int(10) UNSIGNED DEFAULT '0',
  `total_read` int(10) UNSIGNED DEFAULT '0',
  `total_read_web` int(10) UNSIGNED DEFAULT '0',
  `total_read_device` int(10) UNSIGNED DEFAULT '0',
  `total_rental` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `best_price` int(10) UNSIGNED DEFAULT NULL,
  `has_paper` tinyint(1) UNSIGNED DEFAULT NULL,
  `has_ebook` tinyint(1) UNSIGNED DEFAULT NULL,
  `has_license` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `reward_point` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `review_point` int(10) UNSIGNED DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `bcc_status` tinyint(4) NOT NULL,
  `cover_image` varchar(500) NOT NULL,
  `thumbnail_image` varchar(500) NOT NULL,
  `large_image` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `magazine`
--

INSERT INTO `magazine` (`aid`, `cid`, `user_owner_aid`, `product_main_aid`, `product_type_aid`, `magazine_main_aid`, `volumn`, `issue`, `desc`, `publisher_aid`, `title`, `author`, `status`, `weight`, `is_new`, `is_recommended`, `is_home`, `publish_date`, `expired_date`, `category`, `upload_path`, `cover_image_file_type`, `uri`, `tag`, `total_copy`, `total_view`, `total_view_web`, `total_view_device`, `total_download`, `total_download_web`, `total_download_device`, `total_read`, `total_read_web`, `total_read_device`, `total_rental`, `best_price`, `has_paper`, `has_ebook`, `has_license`, `reward_point`, `review_point`, `created_date`, `created_by`, `updated_date`, `updated_by`, `bcc_status`, `cover_image`, `thumbnail_image`, `large_image`) VALUES
(1, '000001', 1, 2, 2, 1, 1, 1, '', 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 0, '', '', ''),
(2, '000002', 1, 4, 2, 2, NULL, 1, '', 37, 'Bookdose Issue. 1', 'bookdose', 1, 0, 0, 0, 1, '2017-04-05', NULL, ',3,', 'uploads/dip/magazine/1/000002/', '.jpg', NULL, '', 1, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 11, 0, '2017-04-05 09:11:49', 1, '2017-04-05 10:22:40', 1, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `magazine_copy`
--

CREATE TABLE `magazine_copy` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `barcode` varchar(50) NOT NULL,
  `nonconsume_identifier` varchar(255) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `product_type_minor_aid` tinyint(4) UNSIGNED DEFAULT NULL,
  `copy_title` varchar(255) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `weight` float DEFAULT '0',
  `upload_path` varchar(255) DEFAULT NULL,
  `file_upload` varchar(255) DEFAULT NULL,
  `use_digital_gen` tinyint(1) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `no_1` varchar(12) DEFAULT NULL,
  `no_2` varchar(12) DEFAULT NULL,
  `no_3` varchar(12) DEFAULT NULL,
  `no_4` varchar(12) DEFAULT NULL,
  `call_number` varchar(48) DEFAULT NULL,
  `cover_price` double UNSIGNED DEFAULT NULL,
  `source` text,
  `note_1` text,
  `note_2` text,
  `note_3` text,
  `type` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1: Digital, 2:Paper',
  `type_minor` tinyint(3) UNSIGNED DEFAULT NULL,
  `possession` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1:Buy out, 2:Rental',
  `is_license` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1:License, 0:Not license',
  `is_ebook` tinyint(1) NOT NULL,
  `ebook_concurrence` tinyint(4) UNSIGNED DEFAULT NULL,
  `digital_price` double UNSIGNED DEFAULT NULL,
  `digital_point` double UNSIGNED DEFAULT NULL,
  `paper_price` double UNSIGNED DEFAULT NULL,
  `paper_point` double UNSIGNED DEFAULT NULL,
  `in_stock` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_period` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fee` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fee_point` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fine_fee` tinyint(4) UNSIGNED DEFAULT NULL,
  `shelf_status` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1: On shelf, 2:Borrowed, 3:Damage, 4:Lost',
  `shelf_name` varchar(255) DEFAULT NULL,
  `transport_aid` int(10) UNSIGNED DEFAULT NULL,
  `transport_price` int(10) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `magazine_copy`
--

INSERT INTO `magazine_copy` (`aid`, `cid`, `barcode`, `nonconsume_identifier`, `user_owner_aid`, `parent_aid`, `product_type_aid`, `product_type_minor_aid`, `copy_title`, `publish_date`, `expired_date`, `weight`, `upload_path`, `file_upload`, `use_digital_gen`, `status`, `no_1`, `no_2`, `no_3`, `no_4`, `call_number`, `cover_price`, `source`, `note_1`, `note_2`, `note_3`, `type`, `type_minor`, `possession`, `is_license`, `is_ebook`, `ebook_concurrence`, `digital_price`, `digital_point`, `paper_price`, `paper_point`, `in_stock`, `rental_period`, `rental_fee`, `rental_fee_point`, `rental_fine_fee`, `shelf_status`, `shelf_name`, `transport_aid`, `transport_price`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 'Q8y9XtJJJne1', 'PB000002', '', 1, 1, 2, 2, '', '2017-03-31', NULL, 0, 'uploads/dip/magazine_copy/2017/03/PB000002_Q8y9XtJJJne1/', NULL, 0, 1, '', '', '', '', NULL, 199, '', NULL, NULL, NULL, 2, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, '2017-03-31 17:03:32', 1, '2017-03-31 17:03:32', 1),
(2, 't5M1kfyoPuZf', 'DB000001', '', 1, 2, 2, 3, '', '2017-04-05', NULL, 0, 'uploads/dip/magazine_copy/2017/04/DB000001_t5M1kfyoPuZf/', NULL, 0, 1, '', '', '', '', '', 125, '', NULL, NULL, NULL, 1, 2, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, 0, '2017-04-05 09:23:52', 1, '2017-04-05 10:22:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `magazine_field`
--

CREATE TABLE `magazine_field` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `sequence` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `product_main_field_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `tag` varchar(6) NOT NULL,
  `ind1_cd` char(1) DEFAULT NULL,
  `ind2_cd` char(1) DEFAULT NULL,
  `subfield_cd` char(1) NOT NULL,
  `field_data` text,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `magazine_field`
--

INSERT INTO `magazine_field` (`parent_aid`, `sequence`, `product_type_aid`, `product_main_field_aid`, `name`, `user_owner_aid`, `tag`, `ind1_cd`, `ind2_cd`, `subfield_cd`, `field_data`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 1, 2, 14, 'Title', 1, '245', '', '', 'a', 'Max Bild Vol. 1 Issue. 1', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 2, 2, 15, 'Author', 1, '100', '', '', 'a', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 3, 2, 16, 'Description', 1, '520', '', '', 'a', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 4, 2, 17, 'Total pages', 1, '300', '', '', 'a', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 5, 2, 18, 'Subject', 1, '650', '', '', 'a', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 6, 2, 19, 'ISSN', 1, '020', '', '', 'a', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 7, 2, 20, 'Classification No.', 1, '050', '', '', 'a', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 8, 2, 21, 'Author ID', 1, '050', '', '', 'b', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 9, 2, 22, 'Publish Year', 1, '050', '', '', 'b', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 10, 2, 23, 'Item/Issue No.', 1, '050', '', '', 'b', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 11, 2, 24, 'Place of publication', 1, '260', '', '', 'a', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 12, 2, 25, 'Name of publisher', 1, '260', '', '', 'b', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 13, 2, 26, 'Date of publication', 1, '260', '', '', 'c', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(2, 8, 2, 42, 'Date of publication', 1, '260', '', '', 'c', '01/05/2017', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(2, 7, 2, 41, 'Name of publisher', 1, '260', '', '', 'b', '', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(2, 5, 2, 39, 'Subject', 1, '650', '', '', 'a', 'รวยพันล้าน วันที่1 เมษา', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(2, 3, 2, 37, 'Description', 1, '520', '', '', 'a', 'Test Description', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(2, 6, 2, 40, 'ISSN', 1, '020', '', '', 'a', 'AB123456789', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(2, 4, 2, 38, 'Total pages', 1, '300', '', '', 'a', '102', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(2, 2, 2, 36, 'Author', 1, '100', '', '', 'a', 'bookdose', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(2, 1, 2, 35, 'Title', 1, '245', '', '', 'a', 'Bookdose Issue. 1', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `magazine_main`
--

CREATE TABLE `magazine_main` (
  `aid` int(10) UNSIGNED NOT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `product_main_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `publisher_aid` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `annual_period` varchar(255) DEFAULT NULL,
  `total_issue` int(10) UNSIGNED DEFAULT '0',
  `status` tinyint(3) UNSIGNED NOT NULL,
  `weight` double DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `magazine_main`
--

INSERT INTO `magazine_main` (`aid`, `user_owner_aid`, `product_main_aid`, `product_type_aid`, `publisher_aid`, `title`, `annual_period`, `total_issue`, `status`, `weight`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 1, 2, 2, 39, 'Max Bild', NULL, 1, 1, 0, '2017-03-31 17:02:46', 1, '2017-03-31 17:02:52', 1),
(2, 1, 4, 2, 37, 'Bookdose', NULL, 1, 1, 0, '2017-04-05 09:09:52', 1, '2017-04-05 09:09:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `magazine_main_subscription`
--

CREATE TABLE `magazine_main_subscription` (
  `aid` int(10) UNSIGNED NOT NULL,
  `nonconsume_identifier` varchar(255) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `product_main_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `magazine_main_aid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `total_issue` int(8) UNSIGNED DEFAULT '0',
  `digital_price_web` decimal(10,2) UNSIGNED NOT NULL,
  `digital_price_ios` decimal(10,2) UNSIGNED DEFAULT NULL,
  `digital_price_android` decimal(10,2) UNSIGNED DEFAULT NULL,
  `digital_point_web` decimal(10,2) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `weight` double DEFAULT '0',
  `total_subscriber` int(10) UNSIGNED NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `magazine_ref_product_category`
--

CREATE TABLE `magazine_ref_product_category` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `product_category_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `user_owner_aid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `magazine_ref_product_category`
--

INSERT INTO `magazine_ref_product_category` (`parent_aid`, `product_category_aid`, `product_type_aid`, `user_owner_aid`) VALUES
(2, 3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `magazine_ref_user_section`
--

CREATE TABLE `magazine_ref_user_section` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `copy_aid` int(10) UNSIGNED NOT NULL,
  `user_section_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `rental_period` tinyint(3) UNSIGNED DEFAULT NULL,
  `rental_fee` tinyint(3) UNSIGNED DEFAULT NULL,
  `rental_fee_point` tinyint(3) UNSIGNED DEFAULT NULL,
  `rental_fine_fee` tinyint(3) UNSIGNED DEFAULT NULL,
  `renew_time` tinyint(3) UNSIGNED DEFAULT NULL,
  `renew_period` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `magazine_ref_user_section`
--

INSERT INTO `magazine_ref_user_section` (`parent_aid`, `copy_aid`, `user_section_aid`, `product_type_aid`, `user_owner_aid`, `rental_period`, `rental_fee`, `rental_fee_point`, `rental_fine_fee`, `renew_time`, `renew_period`) VALUES
(1, 1, 1, 2, 1, 0, 0, 0, 0, 0, 0),
(1, 1, 2, 2, 1, 0, 0, 0, 0, 0, 0),
(1, 1, 3, 2, 1, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `magazine_tag`
--

CREATE TABLE `magazine_tag` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `master_country`
--

CREATE TABLE `master_country` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(2) NOT NULL,
  `name` varchar(128) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_country`
--

INSERT INTO `master_country` (`aid`, `cid`, `name`, `status`) VALUES
(1, 'AF', 'Afghanistan', 1),
(2, 'AL', 'Albania', 1),
(3, 'DZ', 'Algeria', 1),
(4, 'AS', 'American Samoa', 1),
(5, 'AD', 'Andorra', 1),
(6, 'AO', 'Angola', 1),
(7, 'AI', 'Anguilla', 1),
(8, 'AQ', 'Antarctica', 1),
(9, 'AG', 'Antigua and Barbuda', 1),
(10, 'AR', 'Argentina', 1),
(11, 'AM', 'Armenia', 1),
(12, 'AW', 'Aruba', 1),
(13, 'AU', 'Australia', 1),
(14, 'AT', 'Austria', 1),
(15, 'AZ', 'Azerbaijan', 1),
(16, 'BS', 'Bahamas', 1),
(17, 'BH', 'Bahrain', 1),
(18, 'BD', 'Bangladesh', 1),
(19, 'BB', 'Barbados', 1),
(20, 'BY', 'Belarus', 1),
(21, 'BE', 'Belgium', 1),
(22, 'BZ', 'Belize', 1),
(23, 'BJ', 'Benin', 1),
(24, 'BM', 'Bermuda', 1),
(25, 'BT', 'Bhutan', 1),
(26, 'BO', 'Bolivia', 1),
(27, 'BA', 'Bosnia and Herzegowina', 1),
(28, 'BW', 'Botswana', 1),
(29, 'BV', 'Bouvet Island', 1),
(30, 'BR', 'Brazil', 1),
(31, 'IO', 'British Indian Ocean Territory', 1),
(32, 'BN', 'Brunei Darussalam', 1),
(33, 'BG', 'Bulgaria', 1),
(34, 'BF', 'Burkina Faso', 1),
(35, 'BI', 'Burundi', 1),
(36, 'KH', 'Cambodia', 1),
(37, 'CM', 'Cameroon', 1),
(38, 'CA', 'Canada', 1),
(39, 'CV', 'Cape Verde', 1),
(40, 'KY', 'Cayman Islands', 1),
(41, 'CF', 'Central African Republic', 1),
(42, 'TD', 'Chad', 1),
(43, 'CL', 'Chile', 1),
(44, 'CN', 'China', 1),
(45, 'CX', 'Christmas Island', 1),
(46, 'CC', 'Cocos (Keeling) Islands', 1),
(47, 'CO', 'Colombia', 1),
(48, 'KM', 'Comoros', 1),
(49, 'CG', 'Congo', 1),
(50, 'CD', 'Congo, the Democratic Republic of the', 1),
(51, 'CK', 'Cook Islands', 1),
(52, 'CR', 'Costa Rica', 1),
(53, 'CI', 'Cote d\'Ivoire', 1),
(54, 'HR', 'Croatia (Hrvatska)', 1),
(55, 'CU', 'Cuba', 1),
(56, 'CY', 'Cyprus', 1),
(57, 'CZ', 'Czech Republic', 1),
(58, 'DK', 'Denmark', 1),
(59, 'DJ', 'Djibouti', 1),
(60, 'DM', 'Dominica', 1),
(61, 'DO', 'Dominican Republic', 1),
(62, 'TP', 'East Timor', 1),
(63, 'EC', 'Ecuador', 1),
(64, 'EG', 'Egypt', 1),
(65, 'SV', 'El Salvador', 1),
(66, 'GQ', 'Equatorial Guinea', 1),
(67, 'ER', 'Eritrea', 1),
(68, 'EE', 'Estonia', 1),
(69, 'ET', 'Ethiopia', 1),
(70, 'FK', 'Falkland Islands (Malvinas)', 1),
(71, 'FO', 'Faroe Islands', 1),
(72, 'FJ', 'Fiji', 1),
(73, 'FI', 'Finland', 1),
(74, 'FR', 'France', 1),
(75, 'FX', 'France, Metropolitan', 1),
(76, 'GF', 'French Guiana', 1),
(77, 'PF', 'French Polynesia', 1),
(78, 'TF', 'French Southern Territories', 1),
(79, 'GA', 'Gabon', 1),
(80, 'GM', 'Gambia', 1),
(81, 'GE', 'Georgia', 1),
(82, 'DE', 'Germany', 1),
(83, 'GH', 'Ghana', 1),
(84, 'GI', 'Gibraltar', 1),
(85, 'GR', 'Greece', 1),
(86, 'GL', 'Greenland', 1),
(87, 'GD', 'Grenada', 1),
(88, 'GP', 'Guadeloupe', 1),
(89, 'GU', 'Guam', 1),
(90, 'GT', 'Guatemala', 1),
(91, 'GN', 'Guinea', 1),
(92, 'GW', 'Guinea-Bissau', 1),
(93, 'GY', 'Guyana', 1),
(94, 'HT', 'Haiti', 1),
(95, 'HM', 'Heard and Mc Donald Islands', 1),
(96, 'VA', 'Holy See (Vatican City State)', 1),
(97, 'HN', 'Honduras', 1),
(98, 'HK', 'Hong Kong', 1),
(99, 'HU', 'Hungary', 1),
(100, 'IS', 'Iceland', 1),
(101, 'IN', 'India', 1),
(102, 'ID', 'Indonesia', 1),
(103, 'IR', 'Iran (Islamic Republic of)', 1),
(104, 'IQ', 'Iraq', 1),
(105, 'IE', 'Ireland', 1),
(106, 'IL', 'Israel', 1),
(107, 'IT', 'Italy', 1),
(108, 'JM', 'Jamaica', 1),
(109, 'JP', 'Japan', 1),
(110, 'JO', 'Jordan', 1),
(111, 'KZ', 'Kazakhstan', 1),
(112, 'KE', 'Kenya', 1),
(113, 'KI', 'Kiribati', 1),
(114, 'KP', 'Korea, Democratic People\'s Republic of', 1),
(115, 'KR', 'Korea, Republic of', 1),
(116, 'KW', 'Kuwait', 1),
(117, 'KG', 'Kyrgyzstan', 1),
(118, 'LA', 'Lao People\'s Democratic Republic', 1),
(119, 'LV', 'Latvia', 1),
(120, 'LB', 'Lebanon', 1),
(121, 'LS', 'Lesotho', 1),
(122, 'LR', 'Liberia', 1),
(123, 'LY', 'Libyan Arab Jamahiriya', 1),
(124, 'LI', 'Liechtenstein', 1),
(125, 'LT', 'Lithuania', 1),
(126, 'LU', 'Luxembourg', 1),
(127, 'MO', 'Macau', 1),
(128, 'MK', 'Macedonia, The Former Yugoslav Republic of', 1),
(129, 'MG', 'Madagascar', 1),
(130, 'MW', 'Malawi', 1),
(131, 'MY', 'Malaysia', 1),
(132, 'MV', 'Maldives', 1),
(133, 'ML', 'Mali', 1),
(134, 'MT', 'Malta', 1),
(135, 'MH', 'Marshall Islands', 1),
(136, 'MQ', 'Martinique', 1),
(137, 'MR', 'Mauritania', 1),
(138, 'MU', 'Mauritius', 1),
(139, 'YT', 'Mayotte', 1),
(140, 'MX', 'Mexico', 1),
(141, 'FM', 'Micronesia, Federated States of', 1),
(142, 'MD', 'Moldova, Republic of', 1),
(143, 'MC', 'Monaco', 1),
(144, 'MN', 'Mongolia', 1),
(145, 'MS', 'Montserrat', 1),
(146, 'MA', 'Morocco', 1),
(147, 'MZ', 'Mozambique', 1),
(148, 'MM', 'Myanmar', 1),
(149, 'NA', 'Namibia', 1),
(150, 'NR', 'Nauru', 1),
(151, 'NP', 'Nepal', 1),
(152, 'NL', 'Netherlands', 1),
(153, 'AN', 'Netherlands Antilles', 1),
(154, 'NC', 'New Caledonia', 1),
(155, 'NZ', 'New Zealand', 1),
(156, 'NI', 'Nicaragua', 1),
(157, 'NE', 'Niger', 1),
(158, 'NG', 'Nigeria', 1),
(159, 'NU', 'Niue', 1),
(160, 'NF', 'Norfolk Island', 1),
(161, 'MP', 'Northern Mariana Islands', 1),
(162, 'NO', 'Norway', 1),
(163, 'OM', 'Oman', 1),
(164, 'PK', 'Pakistan', 1),
(165, 'PW', 'Palau', 1),
(166, 'PA', 'Panama', 1),
(167, 'PG', 'Papua New Guinea', 1),
(168, 'PY', 'Paraguay', 1),
(169, 'PE', 'Peru', 1),
(170, 'PH', 'Philippines', 1),
(171, 'PN', 'Pitcairn', 1),
(172, 'PL', 'Poland', 1),
(173, 'PT', 'Portugal', 1),
(174, 'PR', 'Puerto Rico', 1),
(175, 'QA', 'Qatar', 1),
(176, 'RE', 'Reunion', 1),
(177, 'RO', 'Romania', 1),
(178, 'RU', 'Russian Federation', 1),
(179, 'RW', 'Rwanda', 1),
(180, 'KN', 'Saint Kitts and Nevis', 1),
(181, 'LC', 'Saint LUCIA', 1),
(182, 'VC', 'Saint Vincent and the Grenadines', 1),
(183, 'WS', 'Samoa', 1),
(184, 'SM', 'San Marino', 1),
(185, 'ST', 'Sao Tome and Principe', 1),
(186, 'SA', 'Saudi Arabia', 1),
(187, 'SN', 'Senegal', 1),
(188, 'SC', 'Seychelles', 1),
(189, 'SL', 'Sierra Leone', 1),
(190, 'SG', 'Singapore', 1),
(191, 'SK', 'Slovakia (Slovak Republic)', 1),
(192, 'SI', 'Slovenia', 1),
(193, 'SB', 'Solomon Islands', 1),
(194, 'SO', 'Somalia', 1),
(195, 'ZA', 'South Africa', 1),
(196, 'GS', 'South Georgia and the South Sandwich Islands', 1),
(197, 'ES', 'Spain', 1),
(198, 'LK', 'Sri Lanka', 1),
(199, 'SH', 'St. Helena', 1),
(200, 'PM', 'St. Pierre and Miquelon', 1),
(201, 'SD', 'Sudan', 1),
(202, 'SR', 'Suriname', 1),
(203, 'SJ', 'Svalbard and Jan Mayen Islands', 1),
(204, 'SZ', 'Swaziland', 1),
(205, 'SE', 'Sweden', 1),
(206, 'CH', 'Switzerland', 1),
(207, 'SY', 'Syrian Arab Republic', 1),
(208, 'TW', 'Taiwan, Province of China', 1),
(209, 'TJ', 'Tajikistan', 1),
(210, 'TZ', 'Tanzania, United Republic of', 1),
(211, 'TH', 'Thailand', 1),
(212, 'TG', 'Togo', 1),
(213, 'TK', 'Tokelau', 1),
(214, 'TO', 'Tonga', 1),
(215, 'TT', 'Trinidad and Tobago', 1),
(216, 'TN', 'Tunisia', 1),
(217, 'TR', 'Turkey', 1),
(218, 'TM', 'Turkmenistan', 1),
(219, 'TC', 'Turks and Caicos Islands', 1),
(220, 'TV', 'Tuvalu', 1),
(221, 'UG', 'Uganda', 1),
(222, 'UA', 'Ukraine', 1),
(223, 'AE', 'United Arab Emirates', 1),
(224, 'GB', 'United Kingdom', 1),
(225, 'US', 'United States', 1),
(226, 'UM', 'United States Minor Outlying Islands', 1),
(227, 'UY', 'Uruguay', 1),
(228, 'UZ', 'Uzbekistan', 1),
(229, 'VU', 'Vanuatu', 1),
(230, 'VE', 'Venezuela', 1),
(231, 'VN', 'Viet Nam', 1),
(232, 'VG', 'Virgin Islands (British)', 1),
(233, 'VI', 'Virgin Islands (U.S.)', 1),
(234, 'WF', 'Wallis and Futuna Islands', 1),
(235, 'EH', 'Western Sahara', 1),
(236, 'YE', 'Yemen', 1),
(237, 'YU', 'Yugoslavia', 1),
(238, 'ZM', 'Zambia', 1),
(239, 'ZW', 'Zimbabwe', 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_member_type`
--

CREATE TABLE `master_member_type` (
  `aid` tinyint(3) UNSIGNED NOT NULL,
  `cid` enum('A','L') NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` smallint(5) UNSIGNED NOT NULL,
  `extend_price` smallint(5) UNSIGNED NOT NULL,
  `remark` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `news_main_aid` int(10) UNSIGNED NOT NULL,
  `news_upload_aid` int(10) UNSIGNED DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `draft_title` varchar(255) DEFAULT NULL,
  `weight` float DEFAULT '0',
  `is_home` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '0:Not show in homepage, 1:Show in homepage',
  `is_recommended` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_highlight` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `publish_date` date DEFAULT NULL,
  `description` longtext,
  `draft_description` longtext,
  `ref_link` text,
  `upload_path` varchar(255) DEFAULT NULL,
  `cover_image_file_type` varchar(5) DEFAULT NULL,
  `video_file_path` text,
  `ref_link2_url` text,
  `ref_link2_image_url` text,
  `ref_link2_title` varchar(255) DEFAULT NULL,
  `ref_link2_desc` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `posted_email` varchar(255) DEFAULT NULL,
  `posted_ref` text,
  `total_view` int(10) UNSIGNED DEFAULT '0',
  `total_comment` mediumint(9) UNSIGNED NOT NULL DEFAULT '0',
  `total_wow` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `total_cheer` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `total_thanks` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `news_category`
--

CREATE TABLE `news_category` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `news_main_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(24) NOT NULL,
  `weight` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news_category`
--

INSERT INTO `news_category` (`aid`, `cid`, `user_owner_aid`, `news_main_aid`, `name`, `url`, `weight`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, NULL, 1, 1, 'ทั่วไป', 'general', 0, 1, '2016-10-31 17:14:32', 6, '2016-10-31 17:14:32', 6),
(2, NULL, 1, 1, 'สุขภาพ', 'health', 0, 1, '2016-10-31 17:16:58', 6, '2016-10-31 17:16:58', 6),
(5, NULL, 1, 1, 'NIA', 'nia', 0, 1, '2016-12-26 15:43:10', 34, '2016-12-26 15:43:10', 34);

-- --------------------------------------------------------

--
-- Table structure for table `news_comment`
--

CREATE TABLE `news_comment` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `parent_news_aid` int(10) UNSIGNED NOT NULL,
  `parent_comment_aid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `total_wow` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED DEFAULT '1',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `news_comment_user_activity`
--

CREATE TABLE `news_comment_user_activity` (
  `news_comment_aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `status_wow` tinyint(1) UNSIGNED DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `news_gallery`
--

CREATE TABLE `news_gallery` (
  `aid` int(10) UNSIGNED NOT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `news_aid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `file_name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `weight` float DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `news_main`
--

CREATE TABLE `news_main` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(24) NOT NULL,
  `weight` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news_main`
--

INSERT INTO `news_main` (`aid`, `cid`, `user_owner_aid`, `name`, `url`, `weight`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, NULL, 1, 'News Feed', 'news-feed', 0, 1, '2014-09-25 06:42:11', 8, '2014-09-25 06:42:11', 8);

-- --------------------------------------------------------

--
-- Table structure for table `news_upload`
--

CREATE TABLE `news_upload` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `news_main_aid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `description` text,
  `ref_link` text,
  `upload_path` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `cover_image_file_type` varchar(5) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `posted_by` int(11) UNSIGNED DEFAULT NULL,
  `posted_email` varchar(255) DEFAULT NULL,
  `posted_ref` text,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `news_user_activity`
--

CREATE TABLE `news_user_activity` (
  `news_aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `status_wow` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `status_cheer` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `status_thanks` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_main_aid` int(10) UNSIGNED NOT NULL,
  `issue_aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `issue_fullname` varchar(255) DEFAULT NULL,
  `issue_img` varchar(255) DEFAULT NULL,
  `issue_price` float UNSIGNED DEFAULT NULL,
  `issue_price_full` varchar(255) DEFAULT NULL,
  `issue_currency_ipad` varchar(12) DEFAULT NULL,
  `issue_price_ipad` decimal(10,0) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `remark` text,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_main`
--

CREATE TABLE `order_main` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(32) DEFAULT NULL,
  `user_aid` int(10) UNSIGNED DEFAULT NULL,
  `payment_type` tinyint(1) UNSIGNED NOT NULL COMMENT '1 = Paysbuy, 2 = Point, 3 = App Store',
  `all_unit_total` int(4) UNSIGNED DEFAULT NULL,
  `all_price_total` float UNSIGNED DEFAULT NULL,
  `all_price_summary` float UNSIGNED DEFAULT NULL,
  `issue_currency_ipad` varchar(12) DEFAULT NULL,
  `issue_price_ipad` decimal(10,0) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1=New coming, 2=In Process, 3=Approved, 4=Rejected',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '1=Buy Point, 2:Buy Book',
  `package_aid` int(10) UNSIGNED DEFAULT '0',
  `buyer_name` varchar(255) DEFAULT NULL,
  `buyer_email` varchar(255) DEFAULT NULL,
  `buyer_contact` varchar(255) DEFAULT NULL,
  `buyer_address` varchar(255) DEFAULT NULL,
  `remark` text,
  `channel` tinyint(1) UNSIGNED NOT NULL COMMENT '1 = Website, 2 = Ipad',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_receipt`
--

CREATE TABLE `order_receipt` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(32) DEFAULT NULL,
  `order_main_aid` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '1=Buy Point, 2:Buy Book',
  `remark` text,
  `channel` tinyint(1) UNSIGNED NOT NULL COMMENT '1 = Website, 2 = Ipad',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `others`
--

CREATE TABLE `others` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `product_main_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `publisher_aid` int(10) UNSIGNED DEFAULT NULL,
  `title` text,
  `author` text,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '0:Not Active, 1:Active',
  `weight` float DEFAULT '0',
  `is_new` tinyint(4) DEFAULT '0',
  `is_recommended` tinyint(4) DEFAULT '0',
  `is_home` tinyint(4) UNSIGNED DEFAULT '0',
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `upload_path` text,
  `cover_image_file_type` varchar(5) DEFAULT NULL,
  `uri` text,
  `tag` longtext,
  `total_copy` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_view` int(10) UNSIGNED DEFAULT '0',
  `total_view_web` int(10) UNSIGNED DEFAULT '0',
  `total_view_device` int(10) UNSIGNED DEFAULT '0',
  `total_download` int(10) UNSIGNED DEFAULT '0',
  `total_download_web` int(10) UNSIGNED DEFAULT '0',
  `total_download_device` int(10) UNSIGNED DEFAULT '0',
  `total_read` int(10) UNSIGNED DEFAULT '0',
  `total_read_web` int(10) UNSIGNED DEFAULT '0',
  `total_read_device` int(10) UNSIGNED DEFAULT '0',
  `total_rental` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `best_price` int(10) UNSIGNED DEFAULT NULL,
  `has_paper` tinyint(1) UNSIGNED DEFAULT NULL,
  `has_ebook` tinyint(1) UNSIGNED DEFAULT NULL,
  `has_license` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `reward_point` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `review_point` int(10) UNSIGNED DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `others_copy`
--

CREATE TABLE `others_copy` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `barcode` varchar(50) NOT NULL,
  `nonconsume_identifier` varchar(255) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `product_type_minor_aid` tinyint(4) UNSIGNED DEFAULT NULL,
  `copy_title` varchar(255) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `weight` float DEFAULT '0',
  `upload_path` varchar(255) DEFAULT NULL,
  `file_upload` varchar(255) DEFAULT NULL,
  `use_digital_gen` tinyint(1) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `no_1` varchar(12) DEFAULT NULL,
  `no_2` varchar(12) DEFAULT NULL,
  `no_3` varchar(12) DEFAULT NULL,
  `no_4` varchar(12) DEFAULT NULL,
  `call_number` varchar(48) DEFAULT NULL,
  `cover_price` double UNSIGNED DEFAULT NULL,
  `source` text,
  `note_1` text,
  `note_2` text,
  `note_3` text,
  `type` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1: Digital, 2:Paper',
  `type_minor` tinyint(3) UNSIGNED DEFAULT NULL,
  `possession` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1:Buy out, 2:Rental',
  `is_license` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1:License, 0:Not license',
  `is_ebook` tinyint(1) NOT NULL,
  `ebook_concurrence` tinyint(4) UNSIGNED DEFAULT NULL,
  `digital_price` double UNSIGNED DEFAULT NULL,
  `digital_point` double UNSIGNED DEFAULT NULL,
  `paper_price` double UNSIGNED DEFAULT NULL,
  `paper_point` double UNSIGNED DEFAULT NULL,
  `in_stock` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_period` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fee` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fee_point` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fine_fee` tinyint(4) UNSIGNED DEFAULT NULL,
  `shelf_status` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1: On shelf, 2:Borrowed, 3:Damage, 4:Lost',
  `shelf_name` varchar(255) DEFAULT NULL,
  `transport_aid` int(10) UNSIGNED DEFAULT NULL,
  `transport_price` int(10) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `others_field`
--

CREATE TABLE `others_field` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `sequence` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `product_main_field_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `tag` smallint(6) NOT NULL,
  `ind1_cd` char(1) DEFAULT NULL,
  `ind2_cd` char(1) DEFAULT NULL,
  `subfield_cd` char(1) NOT NULL,
  `field_data` text,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `others_ref_product_category`
--

CREATE TABLE `others_ref_product_category` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `product_category_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `user_owner_aid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `others_ref_user_section`
--

CREATE TABLE `others_ref_user_section` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `copy_aid` int(10) UNSIGNED NOT NULL,
  `user_section_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `rental_period` tinyint(3) UNSIGNED DEFAULT NULL,
  `rental_fee` tinyint(3) UNSIGNED DEFAULT NULL,
  `rental_fee_point` tinyint(3) UNSIGNED DEFAULT NULL,
  `rental_fine_fee` tinyint(3) UNSIGNED DEFAULT NULL,
  `renew_time` tinyint(3) UNSIGNED DEFAULT NULL,
  `renew_period` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `others_tag`
--

CREATE TABLE `others_tag` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `package_point`
--

CREATE TABLE `package_point` (
  `aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `point` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `weight` float NOT NULL,
  `remark` text,
  `image` text,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package_point`
--

INSERT INTO `package_point` (`aid`, `name`, `point`, `price`, `status`, `weight`, `remark`, `image`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 'Package 1 : 100 Baht get 108 points', 108, 100, 1, 1, NULL, 'uploads/bookfriend/package/point-1.png', '2012-09-30 00:00:00', 1, '2012-09-30 00:00:00', 1),
(2, 'Package 2 : 150 Baht get 165 points', 165, 150, 1, 2, NULL, 'uploads/bookfriend/package/point-2.png', '2012-09-30 00:00:00', 1, '2012-09-30 00:00:00', 1),
(3, 'Package 3 : 300 Baht get 335 points', 335, 300, 1, 3, NULL, 'uploads/bookfriend/package/point-3.png', '2012-09-30 00:00:00', 1, '2012-09-30 00:00:00', 1),
(4, 'Package 4 : 600 Baht get 680 points', 680, 600, 1, 4, NULL, 'uploads/bookfriend/package/point-4.png', '2012-09-30 00:00:00', 1, '2012-09-30 00:00:00', 1),
(5, 'Package 1 : 900 Baht get 1030 points', 1030, 900, 1, 5, NULL, 'uploads/bookfriend/package/point-5.png', '2012-09-30 00:00:00', 1, '2012-09-30 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `point_history`
--

CREATE TABLE `point_history` (
  `aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `order_aid` int(10) UNSIGNED NOT NULL,
  `point_type` tinyint(3) UNSIGNED NOT NULL COMMENT '1 = Receive, 2 Pay',
  `point` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `redeem_code` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `parent_aid` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `product_main_aid` int(10) UNSIGNED NOT NULL,
  `weight` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`aid`, `cid`, `user_owner_aid`, `parent_aid`, `name`, `url`, `product_main_aid`, `weight`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, NULL, 1, NULL, 'Book-Cat1', 'book-cat1', 1, 0, 1, '2017-03-21 14:59:49', 1, '2017-03-21 14:59:49', 1),
(2, NULL, 1, NULL, 'สิ่งแวดล้แม', 'สิ่งแวดล้แม', 3, 0, 1, '2017-03-31 17:10:08', 1, '2017-03-31 17:10:08', 1),
(3, NULL, 1, NULL, 'Bookdose Mag', 'bookdose-mag', 4, 0, 1, '2017-04-05 09:25:45', 1, '2017-04-05 09:25:45', 1),
(4, NULL, 1, NULL, 'Bookdose Gallery', 'bookdose-gallery', 9, 0, 1, '2017-04-05 15:03:30', 1, '2017-04-05 15:03:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_category_ref_user_section`
--

CREATE TABLE `product_category_ref_user_section` (
  `product_category_aid` int(10) UNSIGNED NOT NULL,
  `user_section_aid` tinyint(4) UNSIGNED NOT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_category_ref_user_section`
--

INSERT INTO `product_category_ref_user_section` (`product_category_aid`, `user_section_aid`, `user_owner_aid`) VALUES
(1, 0, 1),
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(2, 0, 1),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(3, 0, 1),
(3, 1, 1),
(3, 2, 1),
(3, 3, 1),
(4, 0, 1),
(4, 1, 1),
(4, 2, 1),
(4, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_main`
--

CREATE TABLE `product_main` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(64) DEFAULT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `icon` varchar(50) NOT NULL,
  `weight` double DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_main`
--

INSERT INTO `product_main` (`aid`, `cid`, `user_owner_aid`, `name`, `url`, `product_type_aid`, `icon`, `weight`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(3, NULL, 1, 'E-Book', 'ebooks', 1, '', 3, 1, '2014-06-22 18:50:38', 1, '2014-06-22 18:50:38', 1),
(4, NULL, 1, 'E-Magazine', 'emagazines', 2, '', 4, 1, '2014-06-22 18:51:42', 1, '2014-06-22 18:51:42', 1),
(5, NULL, 1, 'Multimedia', 'multimedia', 3, '', 5, 1, '2014-06-22 18:52:04', 1, '2014-06-22 18:52:04', 1),
(6, NULL, 1, 'Information', 'information', 1, '', 6, 1, '2016-06-20 17:03:14', 1, '2016-06-20 17:03:14', 1),
(7, NULL, 1, 'Knowledge Resources', 'knowledge-resources', 1, '', 7, 0, '2016-06-20 17:03:14', 1, '2016-06-20 17:03:24', 1),
(1, NULL, 1, 'Book', 'book', 1, '', 1, 0, NULL, 1, NULL, 1),
(2, NULL, 1, 'Magazine', 'magzine', 2, '', 2, 0, NULL, 1, NULL, 1),
(8, NULL, 1, 'CD/DVD', 'cd-dvd', 1, '', 8, 0, NULL, NULL, NULL, NULL),
(9, NULL, 1, 'Gallerys', 'photo-gallerys', 3, '', 9, 0, '2017-04-05 14:46:18', 1, '2017-04-05 14:46:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_main_field`
--

CREATE TABLE `product_main_field` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(12) NOT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `product_main_aid` int(10) UNSIGNED NOT NULL,
  `product_topic_main_cid` varchar(12) DEFAULT NULL,
  `tag` varchar(6) DEFAULT NULL,
  `subfield_cd` char(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `is_required` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '0:Not requried, 1:Required',
  `input_type` varchar(24) DEFAULT NULL COMMENT 'textbox, textarea',
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `fixed_field` tinyint(1) UNSIGNED NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_main_field`
--

INSERT INTO `product_main_field` (`aid`, `cid`, `user_owner_aid`, `product_main_aid`, `product_topic_main_cid`, `tag`, `subfield_cd`, `name`, `description`, `is_required`, `input_type`, `status`, `weight`, `fixed_field`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 'title', 1, 1, '0', '245', 'a', 'Title', NULL, 1, 'textbox', 1, -1, 1, '2016-11-04 11:59:50', 6, '2016-11-04 11:59:50', 6),
(2, 'author', 1, 1, '0', '100', 'a', 'Author', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 11:59:50', 6, '2016-11-04 11:59:50', 6),
(3, 'description', 1, 1, '0', '520', 'a', 'Description', NULL, 0, 'textarea', 1, 0, 1, '2016-11-04 11:59:50', 6, '2016-11-04 11:59:50', 6),
(4, 'total_page', 1, 1, '0', '300', 'a', 'Total pages', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 11:59:50', 6, '2016-11-04 11:59:50', 6),
(5, '', 1, 1, '0', '650', 'a', 'Subject', 'หัวเรื่อง', 0, 'textbox', 1, 0, 0, '2016-11-04 11:59:50', 6, '2016-11-04 11:59:50', 6),
(6, '', 1, 1, '0', '020', 'a', 'ISBN', NULL, 0, 'textbox', 1, 0, 0, '2016-11-04 11:59:50', 6, '2016-11-04 11:59:50', 6),
(7, 'no_1', 1, 1, '0', '050', 'a', 'Classification No.', 'เลขหมู่หลัก', 0, 'textbox', 1, 0, 0, '2016-11-04 11:59:50', 6, '2016-11-04 11:59:50', 6),
(8, 'no_2', 1, 1, '0', '050', 'b', 'Author ID', 'เลขผู้แต่ง', 0, 'textbox', 1, 0, 0, '2016-11-04 11:59:50', 6, '2016-11-04 11:59:50', 6),
(9, 'no_3', 1, 1, '0', '050', 'b', 'Publish Year', 'ปีที่พิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 11:59:50', 6, '2016-11-04 11:59:50', 6),
(10, 'no_4', 1, 1, '0', '050', 'b', 'Item/Issue No.', 'ฉบับหรือเล่มที่', 0, 'textbox', 1, 0, 0, '2016-11-04 11:59:50', 6, '2016-11-04 11:59:50', 6),
(11, '', 1, 1, '0', '260', 'a', 'Place of publication', 'สถานที่พิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 11:59:50', 6, '2016-11-04 11:59:50', 6),
(12, '', 1, 1, '0', '260', 'b', 'Name of publisher', 'ชื่อสำนักพิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 11:59:50', 6, '2016-11-04 11:59:50', 6),
(13, '', 1, 1, '0', '260', 'c', 'Date of publication', 'วันที่พิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 11:59:50', 6, '2016-11-04 11:59:50', 6),
(14, 'title', 1, 2, '0', '245', 'a', 'Title', NULL, 1, 'textbox', 1, -1, 1, '2016-11-04 12:00:22', 6, '2016-11-04 12:00:22', 6),
(15, 'author', 1, 2, '0', '100', 'a', 'Author', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 12:00:22', 6, '2016-11-04 12:00:22', 6),
(16, 'description', 1, 2, '0', '520', 'a', 'Description', NULL, 0, 'textarea', 1, 0, 1, '2016-11-04 12:00:22', 6, '2016-11-04 12:00:22', 6),
(17, 'total_page', 1, 2, '0', '300', 'a', 'Total pages', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 12:00:22', 6, '2016-11-04 12:00:22', 6),
(18, '', 1, 2, '0', '650', 'a', 'Subject', 'หัวเรื่อง', 0, 'textbox', 1, 0, 0, '2016-11-04 12:00:22', 6, '2016-11-04 12:00:22', 6),
(19, '', 1, 2, '0', '020', 'a', 'ISSN', NULL, 0, 'textbox', 1, 0, 0, '2016-11-04 12:00:22', 6, '2016-11-04 12:00:22', 6),
(20, 'no_1', 1, 2, '0', '050', 'a', 'Classification No.', 'เลขหมู่หลัก', 0, 'textbox', 1, 0, 0, '2016-11-04 12:00:22', 6, '2016-11-04 12:00:22', 6),
(21, 'no_2', 1, 2, '0', '050', 'b', 'Author ID', 'เลขผู้แต่ง', 0, 'textbox', 1, 0, 0, '2016-11-04 12:00:22', 6, '2016-11-04 12:00:22', 6),
(22, 'no_3', 1, 2, '0', '050', 'b', 'Publish Year', 'ปีที่พิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:00:22', 6, '2016-11-04 12:00:22', 6),
(23, 'no_4', 1, 2, '0', '050', 'b', 'Item/Issue No.', 'ฉบับหรือเล่มที่', 0, 'textbox', 1, 0, 0, '2016-11-04 12:00:22', 6, '2016-11-04 12:00:22', 6),
(24, '', 1, 2, '0', '260', 'a', 'Place of publication', 'สถานที่พิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:00:22', 6, '2016-11-04 12:00:22', 6),
(25, '', 1, 2, '0', '260', 'b', 'Name of publisher', 'ชื่อสำนักพิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:00:22', 6, '2016-11-04 12:00:22', 6),
(26, '', 1, 2, '0', '260', 'c', 'Date of publication', 'วันที่พิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:00:22', 6, '2016-11-04 12:00:22', 6),
(27, 'title', 1, 3, '0', '245', 'a', 'Title', NULL, 1, 'textbox', 1, -1, 1, '2016-11-04 12:01:02', 6, '2016-11-04 12:01:02', 6),
(28, 'author', 1, 3, '0', '100', 'a', 'Author', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 12:01:02', 6, '2016-11-04 12:01:02', 6),
(29, 'description', 1, 3, '0', '520', 'a', 'Description', NULL, 0, 'textarea', 1, 0, 1, '2016-11-04 12:01:02', 6, '2016-11-04 12:01:02', 6),
(30, 'total_page', 1, 3, '0', '300', 'a', 'Total pages', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 12:01:02', 6, '2016-11-04 12:01:02', 6),
(31, '', 1, 3, '0', '650', 'a', 'Subject', 'หัวเรื่อง', 0, 'textbox', 1, 0, 0, '2016-11-04 12:01:02', 6, '2016-11-04 12:01:02', 6),
(32, '', 1, 3, '0', '020', 'a', 'ISBN', NULL, 0, 'textbox', 1, 0, 0, '2016-11-04 12:01:02', 6, '2016-11-04 12:01:02', 6),
(33, '', 1, 3, '0', '260', 'b', 'Name of publisher', 'ชื่อสำนักพิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:01:02', 6, '2016-11-04 12:01:02', 6),
(34, '', 1, 3, '0', '260', 'c', 'Date of publication', 'วันที่พิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:01:02', 6, '2016-11-04 12:01:02', 6),
(35, 'title', 1, 4, '0', '245', 'a', 'Title', NULL, 1, 'textbox', 1, -1, 1, '2016-11-04 12:02:05', 6, '2016-11-04 12:02:05', 6),
(36, 'author', 1, 4, '0', '100', 'a', 'Author', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 12:02:05', 6, '2016-11-04 12:02:05', 6),
(37, 'description', 1, 4, '0', '520', 'a', 'Description', NULL, 0, 'textarea', 1, 0, 1, '2016-11-04 12:02:05', 6, '2016-11-04 12:02:05', 6),
(38, 'total_page', 1, 4, '0', '300', 'a', 'Total pages', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 12:02:05', 6, '2016-11-04 12:02:05', 6),
(39, '', 1, 4, '0', '650', 'a', 'Subject', 'หัวเรื่อง', 0, 'textbox', 1, 0, 0, '2016-11-04 12:02:05', 6, '2016-11-04 12:02:05', 6),
(40, '', 1, 4, '0', '020', 'a', 'ISSN', NULL, 0, 'textbox', 1, 0, 0, '2016-11-04 12:02:05', 6, '2016-11-04 12:02:05', 6),
(41, '', 1, 4, '0', '260', 'b', 'Name of publisher', 'ชื่อสำนักพิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:02:05', 6, '2016-11-04 12:02:05', 6),
(42, '', 1, 4, '0', '260', 'c', 'Date of publication', 'วันที่พิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:02:05', 6, '2016-11-04 12:02:05', 6),
(43, 'title', 1, 5, '0', '245', 'a', 'Title', NULL, 1, 'textbox', 1, -1, 1, '2016-11-04 12:02:38', 6, '2016-11-04 12:02:38', 6),
(44, 'author', 1, 5, '0', '100', 'a', 'Author', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 12:02:38', 6, '2016-11-04 12:02:38', 6),
(45, 'description', 1, 5, '0', '520', 'a', 'Description', NULL, 0, 'textarea', 1, 0, 1, '2016-11-04 12:02:38', 6, '2016-11-04 12:02:38', 6),
(46, 'ext-source', 1, 5, '0', '', '', 'Youtube VDO code', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 12:02:38', 6, '2016-11-04 12:02:38', 6),
(47, 'title', 1, 6, '0', '245', 'a', 'Title', NULL, 1, 'textbox', 1, -1, 1, '2016-11-04 12:03:15', 6, '2016-11-04 12:03:15', 6),
(48, 'author', 1, 6, '0', '100', 'a', 'Author', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 12:03:15', 6, '2016-11-04 12:03:15', 6),
(49, 'description', 1, 6, '0', '520', 'a', 'Description', NULL, 0, 'textarea', 1, 0, 1, '2016-11-04 12:03:15', 6, '2016-11-04 12:03:15', 6),
(50, 'total_page', 1, 6, '0', '300', 'a', 'Total pages', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 12:03:15', 6, '2016-11-04 12:03:15', 6),
(51, '', 1, 6, '0', '650', 'a', 'Subject', 'หัวเรื่อง', 0, 'textbox', 1, 0, 0, '2016-11-04 12:03:15', 6, '2016-11-04 12:03:15', 6),
(52, '', 1, 6, '0', '020', 'a', 'ISBN', NULL, 0, 'textbox', 1, 0, 0, '2016-11-04 12:03:15', 6, '2016-11-04 12:03:15', 6),
(53, '', 1, 6, '0', '260', 'b', 'Name of publisher', 'ชื่อสำนักพิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:03:15', 6, '2016-11-04 12:03:15', 6),
(54, '', 1, 6, '0', '260', 'c', 'Date of publication', 'วันที่พิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:03:15', 6, '2016-11-04 12:03:15', 6),
(67, 'total_page', 1, 7, '0', '300', 'a', 'Total pages', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 12:09:50', 6, '2016-11-04 12:09:50', 6),
(66, 'description', 1, 7, '0', '520', 'a', 'Description', NULL, 0, 'textarea', 1, 0, 1, '2016-11-04 12:09:50', 6, '2016-11-04 12:09:50', 6),
(64, 'title', 1, 7, '0', '245', 'a', 'Title', NULL, 1, 'textbox', 1, -1, 1, '2016-11-04 12:09:50', 6, '2016-11-04 12:09:50', 6),
(65, 'author', 1, 7, '0', '100', 'a', 'Author', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 12:09:50', 6, '2016-11-04 12:09:50', 6),
(68, '', 1, 7, '0', '650', 'a', 'Subject', 'หัวเรื่อง', 0, 'textbox', 1, 0, 0, '2016-11-04 12:09:50', 6, '2016-11-04 12:09:50', 6),
(69, '', 1, 7, '0', '020', 'a', 'ISBN', NULL, 0, 'textbox', 1, 0, 0, '2016-11-04 12:09:51', 6, '2016-11-04 12:09:51', 6),
(70, '', 1, 7, '0', '260', 'b', 'Name of publisher', 'ชื่อสำนักพิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:09:51', 6, '2016-11-04 12:09:51', 6),
(71, '', 1, 7, '0', '260', 'c', 'Date of publication', 'วันที่พิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:09:51', 6, '2016-11-04 12:09:51', 6),
(72, 'ext-source', 1, 7, '0', '856', '', 'External URL', 'ลิงค์เชื่อมโยง', 0, 'textbox', 1, 999, 1, '2016-11-04 12:09:51', 6, '2016-11-04 12:09:51', 6),
(73, 'title', 1, 8, '0', '245', 'a', 'Title', NULL, 1, 'textbox', 1, -1, 1, '2016-11-04 12:10:13', 6, '2016-11-04 12:10:13', 6),
(74, 'author', 1, 8, '0', '100', 'a', 'Author', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 12:10:13', 6, '2016-11-04 12:10:13', 6),
(75, 'description', 1, 8, '0', '520', 'a', 'Description', NULL, 0, 'textarea', 1, 0, 1, '2016-11-04 12:10:13', 6, '2016-11-04 12:10:13', 6),
(76, 'total_page', 1, 8, '0', '300', 'a', 'Total pages', NULL, 0, 'textbox', 1, 0, 1, '2016-11-04 12:10:13', 6, '2016-11-04 12:10:13', 6),
(77, '', 1, 8, '0', '650', 'a', 'Subject', 'หัวเรื่อง', 0, 'textbox', 1, 0, 0, '2016-11-04 12:10:13', 6, '2016-11-04 12:10:13', 6),
(78, '', 1, 8, '0', '020', 'a', 'ISBN', NULL, 0, 'textbox', 1, 0, 0, '2016-11-04 12:10:13', 6, '2016-11-04 12:10:13', 6),
(79, 'no_1', 1, 8, '0', '050', 'a', 'Classification No.', 'เลขหมู่หลัก', 0, 'textbox', 1, 0, 0, '2016-11-04 12:10:13', 6, '2016-11-04 12:10:13', 6),
(80, 'no_2', 1, 8, '0', '050', 'b', 'Author ID', 'เลขผู้แต่ง', 0, 'textbox', 1, 0, 0, '2016-11-04 12:10:13', 6, '2016-11-04 12:10:13', 6),
(81, 'no_3', 1, 8, '0', '050', 'b', 'Publish Year', 'ปีที่พิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:10:13', 6, '2016-11-04 12:10:13', 6),
(82, 'no_4', 1, 8, '0', '050', 'b', 'Item/Issue No.', 'ฉบับหรือเล่มที่', 0, 'textbox', 1, 0, 0, '2016-11-04 12:10:13', 6, '2016-11-04 12:10:13', 6),
(83, '', 1, 8, '0', '260', 'a', 'Place of publication', 'สถานที่พิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:10:13', 6, '2016-11-04 12:10:13', 6),
(84, '', 1, 8, '0', '260', 'b', 'Name of publisher', 'ชื่อสำนักพิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:10:13', 6, '2016-11-04 12:10:13', 6),
(85, '', 1, 8, '0', '260', 'c', 'Date of publication', 'วันที่พิมพ์', 0, 'textbox', 1, 0, 0, '2016-11-04 12:10:13', 6, '2016-11-04 12:10:13', 6),
(86, 'title', 1, 9, '0', '245', 'a', 'Title', NULL, 1, 'textbox', 1, -1, 1, '2017-04-05 15:09:23', 1, '2017-04-05 15:09:23', 1),
(87, 'author', 1, 9, '0', '100', 'a', 'Author', NULL, 0, 'textbox', 1, 0, 1, '2017-04-05 15:09:23', 1, '2017-04-05 15:09:23', 1),
(88, 'description', 1, 9, '0', '520', 'a', 'Description', NULL, 0, 'textarea', 1, 0, 1, '2017-04-05 15:09:23', 1, '2017-04-05 15:09:23', 1),
(89, 'ext-source', 1, 9, '0', '', '', 'Youtube VDO code', NULL, 0, 'textbox', 1, 0, 1, '2017-04-05 15:09:23', 1, '2017-04-05 15:09:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_topic`
--

CREATE TABLE `product_topic` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `topic_main_aid` int(11) NOT NULL,
  `parent_aid` int(10) DEFAULT NULL,
  `level` tinyint(2) UNSIGNED DEFAULT NULL,
  `name` text NOT NULL,
  `weight` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_topic_main`
--

CREATE TABLE `product_topic_main` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(12) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `weight` double DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `aid` tinyint(4) UNSIGNED NOT NULL,
  `cid` varchar(12) NOT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`aid`, `cid`, `user_owner_aid`, `name`, `icon`, `description`, `status`, `weight`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 'book', 1, 'Book', 'book', '0', 1, 1, '2013-11-25 00:00:00', 1, '2014-06-22 19:50:50', 1),
(2, 'magazine', 1, 'Magazine', 'book', '', 1, 2, '2013-11-25 00:00:00', 1, '2013-12-05 01:56:24', 1),
(3, 'vdo', 1, 'VDO', 'video-camera', '', 1, 3, '2013-11-25 00:00:00', 1, '2014-06-22 19:50:47', 1),
(4, 'else', 1, 'Else', 'tags', '', 0, 4, '2013-11-25 00:00:00', 1, '2014-06-22 19:50:42', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_type_minor`
--

CREATE TABLE `product_type_minor` (
  `aid` tinyint(4) UNSIGNED NOT NULL,
  `cid` varchar(12) NOT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `setting_config_aid` int(10) UNSIGNED NOT NULL,
  `is_license` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `description` text,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_type_minor`
--

INSERT INTO `product_type_minor` (`aid`, `cid`, `user_owner_aid`, `product_type_aid`, `setting_config_aid`, `is_license`, `name`, `description`, `status`, `weight`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 'book-p-s', 1, 1, 7, 0, 'Book : Paper : Sale', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(2, 'book-p-r', 1, 1, 7, 0, 'Book : Paper : Rental', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(3, 'book-d-f', 1, 1, 8, 0, 'Book : Digital : Free', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(4, 'book-d-s', 1, 1, 8, 0, 'Book : Digital : Sale', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(5, 'book-d-r', 1, 1, 8, 0, 'Book : Digital : Rental', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(6, 'book-dl-f', 1, 1, 8, 1, 'Book : Digital License : Free', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(7, 'book-dl-r', 1, 1, 8, 1, 'Book : Digital License : Rental', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(8, 'magazine-p-s', 1, 2, 14, 0, 'Magazine : Paper : Sale', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(9, 'magazine-p-r', 1, 2, 14, 0, 'Magazine : Paper : Rental', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(10, 'magazine-d-f', 1, 2, 15, 0, 'Magazine : Digital : Free', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(11, 'magazine-d-s', 1, 2, 15, 0, 'Magazine : Digital : Sale', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(12, 'magazine-d-r', 1, 2, 15, 0, 'Magazine : Digital : Rental', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(13, 'magazine-dl-', 1, 2, 15, 1, 'Magazine : Digital License : Free', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(14, 'magazine-dl-', 1, 2, 15, 1, 'Magazine : Digital License : Rental', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(15, 'vdo-p-s', 1, 3, 21, 0, 'VDO : Disc : Sale', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(16, 'vdo-p-r', 1, 3, 21, 0, 'VDO : Disc : Rental', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(17, 'vdo-d-f', 1, 3, 21, 0, 'VDO : Digital : Free', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(18, 'vdo-d-s', 1, 3, 21, 0, 'VDO : Digital : Sale', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(19, 'vdo-d-r', 1, 3, 21, 0, 'VDO : Digital : Rental', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(20, 'vdo-dl-f', 1, 3, 21, 1, 'VDO : Digital License : Free', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(21, 'vdo-dl-r', 1, 3, 21, 1, 'VDO : Digital License : Rental', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(22, 'else-p-s', 1, 4, 28, 0, 'Else : Piece : Sale', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(23, 'else-p-r', 1, 4, 28, 0, 'Else : Piece : Rental', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(24, 'else-d-f', 1, 4, 28, 0, 'Else : Digital : Free', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(25, 'else-d-s', 1, 4, 28, 0, 'Else : Digital : Sale', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(26, 'else-d-r', 1, 4, 28, 0, 'Else : Digital : Rental', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(27, 'else-dl-f', 1, 4, 28, 1, 'Else : Digital License : Free', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1),
(28, 'else-dl-r', 1, 4, 28, 1, 'Else : Digital License : Rental', NULL, 1, 0, '2013-11-27 00:00:00', 1, '2013-11-27 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `contact_name` varchar(100) NOT NULL,
  `contact_number` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `logo` text,
  `remark` text,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`aid`, `cid`, `user_owner_aid`, `name`, `url`, `contact_name`, `contact_number`, `email`, `logo`, `remark`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, '000001', 1, 'Bookdose', 'bookdose', '', '', '', NULL, '', 1, '2016-08-17 14:20:51', 6, '2016-08-17 14:20:51', 6),
(2, '000016', 1, 'มติชน', 'มติชน', '', NULL, NULL, NULL, NULL, 1, '2016-10-04 17:34:02', 5, '2016-10-04 17:34:02', 5),
(3, '000017', 1, 'TCDC', 'tcdc', '', NULL, NULL, NULL, NULL, 1, '2016-10-04 17:44:51', 5, '2016-10-04 17:44:51', 5),
(4, '000018', 1, 'Creative Thailand', 'creative-thailand', '', '', '', NULL, '', 1, '2016-12-03 02:18:05', 13, '2016-12-03 02:18:05', 13),
(5, '000019', 1, 'สำนักงานคณะกรรมการพัฒนาการเศรษกิจและสังคมแห่งชาติ', 'สำนักงานคณะกรรมการพัฒนาการเศรษกิจและสังคมแห่งชาติ', '', '', '', NULL, '', 1, '2016-12-06 14:30:54', 12, '2016-12-06 14:30:54', 12),
(6, '000020', 1, 'ธรรมะอินเทรนด์', 'ธรรมะอินเทรนด์', '', '', '', NULL, '', 1, '2016-12-06 14:57:06', 12, '2016-12-06 14:57:06', 12),
(7, '000021', 1, 'คนทำงาน', 'คนทำงาน', '', '', '', NULL, '', 1, '2016-12-06 16:33:41', 12, '2016-12-06 16:33:41', 12),
(8, '000022', 1, 'การท่องเที่ยวแห่งประเทศไทย', 'การท่องเที่ยวแห่งประเทศไทย', '', '', '', NULL, '', 1, '2016-12-06 16:40:15', 12, '2016-12-06 16:40:15', 12),
(9, '000023', 1, 'คณะกรรมการอาหารแห่งชาติ', 'คณะกรรมการอาหารแห่งชาติ', '', '', '', NULL, '', 1, '2016-12-06 17:26:11', 12, '2016-12-06 17:26:11', 12),
(10, '000024', 1, 'ทรูปลูกปัญญา', 'ทรูปลูกปัญญา', '', '', '', NULL, '', 1, '2016-12-07 14:09:04', 12, '2016-12-07 14:09:04', 12),
(11, '000025', 1, 'ทูตเยาวชนวิทยาศาสตร์ไทย', 'ทูตเยาวชนวิทยาศาสตร์ไทย', '', '', '', NULL, '', 1, '2016-12-07 15:43:45', 12, '2016-12-07 15:43:45', 12),
(12, '000026', 1, 'บริษัท อินเตอร์ลิ้งค์ เทเลคอม จำกัด (มหาชน)', 'บริษัท-อินเตอร์ลิ้งค์-เทเลคอม-จำกัด-มหาชน', '', '', '', NULL, '', 1, '2016-12-07 15:50:45', 12, '2016-12-07 15:50:45', 12),
(13, '000027', 1, 'viewplusmag ', 'viewplusmag', '', '', '', NULL, '', 1, '2016-12-07 16:07:17', 12, '2016-12-07 16:07:17', 12),
(14, '000028', 1, ' สัจจา จันทรวิเชียร', 'สัจจา-จันทรวิเชียร', '', '', '', NULL, '', 1, '2016-12-13 11:30:58', 12, '2016-12-13 11:30:58', 12),
(15, '000029', 1, 'กระทรวงวัฒนธรรม', 'กระทรวงวัฒนธรรม', '', '', '', NULL, '', 1, '2016-12-13 16:33:14', 12, '2016-12-13 16:33:14', 12),
(16, '000030', 1, 'กรมส่งเสริมคุณภาพสิ่งแวดล้อม', 'กรมส่งเสริมคุณภาพสิ่งแวดล้อม', '', '', '', NULL, '', 1, '2016-12-14 10:35:12', 12, '2016-12-14 10:35:12', 12),
(17, '000031', 1, 'ไทยวัฒนาพานิช', 'ไทยวัฒนาพานิช', '', '', '', NULL, '', 1, '2016-12-14 15:12:23', 12, '2016-12-14 15:12:23', 12),
(18, '000032', 1, 'มูลนิธิโครงการตำราสังคมศาสตร์และมนุษยศาสตร์', 'มูลนิธิโครงการตำราสังคมศาสตร์และมนุษยศาสตร์', '', '', '', NULL, '', 1, '2016-12-14 15:23:32', 12, '2016-12-14 15:23:32', 12),
(19, '000033', 1, 'ตลาดหลักทรัพย์แห่งประเทศไทย', 'ตลาดหลักทรัพย์แห่งประเทศไทย', '', '', '', NULL, '', 1, '2016-12-14 15:59:18', 12, '2016-12-14 15:59:18', 12),
(20, '000034', 1, 'สำนักงานกองทุนสนับสนุนการสร้างเสริมสุขภาพ', 'สำนักงานกองทุนสนับสนุนการสร้างเสริมสุขภาพ', '', '', '', NULL, '', 1, '2016-12-14 16:46:13', 12, '2016-12-14 16:46:13', 12),
(21, '000035', 1, 'John wiley & sons,Inc', '๋john-wiley-sonsinc', '', '', '', NULL, '', 1, '2016-12-14 17:58:49', 12, '2016-12-14 18:00:05', 12),
(22, '000036', 1, 'UXPin Inc.', 'uxpin-inc', '', '', '', NULL, '', 1, '2016-12-15 09:58:08', 12, '2016-12-15 09:58:08', 12),
(23, '000037', 1, 'ดอย', 'ดอย', '', '', '', NULL, '', 1, '2016-12-15 10:32:48', 12, '2016-12-15 10:32:48', 12),
(24, '000038', 1, 'ทำกันเอง', 'ทำกันเอง', '', '', '', NULL, '', 1, '2016-12-15 11:29:54', 12, '2016-12-15 11:29:54', 12),
(25, '000039', 1, 'ชมรมกัลยาณธรรม', 'ชมรมกัลยาณธรรม', '', '', '', NULL, '', 1, '2016-12-15 11:44:24', 12, '2016-12-15 11:44:24', 12),
(26, '000040', 1, 'ศูนย์คุณธรรม(องค์การมหาชน)', 'ศูนย์คุณธรรมองค์การมหาชน', '', '', '', NULL, '', 1, '2016-12-15 11:49:25', 12, '2016-12-15 11:49:25', 12),
(27, '000041', 1, 'ประวัติศาสตร์', 'ประวัติศาสตร์', '', '', '', NULL, '', 1, '2016-12-15 12:05:59', 12, '2016-12-15 12:05:59', 12),
(28, '000042', 1, 'ศูนย์จิตวิทยาการศึกษา มูลนิธิยุวสถิรคุณ', 'ศูนย์จิตวิทยาการศึกษา-มูลนิธิยุวสถิรคุณ', '', '', '', NULL, '', 1, '2016-12-15 12:13:34', 12, '2016-12-15 12:13:34', 12),
(29, '000043', 1, 'สำนักงานคณะกรรมการพัฒนาการการศึกษาขั้นพื้นฐานและศูนย์จิตวิทยาการศึกษา มูลนิธิยุวสถิรคุณ', 'สำนักงานคณะกรรมการพัฒนาการการศึกษาขั้นพื้นฐานและศูนย์จิตวิทยาการศึกษา-มูลนิธิยุวสถิรคุณ', '', '', '', NULL, '', 1, '2016-12-15 12:21:30', 12, '2016-12-15 12:21:30', 12),
(30, '000044', 1, ' อนิเมทกรุ๊ป', 'อนิเมทกรุ๊ป', '', '', '', NULL, '', 1, '2016-12-15 12:42:51', 12, '2016-12-15 12:42:51', 12),
(31, '000045', 1, 'สำนักงานคณะกรรมการสุขภาพแห่งชาติ ', 'สำนักงานคณะกรรมการสุขภาพแห่งชาติ', '', '', '', NULL, '', 1, '2016-12-15 17:28:14', 12, '2016-12-15 17:28:14', 12),
(32, '000046', 1, 'บริษัท ทวีวัฒน์การพิมพ์', 'บริษัท-ทวีวัฒน์การพิมพ์', '', '', '', NULL, '', 1, '2016-12-15 18:37:58', 12, '2016-12-15 18:37:58', 12),
(33, '000047', 1, 'จิ้งจอกมายา', 'จิ้งจอกมายา', '', '', '', NULL, '', 1, '2016-12-15 19:04:23', 12, '2016-12-15 19:04:23', 12),
(35, '000049', 1, 'Council of Foreign Relations ', 'council-of-foreign-relations', '', '', 'www.foreignaffairs.com', NULL, '', 1, '2016-12-17 16:28:51', 33, '2016-12-17 16:28:51', 33),
(36, '000050', 1, 'สำนักงานศิลปวัฒนธรรมร่วมสมัย กระทรวงวัฒนธรรม', 'สำนักงานศิลปวัฒนธรรมร่วมสมัย-กระทรวงวัฒนธรรม', '', '', '', NULL, '', 1, '2016-12-19 09:51:22', 12, '2016-12-19 09:51:22', 12),
(37, '000051', 1, ' Thailand Securities Institute (TSI)', 'thailand-securities-institute-tsi', '', '', '', NULL, '', 1, '2016-12-19 11:22:18', 12, '2016-12-19 11:22:18', 12),
(38, '000052', 1, 'The Stock Exchange of Thailand', 'the-stock-exchange-of-thailand', '', '', '', NULL, '', 1, '2016-12-19 11:42:53', 12, '2016-12-19 11:42:53', 12),
(39, '000053', 1, ' ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม สำนักงานบริหารและพัฒนาองค์ความรู้ (องค์การมหาชน)', 'ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม-สำนักงานบริหารและพัฒนาองค์ความรู้-องค์การมหาชน', '', '', '', NULL, '', 1, '2016-12-19 11:57:32', 12, '2016-12-19 11:57:32', 12),
(40, '000054', 1, 'นิตยสารธรรมะใกล้ตัว', 'นิตยสารธรรมะใกล้ตัว', '', '', '', NULL, '', 1, '2016-12-19 12:06:39', 12, '2016-12-19 12:06:39', 12),
(41, '000055', 1, 'สำนักพิมพ์เลี่ยงเชียง เพียรเพื่อพุทธศาสน์', 'สำนักพิมพ์เลี่ยงเชียง-เพียรเพื่อพุทธศาสน์', '', '', '', NULL, '', 1, '2016-12-21 11:26:34', 12, '2016-12-21 11:26:34', 12),
(42, '000056', 1, 'อนามัยบุ๊ค', 'อนามัยบุ๊ค', '', '', '', NULL, '', 1, '2016-12-21 17:43:23', 12, '2016-12-21 17:43:23', 12),
(43, '000057', 1, 'โครงการพัฒนาเครือข่ายเศรษฐศาสตร์พฤติกรรมเพื่อสร้างเสริมสุขภาวะของประชากรไทย', 'โครงการพัฒนาเครือข่ายเศรษฐศาสตร์พฤติกรรมเพื่อสร้างเสริมสุขภาวะของประชากรไทย', '', '', '', NULL, '', 1, '2016-12-22 11:16:51', 12, '2016-12-22 11:16:51', 12),
(44, '000058', 1, 'อาหารอาเซียน', 'อาหารอาเซียน', '', '', '', NULL, '', 1, '2016-12-22 11:31:08', 12, '2016-12-22 11:31:08', 12),
(45, '000059', 1, 'สำนักส่งเสริมและพิทักษ์ผู้สูงอายุ', 'สำนักส่งเสริมและพิทักษ์ผู้สูงอายุ', '', '', '', NULL, '', 1, '2016-12-22 11:32:06', 12, '2016-12-22 11:32:06', 12),
(46, '000060', 1, 'ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม', 'ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม', '', '', '', NULL, '', 1, '2016-12-22 11:33:24', 12, '2016-12-22 11:33:24', 12),
(47, '000061', 1, 'Atitta Publication', 'atitta-publication', '', '', '', NULL, '', 1, '2016-12-22 12:59:43', 12, '2016-12-22 12:59:43', 12),
(48, '000062', 1, 'หมอชาวบ้าน', 'หมอชาวบ้าน', '', '', '', NULL, '', 1, '2016-12-22 17:21:14', 12, '2016-12-22 17:21:14', 12),
(49, '000063', 1, 'Asia Pacific Defense FORUM', 'asia-pacific-defense-forum', '', '', 'http://apdforum.com', NULL, '', 1, '2017-01-17 09:34:40', 33, '2017-01-17 09:35:19', 33);

-- --------------------------------------------------------

--
-- Table structure for table `questionaire`
--

CREATE TABLE `questionaire` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `weight` float DEFAULT '0',
  `publish_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `posted_email` varchar(255) DEFAULT NULL,
  `total_view` int(10) UNSIGNED DEFAULT '0',
  `total_submit` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questionaire`
--

INSERT INTO `questionaire` (`aid`, `cid`, `user_owner_aid`, `title`, `description`, `weight`, `publish_date`, `expiry_date`, `category`, `status`, `posted_by`, `posted_email`, `total_view`, `total_submit`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(18, 'cfP5Jc8wv5Dn', 1, 'test questionnaire ', '1 = น้อยที่สุด, 2 = น้อย, 3 = ปานกลาง, 4 = มาก, 5 = มากที่สุด', 0, '2017-03-22', NULL, ',1,', 1, 16, NULL, 5, 2, '2015-01-27 17:53:42', 16, '2015-03-24 15:48:17', 17),
(20, 'Wh98J2GOzecj', 1, 'test new questionaire', '1=2 2=4 3=5', 0, '2017-03-22', NULL, ',7,', 1, 22, NULL, 3, 0, '2015-03-25 11:26:59', 22, '2015-05-20 11:56:53', 22),
(12, 'k8sSatbkqKKy', 1, 'สำรวจความคิดเห็นพนักงานเกี่ยวกับการจัดงานปีใหม่ 16-17 มกราคม 2558 ', '<p>โปรดทำเครื่องหมายที่ท่านเห็นว่าเหมาะสม (5 = ดีมาก , 4 = ดี , 3 = ปานกลาง , 2 = พอใช้ , 1=ปรับปรุง)</p>', 0, '2017-03-22', '2017-03-21', ',4,', 1, 24, NULL, 187, 96, '2015-01-19 10:50:20', 24, '2017-03-21 15:36:10', 1),
(28, 'RvLERsEitIav', 1, 'aaaaa', '', 0, '2017-03-22', NULL, ',1,', 0, 16, NULL, 0, 0, '2015-07-01 12:14:10', 16, '2015-07-01 12:14:10', 16),
(29, 'VU04xIrngURH', 1, 'bbbbb', '<p>sss</p>', 0, '2017-03-22', NULL, ',1,', 1, 16, NULL, 0, 0, '2015-07-01 13:52:37', 16, '2017-03-21 11:44:13', 1),
(30, '7J8kShPXUGnq', 1, 'Bookdose 9999', '<p>Test Test Test</p>', 0, '2017-03-22', '2017-03-24', ',8,', 1, 1, NULL, 4, 1, '2017-03-21 15:41:22', 1, '2017-03-22 17:14:43', 1);

-- --------------------------------------------------------

--
-- Table structure for table `questionaire_category`
--

CREATE TABLE `questionaire_category` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(24) NOT NULL,
  `weight` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questionaire_category`
--

INSERT INTO `questionaire_category` (`aid`, `cid`, `user_owner_aid`, `name`, `url`, `weight`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, NULL, 1, 'HR Training', 'hr-training', 0, 1, '2014-09-27 08:36:44', 8, '2015-01-19 11:04:44', 17),
(2, NULL, 1, 'CSR', 'csr', 0, 1, '2014-09-27 08:37:29', 8, '2014-09-27 08:37:29', 8),
(7, NULL, 1, 'IT Training', 'it-training', 0, 1, '2015-02-25 15:19:31', 22, '2015-02-25 15:19:31', 22),
(4, NULL, 1, 'HR Activity', 'ewg-partner', 0, 1, NULL, NULL, '2015-01-19 11:04:22', 17),
(5, NULL, 1, 'EWG Knowledge', 'ewg-knowledge', 0, 1, NULL, NULL, '2014-11-13 15:10:25', 8),
(8, NULL, 1, 'Bookdose', 'bookdosw-q', 0, 1, '2017-03-21 12:19:53', 1, '2017-03-21 15:42:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `questionaire_question`
--

CREATE TABLE `questionaire_question` (
  `aid` int(10) UNSIGNED NOT NULL,
  `questionaire_aid` int(10) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `weight` float DEFAULT '0',
  `help_text` varchar(255) DEFAULT NULL,
  `question_type` enum('rdo','chk','txt','txa','sca') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'txt',
  `has_na` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Only for scale type',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `posted_email` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questionaire_question`
--

INSERT INTO `questionaire_question` (`aid`, `questionaire_aid`, `title`, `weight`, `help_text`, `question_type`, `has_na`, `status`, `user_owner_aid`, `posted_by`, `posted_email`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 1, 'กิจกรรมที่ต้องการให้จัด', 1, NULL, 'txt', 0, 1, 1, 13, NULL, '2014-12-11 11:07:29', 18, '2014-12-22 11:39:36', 13),
(2, 1, 'เชิญ vote', 2, NULL, 'rdo', 0, 1, 1, 13, NULL, '2014-12-11 11:07:29', 18, '2014-12-22 11:39:36', 13),
(3, 1, 'ว่างๆชอบทำไร (เลือกได้มากกว่า 1)', 3, NULL, 'chk', 0, 1, 1, 13, NULL, '2014-12-11 11:07:29', 18, '2014-12-22 11:39:36', 13),
(4, 2, 'ใครสวยที่สุดในบริษัท', 1, NULL, 'rdo', 0, 1, 1, 24, NULL, '2014-12-11 11:07:53', 24, '2014-12-11 11:08:43', 24),
(5, 2, 'อยากทำอะไรกันบ้าง (เลือกได้มากกว่า 1)', 2, NULL, 'chk', 0, 1, 1, 24, NULL, '2014-12-11 11:07:53', 24, '2014-12-11 11:08:43', 24),
(6, 2, 'คืออะไร', 3, NULL, 'sca', 0, 1, 1, 24, NULL, '2014-12-11 11:07:53', 24, '2014-12-11 11:08:43', 24),
(7, 3, 'กิจกรรมที่ต้องการให้จัด', 1, NULL, 'txt', 0, 1, 1, 18, NULL, '2014-12-11 11:08:44', 18, '2014-12-11 11:08:44', 18),
(8, 3, 'เชิญโหวต', 2, NULL, 'rdo', 0, 1, 1, 18, NULL, '2014-12-11 11:08:44', 18, '2014-12-11 11:08:44', 18),
(9, 3, 'ว่างๆ ชอบทำอะไร', 3, NULL, 'chk', 0, 1, 1, 18, NULL, '2014-12-11 11:08:44', 18, '2014-12-11 11:08:44', 18),
(10, 4, 'สถานที่ อยากพาเมียไป', 1, NULL, 'txt', 0, 1, 1, 35, NULL, '2014-12-11 11:09:10', 35, '2014-12-11 11:09:10', 35),
(11, 4, 'เชิญโหวต', 2, NULL, 'rdo', 0, 1, 1, 35, NULL, '2014-12-11 11:09:10', 35, '2014-12-11 11:09:10', 35),
(12, 1, 'รักผู้จัดการขนาดใหญ่', 4, NULL, 'sca', 0, 1, 1, 13, NULL, '2014-12-11 11:09:42', 18, '2014-12-22 11:39:36', 13),
(13, 5, 'อยากทำอะไร', 1, NULL, 'txt', 0, 1, 1, 13, NULL, '2014-12-11 11:10:47', 32, '2014-12-19 13:14:42', 13),
(14, 5, 'ว่างทำอะไร', 2, NULL, 'rdo', 0, 1, 1, 13, NULL, '2014-12-11 11:10:47', 32, '2014-12-19 13:14:42', 13),
(15, 5, 'หยุดยาวทำอะไร', 3, NULL, 'chk', 0, 1, 1, 13, NULL, '2014-12-11 11:10:47', 32, '2014-12-19 13:14:42', 13),
(16, 6, 'งานอดิเรกที่ชอบ', 1, NULL, 'txa', 0, 1, 1, 13, NULL, '2014-12-11 11:12:02', 33, '2014-12-19 13:14:20', 13),
(17, 6, 'ชอบกิจกรรมอะไรมากที่สุด', 2, NULL, 'rdo', 0, 1, 1, 13, NULL, '2014-12-11 11:12:02', 33, '2014-12-19 13:14:20', 13),
(18, 6, 'กิจกรรมที่ชอบ', 3, NULL, 'chk', 0, 1, 1, 13, NULL, '2014-12-11 11:12:02', 33, '2014-12-19 13:14:20', 13),
(26, 7, 'กล้องถ่ายรูปอะไรที่่คุณเลือกใช้', 1, NULL, 'chk', 0, 1, 1, 13, NULL, '2014-12-11 11:25:54', 18, '2014-12-19 13:20:41', 13),
(20, 8, 'กดพกดเ', 1, NULL, 'txt', 0, 1, 1, 39, NULL, '2014-12-11 11:17:54', 39, '2014-12-11 11:17:54', 39),
(33, 9, 'ชอบโครงการ CSR ด้านสังคมและเศรษฐกิจอะไรบ้าง', 3, NULL, 'rdo', 0, 1, 1, 13, NULL, '2014-12-11 11:30:08', 37, '2014-12-19 13:13:22', 13),
(32, 9, 'ชอบโครงการ CSR ด้านส่งเสริมความรู้ไม่มีที่สิ้นสุด อะไรบ้าง', 2, NULL, 'rdo', 0, 1, 1, 13, NULL, '2014-12-11 11:30:08', 37, '2014-12-19 13:13:22', 13),
(31, 9, 'ชอบโครงการ CSR ด้านสาธารณูปโภคด้านน้ำ อะไรบ้าง', 1, NULL, 'rdo', 0, 1, 1, 13, NULL, '2014-12-11 11:30:08', 37, '2014-12-19 13:13:22', 13),
(27, 7, 'ทำไมถึงใช้ยี่ห้อนี้', 2, NULL, 'chk', 0, 1, 1, 13, NULL, '2014-12-11 11:25:54', 18, '2014-12-19 13:20:41', 13),
(28, 7, 'คุณรู้เรื่องการถ่ายภาพมากเพียงไร', 3, NULL, 'sca', 0, 1, 1, 13, NULL, '2014-12-11 11:25:54', 18, '2014-12-19 13:20:41', 13),
(29, 7, 'ชอบถ่ายภาพแบบใหน', 4, NULL, 'chk', 0, 1, 1, 13, NULL, '2014-12-11 11:25:54', 18, '2014-12-19 13:20:41', 13),
(30, 7, 'ราคากล้องที่คิดจะซื้อใช้', 5, NULL, 'rdo', 0, 1, 1, 13, NULL, '2014-12-11 11:25:54', 18, '2014-12-19 13:20:41', 13),
(34, 10, 'ชอบโครงการ CSR ด้านสาธารณูปโภคด้านน้ำ อะไรบ้าง', 1, NULL, 'rdo', 0, 1, 1, 13, NULL, '2014-12-11 11:30:26', 37, '2014-12-19 13:13:01', 13),
(35, 10, 'ชอบโครงการ CSR ด้านส่งเสริมความรู้ไม่มีที่สิ้นสุด อะไรบ้าง', 2, NULL, 'rdo', 0, 1, 1, 13, NULL, '2014-12-11 11:30:26', 37, '2014-12-19 13:13:01', 13),
(36, 10, 'ชอบโครงการ CSR ด้านสังคมและเศรษฐกิจอะไรบ้าง', 3, NULL, 'rdo', 0, 1, 1, 13, NULL, '2014-12-11 11:30:26', 37, '2014-12-19 13:13:01', 13),
(49, 11, 'ฝ่ายที่ท่านสังกัด', 1, NULL, 'chk', 0, 1, 1, 24, NULL, '2015-01-19 10:31:12', 24, '2015-01-19 10:31:12', 24),
(50, 11, 'ท่านปฏิบัติงานประจำพื้นที่', 2, NULL, 'chk', 0, 1, 1, 24, NULL, '2015-01-19 10:31:12', 24, '2015-01-19 10:31:12', 24),
(103, 22, 'test', 1, NULL, 'txa', 0, 1, 1, 16, NULL, '2015-04-10 14:41:22', 16, '2015-04-10 14:41:22', 16),
(100, 20, 'tesweytwty', 1, NULL, 'sca', 0, 1, 1, 22, NULL, '2015-03-25 11:26:59', 22, '2015-05-20 11:56:53', 22),
(101, 21, 'test', 1, NULL, 'txt', 0, 1, 1, 16, NULL, '2015-03-27 13:31:19', 16, '2015-03-27 13:32:17', 16),
(92, 18, 'test questionnaire', 1, NULL, 'txt', 0, 1, 1, 17, NULL, '2015-01-27 17:53:42', 16, '2015-03-24 15:48:17', 17),
(93, 19, 'ความพึงพอใจต่อ ..............', 1, NULL, 'chk', 0, 1, 1, 17, NULL, '2015-02-25 15:19:31', 17, '2015-02-25 15:23:21', 17),
(94, 19, 'การทำงาน', 2, NULL, 'sca', 0, 1, 1, 17, NULL, '2015-02-25 15:19:31', 17, '2015-02-25 15:23:21', 17),
(95, 19, 'เหตุผล', 3, NULL, 'txa', 0, 1, 1, 17, NULL, '2015-02-25 15:19:31', 17, '2015-02-25 15:23:21', 17),
(96, 19, 'test', 4, NULL, 'rdo', 0, 1, 1, 17, NULL, '2015-02-25 15:23:21', 17, '2015-02-25 15:23:21', 17),
(97, 19, 'dfjjx c', 5, NULL, 'txt', 0, 1, 1, 17, NULL, '2015-02-25 15:23:21', 17, '2015-02-25 15:23:21', 17),
(98, 18, 'ข้อใดคือ ...', 2, NULL, 'rdo', 0, 1, 1, 17, NULL, '2015-03-05 13:22:26', 17, '2015-03-24 15:48:17', 17),
(99, 18, 'ทดสอบ', 3, NULL, 'sca', 0, 1, 1, 17, NULL, '2015-03-05 13:22:26', 17, '2015-03-24 15:48:17', 17),
(89, 15, 'fill', 1, NULL, 'txt', 0, 1, 1, 9, NULL, '2015-01-22 15:34:40', 9, '2015-01-22 15:34:40', 9),
(90, 16, 'test', 1, NULL, 'txt', 0, 1, 1, 16, NULL, '2015-01-22 16:08:10', 16, '2015-01-22 16:08:10', 16),
(91, 17, 'ที่นี้ที่ไหน', 1, NULL, 'txt', 0, 1, 1, 16, NULL, '2015-01-27 17:50:51', 16, '2015-01-27 17:50:51', 16),
(87, 12, 'ในการจัดงานครั้งนี้ท่านเห็นควรปรับปรุงเรื่องใดมากที่สุด', 12, NULL, 'txa', 0, 1, 1, 1, NULL, '2015-01-20 13:48:45', 457, '2017-03-21 15:36:10', 1),
(88, 12, 'ข้อเสนอแนะอื่นๆ', 13, NULL, 'txa', 0, 1, 1, 1, NULL, '2015-01-20 13:48:45', 457, '2017-03-21 15:36:10', 1),
(61, 13, 'test1234', 1, NULL, 'rdo', 0, 1, 1, 9, NULL, '2015-01-19 10:56:25', 9, '2015-01-19 10:56:36', 9),
(60, 12, 'ท่านสังกัดพื้นที่ใด', 1, NULL, 'chk', 0, 1, 1, 1, NULL, '2015-01-19 10:50:20', 24, '2017-03-21 15:36:10', 1),
(51, 11, 'ระยะเวลารับทราบการจัดงานเลี้ยงสังสรรค์ปีใหม่ล่วงหน้ามีความเหมาะสม', 3, NULL, 'sca', 0, 1, 1, 24, NULL, '2015-01-19 10:31:12', 24, '2015-01-19 10:31:12', 24),
(52, 11, 'ความน่าสนใจของการประชาสัมพันธ์', 4, NULL, 'sca', 0, 1, 1, 24, NULL, '2015-01-19 10:31:12', 24, '2015-01-19 10:31:12', 24),
(53, 11, 'ความพึงพอใจต่อรูปแบบการจัดงานช่วงเช้า  "EWG Good & Smarter Team" อ.ภูว์สมิงและทีมงาน', 5, NULL, 'sca', 0, 1, 1, 24, NULL, '2015-01-19 10:31:12', 24, '2015-01-19 10:31:12', 24),
(54, 11, 'ความพึงพอใจต่อรูปแบบการจัดงานช่วงบ่าย "กีฬาโอลิมปิค" อ.ภูว์สมิงและทีมงาน', 6, NULL, 'sca', 0, 1, 1, 24, NULL, '2015-01-19 10:31:12', 24, '2015-01-19 10:31:12', 24),
(55, 11, 'ความพึงพอใจต่อการจัดงานเลี้ยงสังสรรค์ ช่วงเย็น', 7, NULL, 'sca', 0, 1, 1, 24, NULL, '2015-01-19 10:31:12', 24, '2015-01-19 10:31:12', 24),
(56, 11, 'ความพึงพอใจต่อของขวัญและของรางวัล', 8, NULL, 'sca', 0, 1, 1, 24, NULL, '2015-01-19 10:31:12', 24, '2015-01-19 10:31:12', 24),
(57, 11, 'ความพึงพอใจต่อห้องพัก และสถานที่จัดงาน', 9, NULL, 'sca', 0, 1, 1, 24, NULL, '2015-01-19 10:31:12', 24, '2015-01-19 10:31:12', 24),
(58, 11, 'ความพึงพอใจต่อความสะอาด ปริมาณและรสชาติอาหาร Royal Hill', 10, NULL, 'sca', 0, 1, 1, 24, NULL, '2015-01-19 10:31:12', 24, '2015-01-19 10:31:12', 24),
(59, 11, 'ข้อเสนอแนะอื่นๆ', 11, NULL, 'txa', 0, 1, 1, 24, NULL, '2015-01-19 10:31:12', 24, '2015-01-19 10:31:12', 24),
(102, 21, 'test2', 2, NULL, 'txt', 0, 1, 1, 16, NULL, '2015-03-27 13:31:19', 16, '2015-03-27 13:32:17', 16),
(82, 14, 'งานวิจัยที่ท่านสนใจ', 1, NULL, 'chk', 0, 1, 1, 24, NULL, '2015-01-19 11:36:06', 9, '2015-01-20 10:29:00', 24),
(72, 12, 'ฝ่ายที่ท่านสังกัด', 2, NULL, 'chk', 0, 1, 1, 1, NULL, '2015-01-19 11:09:03', 24, '2017-03-21 15:36:10', 1),
(73, 12, 'ความเหมาะสมต่อระยะเวลาการประชาสัมพันธ์กิจกรรมปีใหม่', 3, NULL, 'sca', 0, 1, 1, 1, NULL, '2015-01-19 11:09:03', 24, '2017-03-21 15:36:10', 1),
(74, 12, 'ความน่าสนใจของการประชาสัมพันธ์กิจกรรมปีใหม่', 4, NULL, 'sca', 0, 1, 1, 1, NULL, '2015-01-19 11:09:03', 24, '2017-03-21 15:36:10', 1),
(75, 12, 'ความพึงพอใจต่อการจัดกิจกรรมช่วงเช้า EWG Good & Smarter Team', 5, NULL, 'sca', 0, 1, 1, 1, NULL, '2015-01-19 11:09:03', 24, '2017-03-21 15:36:10', 1),
(76, 12, 'ความพึงพอใจต่อการจัดกิจกรรมช่วงบ่าย กีฬาโอลิมปิค', 6, NULL, 'sca', 0, 1, 1, 1, NULL, '2015-01-19 11:09:03', 24, '2017-03-21 15:36:10', 1),
(77, 12, 'ความพึงพอใจต่อการจัดกิจกรรมช่วงเย็น งานเลี้ยงสังสรรค์ปีใหม่', 7, NULL, 'sca', 0, 1, 1, 1, NULL, '2015-01-19 11:09:03', 24, '2017-03-21 15:36:10', 1),
(78, 12, 'ความพึงพอใจต่อสถานที่จัดงานและห้องพัก', 8, NULL, 'sca', 0, 1, 1, 1, NULL, '2015-01-19 11:09:03', 24, '2017-03-21 15:36:10', 1),
(79, 12, 'ความพึงพอใจต่อปริมาณและรสชาติอาหาร', 9, NULL, 'sca', 0, 1, 1, 1, NULL, '2015-01-19 11:09:03', 24, '2017-03-21 15:36:10', 1),
(80, 12, 'สถานที่แนะนำสำหรับการจัดงานครั้งต่อไป', 10, NULL, 'chk', 0, 1, 1, 1, NULL, '2015-01-19 11:09:03', 24, '2017-03-21 15:36:10', 1),
(81, 12, 'ในการจัดงานครั้งนี้ท่านประทับใจเรื่องใดมากที่สุด', 11, NULL, 'txa', 0, 1, 1, 1, NULL, '2015-01-19 11:09:03', 24, '2017-03-21 15:36:10', 1),
(104, 23, 'test', 1, NULL, 'txt', 0, 1, 1, 16, NULL, '2015-07-01 11:54:35', 16, '2015-07-01 11:54:35', 16),
(105, 24, 'test', 1, NULL, 'txt', 0, 1, 1, 16, NULL, '2015-07-01 12:00:43', 16, '2015-07-01 12:00:43', 16),
(106, 25, 'aaaaa', 1, NULL, 'txt', 0, 1, 1, 16, NULL, '2015-07-01 12:03:42', 16, '2015-07-01 12:03:42', 16),
(107, 26, 'bbbbb', 1, NULL, 'txt', 0, 1, 1, 16, NULL, '2015-07-01 12:05:24', 16, '2015-07-01 12:05:24', 16),
(108, 27, 'zzzzzz', 1, NULL, 'txt', 0, 1, 1, 16, NULL, '2015-07-01 12:07:37', 16, '2015-07-01 12:07:37', 16),
(109, 28, 'test', 1, NULL, 'txt', 0, 1, 1, 16, NULL, '2015-07-01 12:14:10', 16, '2015-07-01 12:14:10', 16),
(110, 29, 'test', 1, NULL, 'txt', 0, 1, 1, 1, NULL, '2015-07-01 13:52:37', 16, '2017-03-21 11:44:13', 1),
(111, 30, '1+1', 1, NULL, 'txt', 0, 1, 1, 1, NULL, '2017-03-21 15:41:22', 1, '2017-03-22 17:14:43', 1),
(112, 30, '2+2', 2, NULL, 'txt', 0, 1, 1, 1, NULL, '2017-03-21 15:41:22', 1, '2017-03-22 17:14:43', 1);

-- --------------------------------------------------------

--
-- Table structure for table `questionaire_question_choice`
--

CREATE TABLE `questionaire_question_choice` (
  `questionaire_aid` int(10) UNSIGNED NOT NULL,
  `question_aid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `weight` float DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `posted_email` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questionaire_question_choice`
--

INSERT INTO `questionaire_question_choice` (`questionaire_aid`, `question_aid`, `title`, `weight`, `status`, `user_owner_aid`, `posted_by`, `posted_email`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 3, 'นอน', 4, 1, 1, 13, NULL, '2014-12-22 11:39:36', 13, '2014-12-22 11:39:36', 13),
(1, 3, 'ปั่นจิ้งหรีด', 2, 1, 1, 13, NULL, '2014-12-22 11:39:36', 13, '2014-12-22 11:39:36', 13),
(5, 15, 'อ่่านหนังสือ', 4, 1, 1, 13, NULL, '2014-12-19 13:14:42', 13, '2014-12-19 13:14:42', 13),
(1, 3, 'ตีกบ', 3, 1, 1, 13, NULL, '2014-12-22 11:39:36', 13, '2014-12-22 11:39:36', 13),
(1, 3, 'อ่านหนังสือ', 1, 1, 1, 13, NULL, '2014-12-22 11:39:36', 13, '2014-12-22 11:39:36', 13),
(1, 2, 'วิ่งเปรี้ยว', 4, 1, 1, 13, NULL, '2014-12-22 11:39:36', 13, '2014-12-22 11:39:36', 13),
(1, 2, 'เล่นตี่จับ', 3, 1, 1, 13, NULL, '2014-12-22 11:39:36', 13, '2014-12-22 11:39:36', 13),
(1, 2, 'เล่นปาหี่', 2, 1, 1, 13, NULL, '2014-12-22 11:39:36', 13, '2014-12-22 11:39:36', 13),
(1, 2, 'ดำน้ำ', 1, 1, 1, 13, NULL, '2014-12-22 11:39:36', 13, '2014-12-22 11:39:36', 13),
(2, 5, 'อยู่กับแฟน', 5, 1, 1, 24, NULL, '2014-12-11 11:08:43', 24, '2014-12-11 11:08:43', 24),
(2, 5, 'นอน', 4, 1, 1, 24, NULL, '2014-12-11 11:08:43', 24, '2014-12-11 11:08:43', 24),
(2, 5, 'เล่นกับน้องหมา แมว', 3, 1, 1, 24, NULL, '2014-12-11 11:08:43', 24, '2014-12-11 11:08:43', 24),
(2, 5, 'ไปเที่ยว', 2, 1, 1, 24, NULL, '2014-12-11 11:08:43', 24, '2014-12-11 11:08:43', 24),
(2, 5, 'ทำงาน', 1, 1, 1, 24, NULL, '2014-12-11 11:08:43', 24, '2014-12-11 11:08:43', 24),
(2, 4, 'วัน', 3, 1, 1, 24, NULL, '2014-12-11 11:08:43', 24, '2014-12-11 11:08:43', 24),
(2, 4, 'นิ้ง', 2, 1, 1, 24, NULL, '2014-12-11 11:08:43', 24, '2014-12-11 11:08:43', 24),
(2, 4, 'สิ', 1, 1, 1, 24, NULL, '2014-12-11 11:08:43', 24, '2014-12-11 11:08:43', 24),
(2, 5, 'อยู่กับหัวหน้า', 6, 1, 1, 24, NULL, '2014-12-11 11:08:43', 24, '2014-12-11 11:08:43', 24),
(3, 8, 'ดำน้ำ', 1, 1, 1, 18, NULL, '2014-12-11 11:08:44', 18, '2014-12-11 11:08:44', 18),
(3, 8, 'วิ่งเปรี้ยว', 2, 1, 1, 18, NULL, '2014-12-11 11:08:44', 18, '2014-12-11 11:08:44', 18),
(3, 8, 'เล่นตีจับ', 3, 1, 1, 18, NULL, '2014-12-11 11:08:44', 18, '2014-12-11 11:08:44', 18),
(3, 8, 'เล่นปาฮี่', 4, 1, 1, 18, NULL, '2014-12-11 11:08:44', 18, '2014-12-11 11:08:44', 18),
(3, 8, 'หมากเก็บ', 5, 1, 1, 18, NULL, '2014-12-11 11:08:44', 18, '2014-12-11 11:08:44', 18),
(3, 9, 'อ่านหนังสือ', 1, 1, 1, 18, NULL, '2014-12-11 11:08:44', 18, '2014-12-11 11:08:44', 18),
(3, 9, 'ฟังเพลง', 2, 1, 1, 18, NULL, '2014-12-11 11:08:44', 18, '2014-12-11 11:08:44', 18),
(3, 9, 'นอน', 3, 1, 1, 18, NULL, '2014-12-11 11:08:44', 18, '2014-12-11 11:08:44', 18),
(4, 11, 'ว่ายน้ำข้ามทวีป', 1, 1, 1, 35, NULL, '2014-12-11 11:09:10', 35, '2014-12-11 11:09:10', 35),
(4, 11, 'ปีนหน้าผม ชันที่สุดในโลก', 2, 1, 1, 35, NULL, '2014-12-11 11:09:10', 35, '2014-12-11 11:09:10', 35),
(4, 11, 'กระโดดร่ม แบบไร้เสื้อชูชีพ', 3, 1, 1, 35, NULL, '2014-12-11 11:09:10', 35, '2014-12-11 11:09:10', 35),
(4, 11, 'เที่ยวป่าอเมซอน เน้นที่มีงูอนาคอนดา เยอะ ๆ', 4, 1, 1, 35, NULL, '2014-12-11 11:09:10', 35, '2014-12-11 11:09:10', 35),
(5, 15, 'เที่ยว', 3, 1, 1, 13, NULL, '2014-12-19 13:14:42', 13, '2014-12-19 13:14:42', 13),
(5, 15, 'กิน', 2, 1, 1, 13, NULL, '2014-12-19 13:14:42', 13, '2014-12-19 13:14:42', 13),
(5, 15, 'ฟังเพลง', 1, 1, 1, 13, NULL, '2014-12-19 13:14:42', 13, '2014-12-19 13:14:42', 13),
(5, 14, 'นอนจริง', 3, 1, 1, 13, NULL, '2014-12-19 13:14:42', 13, '2014-12-19 13:14:42', 13),
(5, 14, 'นอนเล่น', 1, 1, 1, 13, NULL, '2014-12-19 13:14:42', 13, '2014-12-19 13:14:42', 13),
(5, 14, 'กิน', 2, 1, 1, 13, NULL, '2014-12-19 13:14:42', 13, '2014-12-19 13:14:42', 13),
(6, 18, 'ฟังเพลง', 4, 1, 1, 13, NULL, '2014-12-19 13:14:20', 13, '2014-12-19 13:14:20', 13),
(6, 18, 'อ่านหนังสือ', 5, 1, 1, 13, NULL, '2014-12-19 13:14:20', 13, '2014-12-19 13:14:20', 13),
(6, 18, 'ดูหนัง', 3, 1, 1, 13, NULL, '2014-12-19 13:14:20', 13, '2014-12-19 13:14:20', 13),
(6, 18, 'เล่นอินเตอร์เน็ต', 2, 1, 1, 13, NULL, '2014-12-19 13:14:20', 13, '2014-12-19 13:14:20', 13),
(6, 18, 'ดูทีวี', 1, 1, 1, 13, NULL, '2014-12-19 13:14:20', 13, '2014-12-19 13:14:20', 13),
(6, 17, 'เดินตลาด', 3, 1, 1, 13, NULL, '2014-12-19 13:14:20', 13, '2014-12-19 13:14:20', 13),
(6, 17, 'กินข้าวนอกเมือง', 4, 1, 1, 13, NULL, '2014-12-19 13:14:20', 13, '2014-12-19 13:14:20', 13),
(6, 17, 'ไปเที่ยว', 2, 1, 1, 13, NULL, '2014-12-19 13:14:20', 13, '2014-12-19 13:14:20', 13),
(6, 17, 'นอนเล่น', 1, 1, 1, 13, NULL, '2014-12-19 13:14:20', 13, '2014-12-19 13:14:20', 13),
(7, 26, 'Sony', 4, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 26, 'Panasonic', 5, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 26, 'Fuji', 6, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 26, 'Other', 7, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 27, 'คุณภาพสูง', 1, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 27, 'ราคาถูก', 2, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 27, 'เลือกตามเพื่อน', 3, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 27, 'ถ่ายง่าย ถ่ายยังงัยก็สวย', 4, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 27, 'มีอุปกรณ์เสริมเยอะ', 5, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 29, 'ภาพวิว ทิวทัศน์', 1, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 29, 'ภาพคน ภาพเด็กๆ ภาพครอบครัว', 2, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 29, 'ภาพทั่วไป ตามข้างทาง (Street photo)', 3, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 29, 'ภาพสัตว์', 4, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 30, 'ต่ำกว่า 10,000 บาท', 1, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 30, '10,000 - 30,000 บาท', 2, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 30, 'มากกว่า 30,000 บาทเพื่อภาพสวยงบไม่อั้น', 3, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(13, 61, 'good', 1, 1, 1, 9, NULL, '2015-01-19 10:56:36', 9, '2015-01-19 10:56:36', 9),
(13, 61, 'best', 2, 1, 1, 9, NULL, '2015-01-19 10:56:36', 9, '2015-01-19 10:56:36', 9),
(9, 31, 'น้ำเพื่่อชุมชน (สนับสนุน บริการ น้ำขวด  น้ำถ้วย  รถน้ำ ให้แก่ชุมชน)', 5, 1, 1, 13, NULL, '2014-12-19 13:13:22', 13, '2014-12-19 13:13:22', 13),
(9, 31, 'สร้างเครือข่ายอีสท์วอเตอร์รักษ์น้ำ', 4, 1, 1, 13, NULL, '2014-12-19 13:13:22', 13, '2014-12-19 13:13:22', 13),
(9, 31, 'ระบบบำบัดน้ำเสียในโรงอาหารของโรงเรียน', 3, 1, 1, 13, NULL, '2014-12-19 13:13:22', 13, '2014-12-19 13:13:22', 13),
(9, 31, 'ประปาชุมชน', 1, 1, 1, 13, NULL, '2014-12-19 13:13:22', 13, '2014-12-19 13:13:22', 13),
(9, 31, 'นวัตกรรม 3Rต้นแบบ', 2, 1, 1, 13, NULL, '2014-12-19 13:13:22', 13, '2014-12-19 13:13:22', 13),
(10, 34, 'น้ำเพื่่อชุมชน (สนับสนุน บริการ น้ำขวด  น้ำถ้วย  รถน้ำ ให้แก่ชุมชน)', 5, 1, 1, 13, NULL, '2014-12-19 13:13:01', 13, '2014-12-19 13:13:01', 13),
(10, 34, 'สร้างเครือข่ายอีสท์วอเตอร์รักษ์น้ำ', 4, 1, 1, 13, NULL, '2014-12-19 13:13:01', 13, '2014-12-19 13:13:01', 13),
(10, 34, 'ระบบบำบัดน้ำเสียในโรงอาหารของโรงเรียน', 3, 1, 1, 13, NULL, '2014-12-19 13:13:01', 13, '2014-12-19 13:13:01', 13),
(10, 34, 'ประปาชุมชน', 1, 1, 1, 13, NULL, '2014-12-19 13:13:01', 13, '2014-12-19 13:13:01', 13),
(10, 34, 'นวัตกรรม 3Rต้นแบบ', 2, 1, 1, 13, NULL, '2014-12-19 13:13:01', 13, '2014-12-19 13:13:01', 13),
(7, 26, 'Olympus', 3, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 26, 'Canon', 1, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(7, 26, 'Nikon', 2, 1, 1, 13, NULL, '2014-12-19 13:20:41', 13, '2014-12-19 13:20:41', 13),
(12, 80, 'ภูเขา', 2, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(19, 96, 'cjjedk\'', 1, 1, 1, 17, NULL, '2015-02-25 15:23:21', 17, '2015-02-25 15:23:21', 17),
(12, 80, 'ทะเล', 1, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(12, 72, 'UU', 11, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(12, 72, 'เทคโนโลยีสารสนเทศ', 10, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(12, 72, 'อำนวยการ', 8, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(12, 72, 'การเงินและบัญชี', 9, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(12, 72, 'สื่อสารองค์กร', 6, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(12, 72, 'ทรัพยากรบุคคล', 7, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(12, 72, 'พัฒนาธุรกิจ', 4, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(12, 72, 'ปฏิบัติการและบริการลูกค้า', 5, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(14, 82, 'อาหาร', 2, 1, 1, 24, NULL, '2015-01-20 10:29:00', 24, '2015-01-20 10:29:00', 24),
(14, 82, 'น้ำ', 1, 1, 1, 24, NULL, '2015-01-20 10:29:00', 24, '2015-01-20 10:29:00', 24),
(19, 93, 'เงิน', 2, 1, 1, 17, NULL, '2015-02-25 15:23:21', 17, '2015-02-25 15:23:21', 17),
(12, 72, 'ตรวจสอบ', 2, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(19, 93, 'งาน', 1, 1, 1, 17, NULL, '2015-02-25 15:23:21', 17, '2015-02-25 15:23:21', 17),
(19, 96, 'fndnvvcl;', 2, 1, 1, 17, NULL, '2015-02-25 15:23:21', 17, '2015-02-25 15:23:21', 17),
(18, 98, '3...', 3, 1, 1, 17, NULL, '2015-03-24 15:48:17', 17, '2015-03-24 15:48:17', 17),
(18, 98, '2...', 2, 1, 1, 17, NULL, '2015-03-24 15:48:17', 17, '2015-03-24 15:48:17', 17),
(18, 98, '1...', 1, 1, 1, 17, NULL, '2015-03-24 15:48:17', 17, '2015-03-24 15:48:17', 17),
(12, 72, 'วางแผนโครงการ', 3, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(12, 72, 'สังกัด CEO Office + รกญป. + รกญง. + สกญ.', 1, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(12, 60, 'UU พื้นที่ปฏิบัติการ', 4, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(12, 60, 'UU กทม.', 3, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(12, 60, 'EW พื้นที่ปฏิบัติการ', 2, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(12, 60, 'EW กทม.', 1, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1),
(12, 80, 'น้ำตก', 3, 1, 1, 1, NULL, '2017-03-21 15:36:10', 1, '2017-03-21 15:36:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `questionaire_user_activity`
--

CREATE TABLE `questionaire_user_activity` (
  `questionaire_aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `has_submitted` tinyint(1) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questionaire_user_activity`
--

INSERT INTO `questionaire_user_activity` (`questionaire_aid`, `user_aid`, `has_submitted`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(30, 15, NULL, '2017-03-22 16:56:27', 1, '2017-03-22 16:56:27', 1),
(30, 8, NULL, '2017-03-22 16:56:27', 1, '2017-03-22 16:56:27', 1),
(30, 17, NULL, '2017-03-22 16:56:27', 1, '2017-03-22 16:56:27', 1),
(30, 14, NULL, '2017-03-22 16:56:27', 1, '2017-03-22 16:56:27', 1),
(30, 5, NULL, '2017-03-22 16:56:27', 1, '2017-03-22 16:56:27', 1),
(30, 3, NULL, '2017-03-22 16:56:27', 1, '2017-03-22 16:56:27', 1),
(30, 10, NULL, '2017-03-22 16:56:27', 1, '2017-03-22 16:56:27', 1),
(30, 13, NULL, '2017-03-22 16:56:27', 1, '2017-03-22 16:56:27', 1),
(30, 18, NULL, '2017-03-22 17:14:43', 1, '2017-03-22 17:14:43', 1);

-- --------------------------------------------------------

--
-- Table structure for table `questionaire_user_submit`
--

CREATE TABLE `questionaire_user_submit` (
  `questionaire_aid` int(10) UNSIGNED NOT NULL,
  `question_aid` int(10) UNSIGNED NOT NULL,
  `answer` text NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questionaire_user_submit`
--

INSERT INTO `questionaire_user_submit` (`questionaire_aid`, `question_aid`, `answer`, `user_aid`, `created_date`, `created_by`) VALUES
(30, 111, '2', 1, '2017-03-22 15:19:19', 1),
(30, 112, '4', 1, '2017-03-22 15:19:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reserve`
--

CREATE TABLE `reserve` (
  `aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `copy_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL,
  `product_type_cid` varchar(12) NOT NULL,
  `parent_aid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Remove, 1=Reserve, 2=Received',
  `confirm_code` varchar(32) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reserve_product`
--

CREATE TABLE `reserve_product` (
  `aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `copy_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL,
  `product_type_cid` varchar(12) NOT NULL,
  `parent_aid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Remove, 1=Reserve, 2=Received',
  `confirm_code` varchar(32) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `user_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(4) UNSIGNED NOT NULL,
  `parent_aid` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `point` int(10) UNSIGNED DEFAULT NULL,
  `description` longtext,
  `channel` varchar(16) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`user_aid`, `product_type_aid`, `parent_aid`, `status`, `point`, `description`, `channel`, `ip`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 1, 3, 1, 4, 'p', 'web', '::1', '2017-03-31 17:24:22', 1, '2017-03-31 17:24:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `review_history`
--

CREATE TABLE `review_history` (
  `aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(4) UNSIGNED NOT NULL,
  `parent_aid` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `point` int(10) UNSIGNED DEFAULT NULL,
  `description` longtext,
  `channel` varchar(16) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `review_history`
--

INSERT INTO `review_history` (`aid`, `user_aid`, `product_type_aid`, `parent_aid`, `status`, `point`, `description`, `channel`, `ip`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 1, 1, 3, 1, 4, 'p', 'web', '::1', '2017-03-31 17:24:22', 1, '2017-03-31 17:24:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `search_history`
--

CREATE TABLE `search_history` (
  `aid` int(10) UNSIGNED NOT NULL,
  `word` varchar(255) NOT NULL,
  `cond` char(3) NOT NULL,
  `search_in` varchar(24) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `search_history`
--

INSERT INTO `search_history` (`aid`, `word`, `cond`, `search_in`, `ip`, `created_date`, `created_by`) VALUES
(1, 'g', '', 'all', '::1', '2017-03-30 13:59:30', 1),
(2, 'g', '', 'all', '::1', '2017-03-30 15:08:42', 1),
(3, 'Test', '', 'author', '::1', '2017-04-03 10:48:30', 1),
(4, '2', '', 'author', '::1', '2017-04-03 10:48:30', 1),
(5, 'Test', '', 'author', '::1', '2017-04-03 10:49:18', 1),
(6, '2', '', 'author', '::1', '2017-04-03 10:49:18', 1),
(7, 'Test', '', 'author', '::1', '2017-04-03 10:49:19', 1),
(8, '2', '', 'author', '::1', '2017-04-03 10:49:19', 1),
(9, 't', '', 'news', '::1', '2017-04-04 17:23:00', 1),
(10, 't', '', 'news', '::1', '2017-04-04 17:24:49', 1),
(11, 't', '', 'news', '::1', '2017-04-04 17:25:09', 1),
(12, 'อภินิหาร', '', 'all', '::1', '2017-04-04 17:25:46', 1),
(13, 'อภินิหาร', '', 'all', '::1', '2017-04-04 17:57:29', 1),
(14, 'อภินิหาร', '', 'all', '::1', '2017-04-04 17:58:11', 1),
(15, 'อภินิหาร', '', 'all', '::1', '2017-04-04 17:59:58', 1),
(16, 'f', '', 'all', '::1', '2017-04-11 14:57:11', 0),
(17, 'f', '', 'all', '::1', '2017-04-11 14:57:12', 0),
(18, 'f', '', 'all', '::1', '2017-04-11 14:57:13', 0),
(19, 'f', '', 'all', '::1', '2017-04-11 14:57:14', 0),
(20, 'f', '', 'all', '::1', '2017-04-11 14:57:15', 0),
(21, 'f', '', 'all', '::1', '2017-04-11 14:57:15', 0),
(22, 'f', '', 'all', '::1', '2017-04-11 14:57:16', 0),
(23, 'ss', '', 'all', '::1', '2017-04-11 18:14:16', 1),
(24, 's', '', 'all', '::1', '2017-04-11 18:23:12', 1),
(25, 's', '', 'all', '::1', '2017-04-11 18:23:14', 1),
(26, 's', '', 'all', '::1', '2017-04-11 18:23:16', 1),
(27, 'ss', '', 'all', '::1', '2017-04-11 18:23:25', 1),
(28, 'ss', '', 'all', '::1', '2017-04-11 18:23:47', 1),
(29, 'f', '', 'all', '::1', '2017-04-11 18:23:55', 1),
(30, 'sss', '', 'all', '::1', '2017-04-11 18:24:00', 1),
(31, 'ss', '', 'all', '::1', '2017-04-11 18:24:05', 1),
(32, 'ss', '', 'all', '::1', '2017-04-11 18:25:51', 0),
(33, 'อภินิหาร', '', 'all', '::1', '2017-04-12 12:53:20', 0),
(34, 'ss', '', 'all', '::1', '2017-04-12 16:22:37', 0);

-- --------------------------------------------------------

--
-- Table structure for table `search_history_backup`
--

CREATE TABLE `search_history_backup` (
  `aid` int(10) UNSIGNED NOT NULL,
  `word` varchar(255) NOT NULL,
  `cond` char(3) NOT NULL,
  `search_in` varchar(24) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `search_order`
--

CREATE TABLE `search_order` (
  `tag` varchar(255) NOT NULL,
  `weight` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setting_config`
--

CREATE TABLE `setting_config` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(16) DEFAULT NULL,
  `group` varchar(12) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  `opt_1` text,
  `opt_2` text,
  `opt_3` text,
  `opt_4` text,
  `opt_5` text,
  `weight` float DEFAULT '0',
  `description` text,
  `remark` text,
  `status` tinyint(2) DEFAULT NULL,
  `updated_date` datetime NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting_config`
--

INSERT INTO `setting_config` (`aid`, `cid`, `group`, `name`, `value`, `opt_1`, `opt_2`, `opt_3`, `opt_4`, `opt_5`, `weight`, `description`, `remark`, `status`, `updated_date`, `updated_by`) VALUES
(1, 'rn-user-1', 'RNU', 'Running Number for user Type 1', '20', 'user', NULL, NULL, '6', NULL, 0, 'Running Number for Table \'User\'', NULL, 1, '2013-10-23 00:00:00', 1),
(2, 'rn-user-2', 'RNU', 'Running Number for user Type 2', '1', 'user', 'U2', NULL, NULL, NULL, 0, 'Running Number for Table \'User\'', NULL, 1, '2013-10-23 00:00:00', 1),
(3, 'rn-user-3', 'RNU', 'Running Number for user Type 3', '1', 'user', 'U3', NULL, NULL, NULL, 0, 'Running Number for Table \'User\'', NULL, 1, '2013-10-23 00:00:00', 1),
(4, 'rn-user-4', 'RNU', 'Running Number for user Type 4', '1', 'user', 'U4', NULL, NULL, NULL, 0, 'Running Number for Table \'User\'', NULL, 1, '2013-10-23 00:00:00', 1),
(5, 'rn-user-5', 'RNU', 'Running Number for user Type 5', '1', 'user', 'U5', NULL, NULL, NULL, 0, 'Running Number for Table \'User\'', NULL, 1, '2013-10-23 00:00:00', 1),
(6, 'rn-user-6', 'RNU', 'Running Number for user Type 6', '1', 'user', 'U6', NULL, NULL, NULL, 0, 'Running Number for Table \'User\'', NULL, 1, '2013-10-23 00:00:00', 1),
(7, 'rn-book-1', 'RNP', 'Running Number for book Type 1', '3', 'book', 'PB', NULL, '6', NULL, 0, 'Running Number for book Type 1', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(8, 'rn-book-2', 'RNP', 'Running Number for book Type 2', '2', 'book', 'DB', NULL, '6', NULL, 0, 'Running Number for book Type 2', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(9, 'rn-book-3', 'RNP', 'Running Number for book Type 3', '1', 'book', 'B3', NULL, '6', NULL, 0, 'Running Number for book Type 3', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(10, 'rn-book-4', 'RNP', 'Running Number for book Type 4', '1', 'book', 'B4', NULL, '6', NULL, 0, 'Running Number for book Type 4', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(11, 'rn-book-5', 'RNP', 'Running Number for book Type 5', '1', 'book', 'B5', NULL, '6', NULL, 0, 'Running Number for book Type 5', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(12, 'rn-book-6', 'RNP', 'Running Number for book Type 6', '1', 'book', 'B6', NULL, '6', NULL, 0, 'Running Number for book Type 6', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(13, 'rn-book-7', 'RNP', 'Running Number for book Type 7', '1', 'book', 'B7', NULL, '6', NULL, 0, 'Running Number for book Type 7', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(14, 'rn-magazine-1', 'RNP', 'Running Number for magazine Type 1', '1', 'magazine', 'PM', NULL, '6', NULL, 0, 'Running Number for magazine Type 1', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(15, 'rn-magazine-2', 'RNP', 'Running Number for magazine Type 2', '1', 'magazine', 'DM', NULL, '6', NULL, 0, 'Running Number for magazine Type 2', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(16, 'rn-magazine-3', 'RNP', 'Running Number for magazine Type 3', '1', 'magazine', 'M3', NULL, '6', NULL, 0, 'Running Number for magazine Type 3', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(17, 'rn-magazine-4', 'RNP', 'Running Number for magazine Type 4', '1', 'magazine', 'M4', NULL, '6', NULL, 0, 'Running Number for magazine Type 4', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(18, 'rn-magazine-5', 'RNP', 'Running Number for magazine Type 5', '1', 'magazine', 'M5', NULL, '6', NULL, 0, 'Running Number for magazine Type 5', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(19, 'rn-magazine-6', 'RNP', 'Running Number for magazine Type 6', '1', 'magazine', 'M6', NULL, '6', NULL, 0, 'Running Number for magazine Type 6', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(20, 'rn-magazine-7', 'RNP', 'Running Number for magazine Type 7', '1', 'magazine', 'M7', NULL, '6', NULL, 0, 'Running Number for magazine Type 7', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(21, 'rn-vdo-1', 'RNP', 'Running Number for vdo Type 1', '1', 'vdo', 'V', NULL, '6', NULL, 0, 'Running Number for vdo Type 1', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(22, 'rn-vdo-2', 'RNP', 'Running Number for vdo Type 2', '1', 'vdo', 'V2', NULL, '6', NULL, 0, 'Running Number for vdo Type 2', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(23, 'rn-vdo-3', 'RNP', 'Running Number for vdo Type 3', '1', 'vdo', 'V3', NULL, '6', NULL, 0, 'Running Number for vdo Type 3', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(24, 'rn-vdo-4', 'RNP', 'Running Number for vdo Type 4', '1', 'vdo', 'V4', NULL, '6', NULL, 0, 'Running Number for vdo Type 4', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(25, 'rn-vdo-5', 'RNP', 'Running Number for vdo Type 5', '1', 'vdo', 'V5', NULL, '6', NULL, 0, 'Running Number for vdo Type 5', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(26, 'rn-vdo-6', 'RNP', 'Running Number for vdo Type 6', '1', 'vdo', 'V6', NULL, '6', NULL, 0, 'Running Number for vdo Type 6', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(27, 'rn-vdo-7', 'RNP', 'Running Number for vdo Type 7', '1', 'vdo', 'V7', NULL, '6', NULL, 0, 'Running Number for vdo Type 7', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(28, 'rn-else-1', 'RNP', 'Running Number for else Type 1', '1', 'else', 'E', NULL, '6', NULL, 0, 'Running Number for else Type 1', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(29, 'rn-else-2', 'RNP', 'Running Number for else Type 2', '1', 'else', 'E02', NULL, '6', NULL, 0, 'Running Number for else Type 2', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(30, 'rn-else-3', 'RNP', 'Running Number for else Type 3', '1', 'else', 'E03', NULL, '6', NULL, 0, 'Running Number for else Type 3', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(31, 'rn-else-4', 'RNP', 'Running Number for else Type 4', '1', 'else', 'E04', NULL, '6', NULL, 0, 'Running Number for else Type 4', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(32, 'rn-else-5', 'RNP', 'Running Number for else Type 5', '1', 'else', 'E05', NULL, '6', NULL, 0, 'Running Number for else Type 5', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(33, 'rn-else-6', 'RNP', 'Running Number for else Type 6', '1', 'else', 'E06', NULL, '6', NULL, 0, 'Running Number for else Type 6', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(34, 'rn-else-7', 'RNP', 'Running Number for else Type 7', '1', 'else', 'E07', NULL, '6', NULL, 0, 'Running Number for else Type 7', 'opt_1 : type | opt_2 : prefix | opt_3 : postfix | opt_4 : length | opt_5 : ((empty))', 1, '2013-10-23 00:00:00', 1),
(35, 'rn-publisher', 'RNPUB', 'Running Number for publisher', '64', 'publisher', NULL, NULL, '6', NULL, 0, 'Running Number for Table \'Publisher\'', NULL, 1, '2014-06-21 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `setting_running`
--

CREATE TABLE `setting_running` (
  `year` int(10) UNSIGNED NOT NULL,
  `invoice` int(10) UNSIGNED NOT NULL,
  `receipt` int(10) UNSIGNED NOT NULL,
  `user` int(10) UNSIGNED NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting_running`
--

INSERT INTO `setting_running` (`year`, `invoice`, `receipt`, `user`, `updated_date`, `updated_by`) VALUES
(2014, 1, 1, 0, '2014-06-09 08:19:48', 2);

-- --------------------------------------------------------

--
-- Table structure for table `shelf`
--

CREATE TABLE `shelf` (
  `user_aid` int(10) UNSIGNED NOT NULL,
  `copy_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL,
  `product_type_cid` varchar(12) NOT NULL,
  `parent_aid` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `is_license` tinyint(1) UNSIGNED DEFAULT NULL,
  `is_read` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `expiration_date` date DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `issue_aid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shelf_history`
--

CREATE TABLE `shelf_history` (
  `aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `copy_aid` int(10) UNSIGNED NOT NULL,
  `parent_aid` int(11) NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL,
  `product_type_cid` varchar(12) NOT NULL,
  `is_license` tinyint(1) UNSIGNED DEFAULT NULL,
  `action` char(3) NOT NULL COMMENT 'i:insert , d:delete , ad:auto delete',
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shelf_vdo`
--

CREATE TABLE `shelf_vdo` (
  `user_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL,
  `product_type_cid` varchar(12) NOT NULL,
  `parent_aid` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `expiration_date` date DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shelf_vdo_history`
--

CREATE TABLE `shelf_vdo_history` (
  `aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `parent_aid` int(11) NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL,
  `product_type_cid` varchar(12) NOT NULL,
  `action` char(3) NOT NULL COMMENT 'i:insert , d:delete , ad:auto delete',
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `aid` int(10) UNSIGNED NOT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `product_main_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `copy_aid` int(10) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `borrowing_period` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `borrowing_date` datetime NOT NULL,
  `due_date` date DEFAULT NULL,
  `returning_date` datetime DEFAULT NULL,
  `return_status` tinyint(1) UNSIGNED DEFAULT NULL,
  `total_renew` tinyint(4) NOT NULL DEFAULT '0',
  `last_renewal_date` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `pre_paid` smallint(5) UNSIGNED NOT NULL,
  `post_paid` smallint(5) UNSIGNED DEFAULT NULL,
  `damage_lost_paid` smallint(5) UNSIGNED DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`aid`, `user_owner_aid`, `user_aid`, `product_main_aid`, `product_type_aid`, `parent_aid`, `copy_aid`, `status`, `borrowing_period`, `title`, `barcode`, `borrowing_date`, `due_date`, `returning_date`, `return_status`, `total_renew`, `last_renewal_date`, `remark`, `pre_paid`, `post_paid`, `damage_lost_paid`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 1, 18, 0, 1, 1, 1, 1, 0, 'อภินิหาร อภินิหาร', '1234567890', '2017-04-05 09:42:27', '2017-04-19', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '', 0, 0, 0, '2017-04-05 09:42:27', 1, '2017-04-05 09:42:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_income`
--

CREATE TABLE `transaction_income` (
  `aid` int(10) UNSIGNED NOT NULL,
  `member_aid` int(10) UNSIGNED NOT NULL,
  `borrowing_fee` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `returning_fee` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lost_fee` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `damaged_fee` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_fee` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_receive` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_change` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(13) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `title_th` varchar(255) DEFAULT NULL,
  `first_name_th` varchar(255) DEFAULT NULL,
  `last_name_th` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `first_name_en` varchar(255) DEFAULT NULL,
  `last_name_en` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  `avatar_type` varchar(6) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `address` text,
  `country_aid` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `interest` varchar(255) DEFAULT NULL,
  `device` text,
  `user_role_aid` tinyint(3) UNSIGNED NOT NULL,
  `user_section_aid` int(10) UNSIGNED DEFAULT NULL,
  `publisher_aid` int(10) UNSIGNED DEFAULT NULL,
  `department_aid` int(10) UNSIGNED DEFAULT NULL,
  `position` text,
  `occupation` text,
  `note_1` text,
  `note_2` text,
  `note_3` text,
  `note_4` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `point_remain` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `registration_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_login` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `login_hash` varchar(50) DEFAULT NULL,
  `ip` varchar(15) NOT NULL,
  `activate_code` varchar(64) DEFAULT NULL,
  `confirm_code` varchar(64) DEFAULT NULL,
  `is_blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `remark` text,
  `channel` varchar(16) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`aid`, `cid`, `username`, `password`, `title_th`, `first_name_th`, `last_name_th`, `title_en`, `first_name_en`, `last_name_en`, `nick_name`, `display_name`, `avatar_path`, `avatar_type`, `birthday`, `gender`, `address`, `country_aid`, `email`, `contact_number`, `user_owner_aid`, `interest`, `device`, `user_role_aid`, `user_section_aid`, `publisher_aid`, `department_aid`, `position`, `occupation`, `note_1`, `note_2`, `note_3`, `note_4`, `status`, `point_remain`, `registration_date`, `expiration_date`, `last_login`, `is_login`, `login_hash`, `ip`, `activate_code`, `confirm_code`, `is_blacklist`, `remark`, `channel`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, '000001', 'admin', '1dcff3236722edaf013bc4422f410059', NULL, 'Administrator', '(Superadmin)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f', NULL, NULL, 'oui@momothinks.com', NULL, 1, NULL, NULL, 1, 1, 0, 25, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2010-07-12', NULL, '2017-04-25 11:38:39', 0, '', '::1', NULL, NULL, 0, NULL, NULL, '2010-07-12 00:00:00', 1, '2017-04-25 11:42:29', 1),
(2, '000002', '', NULL, NULL, 'Tisa', '(Administrator)', NULL, NULL, NULL, NULL, '0', './uploads/pttep/avatar/1', '.jpg', NULL, 'f', '0', NULL, 'asitgets@gmail.com', '0', 1, NULL, NULL, 2, 1, 0, 0, '0', '0', '0', '0', '0', '0', 1, 1891, '2015-01-20', NULL, '2015-05-22 15:19:59', 1, '9469cda37fc8a6e5f037b0407c2d3498', '61.90.109.167', NULL, 'IPPh8K50', 0, '0', NULL, '2010-07-12 00:00:00', 1, '2015-03-23 13:54:30', 2),
(3, '000003', '', '1dcff3236722edaf013bc4422f410059', NULL, 'Tisa', '(Publisher)', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'f', '', NULL, 'a.s.i.tgets@gmail.com', '0', 1, NULL, NULL, 6, 1, 0, 1, '0', '0', '0', '0', '0', '0', 1, 0, '2014-05-29', NULL, NULL, 0, NULL, '127.0.0.1', NULL, NULL, 0, '0', NULL, '2010-07-12 00:00:00', 1, '2014-05-29 10:33:26', 2),
(4, '000004', '', 'faebeae18a3964930c4421d3e8825eb0', NULL, 'Bookdose', 'Admin', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'm', '', NULL, 'kittipojn@gmail.com', '0', 1, NULL, NULL, 2, 1, 0, 0, '0', '0', '0', '0', '0', '0', 0, 0, '2014-05-27', NULL, '2015-03-25 13:05:59', 1, '2d8b0b0f75c4cd9bfeeded1f8473a5a7', '::1', '', '', 0, '0', NULL, '2010-07-12 00:00:00', 1, '2017-03-24 16:24:03', 1),
(5, '000005', '', 'caed6ac73459855d5a299df355237c67', NULL, 'suriyasak', 'bookdose', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'm', '0', NULL, 'suriyasak@bookdose.com', '0999999999', 1, NULL, NULL, 4, 1, 0, 1, '0', '0', '', '', '0', '0', 1, 355, '2014-08-21', NULL, '2017-02-03 16:32:33', 1, '044ad8b1053670f83d41f2e097424932', '49.228.68.152', '', '', 0, '0', 'web', '2014-06-23 12:15:23', 0, '2016-12-15 16:43:34', 5),
(6, '000006', 'tarnza', 'fc1050378bc95fbd4732e16361c8ce9d', NULL, 'Tarn', 'Bookdose', NULL, NULL, NULL, NULL, '0', './uploads/rmutt/avatar/1', '.jpg', NULL, 'f', '0', NULL, 'yaowaluk@bookdose.com', '234144524', 1, NULL, NULL, 2, 1, 0, 29, '0', '0', '0', '0', '0', '0', 1, 18, '2016-08-24', NULL, '2017-02-10 14:58:51', 0, '', '127.0.0.1', '', NULL, 0, '0', 'web', '2016-06-24 10:27:59', 5, '2017-02-10 16:10:31', 6),
(7, '000007', '000007', 'fc1050378bc95fbd4732e16361c8ce9d', NULL, 'tarn', 'Bookdose', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'f', '0', NULL, 'yaowaluk_tarn@bookdose.com', '', 1, NULL, NULL, 1, 1, 0, 0, '0', '0', '', '', '0', '0', 1, 0, '2016-06-29', NULL, '2016-11-04 14:05:18', 1, '048ebf3f7f1f3e7413e2c199af1e8947', '127.0.0.1', '', 'suT63FCB', 0, '0', 'web', '2016-06-29 15:29:13', 6, '2016-08-19 14:58:52', 0),
(8, '000008', '', 'e299cb84a84b7a4ddb96ac1db0b055cf', NULL, 'na', 'Bookdose', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'f', '0', NULL, 'wantana@bookdose.com', '', 1, NULL, NULL, 3, 1, 0, 1, '0', '0', '', '', '0', '0', 1, 7, '2016-08-02', NULL, '2017-01-23 14:53:43', 1, 'c1464b81c7da962acfffb9b579efa96a', '171.97.203.98', '', NULL, 0, '0', 'web', '2016-07-21 09:30:24', 6, '2016-08-15 09:42:55', 8),
(9, '000009', '000009', 'e299cb84a84b7a4ddb96ac1db0b055cf', NULL, 'Phoom Bookdose', '', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'm', '0', NULL, 'phoom@bookdose.com', '', 1, NULL, NULL, 2, 1, 0, 0, '0', '0', '', '', '0', '0', 1, 4, '2016-07-21', NULL, '2016-08-08 16:30:58', 0, '', '171.97.146.11', '', NULL, 0, '0', 'web', '2016-07-21 14:54:45', 6, '2016-08-08 16:42:34', 9),
(10, '000010', '', '767c0a91fd8086cf328430427af4bafd', NULL, 'Wutthiphat', 'L.', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'm', '0', NULL, 'wutthiphat@bookdose.com', '', 1, NULL, NULL, 3, 1, 0, 1, '0', '0', '', '', '0', '0', 1, 4, '2016-08-02', NULL, NULL, 0, NULL, '171.96.98.212', '', NULL, 0, '0', 'web', '2016-08-02 11:16:35', 8, '2016-08-02 11:17:10', 8),
(11, '000011', '000011', 'faebeae18a3964930c4421d3e8825eb0', NULL, 'kiatkajohn', '', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'f', '0', NULL, 'kiatkajohn@bookdose.com', '', 1, NULL, NULL, 2, 1, 0, 0, '0', '0', '', '', '0', '0', 1, 0, '2016-08-03', NULL, NULL, 0, NULL, '171.96.170.180', '', NULL, 0, '0', 'web', '2016-08-03 13:38:19', 6, '2016-08-03 13:38:19', 6),
(16, '000016', '000016', 'caed6ac73459855d5a299df355237c67', NULL, 'kittipojn', 'Bookdose', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'm', '', NULL, 'kittipojn@bookdose.com', '', 1, NULL, NULL, 2, 1, 0, 0, '', '0', '', '', '0', '', 1, 0, '2017-01-23', NULL, NULL, 0, NULL, '171.97.96.40', '', NULL, 0, '0', 'web', '2017-01-23 15:13:46', 6, '2017-01-23 15:13:46', 6),
(12, '000012', '000012', '0769aceb716b8175d7db8b1112c0f5fe', NULL, 'ying', '', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'f', '0', NULL, 'sunaree@bookdose.com', '', 1, NULL, NULL, 2, 1, 0, 0, '0', '0', '', '', '0', '0', 1, 0, '2016-08-19', NULL, '2016-12-15 16:43:52', 1, '6e6cdc22cb7919760ac860e29bbd0874', '171.96.171.254', '', NULL, 0, '0', 'web', '2016-08-19 10:05:42', 6, '2016-08-19 10:05:42', 6),
(13, '000013', '', 'caed6ac73459855d5a299df355237c67', NULL, 'wuttichai', 'saithong', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f', '123/168', NULL, 'wuttichai@bookdose.com', '0851409990', 1, NULL, NULL, 5, 1, NULL, 1, 'android', NULL, 'developer', 'bookdose', '0', '', 1, 0, '2017-01-23', NULL, '2017-01-23 14:44:53', 1, 'f8dae679e25a27c7b3fd0338fb202077', '110.171.72.71', '', NULL, 0, NULL, 'web', '2017-01-23 14:44:12', 0, '2017-01-23 14:44:12', 0),
(14, '000014', '', '666ce01bf09b60daee211ef0b97da830', NULL, 'nattapong', 'wanitchaikit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'm', 'xxxxxxxx', NULL, 'nattapong@bookdose.com', '00000000', 1, NULL, NULL, 5, 1, NULL, 1, 'xxxxxxx', NULL, 'xxxxxxx', 'xxxxxxxx', '0', '', 1, 0, '2017-01-23', NULL, '2017-01-23 14:45:53', 1, 'd5dd7d9c169a10ca1beb7bb7c8c18bdd', '171.97.96.40', '', NULL, 0, NULL, 'web', '2017-01-23 14:45:00', 0, '2017-01-23 14:45:00', 0),
(15, '000015', '', '769ef5cd68d791800dd7c9a2a5896538', NULL, 'Eva', '~', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f', '-', NULL, 'pimchanok@bookdose.com', '029600010', 1, NULL, NULL, 5, 1, NULL, 1, '-', NULL, '-', '-', '0', '', 1, 0, '2017-01-23', NULL, NULL, 0, NULL, '110.171.72.71', 'N646a747', NULL, 0, NULL, 'web', '2017-01-23 14:47:19', 0, '2017-01-23 14:47:19', 0),
(17, '000017', '', 'faebeae18a3964930c4421d3e8825eb0', NULL, 'nakharin', 'utarawiset', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'm', '495 ชั้น6', NULL, 'nakharin@bookdose.com', '0859669648', 1, NULL, NULL, 5, 1, NULL, 1, 'sale executive', NULL, 'sale', 'bookdose', '0', '029600010', 1, 0, '2017-01-23', NULL, '2017-01-23 17:50:14', 1, '3d341293d1d4b79d498a00c551c4d09b', '171.97.96.40', '', NULL, 0, NULL, 'web', '2017-01-23 17:49:21', 0, '2017-01-23 17:49:21', 0),
(19, '000019', '', '001ff47443bf7cc734aeafc630b3e79f', NULL, 'Kasinee', 'Sahakijchachawan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f', '', NULL, 'kasinee.nut@gmail.com', '', 1, NULL, NULL, 5, 1, NULL, 0, '', NULL, '', '', '0', '', 1, 0, '2017-04-27', NULL, '2017-04-27 17:30:27', 1, '3c61efed61268782d978b485de697f32', '::1', '', NULL, 0, NULL, 'web', '2017-04-27 17:28:47', 0, '2017-04-27 17:28:47', 0),
(18, '000018', 'Anon', 'faebeae18a3964930c4421d3e8825eb0', NULL, 'Anon', 'Dechpala', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 'm', 'Bookdose', NULL, 'anon@bookdose.com', '0812077444', 1, NULL, NULL, 3, 1, 0, 1, 'SWP', '0', 'bookdose', 'Bookdose', '0', '', 1, 0, '2017-04-20', NULL, '2017-04-27 17:51:01', 1, '930c87bd34424afab0c9fc58b03bfce8', '::1', '', '', 0, '0', 'web', '2017-03-22 17:12:19', 0, '2017-04-27 15:48:38', 18);

-- --------------------------------------------------------

--
-- Table structure for table `user_department`
--

CREATE TABLE `user_department` (
  `aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `section` varchar(255) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_department`
--

INSERT INTO `user_department` (`aid`, `name`, `section`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 'Bookdose', NULL, 1, '2014-12-16 23:39:49', 8, NULL, NULL),
(2, 'UU - กรรมการผู้จัดการ', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(3, 'UU - ฝ่ายสำนักกรรมการผู้จัดการ (MD\'s Office )', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(4, 'UU - ฝ่ายพัฒนาองค์กร (Organization Development)', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(5, 'UU - ฝ่ายอำนวยการ (General Affairs)', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(6, 'UU - ฝ่ายแผนและพัฒนาธุรกิจ (Planning and Business Development)', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(7, 'UU - ฝ่ายบัญชีและการเงิน (Finance and Accounting)', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(8, 'UU - ฝ่ายวิศวกรรม (Engineering)', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(9, 'UU - รองกรรมการผู้จัดการสายปฏิบัติการ', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(10, 'UU - ฝ่ายบริการ 1 (Operations 1)', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(11, 'UU - ฝ่ายบริการ 2 ( Operations 2 )', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(12, 'EW - กรรมการผู้อำนวยการใหญ่ ( CEO Office )\r\n', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(13, 'EW - สำนักกรรมการผู้อำนวยการใหญ่ และเลขานุการบริษัท ( Dept. of CEO Office ) ', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(14, 'EW - รองกรรมการผู้อำนวยการใหญ่ สายปฏิบัติการ ( EVP - Operation )', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(15, 'EW - ฝ่ายปฏิบัติการและบริการลูกค้า   ( Operation and Customer Service Department ) ', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(16, 'EW - ฝ่ายวางแผนโครงการ   ( Project Planning Department ) ', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(17, 'EW - รองกรรมการผู้อำนวยการใหญ่ สายการเงินและบัญชี ( EVP - Finance and Accounting ) ', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(18, 'EW - ฝ่ายพัฒนาธุรกิจ   ( Business Development Department ) ', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(19, 'EW - ฝ่ายการเงินและบัญชี   ( Finance and Accounting Department ) ', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(20, 'EW - ฝ่ายเทคโนโลยีสารสนเทศ   ( Information Technology Department ) ', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(21, 'EW - ฝ่ายทรัพยากรบุคคล   ( Human Resources department )', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(22, 'EW - ฝ่ายอำนวยการ   ( General Affairs Department )', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(23, 'EW - ฝ่ายสื่อสารองค์กร   ( Corporate Communication Department) ', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(24, 'EW - ฝ่ายตรวจสอบ   ( Internal Audit Department )', NULL, 0, '2014-12-16 23:39:49', 8, NULL, NULL),
(25, 'Admin', NULL, 1, '2017-03-22 17:03:02', 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_department_`
--

CREATE TABLE `user_department_` (
  `aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_domain`
--

CREATE TABLE `user_domain` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `weight` float NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_domain`
--

INSERT INTO `user_domain` (`aid`, `cid`, `user_owner_aid`, `name`, `status`, `weight`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, NULL, 1, 'momothinks.com', 0, 2, '2014-06-21 13:13:13', 2, '2014-09-09 13:35:36', 135),
(2, NULL, 1, 'bookdose.com', 1, 3, '2014-06-21 13:13:31', 2, '2014-12-16 12:31:47', 18),
(3, NULL, 1, 'eastwater.com', 1, 0, '2014-06-21 14:39:29', 2, '2014-12-16 12:29:35', 18),
(4, NULL, 1, 'eastwater.adinfra', 1, 2, '2014-12-09 14:43:54', 16, '2014-12-16 12:29:43', 18),
(5, NULL, 1, 'uu.co.th', 1, 1, '2014-12-11 10:27:41', 18, '2014-12-16 12:29:49', 18);

-- --------------------------------------------------------

--
-- Table structure for table `user_domain_`
--

CREATE TABLE `user_domain_` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `weight` float NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_domain_`
--

INSERT INTO `user_domain_` (`aid`, `cid`, `user_owner_aid`, `name`, `status`, `weight`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, NULL, 1, 'bookdose.com', 0, 2, '2014-06-21 13:13:13', 2, '2014-09-09 13:35:36', 135),
(2, NULL, 1, 'gmail.com', 0, 1, '2014-06-21 13:13:31', 2, '2014-10-03 14:39:50', 22);

-- --------------------------------------------------------

--
-- Table structure for table `user_login_history`
--

CREATE TABLE `user_login_history` (
  `aid` int(10) UNSIGNED NOT NULL,
  `user_aid` int(10) UNSIGNED NOT NULL,
  `device` varchar(255) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL COMMENT 'login , logout',
  `token` varchar(100) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '0:log out , 1:still login',
  `browser` varchar(128) DEFAULT NULL,
  `browser_detail` varchar(255) DEFAULT NULL,
  `description` text,
  `flag` varchar(50) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED DEFAULT NULL,
  `user_owner_detail` text,
  `ip` varchar(15) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_login_history`
--

INSERT INTO `user_login_history` (`aid`, `user_aid`, `device`, `device_id`, `action`, `token`, `status`, `browser`, `browser_detail`, `description`, `flag`, `user_owner_aid`, `user_owner_detail`, `ip`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 11, 'web', '', 'login', '08acb52b57dec4ceb2ac08176ff24257', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '', 'login-form', 1, NULL, '127.0.0.1', '2017-02-10 13:29:38', 0, '2017-02-10 13:29:38', 0),
(2, 6, 'web', '', 'login', '4c6279d407b6edacdb4484f898a2ca2d', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '', 'login-form', 1, NULL, '127.0.0.1', '2017-02-10 13:32:30', 0, '2017-02-10 13:32:30', 0),
(3, 6, 'web', '', 'login', 'b0762d4ada154a6da420cbadae702a61', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '', 'login-form', 1, NULL, '127.0.0.1', '2017-02-10 14:53:25', 0, '2017-02-10 14:53:25', 0),
(4, 6, 'web', '', 'login', '2d2e15a6dab77096afee1ec24a44d498', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '', 'login-form', 1, NULL, '127.0.0.1', '2017-02-10 14:58:51', 0, '2017-02-10 14:58:51', 0),
(5, 1, 'web', '', 'login', '63c6cfd0503e6b039222acde280dc537', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-03-14 15:37:27', 0, '2017-03-14 15:37:27', 0),
(6, 1, 'web', '', 'login', 'd0836ffa51d5a82e57a4687e746226f5', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-03-20 09:49:49', 0, '2017-03-20 09:49:49', 0),
(7, 1, 'web', '', 'login', '2a7322214d91ccb77a08c0beaed15148', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-03-21 10:02:03', 0, '2017-03-21 10:02:03', 0),
(8, 1, 'web', '', 'login', '59ba79d3bdd7be9e9a31c38c15b55ee7', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-03-21 10:51:51', 0, '2017-03-21 10:51:51', 0),
(9, 1, 'web', '', 'login', '84dd595b2fc2a39d7fe8d30391acd865', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-03-22 14:00:59', 0, '2017-03-22 14:00:59', 0),
(10, 18, 'web', '', 'login', 'ea3d13bcecf743fa64129923206a413a', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-03-22 17:13:27', 0, '2017-03-22 17:13:27', 0),
(11, 18, 'web', '', 'login', '5d334ebeeeb00587119e4fa321d32afa', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-03-22 17:21:52', 0, '2017-03-22 17:21:52', 0),
(12, 1, 'web', '', 'login', '32ee04de49a23d508921590f69f9aa63', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-03-23 10:21:09', 0, '2017-03-23 10:21:09', 0),
(13, 1, 'web', '', 'login', 'a276afdf769edc9607a9dad8f9a51439', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-03-24 15:14:00', 0, '2017-03-24 15:14:00', 0),
(14, 1, 'web', '', 'login', '235f62ed21aaf4cb0cd23cf0418f8972', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-03-30 10:13:01', 0, '2017-03-30 10:13:01', 0),
(15, 1, 'web', '', 'login', 'a835f6e6a771a48295649a13c36741b1', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-03-30 13:32:21', 0, '2017-03-30 13:32:21', 0),
(16, 1, 'web', '', 'login', 'f913c80f1ee0e644fafcf06894099b84', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-03-30 14:58:14', 0, '2017-03-30 14:58:14', 0),
(17, 1, 'web', '', 'login', 'ee757022cc8c679c2d6ae59d8a943221', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-03-30 16:05:26', 0, '2017-03-30 16:05:26', 0),
(18, 1, 'web', '', 'login', '7b6e0e34e5aa776faaf4189b5da61fc5', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-03-30 16:06:32', 0, '2017-03-30 16:06:32', 0),
(19, 1, 'web', '', 'login', '4f79338a5a0bb19334a0c76370bef2a3', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-03-31 11:13:09', 0, '2017-03-31 11:13:09', 0),
(20, 1, 'web', '', 'login', 'd97ca50be01dae970ece9b43c89b5bb3', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-04-03 10:26:13', 0, '2017-04-03 10:26:13', 0),
(21, 1, 'web', '', 'login', '4236a25a256226af6f09c982b319c45a', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-04-03 13:17:38', 0, '2017-04-03 13:17:38', 0),
(22, 1, 'web', '', 'login', '35a18c9018ab4654d1d0ee0b0b405ac9', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-04-04 16:34:41', 0, '2017-04-04 16:34:41', 0),
(23, 1, 'web', '', 'login', 'b6cfc54300319a6d3b8e6ad8613e10ed', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-04-05 09:08:35', 0, '2017-04-05 09:08:35', 0),
(24, 1, 'web', '', 'login', '0a5772b59771e50e73467fefa0a40eb5', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-04-05 09:22:02', 0, '2017-04-05 09:22:02', 0),
(25, 18, 'web', '', 'login', '7b1b581c69ec5ddb09947a1e70357e93', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-04-05 09:43:14', 0, '2017-04-05 09:43:14', 0),
(26, 1, 'web', '', 'login', 'e8a762650989bfb32d5be98746b3f2cf', 1, 'Unknown Windows OS/Chrome 56.0.2924.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-05 14:28:23', 0, '2017-04-05 14:28:23', 0),
(27, 1, 'web', '', 'login', '0331f38ad774606d218f74a91147e5bc', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-04-06 16:45:44', 0, '2017-04-06 16:45:44', 0),
(28, 1, 'web', '', 'login', '0b4e3dec624f2d877b07bd906a898ced', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-04-07 11:30:20', 0, '2017-04-07 11:30:20', 0),
(29, 1, 'web', '', 'login', '753a4f80e4dc0ef654de9d3f466e41a5', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-04-10 17:05:29', 0, '2017-04-10 17:05:29', 0),
(30, 1, 'web', '', 'login', '0671a80c18ac8fb2735f7a49d176dbbb', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-04-11 10:00:08', 0, '2017-04-11 10:00:08', 0),
(31, 1, 'web', '', 'login', '7f920bb6fa5628ffcd174a3a56447b0c', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-04-12 16:23:45', 0, '2017-04-12 16:23:45', 0),
(32, 1, 'web', '', 'login', '6f01ce67da41a90624c69d75e0614d8c', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-04-18 10:54:33', 0, '2017-04-18 10:54:33', 0),
(33, 1, 'web', '', 'login', 'a0c685e43fec22377438bd9dcec417d5', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-04-18 12:13:41', 0, '2017-04-18 12:13:41', 0),
(34, 1, 'web', '', 'login', '765ec748f31caa45635ab137a13a16d2', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-04-18 16:17:47', 0, '2017-04-18 16:17:47', 0),
(35, 1, 'web', '', 'login', 'f83937913bf01382c0922bb4b28ec154', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-20 09:49:16', 0, '2017-04-20 09:49:16', 0),
(36, 18, 'web', '', 'login', '871820852f9231f2de43aabbcaeb1160', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-20 13:17:44', 0, '2017-04-20 13:17:44', 0),
(37, 18, 'web', '', 'login', '640689acd3b2dc4f684534c1275a40fd', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-20 13:20:05', 0, '2017-04-20 13:20:05', 0),
(38, 1, 'web', '', 'login', '71f3ad7d16cf4b13b1a3f1ff6e986fe5', 1, 'Unknown Windows OS/Firefox 52.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0', '', 'login-form', 1, NULL, '::1', '2017-04-24 09:53:49', 0, '2017-04-24 09:53:49', 0),
(39, 1, 'web', '', 'login', 'adde0fe7a4723936d0b199a2b53d2277', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-24 11:37:54', 0, '2017-04-24 11:37:54', 0),
(40, 1, 'web', '', 'login', '33a44a91da7e48a149fc4a358616bbfe', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-25 09:27:19', 0, '2017-04-25 09:27:19', 0),
(41, 1, 'web', '', 'login', '36befd10e641ce1adc781bb32a7b0f23', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-25 11:28:55', 0, '2017-04-25 11:28:55', 0),
(42, 18, 'web', '', 'login', '312457cb88337049f60c484441f916a5', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-25 11:30:42', 0, '2017-04-25 11:30:42', 0),
(43, 1, 'web', '', 'login', '4744e1914f271cdf46e6cfd6a4c67ff2', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-25 11:38:39', 0, '2017-04-25 11:38:39', 0),
(44, 18, 'web', '', 'login', '5161e40633e35fefb70aa863cc926b81', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-25 11:42:54', 0, '2017-04-25 11:42:54', 0),
(45, 18, 'web', '', 'login', 'd68565c14b7ebb441d4acd353791f96a', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-25 11:46:27', 0, '2017-04-25 11:46:27', 0),
(46, 18, 'web', '', 'login', '3a129e8180292dab973c0d06c2824a21', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-25 11:46:48', 0, '2017-04-25 11:46:48', 0),
(47, 18, 'web', '', 'login', '5ca70f2436d064396fa05198b447de30', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-25 14:05:17', 0, '2017-04-25 14:05:17', 0),
(48, 18, 'web', '', 'login', '155086da23c1a8e622dd7f6b1b39ebce', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-25 14:39:42', 0, '2017-04-25 14:39:42', 0),
(49, 18, 'web', '', 'login', '84563ae35a6daa0bf9650c35e1a0ac8e', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-26 17:52:02', 0, '2017-04-26 17:52:02', 0),
(50, 18, 'web', '', 'login', '60f20661812327750a84bc78b9426b61', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-27 11:23:48', 0, '2017-04-27 11:23:48', 0),
(51, 18, 'web', '', 'login', 'aab5e22f3c9677f09553564a177196ed', 1, 'Unknown Windows OS/Firefox 53.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', '', 'login-form', 1, NULL, '::1', '2017-04-27 11:55:40', 0, '2017-04-27 11:55:40', 0),
(52, 18, 'web', '', 'login', '07d6ea1eb9423c4e8af6d324f4a8c84a', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-27 13:20:52', 0, '2017-04-27 13:20:52', 0),
(53, 19, 'web', '', 'login', 'a8ca48cc9ebcf365d84011dffcd9f40a', 1, 'Unknown Windows OS/Chrome 57.0.2987.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', '', 'login-form', 1, NULL, '::1', '2017-04-27 17:30:27', 0, '2017-04-27 17:30:27', 0),
(54, 18, 'web', '', 'login', 'dc32181148d1d05007a83e2bfb673bfe', 1, 'Unknown Windows OS/Firefox 53.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', '', 'login-form', 1, NULL, '::1', '2017-04-27 17:51:01', 0, '2017-04-27 17:51:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_login_social`
--

CREATE TABLE `user_login_social` (
  `aid` int(10) UNSIGNED NOT NULL,
  `social_type` varchar(16) NOT NULL,
  `user_aid` int(10) UNSIGNED DEFAULT NULL,
  `id` varchar(128) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  `avatar_path_large` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `locale` varchar(8) DEFAULT NULL,
  `timezone` varchar(8) DEFAULT NULL,
  `updated_time` varchar(255) DEFAULT NULL,
  `data` longtext,
  `updated_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_owner`
--

CREATE TABLE `user_owner` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `alias` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `registration_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_owner`
--

INSERT INTO `user_owner` (`aid`, `cid`, `alias`, `name`, `type`, `status`, `registration_date`, `expiration_date`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, NULL, 'bookdose', 'Bookdose Co., Ltd.', 1, 1, '2012-12-01', NULL, '2013-01-01 00:00:00', 1, '2013-01-01 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`aid`, `cid`, `name`, `status`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, '1', 'Superadmin', 1, '2011-02-01 12:00:00', 1, '2011-02-01 12:00:00', 1),
(2, '2', 'Administrator', 1, '2011-02-01 12:00:00', 1, '2011-02-01 12:00:00', 1),
(3, '3', 'Admin', 1, '2011-02-01 12:00:00', 1, '2011-02-01 12:00:00', 1),
(4, '4', 'Staff', 1, '2011-02-01 12:00:00', 1, '2011-02-01 12:00:00', 1),
(5, '5', 'Member', 1, '2012-08-01 00:00:00', 1, '2012-08-01 00:00:00', 1),
(6, '6', 'Publisher', 0, '2013-04-21 00:00:00', 1, '2013-04-21 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_section`
--

CREATE TABLE `user_section` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(10) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `weight` float DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `default_rental_period` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `default_rental_fee` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `default_rental_fee_point` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `default_rental_fine_fee` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `default_renew_time` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `default_renew_period` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_section`
--

INSERT INTO `user_section` (`aid`, `cid`, `user_owner_aid`, `name`, `status`, `weight`, `is_default`, `default_rental_period`, `default_rental_fee`, `default_rental_fee_point`, `default_rental_fine_fee`, `default_renew_time`, `default_renew_period`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, NULL, 1, 'Student', 1, 0, 1, 0, 0, 0, 0, 0, 0, '2017-02-10 15:04:43', 6, '2017-02-10 15:05:07', 6),
(2, NULL, 1, 'Teacher', 1, 0, 0, 0, 0, 0, 0, 0, 0, '2017-02-10 15:08:14', 6, '2017-02-10 15:08:14', 6),
(3, NULL, 1, 'General', 1, 0, 0, 0, 0, 0, 0, 0, 0, '2017-02-10 15:09:24', 6, '2017-02-10 15:09:24', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user_setting_profile`
--

CREATE TABLE `user_setting_profile` (
  `user_aid` int(10) UNSIGNED NOT NULL,
  `type` char(1) NOT NULL COMMENT 'E:Event , P:Product',
  `aid` int(10) UNSIGNED NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usmarc_block_dm`
--

CREATE TABLE `usmarc_block_dm` (
  `block_nmbr` tinyint(4) NOT NULL,
  `description` varchar(80) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usmarc_block_dm`
--

INSERT INTO `usmarc_block_dm` (`block_nmbr`, `description`) VALUES
(0, 'Control information, numbers, and codes'),
(1, 'Main entry'),
(2, 'Titles and title paragraph (title, edition, imprint)'),
(3, 'Physical description, etc.'),
(4, 'Series statements'),
(5, 'Notes'),
(6, 'Subject access fields'),
(7, 'Added entries other than subject or series, linking fields'),
(8, 'Series added entries: location, and alternate graphics'),
(9, 'Reserved for local implementation');

-- --------------------------------------------------------

--
-- Table structure for table `usmarc_indicator_dm`
--

CREATE TABLE `usmarc_indicator_dm` (
  `tag` smallint(6) NOT NULL,
  `indicator_nmbr` tinyint(4) NOT NULL,
  `indicator_cd` char(1) NOT NULL,
  `description` varchar(80) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usmarc_indicator_dm`
--

INSERT INTO `usmarc_indicator_dm` (`tag`, `indicator_nmbr`, `indicator_cd`, `description`) VALUES
(10, 1, '#', 'Undefined'),
(10, 2, '#', 'Undefined'),
(13, 1, '#', 'Undefined'),
(13, 2, '#', 'Undefined'),
(15, 1, '#', 'Undefined'),
(15, 2, '#', 'Undefined'),
(16, 1, '#', 'National Library of Canada'),
(16, 1, '7', 'Agency identified in subfield $2'),
(16, 2, '#', 'Undefined'),
(17, 1, '#', 'Undefined'),
(17, 2, '#', 'Undefined'),
(18, 1, '#', 'Undefined'),
(18, 2, '#', 'Undefined'),
(20, 1, '#', 'Undefined'),
(20, 2, '#', 'Undefined'),
(22, 1, '#', 'No level specified'),
(22, 1, '0', 'Serial of international interest'),
(22, 1, '1', 'Serial not of international interest'),
(22, 2, '#', 'Undefined'),
(24, 1, '0', 'International Standard Recording Code (ISRC)'),
(24, 1, '1', 'Universal Product Code (UPC)'),
(24, 1, '2', 'International Standard Music Number (ISMN)'),
(24, 1, '3', 'International Article Number (EAN)'),
(24, 1, '4', 'Serial Item and Contribution Identifier (SICI)'),
(24, 1, '7', 'Source specified in subfield $2'),
(24, 1, '8', 'Unspecified type of standard number or code'),
(24, 2, '#', 'No information provided'),
(24, 2, '0', 'No difference'),
(24, 2, '1', 'Difference'),
(25, 1, '#', 'Undefined'),
(25, 2, '#', 'Undefined'),
(27, 1, '#', 'Undefined'),
(27, 2, '#', 'Undefined'),
(28, 1, '0', 'Issue number'),
(28, 1, '1', 'Matrix number'),
(28, 1, '2', 'Plate number'),
(28, 1, '3', 'Other music number'),
(28, 1, '4', 'Videorecording number'),
(28, 1, '5', 'Other publisher number'),
(28, 2, '0', 'No note, no added entry'),
(28, 2, '1', 'Note, added entry'),
(28, 2, '2', 'Note, no added entry'),
(28, 2, '3', 'No note, added entry'),
(30, 1, '#', 'Undefined'),
(30, 2, '#', 'Undefined'),
(32, 1, '#', 'Undefined'),
(32, 2, '#', 'Undefined'),
(33, 1, '#', 'No date information'),
(33, 1, '0', 'Single date'),
(33, 1, '1', 'Multiple single dates'),
(33, 1, '2', 'Range of dates'),
(33, 2, '#', 'No information provided'),
(33, 2, '0', 'Capture'),
(33, 2, '1', 'Broadcast'),
(33, 2, '2', 'Finding'),
(34, 1, '0', 'Scale indeterminable/No scale recorded'),
(34, 1, '1', 'Single scale'),
(34, 1, '3', 'Range of scales'),
(34, 2, '#', 'Not applicable'),
(34, 2, '0', 'Outer ring'),
(34, 2, '1', 'Exclusion ring'),
(35, 1, '#', 'Undefined'),
(35, 2, '#', 'Undefined'),
(36, 1, '#', 'Undefined'),
(36, 2, '#', 'Undefined'),
(37, 1, '#', 'Undefined'),
(37, 2, '#', 'Undefined'),
(40, 1, '#', 'Undefined'),
(40, 2, '#', 'Undefined'),
(41, 1, '0', 'Item not a translation/does not include a translation'),
(41, 1, '1', 'Item is or includes a translation'),
(41, 2, '#', 'MARC language code'),
(41, 2, '7', 'Source specified in subfield $2'),
(42, 1, '#', 'Undefined'),
(42, 2, '#', 'Undefined'),
(43, 1, '#', 'Undefined'),
(43, 2, '#', 'Undefined'),
(44, 1, '#', 'Undefined'),
(44, 2, '#', 'Undefined'),
(45, 1, '#', 'Subfield $b or $c not present'),
(45, 1, '0', 'Single date/time'),
(45, 1, '1', 'Multiple single dates/times'),
(45, 1, '2', 'Range of dates/times'),
(45, 2, '#', 'Undefined'),
(46, 1, '#', 'Undefined'),
(46, 2, '#', 'Undefined'),
(47, 1, '#', 'Undefined'),
(47, 2, '#', 'Undefined'),
(48, 1, '#', 'Undefined'),
(48, 2, '#', 'Undefined'),
(50, 1, '#', 'No information provided'),
(50, 1, '0', 'Item is in LC'),
(50, 1, '1', 'Item is not in LC'),
(50, 2, '0', 'Assigned by LC'),
(50, 2, '4', 'Assigned by agency other than LC'),
(51, 1, '#', 'Undefined'),
(51, 2, '#', 'Undefined'),
(52, 1, '#', 'Library of Congress Classification'),
(52, 1, '0', 'U.S. Dept. of Defense Classification'),
(52, 1, '7', 'Source specified in subfield $2'),
(52, 2, '#', 'Undefined'),
(55, 1, '#', 'Information not provided'),
(55, 1, '0', 'Work held by NLC'),
(55, 1, '1', 'Work not held by NLC'),
(55, 2, '0', 'LC-based call number assigned by NLC'),
(55, 2, '1', 'Complete LC class number assigned by NLC'),
(55, 2, '2', 'Incomplete LC class number assigned by NLC'),
(55, 2, '3', 'LC-based call number assigned by the contributing library'),
(55, 2, '4', 'Complete LC class number assigned by the contributing library'),
(55, 2, '5', 'Incomplete LC class number assigned by the contributing library'),
(55, 2, '6', 'Other call number assigned by NLC'),
(55, 2, '7', 'Other class number assigned by NLC'),
(55, 2, '8', 'Other call number assigned by the contributing library'),
(55, 2, '9', 'Other class number assigned by the contributing library'),
(60, 1, '#', 'No information provided'),
(60, 1, '0', 'Item is in NLM'),
(60, 1, '1', 'Item is not in NLM'),
(60, 2, '0', 'Assigned by NLM'),
(60, 2, '4', 'Assigned by agency other than NLM'),
(61, 1, '#', 'Undefined'),
(61, 2, '#', 'Undefined'),
(66, 1, '#', 'Undefined'),
(66, 2, '#', 'Undefined'),
(70, 1, '0', 'Item is in NAL'),
(70, 1, '1', 'Item is not in NAL'),
(70, 2, '#', 'Undefined'),
(71, 1, '#', 'Undefined'),
(71, 2, '#', 'Undefined'),
(72, 1, '#', 'Undefined'),
(72, 2, '0', 'NAL subject category code list'),
(72, 2, '7', 'Code source specified in subfield $2'),
(74, 1, '#', 'Undefined'),
(74, 2, '#', 'Undefined'),
(80, 1, '#', 'Undefined'),
(80, 2, '#', 'Undefined'),
(82, 1, '0', 'Full edition'),
(82, 1, '1', 'Abridged edition'),
(82, 2, '#', 'No information provided'),
(82, 2, '0', 'Assigned by LC'),
(82, 2, '4', 'Assigned by agency other than LC'),
(84, 1, '#', 'Undefined'),
(84, 2, '#', 'Undefined'),
(86, 1, '#', 'Source specified in subfield $2'),
(86, 1, '0', 'Superintendent of Documents Classification System'),
(86, 1, '1', 'Government of Canada Publications: Outline of Classification'),
(86, 2, '#', 'Undefined'),
(88, 1, '#', 'Undefined'),
(88, 2, '#', 'Undefined'),
(100, 1, '0', 'Forename'),
(100, 1, '1', 'Surname'),
(100, 1, '3', 'Family name'),
(100, 2, '#', 'Undefined'),
(110, 1, '0', 'Inverted name'),
(110, 1, '1', 'Jurisdiction name'),
(110, 1, '2', 'Name in direct order'),
(110, 2, '#', 'Undefined'),
(111, 1, '0', 'Inverted name'),
(111, 1, '1', 'Jurisdiction name'),
(111, 1, '2', 'Name in direct order'),
(111, 2, '#', 'Undefined'),
(130, 2, '#', 'Undefined'),
(210, 1, '0', 'No added entry'),
(210, 1, '1', 'Added entry'),
(210, 2, '#', 'Abbreviated key title'),
(210, 2, '0', 'Other abbreviated title'),
(222, 1, '#', 'Undefined'),
(222, 1, '0', 'No key title added entry, title proper same'),
(222, 1, '1', 'Key title added entry, title proper different'),
(222, 1, '2', 'Key title added entry, title proper same'),
(222, 1, '3', 'No key title added entry, title proper different'),
(240, 1, '0', 'Not printed or displayed'),
(240, 1, '1', 'Printed or displayed'),
(242, 1, '0', 'No added entry'),
(242, 1, '1', 'Added entry'),
(243, 1, '0', 'Not printed or displayed'),
(243, 1, '1', 'Printed or displayed'),
(245, 1, '0', 'No added entry'),
(245, 1, '1', 'Added entry'),
(246, 1, '0', 'Note, no added entry'),
(246, 1, '1', 'Note, added entry'),
(246, 1, '2', 'No note, no title added entry'),
(246, 1, '3', 'No note, added entry'),
(246, 2, '#', 'No type specified'),
(246, 2, '0', 'Portion of title'),
(246, 2, '1', 'Parallel title'),
(246, 2, '2', 'Distinctive title'),
(246, 2, '3', 'Other title'),
(246, 2, '4', 'Cover title'),
(246, 2, '5', 'Added title page title'),
(246, 2, '6', 'Caption title'),
(246, 2, '7', 'Running title'),
(246, 2, '8', 'Spine title'),
(247, 1, '0', 'No added entry'),
(247, 1, '1', 'Added entry'),
(247, 2, '0', 'Display note'),
(247, 2, '1', 'Do not display note'),
(250, 1, '#', 'Undefined'),
(250, 2, '#', 'Undefined'),
(254, 1, '#', 'Undefined'),
(254, 2, '#', 'Undefined'),
(255, 1, '#', 'Undefined'),
(255, 2, '#', 'Undefined'),
(256, 1, '#', 'Undefined'),
(256, 2, '#', 'Undefined'),
(257, 1, '#', 'Undefined'),
(257, 2, '#', 'Undefined'),
(260, 1, '#', 'Not applicable/No information provided/Earliest available publisher'),
(260, 1, '2', 'Intervening publisher'),
(260, 1, '3', 'Current/latest publisher'),
(260, 2, '#', 'Undefined'),
(261, 1, '#', 'Undefined'),
(261, 2, '#', 'Undefined'),
(262, 1, '#', 'Undefined'),
(262, 2, '#', 'Undefined'),
(263, 1, '#', 'Undefined'),
(263, 2, '#', 'Undefined'),
(270, 1, '#', 'No level specified'),
(270, 1, '1', 'Primary'),
(270, 1, '2', 'Secondary'),
(270, 2, '#', 'No type specified'),
(270, 2, '0', 'Mailing'),
(270, 2, '7', 'Type specified in subfield $i'),
(300, 1, '#', 'Undefined'),
(300, 2, '#', 'Undefined'),
(306, 1, '#', 'Undefined'),
(306, 2, '#', 'Undefined'),
(307, 1, '#', 'Hours'),
(307, 1, '8', 'No display constant generated'),
(307, 2, '#', 'Undefined'),
(310, 1, '#', 'Undefined'),
(310, 2, '#', 'Undefined'),
(340, 1, '#', 'Undefined'),
(340, 2, '#', 'Undefined'),
(342, 1, '0', 'Horizontal coordinate system'),
(342, 1, '1', 'Vertical coordinate system'),
(342, 2, '0', 'Geographic'),
(342, 2, '1', 'Map projection'),
(342, 2, '2', 'Grid coordinate system'),
(342, 2, '3', 'Local planar'),
(342, 2, '4', 'Local'),
(342, 2, '5', 'Geodetic model'),
(342, 2, '6', 'Altitude'),
(342, 2, '7', 'Method specified in $2'),
(342, 2, '8', 'Depth'),
(343, 1, '#', 'Undefined'),
(343, 2, '#', 'Undefined'),
(351, 1, '#', 'Undefined'),
(351, 2, '#', 'Undefined'),
(352, 1, '#', 'Undefined'),
(352, 2, '#', 'Undefined'),
(355, 1, '0', 'Document'),
(355, 1, '1', 'Title'),
(355, 1, '2', 'Abstract'),
(355, 1, '3', 'Contents note'),
(355, 1, '4', 'Author'),
(355, 1, '5', 'Record'),
(355, 1, '8', 'Other element'),
(355, 2, '#', 'Undefined'),
(357, 1, '#', 'Undefined'),
(357, 2, '#', 'Undefined'),
(362, 1, '0', 'Formatted style'),
(362, 1, '1', 'Unformatted note'),
(362, 2, '#', 'Undefined'),
(400, 1, '0', 'Forename'),
(400, 1, '1', 'Surname'),
(400, 1, '3', 'Family name'),
(400, 2, '0', 'Main entry not represented by pronoun'),
(400, 2, '1', 'Main entry represented by pronoun'),
(410, 1, '0', 'Inverted name'),
(410, 1, '1', 'Jurisdiction name'),
(410, 1, '2', 'Name in direct order'),
(410, 2, '0', 'Main entry not represented by pronoun'),
(410, 2, '1', 'Main entry represented by pronoun'),
(411, 1, '0', 'Inverted name'),
(411, 1, '1', 'Jurisdiction name'),
(411, 1, '2', 'Name in direct order'),
(411, 2, '0', 'Main entry not represented by pronoun'),
(411, 2, '1', 'Main entry represented by pronoun'),
(440, 1, '#', 'Undefined'),
(490, 1, '0', 'Series not traced'),
(490, 1, '1', 'Series traced differently'),
(490, 2, '#', 'Undefined'),
(500, 1, '#', 'Undefined'),
(500, 2, '#', 'Undefined'),
(501, 1, '#', 'Undefined'),
(501, 2, '#', 'Undefined'),
(502, 1, '#', 'Undefined'),
(502, 2, '#', 'Undefined'),
(504, 1, '#', 'Undefined'),
(504, 2, '#', 'Undefined'),
(505, 1, '0', 'Contents'),
(505, 1, '1', 'Incomplete contents'),
(505, 1, '2', 'Partial contents'),
(505, 1, '8', 'No display constant generated'),
(505, 2, '#', 'Basic'),
(505, 2, '0', 'Enhanced'),
(506, 1, '#', 'Undefined'),
(506, 2, '#', 'Undefined'),
(507, 1, '#', 'Undefined'),
(507, 2, '#', 'Undefined'),
(508, 1, '#', 'Undefined'),
(508, 2, '#', 'Undefined'),
(510, 1, '0', 'Coverage unknown'),
(510, 1, '1', 'Coverage complete'),
(510, 1, '2', 'Coverage is selective'),
(510, 1, '3', 'Location in source not given'),
(510, 1, '4', 'Location in source given'),
(510, 2, '#', 'Undefined'),
(511, 1, '0', 'No display constant generated'),
(511, 1, '1', 'Cast'),
(511, 2, '#', 'Undefined'),
(513, 1, '#', 'Undefined'),
(513, 2, '#', 'Undefined'),
(514, 1, '#', 'Undefined'),
(514, 2, '#', 'Undefined'),
(515, 1, '#', 'Undefined'),
(515, 2, '#', 'Undefined'),
(516, 1, '#', 'Type of file'),
(516, 1, '8', 'No display constant generated'),
(516, 2, '#', 'Undefined'),
(518, 1, '#', 'Undefined'),
(518, 2, '#', 'Undefined'),
(520, 1, '#', 'Summary'),
(520, 1, '0', 'Subject'),
(520, 1, '1', 'Review'),
(520, 1, '2', 'Scope and content'),
(520, 1, '3', 'Abstract'),
(520, 1, '8', 'No display constant generated'),
(520, 2, '#', 'Undefined'),
(521, 1, '#', 'Audience'),
(521, 1, '0', 'Reading grade level'),
(521, 1, '1', 'Interest age level'),
(521, 1, '2', 'Interest grade level'),
(521, 1, '3', 'Special audience characteristics'),
(521, 1, '4', 'Motivation interest level'),
(521, 1, '8', 'No display constant generated'),
(521, 2, '#', 'Undefined'),
(522, 1, '#', 'Geographic coverage'),
(522, 1, '8', 'No display constant generated'),
(522, 2, '#', 'Undefined'),
(524, 1, '#', 'Cite as'),
(524, 1, '8', 'No display constant generated'),
(524, 2, '#', 'Undefined'),
(525, 1, '#', 'Undefined'),
(525, 2, '#', 'Undefined'),
(526, 1, '0', 'Reading program'),
(526, 1, '8', 'No display constant generated'),
(526, 2, '#', 'Undefined'),
(530, 1, '#', 'Undefined'),
(530, 2, '#', 'Undefined'),
(533, 1, '#', 'Undefined'),
(533, 2, '#', 'Undefined'),
(534, 1, '#', 'Undefined'),
(534, 2, '#', 'Undefined'),
(535, 1, '1', 'Holder of originals'),
(535, 1, '2', 'Holder of duplicates'),
(535, 2, '#', 'Undefined'),
(536, 1, '#', 'Undefined'),
(536, 2, '#', 'Undefined'),
(538, 1, '#', 'Undefined'),
(538, 2, '#', 'Undefined'),
(540, 1, '#', 'Undefined'),
(540, 2, '#', 'Undefined'),
(541, 1, '#', 'Undefined'),
(541, 2, '#', 'Undefined'),
(544, 1, '#', 'No information provided'),
(544, 1, '0', 'Associated materials'),
(544, 1, '1', 'Related materials'),
(544, 2, '#', 'Undefined'),
(545, 1, '#', 'No information provided'),
(545, 1, '0', 'Biographical sketch'),
(545, 1, '1', 'Administrative history'),
(545, 2, '#', 'Undefined'),
(546, 1, '#', 'Undefined'),
(546, 2, '#', 'Undefined'),
(547, 1, '#', 'Undefined'),
(547, 2, '#', 'Undefined'),
(550, 1, '#', 'Undefined'),
(550, 2, '#', 'Undefined'),
(552, 1, '#', 'Undefined'),
(552, 2, '#', 'Undefined'),
(555, 1, '#', 'Indexes'),
(555, 1, '0', 'Finding aids'),
(555, 1, '8', 'No display constant generated'),
(555, 2, '#', 'Undefined'),
(556, 1, '#', 'Documentation'),
(556, 1, '8', 'No display constant generated'),
(556, 2, '#', 'Undefined'),
(561, 1, '#', 'Undefined'),
(561, 2, '#', 'Undefined'),
(562, 1, '#', 'Undefined'),
(562, 2, '#', 'Undefined'),
(565, 1, '#', 'File size'),
(565, 1, '0', 'Case file characteristics'),
(565, 1, '8', 'No display constant generated'),
(565, 2, '#', 'Undefined'),
(567, 1, '#', 'Methodology'),
(567, 1, '8', 'No display constant generated'),
(567, 2, '#', 'Undefined'),
(580, 1, '#', 'Undefined'),
(580, 2, '#', 'Undefined'),
(581, 1, '#', 'Publications'),
(581, 1, '8', 'No display constant generated'),
(581, 2, '#', 'Undefined'),
(583, 1, '#', 'Undefined'),
(583, 2, '#', 'Undefined'),
(584, 1, '#', 'Undefined'),
(584, 2, '#', 'Undefined'),
(585, 1, '#', 'Undefined'),
(585, 2, '#', 'Undefined'),
(586, 1, '#', 'Awards'),
(586, 1, '8', 'No display constant generated'),
(586, 2, '#', 'Undefined'),
(600, 1, '0', 'Forename'),
(600, 1, '1', 'Surname'),
(600, 1, '3', 'Family name'),
(600, 2, '0', 'Library of Congress Subject Headings'),
(600, 2, '1', 'LC subject headings for children\'s literature'),
(600, 2, '2', 'Medical Subject Headings'),
(600, 2, '3', 'National Agricultural Library subject authority file'),
(600, 2, '4', 'Source not specified'),
(600, 2, '5', 'Canadian Subject Headings'),
(600, 2, '6', 'R&eacute,pertoire de vedettes-mati&egrave,re'),
(600, 2, '7', 'Source specified in subfield $2'),
(610, 1, '0', 'Inverted name'),
(610, 1, '1', 'Jurisdiction name'),
(610, 1, '2', 'Name in direct order'),
(610, 2, '0', 'Library of Congress Subject Headings'),
(610, 2, '1', 'LC subject headings for children\'s literature'),
(610, 2, '2', 'Medical Subject Headings'),
(610, 2, '4', 'Source not specified'),
(610, 2, '5', 'Canadian Subject Headings'),
(610, 2, '6', 'R&eacute,pertoire de vedettes-mati&egrave,re'),
(610, 2, '7', 'Source specified in subfield $2'),
(611, 1, '0', 'Inverted name'),
(611, 1, '1', 'Jurisdiction name'),
(611, 1, '2', 'Name in direct order'),
(611, 2, '0', 'Library of Congress Subject Headings'),
(611, 2, '1', 'LC subject headings for children\'s literature'),
(611, 2, '2', 'Medical Subject Headings'),
(611, 2, '3', 'National Agricultural Library subject authority file'),
(611, 2, '4', 'Source not specified'),
(611, 2, '5', 'Canadian Subject Headings'),
(611, 2, '6', 'R&eacute,pertoire de vedettes-mati&egrave,re'),
(611, 2, '7', 'Source specified in subfield $2'),
(630, 2, '0', 'Library of Congress Subject Headings'),
(630, 2, '1', 'LC subject headings for children\'s literature'),
(630, 2, '2', 'Medical Subject Headings'),
(630, 2, '3', 'National Agricultural Library subject authority file'),
(630, 2, '4', 'Source not specified'),
(630, 2, '5', 'Canadian Subject Headings'),
(630, 2, '6', 'R&eacute,pertoire de vedettes-mati&egrave,re'),
(630, 2, '7', 'Source specified in subfield $2'),
(650, 1, '#', 'No information provided'),
(650, 1, '0', 'No level specified'),
(650, 1, '2', 'Secondary'),
(650, 2, '0', 'Library of Congress Subject Headings'),
(650, 2, '1', 'LC subject headings for children\'s literature'),
(650, 2, '2', 'Medical Subject Headings'),
(650, 2, '3', 'National Agricultural Library subject authority file'),
(650, 2, '4', 'Source not specified'),
(650, 2, '5', 'Canadian Subject Headings'),
(650, 2, '6', 'R&eacute,pertoire de vedettes-mati&egrave,re'),
(650, 2, '7', 'Source specified in subfield $2'),
(651, 1, '#', 'Undefined'),
(651, 2, '0', 'Library of Congress Subject Headings'),
(651, 2, '1', 'LC subject headings for children\'s literature'),
(651, 2, '2', 'Medical Subject Headings'),
(651, 2, '3', 'National Agricultural Library subject authority file'),
(651, 2, '4', 'Source not specified'),
(651, 2, '5', 'Canadian Subject Headings'),
(651, 2, '6', 'R&eacute,pertoire de vedettes-mati&egrave,re'),
(651, 2, '7', 'Source specified in subfield $2'),
(653, 1, '#', 'No information provided'),
(653, 1, '0', 'No level specified'),
(653, 1, '1', 'Primary'),
(653, 1, '2', 'Secondary'),
(653, 2, '#', 'Undefined'),
(654, 1, '#', 'No information provided'),
(654, 1, '0', 'No level specified'),
(654, 1, '1', 'Primary'),
(654, 1, '2', 'Secondary'),
(654, 2, '#', 'Undefined'),
(655, 1, '#', 'Basic'),
(655, 1, '0', 'Faceted'),
(655, 2, '7', 'Source specified in subfield $2'),
(656, 1, '#', 'Undefined'),
(656, 2, '7', 'Source specified in subfield $2'),
(657, 1, '#', 'Undefined'),
(657, 2, '7', 'Source specified in subfield $2'),
(658, 1, '#', 'Undefined'),
(658, 2, '#', 'Undefined'),
(700, 1, '0', 'Forename'),
(700, 1, '1', 'Surname'),
(700, 1, '3', 'Family name'),
(700, 2, '#', 'No information provided'),
(700, 2, '2', 'Analytical entry'),
(710, 1, '0', 'Inverted name'),
(710, 1, '1', 'Jurisdiction name'),
(710, 1, '2', 'Name in direct order'),
(710, 2, '#', 'No information provided'),
(710, 2, '2', 'Analytical entry'),
(711, 1, '0', 'Inverted name'),
(711, 1, '1', 'Jurisdiction name'),
(711, 1, '2', 'Name in direct order'),
(711, 2, '#', 'No information provided'),
(711, 2, '2', 'Analytical entry'),
(720, 1, '#', 'Not specified'),
(720, 1, '1', 'Personal'),
(720, 1, '2', 'Other'),
(720, 2, '#', 'Undefined'),
(730, 2, '#', 'No information provided'),
(730, 2, '2', 'Analytical entry'),
(740, 2, '#', 'No information provided'),
(740, 2, '2', 'Analytical entry'),
(752, 1, '#', 'Undefined'),
(752, 2, '#', 'Undefined'),
(753, 1, '#', 'Undefined'),
(753, 2, '#', 'Undefined'),
(754, 1, '#', 'Undefined'),
(754, 2, '#', 'Undefined'),
(760, 1, '0', 'Display note'),
(760, 1, '1', 'Do not display note'),
(760, 2, '#', 'Main series'),
(760, 2, '8', 'No display constant generated'),
(762, 1, '0', 'Display note'),
(762, 1, '1', 'Do not display note'),
(762, 2, '#', 'Has subseries'),
(762, 2, '8', 'No display constant generated'),
(765, 1, '0', 'Display note'),
(765, 1, '1', 'Do not display note'),
(765, 2, '#', 'Translation of'),
(765, 2, '8', 'No display constant generated'),
(767, 1, '0', 'Display note'),
(767, 1, '1', 'Do not display note'),
(767, 2, '#', 'Translated as'),
(767, 2, '8', 'No display constant generated'),
(770, 1, '0', 'Display note'),
(770, 1, '1', 'Do not display note'),
(770, 2, '#', 'Has supplement'),
(770, 2, '8', 'No display constant generated'),
(772, 1, '0', 'Display note'),
(772, 1, '1', 'Do not display note'),
(772, 2, '#', 'Supplement to'),
(772, 2, '0', 'Parent'),
(772, 2, '8', 'No display constant generated'),
(773, 1, '0', 'Display note'),
(773, 1, '1', 'Do not display note'),
(773, 2, '#', 'In'),
(773, 2, '8', 'No display constant generated'),
(774, 1, '0', 'Display note'),
(774, 1, '1', 'Do not display note'),
(774, 2, '#', 'Constituent unit'),
(774, 2, '8', 'No display constant generated'),
(775, 1, '0', 'Display note'),
(775, 1, '1', 'Do not display note'),
(775, 2, '#', 'Other edition available'),
(775, 2, '8', 'No display constant generated'),
(776, 1, '0', 'Display note'),
(776, 1, '1', 'Do not display note'),
(776, 2, '#', 'Available in another form'),
(776, 2, '8', 'No display constant generated'),
(777, 1, '0', 'Display note'),
(777, 1, '1', 'Do not display note'),
(777, 2, '#', 'Issued with'),
(777, 2, '8', 'No display constant generated'),
(780, 1, '0', 'Display note'),
(780, 1, '1', 'Do not display note'),
(780, 2, '0', 'Continues'),
(780, 2, '1', 'Continues in part'),
(780, 2, '2', 'Supersedes'),
(780, 2, '3', 'Supersedes in part'),
(780, 2, '4', 'Formed by the union of ... and ...'),
(780, 2, '5', 'Absorbed'),
(780, 2, '6', 'Absorbed in part'),
(780, 2, '7', 'Separated from'),
(785, 1, '0', 'Display note'),
(785, 1, '1', 'Do not display note'),
(785, 2, '0', 'Continued by'),
(785, 2, '1', 'Continued in part by'),
(785, 2, '2', 'Superseded by'),
(785, 2, '3', 'Superseded in part by'),
(785, 2, '4', 'Absorbed by'),
(785, 2, '5', 'Absorbed in part by'),
(785, 2, '6', 'Split into ... and ...'),
(785, 2, '7', 'Merged with ... to form ...'),
(785, 2, '8', 'Changed back to'),
(786, 1, '0', 'Display note'),
(786, 1, '1', 'Do not display note'),
(786, 2, '#', 'Data source'),
(786, 2, '8', 'No display constant generated'),
(787, 1, '0', 'Display note'),
(787, 1, '1', 'Do not display note'),
(787, 2, '#', 'Related item'),
(787, 2, '8', 'No display constant generated'),
(800, 1, '0', 'Forename'),
(800, 1, '1', 'Surname'),
(800, 1, '3', 'Family name'),
(800, 2, '#', 'Undefined'),
(810, 1, '0', 'Inverted name'),
(810, 1, '1', 'Jurisdiction name'),
(810, 1, '2', 'Name in direct order'),
(810, 2, '#', 'Undefined'),
(811, 1, '0', 'Inverted name'),
(811, 1, '1', 'Jurisdiction name'),
(811, 1, '2', 'Name in direct order'),
(811, 2, '#', 'Undefined'),
(830, 1, '#', 'Undefined'),
(850, 1, '#', 'Undefined'),
(850, 2, '#', 'Undefined'),
(852, 1, '#', 'No information provided'),
(852, 1, '0', 'Library of Congress classification'),
(852, 1, '1', 'Dewey Decimal classification'),
(852, 1, '2', 'National Library of Medicine classification'),
(852, 1, '3', 'Superintendent of Documents classification'),
(852, 1, '4', 'Shelving control number'),
(852, 1, '5', 'Title'),
(852, 1, '6', 'Shelved separately'),
(852, 1, '7', 'Source specified in subfield $2'),
(852, 1, '8', 'Other scheme'),
(852, 2, '#', 'No information provided'),
(852, 2, '0', 'Not enumeration'),
(852, 2, '1', 'Primary enumeration'),
(852, 2, '2', 'Alternative enumeration'),
(856, 1, '#', 'No information provided'),
(856, 1, '0', 'Email'),
(856, 1, '1', 'FTP'),
(856, 1, '2', 'Remote login (Telnet)'),
(856, 1, '3', 'Dial-up'),
(856, 1, '4', 'HTTP'),
(856, 1, '7', 'Method specified in subfield $2'),
(856, 2, '#', 'No information provided'),
(856, 2, '0', 'Resource'),
(856, 2, '1', 'Version of resource'),
(856, 2, '2', 'Related resource'),
(856, 2, '8', 'No display constant generated'),
(886, 1, '0', 'Leader'),
(886, 1, '1', 'Variable control fields (002-009)'),
(886, 1, '2', 'Variable data fields (010-999)'),
(886, 2, '#', 'Undefined'),
(887, 1, '#', 'Undefined'),
(887, 2, '#', 'Undefined');

-- --------------------------------------------------------

--
-- Table structure for table `usmarc_subfield_dm`
--

CREATE TABLE `usmarc_subfield_dm` (
  `tag` smallint(6) NOT NULL,
  `subfield_cd` char(1) NOT NULL,
  `description` varchar(80) NOT NULL,
  `repeatable_flg` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usmarc_subfield_dm`
--

INSERT INTO `usmarc_subfield_dm` (`tag`, `subfield_cd`, `description`, `repeatable_flg`) VALUES
(10, 'a', 'LC control number', 'N'),
(10, 'b', 'NUCMC control number', 'Y'),
(10, 'z', 'Canceled/invalid LC control number', 'Y'),
(10, '8', 'Field link and sequence number', 'Y'),
(13, 'a', 'Number', 'N'),
(13, 'b', 'Country', 'N'),
(13, 'c', 'Type of number', 'N'),
(13, 'd', 'Date', 'Y'),
(13, 'e', 'Status', 'Y'),
(13, 'f', 'Party to document', 'Y'),
(13, '6', 'Linkage', 'N'),
(13, '8', 'Field link and sequence number', 'Y'),
(15, 'a', 'National bibliography number', 'Y'),
(15, '2', 'Source', 'N'),
(15, '6', 'Linkage', 'N'),
(15, '8', 'Field link and sequence number', 'Y'),
(16, 'a', 'Record control number', 'N'),
(16, 'z', 'Canceled or invalid record control number', 'Y'),
(16, '2', 'Source', 'N'),
(16, '8', 'Field link and sequence number', 'Y'),
(17, 'a', 'Copyright registration number', 'Y'),
(17, 'b', 'Assigning agency', 'N'),
(17, '2', 'Source', 'N'),
(17, '6', 'Linkage', 'N'),
(17, '8', 'Field link and sequence number', 'Y'),
(18, 'a', 'Copyright article-fee code', 'N'),
(18, '8', 'Field link and sequence number', 'Y'),
(20, 'a', 'International Standard Book Number', 'N'),
(20, 'c', 'Terms of availability', 'N'),
(20, 'z', 'Canceled/invalid ISBN', 'Y'),
(20, '6', 'Linkage', 'N'),
(20, '8', 'Field link and sequence number', 'Y'),
(22, 'a', 'International Standard Serial Number', 'N'),
(22, 'y', 'Incorrect ISSN', 'Y'),
(22, 'z', 'Canceled ISSN', 'Y'),
(22, '6', 'Linkage', 'N'),
(22, '8', 'Field link and sequence number', 'Y'),
(24, 'a', 'Standard number or code', 'N'),
(24, 'c', 'Terms of availability', 'N'),
(24, 'd', 'Additional codes following the standard number or code', 'N'),
(24, 'z', 'Canceled/invalid standard number or code', 'Y'),
(24, '2', 'Source of number or code', 'N'),
(24, '6', 'Linkage', 'N'),
(24, '8', 'Field link and sequence number', 'Y'),
(25, 'a', 'Overseas acquisition number', 'Y'),
(25, '8', 'Field link and sequence number', 'Y'),
(27, 'a', 'Standard technical report number', 'N'),
(27, 'z', 'Canceled/invalid number', 'Y'),
(27, '6', 'Linkage', 'N'),
(27, '8', 'Field link and sequence number', 'Y'),
(28, 'a', 'Publisher number', 'N'),
(28, 'b', 'Source', 'N'),
(28, '6', 'Linkage', 'N'),
(28, '8', 'Field link and sequence number', 'Y'),
(30, 'a', 'CODEN', 'N'),
(30, 'z', 'Canceled/invalid CODEN', 'Y'),
(30, '6', 'Linkage', 'N'),
(30, '8', 'Field link and sequence number', 'Y'),
(32, 'a', 'Postal registration number', 'N'),
(32, 'b', 'Source (agency assigning number)', 'N'),
(32, '6', 'Linkage', 'N'),
(32, '8', 'Field link and sequence number', 'Y'),
(33, 'a', 'Formatted date/time', 'Y'),
(33, 'b', 'Geographic classification area code', 'Y'),
(33, 'c', 'Geographic classification subarea code', 'Y'),
(33, '3', 'Materials specified', 'N'),
(33, '6', 'Linkage', 'N'),
(33, '8', 'Field link and sequence number', 'Y'),
(34, 'a', 'Category of scale', 'N'),
(34, 'b', 'Constant ratio linear horizontal scale', 'Y'),
(34, 'c', 'Constant ratio linear vertical scale', 'Y'),
(34, 'd', 'Coordinates--westernmost longitude', 'N'),
(34, 'e', 'Coordinates--easternmost longitude', 'N'),
(34, 'f', 'Coordinates--northernmost latitude', 'N'),
(34, 'g', 'Coordinates--southernmost latitude', 'N'),
(34, 'h', 'Angular scale', 'Y'),
(34, 'j', 'Declination--northern limit', 'N'),
(34, 'k', 'Declination--southern limit', 'N'),
(34, 'm', 'Right ascension--eastern limit', 'N'),
(34, 'n', 'Right ascension--western limit', 'N'),
(34, 'p', 'Equinox', 'N'),
(34, 's', 'G-ring latitude', 'Y'),
(34, 't', 'G-ring longitude', 'Y'),
(34, '6', 'Linkage', 'N'),
(34, '8', 'Field link and sequence number', 'Y'),
(35, 'a', 'System control number', 'N'),
(35, 'z', 'Canceled/invalid control number', 'Y'),
(35, '6', 'Linkage', 'N'),
(35, '8', 'Field link and sequence number', 'Y'),
(36, 'a', 'Original study number', 'N'),
(36, 'b', 'Source (agency assigning number)', 'N'),
(36, '6', 'Linkage', 'N'),
(36, '8', 'Field link and sequence number', 'Y'),
(37, 'a', 'Stock number', 'N'),
(37, 'b', 'Source of stock number/acquisition', 'N'),
(37, 'c', 'Terms of availability', 'Y'),
(37, 'f', 'Form of issue', 'Y'),
(37, 'g', 'Additional format characteristics', 'Y'),
(37, 'n', 'Note', 'Y'),
(37, '6', 'Linkage', 'N'),
(37, '8', 'Field link and sequence number', 'Y'),
(40, 'a', 'Original cataloging agency', 'N'),
(40, 'b', 'Language of cataloging', 'N'),
(40, 'c', 'Transcribing agency', 'N'),
(40, 'd', 'Modifying agency', 'Y'),
(40, 'e', 'Description conventions', 'N'),
(40, '6', 'Linkage', 'N'),
(40, '8', 'Field link and sequence number', 'Y'),
(41, 'a', 'Language code of text/sound track or separate title', 'Y'),
(41, 'b', 'Language code of summary or abstract/overprinted title or subtitle', 'Y'),
(41, 'd', 'Language code of sung or spoken text', 'Y'),
(41, 'e', 'Language code of librettos', 'Y'),
(41, 'f', 'Language code of table of contents', 'Y'),
(41, 'g', 'Language code of accompanying material other than librettos', 'Y'),
(41, 'h', 'Language code of original and/or intermediate translations of text', 'Y'),
(41, '2', 'Source of code', 'N'),
(41, '6', 'Linkage', 'N'),
(41, '8', 'Field link and sequence number', 'Y'),
(42, 'a', 'Authentication code', 'Y'),
(43, 'a', 'Geographic area code', 'Y'),
(43, 'b', 'Local GAC code', 'Y'),
(43, 'c', 'ISO code', 'Y'),
(43, '2', 'Source of local code', 'Y'),
(43, '6', 'Linkage', 'N'),
(43, '8', 'Field link and sequence number', 'Y'),
(44, 'a', 'Country of publishing/producing entity code', 'Y'),
(44, 'b', 'Local subentity code', 'Y'),
(44, 'c', 'ISO code', 'Y'),
(44, '2', 'Source of local subentity code', 'Y'),
(44, '6', 'Linkage', 'N'),
(44, '8', 'Field link and sequence number', 'Y'),
(45, 'a', 'Time period code', 'Y'),
(45, 'b', 'Formatted 9999 B.C. through C.E. time period', 'Y'),
(45, 'c', 'Formatted pre-9999 B.C. time period', 'Y'),
(45, '6', 'Linkage', 'N'),
(45, '8', 'Field link and sequence number', 'Y'),
(46, 'a', 'Type of date code', 'N'),
(46, 'b', 'Date 1 (B.C. date)', 'N'),
(46, 'c', 'Date 1 (C.E. date)', 'N'),
(46, 'd', 'Date 2 (B.C. date)', 'N'),
(46, 'e', 'Date 2 (C.E. date)', 'N'),
(46, '6', 'Linkage', 'N'),
(46, '8', 'Field link and sequence number', 'Y'),
(47, 'a', 'Form of musical composition code', 'Y'),
(47, '8', 'Field link and sequence number', 'Y'),
(48, 'a', 'Performer or ensemble', 'Y'),
(48, 'b', 'Soloist', 'Y'),
(48, '8', 'Field link and sequence number', 'Y'),
(50, 'a', 'Classification number', 'Y'),
(50, 'b', 'Item number', 'N'),
(50, '3', 'Materials specified', 'N'),
(50, '6', 'Linkage', 'N'),
(50, '8', 'Field link and sequence number', 'Y'),
(51, 'a', 'Classification number', 'N'),
(51, 'b', 'Item number', 'N'),
(51, 'c', 'Copy information', 'N'),
(51, '8', 'Field link and sequence number', 'Y'),
(52, 'a', 'Geographic classification area code', 'N'),
(52, 'b', 'Geographic classification subarea code', 'Y'),
(52, 'd', 'Populated place name', 'Y'),
(52, '2', 'Code source', 'N'),
(52, '6', 'Linkage', 'N'),
(52, '8', 'Field link and sequence number', 'Y'),
(55, 'a', 'Classification number', 'N'),
(55, 'b', 'Item number', 'N'),
(55, '2', 'Source of call/class number', 'N'),
(55, '8', 'Field link and sequence number', 'Y'),
(60, 'a', 'Classification number', 'Y'),
(60, 'b', 'Item number', 'N'),
(60, '8', 'Field link and sequence number', 'Y'),
(61, 'a', 'Classification number', 'Y'),
(61, 'b', 'Item number', 'N'),
(61, 'c', 'Copy information', 'N'),
(61, '8', 'Field link and sequence number', 'Y'),
(66, 'a', 'Primary G0 character set', 'N'),
(66, 'b', 'Primary G1 character set', 'N'),
(66, 'c', 'Alternate G0 or G1 character set', 'Y'),
(70, 'a', 'Classification number', 'Y'),
(70, 'b', 'Item number', 'N'),
(70, '8', 'Field link and sequence number', 'Y'),
(71, 'a', 'Classification number', 'Y'),
(71, 'b', 'Item number', 'N'),
(71, 'c', 'Copy information', 'N'),
(71, '8', 'Field link and sequence number', 'Y'),
(72, 'a', 'Subject category code', 'N'),
(72, 'x', 'Subject category code subdivision', 'Y'),
(72, '2', 'Code source', 'N'),
(72, '6', 'Linkage', 'N'),
(72, '8', 'Field link and sequence number', 'Y'),
(74, 'a', 'GPO item number', 'N'),
(74, 'z', 'Canceled/invalid GPO item number', 'Y'),
(74, '8', 'Field link and sequence number', 'Y'),
(80, 'a', 'Universal Decimal Classification number', 'N'),
(80, 'b', 'Item number', 'N'),
(80, 'x', 'Common auxiliary subdivision', 'Y'),
(80, '2', 'Edition identifier', 'N'),
(80, '6', 'Linkage', 'N'),
(80, '8', 'Field link and sequence number', 'Y'),
(82, 'a', 'Classification number', 'Y'),
(82, 'b', 'Item number', 'N'),
(82, '2', 'Edition number', 'N'),
(82, '6', 'Linkage', 'N'),
(82, '8', 'Field link and sequence number', 'Y'),
(84, 'a', 'Classification number', 'Y'),
(84, 'b', 'Item number', 'N'),
(84, '2', 'Source of number', 'N'),
(84, '6', 'Linkage', 'N'),
(84, '8', 'Field link and sequence number', 'Y'),
(86, 'a', 'Classification number', 'N'),
(86, 'z', 'Canceled/invalid classification number', 'Y'),
(86, '2', 'Number source', 'N'),
(86, '6', 'Linkage', 'N'),
(86, '8', 'Field link and sequence number', 'Y'),
(88, 'a', 'Report number', 'N'),
(88, 'z', 'Canceled/invalid report number', 'Y'),
(88, '6', 'Linkage', 'N'),
(88, '8', 'Field link and sequence number', 'Y'),
(100, 'a', 'Personal name', 'N'),
(100, 'b', 'Numeration', 'N'),
(100, 'c', 'Titles and other words associated with a name', 'Y'),
(100, 'd', 'Dates associated with a name', 'N'),
(100, 'e', 'Relator term', 'Y'),
(100, 'f', 'Date of a work', 'N'),
(100, 'g', 'Miscellaneous information', 'N'),
(100, 'j', 'Attribution qualifier', 'Y'),
(100, 'k', 'Form subheading', 'Y'),
(100, 'l', 'Language of a work', 'N'),
(100, 'n', 'Number of part/section of a work', 'Y'),
(100, 'p', 'Name of part/section of a work', 'Y'),
(100, 'q', 'Fuller form of name', 'N'),
(100, 't', 'Title of a work', 'N'),
(100, 'u', 'Affiliation', 'N'),
(100, '4', 'Relator code', 'Y'),
(100, '6', 'Linkage', 'N'),
(100, '8', 'Field link and sequence number', 'Y'),
(110, 'a', 'Corporate name or jurisdiction name as entry element', 'N'),
(110, 'b', 'Subordinate unit', 'Y'),
(110, 'c', 'Location of meeting', 'N'),
(110, 'd', 'Date of meeting or treaty signing', 'Y'),
(110, 'e', 'Relator term', 'Y'),
(110, 'f', 'Date of a work', 'N'),
(110, 'g', 'Miscellaneous information', 'N'),
(110, 'k', 'Form subheading', 'Y'),
(110, 'l', 'Language of a work', 'N'),
(110, 'n', 'Number of part/section/meeting', 'Y'),
(110, 'p', 'Name of part/section of a work', 'Y'),
(110, 't', 'Title of a work', 'N'),
(110, 'u', 'Affiliation', 'N'),
(110, '4', 'Relator code', 'Y'),
(110, '6', 'Linkage', 'N'),
(110, '8', 'Field link and sequence number', 'Y'),
(111, 'a', 'Meeting name or jurisdiction name as entry element', 'N'),
(111, 'c', 'Location of meeting', 'N'),
(111, 'd', 'Date of meeting', 'N'),
(111, 'e', 'Subordinate unit', 'Y'),
(111, 'f', 'Date of a work', 'N'),
(111, 'g', 'Miscellaneous information', 'N'),
(111, 'k', 'Form subheading', 'Y'),
(111, 'l', 'Language of a work', 'N'),
(111, 'n', 'Number of part/section/meeting', 'Y'),
(111, 'p', 'Name of part/section of a work', 'Y'),
(111, 'q', 'Name of meeting following jurisdiction name entry element', 'N'),
(111, 't', 'Title of a work', 'N'),
(111, 'u', 'Affiliation', 'N'),
(111, '4', 'Relator code', 'Y'),
(111, '6', 'Linkage', 'N'),
(111, '8', 'Field link and sequence number', 'Y'),
(130, 'a', 'Uniform title', 'N'),
(130, 'd', 'Date of treaty signing', 'Y'),
(130, 'f', 'Date of a work', 'N'),
(130, 'g', 'Miscellaneous information', 'N'),
(130, 'h', 'Medium', 'N'),
(130, 'k', 'Form subheading', 'Y'),
(130, 'l', 'Language of a work', 'N'),
(130, 'm', 'Medium of performance for music', 'Y'),
(130, 'n', 'Number of part/section of a work', 'Y'),
(130, 'o', 'Arranged statement for music', 'N'),
(130, 'p', 'Name of part/section of a work', 'Y'),
(130, 'r', 'Key for music', 'N'),
(130, 's', 'Version', 'N'),
(130, 't', 'Title of a work', 'N'),
(130, '6', 'Linkage', 'N'),
(130, '8', 'Field link and sequence number', 'Y'),
(210, 'a', 'Abbreviated title', 'N'),
(210, 'b', 'Qualifying information', 'N'),
(210, '2', 'Source', 'Y'),
(210, '6', 'Linkage', 'N'),
(210, '8', 'Field link and sequence number', 'Y'),
(222, 'a', 'Key title', 'N'),
(222, 'b', 'Qualifying information', 'N'),
(222, '6', 'Linkage', 'N'),
(222, '8', 'Field link and sequence number', 'Y'),
(240, 'a', 'Uniform title', 'N'),
(240, 'd', 'Date of treaty signing', 'Y'),
(240, 'f', 'Date of a work', 'N'),
(240, 'g', 'Miscellaneous information', 'N'),
(240, 'h', 'Medium', 'N'),
(240, 'k', 'Form subheading', 'Y'),
(240, 'l', 'Language of a work', 'N'),
(240, 'm', 'Medium of performance for music', 'Y'),
(240, 'n', 'Number of part/section of a work', 'Y'),
(240, 'o', 'Arranged statement for music', 'N'),
(240, 'p', 'Name of part/section of a work', 'Y'),
(240, 'r', 'Key for music', 'N'),
(240, 's', 'Version', 'N'),
(240, '6', 'Linkage', 'N'),
(240, '8', 'Field link and sequence number', 'Y'),
(242, 'a', 'Title', 'N'),
(242, 'b', 'Remainder of title', 'N'),
(242, 'c', 'Statement of responsibility, etc.', 'N'),
(242, 'h', 'Medium', 'N'),
(242, 'n', 'Number of part/section of a work', 'Y'),
(242, 'p', 'Name of part/section of a work', 'Y'),
(242, 'y', 'Language code of translated title', 'N'),
(242, '6', 'Linkage', 'N'),
(242, '8', 'Field link and sequence number', 'Y'),
(243, 'a', 'Uniform title', 'N'),
(243, 'd', 'Date of treaty signing', 'Y'),
(243, 'f', 'Date of a work', 'N'),
(243, 'g', 'Miscellaneous information', 'N'),
(243, 'h', 'Medium', 'N'),
(243, 'k', 'Form subheading', 'Y'),
(243, 'l', 'Language of a work', 'N'),
(243, 'm', 'Medium of performance for music', 'N'),
(243, 'n', 'Number of part/section of a work', 'Y'),
(243, 'o', 'Arranged statement for music', 'N'),
(243, 'p', 'Name of part/section of a work', 'Y'),
(243, 'r', 'Key for music', 'N'),
(243, 's', 'Version', 'N'),
(243, '6', 'Linkage', 'N'),
(243, '8', 'Field link and sequence number', 'Y'),
(245, 'a', 'Title', 'N'),
(245, 'b', 'Remainder of title', 'N'),
(245, 'c', 'Statement of responsibility, etc.', 'N'),
(245, 'f', 'Inclusive dates', 'N'),
(245, 'g', 'Bulk dates', 'N'),
(245, 'h', 'Medium', 'N'),
(245, 'k', 'Form', 'Y'),
(245, 'n', 'Number of part/section of a work', 'Y'),
(245, 'p', 'Name of part/section of a work', 'Y'),
(245, 's', 'Version', 'N'),
(245, '6', 'Linkage', 'N'),
(245, '8', 'Field link and sequence number', 'Y'),
(246, 'a', 'Title proper/short title', 'N'),
(246, 'b', 'Remainder of title', 'N'),
(246, 'f', 'Date or sequential designation', 'N'),
(246, 'g', 'Miscellaneous information', 'N'),
(246, 'h', 'Medium', 'N'),
(246, 'i', 'Display text', 'N'),
(246, 'n', 'Number of part/section of a work', 'Y'),
(246, 'p', 'Name of part/section of a work', 'Y'),
(246, '5', 'Institution to which field applies', 'N'),
(246, '6', 'Linkage', 'N'),
(246, '8', 'Field link and sequence number', 'Y'),
(247, 'a', 'Title proper/short title', 'N'),
(247, 'b', 'Remainder of title', 'N'),
(247, 'f', 'Date or sequential designation', 'N'),
(247, 'g', 'Miscellaneous information', 'N'),
(247, 'h', 'Medium', 'N'),
(247, 'n', 'Number of part/section of a work', 'Y'),
(247, 'p', 'Name of part/section of a work', 'Y'),
(247, 'x', 'International Standard Serial Number', 'N'),
(247, '6', 'Linkage', 'N'),
(247, '8', 'Field link and sequence number', 'Y'),
(250, 'a', 'Edition statement', 'N'),
(250, 'b', 'Remainder of edition statement', 'N'),
(250, '6', 'Linkage', 'N'),
(250, '8', 'Field link and sequence number', 'Y'),
(254, 'a', 'Musical presentation statement', 'N'),
(254, '6', 'Linkage', 'N'),
(254, '8', 'Field link and sequence number', 'Y'),
(255, 'a', 'Statement of scale', 'N'),
(255, 'b', 'Statement of projection', 'N'),
(255, 'c', 'Statement of coordinates', 'N'),
(255, 'd', 'Statement of zone', 'N'),
(255, 'e', 'Statement of equinox', 'N'),
(255, 'f', 'Outer G-ring coordinate pairs', 'N'),
(255, 'g', 'Exclusion G-ring coordinate pairs', 'N'),
(255, '6', 'Linkage', 'N'),
(255, '8', 'Field link and sequence number', 'Y'),
(256, 'a', 'Computer file characteristics', 'N'),
(256, '6', 'Linkage', 'N'),
(256, '8', 'Field link and sequence number', 'Y'),
(257, 'a', 'Country of producing entity', 'N'),
(257, '6', 'Linkage', 'N'),
(257, '8', 'Field link and sequence number', 'Y'),
(260, 'a', 'Place of publication, distribution, etc.', 'Y'),
(260, 'b', 'Name of publisher, distributor, etc.', 'Y'),
(260, 'c', 'Date of publication, distribution, etc.', 'Y'),
(260, 'd', 'Plates of publisher\'s number for music (Pre-AACR 2)  [LOCAL]', 'Y'),
(260, 'e', 'Place of manufacture', 'N'),
(260, 'f', 'Manufacturer', 'N'),
(260, 'g', 'Date of manufacture', 'N'),
(260, '3', 'Materials specified', 'N'),
(260, '8', 'Field link and sequence number', 'Y'),
(261, 'a', 'Producing company', 'Y'),
(261, 'b', 'Releasing company (primary distributor)', 'Y'),
(261, 'd', 'Date of production, release, etc.', 'Y'),
(261, 'e', 'Contractual producer', 'Y'),
(261, 'f', 'Place of production, release, etc.', 'Y'),
(261, '6', 'Linkage', 'N'),
(261, '8', 'Field link and sequence number', 'Y'),
(262, 'a', 'Place of production, release, etc.', 'N'),
(262, 'b', 'Publisher or trade name', 'N'),
(262, 'c', 'Date of production, release, etc.', 'N'),
(262, 'k', 'Serial identification', 'N'),
(262, 'l', 'Matrix and/or take number', 'N'),
(262, '6', 'Linkage', 'N'),
(262, '8', 'Field link and sequence number', 'Y'),
(263, 'a', 'Projected publication date', 'N'),
(263, '6', 'Linkage', 'N'),
(263, '8', 'Field link and sequence number', 'Y'),
(270, 'a', 'Address', 'Y'),
(270, 'b', 'City', 'N'),
(270, 'c', 'State or province', 'N'),
(270, 'd', 'Country', 'N'),
(270, 'e', 'Postal code', 'N'),
(270, 'f', 'Terms preceding attention name', 'N'),
(270, 'g', 'Attention name', 'N'),
(270, 'h', 'Attention position', 'N'),
(270, 'i', 'Type of address', 'N'),
(270, 'j', 'Specialized telephone number', 'Y'),
(270, 'k', 'Telephone number', 'Y'),
(270, 'l', 'Fax number', 'Y'),
(270, 'm', 'Electronic mail address', 'Y'),
(270, 'n', 'TDD or TTY number', 'Y'),
(270, 'p', 'Contact person', 'Y'),
(270, 'q', 'Title of contact person', 'Y'),
(270, 'r', 'Hours', 'Y'),
(270, 'z', 'Public note', 'Y'),
(270, '4', 'Relator code', 'Y'),
(270, '6', 'Linkage', 'N'),
(270, '8', 'Field link and sequence number', 'Y'),
(300, 'a', 'Extent', 'Y'),
(300, 'b', 'Other physical details', 'N'),
(300, 'c', 'Dimensions', 'Y'),
(300, 'e', 'Accompanying material', 'N'),
(300, 'f', 'Type of unit', 'Y'),
(300, 'g', 'Size of unit', 'Y'),
(300, '3', 'Materials specified', 'N'),
(300, '6', 'Linkage', 'N'),
(300, '8', 'Field link and sequence number', 'Y'),
(306, 'a', 'Playing time', 'Y'),
(306, '6', 'Linkage', 'N'),
(306, '8', 'Field link and sequence number', 'Y'),
(307, 'a', 'Hours', 'N'),
(307, 'b', 'Additional information', 'N'),
(307, '6', 'Linkage', 'N'),
(307, '8', 'Field link and sequence number', 'Y'),
(310, 'a', 'Current publication frequency', 'N'),
(310, 'b', 'Date of current publication frequency', 'N'),
(310, '6', 'Linkage', 'N'),
(310, '8', 'Field link and sequence number', 'Y'),
(340, 'a', 'Material base and configuration', 'Y'),
(340, 'b', 'Dimensions', 'Y'),
(340, 'c', 'Materials applied to surface', 'Y'),
(340, 'd', 'Information recording technique', 'Y'),
(340, 'e', 'Support', 'Y'),
(340, 'f', 'Production rate/ratio', 'Y'),
(340, 'h', 'Location within medium', 'Y'),
(340, 'i', 'Technical specifications of medium', 'Y'),
(340, '3', 'Materials specified', 'N'),
(340, '6', 'Linkage', 'N'),
(340, '8', 'Field link and sequence number', 'Y'),
(342, 'a', 'Name', 'N'),
(342, 'b', 'Coordinate or distance units', 'N'),
(342, 'c', 'Latitude resolution', 'N'),
(342, 'd', 'Longitude resolution', 'N'),
(342, 'e', 'Standard parallel or oblique line latitude', 'Y'),
(342, 'f', 'Oblique line longitude', 'Y'),
(342, 'g', 'Longitude of central meridian or projection center', 'N'),
(342, 'h', 'Latitude of projection origin or projection center', 'N'),
(342, 'i', 'False easting', 'N'),
(342, 'j', 'False northing', 'N'),
(342, 'k', 'Scale factor', 'N'),
(342, 'l', 'Height of perspective point above surface', 'N'),
(342, 'm', 'Azimuthal angle', 'N'),
(342, 'n', 'Azimuth measure point longitude or straight vertical', 'N'),
(342, 'o', 'Landsat number and path number', 'N'),
(342, 'p', 'Zone identifier', 'N'),
(342, 'q', 'Ellipsoid name', 'N'),
(342, 'r', 'Semi-major axis', 'N'),
(342, 's', 'Denominator of flattening ratio', 'N'),
(342, 't', 'Vertical resolution', 'N'),
(342, 'u', 'Vertical encoding method', 'N'),
(342, 'v', 'Local planar, local, or other projection or grid description', 'N'),
(342, 'w', 'Local planar or local georeference information', 'N'),
(342, '2', 'Reference method used', 'N'),
(342, '6', 'Linkage', 'N'),
(342, '8', 'Field link and sequence number', 'Y'),
(343, 'a', 'Planar coordinate encoding method', 'N'),
(343, 'b', 'Planar distance units', 'N'),
(343, 'c', 'Abscissa resolution', 'N'),
(343, 'd', 'Ordinate resolution', 'N'),
(343, 'e', 'Distance resolution', 'N'),
(343, 'f', 'Bearing resolution', 'N'),
(343, 'g', 'Bearing units', 'N'),
(343, 'h', 'Bearing reference direction', 'N'),
(343, 'i', 'Bearing reference meridian', 'N'),
(343, '6', 'Linkage', 'N'),
(343, '8', 'Field link and sequence number', 'Y'),
(351, 'a', 'Organization', 'Y'),
(351, 'b', 'Arrangement', 'Y'),
(351, 'c', 'Hierarchical level', 'N'),
(351, '3', 'Materials specified', 'N'),
(351, '6', 'Linkage', 'N'),
(351, '8', 'Field link and sequence number', 'Y'),
(352, 'a', 'Direct reference method', 'N'),
(352, 'b', 'Object type', 'Y'),
(352, 'c', 'Object count', 'Y'),
(352, 'd', 'Row count', 'N'),
(352, 'e', 'Column count', 'N'),
(352, 'f', 'Vertical count', 'N'),
(352, 'g', 'VPF topology level', 'N'),
(352, 'i', 'Indirect reference description', 'N'),
(352, '6', 'Linkage', 'N'),
(352, '8', 'Field link and sequence number', 'Y'),
(355, 'a', 'Security classification', 'N'),
(355, 'b', 'Handling instructions', 'Y'),
(355, 'c', 'External dissemination information', 'Y'),
(355, 'd', 'Downgrading or declassification event', 'N'),
(355, 'e', 'Classification system', 'N'),
(355, 'f', 'Country of origin code', 'N'),
(355, 'g', 'Downgrading date', 'N'),
(355, 'h', 'Declassification date', 'N'),
(355, 'j', 'Authorization', 'Y'),
(355, '6', 'Linkage', 'N'),
(355, '8', 'Field link and sequence number', 'Y'),
(362, 'a', 'Dates of publication and/or sequential designation', 'N'),
(362, 'z', 'Source of information', 'N'),
(362, '6', 'Linkage', 'N'),
(362, '8', 'Field link and sequence number', 'Y'),
(400, 'a', 'Personal name', 'N'),
(400, 'b', 'Numeration', 'N'),
(400, 'c', 'Titles and other words associated with a name', 'Y'),
(400, 'd', 'Dates associated with a name', 'N'),
(400, 'e', 'Relator term', 'Y'),
(400, 'f', 'Date of a work', 'N'),
(400, 'g', 'Miscellaneous information', 'N'),
(400, 'k', 'Form subheading', 'Y'),
(400, 'l', 'Language of a work', 'N'),
(400, 'n', 'Number of part/section of a work', 'Y'),
(400, 'p', 'Name of part/section of a work', 'Y'),
(400, 't', 'Title of a work', 'N'),
(400, 'u', 'Affiliation', 'N'),
(400, 'v', 'Volume number/sequential designation', 'N'),
(400, 'x', 'International Standard Serial Number', 'N'),
(400, '4', 'Relator code', 'Y'),
(400, '6', 'Linkage', 'N'),
(400, '8', 'Field link and sequence number', 'Y'),
(410, 'a', 'Corporate name or jurisdiction name as entry element', 'N'),
(410, 'b', 'Subordinate unit', 'Y'),
(410, 'c', 'Location of meeting', 'N'),
(410, 'd', 'Date of meeting or treaty signing', 'Y'),
(410, 'e', 'Relator term', 'Y'),
(410, 'f', 'Date of a work', 'N'),
(410, 'g', 'Miscellaneous information', 'N'),
(410, 'k', 'Form subheading', 'Y'),
(410, 'l', 'Language of a work', 'N'),
(410, 'n', 'Number of part/section/meeting', 'Y'),
(410, 'p', 'Name of part/section of a work', 'Y'),
(410, 't', 'Title of a work', 'N'),
(410, 'u', 'Affiliation', 'N'),
(410, 'v', 'Volume number/sequential designation', 'N'),
(410, 'x', 'International Standard Serial Number', 'N'),
(410, '4', 'Relator code', 'Y'),
(410, '6', 'Linkage', 'N'),
(410, '8', 'Field link and sequence number', 'Y'),
(411, 'a', 'Meeting name or jurisdiction name as entry element', 'N'),
(411, 'c', 'Location of meeting', 'N'),
(411, 'd', 'Date of meeting', 'N'),
(411, 'e', 'Subordinate unit', 'Y'),
(411, 'f', 'Date of a work', 'N'),
(411, 'g', 'Miscellaneous information', 'N'),
(411, 'k', 'Form subheading', 'Y'),
(411, 'l', 'Language of a work', 'N'),
(411, 'n', 'Number of part/section/meeting', 'Y'),
(411, 'p', 'Name of part/section of a work', 'Y'),
(411, 'q', 'Name of meeting following jurisdiction name entry element', 'N'),
(411, 't', 'Title of a work', 'N'),
(411, 'u', 'Affiliation', 'N'),
(411, 'v', 'Volume number/sequential designation', 'N'),
(411, 'x', 'International Standard Serial Number', 'N'),
(411, '4', 'Relator code', 'Y'),
(411, '6', 'Linkage', 'N'),
(411, '8', 'Field link and sequence number', 'Y'),
(440, 'a', 'Title', 'N'),
(440, 'n', 'Number of part/section of a work', 'Y'),
(440, 'p', 'Name of part/section of a work', 'Y'),
(440, 'v', 'Volume number/sequential designation', 'N'),
(440, 'x', 'International Standard Serial Number', 'N'),
(440, '6', 'Linkage', 'N'),
(440, '8', 'Field link and sequence number', 'Y'),
(490, 'a', 'Series statement', 'Y'),
(490, 'l', 'Library of Congress call number', 'N'),
(490, 'v', 'Volume number/sequential designation', 'Y'),
(490, 'x', 'International Standard Serial Number', 'N'),
(490, '6', 'Linkage', 'N'),
(490, '8', 'Field link and sequence number', 'Y'),
(500, 'a', 'General note', 'N'),
(500, '3', 'Materials specified', 'N'),
(500, '5', 'Institution to which field applies', 'N'),
(500, '6', 'Linkage', 'N'),
(500, '8', 'Field link and sequence number', 'Y'),
(501, 'a', 'With note', 'N'),
(501, '5', 'Institution to which field applies', 'N'),
(501, '6', 'Linkage', 'N'),
(501, '8', 'Field link and sequence number', 'Y'),
(502, 'a', 'Dissertation note', 'N'),
(502, '6', 'Linkage', 'N'),
(502, '8', 'Field link and sequence number', 'Y'),
(504, 'a', 'Bibliography, etc. note', 'N'),
(504, 'b', 'Number of references', 'N'),
(504, '6', 'Linkage', 'N'),
(504, '8', 'Field link and sequence number', 'Y'),
(505, 'a', 'Formatted contents note', 'N'),
(505, 'g', 'Miscellaneous information', 'Y'),
(505, 'r', 'Statement of responsibility', 'Y'),
(505, 't', 'Title', 'Y'),
(505, 'u', 'Uniform Resource Identifier', 'Y'),
(505, '6', 'Linkage', 'N'),
(505, '8', 'Field link and sequence number', 'Y'),
(506, 'a', 'Terms governing access', 'N'),
(506, 'b', 'Jurisdiction', 'Y'),
(506, 'c', 'Physical access provisions', 'Y'),
(506, 'd', 'Authorized users', 'Y'),
(506, 'e', 'Authorization', 'Y'),
(506, '3', 'Materials specified', 'N'),
(506, '5', 'Institution to which field applies', 'N'),
(506, '6', 'Linkage', 'N'),
(506, '8', 'Field link and sequence number', 'Y'),
(507, 'a', 'Representative fraction of scale note', 'N'),
(507, 'b', 'Remainder of scale note', 'N'),
(507, '6', 'Linkage', 'N'),
(507, '8', 'Field link and sequence number', 'Y'),
(508, 'a', 'Creation/production credits note', 'N'),
(508, '6', 'Linkage', 'N'),
(508, '8', 'Field link and sequence number', 'Y'),
(510, 'a', 'Name of source', 'N'),
(510, 'b', 'Coverage of source', 'N'),
(510, 'c', 'Location within source', 'N'),
(510, 'x', 'International Standard Serial Number', 'N'),
(510, '3', 'Materials specified', 'N'),
(510, '6', 'Linkage', 'N'),
(510, '8', 'Field link and sequence number', 'Y'),
(511, 'a', 'Participant or performer note', 'N'),
(511, '6', 'Linkage', 'N'),
(511, '8', 'Field link and sequence number', 'Y'),
(513, 'a', 'Type of report', 'N'),
(513, 'b', 'Period covered', 'N'),
(513, '6', 'Linkage', 'N'),
(513, '8', 'Field link and sequence number', 'Y'),
(514, 'a', 'Attribute accuracy report', 'N'),
(514, 'b', 'Attribute accuracy value', 'Y'),
(514, 'c', 'Attribute accuracy explanation', 'Y'),
(514, 'd', 'Logical consistency report', 'Y'),
(514, 'e', 'Completeness report', 'N'),
(514, 'f', 'Horizontal position accuracy report', 'N'),
(514, 'g', 'Horizontal position accuracy value', 'Y'),
(514, 'h', 'Horizontal position accuracy explanation', 'Y'),
(514, 'i', 'Vertical positional accuracy report', 'N'),
(514, 'j', 'Vertical positional accuracy value', 'Y'),
(514, 'k', 'Vertical positional accuracy explanation', 'Y'),
(514, 'm', 'Cloud cover', 'N'),
(514, 'u', 'Uniform Resource Identifier', 'Y'),
(514, 'z', 'Display note', 'Y'),
(514, '6', 'Linkage', 'N'),
(514, '8', 'Field link and sequence number', 'Y'),
(515, 'a', 'Numbering peculiarities note', 'N'),
(515, '6', 'Linkage', 'N'),
(515, '8', 'Field link and sequence number', 'Y'),
(516, 'a', 'Type of computer file or data note', 'N'),
(516, '6', 'Linkage', 'N'),
(516, '8', 'Field link and sequence number', 'Y'),
(518, 'a', 'Date/time and place of an event note', 'N'),
(518, '3', 'Materials specified', 'N'),
(518, '6', 'Linkage', 'N'),
(518, '8', 'Field link and sequence number', 'Y'),
(520, 'a', 'Summary, etc. note', 'N'),
(520, 'b', 'Expansion of summary note', 'N'),
(520, 'u', 'Uniform Resource Identifier', 'Y'),
(520, '3', 'Materials specified', 'N'),
(520, '6', 'Linkage', 'N'),
(520, '8', 'Field link and sequence number', 'Y'),
(521, 'a', 'Target audience note', 'Y'),
(521, 'b', 'Source', 'N'),
(521, '3', 'Materials specified', 'N'),
(521, '6', 'Linkage', 'N'),
(521, '8', 'Field link and sequence number', 'Y'),
(522, 'a', 'Geographic coverage note', 'N'),
(522, '6', 'Linkage', 'N'),
(522, '8', 'Field link and sequence number', 'Y'),
(524, 'a', 'Preferred citation of described materials note', 'N'),
(524, '2', 'Source of schema used', 'N'),
(524, '3', 'Materials specified', 'N'),
(524, '6', 'Linkage', 'N'),
(524, '8', 'Field link and sequence number', 'Y'),
(525, 'a', 'Supplement note', 'N'),
(525, '6', 'Linkage', 'N'),
(525, '8', 'Field link and sequence number', 'Y'),
(526, 'a', 'Program name', 'N'),
(526, 'b', 'Interest level', 'N'),
(526, 'c', 'Reading level', 'N'),
(526, 'd', 'Title point value', 'N'),
(526, 'i', 'Display text', 'N'),
(526, 'x', 'Nonpublic note', 'Y'),
(526, 'z', 'Public note', 'Y'),
(526, '5', 'Institution to which field applies', 'N'),
(526, '6', 'Linkage', 'N'),
(526, '8', 'Field link and sequence number', 'Y'),
(530, 'a', 'Additional physical form available note', 'N'),
(530, 'b', 'Availability source', 'N'),
(530, 'c', 'Availability conditions', 'N'),
(530, 'd', 'Order number', 'N'),
(530, 'u', 'Uniform Resource Identifier', 'Y'),
(530, '3', 'Materials specified', 'N'),
(530, '6', 'Linkage', 'N'),
(530, '8', 'Field link and sequence number', 'Y'),
(533, 'a', 'Type of reproduction', 'N'),
(533, 'b', 'Place of reproduction', 'Y'),
(533, 'c', 'Agency responsible for reproduction', 'Y'),
(533, 'd', 'Date of reproduction', 'N'),
(533, 'e', 'Physical description of reproduction', 'N'),
(533, 'f', 'Series statement of reproduction', 'Y'),
(533, 'm', 'Dates and/or sequential designation of issues reproduced', 'Y'),
(533, 'n', 'Note about reproduction', 'Y'),
(533, '3', 'Materials specified', 'N'),
(533, '6', 'Linkage', 'N'),
(533, '7', 'Fixed-length data elements of reproduction', 'N'),
(533, '8', 'Field link and sequence number', 'Y'),
(534, 'a', 'Main entry of original', 'N'),
(534, 'b', 'Edition statement of original', 'N'),
(534, 'c', 'Publication, distribution, etc. of original', 'N'),
(534, 'e', 'Physical description, etc. of original', 'N'),
(534, 'f', 'Series statement of original', 'Y'),
(534, 'k', 'Key title of original', 'Y'),
(534, 'l', 'Location of original', 'N'),
(534, 'm', 'Material specific details', 'N'),
(534, 'n', 'Note about original', 'Y'),
(534, 'p', 'Introductory phrase', 'N'),
(534, 't', 'Title statement of original', 'N'),
(534, 'x', 'International Standard Serial Number', 'Y'),
(534, 'z', 'International Standard Book Number', 'Y'),
(534, '6', 'Linkage', 'N'),
(534, '8', 'Field link and sequence number', 'Y'),
(535, 'a', 'Custodian', 'N'),
(535, 'b', 'Postal address', 'Y'),
(535, 'c', 'Country', 'Y'),
(535, 'd', 'Telecommunications address', 'Y'),
(535, 'g', 'Repository location code', 'N'),
(535, '3', 'Materials specified', 'N'),
(535, '6', 'Linkage', 'N'),
(535, '8', 'Field link and sequence number', 'Y'),
(536, 'a', 'Text of note', 'N'),
(536, 'b', 'Contract number', 'Y'),
(536, 'c', 'Grant number', 'Y'),
(536, 'd', 'Undifferentiated number', 'Y'),
(536, 'e', 'Program element number', 'Y'),
(536, 'f', 'Project number', 'Y'),
(536, 'g', 'Task number', 'Y'),
(536, 'h', 'Work unit number', 'Y'),
(536, '6', 'Linkage', 'N'),
(536, '8', 'Field link and sequence number', 'Y'),
(538, 'a', 'System details note', 'N'),
(538, '6', 'Linkage', 'N'),
(538, '8', 'Field link and sequence number', 'Y'),
(540, 'a', 'Terms governing use and reproduction', 'N'),
(540, 'b', 'Jurisdiction', 'N'),
(540, 'c', 'Authorization', 'N'),
(540, 'd', 'Authorized users', 'N'),
(540, '3', 'Materials specified', 'N'),
(540, '5', 'Institution to which field applies', 'N'),
(540, '6', 'Linkage', 'N'),
(540, '8', 'Field link and sequence number', 'Y'),
(541, 'a', 'Source of acquisition', 'N'),
(541, 'b', 'Address', 'N'),
(541, 'c', 'Method of acquisition', 'N'),
(541, 'd', 'Date of acquisition', 'N'),
(541, 'e', 'Accession number', 'N'),
(541, 'f', 'Owner', 'N'),
(541, 'h', 'Purchase price', 'N'),
(541, 'n', 'Extent', 'Y'),
(541, 'o', 'Type of unit', 'Y'),
(541, '3', 'Materials specified', 'N'),
(541, '5', 'Institution to which field applies', 'N'),
(541, '6', 'Linkage', 'N'),
(541, '8', 'Field link and sequence number', 'Y'),
(544, 'a', 'Custodian', 'Y'),
(544, 'b', 'Address', 'Y'),
(544, 'c', 'Country', 'Y'),
(544, 'd', 'Title', 'Y'),
(544, 'e', 'Provenance', 'Y'),
(544, 'n', 'Note', 'Y'),
(544, '3', 'Materials specified', 'N'),
(544, '6', 'Linkage', 'N'),
(544, '8', 'Field link and sequence number', 'Y'),
(545, 'a', 'Biographical or historical note', 'N'),
(545, 'b', 'Expansion', 'N'),
(545, 'u', 'Uniform Resource Identifier', 'Y'),
(545, '6', 'Linkage', 'N'),
(545, '8', 'Field link and sequence number', 'Y'),
(546, 'a', 'Language note', 'N'),
(546, 'b', 'Information code or alphabet', 'Y'),
(546, '3', 'Materials specified', 'N'),
(546, '6', 'Linkage', 'N'),
(546, '8', 'Field link and sequence number', 'Y'),
(547, 'a', 'Former title complexity note', 'N'),
(547, '6', 'Linkage', 'N'),
(547, '8', 'Field link and sequence number', 'Y'),
(550, 'a', 'Issuing body note', 'N'),
(550, '6', 'Linkage', 'N'),
(550, '8', 'Field link and sequence number', 'Y'),
(552, 'a', 'Entity type label', 'N'),
(552, 'b', 'Entity type definition and source', 'N'),
(552, 'c', 'Attribute label', 'N'),
(552, 'd', 'Attribute definition and source', 'N'),
(552, 'e', 'Enumerated domain value', 'Y'),
(552, 'f', 'Enumerated domain value definition and source', 'Y'),
(552, 'g', 'Range domain minimum and maximum', 'N'),
(552, 'h', 'Codeset name and source', 'N'),
(552, 'i', 'Unrepresentable domain', 'N'),
(552, 'j', 'Attribute units of measurement and resolution', 'N'),
(552, 'k', 'Beginning date and ending date of attribute values', 'N'),
(552, 'l', 'Attribute value accuracy', 'N'),
(552, 'm', 'Attribute value accuracy explanation', 'N'),
(552, 'n', 'Attribute measurement frequency', 'N'),
(552, 'o', 'Entity and attribute overview', 'Y'),
(552, 'p', 'Entity and attribute detail citation', 'Y'),
(552, 'u', 'Uniform Resource Identifier', 'Y'),
(552, 'z', 'Display note', 'Y'),
(552, '6', 'Linkage', 'N'),
(552, '8', 'Field link and sequence number', 'Y'),
(555, 'a', 'Cumulative index/finding aids note', 'N'),
(555, 'b', 'Availability source', 'Y'),
(555, 'c', 'Degree of control', 'N'),
(555, 'd', 'Bibliographic reference', 'N'),
(555, 'u', 'Uniform Resource Identifier', 'Y'),
(555, '3', 'Materials specified', 'N'),
(555, '6', 'Linkage', 'N'),
(555, '8', 'Field link and sequence number', 'Y'),
(556, 'a', 'Information about documentation note', 'N'),
(556, 'z', 'International Standard Book Number', 'Y'),
(556, '6', 'Linkage', 'N'),
(556, '8', 'Field link and sequence number', 'Y'),
(561, 'a', 'History', 'N'),
(561, '3', 'Materials specified', 'N'),
(561, '5', 'Institution to which field applies', 'N'),
(561, '6', 'Linkage', 'N'),
(561, '8', 'Field link and sequence number', 'Y'),
(562, 'a', 'Identifying markings', 'Y'),
(562, 'b', 'Copy identification', 'Y'),
(562, 'c', 'Version identification', 'Y'),
(562, 'd', 'Presentation format', 'Y'),
(562, 'e', 'Number of copies', 'Y'),
(562, '3', 'Materials specified', 'N'),
(562, '5', 'Institution to which field applies', 'N'),
(562, '6', 'Linkage', 'N'),
(562, '8', 'Field link and sequence number', 'Y'),
(565, 'a', 'Number of cases/variables', 'N'),
(565, 'b', 'Name of variable', 'Y'),
(565, 'c', 'Unit of analysis', 'Y'),
(565, 'd', 'Universe of data', 'Y'),
(565, 'e', 'Filing scheme or code', 'Y'),
(565, '3', 'Materials specified', 'N'),
(565, '6', 'Linkage', 'N'),
(565, '8', 'Field link and sequence number', 'Y'),
(567, 'a', 'Methodology note', 'N'),
(567, '6', 'Linkage', 'N'),
(567, '8', 'Field link and sequence number', 'Y'),
(580, 'a', 'Linking entry complexity note', 'N'),
(580, '6', 'Linkage', 'N'),
(580, '8', 'Field link and sequence number', 'Y'),
(581, 'a', 'Publications about described materials note', 'N'),
(581, 'z', 'International Standard Book Number', 'Y'),
(581, '3', 'Materials specified', 'N'),
(581, '6', 'Linkage', 'N'),
(581, '8', 'Field link and sequence number', 'Y'),
(583, 'a', 'Action', 'N'),
(583, 'b', 'Action identification', 'Y'),
(583, 'c', 'Time/date of action', 'Y'),
(583, 'd', 'Action interval', 'Y'),
(583, 'e', 'Contingency for action', 'Y'),
(583, 'f', 'Authorization', 'Y'),
(583, 'h', 'Jurisdiction', 'Y'),
(583, 'i', 'Method of action', 'Y'),
(583, 'j', 'Site of action', 'Y'),
(583, 'k', 'Action agent', 'Y'),
(583, 'l', 'Status', 'Y'),
(583, 'n', 'Extent', 'Y'),
(583, 'o', 'Type of unit', 'Y'),
(583, 'u', 'Uniform Resource Identifier', 'Y'),
(583, 'x', 'Nonpublic note', 'Y'),
(583, 'z', 'Public note', 'Y'),
(583, '2', 'Source of term', 'N'),
(583, '3', 'Materials specified', 'N'),
(583, '5', 'Institution to which field applies', 'N'),
(583, '6', 'Linkage', 'N'),
(583, '8', 'Field link and sequence number', 'Y'),
(584, 'a', 'Accumulation', 'Y'),
(584, 'b', 'Frequency of use', 'Y'),
(584, '3', 'Materials specified', 'N'),
(584, '5', 'Institution to which field applies', 'N'),
(584, '6', 'Linkage', 'N'),
(584, '8', 'Field link and sequence number', 'Y'),
(585, 'a', 'Exhibitions note', 'N'),
(585, '3', 'Materials specified', 'N'),
(585, '5', 'Institution to which field applies', 'N'),
(585, '6', 'Linkage', 'N'),
(585, '8', 'Field link and sequence number', 'Y'),
(586, 'a', 'Awards note', 'N'),
(586, '3', 'Materials specified', 'N'),
(586, '6', 'Linkage', 'N'),
(586, '8', 'Field link and sequence number', 'Y'),
(600, 'a', 'Personal name', 'N'),
(600, 'b', 'Numeration', 'N'),
(600, 'c', 'Titles and other words associated with a name', 'Y'),
(600, 'd', 'Dates associated with a name', 'N'),
(600, 'e', 'Relator term', 'Y'),
(600, 'f', 'Date of a work', 'N'),
(600, 'g', 'Miscellaneous information', 'N'),
(600, 'h', 'Medium', 'N'),
(600, 'k', 'Form subheading', 'Y'),
(600, 'j', 'Attribution qualifier', 'Y'),
(600, 'l', 'Language of a work', 'N'),
(600, 'm', 'Medium of performance for music', 'Y'),
(600, 'n', 'Number of part/section of a work', 'Y'),
(600, 'o', 'Arranged statement for music', 'N'),
(600, 'p', 'Name of part/section of a work', 'Y'),
(600, 'q', 'Fuller form of name', 'N'),
(600, 'r', 'Key for music', 'N'),
(600, 's', 'Version', 'N'),
(600, 't', 'Title of a work', 'N'),
(600, 'u', 'Affiliation', 'N'),
(600, 'v', 'Form subdivision', 'Y'),
(600, 'x', 'General subdivision', 'Y'),
(600, 'y', 'Chronological subdivision', 'Y'),
(600, 'z', 'Geographic subdivision', 'Y'),
(600, '2', 'Source of heading or term', 'N'),
(600, '3', 'Materials specified', 'N'),
(600, '4', 'Relator code', 'Y'),
(600, '6', 'Linkage', 'N'),
(600, '8', 'Field link and sequence number', 'Y'),
(610, 'a', 'Corporate name or jurisdiction name as entry element', 'N'),
(610, 'b', 'Subordinate unit', 'Y'),
(610, 'c', 'Location of meeting', 'N'),
(610, 'd', 'Date of meeting or treaty signing', 'Y'),
(610, 'e', 'Relator term', 'Y'),
(610, 'f', 'Date of a work', 'N'),
(610, 'g', 'Miscellaneous information', 'N'),
(610, 'h', 'Medium', 'N'),
(610, 'k', 'Form subheading', 'Y'),
(610, 'l', 'Language of a work', 'N'),
(610, 'm', 'Medium of performance for music', 'Y'),
(610, 'n', 'Number of part/section/meeting', 'Y'),
(610, 'o', 'Arranged statement for music', 'N'),
(610, 'p', 'Name of part/section of a work', 'Y'),
(610, 'r', 'Key for music', 'N'),
(610, 's', 'Version', 'N'),
(610, 't', 'Title of a work', 'N'),
(610, 'u', 'Affiliation', 'N'),
(610, 'v', 'Form subdivision', 'Y'),
(610, 'x', 'General subdivision', 'Y'),
(610, 'y', 'Chronological subdivision', 'Y'),
(610, 'z', 'Geographic subdivision', 'Y'),
(610, '2', 'Source of heading or term', 'N'),
(610, '3', 'Materials specified', 'N'),
(610, '4', 'Relator code', 'Y'),
(610, '6', 'Linkage', 'N'),
(610, '8', 'Field link and sequence number', 'Y'),
(611, 'a', 'Meeting name or jurisdiction name as entry element', 'N'),
(611, 'c', 'Location of meeting', 'N'),
(611, 'd', 'Date of meeting', 'N'),
(611, 'e', 'Subordinate unit', 'Y'),
(611, 'f', 'Date of a work', 'N'),
(611, 'g', 'Miscellaneous information', 'N'),
(611, 'h', 'Medium', 'N'),
(611, 'k', 'Form subheading', 'Y'),
(611, 'l', 'Language of a work', 'N'),
(611, 'n', 'Number of part/section/meeting', 'Y'),
(611, 'p', 'Name of part/section of a work', 'Y'),
(611, 'q', 'Name of meeting following jurisdiction name entry element', 'N'),
(611, 's', 'Version', 'N'),
(611, 't', 'Title of a work', 'N'),
(611, 'u', 'Affiliation', 'N'),
(611, 'v', 'Form subdivision', 'Y'),
(611, 'x', 'General subdivision', 'Y'),
(611, 'y', 'Chronological subdivision', 'Y'),
(611, 'z', 'Geographic subdivision', 'Y'),
(611, '2', 'Source of heading or term', 'N'),
(611, '3', 'Materials specified', 'N'),
(611, '4', 'Relator code', 'Y'),
(611, '6', 'Linkage', 'N'),
(611, '8', 'Field link and sequence number', 'Y'),
(630, 'a', 'Uniform title', 'N'),
(630, 'd', 'Date of treaty signing', 'Y'),
(630, 'f', 'Date of a work', 'N'),
(630, 'g', 'Miscellaneous information', 'N'),
(630, 'h', 'Medium', 'N'),
(630, 'k', 'Form subheading', 'Y'),
(630, 'l', 'Language of a work', 'N'),
(630, 'm', 'Medium of performance for music', 'Y'),
(630, 'n', 'Number of part/section of a work', 'Y'),
(630, 'o', 'Arranged statement for music', 'N'),
(630, 'p', 'Name of part/section of a work', 'Y'),
(630, 'r', 'Key for music', 'N'),
(630, 's', 'Version', 'N'),
(630, 't', 'Title of a work', 'N'),
(630, 'v', 'Form subdivision', 'Y'),
(630, 'x', 'General subdivision', 'Y'),
(630, 'y', 'Chronological subdivision', 'Y'),
(630, 'z', 'Geographic subdivision', 'Y'),
(630, '2', 'Source of heading or term', 'N'),
(630, '3', 'Materials specified', 'N'),
(630, '6', 'Linkage', 'N'),
(630, '8', 'Field link and sequence number', 'Y'),
(650, 'a', 'Topical term or geographic name as entry element', 'N'),
(650, 'b', 'Topical term following geographic name as entry element', 'N'),
(650, 'c', 'Location of event', 'N'),
(650, 'd', 'Active dates', 'N'),
(650, 'e', 'Relator term', 'N'),
(650, 'v', 'Form subdivision', 'Y'),
(650, 'x', 'General subdivision', 'Y'),
(650, 'y', 'Chronological subdivision', 'Y'),
(650, 'z', 'Geographic subdivision', 'Y'),
(650, '2', 'Source of heading or term', 'N'),
(650, '3', 'Materials specified', 'N'),
(650, '6', 'Linkage', 'N'),
(650, '8', 'Field link and sequence number', 'Y'),
(651, 'a', 'Geographic name', 'N'),
(651, 'v', 'Form subdivision', 'Y'),
(651, 'x', 'General subdivision', 'Y'),
(651, 'y', 'Chronological subdivision', 'Y'),
(651, 'z', 'Geographic subdivision', 'Y'),
(651, '2', 'Source of heading or term', 'N'),
(651, '3', 'Materials specified', 'N'),
(651, '6', 'Linkage', 'N'),
(651, '8', 'Field link and sequence number', 'Y'),
(653, 'a', 'Uncontrolled term', 'Y'),
(653, '6', 'Linkage', 'N'),
(653, '8', 'Field link and sequence number', 'Y'),
(654, 'a', 'Focus term', 'N'),
(654, 'b', 'Non-focus term', 'Y'),
(654, 'c', 'Facet/hierarchy designation', 'Y'),
(654, 'v', 'Form subdivision', 'Y'),
(654, 'y', 'Chronological subdivision', 'Y'),
(654, 'z', 'Geographic subdivision', 'Y'),
(654, '2', 'Source of heading or term', 'N'),
(654, '3', 'Materials specified', 'N'),
(654, '6', 'Linkage', 'N'),
(654, '8', 'Field link and sequence number', 'Y'),
(655, 'a', 'Genre/form data or focus term', 'N'),
(655, 'b', 'Non-focus term', 'Y'),
(655, 'c', 'Facet/hierarchy designation', 'Y'),
(655, 'v', 'Form subdivision', 'Y'),
(655, 'x', 'General subdivision', 'Y'),
(655, 'y', 'Chronological subdivision', 'Y'),
(655, 'z', 'Geographic subdivision', 'Y'),
(655, '2', 'Source of term', 'N'),
(655, '3', 'Materials specified', 'N'),
(655, '5', 'Institution to which field applies', 'N'),
(655, '6', 'Linkage', 'N'),
(655, '8', 'Field link and sequence number', 'Y'),
(656, 'a', 'Occupation', 'N'),
(656, 'k', 'Form', 'N'),
(656, 'v', 'Form subdivision', 'Y'),
(656, 'x', 'General subdivision', 'Y'),
(656, 'y', 'Chronological subdivision', 'Y'),
(656, 'z', 'Geographic subdivision', 'Y'),
(656, '2', 'Source of term', 'N'),
(656, '3', 'Materials specified', 'N'),
(656, '6', 'Linkage', 'N'),
(656, '8', 'Field link and sequence number', 'Y'),
(657, 'a', 'Function', 'N'),
(657, 'v', 'Form subdivision', 'Y'),
(657, 'x', 'General subdivision', 'Y'),
(657, 'y', 'Chronological subdivision', 'Y'),
(657, 'z', 'Geographic subdivision', 'Y'),
(657, '2', 'Source of term', 'N'),
(657, '3', 'Materials specified', 'N'),
(657, '6', 'Linkage', 'N'),
(657, '8', 'Field link and sequence number', 'Y'),
(658, 'a', 'Main curriculum objective', 'N'),
(658, 'b', 'Subordinate curriculum objective', 'Y'),
(658, 'c', 'Curriculum code', 'N'),
(658, 'd', 'Correlation factor', 'N'),
(658, '2', 'Source of term or code', 'N'),
(658, '6', 'Linkage', 'N'),
(658, '8', 'Field link and sequence number', 'Y'),
(700, 'a', 'Personal name', 'N'),
(700, 'b', 'Numeration', 'N'),
(700, 'c', 'Titles and other words associated with a name', 'Y'),
(700, 'd', 'Dates associated with a name', 'N'),
(700, 'e', 'Relator term', 'Y'),
(700, 'f', 'Date of a work', 'N'),
(700, 'g', 'Miscellaneous information', 'N'),
(700, 'h', 'Medium', 'N'),
(700, 'j', 'Attribution qualifier', 'Y'),
(700, 'k', 'Form subheading', 'Y'),
(700, 'l', 'Language of a work', 'N'),
(700, 'm', 'Medium of performance for music', 'Y'),
(700, 'n', 'Number of part/section of a work', 'Y'),
(700, 'o', 'Arranged statement for music', 'N'),
(700, 'p', 'Name of part/section of a work', 'Y'),
(700, 'q', 'Fuller form of name', 'N'),
(700, 'r', 'Key for music', 'N'),
(700, 's', 'Version', 'N'),
(700, 't', 'Title of a work', 'N'),
(700, 'u', 'Affiliation', 'N'),
(700, 'x', 'International Standard Serial Number', 'N'),
(700, '3', 'Materials specified', 'N'),
(700, '4', 'Relator code', 'Y'),
(700, '5', 'Institution to which field applies', 'N'),
(700, '6', 'Linkage', 'N'),
(700, '8', 'Field link and sequence number', 'Y'),
(710, 'a', 'Corporate name or jurisdiction name as entry element', 'N'),
(710, 'b', 'Subordinate unit', 'Y'),
(710, 'c', 'Location of meeting', 'N'),
(710, 'd', 'Date of meeting or treaty signing', 'Y'),
(710, 'e', 'Relator term', 'Y'),
(710, 'f', 'Date of a work', 'N'),
(710, 'g', 'Miscellaneous information', 'N'),
(710, 'h', 'Medium', 'N'),
(710, 'k', 'Form subheading', 'Y'),
(710, 'l', 'Language of a work', 'N'),
(710, 'm', 'Medium of performance for music', 'Y'),
(710, 'n', 'Number of part/section/meeting', 'Y'),
(710, 'o', 'Arranged statement for music', 'N'),
(710, 'p', 'Name of part/section of a work', 'Y'),
(710, 'r', 'Key for music', 'N'),
(710, 's', 'Version', 'N'),
(710, 't', 'Title of a work', 'N'),
(710, 'u', 'Affiliation', 'N'),
(710, 'x', 'International Standard Serial Number', 'N'),
(710, '3', 'Materials specified', 'N'),
(710, '4', 'Relator code', 'Y'),
(710, '5', 'Institution to which field applies', 'N'),
(710, '6', 'Linkage', 'N'),
(710, '8', 'Field link and sequence number', 'Y'),
(711, 'a', 'Meeting name or jurisdiction name as entry element', 'N'),
(711, 'c', 'Location of meeting', 'N'),
(711, 'd', 'Date of meeting', 'N'),
(711, 'e', 'Subordinate unit', 'Y'),
(711, 'f', 'Date of a work', 'N'),
(711, 'g', 'Miscellaneous information', 'N'),
(711, 'h', 'Medium', 'N'),
(711, 'k', 'Form subheading', 'Y'),
(711, 'l', 'Language of a work', 'N'),
(711, 'n', 'Number of part/section/meeting', 'Y'),
(711, 'p', 'Name of part/section of a work', 'Y'),
(711, 'q', 'Name of meeting following jurisdiction name entry element', 'N'),
(711, 's', 'Version', 'N'),
(711, 't', 'Title of a work', 'N'),
(711, 'u', 'Affiliation', 'N'),
(711, 'x', 'International Standard Serial Number', 'N'),
(711, '3', 'Materials specified', 'N'),
(711, '4', 'Relator code', 'Y'),
(711, '5', 'Institution to which field applies', 'N'),
(711, '6', 'Linkage', 'N'),
(711, '8', 'Field link and sequence number', 'Y'),
(720, 'a', 'Name', 'N'),
(720, 'e', 'Relator term', 'Y'),
(720, '4', 'Relator code', 'Y'),
(720, '6', 'Linkage', 'N'),
(720, '8', 'Field link and sequence number', 'Y'),
(730, 'a', 'Uniform title', 'N'),
(730, 'd', 'Date of treaty signing', 'Y'),
(730, 'f', 'Date of a work', 'N'),
(730, 'g', 'Miscellaneous information', 'N'),
(730, 'h', 'Medium', 'N'),
(730, 'k', 'Form subheading', 'Y'),
(730, 'l', 'Language of a work', 'N'),
(730, 'm', 'Medium of performance for music', 'Y'),
(730, 'n', 'Number of part/section of a work', 'Y'),
(730, 'o', 'Arranged statement for music', 'N'),
(730, 'p', 'Name of part/section of a work', 'Y'),
(730, 'r', 'Key for music', 'N'),
(730, 's', 'Version', 'N'),
(730, 't', 'Title of a work', 'N'),
(730, 'x', 'International Standard Serial Number', 'N'),
(730, '3', 'Materials specified', 'N'),
(730, '5', 'Institution to which field applies', 'N'),
(730, '6', 'Linkage', 'N'),
(730, '8', 'Field link and sequence number', 'Y'),
(740, 'a', 'Uncontrolled related/analytical title', 'N'),
(740, 'h', 'Medium', 'N'),
(740, 'n', 'Number of part/section of a work', 'Y'),
(740, 'p', 'Name of part/section of a work', 'Y'),
(740, '5', 'Institution to which field applies', 'N'),
(740, '6', 'Linkage', 'N'),
(740, '8', 'Field link and sequence number', 'Y'),
(752, 'a', 'Country', 'N'),
(752, 'b', 'State, province, territory', 'N'),
(752, 'c', 'County, region, islands area', 'N'),
(752, 'd', 'City', 'N'),
(752, '6', 'Linkage', 'N'),
(752, '8', 'Field link and sequence number', 'Y'),
(753, 'a', 'Make and model of machine', 'N'),
(753, 'b', 'Programming language', 'N'),
(753, 'c', 'Operating system', 'N'),
(753, '6', 'Linkage', 'N'),
(753, '8', 'Field link and sequence number', 'Y'),
(754, 'a', 'Taxonomic name', 'Y'),
(754, 'c', 'Taxonomic category', 'Y'),
(754, 'd', 'Common or alternative name', 'Y'),
(754, 'x', 'Non-public note', 'Y'),
(754, 'z', 'Public note', 'Y'),
(754, '2', 'Source of taxonomic identification', 'N'),
(754, '6', 'Linkage', 'N'),
(754, '8', 'Field link and sequence number', 'Y'),
(760, 'a', 'Main entry heading', 'N'),
(760, 'b', 'Edition', 'N'),
(760, 'c', 'Qualifying information', 'N'),
(760, 'd', 'Place, publisher, and date of publication', 'N'),
(760, 'g', 'Relationship information', 'Y'),
(760, 'h', 'Physical description', 'N'),
(760, 'i', 'Display text', 'N'),
(760, 'm', 'Material-specific details', 'N'),
(760, 'n', 'Note', 'Y'),
(760, 'o', 'Other item identifier', 'Y'),
(760, 's', 'Uniform title', 'N'),
(760, 't', 'Title', 'N'),
(760, 'w', 'Record control number', 'Y'),
(760, 'x', 'International Standard Serial Number', 'N'),
(760, 'y', 'CODEN designation', 'N'),
(760, '6', 'Linkage', 'N'),
(760, '7', 'Control subfield', 'N'),
(760, '8', 'Field link and sequence number', 'Y'),
(762, 'a', 'Main entry heading', 'N'),
(762, 'b', 'Edition', 'N'),
(762, 'c', 'Qualifying information', 'N'),
(762, 'd', 'Place, publisher, and date of publication', 'N'),
(762, 'g', 'Relationship information', 'Y'),
(762, 'h', 'Physical description', 'N'),
(762, 'i', 'Display text', 'N'),
(762, 'm', 'Material-specific details', 'N'),
(762, 'n', 'Note', 'Y'),
(762, 'o', 'Other item identifier', 'Y'),
(762, 's', 'Uniform title', 'N'),
(762, 't', 'Title', 'N'),
(762, 'w', 'Record control number', 'Y'),
(762, 'x', 'International Standard Serial Number', 'N'),
(762, 'y', 'CODEN designation', 'N'),
(762, '6', 'Linkage', 'N'),
(762, '7', 'Control subfield', 'N'),
(762, '8', 'Field link and sequence number', 'Y'),
(765, 'a', 'Main entry heading', 'N'),
(765, 'b', 'Edition', 'N'),
(765, 'c', 'Qualifying information', 'N'),
(765, 'd', 'Place, publisher, and date of publication', 'N'),
(765, 'g', 'Relationship information', 'Y');
INSERT INTO `usmarc_subfield_dm` (`tag`, `subfield_cd`, `description`, `repeatable_flg`) VALUES
(765, 'h', 'Physical description', 'N'),
(765, 'i', 'Display text', 'N'),
(765, 'k', 'Series data for related item', 'Y'),
(765, 'm', 'Material-specific details', 'N'),
(765, 'n', 'Note', 'Y'),
(765, 'o', 'Other item identifier', 'Y'),
(765, 'r', 'Report number', 'Y'),
(765, 's', 'Uniform title', 'N'),
(765, 't', 'Title', 'N'),
(765, 'u', 'Standard Technical Report Number', 'N'),
(765, 'w', 'Record control number', 'Y'),
(765, 'x', 'International Standard Serial Number', 'N'),
(765, 'y', 'CODEN designation', 'N'),
(765, 'z', 'International Standard Book Number', 'Y'),
(765, '6', 'Linkage', 'N'),
(765, '7', 'Control subfield', 'N'),
(765, '8', 'Field link and sequence number', 'Y'),
(767, 'a', 'Main entry heading', 'N'),
(767, 'b', 'Edition', 'N'),
(767, 'c', 'Qualifying information', 'N'),
(767, 'd', 'Place, publisher, and date of publication', 'N'),
(767, 'g', 'Relationship information', 'Y'),
(767, 'h', 'Physical description', 'N'),
(767, 'i', 'Display text', 'N'),
(767, 'k', 'Series data for related item', 'Y'),
(767, 'm', 'Material-specific details', 'N'),
(767, 'n', 'Note', 'Y'),
(767, 'o', 'Other item identifier', 'Y'),
(767, 'r', 'Report number', 'Y'),
(767, 's', 'Uniform title', 'N'),
(767, 't', 'Title', 'N'),
(767, 'u', 'Standard Technical Report Number', 'N'),
(767, 'w', 'Record control number', 'Y'),
(767, 'x', 'International Standard Serial Number', 'N'),
(767, 'y', 'CODEN designation', 'N'),
(767, 'z', 'International Standard Book Number', 'Y'),
(767, '6', 'Linkage', 'N'),
(767, '7', 'Control subfield', 'N'),
(767, '8', 'Field link and sequence number', 'Y'),
(770, 'a', 'Main entry heading', 'N'),
(770, 'b', 'Edition', 'N'),
(770, 'c', 'Qualifying information', 'N'),
(770, 'd', 'Place, publisher, and date of publication', 'N'),
(770, 'g', 'Relationship information', 'Y'),
(770, 'h', 'Physical description', 'N'),
(770, 'i', 'Display text', 'N'),
(770, 'k', 'Series data for related item', 'Y'),
(770, 'm', 'Material-specific details', 'N'),
(770, 'n', 'Note', 'Y'),
(770, 'o', 'Other item identifier', 'Y'),
(770, 'r', 'Report number', 'Y'),
(770, 's', 'Uniform title', 'N'),
(770, 't', 'Title', 'N'),
(770, 'u', 'Standard Technical Report Number', 'N'),
(770, 'w', 'Record control number', 'Y'),
(770, 'x', 'International Standard Serial Number', 'N'),
(770, 'y', 'CODEN designation', 'N'),
(770, 'z', 'International Standard Book Number', 'Y'),
(770, '6', 'Linkage', 'N'),
(770, '7', 'Control subfield', 'N'),
(770, '8', 'Field link and sequence number', 'Y'),
(772, 'a', 'Main entry heading', 'N'),
(772, 'b', 'Edition', 'N'),
(772, 'c', 'Qualifying information', 'N'),
(772, 'd', 'Place, publisher, and date of publication', 'N'),
(772, 'g', 'Relationship information', 'Y'),
(772, 'h', 'Physical description', 'N'),
(772, 'i', 'Display text', 'N'),
(772, 'k', 'Series data for related item', 'Y'),
(772, 'm', 'Material-specific details', 'N'),
(772, 'n', 'Note', 'Y'),
(772, 'o', 'Other item identifier', 'Y'),
(772, 'r', 'Report number', 'Y'),
(772, 's', 'Uniform title', 'N'),
(772, 't', 'Title', 'N'),
(772, 'u', 'Standard Technical Report Number', 'N'),
(772, 'w', 'Record control number', 'Y'),
(772, 'x', 'International Standard Serial Number', 'N'),
(772, 'y', 'CODEN designation', 'N'),
(772, 'z', 'International Stan dard Book Number', 'Y'),
(772, '6', 'Linkage', 'N'),
(772, '7', 'Control subfield', 'N'),
(772, '8', 'Field link and sequence number', 'Y'),
(773, 'a', 'Main entry heading', 'N'),
(773, 'b', 'Edition', 'N'),
(773, 'd', 'Place, publisher, and date of publication', 'N'),
(773, 'g', 'Relationship information', 'Y'),
(773, 'h', 'Physical description', 'N'),
(773, 'i', 'Display text', 'N'),
(773, 'k', 'Series data for related item', 'Y'),
(773, 'm', 'Material-specific details', 'N'),
(773, 'n', 'Note', 'Y'),
(773, 'o', 'Other item identifier', 'Y'),
(773, 'p', 'Abbreviated title', 'N'),
(773, 'r', 'Report number', 'Y'),
(773, 's', 'Uniform title', 'N'),
(773, 't', 'Title', 'N'),
(773, 'u', 'Standard Technical Report Number', 'N'),
(773, 'w', 'Record control number', 'Y'),
(773, 'x', 'International Standard Serial Number', 'N'),
(773, 'y', 'CODEN designation', 'N'),
(773, 'z', 'International Standard Book Number', 'Y'),
(773, '3', 'Materials specified', 'N'),
(773, '6', 'Linkage', 'N'),
(773, '7', 'Control subfield', 'N'),
(773, '8', 'Field link and sequence number', 'Y'),
(774, 'a', 'Main entry heading', 'N'),
(774, 'b', 'Edition', 'N'),
(774, 'c', 'Qualifying information', 'N'),
(774, 'd', 'Place, publisher, and date of publication', 'N'),
(774, 'g', 'Relationship information', 'Y'),
(774, 'h', 'Physical description', 'N'),
(774, 'i', 'Display text', 'N'),
(774, 'k', 'Series data for related item', 'Y'),
(774, 'm', 'Material-specific details', 'N'),
(774, 'n', 'Note', 'Y'),
(774, 'o', 'Other item identifier', 'Y'),
(774, 'r', 'Report number', 'Y'),
(774, 's', 'Uniform title', 'N'),
(774, 't', 'Title', 'N'),
(774, 'u', 'Standard Technical Report Number', 'N'),
(774, 'w', 'Record control number', 'Y'),
(774, 'x', 'International Standard Serial Number', 'N'),
(774, 'y', 'CODEN designation', 'N'),
(774, 'z', 'International Standard Book Number', 'Y'),
(774, '6', 'Linkage', 'N'),
(774, '7', 'Control subfield', 'N'),
(774, '8', 'Field link and sequence number', 'Y'),
(775, 'a', 'Main entry heading', 'N'),
(775, 'b', 'Edition', 'N'),
(775, 'c', 'Qualifying information', 'N'),
(775, 'd', 'Place, publisher, and date of publication', 'N'),
(775, 'e', 'Language code', 'N'),
(775, 'f', 'Country code', 'N'),
(775, 'g', 'Relationship information', 'Y'),
(775, 'h', 'Physical description', 'N'),
(775, 'i', 'Display text', 'N'),
(775, 'k', 'Series data for related item', 'Y'),
(775, 'm', 'Material-specific details', 'N'),
(775, 'n', 'Note', 'Y'),
(775, 'o', 'Other item identifier', 'Y'),
(775, 'r', 'Report number', 'Y'),
(775, 's', 'Uniform title', 'N'),
(775, 't', 'Title', 'N'),
(775, 'u', 'Standard Technical Report Number', 'N'),
(775, 'w', 'Record control number', 'Y'),
(775, 'x', 'International Standard Serial Number', 'N'),
(775, 'y', 'CODEN designation', 'N'),
(775, 'z', 'International Standard Book Number', 'Y'),
(775, '6', 'Linkage', 'N'),
(775, '7', 'Control subfield', 'N'),
(775, '8', 'Field link and sequence number', 'Y'),
(776, 'a', 'Main entry heading', 'N'),
(776, 'b', 'Edition', 'N'),
(776, 'c', 'Qualifying information', 'N'),
(776, 'd', 'Place, publisher, and date of publication', 'N'),
(776, 'g', 'Relationship information', 'Y'),
(776, 'h', 'Physical description', 'N'),
(776, 'i', 'Display text', 'N'),
(776, 'k', 'Series data for related item', 'Y'),
(776, 'm', 'Material-specific details', 'N'),
(776, 'n', 'Note', 'Y'),
(776, 'o', 'Other item identifier', 'Y'),
(776, 'r', 'Report number', 'Y'),
(776, 's', 'Uniform title', 'N'),
(776, 't', 'Title', 'N'),
(776, 'u', 'Standard Technical Report Number', 'N'),
(776, 'w', 'Record control number', 'Y'),
(776, 'x', 'International Standard Serial Number', 'N'),
(776, 'y', 'CODEN designation', 'N'),
(776, 'z', 'International Standard Book Number', 'Y'),
(776, '6', 'Linkage', 'N'),
(776, '7', 'Control subfield', 'N'),
(776, '8', 'Field link and sequence number', 'Y'),
(777, 'a', 'Main entry heading', 'N'),
(777, 'b', 'Edition', 'N'),
(777, 'c', 'Qualifying information', 'N'),
(777, 'd', 'Place, publisher, and date of publication', 'N'),
(777, 'g', 'Relationship information', 'Y'),
(777, 'h', 'Physical description', 'N'),
(777, 'i', 'Display text', 'N'),
(777, 'k', 'Series data for related item', 'Y'),
(777, 'm', 'Material-specific details', 'N'),
(777, 'n', 'Note', 'Y'),
(777, 'o', 'Other item identifier', 'Y'),
(777, 's', 'Uniform title', 'N'),
(777, 't', 'Title', 'N'),
(777, 'w', 'Record control number', 'Y'),
(777, 'x', 'International Standard Serial Number', 'N'),
(777, 'y', 'CODEN designation', 'N'),
(777, '6', 'Linkage', 'N'),
(777, '7', 'Control subfield', 'N'),
(777, '8', 'Field link and sequence number', 'Y'),
(780, 'a', 'Main entry heading', 'N'),
(780, 'b', 'Edition', 'N'),
(780, 'c', 'Qualifying information', 'N'),
(780, 'd', 'Place, publisher, and date of publication', 'N'),
(780, 'g', 'Relationship information', 'Y'),
(780, 'h', 'Physical description', 'N'),
(780, 'i', 'Display text', 'N'),
(780, 'k', 'Series data for related item', 'Y'),
(780, 'm', 'Material-specific details', 'N'),
(780, 'n', 'Note', 'Y'),
(780, 'o', 'Other item identifier', 'Y'),
(780, 'r', 'Report number', 'Y'),
(780, 's', 'Uniform title', 'N'),
(780, 't', 'Title', 'N'),
(780, 'u', 'Standard Technical Report Number', 'N'),
(780, 'w', 'Record control number', 'Y'),
(780, 'x', 'International Standard Serial Number', 'N'),
(780, 'y', 'CODEN designation', 'N'),
(780, 'z', 'International Standard Book Number', 'Y'),
(780, '6', 'Linkage', 'N'),
(780, '7', 'Control subfield', 'N'),
(780, '8', 'Field link and sequence number', 'Y'),
(785, 'a', 'Main entry heading', 'N'),
(785, 'b', 'Edition', 'N'),
(785, 'c', 'Qualifying information', 'N'),
(785, 'd', 'Place, publisher, and date of publication', 'N'),
(785, 'g', 'Relationship information', 'Y'),
(785, 'h', 'Physical description', 'N'),
(785, 'i', 'Display text', 'N'),
(785, 'k', 'Series data for related item', 'Y'),
(785, 'm', 'Material-specific details', 'N'),
(785, 'n', 'Note', 'Y'),
(785, 'o', 'Other item identifier', 'Y'),
(785, 'r', 'Report number', 'Y'),
(785, 's', 'Uniform title', 'N'),
(785, 't', 'Title', 'N'),
(785, 'u', 'Standa rd Technical Report Number', 'N'),
(785, 'w', 'Record control number', 'Y'),
(785, 'x', 'International Standard Serial Number', 'N'),
(785, 'y', 'CODEN designation', 'N'),
(785, 'z', 'International Standard Book Number', 'Y'),
(785, '6', 'Linkage', 'N'),
(785, '7', 'Control subfield', 'N'),
(785, '8', 'Field link and sequence number', 'Y'),
(786, 'a', 'Main entry heading', 'N'),
(786, 'b', 'Edition', 'N'),
(786, 'c', 'Qualifying information', 'N'),
(786, 'd', 'Place, publisher, and date of publication', 'N'),
(786, 'g', 'Relationship information', 'Y'),
(786, 'h', 'Physical description', 'N'),
(786, 'i', 'Display text', 'N'),
(786, 'j', 'Period of content', 'N'),
(786, 'k', 'Series data for related item', 'Y'),
(786, 'm', 'Material-specific details', 'N'),
(786, 'n', 'Note', 'Y'),
(786, 'o', 'Other item identifier', 'Y'),
(786, 'p', 'Abbreviated title', 'N'),
(786, 'r', 'Report number', 'Y'),
(786, 's', 'Uniform title', 'N'),
(786, 't', 'Title', 'N'),
(786, 'u', 'Standard Technical Report Number', 'N'),
(786, 'v', 'Source Contribution', 'N'),
(786, 'w', 'Record control number', 'Y'),
(786, 'x', 'International Standard Serial Number', 'N'),
(786, 'y', 'CODEN designation', 'N'),
(786, 'z', 'International Standard Book Number', 'Y'),
(786, '6', 'Linkage', 'N'),
(786, '7', 'Control subfield', 'N'),
(786, '8', 'Field link and sequence number', 'Y'),
(787, 'a', 'Main entry heading', 'N'),
(787, 'b', 'Edition', 'N'),
(787, 'c', 'Qualifying information', 'N'),
(787, 'd', 'Place, publisher, and date of publication', 'N'),
(787, 'g', 'Relationship information', 'Y'),
(787, 'h', 'Physical description', 'N'),
(787, 'i', 'Display text', 'N'),
(787, 'k', 'Series data for related item', 'Y'),
(787, 'm', 'Material-specific details', 'N'),
(787, 'n', 'Note', 'Y'),
(787, 'o', 'Other item identifier', 'Y'),
(787, 'r', 'Report number', 'Y'),
(787, 's', 'Uniform title', 'N'),
(787, 't', 'Title', 'N'),
(787, 'u', 'Standard Technical Report Number', 'N'),
(787, 'w', 'Record control number', 'Y'),
(787, 'x', 'International Standard Serial Number', 'N'),
(787, 'y', 'CODEN designation', 'N'),
(787, 'z', 'International Standard Book Number', 'Y'),
(787, '6', 'Linkage', 'N'),
(787, '7', 'Control subfield', 'N'),
(787, '8', 'Field link and sequence number', 'Y'),
(800, 'a', 'Personal name', 'N'),
(800, 'b', 'Numeration', 'N'),
(800, 'c', 'Titles and other words associated with a name', 'Y'),
(800, 'd', 'Dates associated with a name', 'N'),
(800, 'e', 'Relator term', 'Y'),
(800, 'f', 'Date of a work', 'N'),
(800, 'g', 'Miscellaneous information', 'N'),
(800, 'h', 'Medium', 'N'),
(800, 'j', 'Attribution qualifier', 'Y'),
(800, 'k', 'Form subheading', 'Y'),
(800, 'l', 'Language of a work', 'N'),
(800, 'm', 'Medium of performance for music', 'Y'),
(800, 'n', 'Number of part/section of a work', 'Y'),
(800, 'o', 'Arranged statement for music', 'N'),
(800, 'p', 'Name of part/section of a work', 'Y'),
(800, 'q', 'Fuller form of name', 'N'),
(800, 'r', 'Key for music', 'N'),
(800, 's', 'Version', 'N'),
(800, 't', 'Title of a work', 'N'),
(800, 'u', 'Affiliation', 'N'),
(800, 'v', 'Volume/sequential designation', 'N'),
(800, '4', 'Relator code', 'Y'),
(800, '6', 'Linkage', 'N'),
(800, '8', 'Field link and sequence number', 'Y'),
(810, 'a', 'Corporate name or jurisdiction name as entry element', 'N'),
(810, 'b', 'Subordinate unit', 'Y'),
(810, 'c', 'Location of meeting', 'N'),
(810, 'd', 'Date of meeting or treaty signing', 'Y'),
(810, 'e', 'Relator term', 'Y'),
(810, 'f', 'Date of a work', 'N'),
(810, 'g', 'Miscellaneous information', 'N'),
(810, 'h', 'Medium', 'N'),
(810, 'k', 'Form subheading', 'Y'),
(810, 'l', 'Language of a work', 'N'),
(810, 'm', 'Medium of performance for music', 'Y'),
(810, 'n', 'Number of part/section/meeting', 'Y'),
(810, 'o', 'Arranged statement for music', 'N'),
(810, 'p', 'Name of part/section of a work', 'Y'),
(810, 'r', 'Key for music', 'N'),
(810, 's', 'Version', 'N'),
(810, 't', 'Title of a work', 'N'),
(810, 'u', 'Affiliation', 'N'),
(810, 'v', 'Volume/sequential designation', 'N'),
(810, '4', 'Relator code', 'Y'),
(810, '6', 'Linkage', 'N'),
(810, '8', 'Field link and sequence number', 'Y'),
(811, 'a', 'Meeting name or jurisdiction name as entry element', 'N'),
(811, 'c', 'Location of meeting', 'N'),
(811, 'd', 'Date of meeting', 'N'),
(811, 'e', 'Subordinate unit', 'Y'),
(811, 'f', 'Date of a work', 'N'),
(811, 'g', 'Miscellaneous information', 'N'),
(811, 'h', 'Medium', 'N'),
(811, 'k', 'Form subheading', 'Y'),
(811, 'l', 'Language of a work', 'N'),
(811, 'n', 'Number of part/section/meeting', 'Y'),
(811, 'p', 'Name of part/section of a work', 'Y'),
(811, 'q', 'Name of meeting following jurisdiction name entry element', 'N'),
(811, 's', 'Version', 'N'),
(811, 't', 'Title of a work', 'N'),
(811, 'u', 'Affiliation', 'N'),
(811, 'v', 'Volume/sequential designation', 'N'),
(811, '4', 'Relator code', 'Y'),
(811, '6', 'Linkage', 'N'),
(811, '8', 'Field link and sequence number', 'Y'),
(830, 'a', 'Uniform title', 'N'),
(830, 'd', 'Date of treaty signing', 'Y'),
(830, 'f', 'Date of a work', 'N'),
(830, 'g', 'Miscellaneous information', 'N'),
(830, 'h', 'Medium', 'N'),
(830, 'k', 'Form subheading', 'Y'),
(830, 'l', 'Language of a work', 'N'),
(830, 'm', 'Medium of performance for music', 'Y'),
(830, 'n', 'Number of part/section of a work', 'Y'),
(830, 'o', 'Arranged statement for music', 'N'),
(830, 'p', 'Name of part/section of a work', 'Y'),
(830, 'r', 'Key for music', 'N'),
(830, 's', 'Version', 'N'),
(830, 't', 'Title of a work', 'N'),
(830, 'v', 'Volume/sequential designation', 'N'),
(830, '6', 'Linkage', 'N'),
(830, '8', 'Field link and sequence number', 'Y'),
(850, 'a', 'Holding institution', 'Y'),
(850, '8', 'Field link and sequence number', 'Y'),
(852, 'a', 'Location', 'N'),
(852, 'b', 'Sublocation or collection', 'Y'),
(852, 'c', 'Shelving location', 'Y'),
(852, 'e', 'Address', 'Y'),
(852, 'f', 'Coded location qualifier', 'Y'),
(852, 'g', 'Non-coded location qualifier', 'Y'),
(852, 'h', 'Classification part', 'N'),
(852, 'i', 'Item part', 'Y'),
(852, 'j', 'Shelving control number', 'N'),
(852, 'k', 'Call number prefix', 'N'),
(852, 'l', 'Shelving form of title', 'N'),
(852, 'm', 'Call number suffix', 'N'),
(852, 'n', 'Country code', 'N'),
(852, 'p', 'Piece designation', 'N'),
(852, 'q', 'Piece physical condition', 'N'),
(852, 's', 'Copyright article-fee code', 'Y'),
(852, 't', 'Copy number', 'N'),
(852, 'x', 'Nonpublic note', 'Y'),
(852, 'z', 'Public note', 'Y'),
(852, '2', 'Source of classification or shelving scheme', 'N'),
(852, '3', 'Materials specified', 'N'),
(852, '6', 'Linkage', 'N'),
(852, '8', 'Sequence number', 'N'),
(856, 'a', 'Host name', 'Y'),
(856, 'b', 'Access number', 'Y'),
(856, 'c', 'Compression information', 'Y'),
(856, 'd', 'Path', 'Y'),
(856, 'f', 'Electronic name', 'Y'),
(856, 'h', 'Processor of request', 'N'),
(856, 'i', 'Instruction', 'Y'),
(856, 'j', 'Bits per second', 'N'),
(856, 'k', 'Password', 'N'),
(856, 'l', 'Logon', 'N'),
(856, 'm', 'Contact for access assistance', 'Y'),
(856, 'n', 'Name of location of host', 'N'),
(856, 'o', 'Operating system', 'N'),
(856, 'p', 'Port', 'N'),
(856, 'q', 'Electronic format type', 'N'),
(856, 'r', 'Settings', 'N'),
(856, 's', 'File size', 'Y'),
(856, 't', 'Terminal emulation', 'Y'),
(856, 'u', 'Uniform Resource Identifier', 'Y'),
(856, 'v', 'Hours access method available', 'Y'),
(856, 'w', 'Record control number', 'Y'),
(856, 'x', 'Nonpublic note', 'Y'),
(856, 'y', 'Link text', 'Y'),
(856, 'z', 'Public note', 'Y'),
(856, '2', 'Access method', 'N'),
(856, '3', 'Materials specified', 'N'),
(856, '6', 'Linkage', 'N'),
(856, '8', 'Field link and sequence number', 'Y'),
(880, '6', 'Linkage', 'N'),
(886, 'a', 'Tag of the foreign MARC field', 'N'),
(886, 'b', 'Content of the foreign MARC field', 'N'),
(886, '2', 'Source of data', 'N'),
(887, 'a', 'Content of non-MARC field', 'N'),
(887, '2', 'Source of data', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `usmarc_tag_dm`
--

CREATE TABLE `usmarc_tag_dm` (
  `block_nmbr` tinyint(4) NOT NULL,
  `tag` smallint(6) NOT NULL,
  `description` varchar(80) NOT NULL,
  `ind1_description` varchar(80) NOT NULL,
  `ind2_description` varchar(80) NOT NULL,
  `repeatable_flg` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usmarc_tag_dm`
--

INSERT INTO `usmarc_tag_dm` (`block_nmbr`, `tag`, `description`, `ind1_description`, `ind2_description`, `repeatable_flg`) VALUES
(0, 10, 'Library of congress control number', 'Undefined', 'Undefined', 'N'),
(0, 13, 'Patent control information', 'Undefined', 'Undefined', 'Y'),
(0, 15, 'National bibliography number', 'Undefined', 'Undefined', 'Y'),
(0, 16, 'National bibliographic agency control number', 'National bibliographic agency', 'Undefined', 'Y'),
(0, 17, 'Copyright or legal deposit number', 'Undefined', 'Undefined', 'Y'),
(0, 18, 'Copyright article-fee code', 'Undefined', 'Undefined', 'N'),
(0, 20, 'International standard book number', 'Undefined', 'Undefined', 'Y'),
(0, 22, 'International standard serial number', 'Level of international interest', 'Undefined', 'Y'),
(0, 24, 'Other standard identifier', 'Type of standard number or code', 'Difference indicator', 'Y'),
(0, 25, 'Overseas acquisition number', 'Undefined', 'Undefined', 'Y'),
(0, 27, 'Standard technical report number', 'Undefined', 'Undefined', 'Y'),
(0, 28, 'Publisher number', 'Type of publisher number', 'Note/added entry controller', 'Y'),
(0, 30, 'Coden designation', 'Undefined', 'Undefined', 'Y'),
(0, 32, 'Postal registration number', 'Undefined', 'Undefined', 'Y'),
(0, 33, 'Date/time and place of an event', 'Type of date in subfield $a', 'Type of event', 'Y'),
(0, 34, 'Coded cartographic mathematical data', 'Type of scale', 'Type of ring', 'Y'),
(0, 35, 'System control number', 'Undefined', 'Undefined', 'Y'),
(0, 36, 'Original study number for computer data files', 'Undefined', 'Undefined', 'N'),
(0, 37, 'Source of acquisition', 'Undefined', 'Undefined', 'Y'),
(0, 40, 'Cataloging source', 'Undefined', 'Undefined', 'N'),
(0, 41, 'Language code', 'Translation indication', 'Source of code', 'Y'),
(0, 42, 'Authentication code', 'Undefined', 'Undefined', 'N'),
(0, 43, 'Geographic area code', 'Undefined', 'Undefined', 'N'),
(0, 44, 'Country of publishing/producing entity code', 'Undefined', 'Undefined', 'N'),
(0, 45, 'Time period of content', 'Type of time period in subfield $b or $c', 'Undefined', 'N'),
(0, 46, 'Special coded dates', 'Undefined', 'Undefined', 'N'),
(0, 47, 'Form of musical composition code', 'Undefined', 'Undefined', 'N'),
(0, 48, 'Number of musical instruments or voices code', 'Undefined', 'Undefined', 'Y'),
(0, 50, 'Library of congress call number', 'Existence in LC collection', 'Source of call number', 'Y'),
(0, 51, 'Library of congress copy, issue, offprint statement', 'Undefined', 'Undefined', 'Y'),
(0, 52, 'Geographic classification', 'Code source', 'Undefined', 'Y'),
(0, 55, 'Classification numbers assigned in canada', 'Existence in NLC collection', 'Type, completeness, source of class/call number', 'Y'),
(0, 60, 'National library of medicine call number', 'Existence in NLM collection', 'Source of call number', 'Y'),
(0, 61, 'National library of medicine copy statement', 'Undefined', 'Undefined', 'Y'),
(0, 66, 'Character sets present', 'Undefined', 'Undefined', 'N'),
(0, 70, 'National agricultural library call number', 'Existence in NAL collection', 'Undefined', 'Y'),
(0, 71, 'National agricultural library copy statement', 'Undefined', 'Undefined', 'Y'),
(0, 72, 'Subject category code', 'Undefined', 'Code source', 'Y'),
(0, 74, 'Gpo item number', 'Undefined', 'Undefined', 'Y'),
(0, 80, 'Universal decimal classification number', 'Undefined', 'Undefined', 'Y'),
(0, 82, 'Dewey decimal classification number', 'Type of edition', 'Source of classification number', 'Y'),
(0, 84, 'Other classification number', 'Undefined', 'Undefined', 'Y'),
(0, 86, 'Government document classification number', 'Number source', 'Undefined', 'Y'),
(0, 88, 'Report number', 'Undefined', 'Undefined', 'Y'),
(1, 100, 'Main entry--personal name', 'Type of personal name entry element', 'Undefined', 'N'),
(1, 110, 'Main entry--corporate name', 'Type of corporate name entry element', 'Undefined', 'N'),
(1, 111, 'Main entry--meeting name', 'Type of meeting name entry element', 'Undefined', 'N'),
(1, 130, 'Main entry--uniform title', 'Nonfiling characters', 'Undefined', 'N'),
(2, 210, 'Abbreviated title', 'Title added entry', 'Type', 'Y'),
(2, 222, 'Key title', 'Specifies whether variant title and/or added entry is required', 'Nonfiling characters', 'Y'),
(2, 240, 'Uniform title', 'Uniform title printed or displayed', 'Nonfiling characters', 'N'),
(2, 242, 'Translation of title by cataloging agency', 'Title added entry', 'Nonfiling characters', 'Y'),
(2, 243, 'Collective uniform title', 'Uniform title printed or displayed', 'Nonfiling characters', 'N'),
(2, 245, 'Title statement', 'Title added entry', 'Nonfiling characters', 'N'),
(2, 246, 'Varying form of title', 'Note/added entry controller', 'Type of title', 'Y'),
(2, 247, 'Former title or title variations', 'Title added entry', 'Note controller', 'Y'),
(2, 250, 'Edition statement', 'Undefined', 'Undefined', 'N'),
(2, 254, 'Musical presentation statement', 'Undefined', 'Undefined', 'N'),
(2, 255, 'Cartographic mathematical data', 'Undefined', 'Undefined', 'Y'),
(2, 256, 'Computer file characteristics', 'Undefined', 'Undefined', 'N'),
(2, 257, 'Country of producing entity for archival films', 'Undefined', 'Undefined', 'N'),
(2, 260, 'Publication, distribution, etc. (imprint)', 'Sequence of publishing statements', 'Undefined', 'Y'),
(2, 261, 'Imprint statement for films (pre-aacr 1 revised)  [local]', 'Undefined', 'Undefined', 'N'),
(2, 262, 'Imprint statement for sound recordings (pre-aacr 2)  [local]', 'Undefined', 'Undefined', 'N'),
(2, 263, 'Projected publication date', 'Undefined', 'Undefined', 'N'),
(2, 270, 'Address', 'Level', 'Type of address', 'Y'),
(3, 300, 'Physical description', 'Undefined', 'Undefined', 'Y'),
(3, 306, 'Playing time', 'Undefined', 'Undefined', 'N'),
(3, 307, 'Hours, etc.', 'Display constant controller', 'Undefined', 'Y'),
(3, 310, 'Current publication frequency', 'Undefined', 'Undefined', 'N'),
(3, 340, 'Physical medium', 'Undefined', 'Undefined', 'Y'),
(3, 342, 'Geospatial reference data', 'Geospatial reference dimension', 'Geospatial reference method', 'Y'),
(3, 343, 'Planar coordinate data', 'Undefined', 'Undefined', 'Y'),
(3, 351, 'Organization and arrangement of materials', 'Undefined', 'Undefined', 'Y'),
(3, 352, 'Digital graphic representation', 'Undefined', 'Undefined', 'Y'),
(3, 355, 'Security classification control', 'Controlled element', 'Undefined', 'Y'),
(3, 362, 'Dates of publication and/or sequential designation', 'Format of date', 'Undefined', 'Y'),
(4, 400, 'Series statement/added entry--personal name   [us-local]', 'Type of personal name entry element', 'Pronoun represents main entry', 'Y'),
(4, 410, 'Series statement/added entry--corporate name  [us-local]', 'Type of corporate name entry element', 'Pronoun represents main entry', 'Y'),
(4, 411, 'Series statement/added entry--meeting name  [us-local]', 'Type of meeting name entry element', 'Pronoun represents main entry', 'Y'),
(4, 440, 'Series statement/added entry--title', 'Undefined', 'Nonfiling characters', 'Y'),
(4, 490, 'Series statement', 'Specifies whether series is traced', 'Undefined', 'Y'),
(5, 500, 'General note', 'Undefined', 'Undefined', 'Y'),
(5, 501, 'With note', 'Undefined', 'Undefined', 'Y'),
(5, 502, 'Dissertation note', 'Undefined', 'Undefined', 'Y'),
(5, 504, 'Bibliography, etc. note', 'Undefined', 'Undefined', 'Y'),
(5, 505, 'Formatted contents note', 'Display constant controller', 'Level of content designation', 'Y'),
(5, 506, 'Restrictions on access note', 'Undefined', 'Undefined', 'Y'),
(5, 507, 'Scale note for graphic material', 'Undefined', 'Undefined', 'N'),
(5, 508, 'Creation/production credits note', 'Undefined', 'Undefined', 'Y'),
(5, 510, 'Citation/references note', 'Coverage/location in source', 'Undefined', 'Y'),
(5, 511, 'Participant or performer note', 'Display constant controller', 'Undefined', 'Y'),
(5, 513, 'Type of report and period covered note', 'Undefined', 'Undefined', 'Y'),
(5, 514, 'Data quality note', 'Undefined', 'Undefined', 'N'),
(5, 515, 'Numbering peculiarities note', 'Undefined', 'Undefined', 'Y'),
(5, 516, 'Type of computer file or data note', 'Display constant controller', 'Undefined', 'Y'),
(5, 518, 'Date/time and place of an event note', 'Undefined', 'Undefined', 'Y'),
(5, 520, 'Summary, etc.', 'Display constant controller', 'Undefined', 'Y'),
(5, 521, 'Target audience note', 'Display constant controller', 'Undefined', 'Y'),
(5, 522, 'Geographic coverage note', 'Display constant controller', 'Undefined', 'Y'),
(5, 524, 'Preferred citation of described materials note', 'Display constant controller', 'Undefined', 'Y'),
(5, 525, 'Supplement note', 'Undefined', 'Undefined', 'Y'),
(5, 526, 'Study program information note', 'Display constant controller', 'Undefined', 'Y'),
(5, 530, 'Additional physical form available note', 'Undefined', 'Undefined', 'Y'),
(5, 533, 'Reproduction note', 'Undefined', 'Undefined', 'Y'),
(5, 534, 'Original version note', 'Undefined', 'Undefined', 'Y'),
(5, 535, 'Location of originals/duplicates note', 'Additional information about custodian', 'Undefined', 'Y'),
(5, 536, 'Funding information note', 'Undefined', 'Undefined', 'Y'),
(5, 538, 'System details note', 'Undefined', 'Undefined', 'Y'),
(5, 540, 'Terms governing use and reproduction note', 'Undefined', 'Undefined', 'Y'),
(5, 541, 'Immediate source of acquisition note', 'Undefined', 'Undefined', 'Y'),
(5, 544, 'Location of other archival materials note', 'Relationship', 'Undefined', 'Y'),
(5, 545, 'Biographical or historical data', 'Type of data', 'Undefined', 'Y'),
(5, 546, 'Language note', 'Undefined', 'Undefined', 'Y'),
(5, 547, 'Former title complexity note', 'Undefined', 'Undefined', 'Y'),
(5, 550, 'Issuing body note', 'Undefined', 'Undefined', 'Y'),
(5, 552, 'Entity and attribute information note', 'Undefined', 'Undefined', 'Y'),
(5, 555, 'Cumulative index/finding aids note', 'Display constant controller', 'Undefined', 'Y'),
(5, 556, 'Information about documentation note', 'Display constant controller', 'Undefined', 'Y'),
(5, 561, 'Ownership and custodial history', 'Undefined', 'Undefined', 'Y'),
(5, 562, 'Copy and version identification note', 'Undefined', 'Undefined', 'Y'),
(5, 565, 'Case file characteristics note', 'Display constant controller', 'Undefined', 'Y'),
(5, 567, 'Methodology note', 'Display constant controller', 'Undefined', 'Y'),
(5, 580, 'Linking entry complexity note', 'Undefined', 'Undefined', 'Y'),
(5, 581, 'Publications about described materials note', 'Display constant controller', 'Undefined', 'Y'),
(5, 583, 'Action note', 'Undefined', 'Undefined', 'Y'),
(5, 584, 'Accumulation and frequency of use note', 'Undefined', 'Undefined', 'Y'),
(5, 585, 'Exhibitions note', 'Undefined', 'Undefined', 'Y'),
(5, 586, 'Awards note', 'Display constant controller', 'Undefined', 'Y'),
(6, 600, 'Subject added entry--personal name', 'Type of personal name entry element', 'Thesaurus', 'Y'),
(6, 610, 'Subject added entry--corporate name', 'Type of corporate name entry element', 'Thesaurus', 'Y'),
(6, 611, 'Subject added entry--meeting name', 'Type of meeting name entry element', 'Thesaurus', 'Y'),
(6, 630, 'Subject added entry--uniform title', 'Nonfiling characters', 'Thesaurus', 'Y'),
(6, 650, 'Subject added entry--topical term', 'Level of subject', 'Thesaurus', 'Y'),
(6, 651, 'Subject added entry--geographic name', 'Undefined', 'Thesaurus', 'Y'),
(6, 653, 'Index term--uncontrolled', 'Level of index term', 'Undefined', 'Y'),
(6, 654, 'Subject added entry--faceted topical terms', 'Level of subject', 'Undefined', 'Y'),
(6, 655, 'Index term--genre/form', 'Type of heading', 'Source of term', 'Y'),
(6, 656, 'Index term--occupation', 'Undefined', 'Source of term', 'Y'),
(6, 657, 'Index term--function', 'Undefined', 'Source of term', 'Y'),
(6, 658, 'Index term--curriculum objective', 'Undefined', 'Undefined', 'Y'),
(7, 700, 'Added entry--personal name', 'Type of personal name entry element', 'Type of added entry', 'Y'),
(7, 710, 'Added entry--corporate name', 'Type of corporate name entry element', 'Type of added entry', 'Y'),
(7, 711, 'Added entry--meeting name', 'Type of meeting name entry element', 'Type of added entry', 'Y'),
(7, 720, 'Added entry--uncontrolled name', 'Type of name', 'Undefined', 'Y'),
(7, 730, 'Added entry--uniform title', 'Nonfiling characters', 'Type of added entry', 'Y'),
(7, 740, 'Added entry--uncontrolled related/analytical title', 'Nonfiling characters', 'Type of added entry', 'Y'),
(7, 752, 'Added entry--hierarchical place name', 'Undefined', 'Undefined', 'Y'),
(7, 753, 'System details access to computer files', 'Undefined', 'Undefined', 'Y'),
(7, 754, 'Added entry--taxonomic identification', 'Undefined', 'Undefined', 'Y'),
(7, 760, 'Main series entry', 'Note controller', 'Display constant controller', 'Y'),
(7, 762, 'Subseries entry', 'Note controller', 'Display constant controller', 'Y'),
(7, 765, 'Original language entry', 'Note controller', 'Display constant controller', 'Y'),
(7, 767, 'Translation entry', 'Note controller', 'Display constant controller', 'Y'),
(7, 770, 'Supplement/special issue entry', 'Note controller', 'Display constant controller', 'Y'),
(7, 772, 'Supplement parent entry', 'Note controller', 'Display constant controller', 'Y'),
(7, 773, 'Host item entry', 'Note controller', 'Display constant controller', 'Y'),
(7, 774, 'Constituent unit entry', 'Note controller', 'Display constant controller', 'Y'),
(7, 775, 'Other edition entry', 'Note controller', 'Display constant controller', 'Y'),
(7, 776, 'Additional physical form entry', 'Note controller', 'Display constant controller', 'Y'),
(7, 777, 'Issued with entry', 'Note controller', 'Display constant controller', 'Y'),
(7, 780, 'Preceding entry', 'Note controller', 'Type of relationship', 'Y'),
(7, 785, 'Succeeding entry', 'Note controller', 'Type of relationship', 'Y'),
(7, 786, 'Data source entry', 'Note controller', 'Display constant controller', 'Y'),
(7, 787, 'Nonspecific relationship entry', 'Note controller', 'Display constant controller', 'Y'),
(8, 800, 'Series added entry--personal name', 'Type of personal name entry element', 'Undefined', 'Y'),
(8, 810, 'Series added entry--corporate name', 'Type of corporate name entry element', 'Undefined', 'Y'),
(8, 811, 'Series added entry--meeting name', 'Type of meeting name entry element', 'Undefined', 'Y'),
(8, 830, 'Series added entry--uniform title', 'Undefined', 'Nonfiling characters', 'Y'),
(8, 850, 'Holding institution', 'Undefined', 'Undefined', 'Y'),
(8, 852, 'Location', 'Shelving scheme', 'Shelving order', 'Y'),
(8, 856, 'Electronic location and access', 'Access method', 'Relationship', 'Y'),
(8, 880, 'Alternate graphic representation', 'Same as associated field', 'Same as associated field', 'Y'),
(8, 886, 'Foreign marc information field', 'Type of field', 'Undefined', 'Y'),
(8, 887, 'Non-marc information field', 'Undefined', 'Undefined', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `vdo`
--

CREATE TABLE `vdo` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `product_main_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `publisher_aid` int(10) UNSIGNED DEFAULT NULL,
  `title` text,
  `author` text,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '0:Not Active, 1:Active',
  `weight` float DEFAULT '0',
  `is_new` tinyint(4) DEFAULT '0',
  `is_recommended` tinyint(4) DEFAULT '0',
  `is_home` tinyint(4) UNSIGNED DEFAULT '0',
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `upload_path` text,
  `cover_image_file_type` varchar(5) DEFAULT NULL,
  `uri` text,
  `tag` longtext,
  `total_copy` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_view` int(10) UNSIGNED DEFAULT '0',
  `total_view_web` int(10) UNSIGNED DEFAULT '0',
  `total_view_device` int(10) UNSIGNED DEFAULT '0',
  `total_download` int(10) UNSIGNED DEFAULT '0',
  `total_download_web` int(10) UNSIGNED DEFAULT '0',
  `total_download_device` int(10) UNSIGNED DEFAULT '0',
  `total_read` int(10) UNSIGNED DEFAULT '0',
  `total_read_web` int(10) UNSIGNED DEFAULT '0',
  `total_read_device` int(10) UNSIGNED DEFAULT '0',
  `total_rental` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `best_price` int(10) UNSIGNED DEFAULT NULL,
  `has_paper` tinyint(1) UNSIGNED DEFAULT NULL,
  `has_ebook` tinyint(1) UNSIGNED DEFAULT NULL,
  `has_license` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `reward_point` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `review_point` int(10) UNSIGNED DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `bcc_status` tinyint(4) NOT NULL,
  `cover_image` varchar(500) NOT NULL,
  `thumbnail_image` varchar(500) NOT NULL,
  `large_image` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vdo`
--

INSERT INTO `vdo` (`aid`, `cid`, `user_owner_aid`, `product_main_aid`, `product_type_aid`, `publisher_aid`, `title`, `author`, `status`, `weight`, `is_new`, `is_recommended`, `is_home`, `publish_date`, `expired_date`, `category`, `upload_path`, `cover_image_file_type`, `uri`, `tag`, `total_copy`, `total_view`, `total_view_web`, `total_view_device`, `total_download`, `total_download_web`, `total_download_device`, `total_read`, `total_read_web`, `total_read_device`, `total_rental`, `best_price`, `has_paper`, `has_ebook`, `has_license`, `reward_point`, `review_point`, `created_date`, `created_by`, `updated_date`, `updated_by`, `bcc_status`, `cover_image`, `thumbnail_image`, `large_image`) VALUES
(2, '000002', 1, 9, 3, 0, 'เจ้าแม่ขายตรง', '', 0, 0, 0, 0, 0, '2017-04-05', NULL, ',4,', 'uploads/dip/vdo/1/000002/', '.jpg', '', '', 0, 18, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, '2017-04-05 15:05:47', 1, '2017-04-05 16:43:26', 1, 0, '', '', ''),
(3, '000003', 1, 9, 3, 0, 'ทดสอบ', '', 1, 0, 0, 0, 0, '2017-04-05', NULL, ',4,', 'uploads/dip/vdo/1/000003/', '.jpg', '', '', 0, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, '2017-04-05 16:45:29', 1, '2017-04-05 16:45:30', 1, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `vdo_copy`
--

CREATE TABLE `vdo_copy` (
  `aid` int(10) UNSIGNED NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `barcode` varchar(50) NOT NULL,
  `nonconsume_identifier` varchar(255) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `product_type_minor_aid` tinyint(4) UNSIGNED DEFAULT NULL,
  `copy_title` varchar(255) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `weight` float DEFAULT '0',
  `upload_path` varchar(255) DEFAULT NULL,
  `file_upload` varchar(255) DEFAULT NULL,
  `use_digital_gen` tinyint(1) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `no_1` varchar(12) DEFAULT NULL,
  `no_2` varchar(12) DEFAULT NULL,
  `no_3` varchar(12) DEFAULT NULL,
  `no_4` varchar(12) DEFAULT NULL,
  `call_number` varchar(48) DEFAULT NULL,
  `cover_price` double UNSIGNED DEFAULT NULL,
  `source` text,
  `note_1` text,
  `note_2` text,
  `note_3` text,
  `type` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1: Digital, 2:Paper',
  `type_minor` tinyint(3) UNSIGNED DEFAULT NULL,
  `possession` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1:Buy out, 2:Rental',
  `is_license` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1:License, 0:Not license',
  `is_ebook` tinyint(1) NOT NULL,
  `ebook_concurrence` tinyint(4) UNSIGNED DEFAULT NULL,
  `digital_price` double UNSIGNED DEFAULT NULL,
  `digital_point` double UNSIGNED DEFAULT NULL,
  `paper_price` double UNSIGNED DEFAULT NULL,
  `paper_point` double UNSIGNED DEFAULT NULL,
  `in_stock` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_period` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fee` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fee_point` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fine_fee` tinyint(4) UNSIGNED DEFAULT NULL,
  `shelf_status` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1: On shelf, 2:Borrowed, 3:Damage, 4:Lost',
  `shelf_name` varchar(255) DEFAULT NULL,
  `transport_aid` int(10) UNSIGNED DEFAULT NULL,
  `transport_price` int(10) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vdo_field`
--

CREATE TABLE `vdo_field` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `sequence` int(10) UNSIGNED NOT NULL,
  `product_type_aid` int(10) UNSIGNED NOT NULL,
  `product_main_field_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `tag` smallint(6) NOT NULL,
  `ind1_cd` char(1) DEFAULT NULL,
  `ind2_cd` char(1) DEFAULT NULL,
  `subfield_cd` char(1) NOT NULL,
  `field_data` text,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vdo_field`
--

INSERT INTO `vdo_field` (`parent_aid`, `sequence`, `product_type_aid`, `product_main_field_aid`, `name`, `user_owner_aid`, `tag`, `ind1_cd`, `ind2_cd`, `subfield_cd`, `field_data`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(3, 2, 3, 87, 'Author', 1, 100, '', '', 'a', '', '2017-04-05 16:45:30', 1, '2017-04-05 16:45:30', 1),
(3, 1, 3, 86, 'Title', 1, 245, '', '', 'a', 'ทดสอบ', '2017-04-05 16:45:30', 1, '2017-04-05 16:45:30', 1),
(2, 4, 3, 89, 'Youtube VDO code', 1, 0, '', '', '', '', '2017-04-05 16:43:26', 1, '2017-04-05 16:43:26', 1),
(2, 3, 3, 88, 'Description', 1, 520, '', '', 'a', '', '2017-04-05 16:43:26', 1, '2017-04-05 16:43:26', 1),
(2, 2, 3, 87, 'Author', 1, 100, '', '', 'a', '', '2017-04-05 16:43:26', 1, '2017-04-05 16:43:26', 1),
(2, 1, 3, 86, 'Title', 1, 245, '', '', 'a', '', '2017-04-05 16:43:26', 1, '2017-04-05 16:43:26', 1),
(3, 3, 3, 88, 'Description', 1, 520, '', '', 'a', '', '2017-04-05 16:45:30', 1, '2017-04-05 16:45:30', 1),
(3, 4, 3, 89, 'Youtube VDO code', 1, 0, '', '', '', '', '2017-04-05 16:45:30', 1, '2017-04-05 16:45:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vdo_gallery`
--

CREATE TABLE `vdo_gallery` (
  `aid` int(10) UNSIGNED NOT NULL,
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vdo_gallery`
--

INSERT INTO `vdo_gallery` (`aid`, `parent_aid`, `name`) VALUES
(1, 4, 'old00.jpg'),
(2, 4, 'old01.jpg'),
(3, 4, 'old11.jpg'),
(4, 4, 'old12.jpg'),
(5, 4, 'old14.jpg'),
(8, 4, 'old15.jpg'),
(16, 5, '1.jpg'),
(10, 4, 'old21.jpg'),
(11, 4, 'old22.jpg'),
(12, 4, 'old24.jpg'),
(13, 4, 'old25.jpg'),
(14, 4, 'old26.jpg'),
(15, 4, 'old2121.jpg'),
(17, 5, '2.jpg'),
(18, 5, '3.jpg'),
(19, 5, '4.jpg'),
(20, 5, '5.jpg'),
(21, 6, '2.jpg'),
(22, 6, '3.jpg'),
(23, 6, '4.jpg'),
(24, 6, '5.jpg'),
(25, 6, '6.jpg'),
(26, 7, '2.jpg'),
(27, 7, '3.jpg'),
(28, 7, '4.jpg'),
(29, 7, '5.jpg'),
(30, 7, '6.jpg'),
(31, 8, '2.jpg'),
(32, 8, '3.jpg'),
(33, 8, '4.jpg'),
(34, 8, '5.jpg'),
(35, 8, '6.jpg'),
(36, 9, '1.jpg'),
(37, 9, '2.jpg'),
(38, 9, '3.jpg'),
(39, 9, '4.jpg'),
(40, 9, '5.jpg'),
(41, 10, '2.jpg'),
(42, 10, '3.jpg'),
(43, 10, '4.jpg'),
(44, 10, '5.jpg'),
(45, 10, '6.jpg'),
(46, 5, '6.jpg'),
(47, 11, '2.jpg'),
(48, 11, '3.jpg'),
(49, 11, '4.jpg'),
(50, 11, '5.jpg'),
(51, 11, '6.jpg'),
(52, 12, '1.jpg'),
(53, 12, '2.jpg'),
(54, 12, '3.jpg'),
(55, 12, '4.jpg'),
(56, 12, '5.jpg'),
(57, 13, '2.jpg'),
(58, 13, '3.jpg'),
(59, 13, '4.jpg'),
(60, 13, '5.jpg'),
(61, 13, '6.jpg'),
(62, 15, '3.jpg'),
(63, 15, '4.jpg'),
(64, 15, '5.jpg'),
(65, 15, '6.jpg'),
(66, 17, 'นิทรรศการกรมศิลปากร-page-002.jpg'),
(67, 17, 'นิทรรศการกรมศิลปากร-page-003.jpg'),
(68, 17, 'นิทรรศการกรมศิลปากร-page-004.jpg'),
(69, 17, 'นิทรรศการกรมศิลปากร-page-005.jpg'),
(70, 17, 'นิทรรศการกรมศิลปากร-page-006.jpg'),
(71, 17, 'นิทรรศการกรมศิลปากร-page-007.jpg'),
(72, 17, 'นิทรรศการกรมศิลปากร-page-008.jpg'),
(73, 17, 'นิทรรศการกรมศิลปากร-page-009.jpg'),
(74, 17, 'นิทรรศการกรมศิลปากร-page-010.jpg'),
(75, 39, '01.jpg'),
(76, 39, '02.jpg'),
(77, 41, 'นิทรรศการกรมศิลปากร.pdf'),
(78, 42, '00.jpg'),
(79, 42, '01.jpg'),
(80, 42, '02.jpg'),
(81, 42, '03.jpg'),
(82, 42, '04.jpg'),
(83, 42, '05.jpg'),
(84, 42, '06.jpg'),
(85, 42, '07.jpg'),
(86, 42, '08.jpg'),
(87, 42, '09.jpg'),
(88, 42, '10.jpg'),
(89, 42, '11.jpg'),
(90, 42, '12.jpg'),
(91, 43, '21.jpg'),
(92, 43, '22.jpg'),
(93, 43, '23.jpg'),
(94, 43, '24.jpg'),
(95, 43, '25.jpg'),
(96, 43, '26.jpg'),
(97, 43, '27.jpg'),
(98, 44, 'b_17_e-01.jpg'),
(99, 44, 'b_18_e2-01.jpg'),
(100, 44, 'b_19_e2-01.jpg'),
(101, 44, 'b_20_e-01.jpg'),
(102, 46, 'b_09.jpg'),
(103, 46, 'b_10-01.jpg'),
(104, 46, 'b_11-01.jpg'),
(105, 46, 'b_12-01.jpg'),
(106, 46, 'b_13-01.jpg'),
(107, 46, 'b_14-01.jpg'),
(108, 46, 'b_15-01.jpg'),
(109, 46, 'b_16-01.jpg'),
(110, 47, '70-x-99-B1.jpg'),
(111, 47, '70-x-99-B2.jpg'),
(112, 47, '70-x-99-B3.jpg'),
(113, 47, '70-x-99-B4.jpg'),
(114, 47, '70-x-99-B5.jpg'),
(115, 47, '70-x-99-B6.jpg'),
(116, 47, '70-x-99-B7.jpg'),
(117, 47, '70-x-99-B8.jpg'),
(118, 47, '70-x-99-B9.jpg'),
(119, 47, '70-x-99-B10.jpg'),
(120, 47, '70-x-99-B11.jpg'),
(121, 47, '70-x-99-B12.jpg'),
(122, 48, 'b_01_e-01 (1).jpg'),
(123, 48, 'b_02_e-01.jpg'),
(124, 48, 'b_03_e-01.jpg'),
(125, 48, 'b_04_e-01.jpg'),
(126, 48, 'b_05-01.jpg'),
(127, 48, 'b_06-01 (1).jpg'),
(128, 48, 'b_07-01.jpg'),
(129, 48, 'b_08_e-01.jpg'),
(130, 49, '70x99.5_1.jpg'),
(131, 49, '70x99.5_2.jpg'),
(132, 49, '70x99.5_3.jpg'),
(133, 49, '70x99.5_4.jpg'),
(134, 49, '70x99.5_5.jpg'),
(135, 49, '70x99.5_6.jpg'),
(136, 49, '70x99.5_7.jpg'),
(137, 49, '70x99.5_8.jpg'),
(138, 49, '70x99.5_9.jpg'),
(139, 49, '70x99.5_10.jpg'),
(140, 49, '70x99.5_11.jpg'),
(141, 49, '70x99.5_12.jpg'),
(142, 49, '70x99.5_13.jpg'),
(143, 49, '70x99.5_14.jpg'),
(144, 49, '70x99.5_15.jpg'),
(145, 49, '70x99.5_16.jpg'),
(146, 49, '70x99.5_17.jpg'),
(147, 49, '70x99.5_18.jpg'),
(148, 49, '70x99.5_19.jpg'),
(149, 49, '70x99.5_20.jpg'),
(150, 49, '70x99.5_21.jpg'),
(151, 49, '70x99.5_22.jpg'),
(152, 49, '70x99.5_23.jpg'),
(153, 49, '70x99.5_24.jpg'),
(155, 50, '70-x-99-B1.jpg'),
(156, 50, '70-x-99-B2.jpg'),
(157, 50, '70-x-99-B3.jpg'),
(158, 50, '70-x-99-B4.jpg'),
(159, 50, '70-x-99-B5.jpg'),
(160, 50, '70-x-99-B6.jpg'),
(161, 50, '70-x-99-B7.jpg'),
(162, 50, '70-x-99-B8.jpg'),
(163, 50, '70-x-99-B9.jpg'),
(164, 50, '70-x-99-B10.jpg'),
(165, 50, '70-x-99-B11.jpg'),
(166, 50, '70-x-99-B12.jpg'),
(167, 519, 'IMG_8852.JPG'),
(168, 519, 'IMG_8850.JPG'),
(169, 519, 'IMG_8855.JPG'),
(170, 519, 'IMG_8856.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `vdo_gallerys`
--

CREATE TABLE `vdo_gallerys` (
  `aid` int(10) UNSIGNED NOT NULL,
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `file_name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `weight` float DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vdo_gallerys`
--

INSERT INTO `vdo_gallerys` (`aid`, `user_owner_aid`, `parent_aid`, `title`, `description`, `file_name`, `status`, `weight`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 1, 2, '9789744432001.jpg', '', '220170504160249m48e.jpg', 0, 0, '2017-04-05 16:02:49', 1, '2017-04-05 16:02:49', 1),
(2, 1, 2, '9789744432018.jpg', '', '220170504160249mkce.jpg', 0, 1, '2017-04-05 16:02:49', 1, '2017-04-05 16:02:49', 1),
(3, 1, 2, '9789744432032.jpg', '', '220170504160249B7u2.jpg', 0, 2, '2017-04-05 16:02:49', 1, '2017-04-05 16:02:49', 1),
(4, 1, 2, '9789744432049.jpg', '', '220170504160249uI1x.jpg', 0, 3, '2017-04-05 16:02:49', 1, '2017-04-05 16:02:49', 1),
(5, 1, 2, '9789744432391.jpg', '', '220170504160249zbhe.jpg', 0, 4, '2017-04-05 16:02:49', 1, '2017-04-05 16:02:49', 1),
(6, 1, 3, '9789744434159.jpg', '', '320170504164633QsqV.jpg', 1, 0, '2017-04-05 16:46:33', 1, '2017-04-05 16:46:33', 1),
(7, 1, 3, '9789744434166.jpg', '', '32017050416463389UP.jpg', 1, 1, '2017-04-05 16:46:33', 1, '2017-04-05 16:46:33', 1),
(8, 1, 3, '9789744434197.jpg', '', '3201705041646332rm4.jpg', 1, 2, '2017-04-05 16:46:33', 1, '2017-04-05 16:46:33', 1),
(9, 1, 3, '9789744434234.jpg', '', '320170504164633tW8g.jpg', 1, 3, '2017-04-05 16:46:33', 1, '2017-04-05 16:46:33', 1),
(10, 1, 3, '9789744434258.jpg', '', '320170504164633trU3.jpg', 1, 4, '2017-04-05 16:46:33', 1, '2017-04-05 16:46:33', 1),
(11, 1, 3, '9789744434272.jpg', '', '320170504164633STO3.jpg', 1, 5, '2017-04-05 16:46:33', 1, '2017-04-05 16:46:33', 1),
(12, 1, 3, '9789744434296.jpg', '', '320170504164633Hyu2.jpg', 1, 6, '2017-04-05 16:46:33', 1, '2017-04-05 16:46:33', 1),
(13, 1, 3, '9789744434302.jpg', '', '320170504164633UCJ3.jpg', 1, 7, '2017-04-05 16:46:34', 1, '2017-04-05 16:46:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vdo_ref_product_category`
--

CREATE TABLE `vdo_ref_product_category` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `product_category_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `user_owner_aid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vdo_ref_product_category`
--

INSERT INTO `vdo_ref_product_category` (`parent_aid`, `product_category_aid`, `product_type_aid`, `user_owner_aid`) VALUES
(2, 4, 3, 1),
(3, 4, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vdo_ref_user_section`
--

CREATE TABLE `vdo_ref_user_section` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `copy_aid` int(10) UNSIGNED NOT NULL,
  `user_section_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `rental_period` tinyint(3) UNSIGNED DEFAULT NULL,
  `rental_fee` tinyint(3) UNSIGNED DEFAULT NULL,
  `rental_fee_point` tinyint(3) UNSIGNED DEFAULT NULL,
  `rental_fine_fee` tinyint(3) UNSIGNED DEFAULT NULL,
  `renew_time` tinyint(3) UNSIGNED DEFAULT NULL,
  `renew_period` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vdo_tag`
--

CREATE TABLE `vdo_tag` (
  `parent_aid` int(10) UNSIGNED NOT NULL,
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `user_owner_aid` int(10) UNSIGNED NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `view_all_download_history`
--

CREATE TABLE `view_all_download_history` (
  `aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `copy_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `parent_aid` int(11) NOT NULL DEFAULT '0',
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `product_type_cid` varchar(12) NOT NULL DEFAULT '',
  `is_license` tinyint(4) UNSIGNED DEFAULT NULL,
  `action` char(3) NOT NULL DEFAULT '',
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `parent_title` mediumtext,
  `product_main_name` varchar(100) DEFAULT NULL,
  `product_main_url` varchar(64) DEFAULT NULL,
  `first_name_th` varchar(255) DEFAULT NULL,
  `last_name_th` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `view_all_products`
--

CREATE TABLE `view_all_products` (
  `aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `cid` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `user_owner_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `product_main_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `product_type_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `publisher_aid` int(11) UNSIGNED DEFAULT NULL,
  `title` mediumtext CHARACTER SET utf8,
  `author` mediumtext CHARACTER SET utf8,
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `weight` float DEFAULT NULL,
  `is_new` tinyint(4) DEFAULT NULL,
  `is_recommended` tinyint(4) DEFAULT NULL,
  `is_home` tinyint(4) UNSIGNED DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `upload_path` mediumtext CHARACTER SET utf8,
  `cover_image_file_type` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `uri` mediumtext CHARACTER SET utf8,
  `tag` longtext CHARACTER SET utf8,
  `total_copy` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `total_view` int(11) UNSIGNED DEFAULT NULL,
  `total_download` int(11) UNSIGNED DEFAULT NULL,
  `total_read` int(11) UNSIGNED DEFAULT NULL,
  `total_rental` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `best_price` int(11) UNSIGNED DEFAULT NULL,
  `has_ebook` tinyint(4) UNSIGNED DEFAULT NULL,
  `has_license` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `reward_point` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `review_point` int(11) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `bcc_status` tinyint(4) NOT NULL DEFAULT '0',
  `cover_image` varchar(500) CHARACTER SET utf8 NOT NULL,
  `thumbnail_image` varchar(500) CHARACTER SET utf8 NOT NULL,
  `large_image` varchar(500) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `view_all_products`
--

INSERT INTO `view_all_products` (`aid`, `cid`, `user_owner_aid`, `product_main_aid`, `product_type_aid`, `publisher_aid`, `title`, `author`, `status`, `weight`, `is_new`, `is_recommended`, `is_home`, `publish_date`, `expired_date`, `category`, `upload_path`, `cover_image_file_type`, `uri`, `tag`, `total_copy`, `total_view`, `total_download`, `total_read`, `total_rental`, `best_price`, `has_ebook`, `has_license`, `reward_point`, `review_point`, `created_date`, `created_by`, `updated_date`, `updated_by`, `bcc_status`, `cover_image`, `thumbnail_image`, `large_image`) VALUES
(1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 0, 0, 0, 0, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 0, '', '', ''),
(2, '000002', 1, 3, 1, 30, 'สิ่งแวดล้อม', '', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',2,', 'uploads/dip/book/1/000002/', '.jpg', NULL, '', 1, 26, 0, 0, 0, 0, 1, 0, 12, 0, '2017-03-31 16:56:44', 1, '2017-03-31 17:10:21', 1, 0, '', '', ''),
(3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 0, 0, 0, 0, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 0, '', '', ''),
(1, '000001', 1, 2, 2, 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 0, '', '', ''),
(2, '000002', 1, 4, 2, 37, 'Bookdose Issue. 1', 'bookdose', 1, 0, 0, 0, 1, '2017-04-05', NULL, ',3,', 'uploads/dip/magazine/1/000002/', '.jpg', NULL, '', 1, 4, 0, 0, 0, 0, 1, 0, 11, 0, '2017-04-05 09:11:49', 1, '2017-04-05 10:22:40', 1, 0, '', '', ''),
(2, '000002', 1, 9, 3, 0, 'เจ้าแม่ขายตรง', '', 0, 0, 0, 0, 0, '2017-04-05', NULL, ',4,', 'uploads/dip/vdo/1/000002/', '.jpg', '', '', 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-05 15:05:47', 1, '2017-04-05 16:43:26', 1, 0, '', '', ''),
(3, '000003', 1, 9, 3, 0, 'ทดสอบ', '', 1, 0, 0, 0, 0, '2017-04-05', NULL, ',4,', 'uploads/dip/vdo/1/000003/', '.jpg', '', '', 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-05 16:45:29', 1, '2017-04-05 16:45:30', 1, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `view_all_products_with_detail`
--

CREATE TABLE `view_all_products_with_detail` (
  `aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `cid` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `user_owner_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `product_main_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `product_type_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `publisher_aid` int(11) UNSIGNED DEFAULT NULL,
  `title` mediumtext CHARACTER SET utf8,
  `author` mediumtext CHARACTER SET utf8,
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `weight` float DEFAULT NULL,
  `is_new` tinyint(4) DEFAULT NULL,
  `is_recommended` tinyint(4) DEFAULT NULL,
  `is_home` tinyint(4) UNSIGNED DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `upload_path` mediumtext CHARACTER SET utf8,
  `cover_image_file_type` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `uri` mediumtext CHARACTER SET utf8,
  `tag` longtext CHARACTER SET utf8,
  `total_copy` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `total_view` int(11) UNSIGNED DEFAULT NULL,
  `total_download` int(11) UNSIGNED DEFAULT NULL,
  `total_read` int(11) UNSIGNED DEFAULT NULL,
  `total_rental` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `best_price` int(11) UNSIGNED DEFAULT NULL,
  `has_ebook` tinyint(4) UNSIGNED DEFAULT NULL,
  `has_license` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `reward_point` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `review_point` int(11) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `product_type_cid` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `publisher_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `product_main_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `product_main_url` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `bcc_status` tinyint(4) NOT NULL DEFAULT '0',
  `cover_image` varchar(500) NOT NULL,
  `thumbnail_image` varchar(500) NOT NULL,
  `large_image` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `view_all_products_with_detail`
--

INSERT INTO `view_all_products_with_detail` (`aid`, `cid`, `user_owner_aid`, `product_main_aid`, `product_type_aid`, `publisher_aid`, `title`, `author`, `status`, `weight`, `is_new`, `is_recommended`, `is_home`, `publish_date`, `expired_date`, `category`, `upload_path`, `cover_image_file_type`, `uri`, `tag`, `total_copy`, `total_view`, `total_download`, `total_read`, `total_rental`, `best_price`, `has_ebook`, `has_license`, `reward_point`, `review_point`, `created_date`, `created_by`, `updated_date`, `updated_by`, `product_type_cid`, `publisher_name`, `product_main_name`, `product_main_url`, `bcc_status`, `cover_image`, `thumbnail_image`, `large_image`) VALUES
(1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 0, 0, 0, 0, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 'book', ' อนิเมทกรุ๊ป', 'Book', 'book', 0, '', '', ''),
(2, '000002', 1, 3, 1, 30, 'สิ่งแวดล้อม', '', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',2,', 'uploads/dip/book/1/000002/', '.jpg', NULL, '', 1, 26, 0, 0, 0, 0, 1, 0, 12, 0, '2017-03-31 16:56:44', 1, '2017-03-31 17:10:21', 1, 'book', ' อนิเมทกรุ๊ป', 'E-Book', 'ebooks', 0, '', '', ''),
(3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 0, 0, 0, 0, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 'book', ' สัจจา จันทรวิเชียร', 'Book', 'book', 0, '', '', ''),
(1, '000001', 1, 2, 2, 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 'magazine', ' ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม สำนักงานบริหารและพัฒนาองค์ความรู้ (องค์การมหาชน)', 'Magazine', 'magzine', 0, '', '', ''),
(2, '000002', 1, 4, 2, 37, 'Bookdose Issue. 1', 'bookdose', 1, 0, 0, 0, 1, '2017-04-05', NULL, ',3,', 'uploads/dip/magazine/1/000002/', '.jpg', NULL, '', 1, 4, 0, 0, 0, 0, 1, 0, 11, 0, '2017-04-05 09:11:49', 1, '2017-04-05 10:22:40', 1, 'magazine', ' Thailand Securities Institute (TSI)', 'E-Magazine', 'emagazines', 0, '', '', ''),
(2, '000002', 1, 9, 3, 0, 'เจ้าแม่ขายตรง', '', 0, 0, 0, 0, 0, '2017-04-05', NULL, ',4,', 'uploads/dip/vdo/1/000002/', '.jpg', '', '', 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-05 15:05:47', 1, '2017-04-05 16:43:26', 1, 'vdo', NULL, 'Gallerys', 'photo-gallerys', 0, '', '', ''),
(3, '000003', 1, 9, 3, 0, 'ทดสอบ', '', 1, 0, 0, 0, 0, '2017-04-05', NULL, ',4,', 'uploads/dip/vdo/1/000003/', '.jpg', '', '', 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-05 16:45:29', 1, '2017-04-05 16:45:30', 1, 'vdo', NULL, 'Gallerys', 'photo-gallerys', 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `view_all_product_copies`
--

CREATE TABLE `view_all_product_copies` (
  `aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `cid` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `barcode` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `nonconsume_identifier` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_owner_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `parent_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `product_type_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `product_type_minor_aid` tinyint(4) UNSIGNED DEFAULT NULL,
  `copy_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `upload_path` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `file_upload` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(4) UNSIGNED DEFAULT NULL,
  `no_1` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `no_2` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `no_3` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `no_4` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `call_number` varchar(48) CHARACTER SET utf8 DEFAULT NULL,
  `cover_price` double UNSIGNED DEFAULT NULL,
  `source` mediumtext CHARACTER SET utf8,
  `note_1` mediumtext CHARACTER SET utf8,
  `note_2` mediumtext CHARACTER SET utf8,
  `note_3` mediumtext CHARACTER SET utf8,
  `type` tinyint(4) UNSIGNED DEFAULT NULL,
  `possession` tinyint(4) UNSIGNED DEFAULT NULL,
  `is_license` tinyint(4) UNSIGNED DEFAULT NULL,
  `is_ebook` tinyint(4) NOT NULL DEFAULT '0',
  `ebook_concurrence` tinyint(4) UNSIGNED DEFAULT NULL,
  `digital_price` double UNSIGNED DEFAULT NULL,
  `digital_point` double UNSIGNED DEFAULT NULL,
  `paper_price` double UNSIGNED DEFAULT NULL,
  `paper_point` double UNSIGNED DEFAULT NULL,
  `in_stock` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_period` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fee` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fee_point` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fine_fee` tinyint(4) UNSIGNED DEFAULT NULL,
  `shelf_status` tinyint(4) UNSIGNED DEFAULT NULL,
  `shelf_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `view_all_product_copies`
--

INSERT INTO `view_all_product_copies` (`aid`, `cid`, `barcode`, `nonconsume_identifier`, `user_owner_aid`, `parent_aid`, `product_type_aid`, `product_type_minor_aid`, `copy_title`, `publish_date`, `expired_date`, `weight`, `upload_path`, `file_upload`, `status`, `no_1`, `no_2`, `no_3`, `no_4`, `call_number`, `cover_price`, `source`, `note_1`, `note_2`, `note_3`, `type`, `possession`, `is_license`, `is_ebook`, `ebook_concurrence`, `digital_price`, `digital_point`, `paper_price`, `paper_point`, `in_stock`, `rental_period`, `rental_fee`, `rental_fee_point`, `rental_fine_fee`, `shelf_status`, `shelf_name`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 'phemSQp69uzF', '1234567890', '', 1, 1, 1, 2, 'อภินิหาร', '2017-03-21', NULL, 0, 'uploads/nia/book_copy/2017/03/1234567890_phemSQp69uzF/', NULL, 1, '01', '03', '2015', '', '01 03 2015', 999, '', NULL, NULL, NULL, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, '2', '2017-03-21 15:03:41', 1, '2017-04-05 09:42:27', 1),
(2, 'kFhG4Iu9lm6C', 'B1234567890', '', 1, 2, 1, 3, 'สิ่งแวดล้อม222', '2017-03-31', NULL, 0, 'uploads/dip/book_copy/2017/03/B1234567890_kFhG4Iu9lm6C/', NULL, 1, '', '', '', '', '', 180, '', NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', '2017-03-31 16:57:50', 1, '2017-03-31 17:10:21', 1),
(3, 'oXEpOcJNd6W6', 'PB000001', '', 1, 3, 1, 2, 'Test 2', '2017-03-31', NULL, 0, 'uploads/dip/book_copy/2017/03/PB000001_oXEpOcJNd6W6/', NULL, 1, '', '', '', '', '', 199, '', NULL, NULL, NULL, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '3', '2017-03-31 17:00:28', 1, '2017-04-18 16:43:27', 1),
(1, 'Q8y9XtJJJne1', 'PB000002', '', 1, 1, 2, 2, '', '2017-03-31', NULL, 0, 'uploads/dip/magazine_copy/2017/03/PB000002_Q8y9XtJJJne1/', NULL, 1, '', '', '', '', NULL, 199, '', NULL, NULL, NULL, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', '2017-03-31 17:03:32', 1, '2017-03-31 17:03:32', 1),
(2, 't5M1kfyoPuZf', 'DB000001', '', 1, 2, 2, 3, '', '2017-04-05', NULL, 0, 'uploads/dip/magazine_copy/2017/04/DB000001_t5M1kfyoPuZf/', NULL, 1, '', '', '', '', '', 125, '', NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', '2017-04-05 09:23:52', 1, '2017-04-05 10:22:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `view_all_product_copies_with_detail`
--

CREATE TABLE `view_all_product_copies_with_detail` (
  `aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `cid` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `barcode` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `nonconsume_identifier` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_owner_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `parent_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `product_type_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `product_type_minor_aid` tinyint(4) UNSIGNED DEFAULT NULL,
  `copy_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `upload_path` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `file_upload` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(4) UNSIGNED DEFAULT NULL,
  `no_1` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `no_2` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `no_3` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `no_4` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `call_number` varchar(48) CHARACTER SET utf8 DEFAULT NULL,
  `cover_price` double UNSIGNED DEFAULT NULL,
  `source` mediumtext CHARACTER SET utf8,
  `note_1` mediumtext CHARACTER SET utf8,
  `note_2` mediumtext CHARACTER SET utf8,
  `note_3` mediumtext CHARACTER SET utf8,
  `type` tinyint(4) UNSIGNED DEFAULT NULL,
  `possession` tinyint(4) UNSIGNED DEFAULT NULL,
  `is_license` tinyint(4) UNSIGNED DEFAULT NULL,
  `is_ebook` tinyint(4) NOT NULL DEFAULT '0',
  `ebook_concurrence` tinyint(4) UNSIGNED DEFAULT NULL,
  `digital_price` double UNSIGNED DEFAULT NULL,
  `digital_point` double UNSIGNED DEFAULT NULL,
  `paper_price` double UNSIGNED DEFAULT NULL,
  `paper_point` double UNSIGNED DEFAULT NULL,
  `in_stock` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_period` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fee` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fee_point` tinyint(4) UNSIGNED DEFAULT NULL,
  `rental_fine_fee` tinyint(4) UNSIGNED DEFAULT NULL,
  `shelf_status` tinyint(4) UNSIGNED DEFAULT NULL,
  `shelf_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `product_type_cid` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `product_type_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `parent_cid` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `parent_title` mediumtext CHARACTER SET utf8,
  `parent_author` mediumtext CHARACTER SET utf8,
  `parent_status` tinyint(4) UNSIGNED DEFAULT NULL,
  `parent_weight` float DEFAULT NULL,
  `parent_upload_path` mediumtext CHARACTER SET utf8,
  `parent_cover_image_file_type` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `product_main_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `category` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `view_all_product_copies_with_detail`
--

INSERT INTO `view_all_product_copies_with_detail` (`aid`, `cid`, `barcode`, `nonconsume_identifier`, `user_owner_aid`, `parent_aid`, `product_type_aid`, `product_type_minor_aid`, `copy_title`, `publish_date`, `expired_date`, `weight`, `upload_path`, `file_upload`, `status`, `no_1`, `no_2`, `no_3`, `no_4`, `call_number`, `cover_price`, `source`, `note_1`, `note_2`, `note_3`, `type`, `possession`, `is_license`, `is_ebook`, `ebook_concurrence`, `digital_price`, `digital_point`, `paper_price`, `paper_point`, `in_stock`, `rental_period`, `rental_fee`, `rental_fee_point`, `rental_fine_fee`, `shelf_status`, `shelf_name`, `created_date`, `created_by`, `updated_date`, `updated_by`, `product_type_cid`, `product_type_name`, `parent_cid`, `parent_title`, `parent_author`, `parent_status`, `parent_weight`, `parent_upload_path`, `parent_cover_image_file_type`, `product_main_aid`, `category`) VALUES
(1, 'phemSQp69uzF', '1234567890', '', 1, 1, 1, 2, 'อภินิหาร', '2017-03-21', NULL, 0, 'uploads/nia/book_copy/2017/03/1234567890_phemSQp69uzF/', NULL, 1, '01', '03', '2015', '', '01 03 2015', 999, '', NULL, NULL, NULL, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, '2', '2017-03-21 15:03:41', 1, '2017-04-05 09:42:27', 1, 'book', 'Book', '000001', 'อภินิหาร', 'อภินิหาร', 1, 0, '', '', 1, ',1,'),
(2, 'kFhG4Iu9lm6C', 'B1234567890', '', 1, 2, 1, 3, 'สิ่งแวดล้อม222', '2017-03-31', NULL, 0, 'uploads/dip/book_copy/2017/03/B1234567890_kFhG4Iu9lm6C/', NULL, 1, '', '', '', '', '', 180, '', NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', '2017-03-31 16:57:50', 1, '2017-03-31 17:10:21', 1, 'book', 'Book', '000002', 'สิ่งแวดล้อม', '', 1, 0, 'uploads/dip/book/1/000002/', '.jpg', 3, ',2,'),
(3, 'oXEpOcJNd6W6', 'PB000001', '', 1, 3, 1, 2, 'Test 2', '2017-03-31', NULL, 0, 'uploads/dip/book_copy/2017/03/PB000001_oXEpOcJNd6W6/', NULL, 1, '', '', '', '', '', 199, '', NULL, NULL, NULL, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '3', '2017-03-31 17:00:28', 1, '2017-04-18 16:43:27', 1, 'book', 'Book', '000003', 'Test 2', 'Test 2', 1, 0, 'uploads/dip/book/1/000003/', '.jpg', 1, ',1,'),
(1, 'Q8y9XtJJJne1', 'PB000002', '', 1, 1, 2, 2, '', '2017-03-31', NULL, 0, 'uploads/dip/magazine_copy/2017/03/PB000002_Q8y9XtJJJne1/', NULL, 1, '', '', '', '', NULL, 199, '', NULL, NULL, NULL, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', '2017-03-31 17:03:32', 1, '2017-03-31 17:03:32', 1, 'magazine', 'Magazine', '000001', 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 'uploads/dip/magazine/1/000001/', '.jpg', 2, ''),
(2, 't5M1kfyoPuZf', 'DB000001', '', 1, 2, 2, 3, '', '2017-04-05', NULL, 0, 'uploads/dip/magazine_copy/2017/04/DB000001_t5M1kfyoPuZf/', NULL, 1, '', '', '', '', '', 125, '', NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', '2017-04-05 09:23:52', 1, '2017-04-05 10:22:40', 1, 'magazine', 'Magazine', '000002', 'Bookdose Issue. 1', 'bookdose', 1, 0, 'uploads/dip/magazine/1/000002/', '.jpg', 4, ',3,');

-- --------------------------------------------------------

--
-- Table structure for table `view_all_product_fields`
--

CREATE TABLE `view_all_product_fields` (
  `parent_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sequence` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `product_type_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `product_main_field_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_owner_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `tag` varchar(6) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ind1_cd` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `ind2_cd` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `subfield_cd` char(1) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `field_data` mediumtext CHARACTER SET utf8,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `view_all_product_fields`
--

INSERT INTO `view_all_product_fields` (`parent_aid`, `sequence`, `product_type_aid`, `product_main_field_aid`, `name`, `user_owner_aid`, `tag`, `ind1_cd`, `ind2_cd`, `subfield_cd`, `field_data`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 10, 1, 10, 'Item/Issue No.', 1, '050', '', '', 'b', '1', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1),
(1, 9, 1, 9, 'Publish Year', 1, '050', '', '', 'b', '2015', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1),
(1, 8, 1, 8, 'Author ID', 1, '050', '', '', 'b', '03', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1),
(1, 7, 1, 7, 'Classification No.', 1, '050', '', '', 'a', '01', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1),
(1, 6, 1, 6, 'ISBN', 1, '020', '', '', 'a', '1234567890', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1),
(1, 5, 1, 5, 'Subject', 1, '650', '', '', 'a', 'อภินิหาร', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1),
(1, 4, 1, 4, 'Total pages', 1, '300', '', '', 'a', '120', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1),
(1, 3, 1, 3, 'Description', 1, '520', '', '', 'a', 'อภินิหาร', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1),
(1, 2, 1, 2, 'Author', 1, '100', '', '', 'a', 'ชื่อผู้แต่งแสดงตรงนี้ครับ', '2017-03-21 15:13:31', 1, '2017-04-04 16:49:13', 1),
(1, 1, 1, 1, 'Title', 1, '245', '', '', 'a', 'อภินิหาร', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1),
(1, 11, 1, 11, 'Place of publication', 1, '260', '', '', 'a', 'bkk', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1),
(1, 12, 1, 12, 'Name of publisher', 1, '260', '', '', 'b', 'bkk', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1),
(1, 13, 1, 13, 'Date of publication', 1, '260', '', '', 'c', '02-2015', '2017-03-21 15:13:31', 1, '2017-03-21 15:13:31', 1),
(2, 1, 1, 27, 'Title', 1, '245', '', '', 'a', 'สิ่งแวดล้อม', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1),
(2, 8, 1, 34, 'Date of publication', 1, '260', '', '', 'c', '20 มิ.ย.56', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1),
(2, 7, 1, 33, 'Name of publisher', 1, '260', '', '', 'b', 'สสส', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1),
(2, 6, 1, 32, 'ISBN', 1, '020', '', '', 'a', '1234567890', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1),
(2, 5, 1, 31, 'Subject', 1, '650', '', '', 'a', 'สิ่งแวดล้อม', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1),
(2, 4, 1, 30, 'Total pages', 1, '300', '', '', 'a', '120', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1),
(2, 2, 1, 28, 'Author', 1, '100', '', '', 'a', '', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1),
(2, 3, 1, 29, 'Description', 1, '520', '', '', 'a', 'สิ่งแวดล้อม', '2017-03-31 17:10:21', 1, '2017-03-31 17:10:21', 1),
(3, 11, 1, 11, 'Place of publication', 1, '260', '', '', 'a', '', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1),
(3, 12, 1, 12, 'Name of publisher', 1, '260', '', '', 'b', '', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1),
(3, 10, 1, 10, 'Item/Issue No.', 1, '050', '', '', 'b', '', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1),
(3, 9, 1, 9, 'Publish Year', 1, '050', '', '', 'b', '', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1),
(3, 8, 1, 8, 'Author ID', 1, '050', '', '', 'b', '', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1),
(3, 7, 1, 7, 'Classification No.', 1, '050', '', '', 'a', '', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1),
(3, 6, 1, 6, 'ISBN', 1, '020', '', '', 'a', '32659875421', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1),
(3, 5, 1, 5, 'Subject', 1, '650', '', '', 'a', 'Test 2', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1),
(3, 4, 1, 4, 'Total pages', 1, '300', '', '', 'a', '199', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1),
(3, 3, 1, 3, 'Description', 1, '520', '', '', 'a', 'Test 2', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1),
(3, 2, 1, 2, 'Author', 1, '100', '', '', 'a', 'Test 2', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1),
(3, 1, 1, 1, 'Title', 1, '245', '', '', 'a', 'Test 2', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1),
(3, 13, 1, 13, 'Date of publication', 1, '260', '', '', 'c', '', '2017-04-18 16:43:27', 1, '2017-04-18 16:43:27', 1),
(1, 1, 2, 14, 'Title', 1, '245', '', '', 'a', 'Max Bild Vol. 1 Issue. 1', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 2, 2, 15, 'Author', 1, '100', '', '', 'a', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 3, 2, 16, 'Description', 1, '520', '', '', 'a', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 4, 2, 17, 'Total pages', 1, '300', '', '', 'a', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 5, 2, 18, 'Subject', 1, '650', '', '', 'a', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 6, 2, 19, 'ISSN', 1, '020', '', '', 'a', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 7, 2, 20, 'Classification No.', 1, '050', '', '', 'a', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 8, 2, 21, 'Author ID', 1, '050', '', '', 'b', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 9, 2, 22, 'Publish Year', 1, '050', '', '', 'b', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 10, 2, 23, 'Item/Issue No.', 1, '050', '', '', 'b', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 11, 2, 24, 'Place of publication', 1, '260', '', '', 'a', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 12, 2, 25, 'Name of publisher', 1, '260', '', '', 'b', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(1, 13, 2, 26, 'Date of publication', 1, '260', '', '', 'c', '', '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1),
(2, 8, 2, 42, 'Date of publication', 1, '260', '', '', 'c', '01/05/2017', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(2, 7, 2, 41, 'Name of publisher', 1, '260', '', '', 'b', '', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(2, 5, 2, 39, 'Subject', 1, '650', '', '', 'a', 'รวยพันล้าน วันที่1 เมษา', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(2, 3, 2, 37, 'Description', 1, '520', '', '', 'a', 'Test Description', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(2, 6, 2, 40, 'ISSN', 1, '020', '', '', 'a', 'AB123456789', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(2, 4, 2, 38, 'Total pages', 1, '300', '', '', 'a', '102', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(2, 2, 2, 36, 'Author', 1, '100', '', '', 'a', 'bookdose', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(2, 1, 2, 35, 'Title', 1, '245', '', '', 'a', 'Bookdose Issue. 1', '2017-04-05 10:22:40', 1, '2017-04-05 10:22:40', 1),
(3, 2, 3, 87, 'Author', 1, '100', '', '', 'a', '', '2017-04-05 16:45:30', 1, '2017-04-05 16:45:30', 1),
(3, 1, 3, 86, 'Title', 1, '245', '', '', 'a', 'ทดสอบ', '2017-04-05 16:45:30', 1, '2017-04-05 16:45:30', 1),
(2, 4, 3, 89, 'Youtube VDO code', 1, '0', '', '', '', '', '2017-04-05 16:43:26', 1, '2017-04-05 16:43:26', 1),
(2, 3, 3, 88, 'Description', 1, '520', '', '', 'a', '', '2017-04-05 16:43:26', 1, '2017-04-05 16:43:26', 1),
(2, 2, 3, 87, 'Author', 1, '100', '', '', 'a', '', '2017-04-05 16:43:26', 1, '2017-04-05 16:43:26', 1),
(2, 1, 3, 86, 'Title', 1, '245', '', '', 'a', '', '2017-04-05 16:43:26', 1, '2017-04-05 16:43:26', 1),
(3, 3, 3, 88, 'Description', 1, '520', '', '', 'a', '', '2017-04-05 16:45:30', 1, '2017-04-05 16:45:30', 1),
(3, 4, 3, 89, 'Youtube VDO code', 1, '0', '', '', '', '', '2017-04-05 16:45:30', 1, '2017-04-05 16:45:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `view_all_product_fields_with_detail`
--

CREATE TABLE `view_all_product_fields_with_detail` (
  `sequence` int(10) UNSIGNED NOT NULL,
  `tag` varchar(6) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `field_data` mediumtext CHARACTER SET utf8,
  `product_main_field_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `cid` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `user_owner_aid` int(11) UNSIGNED DEFAULT NULL,
  `product_main_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `product_type_aid` int(11) UNSIGNED DEFAULT NULL,
  `publisher_aid` int(11) UNSIGNED DEFAULT NULL,
  `title` mediumtext CHARACTER SET utf8,
  `author` mediumtext CHARACTER SET utf8,
  `status` tinyint(4) UNSIGNED DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `is_new` tinyint(4) DEFAULT NULL,
  `is_recommended` tinyint(4) DEFAULT NULL,
  `is_home` tinyint(4) UNSIGNED DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `upload_path` mediumtext CHARACTER SET utf8,
  `cover_image_file_type` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `uri` mediumtext CHARACTER SET utf8,
  `product_tag` longtext CHARACTER SET utf8,
  `total_copy` int(11) UNSIGNED DEFAULT NULL,
  `total_view` int(11) UNSIGNED DEFAULT NULL,
  `total_download` int(11) UNSIGNED DEFAULT NULL,
  `total_read` int(11) UNSIGNED DEFAULT NULL,
  `total_rental` int(11) UNSIGNED DEFAULT NULL,
  `best_price` int(11) UNSIGNED DEFAULT NULL,
  `has_ebook` tinyint(4) UNSIGNED DEFAULT NULL,
  `has_license` tinyint(4) UNSIGNED DEFAULT NULL,
  `reward_point` int(11) UNSIGNED DEFAULT NULL,
  `review_point` int(11) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `product_type_cid` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `publisher_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `tag_weight` double NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `view_all_product_fields_with_detail`
--

INSERT INTO `view_all_product_fields_with_detail` (`sequence`, `tag`, `field_data`, `product_main_field_aid`, `aid`, `cid`, `user_owner_aid`, `product_main_aid`, `product_type_aid`, `publisher_aid`, `title`, `author`, `status`, `weight`, `is_new`, `is_recommended`, `is_home`, `publish_date`, `expired_date`, `category`, `upload_path`, `cover_image_file_type`, `uri`, `product_tag`, `total_copy`, `total_view`, `total_download`, `total_read`, `total_rental`, `best_price`, `has_ebook`, `has_license`, `reward_point`, `review_point`, `created_date`, `created_by`, `updated_date`, `updated_by`, `product_type_cid`, `publisher_name`, `tag_weight`) VALUES
(10, '050', '1', 10, 1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 0, 0, 0, 0, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(9, '050', '2015', 9, 1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 0, 0, 0, 0, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(8, '050', '03', 8, 1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 0, 0, 0, 0, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(7, '050', '01', 7, 1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 0, 0, 0, 0, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(6, '020', '1234567890', 6, 1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 0, 0, 0, 0, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(5, '650', 'อภินิหาร', 5, 1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 0, 0, 0, 0, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(4, '300', '120', 4, 1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 0, 0, 0, 0, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(3, '520', 'อภินิหาร', 3, 1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 0, 0, 0, 0, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(2, '100', 'ชื่อผู้แต่งแสดงตรงนี้ครับ', 2, 1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 0, 0, 0, 0, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(1, '245', 'อภินิหาร', 1, 1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 0, 0, 0, 0, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(11, '260', 'bkk', 11, 1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 0, 0, 0, 0, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(12, '260', 'bkk', 12, 1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 0, 0, 0, 0, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(13, '260', '02-2015', 13, 1, '000001', 1, 1, 1, 30, 'อภินิหาร', 'อภินิหาร', 1, 0, 0, 0, 1, '2017-03-21', NULL, ',1,', '', '', NULL, '', 1, 42, 0, 0, 0, 0, 0, 0, 12, 0, '2017-03-21 15:02:10', 1, '2017-03-21 15:13:31', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(1, '245', 'สิ่งแวดล้อม', 27, 2, '000002', 1, 3, 1, 30, 'สิ่งแวดล้อม', '', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',2,', 'uploads/dip/book/1/000002/', '.jpg', NULL, '', 1, 26, 0, 0, 0, 0, 1, 0, 12, 0, '2017-03-31 16:56:44', 1, '2017-03-31 17:10:21', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(8, '260', '20 มิ.ย.56', 34, 2, '000002', 1, 3, 1, 30, 'สิ่งแวดล้อม', '', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',2,', 'uploads/dip/book/1/000002/', '.jpg', NULL, '', 1, 26, 0, 0, 0, 0, 1, 0, 12, 0, '2017-03-31 16:56:44', 1, '2017-03-31 17:10:21', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(7, '260', 'สสส', 33, 2, '000002', 1, 3, 1, 30, 'สิ่งแวดล้อม', '', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',2,', 'uploads/dip/book/1/000002/', '.jpg', NULL, '', 1, 26, 0, 0, 0, 0, 1, 0, 12, 0, '2017-03-31 16:56:44', 1, '2017-03-31 17:10:21', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(6, '020', '1234567890', 32, 2, '000002', 1, 3, 1, 30, 'สิ่งแวดล้อม', '', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',2,', 'uploads/dip/book/1/000002/', '.jpg', NULL, '', 1, 26, 0, 0, 0, 0, 1, 0, 12, 0, '2017-03-31 16:56:44', 1, '2017-03-31 17:10:21', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(5, '650', 'สิ่งแวดล้อม', 31, 2, '000002', 1, 3, 1, 30, 'สิ่งแวดล้อม', '', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',2,', 'uploads/dip/book/1/000002/', '.jpg', NULL, '', 1, 26, 0, 0, 0, 0, 1, 0, 12, 0, '2017-03-31 16:56:44', 1, '2017-03-31 17:10:21', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(4, '300', '120', 30, 2, '000002', 1, 3, 1, 30, 'สิ่งแวดล้อม', '', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',2,', 'uploads/dip/book/1/000002/', '.jpg', NULL, '', 1, 26, 0, 0, 0, 0, 1, 0, 12, 0, '2017-03-31 16:56:44', 1, '2017-03-31 17:10:21', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(2, '100', '', 28, 2, '000002', 1, 3, 1, 30, 'สิ่งแวดล้อม', '', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',2,', 'uploads/dip/book/1/000002/', '.jpg', NULL, '', 1, 26, 0, 0, 0, 0, 1, 0, 12, 0, '2017-03-31 16:56:44', 1, '2017-03-31 17:10:21', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(3, '520', 'สิ่งแวดล้อม', 29, 2, '000002', 1, 3, 1, 30, 'สิ่งแวดล้อม', '', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',2,', 'uploads/dip/book/1/000002/', '.jpg', NULL, '', 1, 26, 0, 0, 0, 0, 1, 0, 12, 0, '2017-03-31 16:56:44', 1, '2017-03-31 17:10:21', 1, 'book', ' อนิเมทกรุ๊ป', 999999),
(11, '260', '', 11, 3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 0, 0, 0, 0, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 'book', ' สัจจา จันทรวิเชียร', 999999),
(12, '260', '', 12, 3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 0, 0, 0, 0, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 'book', ' สัจจา จันทรวิเชียร', 999999),
(10, '050', '', 10, 3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 0, 0, 0, 0, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 'book', ' สัจจา จันทรวิเชียร', 999999),
(9, '050', '', 9, 3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 0, 0, 0, 0, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 'book', ' สัจจา จันทรวิเชียร', 999999),
(8, '050', '', 8, 3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 0, 0, 0, 0, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 'book', ' สัจจา จันทรวิเชียร', 999999),
(7, '050', '', 7, 3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 0, 0, 0, 0, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 'book', ' สัจจา จันทรวิเชียร', 999999),
(6, '020', '32659875421', 6, 3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 0, 0, 0, 0, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 'book', ' สัจจา จันทรวิเชียร', 999999),
(5, '650', 'Test 2', 5, 3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 0, 0, 0, 0, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 'book', ' สัจจา จันทรวิเชียร', 999999),
(4, '300', '199', 4, 3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 0, 0, 0, 0, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 'book', ' สัจจา จันทรวิเชียร', 999999),
(3, '520', 'Test 2', 3, 3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 0, 0, 0, 0, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 'book', ' สัจจา จันทรวิเชียร', 999999),
(2, '100', 'Test 2', 2, 3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 0, 0, 0, 0, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 'book', ' สัจจา จันทรวิเชียร', 999999),
(1, '245', 'Test 2', 1, 3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 0, 0, 0, 0, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 'book', ' สัจจา จันทรวิเชียร', 999999),
(13, '260', '', 13, 3, '000003', 1, 1, 1, 14, 'Test 2', 'Test 2', 1, 0, 0, 0, 1, '2017-03-31', NULL, ',1,', 'uploads/dip/book/1/000003/', '.jpg', NULL, '', 1, 34, 0, 0, 0, 0, 0, 0, 20, 4, '2017-03-31 17:00:00', 1, '2017-04-18 16:43:27', 1, 'book', ' สัจจา จันทรวิเชียร', 999999),
(1, '245', 'Max Bild Vol. 1 Issue. 1', 14, 1, '000001', 1, 2, 2, 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 'magazine', ' ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม สำนักงานบริหารและพัฒนาองค์ความรู้ (องค์การมหาชน)', 999999),
(2, '100', '', 15, 1, '000001', 1, 2, 2, 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 'magazine', ' ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม สำนักงานบริหารและพัฒนาองค์ความรู้ (องค์การมหาชน)', 999999),
(3, '520', '', 16, 1, '000001', 1, 2, 2, 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 'magazine', ' ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม สำนักงานบริหารและพัฒนาองค์ความรู้ (องค์การมหาชน)', 999999),
(4, '300', '', 17, 1, '000001', 1, 2, 2, 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 'magazine', ' ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม สำนักงานบริหารและพัฒนาองค์ความรู้ (องค์การมหาชน)', 999999),
(5, '650', '', 18, 1, '000001', 1, 2, 2, 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 'magazine', ' ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม สำนักงานบริหารและพัฒนาองค์ความรู้ (องค์การมหาชน)', 999999),
(6, '020', '', 19, 1, '000001', 1, 2, 2, 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 'magazine', ' ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม สำนักงานบริหารและพัฒนาองค์ความรู้ (องค์การมหาชน)', 999999),
(7, '050', '', 20, 1, '000001', 1, 2, 2, 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 'magazine', ' ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม สำนักงานบริหารและพัฒนาองค์ความรู้ (องค์การมหาชน)', 999999),
(8, '050', '', 21, 1, '000001', 1, 2, 2, 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 'magazine', ' ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม สำนักงานบริหารและพัฒนาองค์ความรู้ (องค์การมหาชน)', 999999),
(9, '050', '', 22, 1, '000001', 1, 2, 2, 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 'magazine', ' ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม สำนักงานบริหารและพัฒนาองค์ความรู้ (องค์การมหาชน)', 999999),
(10, '050', '', 23, 1, '000001', 1, 2, 2, 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 'magazine', ' ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม สำนักงานบริหารและพัฒนาองค์ความรู้ (องค์การมหาชน)', 999999),
(11, '260', '', 24, 1, '000001', 1, 2, 2, 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 'magazine', ' ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม สำนักงานบริหารและพัฒนาองค์ความรู้ (องค์การมหาชน)', 999999),
(12, '260', '', 25, 1, '000001', 1, 2, 2, 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 'magazine', ' ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม สำนักงานบริหารและพัฒนาองค์ความรู้ (องค์การมหาชน)', 999999),
(13, '260', '', 26, 1, '000001', 1, 2, 2, 39, 'Max Bild Vol. 1 Issue. 1', '', 1, 0, 0, 0, 0, '2017-03-31', NULL, '', 'uploads/dip/magazine/1/000001/', '.jpg', NULL, '', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2017-03-31 17:03:17', 1, '2017-03-31 17:03:17', 1, 'magazine', ' ศูนย์ส่งเสริมและพัฒนาพลังแผ่นดินเชิงคุณธรรม สำนักงานบริหารและพัฒนาองค์ความรู้ (องค์การมหาชน)', 999999),
(8, '260', '01/05/2017', 42, 2, '000002', 1, 4, 2, 37, 'Bookdose Issue. 1', 'bookdose', 1, 0, 0, 0, 1, '2017-04-05', NULL, ',3,', 'uploads/dip/magazine/1/000002/', '.jpg', NULL, '', 1, 4, 0, 0, 0, 0, 1, 0, 11, 0, '2017-04-05 09:11:49', 1, '2017-04-05 10:22:40', 1, 'magazine', ' Thailand Securities Institute (TSI)', 999999),
(7, '260', '', 41, 2, '000002', 1, 4, 2, 37, 'Bookdose Issue. 1', 'bookdose', 1, 0, 0, 0, 1, '2017-04-05', NULL, ',3,', 'uploads/dip/magazine/1/000002/', '.jpg', NULL, '', 1, 4, 0, 0, 0, 0, 1, 0, 11, 0, '2017-04-05 09:11:49', 1, '2017-04-05 10:22:40', 1, 'magazine', ' Thailand Securities Institute (TSI)', 999999),
(5, '650', 'รวยพันล้าน วันที่1 เมษา', 39, 2, '000002', 1, 4, 2, 37, 'Bookdose Issue. 1', 'bookdose', 1, 0, 0, 0, 1, '2017-04-05', NULL, ',3,', 'uploads/dip/magazine/1/000002/', '.jpg', NULL, '', 1, 4, 0, 0, 0, 0, 1, 0, 11, 0, '2017-04-05 09:11:49', 1, '2017-04-05 10:22:40', 1, 'magazine', ' Thailand Securities Institute (TSI)', 999999),
(3, '520', 'Test Description', 37, 2, '000002', 1, 4, 2, 37, 'Bookdose Issue. 1', 'bookdose', 1, 0, 0, 0, 1, '2017-04-05', NULL, ',3,', 'uploads/dip/magazine/1/000002/', '.jpg', NULL, '', 1, 4, 0, 0, 0, 0, 1, 0, 11, 0, '2017-04-05 09:11:49', 1, '2017-04-05 10:22:40', 1, 'magazine', ' Thailand Securities Institute (TSI)', 999999),
(6, '020', 'AB123456789', 40, 2, '000002', 1, 4, 2, 37, 'Bookdose Issue. 1', 'bookdose', 1, 0, 0, 0, 1, '2017-04-05', NULL, ',3,', 'uploads/dip/magazine/1/000002/', '.jpg', NULL, '', 1, 4, 0, 0, 0, 0, 1, 0, 11, 0, '2017-04-05 09:11:49', 1, '2017-04-05 10:22:40', 1, 'magazine', ' Thailand Securities Institute (TSI)', 999999),
(4, '300', '102', 38, 2, '000002', 1, 4, 2, 37, 'Bookdose Issue. 1', 'bookdose', 1, 0, 0, 0, 1, '2017-04-05', NULL, ',3,', 'uploads/dip/magazine/1/000002/', '.jpg', NULL, '', 1, 4, 0, 0, 0, 0, 1, 0, 11, 0, '2017-04-05 09:11:49', 1, '2017-04-05 10:22:40', 1, 'magazine', ' Thailand Securities Institute (TSI)', 999999),
(2, '100', 'bookdose', 36, 2, '000002', 1, 4, 2, 37, 'Bookdose Issue. 1', 'bookdose', 1, 0, 0, 0, 1, '2017-04-05', NULL, ',3,', 'uploads/dip/magazine/1/000002/', '.jpg', NULL, '', 1, 4, 0, 0, 0, 0, 1, 0, 11, 0, '2017-04-05 09:11:49', 1, '2017-04-05 10:22:40', 1, 'magazine', ' Thailand Securities Institute (TSI)', 999999),
(1, '245', 'Bookdose Issue. 1', 35, 2, '000002', 1, 4, 2, 37, 'Bookdose Issue. 1', 'bookdose', 1, 0, 0, 0, 1, '2017-04-05', NULL, ',3,', 'uploads/dip/magazine/1/000002/', '.jpg', NULL, '', 1, 4, 0, 0, 0, 0, 1, 0, 11, 0, '2017-04-05 09:11:49', 1, '2017-04-05 10:22:40', 1, 'magazine', ' Thailand Securities Institute (TSI)', 999999),
(2, '100', '', 87, 3, '000003', 1, 9, 3, 0, 'ทดสอบ', '', 1, 0, 0, 0, 0, '2017-04-05', NULL, ',4,', 'uploads/dip/vdo/1/000003/', '.jpg', '', '', 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-05 16:45:29', 1, '2017-04-05 16:45:30', 1, 'vdo', NULL, 999999),
(1, '245', 'ทดสอบ', 86, 3, '000003', 1, 9, 3, 0, 'ทดสอบ', '', 1, 0, 0, 0, 0, '2017-04-05', NULL, ',4,', 'uploads/dip/vdo/1/000003/', '.jpg', '', '', 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-05 16:45:29', 1, '2017-04-05 16:45:30', 1, 'vdo', NULL, 999999),
(4, '0', '', 89, 2, '000002', 1, 9, 3, 0, 'เจ้าแม่ขายตรง', '', 0, 0, 0, 0, 0, '2017-04-05', NULL, ',4,', 'uploads/dip/vdo/1/000002/', '.jpg', '', '', 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-05 15:05:47', 1, '2017-04-05 16:43:26', 1, 'vdo', NULL, 999999),
(3, '520', '', 88, 2, '000002', 1, 9, 3, 0, 'เจ้าแม่ขายตรง', '', 0, 0, 0, 0, 0, '2017-04-05', NULL, ',4,', 'uploads/dip/vdo/1/000002/', '.jpg', '', '', 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-05 15:05:47', 1, '2017-04-05 16:43:26', 1, 'vdo', NULL, 999999),
(2, '100', '', 87, 2, '000002', 1, 9, 3, 0, 'เจ้าแม่ขายตรง', '', 0, 0, 0, 0, 0, '2017-04-05', NULL, ',4,', 'uploads/dip/vdo/1/000002/', '.jpg', '', '', 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-05 15:05:47', 1, '2017-04-05 16:43:26', 1, 'vdo', NULL, 999999),
(1, '245', '', 86, 2, '000002', 1, 9, 3, 0, 'เจ้าแม่ขายตรง', '', 0, 0, 0, 0, 0, '2017-04-05', NULL, ',4,', 'uploads/dip/vdo/1/000002/', '.jpg', '', '', 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-05 15:05:47', 1, '2017-04-05 16:43:26', 1, 'vdo', NULL, 999999),
(3, '520', '', 88, 3, '000003', 1, 9, 3, 0, 'ทดสอบ', '', 1, 0, 0, 0, 0, '2017-04-05', NULL, ',4,', 'uploads/dip/vdo/1/000003/', '.jpg', '', '', 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-05 16:45:29', 1, '2017-04-05 16:45:30', 1, 'vdo', NULL, 999999),
(4, '0', '', 89, 3, '000003', 1, 9, 3, 0, 'ทดสอบ', '', 1, 0, 0, 0, 0, '2017-04-05', NULL, ',4,', 'uploads/dip/vdo/1/000003/', '.jpg', '', '', 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-05 16:45:29', 1, '2017-04-05 16:45:30', 1, 'vdo', NULL, 999999);

-- --------------------------------------------------------

--
-- Table structure for table `view_all_product_tags`
--

CREATE TABLE `view_all_product_tags` (
  `parent_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `user_owner_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `tag` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `view_all_product_tags_with_detail`
--

CREATE TABLE `view_all_product_tags_with_detail` (
  `tag` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `cid` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `product_type_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `product_main_aid` int(11) UNSIGNED DEFAULT NULL,
  `title` mediumtext CHARACTER SET utf8,
  `author` mediumtext CHARACTER SET utf8,
  `publisher_aid` int(11) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) UNSIGNED DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `is_new` tinyint(4) DEFAULT NULL,
  `is_recommended` tinyint(4) DEFAULT NULL,
  `is_home` tinyint(4) UNSIGNED DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `upload_path` mediumtext CHARACTER SET utf8,
  `cover_image_file_type` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `total_copy` int(11) UNSIGNED DEFAULT NULL,
  `total_view` int(11) UNSIGNED DEFAULT NULL,
  `total_download` int(11) UNSIGNED DEFAULT NULL,
  `total_read` int(11) UNSIGNED DEFAULT NULL,
  `review_point` int(11) UNSIGNED DEFAULT NULL,
  `best_price` int(11) UNSIGNED DEFAULT NULL,
  `has_ebook` tinyint(4) UNSIGNED DEFAULT NULL,
  `has_license` tinyint(4) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `view_all_reserve`
--

CREATE TABLE `view_all_reserve` (
  `aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `copy_aid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `parent_aid` int(11) NOT NULL DEFAULT '0',
  `product_type_aid` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `product_type_cid` varchar(12) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `parent_title` mediumtext CHARACTER SET utf8,
  `product_main_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `product_main_url` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `first_name_th` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `last_name_th` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `view_most_comments`
--

CREATE TABLE `view_most_comments` (
  `aid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(32) DEFAULT NULL,
  `first_name_th` varchar(255) DEFAULT NULL,
  `last_name_th` varchar(255) DEFAULT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  `avatar_type` varchar(6) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `department` smallint(5) UNSIGNED DEFAULT NULL,
  `total_comment` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `view_popular_categories`
--

CREATE TABLE `view_popular_categories` (
  `aid` int(10) UNSIGNED NOT NULL,
  `product_main_name` char(100) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `total` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_transaction`
-- (See below for the actual view)
--
CREATE TABLE `view_transaction` (
`user_aid` int(10) unsigned
,`parent_aid` int(10) unsigned
,`cid` varchar(13)
,`first_name_th` varchar(255)
,`last_name_th` varchar(255)
,`borrowing_date` datetime
);

-- --------------------------------------------------------

--
-- Structure for view `view_transaction`
--
DROP TABLE IF EXISTS `view_transaction`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_transaction`  AS  (select `transaction`.`user_aid` AS `user_aid`,`transaction`.`parent_aid` AS `parent_aid`,`user`.`cid` AS `cid`,`user`.`first_name_th` AS `first_name_th`,`user`.`last_name_th` AS `last_name_th`,`transaction`.`borrowing_date` AS `borrowing_date` from (`transaction` join `user` on((`user`.`aid` = `transaction`.`user_aid`))) group by `transaction`.`user_aid`,`transaction`.`parent_aid`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `ads_category`
--
ALTER TABLE `ads_category`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `book_copy`
--
ALTER TABLE `book_copy`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `code` (`barcode`) USING BTREE;

--
-- Indexes for table `book_field`
--
ALTER TABLE `book_field`
  ADD PRIMARY KEY (`parent_aid`,`sequence`);

--
-- Indexes for table `book_ref_product_category`
--
ALTER TABLE `book_ref_product_category`
  ADD PRIMARY KEY (`parent_aid`,`product_category_aid`,`product_type_aid`,`user_owner_aid`);

--
-- Indexes for table `book_ref_user_section`
--
ALTER TABLE `book_ref_user_section`
  ADD PRIMARY KEY (`parent_aid`,`copy_aid`,`user_section_aid`,`product_type_aid`,`user_owner_aid`);

--
-- Indexes for table `book_tag`
--
ALTER TABLE `book_tag`
  ADD PRIMARY KEY (`parent_aid`,`product_type_aid`,`user_owner_aid`,`tag`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `contact_msg`
--
ALTER TABLE `contact_msg`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `contact_topic`
--
ALTER TABLE `contact_topic`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `copy_download`
--
ALTER TABLE `copy_download`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `device_message`
--
ALTER TABLE `device_message`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `device_register`
--
ALTER TABLE `device_register`
  ADD PRIMARY KEY (`device`,`device_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `event_category`
--
ALTER TABLE `event_category`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `event_comment`
--
ALTER TABLE `event_comment`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `parent_event_aid` (`parent_event_aid`),
  ADD KEY `parent_event_aid_2` (`parent_event_aid`,`status`),
  ADD KEY `parent_comment_aid` (`parent_comment_aid`,`status`),
  ADD KEY `parent_event_aid_3` (`parent_event_aid`,`parent_comment_aid`,`created_by`),
  ADD KEY `parent_event_aid_4` (`parent_event_aid`,`status`,`created_by`);

--
-- Indexes for table `event_comment_user_activity`
--
ALTER TABLE `event_comment_user_activity`
  ADD PRIMARY KEY (`event_comment_aid`,`user_aid`);

--
-- Indexes for table `event_gallery`
--
ALTER TABLE `event_gallery`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `event_main`
--
ALTER TABLE `event_main`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `event_upload`
--
ALTER TABLE `event_upload`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `event_user_activity_join`
--
ALTER TABLE `event_user_activity_join`
  ADD PRIMARY KEY (`event_aid`,`user_aid`),
  ADD KEY `event_aid` (`event_aid`,`user_aid`,`has_joined`);

--
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `user_org_aid` (`user_owner_aid`) USING BTREE;

--
-- Indexes for table `holiday_weekend`
--
ALTER TABLE `holiday_weekend`
  ADD PRIMARY KEY (`user_owner_aid`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `log_access_product`
--
ALTER TABLE `log_access_product`
  ADD PRIMARY KEY (`user_aid`,`copy_aid`,`parent_aid`,`product_type_aid`,`updated_date`);

--
-- Indexes for table `log_paysbuy`
--
ALTER TABLE `log_paysbuy`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `log_product`
--
ALTER TABLE `log_product`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `log_webservice`
--
ALTER TABLE `log_webservice`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `magazine`
--
ALTER TABLE `magazine`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `magazine_copy`
--
ALTER TABLE `magazine_copy`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `code` (`barcode`) USING BTREE;

--
-- Indexes for table `magazine_field`
--
ALTER TABLE `magazine_field`
  ADD PRIMARY KEY (`parent_aid`,`sequence`);

--
-- Indexes for table `magazine_main`
--
ALTER TABLE `magazine_main`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `magazine_main_subscription`
--
ALTER TABLE `magazine_main_subscription`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `magazine_ref_product_category`
--
ALTER TABLE `magazine_ref_product_category`
  ADD PRIMARY KEY (`parent_aid`,`product_category_aid`,`product_type_aid`,`user_owner_aid`);

--
-- Indexes for table `magazine_ref_user_section`
--
ALTER TABLE `magazine_ref_user_section`
  ADD PRIMARY KEY (`parent_aid`,`copy_aid`,`user_section_aid`,`product_type_aid`,`user_owner_aid`);

--
-- Indexes for table `magazine_tag`
--
ALTER TABLE `magazine_tag`
  ADD PRIMARY KEY (`parent_aid`,`product_type_aid`,`user_owner_aid`,`tag`);

--
-- Indexes for table `master_country`
--
ALTER TABLE `master_country`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `master_member_type`
--
ALTER TABLE `master_member_type`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `cid` (`cid`) USING BTREE;

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `news_category`
--
ALTER TABLE `news_category`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `news_comment`
--
ALTER TABLE `news_comment`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `parent_news_aid` (`parent_news_aid`) USING BTREE,
  ADD KEY `parent_news_aid_2` (`parent_news_aid`,`status`) USING BTREE,
  ADD KEY `parent_comment_aid` (`parent_comment_aid`,`status`) USING BTREE,
  ADD KEY `parent_news_aid_3` (`parent_news_aid`,`parent_comment_aid`,`created_by`) USING BTREE,
  ADD KEY `parent_news_aid_4` (`parent_news_aid`,`status`,`created_by`) USING BTREE;

--
-- Indexes for table `news_comment_user_activity`
--
ALTER TABLE `news_comment_user_activity`
  ADD PRIMARY KEY (`news_comment_aid`,`user_aid`),
  ADD KEY `news_comment_aid` (`news_comment_aid`,`status_wow`) USING BTREE,
  ADD KEY `news_comment_aid_2` (`news_comment_aid`,`user_aid`,`status_wow`) USING BTREE;

--
-- Indexes for table `news_gallery`
--
ALTER TABLE `news_gallery`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `news_main`
--
ALTER TABLE `news_main`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `news_upload`
--
ALTER TABLE `news_upload`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `news_user_activity`
--
ALTER TABLE `news_user_activity`
  ADD PRIMARY KEY (`news_aid`,`user_aid`),
  ADD KEY `news_aid` (`news_aid`,`status_wow`) USING BTREE,
  ADD KEY `news_aid_2` (`news_aid`,`user_aid`,`status_wow`) USING BTREE,
  ADD KEY `news_aid_3` (`news_aid`,`status_cheer`) USING BTREE,
  ADD KEY `news_aid_4` (`news_aid`,`user_aid`,`status_cheer`) USING BTREE,
  ADD KEY `news_aid_5` (`news_aid`,`status_thanks`) USING BTREE,
  ADD KEY `news_aid_6` (`news_aid`,`user_aid`,`status_thanks`) USING BTREE;

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_main_aid`,`issue_aid`);

--
-- Indexes for table `order_main`
--
ALTER TABLE `order_main`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `order_receipt`
--
ALTER TABLE `order_receipt`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `others`
--
ALTER TABLE `others`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `others_copy`
--
ALTER TABLE `others_copy`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `code` (`barcode`) USING BTREE;

--
-- Indexes for table `others_field`
--
ALTER TABLE `others_field`
  ADD PRIMARY KEY (`parent_aid`,`sequence`);

--
-- Indexes for table `others_ref_product_category`
--
ALTER TABLE `others_ref_product_category`
  ADD PRIMARY KEY (`parent_aid`,`product_category_aid`,`product_type_aid`,`user_owner_aid`);

--
-- Indexes for table `others_ref_user_section`
--
ALTER TABLE `others_ref_user_section`
  ADD PRIMARY KEY (`parent_aid`,`copy_aid`,`user_section_aid`,`product_type_aid`,`user_owner_aid`);

--
-- Indexes for table `others_tag`
--
ALTER TABLE `others_tag`
  ADD PRIMARY KEY (`parent_aid`,`product_type_aid`,`user_owner_aid`,`tag`);

--
-- Indexes for table `package_point`
--
ALTER TABLE `package_point`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `point_history`
--
ALTER TABLE `point_history`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `product_category_ref_user_section`
--
ALTER TABLE `product_category_ref_user_section`
  ADD PRIMARY KEY (`product_category_aid`,`user_section_aid`,`user_owner_aid`);

--
-- Indexes for table `product_main`
--
ALTER TABLE `product_main`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `product_main_field`
--
ALTER TABLE `product_main_field`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `product_topic`
--
ALTER TABLE `product_topic`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `product_topic_main`
--
ALTER TABLE `product_topic_main`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `product_type_minor`
--
ALTER TABLE `product_type_minor`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `questionaire`
--
ALTER TABLE `questionaire`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `questionaire_category`
--
ALTER TABLE `questionaire_category`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `questionaire_question`
--
ALTER TABLE `questionaire_question`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `questionaire_aid` (`questionaire_aid`);

--
-- Indexes for table `questionaire_question_choice`
--
ALTER TABLE `questionaire_question_choice`
  ADD KEY `questionaire_aid` (`questionaire_aid`),
  ADD KEY `question_aid` (`question_aid`),
  ADD KEY `questionaire_aid_2` (`questionaire_aid`,`question_aid`);

--
-- Indexes for table `questionaire_user_activity`
--
ALTER TABLE `questionaire_user_activity`
  ADD PRIMARY KEY (`questionaire_aid`,`user_aid`),
  ADD KEY `questionaire_aid` (`questionaire_aid`,`user_aid`,`has_submitted`);

--
-- Indexes for table `reserve`
--
ALTER TABLE `reserve`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `reserve_product`
--
ALTER TABLE `reserve_product`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`user_aid`,`product_type_aid`,`parent_aid`);

--
-- Indexes for table `review_history`
--
ALTER TABLE `review_history`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `search_history`
--
ALTER TABLE `search_history`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `search_history_backup`
--
ALTER TABLE `search_history_backup`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `search_order`
--
ALTER TABLE `search_order`
  ADD PRIMARY KEY (`tag`);

--
-- Indexes for table `setting_config`
--
ALTER TABLE `setting_config`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `setting_running`
--
ALTER TABLE `setting_running`
  ADD PRIMARY KEY (`year`);

--
-- Indexes for table `shelf`
--
ALTER TABLE `shelf`
  ADD PRIMARY KEY (`user_aid`,`copy_aid`,`product_type_aid`);

--
-- Indexes for table `shelf_history`
--
ALTER TABLE `shelf_history`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `shelf_vdo`
--
ALTER TABLE `shelf_vdo`
  ADD PRIMARY KEY (`user_aid`,`product_type_aid`,`parent_aid`);

--
-- Indexes for table `shelf_vdo_history`
--
ALTER TABLE `shelf_vdo_history`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `member_aid` (`user_aid`) USING BTREE,
  ADD KEY `borrowing_date` (`borrowing_date`) USING BTREE,
  ADD KEY `book_aid` (`product_main_aid`) USING BTREE,
  ADD KEY `book_issue_aid` (`product_type_aid`) USING BTREE;

--
-- Indexes for table `transaction_income`
--
ALTER TABLE `transaction_income`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `member_aid` (`member_aid`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `user_role_aid` (`user_role_aid`) USING BTREE;

--
-- Indexes for table `user_department`
--
ALTER TABLE `user_department`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `user_department_`
--
ALTER TABLE `user_department_`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `user_domain`
--
ALTER TABLE `user_domain`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `user_domain_`
--
ALTER TABLE `user_domain_`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `user_login_history`
--
ALTER TABLE `user_login_history`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `user_login_social`
--
ALTER TABLE `user_login_social`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `user_owner`
--
ALTER TABLE `user_owner`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `alias` (`alias`) USING BTREE;

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `user_section`
--
ALTER TABLE `user_section`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `user_setting_profile`
--
ALTER TABLE `user_setting_profile`
  ADD PRIMARY KEY (`user_aid`,`type`,`aid`);

--
-- Indexes for table `usmarc_block_dm`
--
ALTER TABLE `usmarc_block_dm`
  ADD PRIMARY KEY (`block_nmbr`);

--
-- Indexes for table `usmarc_indicator_dm`
--
ALTER TABLE `usmarc_indicator_dm`
  ADD PRIMARY KEY (`tag`,`indicator_nmbr`,`indicator_cd`);

--
-- Indexes for table `usmarc_subfield_dm`
--
ALTER TABLE `usmarc_subfield_dm`
  ADD PRIMARY KEY (`tag`,`subfield_cd`);

--
-- Indexes for table `usmarc_tag_dm`
--
ALTER TABLE `usmarc_tag_dm`
  ADD PRIMARY KEY (`block_nmbr`,`tag`);

--
-- Indexes for table `vdo`
--
ALTER TABLE `vdo`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `vdo_copy`
--
ALTER TABLE `vdo_copy`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `code` (`barcode`) USING BTREE;

--
-- Indexes for table `vdo_field`
--
ALTER TABLE `vdo_field`
  ADD PRIMARY KEY (`parent_aid`,`sequence`);

--
-- Indexes for table `vdo_gallery`
--
ALTER TABLE `vdo_gallery`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `vdo_gallerys`
--
ALTER TABLE `vdo_gallerys`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `vdo_ref_product_category`
--
ALTER TABLE `vdo_ref_product_category`
  ADD PRIMARY KEY (`parent_aid`,`product_category_aid`,`product_type_aid`,`user_owner_aid`);

--
-- Indexes for table `vdo_ref_user_section`
--
ALTER TABLE `vdo_ref_user_section`
  ADD PRIMARY KEY (`parent_aid`,`copy_aid`,`user_section_aid`,`product_type_aid`,`user_owner_aid`);

--
-- Indexes for table `vdo_tag`
--
ALTER TABLE `vdo_tag`
  ADD PRIMARY KEY (`parent_aid`,`product_type_aid`,`user_owner_aid`,`tag`);

--
-- Indexes for table `view_all_download_history`
--
ALTER TABLE `view_all_download_history`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `view_all_products`
--
ALTER TABLE `view_all_products`
  ADD PRIMARY KEY (`aid`,`product_main_aid`);

--
-- Indexes for table `view_all_products_with_detail`
--
ALTER TABLE `view_all_products_with_detail`
  ADD PRIMARY KEY (`aid`,`product_main_aid`);

--
-- Indexes for table `view_all_product_copies`
--
ALTER TABLE `view_all_product_copies`
  ADD PRIMARY KEY (`aid`,`cid`,`barcode`,`product_type_aid`);

--
-- Indexes for table `view_all_product_copies_with_detail`
--
ALTER TABLE `view_all_product_copies_with_detail`
  ADD PRIMARY KEY (`aid`,`product_main_aid`);

--
-- Indexes for table `view_all_product_fields`
--
ALTER TABLE `view_all_product_fields`
  ADD PRIMARY KEY (`parent_aid`,`sequence`,`product_type_aid`);

--
-- Indexes for table `view_all_product_fields_with_detail`
--
ALTER TABLE `view_all_product_fields_with_detail`
  ADD PRIMARY KEY (`sequence`,`aid`,`product_main_aid`);

--
-- Indexes for table `view_all_product_tags`
--
ALTER TABLE `view_all_product_tags`
  ADD PRIMARY KEY (`parent_aid`,`product_type_aid`,`user_owner_aid`,`tag`);

--
-- Indexes for table `view_all_product_tags_with_detail`
--
ALTER TABLE `view_all_product_tags_with_detail`
  ADD PRIMARY KEY (`tag`,`aid`,`product_type_aid`);

--
-- Indexes for table `view_all_reserve`
--
ALTER TABLE `view_all_reserve`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `view_most_comments`
--
ALTER TABLE `view_most_comments`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `view_popular_categories`
--
ALTER TABLE `view_popular_categories`
  ADD PRIMARY KEY (`aid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ads_category`
--
ALTER TABLE `ads_category`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `book_copy`
--
ALTER TABLE `book_copy`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_msg`
--
ALTER TABLE `contact_msg`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_topic`
--
ALTER TABLE `contact_topic`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `copy_download`
--
ALTER TABLE `copy_download`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `device_message`
--
ALTER TABLE `device_message`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `event_category`
--
ALTER TABLE `event_category`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `event_comment`
--
ALTER TABLE `event_comment`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_gallery`
--
ALTER TABLE `event_gallery`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_main`
--
ALTER TABLE `event_main`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `event_upload`
--
ALTER TABLE `event_upload`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `holiday`
--
ALTER TABLE `holiday`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;
--
-- AUTO_INCREMENT for table `log_paysbuy`
--
ALTER TABLE `log_paysbuy`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log_product`
--
ALTER TABLE `log_product`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `log_webservice`
--
ALTER TABLE `log_webservice`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `magazine`
--
ALTER TABLE `magazine`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `magazine_copy`
--
ALTER TABLE `magazine_copy`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `magazine_main`
--
ALTER TABLE `magazine_main`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `magazine_main_subscription`
--
ALTER TABLE `magazine_main_subscription`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `master_country`
--
ALTER TABLE `master_country`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;
--
-- AUTO_INCREMENT for table `master_member_type`
--
ALTER TABLE `master_member_type`
  MODIFY `aid` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `news_category`
--
ALTER TABLE `news_category`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `news_comment`
--
ALTER TABLE `news_comment`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `news_gallery`
--
ALTER TABLE `news_gallery`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `news_main`
--
ALTER TABLE `news_main`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `news_upload`
--
ALTER TABLE `news_upload`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_main`
--
ALTER TABLE `order_main`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_receipt`
--
ALTER TABLE `order_receipt`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `others`
--
ALTER TABLE `others`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `others_copy`
--
ALTER TABLE `others_copy`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `package_point`
--
ALTER TABLE `package_point`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `point_history`
--
ALTER TABLE `point_history`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `product_main`
--
ALTER TABLE `product_main`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `product_main_field`
--
ALTER TABLE `product_main_field`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `product_topic`
--
ALTER TABLE `product_topic`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_topic_main`
--
ALTER TABLE `product_topic_main`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `aid` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `product_type_minor`
--
ALTER TABLE `product_type_minor`
  MODIFY `aid` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `questionaire`
--
ALTER TABLE `questionaire`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `questionaire_category`
--
ALTER TABLE `questionaire_category`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `questionaire_question`
--
ALTER TABLE `questionaire_question`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `reserve`
--
ALTER TABLE `reserve`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reserve_product`
--
ALTER TABLE `reserve_product`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `review_history`
--
ALTER TABLE `review_history`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `search_history`
--
ALTER TABLE `search_history`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `search_history_backup`
--
ALTER TABLE `search_history_backup`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `setting_config`
--
ALTER TABLE `setting_config`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `shelf_history`
--
ALTER TABLE `shelf_history`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shelf_vdo_history`
--
ALTER TABLE `shelf_vdo_history`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `transaction_income`
--
ALTER TABLE `transaction_income`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `user_department`
--
ALTER TABLE `user_department`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `user_department_`
--
ALTER TABLE `user_department_`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_domain`
--
ALTER TABLE `user_domain`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_domain_`
--
ALTER TABLE `user_domain_`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_login_history`
--
ALTER TABLE `user_login_history`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `user_login_social`
--
ALTER TABLE `user_login_social`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_owner`
--
ALTER TABLE `user_owner`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_section`
--
ALTER TABLE `user_section`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vdo`
--
ALTER TABLE `vdo`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vdo_copy`
--
ALTER TABLE `vdo_copy`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vdo_gallery`
--
ALTER TABLE `vdo_gallery`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT for table `vdo_gallerys`
--
ALTER TABLE `vdo_gallerys`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `view_popular_categories`
--
ALTER TABLE `view_popular_categories`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
