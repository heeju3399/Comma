CREATE TABLE `tbl_comment` (
  `m_id` varchar(30) CHARACTER SET euckr DEFAULT NULL COMMENT 'member id',
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'comment id',
  `c_content` mediumtext CHARACTER SET euckr COMMENT 'comment content',
  PRIMARY KEY (`c_id`),
  KEY `FK_tbl_comment_tbl_member` (`m_id`),
  CONSTRAINT `FK_tbl_comment_tbl_member` FOREIGN KEY (`m_id`) REFERENCES `tbl_member` (`m_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1