CREATE TABLE `tbl_song` (
	`s_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'song id',
	`s_title` VARCHAR(200) NOT NULL COMMENT 'song title',
	`m_id` VARCHAR(30) NOT NULL COMMENT 'member id',
	`s_artist` VARCHAR(100) NOT NULL COMMENT 'member_id',
	`s_file` TEXT NOT NULL COMMENT 'song file path',
	`s_url` TEXT NULL DEFAULT NULL COMMENT 'song web url link' ,
	`s_lyrics` TEXT NULL DEFAULT NULL COMMENT 'song lyrics' ,
	PRIMARY KEY (`s_id`)
);

CREATE TABLE `tbl_comment` (
	`m_id` VARCHAR(30) NULL DEFAULT NULL COMMENT 'member id' COLLATE 'euckr_korean_ci',
	`c_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'comment id',
	`c_content` TEXT NULL DEFAULT NULL COMMENT 'comment content' COLLATE 'euckr_korean_ci',
	PRIMARY KEY (`c_id`) 
)


CREATE TABLE `tbl_member` (
	`m_id` VARCHAR(30) NOT NULL COMMENT 'member id' COLLATE 'euckr_korean_ci',
	`m_pwd` VARCHAR(30) NOT NULL COMMENT 'member password' COLLATE 'euckr_korean_ci',
	`m_email` VARCHAR(30) NOT NULL COMMENT 'member email' COLLATE 'euckr_korean_ci',
	`m_birth` DATE NULL DEFAULT NULL COMMENT 'member birthday',
	`m_visited` DATE NULL DEFAULT NULL COMMENT 'member last login date, visited',
	`m_auth` ENUM('admin','user') NULL DEFAULT 'user' COMMENT 'member auth(admin, user)' COLLATE 'euckr_korean_ci',
	PRIMARY KEY (`m_id`) ,
	UNIQUE INDEX `email_UNIQUE` (`m_email`) 
)










