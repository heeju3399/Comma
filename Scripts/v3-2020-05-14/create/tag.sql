CREATE TABLE `tbl_tag` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'tag id',
  `s_id` int(11) NOT NULL COMMENT 'song id',
  `m_id` varchar(30) NOT NULL COMMENT 'member id',
  `t_name` varchar(45) NOT NULL COMMENT 'tag name',
  PRIMARY KEY (`t_id`),
  UNIQUE KEY `m_id_t_name` (`m_id`,`t_name`),
  KEY `FK1` (`s_id`),
  CONSTRAINT `FK1` FOREIGN KEY (`s_id`) REFERENCES `tbl_song` (`s_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbl_tag_tbl_member` FOREIGN KEY (`m_id`) REFERENCES `tbl_member` (`m_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=euckr