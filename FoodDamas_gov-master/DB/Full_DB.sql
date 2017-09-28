-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table foodtruck.tbl_cart
CREATE TABLE IF NOT EXISTS `tbl_cart` (
  `cno` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `mno` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_out` tinyint(4) NOT NULL,
  PRIMARY KEY (`cno`),
  KEY `FK_tbl_cart_tbl_customer` (`c_id`),
  KEY `FK_tbl_cart_tbl_ft_menu` (`mno`),
  CONSTRAINT `FK_tbl_cart_tbl_customer` FOREIGN KEY (`c_id`) REFERENCES `tbl_customer` (`c_id`),
  CONSTRAINT `FK_tbl_cart_tbl_ft_menu` FOREIGN KEY (`mno`) REFERENCES `tbl_ft_menu` (`mno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_cart: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cart` ENABLE KEYS */;


-- Dumping structure for table foodtruck.tbl_customer
CREATE TABLE IF NOT EXISTS `tbl_customer` (
  `c_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `c_pw` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_phone` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_mail` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `k_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `k_nick` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_img` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb_img` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_customer: ~11 rows (approximately)
/*!40000 ALTER TABLE `tbl_customer` DISABLE KEYS */;
INSERT INTO `tbl_customer` (`c_id`, `c_pw`, `c_phone`, `c_address`, `c_mail`, `k_id`, `k_nick`, `profile_img`, `thumb_img`, `regdate`) VALUES
	('beuteu', '1212', '12312321', '주소넣는곳', 'beuteu@nate.com', NULL, NULL, NULL, NULL, '2016-08-11 21:32:09'),
	('foodtruck1', '1234', '12312312', 'address', 'email', NULL, NULL, NULL, NULL, '2016-10-05 20:30:06'),
	('kwon', 'kwon', '12312321', '주소넣는곳', 'beuteu@nate.com', NULL, NULL, NULL, NULL, '2016-09-12 21:32:09'),
	('lky', 'lky', '12312321', '주소넣는곳', 'beuteu@nate.com', NULL, NULL, NULL, NULL, '2016-09-12 21:32:09'),
	('quang', 'quang', '12312312', 'my address 1', 'my email 1', NULL, NULL, NULL, NULL, '2016-10-02 15:25:45'),
	('user1', 'user1', '12312312321', 'address', 'email', NULL, NULL, NULL, NULL, '2016-10-03 04:15:33'),
	('user2', 'user2', '123123213', 'address', 'email', NULL, NULL, NULL, NULL, '2016-10-03 04:16:03'),
	('user3', 'user3', '123123123', 'address', 'email', NULL, NULL, NULL, NULL, '2016-10-03 04:16:23'),
	('user4', 'user4', '123123123123', 'address', 'email', NULL, NULL, NULL, NULL, '2016-10-03 04:17:44'),
	('user5', 'user5', '12312312312', 'address', 'email', NULL, NULL, NULL, NULL, '2016-10-03 04:17:57'),
	('user6', 'user6', '123123123', 'address', 'email', NULL, NULL, NULL, NULL, '2016-10-03 04:18:12');
/*!40000 ALTER TABLE `tbl_customer` ENABLE KEYS */;


-- Dumping structure for table foodtruck.tbl_employee
CREATE TABLE IF NOT EXISTS `tbl_employee` (
  `emp_user` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `emp_pass` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`emp_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_employee: ~1 rows (approximately)
/*!40000 ALTER TABLE `tbl_employee` DISABLE KEYS */;
INSERT INTO `tbl_employee` (`emp_user`, `emp_pass`, `last_login`) VALUES
	('admin', '21232f297a57a5a743894a0e4a801fc3', '2016-09-19 16:12:37');
/*!40000 ALTER TABLE `tbl_employee` ENABLE KEYS */;


-- Dumping structure for table foodtruck.tbl_ft_ans
CREATE TABLE IF NOT EXISTS `tbl_ft_ans` (
  `ano` int(11) NOT NULL AUTO_INCREMENT,
  `a_content` text COLLATE utf8_unicode_ci NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modi_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qno` int(11) DEFAULT NULL,
  `writer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ano`),
  KEY `R_39` (`qno`),
  CONSTRAINT `R_39` FOREIGN KEY (`qno`) REFERENCES `tbl_ft_qna` (`qno`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_ft_ans: ~24 rows (approximately)
/*!40000 ALTER TABLE `tbl_ft_ans` DISABLE KEYS */;
INSERT INTO `tbl_ft_ans` (`ano`, `a_content`, `reg_date`, `modi_date`, `qno`, `writer`) VALUES
	(1, '내용이다', '2016-09-02 09:07:43', '2016-09-02 09:07:43', 26, 'beuteu'),
	(2, '내용이다', '2016-09-02 09:07:44', '2016-09-02 09:07:44', 26, 'beuteu'),
	(3, '내용이다', '2016-09-02 09:07:44', '2016-09-02 09:07:44', 26, 'beuteu'),
	(4, '내용이다', '2016-09-02 09:07:44', '2016-09-02 09:07:44', 26, 'beuteu'),
	(5, '내용이다', '2016-09-02 09:07:45', '2016-09-02 09:07:45', 26, 'beuteu'),
	(6, '내용이다', '2016-09-02 09:07:45', '2016-09-02 09:07:45', 26, 'beuteu'),
	(7, '내용이다', '2016-09-02 09:07:45', '2016-09-02 09:07:45', 26, 'beuteu'),
	(8, '내용이다', '2016-09-02 09:07:46', '2016-09-02 09:07:46', 26, 'beuteu'),
	(9, '내용이다', '2016-09-02 09:07:46', '2016-09-02 09:07:46', 26, 'beuteu'),
	(10, '내용이다', '2016-09-02 09:07:46', '2016-09-02 09:07:46', 26, 'beuteu'),
	(11, '내용이다', '2016-09-02 09:07:46', '2016-09-02 09:07:46', 26, 'beuteu'),
	(12, '내용이다', '2016-09-02 09:07:46', '2016-09-02 09:07:46', 26, 'beuteu'),
	(13, '내용이다', '2016-09-02 09:07:46', '2016-09-02 09:07:46', 26, 'beuteu'),
	(14, '내용이다', '2016-09-02 09:07:46', '2016-09-02 09:07:46', 26, 'beuteu'),
	(15, '내용이다', '2016-09-02 09:07:46', '2016-09-02 09:07:46', 26, 'beuteu'),
	(16, '내용이다', '2016-09-02 09:07:47', '2016-09-02 09:07:47', 26, 'beuteu'),
	(17, '내용이다', '2016-09-02 09:07:47', '2016-09-02 09:07:47', 26, 'beuteu'),
	(18, '내용이다', '2016-09-02 09:07:47', '2016-09-02 09:07:47', 26, 'beuteu'),
	(19, '내용이다', '2016-09-02 09:07:47', '2016-09-02 09:07:47', 26, 'beuteu'),
	(20, '내용이다', '2016-09-02 09:07:47', '2016-09-02 09:07:47', 26, 'beuteu'),
	(21, '내용이다', '2016-09-02 09:07:50', '2016-09-02 09:07:50', 26, 'beuteu'),
	(22, 'ans_content #test', '2016-09-04 01:31:50', '2016-09-04 01:31:51', 26, 'foodtruck1'),
	(23, ';l;', '2016-09-12 10:12:51', '2016-09-12 10:12:51', 19, 'foodtruck1'),
	(24, 'dsfs', '2016-09-21 14:10:19', '2016-09-21 14:10:19', 20, 'foodtruck1');
/*!40000 ALTER TABLE `tbl_ft_ans` ENABLE KEYS */;


-- Dumping structure for table foodtruck.tbl_ft_info
CREATE TABLE IF NOT EXISTS `tbl_ft_info` (
  `u_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `u_pw` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `u_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `u_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `u_phone` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `u_profile_img` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_code` int(11) NOT NULL,
  `register_state` tinyint(1) NOT NULL DEFAULT '0',
  `co_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `co_num` int(11) NOT NULL,
  `co_doc` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `co_intro` text COLLATE utf8_unicode_ci,
  `sales_time` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sessionkey` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sessionlimit` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `grade` int(11) DEFAULT NULL,
  `del_state` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`u_id`),
  KEY `R_11` (`f_code`),
  CONSTRAINT `R_11` FOREIGN KEY (`f_code`) REFERENCES `tbl_f_type` (`f_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_ft_info: ~10 rows (approximately)
/*!40000 ALTER TABLE `tbl_ft_info` DISABLE KEYS */;
INSERT INTO `tbl_ft_info` (`u_id`, `u_pw`, `u_name`, `u_email`, `u_phone`, `u_profile_img`, `f_code`, `register_state`, `co_name`, `co_num`, `co_doc`, `co_intro`, `sales_time`, `register_date`, `sessionkey`, `sessionlimit`, `grade`, `del_state`) VALUES
	('foodtruck1', '1234', 'David', 'david@foodtruck.com', '010232323', 'c:/img', 1, 0, 'Home', 22222222, 'document1', 'foodtruck1', '9:00AM - 19:00PM', '2016-09-03 14:33:51', '8C4E820A4B9A7150FC16A2957175D2BB', '2016-09-28 20:42:15', 0, 0),
	('foodtruck2', '1234', 'foodtruck2', 'foodtruck2@foodtruck.com', '123123123', NULL, 1, 0, 'BIT', 123123123, 'document2', 'foodtruck2', '9:00AM - 19:00PM', '2016-10-07 01:19:38', NULL, '0000-00-00 00:00:00', NULL, 0),
	('quang', '1234', 'david', 'quangdavid@gmail.com', '0102362232', NULL, 2, 1, 'BIT', 123452, 'document3', NULL, NULL, '2016-09-12 00:30:41', NULL, '0000-00-00 00:00:00', NULL, 0),
	('가영이네', '1234', 'new one 2', 'quangdavid@gmail.com', '0102362232', NULL, 2, 1, 'BIT', 123452, 'document3', NULL, NULL, '2016-09-12 00:30:41', NULL, '0000-00-00 00:00:00', NULL, 0),
	('대광이네', '1234', 'new one 2', 'quangdavid@gmail.com', '0102362232', NULL, 2, 1, 'BIT', 123452, 'document3', NULL, NULL, '2016-09-12 00:30:41', NULL, '0000-00-00 00:00:00', NULL, 0),
	('예진이네', '1234', 'new one 2', 'quangdavid@gmail.com', '0102362232', NULL, 2, 1, 'BIT', 123452, 'document3', NULL, NULL, '2016-09-12 00:30:41', NULL, '0000-00-00 00:00:00', NULL, 0),
	('종열이네', '1234', 'new one 2', 'quangdavid@gmail.com', '0102362232', NULL, 2, 1, 'BIT', 123452, 'document3', NULL, NULL, '2016-09-12 00:30:41', NULL, '0000-00-00 00:00:00', NULL, 0),
	('찐남이네', '1234', 'new one 2', 'quangdavid@gmail.com', '0102362232', NULL, 2, 1, 'BIT', 123452, 'document3', NULL, NULL, '2016-09-12 00:30:41', NULL, '0000-00-00 00:00:00', NULL, 0),
	('청년컵밥', '1234', 'new one 1', 'quangdavid@gmail.com', '0102362232', NULL, 2, 1, 'BIT', 123452, 'document3', NULL, NULL, '2016-09-12 00:30:41', NULL, '0000-00-00 00:00:00', NULL, 0),
	('푸드천국', '1234', 'new one 2', 'quangdavid@gmail.com', '0102362232', NULL, 2, 1, 'BIT', 123452, 'document3', NULL, NULL, '2016-09-12 00:30:41', NULL, '0000-00-00 00:00:00', NULL, 0);
/*!40000 ALTER TABLE `tbl_ft_info` ENABLE KEYS */;


-- Dumping structure for table foodtruck.tbl_ft_menu
CREATE TABLE IF NOT EXISTS `tbl_ft_menu` (
  `mno` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `m_price` int(11) NOT NULL,
  `m_info` text COLLATE utf8_unicode_ci,
  `m_state` tinyint(1) NOT NULL DEFAULT '0',
  `m_img` text COLLATE utf8_unicode_ci,
  `u_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`mno`),
  KEY `R_25` (`u_id`),
  CONSTRAINT `R_25` FOREIGN KEY (`u_id`) REFERENCES `tbl_ft_info` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_ft_menu: ~8 rows (approximately)
/*!40000 ALTER TABLE `tbl_ft_menu` DISABLE KEYS */;
INSERT INTO `tbl_ft_menu` (`mno`, `m_name`, `m_price`, `m_info`, `m_state`, `m_img`, `u_id`) VALUES
	(3, '후라이드', 17000, '바삭바삭한 튀김을 입힌 치킨', 0, '/2016/09/12/94364a77-58a7-4c5c-9be8-9a469cc9e5e8_apple_sky_blue_aurora-wide.jpg', 'foodtruck1'),
	(5, '양념치킨', 18000, '매콤달콤한 양념을 입힌 치킨', 0, '/2016/09/12/8573b25e-6db8-47ff-af16-010f78a602b5_tiger-artwork.jpg', 'foodtruck1'),
	(6, '간장치킨', 18000, '달콤짭쪼름한 간장을 입힌 치킨', 0, '/2016/09/12/c2b3a8c4-4c98-4d94-becc-299b692fc751_tiger-hd-wallpaper-0348.jpg', 'foodtruck1'),
	(7, '로스트치킨', 16000, '오븐에 구운 치킨', 0, '/2016/09/12/cd7ee53f-1c8d-41ec-be2f-04617d4221b0_28120.jpg', 'foodtruck1'),
	(8, '후라이드', 17000, '바삭바삭한 튀김을 입힌 치킨', 0, '/2016/09/12/2e7492fe-bf8d-4262-8531-257653f1e0d0_36256.png', 'foodtruck1'),
	(9, '후라이드', 17000, '바삭바삭한 튀김을 입힌 치킨', 0, '/2016/09/12/193a1d0d-8df1-4dfe-8e70-a2fd678e0cf4_awww.hd_wallpapersdownload.com_upload_bulk_upload_tiger_images_black_and_white_wallpaper.jpg', 'foodtruck1'),
	(10, 'menu #1', 4000, 'info #1', 0, '/2016/09/20/4021abc2-50b5-4e89-bfc2-52721adbde56_asus-hd-wallpaper-23.jpg', 'foodtruck1'),
	(14, '11', 111, '11', 0, '/2016/09/21/6260c65f-de0e-47c1-a5fe-298c7a9eb7a1_429573.png', 'foodtruck1');
/*!40000 ALTER TABLE `tbl_ft_menu` ENABLE KEYS */;


-- Dumping structure for table foodtruck.tbl_ft_order
CREATE TABLE IF NOT EXISTS `tbl_ft_order` (
  `ono` int(11) NOT NULL AUTO_INCREMENT,
  `total_price` int(11) NOT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pickup_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `c_msg` text COLLATE utf8_unicode_ci,
  `sno` int(11) NOT NULL,
  `c_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_code` int(11) NOT NULL,
  PRIMARY KEY (`ono`),
  KEY `R_29` (`sno`),
  KEY `R_35` (`c_id`),
  KEY `R_10` (`state_code`),
  CONSTRAINT `R_10` FOREIGN KEY (`state_code`) REFERENCES `tbl_order_state` (`state_code`),
  CONSTRAINT `R_29` FOREIGN KEY (`sno`) REFERENCES `tbl_ft_sales` (`sno`),
  CONSTRAINT `R_35` FOREIGN KEY (`c_id`) REFERENCES `tbl_customer` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_ft_order: ~30 rows (approximately)
/*!40000 ALTER TABLE `tbl_ft_order` DISABLE KEYS */;
INSERT INTO `tbl_ft_order` (`ono`, `total_price`, `regdate`, `pickup_time`, `c_msg`, `sno`, `c_id`, `state_code`) VALUES
	(1, 12000, '2016-09-13 21:11:38', '2016-09-13 21:11:38', 'make food', 20, 'kwon', 10),
	(2, 10000, '2016-09-13 13:44:02', '2016-09-13 13:44:02', 'order', 20, 'kwon', 10),
	(3, 10000, '2016-09-13 14:58:56', '2016-09-13 14:58:56', 'order', 20, 'kwon', 10),
	(23, 5000, '2016-09-20 00:42:10', '2016-09-20 00:42:10', '', 26, 'beuteu', 16),
	(24, 10000, '2016-09-20 01:43:51', '2016-09-20 01:43:52', NULL, 26, 'lky', 16),
	(25, 5000, '2016-09-21 19:22:33', '2016-09-21 19:22:33', NULL, 29, 'lky', 16),
	(26, 4000, '2016-09-21 17:28:26', '2016-09-21 17:28:27', NULL, 29, 'lky', 16),
	(27, 4000, '2016-09-13 17:29:12', '2016-09-13 17:29:12', NULL, 29, 'kwon', 16),
	(28, 5000, '2016-09-13 17:29:29', '2016-09-13 17:29:29', NULL, 29, 'beuteu', 16),
	(30, 4000, '2016-09-20 10:10:33', '2016-09-20 10:10:34', NULL, 29, 'kwon', 15),
	(31, 5000, '2016-09-20 10:11:15', '2016-09-20 10:11:15', NULL, 29, 'lky', 16),
	(32, 4000, '2016-09-21 13:54:22', '2016-09-21 13:54:22', NULL, 29, 'kwon', 11),
	(33, 10000, '2016-09-21 13:56:14', '2016-09-21 13:56:14', NULL, 29, 'beuteu', 12),
	(34, 5000, '2016-09-21 13:56:31', '2016-09-21 13:56:31', NULL, 34, 'lky', 13),
	(35, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 34, 'beuteu', 10),
	(55, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 40, 'kwon', 10),
	(56, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 40, 'kwon', 10),
	(57, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 40, 'kwon', 10),
	(58, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 41, 'kwon', 10),
	(59, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 41, 'kwon', 10),
	(60, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 41, 'kwon', 10),
	(61, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 42, 'kwon', 10),
	(62, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 42, 'kwon', 10),
	(63, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 44, 'kwon', 10),
	(64, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 43, 'kwon', 10),
	(65, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 43, 'kwon', 10),
	(66, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 44, 'kwon', 10),
	(67, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 44, 'kwon', 10),
	(68, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 44, 'kwon', 10),
	(69, 6000, '2016-09-21 13:58:17', '2016-09-21 13:58:17', NULL, 42, 'kwon', 10);
/*!40000 ALTER TABLE `tbl_ft_order` ENABLE KEYS */;


-- Dumping structure for table foodtruck.tbl_ft_order_detail
CREATE TABLE IF NOT EXISTS `tbl_ft_order_detail` (
  `odno` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `mno` int(11) NOT NULL,
  `ono` int(11) NOT NULL,
  PRIMARY KEY (`odno`),
  KEY `R_27` (`mno`),
  KEY `R_28` (`ono`),
  CONSTRAINT `R_27` FOREIGN KEY (`mno`) REFERENCES `tbl_ft_menu` (`mno`),
  CONSTRAINT `R_28` FOREIGN KEY (`ono`) REFERENCES `tbl_ft_order` (`ono`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_ft_order_detail: ~11 rows (approximately)
/*!40000 ALTER TABLE `tbl_ft_order_detail` DISABLE KEYS */;
INSERT INTO `tbl_ft_order_detail` (`odno`, `quantity`, `mno`, `ono`) VALUES
	(1, 1, 3, 1),
	(2, 1, 5, 1),
	(3, 1, 6, 2),
	(4, 2, 6, 3),
	(5, 1, 9, 23),
	(6, 1, 8, 24),
	(7, 1, 6, 32),
	(8, 1, 7, 32),
	(9, 1, 8, 33),
	(10, 1, 3, 34),
	(11, 1, 5, 35);
/*!40000 ALTER TABLE `tbl_ft_order_detail` ENABLE KEYS */;


-- Dumping structure for table foodtruck.tbl_ft_qna
CREATE TABLE IF NOT EXISTS `tbl_ft_qna` (
  `qno` int(11) NOT NULL AUTO_INCREMENT,
  `q_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `q_content` text COLLATE utf8_unicode_ci NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modi_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `c_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anscnt` int(11) DEFAULT '0',
  PRIMARY KEY (`qno`),
  KEY `R_33` (`c_id`),
  KEY `R_40` (`u_id`),
  CONSTRAINT `R_33` FOREIGN KEY (`c_id`) REFERENCES `tbl_customer` (`c_id`),
  CONSTRAINT `R_40` FOREIGN KEY (`u_id`) REFERENCES `tbl_ft_info` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_ft_qna: ~27 rows (approximately)
/*!40000 ALTER TABLE `tbl_ft_qna` DISABLE KEYS */;
INSERT INTO `tbl_ft_qna` (`qno`, `q_title`, `q_content`, `reg_date`, `modi_date`, `c_id`, `u_id`, `anscnt`) VALUES
	(1, '얼마에요', '만원', '2016-09-01 12:20:40', '2016-09-01 12:20:40', 'beuteu', 'foodtruck1', 0),
	(2, '얼마에요', '만원', '2016-09-01 12:20:41', '2016-09-01 12:20:41', 'beuteu', 'foodtruck1', 0),
	(3, '얼마에요', '만원', '2016-09-01 12:20:41', '2016-09-01 12:20:41', 'beuteu', 'foodtruck1', 0),
	(4, '얼마에요', '만원', '2016-09-01 12:20:41', '2016-09-01 12:20:41', 'beuteu', 'foodtruck1', 0),
	(5, '얼마에요', '만원', '2016-09-01 12:20:41', '2016-09-01 12:20:41', 'beuteu', 'foodtruck1', 0),
	(6, '얼마에요', '만원', '2016-09-01 12:20:42', '2016-09-01 12:20:42', 'beuteu', 'foodtruck1', 0),
	(7, '얼마에요', '만원', '2016-09-01 12:20:42', '2016-09-01 12:20:42', 'beuteu', 'foodtruck1', 0),
	(8, '얼마에요', '만원', '2016-09-01 12:20:42', '2016-09-01 12:20:42', 'beuteu', 'foodtruck1', 0),
	(9, '얼마에요', '만원', '2016-09-01 12:20:42', '2016-09-01 12:20:42', 'beuteu', 'foodtruck1', 0),
	(10, '얼마에요', '만원', '2016-09-01 12:20:42', '2016-09-01 12:20:42', 'beuteu', 'foodtruck1', 0),
	(11, '얼마에요', '만원', '2016-09-01 12:20:42', '2016-09-01 12:20:42', 'beuteu', 'foodtruck1', 0),
	(12, '얼마에요', '만원', '2016-09-01 12:20:43', '2016-09-01 12:20:43', 'beuteu', 'foodtruck1', 0),
	(13, '얼마에요', '만원', '2016-09-01 12:20:43', '2016-09-01 12:20:43', 'beuteu', 'foodtruck1', 0),
	(14, '얼마에요', '만원', '2016-09-01 12:20:43', '2016-09-01 12:20:43', 'beuteu', 'foodtruck1', 0),
	(15, '얼마에요', '만원', '2016-09-01 12:20:43', '2016-09-01 12:20:43', 'beuteu', 'foodtruck1', 0),
	(16, '얼마에요', '만원', '2016-09-01 12:20:43', '2016-09-01 12:20:43', 'beuteu', 'foodtruck1', 0),
	(17, '얼마에요', '만원', '2016-09-01 12:20:43', '2016-09-01 12:20:43', 'beuteu', 'foodtruck1', 0),
	(18, '얼마에요', '만원', '2016-09-01 12:20:43', '2016-09-01 12:20:43', 'beuteu', 'foodtruck1', 0),
	(19, '얼마에요', '만원', '2016-09-01 12:20:43', '2016-09-01 12:20:43', 'beuteu', 'foodtruck1', 1),
	(20, '얼마에요', '만원', '2016-09-01 12:20:43', '2016-09-01 12:20:43', 'beuteu', 'foodtruck1', 1),
	(21, '얼마에요', '만원', '2016-09-01 12:20:43', '2016-09-01 12:20:43', 'beuteu', 'foodtruck1', 0),
	(22, '얼마에요', '만원', '2016-09-01 12:20:44', '2016-09-01 12:20:44', 'beuteu', 'foodtruck1', 0),
	(23, '얼마에요', '만원', '2016-09-01 12:20:44', '2016-09-01 12:20:44', 'beuteu', 'foodtruck1', 0),
	(24, '얼마에요', '만원', '2016-09-01 12:20:44', '2016-09-01 12:20:44', 'beuteu', 'foodtruck1', 0),
	(25, '얼마에요', '만원', '2016-09-01 12:20:44', '2016-09-01 12:20:44', 'beuteu', 'foodtruck1', 0),
	(26, '얼마에요', '만원', '2016-09-01 12:20:44', '2016-09-01 12:20:44', 'beuteu', 'foodtruck1', 0),
	(27, '얼마에요', '만원', '2016-09-01 12:20:44', '2016-09-01 12:20:44', 'beuteu', 'foodtruck1', 0);
/*!40000 ALTER TABLE `tbl_ft_qna` ENABLE KEYS */;


-- Dumping structure for table foodtruck.tbl_ft_review
CREATE TABLE IF NOT EXISTS `tbl_ft_review` (
  `rno` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `u_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `grade` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rno`),
  KEY `FK__tbl_customer` (`c_id`),
  KEY `FK__tbl_ft_info` (`u_id`),
  CONSTRAINT `FK__tbl_customer` FOREIGN KEY (`c_id`) REFERENCES `tbl_customer` (`c_id`),
  CONSTRAINT `FK__tbl_ft_info` FOREIGN KEY (`u_id`) REFERENCES `tbl_ft_info` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_ft_review: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_ft_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ft_review` ENABLE KEYS */;


-- Dumping structure for table foodtruck.tbl_ft_sales
CREATE TABLE IF NOT EXISTS `tbl_ft_sales` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `location` text COLLATE utf8_unicode_ci,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `open_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `close_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `work_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sales_state` tinyint(1) NOT NULL DEFAULT '0',
  `u_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `R_30` (`u_id`),
  CONSTRAINT `R_30` FOREIGN KEY (`u_id`) REFERENCES `tbl_ft_info` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_ft_sales: ~13 rows (approximately)
/*!40000 ALTER TABLE `tbl_ft_sales` DISABLE KEYS */;
INSERT INTO `tbl_ft_sales` (`sno`, `location`, `lat`, `lng`, `open_time`, `close_time`, `work_date`, `sales_state`, `u_id`) VALUES
	(20, '대한민국 서울특별시 서초구 서초2동 1327-15', 37.4944646, 127.02796950000001, '2016-09-13 16:38:45', '2016-09-13 17:08:36', '2016-10-09 20:49:45', 1, 'foodtruck1'),
	(26, '대한민국 서울특별시 서초구 서초2동 1327-38', 37.4944452, 127.02795029999999, '2016-09-20 09:42:14', '2016-09-20 09:42:06', '2016-10-09 20:49:45', 1, 'foodtruck1'),
	(27, '대한민국 서울특별시 서초구 서초동 1327-38', 37.4944165, 127.02794109999998, '2016-09-21 10:30:56', '2016-09-21 10:30:36', '2016-10-09 20:49:45', 1, 'foodtruck1'),
	(28, '대한민국 서울특별시 서초구 서초2동 1327-15', 37.4944877, 127.02797639999999, '2016-09-21 13:40:20', '2016-09-21 13:40:23', '2016-10-09 20:49:45', 0, 'foodtruck1'),
	(29, '대한민국 서울특별시 서초구 서초2동 1327-15', 37.4945261, 127.0279319, '2016-09-21 14:26:03', '2016-09-21 14:26:00', '2016-10-09 20:49:45', 1, 'foodtruck1'),
	(33, '대한민국 서울특별시 서초구 서초2동 1327-15', 37, 127, '2016-09-21 20:34:40', '2016-09-21 20:34:40', '2016-10-09 20:49:45', 1, 'foodtruck2'),
	(34, '16 Eonju-ro 75-gil', 37.498502, 127.043033, '2016-09-21 20:49:45', '2016-09-21 20:49:45', '2016-10-09 20:49:45', 1, 'quang'),
	(40, '16 Eonju-ro 75-gil', 37.498502, 127.043033, '2016-09-21 20:49:45', '2016-09-21 20:49:45', '2016-10-10 20:49:45', 1, '청년컵밥'),
	(41, '16 Eonju-ro 75-gil', 37.498502, 127.043033, '2016-09-21 20:49:45', '2016-09-21 20:49:45', '2016-10-10 20:49:45', 1, '푸드천국'),
	(42, '16 Eonju-ro 75-gil', 37.498502, 127.043033, '2016-09-21 20:49:45', '2016-09-21 20:49:45', '2016-10-10 20:49:45', 1, 'foodtruck2'),
	(43, '16 Eonju-ro 75-gil', 37.5, 127.05, '2016-09-21 20:49:45', '2016-09-21 20:49:45', '2016-10-10 20:49:45', 1, '대광이네'),
	(44, '16 Eonju-ro 75-gil', 37.49, 127.043, '2016-09-21 20:49:45', '2016-09-21 20:49:45', '2016-10-10 20:49:45', 1, '가영이네'),
	(45, '현재위치', 0, 0, '2016-10-10 15:16:50', '2016-10-10 15:16:50', '2016-10-10 15:16:50', 0, 'foodtruck1');
/*!40000 ALTER TABLE `tbl_ft_sales` ENABLE KEYS */;


-- Dumping structure for table foodtruck.tbl_f_type
CREATE TABLE IF NOT EXISTS `tbl_f_type` (
  `f_code` int(11) NOT NULL AUTO_INCREMENT,
  `f_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`f_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_f_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `tbl_f_type` DISABLE KEYS */;
INSERT INTO `tbl_f_type` (`f_code`, `f_type`) VALUES
	(1, '한식'),
	(2, 'type #2');
/*!40000 ALTER TABLE `tbl_f_type` ENABLE KEYS */;


-- Dumping structure for table foodtruck.tbl_gov_answer
CREATE TABLE IF NOT EXISTS `tbl_gov_answer` (
  `ans_id` int(11) NOT NULL AUTO_INCREMENT,
  `ans_content` text COLLATE utf8_unicode_ci NOT NULL,
  `ans_edited` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ans_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ans_user` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `q_id` int(11) NOT NULL,
  PRIMARY KEY (`ans_id`),
  KEY `FK_tbl_gov_answer_tbl_gov_question` (`q_id`),
  CONSTRAINT `FK_tbl_gov_answer_tbl_gov_question` FOREIGN KEY (`q_id`) REFERENCES `tbl_gov_question` (`q_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_gov_answer: ~7 rows (approximately)
/*!40000 ALTER TABLE `tbl_gov_answer` DISABLE KEYS */;
INSERT INTO `tbl_gov_answer` (`ans_id`, `ans_content`, `ans_edited`, `ans_created`, `ans_user`, `q_id`) VALUES
	(7, 'Answer 2', '2016-10-03 21:56:38', '2016-09-03 21:56:38', 'admin', 2),
	(8, 'Answer 3', '2016-10-03 21:57:22', '2016-10-03 21:57:22', 'admin', 3),
	(9, 'New Answer goes here', '2016-10-06 14:35:28', '2016-10-06 14:35:28', 'admin', 1),
	(10, 'hi', '2016-10-07 13:48:18', '2016-10-07 13:48:18', 'admin', 6),
	(11, 'hi', '2016-10-07 13:49:12', '2016-10-07 13:49:12', 'admin', 5),
	(12, 'hahah', '2016-10-10 11:21:28', '2016-10-10 11:21:28', 'admin', 9),
	(13, 'hihi', '2016-10-10 11:33:07', '2016-10-10 11:33:07', 'admin', 8);
/*!40000 ALTER TABLE `tbl_gov_answer` ENABLE KEYS */;


-- Dumping structure for table foodtruck.tbl_gov_notice
CREATE TABLE IF NOT EXISTS `tbl_gov_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_gov_notice: ~15 rows (approximately)
/*!40000 ALTER TABLE `tbl_gov_notice` DISABLE KEYS */;
INSERT INTO `tbl_gov_notice` (`id`, `title`, `content`, `date`, `edited`, `type`) VALUES
	(1, 'Notice 1', 'Notice Content 1 1 11111', '2016-09-28 17:40:35', '2016-10-07 13:50:02', 'warning'),
	(2, 'Notice 2', 'Notice Content 22', '2016-09-29 17:40:50', '2016-09-30 13:27:27', 'warning'),
	(3, 'Notice Important', 'Notice Important', '2016-09-30 02:07:41', '2016-09-30 12:01:09', 'important'),
	(5, 'Notice Dangerasdasd', 'Notice Dangerasdasd', '2016-09-30 11:52:31', '2016-09-30 15:36:27', 'important'),
	(6, 'notice important #2', 'contentasdsa', '2016-10-06 11:27:03', '2016-10-06 11:27:03', 'important'),
	(7, 'notice #4', 'notice #4', '2016-10-06 11:36:36', '2016-10-06 11:36:36', 'info'),
	(8, 'notify', 'hi', '2016-10-07 13:48:42', '2016-10-07 13:48:42', 'danger'),
	(9, 'notice #5', 'Content #5', '2016-10-09 16:26:47', '2016-10-09 16:26:47', 'important'),
	(10, 'notice #6', 'content #6', '2016-10-09 16:27:04', '2016-10-09 16:27:04', 'danger'),
	(11, 'notice #7', 'Content #7', '2016-10-09 16:27:16', '2016-10-09 16:27:16', 'warning'),
	(12, 'notice #8', 'content #8', '2016-10-09 16:27:26', '2016-10-09 16:27:26', 'info'),
	(13, 'notice #9', 'content #9', '2016-10-09 16:29:17', '2016-10-09 16:29:17', 'info'),
	(14, 'notice #10', 'content #10', '2016-10-09 16:29:25', '2016-10-09 16:29:25', 'warning'),
	(16, 'hi', 'hi', '2016-10-10 11:26:54', '2016-10-10 11:26:54', 'important'),
	(17, 'hi~', 'hi~', '2016-10-10 11:33:23', '2016-10-10 11:33:23', 'warning');
/*!40000 ALTER TABLE `tbl_gov_notice` ENABLE KEYS */;


-- Dumping structure for table foodtruck.tbl_gov_question
CREATE TABLE IF NOT EXISTS `tbl_gov_question` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT,
  `q_title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `q_content` text COLLATE utf8_unicode_ci NOT NULL,
  `q_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `q_userCreated` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_gov_question: ~10 rows (approximately)
/*!40000 ALTER TABLE `tbl_gov_question` DISABLE KEYS */;
INSERT INTO `tbl_gov_question` (`q_id`, `q_title`, `q_content`, `q_created`, `q_userCreated`) VALUES
	(1, 'question 1', 'question #1 content', '2016-09-27 12:07:01', 'foodtruck1'),
	(2, 'question 2', 'question #2 content', '2016-09-28 12:15:27', 'foodtruck1'),
	(3, 'quenstion 3', 'question #3 content', '2016-09-29 10:53:20', 'foodtruck1'),
	(4, 'question4', 'question #4 content', '2016-09-29 10:53:41', 'foodtruck1'),
	(5, 'question5', 'question #5 content', '2016-09-29 10:54:04', 'foodtruck1'),
	(6, 'question 6', 'question #6 content', '2016-10-03 21:54:01', 'foodtruck1'),
	(7, 'New Question 1', 'New Question 1', '2016-10-09 19:04:37', 'foodtruck1'),
	(8, 'question 111', '12312321321', '2016-10-09 19:05:59', 'foodtruck1'),
	(9, 'hjbnkju', 'yugu', '2016-10-09 19:08:04', 'quang'),
	(10, 'hi', 'hi', '2016-10-10 12:07:50', 'quang');
/*!40000 ALTER TABLE `tbl_gov_question` ENABLE KEYS */;


-- Dumping structure for table foodtruck.tbl_order_state
CREATE TABLE IF NOT EXISTS `tbl_order_state` (
  `state_code` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`state_code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table foodtruck.tbl_order_state: ~10 rows (approximately)
/*!40000 ALTER TABLE `tbl_order_state` DISABLE KEYS */;
INSERT INTO `tbl_order_state` (`state_code`, `state_name`) VALUES
	(10, 'Receive'),
	(11, '5분'),
	(12, '10분'),
	(13, '30분'),
	(14, 'Cook not finish'),
	(15, 'Cook finish'),
	(16, 'Pick up'),
	(17, 'Not Pick up'),
	(18, 'Cancel'),
	(19, 'Not Cancel');
/*!40000 ALTER TABLE `tbl_order_state` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
