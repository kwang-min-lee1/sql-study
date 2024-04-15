/*
다음은 부동산 정보를 저장하는 데이터베이스이다.
아래와 같은 하나의 릴레이션에 정보가 저장되어있고,

```
부동산(필지번호, 주소, 공시지가, 소유자이름, 주민등록번호, 전화번호)
```
다음과 같은 함수 종속성을 가진다. 

```
함수 종속성
	- 필지번호 -> 주소, 공시지가 : 땅에 대한 고유 번호이며 필지에 대하여 주소와 공시가격이 주어진다.
	- 소유자이름 -> 전화번호 : 소유자는 하나의 전화번호를 갖는다
	- 주민등록번호 -> 소유자이름 : 사람마다 고유한 주민등록번호가 있다.
```

1. 함수 종속성 다이어그램을 그리시오.
2. 테이블을 분해하시오.
*/


CREATE SCHEMA realEstateData;
USE realEstateData;


CREATE TABLE realEstateData (
	ParcelNumber INT,
    address VARCHAR(255),
    landPrice VARCHAR(255),
	LandlordName VARCHAR(255),
    SocialSecurityNumber VARCHAR(255),
    phoneNumber VARCHAR(255),
	PRIMARY KEY (ParcelNumber)
);


 SELECT * FROM realEstateData;


-- 필지번호
DROP TABLE IF EXISTS ParcelNumber;
CREATE TABLE ParcelNumber (
	address VARCHAR(30),           
	landPrice INT,
    PRIMARY KEY (ParcelNumber)
);
INSERT INTO ParcelNumber
	SELECT address, landPrice FROM realEstateData;

-- 소유자 이름     
DROP TABLE IF EXISTS LandlordName;
CREATE TABLE LandlordName (
	phoneNumber VARCHAR(30)           
	
);
INSERT INTO LandlordName
	SELECT phoneNumber FROM realEstateData;
    
-- 주민번호
DROP TABLE IF EXISTS SocialSecurityNumber;
CREATE TABLE SocialSecurityNumber (
	LandlordName VARCHAR(30)           

);
INSERT INTO SocialSecurityNumber
	SELECT LandlordName FROM realEstateData;
    
    