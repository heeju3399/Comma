CREATE TABLE `tbl_rating` (
  `m_id` varchar(30) DEFAULT NULL COMMENT 'member id',
  `s_id` int(11) DEFAULT NULL COMMENT 'song id',
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'rating id',
  `r_score` int(10) unsigned NOT NULL COMMENT 'song score',
  PRIMARY KEY (`r_id`),
  UNIQUE KEY `m_id_s_id` (`m_id`,`s_id`),
  KEY `FK_tbl_rating_tbl_song` (`s_id`),
  CONSTRAINT `FK_tbl_rating_tbl_member` FOREIGN KEY (`m_id`) REFERENCES `tbl_member` (`m_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbl_rating_tbl_song` FOREIGN KEY (`s_id`) REFERENCES `tbl_song` (`s_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=euckr