CREATE TABLE `tbl_song` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'song id',
  `s_title` varchar(200) NOT NULL COMMENT 'song title',
  `s_artist` varchar(100) NOT NULL COMMENT 'song artist',
  `s_file` mediumtext NOT NULL COMMENT 'song file path',
  `s_url` mediumtext COMMENT 'song web url link',
  `s_lyrics` mediumtext COMMENT 'song lyrics',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=euckr COMMENT='		'

