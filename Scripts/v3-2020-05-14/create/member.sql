CREATE TABLE `tbl_member` (
  `m_id` varchar(30) NOT NULL COMMENT 'member id',
  `m_pwd` varchar(30) NOT NULL COMMENT 'member password',
  `m_email` varchar(30) NOT NULL COMMENT 'member email',
  `m_birth` date DEFAULT NULL COMMENT 'member birthday',
  `m_visited` date DEFAULT NULL COMMENT 'member last login date, visited',
  `m_auth` enum('admin','user') DEFAULT 'user' COMMENT 'member auth(admin, user)',
  PRIMARY KEY (`m_id`),
  UNIQUE KEY `email_UNIQUE` (`m_email`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr