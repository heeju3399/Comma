-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.6.48-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- comma 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `comma` /*!40100 DEFAULT CHARACTER SET euckr */;
USE `comma`;

-- 테이블 comma.tbl_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_comment` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'comment id',
  `m_id` varchar(30) DEFAULT NULL COMMENT 'member id',
  `c_content` text COMMENT 'comment content',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 테이블 데이터 comma.tbl_comment:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_comment` ENABLE KEYS */;

-- 테이블 comma.tbl_heart 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_heart` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'heart (like) id',
  `m_id` varchar(30) DEFAULT NULL COMMENT 'member id',
  `s_id` int(11) DEFAULT NULL COMMENT 'song id',
  PRIMARY KEY (`h_id`),
  UNIQUE KEY `m_id_s_id` (`m_id`,`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 테이블 데이터 comma.tbl_heart:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_heart` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_heart` ENABLE KEYS */;

-- 테이블 comma.tbl_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_member` (
  `m_id` varchar(30) NOT NULL COMMENT 'member id',
  `m_pwd` varchar(30) NOT NULL COMMENT 'member password',
  `m_email` varchar(30) NOT NULL COMMENT 'member email',
  `m_birth` date DEFAULT NULL COMMENT 'member birthday',
  `m_visited` date DEFAULT NULL COMMENT 'member last login date, visited',
  `m_auth` enum('admin','user') DEFAULT 'user' COMMENT 'member auth(admin, user)',
  PRIMARY KEY (`m_id`),
  UNIQUE KEY `email_UNIQUE` (`m_email`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 테이블 데이터 comma.tbl_member:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;

-- 테이블 comma.tbl_playlog 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_playlog` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'playlist id',
  `m_id` varchar(30) DEFAULT NULL COMMENT 'member id',
  `s_id` int(11) DEFAULT NULL COMMENT 'song id',
  `p_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'playlist time',
  PRIMARY KEY (`p_id`) USING BTREE,
  KEY `FK_tbl_play_log_tbl_member` (`m_id`) USING BTREE,
  KEY `FK_tbl_play_log_tbl_song` (`s_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 테이블 데이터 comma.tbl_playlog:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_playlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_playlog` ENABLE KEYS */;

-- 테이블 comma.tbl_rating 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_rating` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'rating id',
  `m_id` varchar(30) DEFAULT NULL COMMENT 'member id',
  `s_id` int(11) DEFAULT NULL COMMENT 'song id',
  `r_score` int(10) unsigned NOT NULL COMMENT 'song score',
  PRIMARY KEY (`r_id`) USING BTREE,
  UNIQUE KEY `m_id_s_id` (`m_id`,`s_id`) USING BTREE,
  KEY `FK_tbl_rating_tbl_song` (`s_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 테이블 데이터 comma.tbl_rating:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_rating` ENABLE KEYS */;

-- 테이블 comma.tbl_song 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_song` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'song id',
  `s_title` varchar(200) NOT NULL COMMENT 'song title',
  `m_id` varchar(30) NOT NULL COMMENT 'member id',
  `s_artist` varchar(100) NOT NULL COMMENT 'member_id',
  `s_file` text NOT NULL COMMENT 'song file path',
  `s_url` text COMMENT 'song web url link',
  `s_lyrics` text COMMENT 'song lyrics',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 테이블 데이터 comma.tbl_song:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_song` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_song` ENABLE KEYS */;

-- 테이블 comma.tbl_tag 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_tag` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'tag id',
  `s_id` int(11) NOT NULL COMMENT 'song id',
  `m_id` varchar(30) NOT NULL COMMENT 'member id',
  `t_name` varchar(45) NOT NULL COMMENT 'tag name',
  PRIMARY KEY (`t_id`) USING BTREE,
  KEY `FK1` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 테이블 데이터 comma.tbl_tag:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tag` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
