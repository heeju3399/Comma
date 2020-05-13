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
  `m_id` varchar(30) CHARACTER SET euckr DEFAULT NULL COMMENT 'member id',
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'comment id',
  `c_content` mediumtext CHARACTER SET euckr COMMENT 'comment content',
  PRIMARY KEY (`c_id`),
  KEY `FK_tbl_comment_tbl_member` (`m_id`),
  CONSTRAINT `FK_tbl_comment_tbl_member` FOREIGN KEY (`m_id`) REFERENCES `tbl_member` (`m_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- 테이블 데이터 comma.tbl_comment:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
INSERT INTO `tbl_comment` (`m_id`, `c_id`, `c_content`) VALUES
	('chilkyustar', 1, '굿~!'),
	('louis', 2, 'good!');
/*!40000 ALTER TABLE `tbl_comment` ENABLE KEYS */;

-- 테이블 comma.tbl_heart 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_heart` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'heart (like) id',
  `m_id` varchar(30) DEFAULT NULL COMMENT 'member id',
  `s_id` int(11) DEFAULT NULL COMMENT 'song id',
  PRIMARY KEY (`h_id`),
  UNIQUE KEY `m_id_s_id` (`m_id`,`s_id`),
  KEY `FK_tbl_heart_tbl_song` (`s_id`),
  CONSTRAINT `FK_tbl_heart_tbl_member` FOREIGN KEY (`m_id`) REFERENCES `tbl_member` (`m_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbl_heart_tbl_song` FOREIGN KEY (`s_id`) REFERENCES `tbl_song` (`s_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=euckr;

-- 테이블 데이터 comma.tbl_heart:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_heart` DISABLE KEYS */;
INSERT INTO `tbl_heart` (`h_id`, `m_id`, `s_id`) VALUES
	(3, 'chilkyustar', 2),
	(1, 'louis', 1),
	(2, 'louis', 2);
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

-- 테이블 데이터 comma.tbl_member:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
INSERT INTO `tbl_member` (`m_id`, `m_pwd`, `m_email`, `m_birth`, `m_visited`, `m_auth`) VALUES
	('chilkyustar', '1234', 'chilkyu.star@gmail.com', '1989-01-21', '2020-05-14', 'user'),
	('louis', '1234', 'louis.develog@gmail.com', '1989-03-21', '2020-05-14', 'admin'),
	('root', '1234', 'neat-white-tree@naver.com', '1989-02-22', '2020-05-14', 'user');
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;

-- 테이블 comma.tbl_playlog 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_playlog` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'playlist id',
  `m_id` varchar(30) DEFAULT NULL COMMENT 'member id',
  `s_id` int(11) DEFAULT NULL COMMENT 'song id',
  `p_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'playlist time',
  PRIMARY KEY (`p_id`),
  KEY `FK_tbl_play_log_tbl_member` (`m_id`),
  KEY `FK_tbl_play_log_tbl_song` (`s_id`),
  CONSTRAINT `FK_tbl_play_log_tbl_member` FOREIGN KEY (`m_id`) REFERENCES `tbl_member` (`m_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbl_play_log_tbl_song` FOREIGN KEY (`s_id`) REFERENCES `tbl_song` (`s_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=euckr;

-- 테이블 데이터 comma.tbl_playlog:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_playlog` DISABLE KEYS */;
INSERT INTO `tbl_playlog` (`p_id`, `m_id`, `s_id`, `p_time`) VALUES
	(1, 'chilkyustar', 1, '2020-05-14 06:08:40'),
	(2, 'chilkyustar', 2, '2020-05-14 06:08:53');
/*!40000 ALTER TABLE `tbl_playlog` ENABLE KEYS */;

-- 테이블 comma.tbl_rating 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_rating` (
  `m_id` varchar(30) DEFAULT NULL COMMENT 'member id',
  `s_id` int(11) DEFAULT NULL COMMENT 'song id',
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'rating id',
  `r_score` int(10) unsigned NOT NULL COMMENT 'song score',
  PRIMARY KEY (`r_id`),
  UNIQUE KEY `m_id_s_id` (`m_id`,`s_id`),
  KEY `FK_tbl_rating_tbl_song` (`s_id`),
  CONSTRAINT `FK_tbl_rating_tbl_member` FOREIGN KEY (`m_id`) REFERENCES `tbl_member` (`m_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbl_rating_tbl_song` FOREIGN KEY (`s_id`) REFERENCES `tbl_song` (`s_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=euckr;

-- 테이블 데이터 comma.tbl_rating:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_rating` DISABLE KEYS */;
INSERT INTO `tbl_rating` (`m_id`, `s_id`, `r_id`, `r_score`) VALUES
	('louis', 1, 1, 5),
	('louis', 2, 2, 4),
	('chilkyustar', 1, 3, 5),
	('root', 2, 4, 4);
/*!40000 ALTER TABLE `tbl_rating` ENABLE KEYS */;

-- 테이블 comma.tbl_song 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_song` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'song id',
  `s_title` varchar(200) NOT NULL COMMENT 'song title',
  `s_artist` varchar(100) NOT NULL COMMENT 'song artist',
  `s_file` mediumtext NOT NULL COMMENT 'song file path',
  `s_url` mediumtext COMMENT 'song web url link',
  `s_lyrics` mediumtext COMMENT 'song lyrics',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=euckr COMMENT='		';

-- 테이블 데이터 comma.tbl_song:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_song` DISABLE KEYS */;
INSERT INTO `tbl_song` (`s_id`, `s_title`, `s_artist`, `s_file`, `s_url`, `s_lyrics`) VALUES
	(1, 'Pulse', '국가스텐', 'qPr8VZHtUzA.mp4', 'https://music.youtube.com/watch?v=qPr8VZHtUzA&list=RDAMVMqPr8VZHtUzA', '희미하게 뛰고 있는 묻어 버린 맥박들이\n날 알아 볼 순 없겠지 날 기억하진 않겠지\n어디에도 없는 나는 다른 이의 숨을 마셔\n살아 있는 척 하겠지 눈치채진 못하겠지\n\n깨끗하게 포장이 된 썩지 않는 물건처럼\n난 언제나 해로웠지 난 언제나 외로웠지\n\n뛰고 있는 가슴에 커져 가는 진동에\n열망이 차오른다 다시 난 숨을 쉰다\n\n깜박이는 불빛에 커져 가는 두 눈에\n열망이 차오른다 다시 난 숨을 쉰다\n\n희미하게 뛰고 있는 묻어 버린 맥박들이\n밟아 본 적 없는 곳에 나의 등을 떠미네\n\n오래된 날 버리려, 혼자된 날 꺼내려,\n나의 등을 떠미네...\n\n어디에도 없었던, 살아 있는 척했던,\n언제나 해로워서, 너무나 외로웠던\n날 알아 볼 수 있겠지?\n\n뛰고 있는 가슴에 커져 가는 진동에\n열망이 차오른다 다시 난 숨을 쉰다\n깜박이는 불빛에 커져 가는 두 눈에\n열망이 차오른다 다시 난 숨을 쉰다\n\n벌어지는 가슴속에 세상이[1] 파고든다\n\n선명하게 뛰고 있는 묻어 버린 맥박들이\n날 맞이하라고 하네 일어나라고 말하네\n어디에도 없던 나는 향기로운 숨을 마셔\n날 기억하려고 하네 다시 나는 숨을 쉬네\n'),
	(2, '나에게로의 초대 (이상한 나라의 앨리스, 하트다 하트여왕)', '박기영 및 조유진', 'dz4WCVP0gEI.mp4', 'https://music.youtube.com/watch?v=dz4WCVP0gEI&list=RDAMVMqPr8VZHtUzA', '\n환상속에 있어 다가설 수 없는\n나에게 너를 보여줘\n조금만 다가서도 멀어지는\n나의 사랑 나의 꿈\n너에게 나를 맞춰가고 있다 말하지마\n나에게 너를 초대할 뿐이야\n신비로운 너의 모습 나에게는 사랑인걸\n조금씩 다가오는 널 느낄수록\n신비로운 너의 모습 나에게는 사랑인걸\n조금씩 멈춰지는 시간 속에 널\n어둠속에 빛처럼 My Love\n다가설 수 없는 너를 내게 보여줘\n어둠 속의 한줄기 빛처럼 느껴 My Love\n사랑하는 너를 모두 느낄 수 있어\n어둠 속의 빛처럼\n너에게 나를 맞춰가고 있다 말하지마\n나에게 너를 초대할 뿐이야\n신비로운 너의 모습 나에게는 사랑인걸\n조금씩 다가오는 널 느낄수록\n신비로운 너의 모습 나에게는 사랑인걸\n조금씩 멈춰지는 시간 속에 널\n어둠속에 빛처럼 My Love\n다가설 수 없는 너를 내게 보여줘\n어둠 속의 한줄기 빛처럼 느껴 My Love\n너를 기다리는 나의 아름다웠던\n시간속에 널 그리워 My Love\n사랑하고 싶은 너를 내게 보여줘\n어둠속의 한줄기 빛처럼 느껴 My Love\n사랑하는 너를 모두 느낄 수 있어\n슬픈 나의 사랑을\n');
/*!40000 ALTER TABLE `tbl_song` ENABLE KEYS */;

-- 테이블 comma.tbl_tag 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_tag` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'tag id',
  `s_id` int(11) NOT NULL COMMENT 'song id',
  `m_id` varchar(30) NOT NULL COMMENT 'member id',
  `t_name` varchar(45) NOT NULL COMMENT 'tag name',
  PRIMARY KEY (`t_id`),
  UNIQUE KEY `m_id_t_name` (`m_id`,`t_name`),
  KEY `FK1` (`s_id`),
  CONSTRAINT `FK1` FOREIGN KEY (`s_id`) REFERENCES `tbl_song` (`s_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbl_tag_tbl_member` FOREIGN KEY (`m_id`) REFERENCES `tbl_member` (`m_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=euckr;

-- 테이블 데이터 comma.tbl_tag:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_tag` DISABLE KEYS */;
INSERT INTO `tbl_tag` (`t_id`, `s_id`, `m_id`, `t_name`) VALUES
	(1, 1, 'louis', '국가스텐'),
	(2, 1, 'louis', '하현우');
/*!40000 ALTER TABLE `tbl_tag` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
