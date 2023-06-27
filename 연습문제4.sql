#날짜 : 2023.06.23
#이름 : 김수현
#내용 : sql 연습문제 4

#실습4-1
CREATE DATABASE `BookStore`;
CREATE USER 'admin4'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `BookStore`.*'admin4'@'%';
FLUSH PRIVILEGES;


#실습4-2
CREATE TABLE `Customer` (
		`cusId`			TINYINT NOT NULL,AUTO_INCREMENT,
		`name`			VARCHAR(10) NOT NULL,
		`address`		VARCHAR(20) NULL,
		`phone`			VARCHAR(13) NULL 
		
);

CREATE TABLE `Book` (
		`bookId`			TINYINT PRIMARY KEY,
		`bookName`		VARCHAR(20) NOT NULL,
		`publisher`		VARCHAR(20) NOT NULL,
		`price`			TINYINT NULL 
		
);

CREATE TABLE `Order` (
		`orderId`		TINYINT PRIMARY KEY,
		`custId`			TINYINT NOT NULL ,
		`bookId`			TINYINT NOT NULL ,
		`salePrice`		TINYINT NOT NULL, 
		`orderDate`		DATE NOT NULL 	
);

		
#실습4-3
INSERT INTO `Customer` VALUES ( 1,'박지성','영국 맨체스타','000-5000-0001');
INSERT INTO `Customer` VALUES ( 2,'김연아','대한민국 서울','000-6000-0001');
INSERT INTO `Customer` VALUES ( 3,'장미란','대한민국 강원도','000-7000-0001');
INSERT INTO `Customer` VALUES ( 4,'추신수','미국 클리블랜드','000-8000-0001');
INSERT INTO `Customer` VALUES ( 5,'박세리','대한민국 대전');

INSERT INTO `Product` VALUES ( 1,'축구의 역사','굿스포츠',7000);
INSERT INTO `Product` VALUES ( 2,'축구아는 여자','나무수',13000);
INSERT INTO `Product` VALUES ( 3,'축구의 이해','대한미디어',22000);
INSERT INTO `Product` VALUES ( 4,'골프 바이블','대한미디어',35000);
INSERT INTO `Product` VALUES ( 5,'피겨 교본','굿스포츠',8000);
INSERT INTO `Product` VALUES ( 6,'역도 단계별기술','굿스포츠',6000);
INSERT INTO `Product` VALUES ( 7,'야구의 추억','이상미디어',20000);
INSERT INTO `Product` VALUES ( 8,'야구를 부탁해','이상미디어',13000);
INSERT INTO `Product` VALUES ( 9,'올림픽 이야기','삼성당',7500);
INSERT INTO `Product` VALUES ( 10,'Olympic Champions','Pearson',13000);

INSERT INTO `Order` VALUES ( 1, 1, 1,6000 ,'2014-07-01');
INSERT INTO `Order` VALUES ( 2, 1, 3,21000 ,'2014-07-03');
INSERT INTO `Order` VALUES ( 3, 2, 5,8000,'2014-07-03');
INSERT INTO `Order` VALUES ( 4, 3,6 ,6000 ,'2014-07-04');
INSERT INTO `Order` VALUES ( 5,4,7 ,20000 ,'2014-07-05');
INSERT INTO `Order` VALUES ( 6,1 ,2 ,12000 ,'2014-07-07');
INSERT INTO `Order` VALUES ( 7,4 ,8 ,13000 ,'2014-07-07');
INSERT INTO `Order` VALUES ( 8,3 ,10 ,12000 ,'2014-07-08');
INSERT INTO `Order` VALUES ( 9,2 ,10 ,7000 ,'2014-07-09');
INSERT INTO `Order` VALUES (10,3 ,8,13000,'2014-07-10');


#실습4-4
SELECT `custId`,`name`,`address` FROM `Customer`;


#실습4-5
SELECT `bookname`,`price` FROM `Book`;

#실습4-6
SELECT * FROM `Book`;

#실습4-7

SELECT * FROM `Book`;
#실습4-8
SELECT  `publisher` FROM `Book`;

#실습4-9
SELECT DISTINCT `publisher`FROM `Book`;
SELECT `publisher` FROM `Book` GROUP BY `publisher`;

#실습4-10
SELECT * FROM `Book` WHERE `price` >=20000;

#실습4-11
SELECT * FROM `Book` WHERE `price` <20000;

#실습4-12
SELECT * FROM `Book` WHERE `price` >=10000 
AND `price`<=20000;

SELECT * FROM `Book` WHERE `price` BETWEEN 10000 AND 20000;


#실습4-13
SELECT `bookid`,`bookname`,`price` FROM
`Book` WHERE `price` >=15000 AND `price` <=30000;

#실습4-14
SELECT * FROM `Book` WHERE `bookId`=2 OR `bookId`=3
OR `bookId`=5 ;

SELECT * FROM `Book` WHERE `bookId` IN(2,3,5);
 
#실습4-15
SELECT * FROM `Book` WHERE `bookId` % 2 = 0;

SELECT * FROM `Book` WHERE MOD(bookId,2) = 0;

#실습4-16
SELECT * FROM `Customer` WHERE `name` LIKE '박%';


