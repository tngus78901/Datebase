##날짜 : 2023/06/16
#이름 : 김수현
#내용 : 2.테이블 제약조건 실습

#실습2-1
CREATE TABLE `User2`(
	`uid`		VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10),
	`hp`		CHAR(13),
	`age`		INT
	);
	
#실습2-2
INSERT INTO `User2` VALUES ('j111','제이슨','010-9999-8888' ,25 );
INSERT INTO `User2` VALUES ('j112','제이미','010-8888-9999' ,24 );
INSERT INTO `User2` VALUES ('j113','박박박','010-8564-58787',35 );
INSERT INTO `User2` VALUES ('j114','김제니','010-7848-5855', 38 );

#실습2-3
CREATE TABLE `User3`(
	`uid`		VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10),
	`hp`		CHAR(13) UNIQUE,
	`age`		INT
	);


#실습2-4
INSERT INTO `User3` VALUES ('f89','김동구','011-8833-7778' ,73 );
INSERT INTO `User3` VALUES ('f43','박복식', 25 );
INSERT INTO `User3` VALUES ('f23','옥지영','010-9842-1421' ,65 );
INSERT INTO `User3` VALUES ('f77','연꽃잎','010-7845-4548' ,34 );
#실습2-5
CREATE TABLE `Parent` (
	`pid`		VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10),
	`hp`		CHAR(13) UNIQUE
	);
	
	
CREATE TABLE `Child`(
	`cid`		VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10),
	`hp`		CHAR(13) UNIQUE,
	`pid`		VARCHAR(10),
	FOREIGN KEY (`pid`) REFERENCES `Parent` (`pid`)
	);

#실습2-6
INSERT INTO `Parent` VALUES ('s133','김복자','010-1234-9874');
INSERT INTO `Parent` VALUES ('s564','김이박','010-1234-9874');
INSERT INTO `Parent` VALUES ('s785','아리오','010-1234-9874');

INSERT INTO `Child` VALUES ('k09','김아리','s133');
INSERT INTO `Child` VALUES ('k45','김폰아','010-8944-7855','s564');
INSERT INTO `Child` VALUES ('k33','아리랑','010-7555-4878','s785');
#실습2-7
CREATE TABLE `User4`(
	`seq`		INT AUTO_INCREMENT PRIMARY KEY,
	`name`	VARCHAR(10),
	`gender`	TINYINT,
	`age`		INT,
	`addr`	VARCHAR(255)
	);
			
#실습2-8
INSERT INTO `User4` (37, '어기어', '0', 42 ,'부산시 해운대구');
INSERT INTO `User4` (38, '이영차', '0', 54 ,'서울시 강남구');
INSERT INTO `User4` (39, '뱃사공', '1', 34 ,'부산시 금정구');
INSERT INTO `User4` (40, '컴퓨터', '1', 24 ,'제주시 애월읍');
INSERT INTO `User4` (41, '마우스', '0', 13 ,'울산시 중구');

#실습2-9
CREATE TABLE `User5`(
	`name`	VARCHAR(10) NOT NULL,
	`gender`	TINYINT
	`age`		INT DEFAULT 1,
	`addr`	VARCHAR(10)
);	

#실습2-10

INSERT INTO `User5` ('황규희', '1', 23 ,'부산시 중구');
INSERT INTO `User5` ('지은성', '2', 20 ,'울산시 중구');
INSERT INTO `User5` ('한예원', '1', 24 ,'울산시 중구');
INSERT INTO `User5` ('반해원', '2', 25 ,'울산시 중구');
INSERT INTO `User5` ('은반지', '2', 32 ,'울산시 중구');

#실습2-11
ALTER TABLE `User5' ADD `hp` VARCHAR(20);
ALTER TABLE `User5` ADD `birth` CHAR(10) DEFAULT '0000-00-00' AFTER `name`;

#실습2-12
ALTER TABLE `User5` MODIFY `hp` CHAR(13);
ALTER TABLE `User5` MODIFY `age` TINYINT;

#실습2-13
ALTER TABLE `User5` CHANGE COLUMN `addr` `address` VARCHAR(100);

#실습2-14
ALTER TABLE `User5` DROP `gender`;

#실습2-15
CREATE TABLE `User6` LIKE `User5`;

#실습2-16
INSERT INTO `User6` SELECT * FROM `User5`;