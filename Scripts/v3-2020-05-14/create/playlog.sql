CREATE TABLE `tbl_playlog` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'playlist id',
  `m_id` varchar(30) DEFAULT NULL COMMENT 'member id',
  `s_id` int(11) DEFAULT NULL COMMENT 'song id',
  `p_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'playlist time',
  PRIMARY KEY (`p_id`),
  KEY `FK_tbl_play_log_tbl_member` (`m_id`),
  KEY `FK_tbl_play_log_tbl_song` (`s_id`),
  CONSTRAINT `FK_tbl_play_log_tbl_member` FOREIGN KEY (`m_id`) REFERENCES `tbl_member` (`m_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbl_play_log_tbl_song` FOREIGN KEY (`s_id`) REFERENCES `tbl_song` (`s_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=euckr