#실습4-17
SELECT * FROM `Customer` WHERE `address`
LIKE '대한민국 %';

%대한민국%

#실습4-18
SELECT * FROM `Customer` WHERE `phone` IS NOT NULL;

#실습4-19
SELECT * FROM `Book` WHERE `publisher` = '굿스포츠'
OR `publisher`= `대한미디어`;

SELECT * FROM `Book` WHERE `publisher` 
IN('굿스포츠','대한미디어');

#실습4-20
SELECT `publisher` FROM `Book` WHERE 
`bookname`='축구의 역사';

#실습4-21
SELECT `publisher`FROM `Book` WHERE `bookName`
LIKE '%축구%';

#실습4-22
SELECT * FROM `Book` WHERE `bookname`
LIKE '_구%';


#실습4-23
SELECT * FROM `Book` WHERE `bookname`
LIKE '%축구%' AND `price`>=20000;

#실습4-24
SELECT * FROM `Book` ORDER by `bookname`;

#실습4-25
SELECT * FROM `Book` ORDER BY `price`,`bookname`;


#실습4-26
SELECT * FROM `Book` ORDER by `price` DESC,
`bookname` ASC; 

#실습4-27
SELECT * FROM `Book` ORDER by `price` DESC LIMIT 3;

#실습4-28
SELECT * FROM `Book` ORDER by `price` ASC  LIMIT 3;

#실습4-29
SELECT SUM(`salePrice`) AS `총판매액`  FROM `Order`;


#실습4-30
SELECT 
	SUM(`salePrice`) AS `총판매액`,
	AVG(`salePrice`) AS `평균값`,
	MIN(`salePrice`) AS `최저가`,
	MAX(`salePrice`) AS `최고가`
FROM `Order`;	

#실습4-31
SELECT COUNT(*) AS `판매건수` FROM `Order`;
SELECT COUNT(`orderId`) AS `판매건수` FROM `Order`;


#실습4-32
SELECT 
	`bookId`	,
	REPLACE(`bookName`,'야구','농구') AS `bookName`,
	`publisher`,
	`price`		 
FROM `Book`;


#실습4-33
SELECT 
	`custId`,
	COUNT(*) AS `수량`
FROM `Order` 
WHERE `salePrice` >=8000;
GROUP BY `custId`
HAVING `수량`>=2 ;

#실습4-34
SELECT * FROM `Customer` AS a 
JOIN `Order` AS b ON a.custId = b.custId;

SELECT * FROM `Customer` JOIN `Order` USING(`custId`);

SELECT * FROM `Customer` a,`Order` 
WHERE a.custId = b.custId;
 
#실습4-35
SELECT * FROM `Customer` AS a 
JOIN `Order` AS b ON a.custId = b.custId
ORDER BY a.`custId`;

#실습4-36
SELECT 
	`name`,
	`salePrice`
FROM `Customer` AS a 
JOIN `Order` AS b ON a.custId = b.custId;

#실습4-37
SELECT 
	`name`,
	SUM(salePrice)
FROM `Customer` AS a 
JOIN `Order` AS b ON a.custId = b.custId;
GROUP BY a.`custId`
ORDER BY `name`;


#실습4-38
SELECT
   `name`,
	`bookname` 
FROM `Customer` AS a 
JOIN `Order` AS b ON a.custId = b.custId
JOIN `Book` AS c ON b.bookId = c.bookId;

#실습4-39
SELECT
    `name`,
    `bookName`
FROM `Customer` AS a 
JOIN `Order` AS b ON a.custId = b.custId
JOIN `Book` AS c ON b.bookId = c.bookId
WHERE `price` = 20000;

#실습4-40
SELECT
	`name`,
	`salePrice` 
FROM `Customer` AS a 
LEFT JOIN `Order` AS b ON a.custId = b.custId


#실습4-41
SELECT  
	SUM(`salePrice`) AS `총매출`
FROM `Customer` AS a
JOIN `Order` AS b ON a.custId = b.custId
WHERE `name` = '김연아';

SELECT * FROM `Order` 
WHERE `custId`=(SELECT `custId` FROM `Customer` 
WHERE `name` = '김연아');

#실습4-42
SELECT * FROM `Book` ORDER BY `price` DESC LIMIT 1;

SELECT `bookName` FROM `Book` 
WHERE `price`= (SELECT MAX(`price`) FROM `Book`);

#실습4-43
SELECT `name` FROM `Customer`AS a 
LEFT JOIN `Order` AS b ON a.custId = b.custId
WHERE `orderId` IS NULL ;

SELECT `name` FROM `Customer`
WHERE `custId` NOT IN(SELECT DISTINCT `custId` FROM `Order`);
#실습4-44
INSERT INTO `Book` SET
								`bookId` = 11,
								`bookName` = '스포츠의학',
								`publisher` = '한솔의학서적'	;
								

#실습4-45
UPDATE `Customer` SET `address` = '대한민국 부산' 
WHERE `custId` =5;
		
#실습4-46		
DELETE FROM `Customer` WHERE `custId`=5;	

#실습4-46
DELETE FROM `Customer` WHERE `custid`=5;



information_schemainformation_schemaermodeltestdbtestdbtestdb