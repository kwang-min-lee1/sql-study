CREATE SCHEMA jdbc;
USE jdbc;

-- 사용자 테이블
CREATE TABLE users(
	userID VARCHAR(255) PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- 게이판 테이블
CREATE TABLE boards (
	boardNO INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(255) NOT NULL,
    content LONGTEXT NOT NULL,
    writer VARCHAR(255) NOT NULL,
    date DATETIME DEFAULT NOW(),  -- 기본 제약조건 날짜
    filename VARCHAR(255) NULL,   -- 파일이름 (필수아님)
    filedata LONGBLOB NULL        -- 파일이진데이터 (필수아님)
);

-- 계좌 테이블 
CREATE TABLE accounts(
	accountNO VARCHAR(255) PRIMARY KEY,
	owner VARCHAR(255) NOT NULL,
	balance INT NOT NULL
);

INSERT INTO account VALUES ('111-111-1111','홍길동','1000000');
INSERT INTO account VALUES ('222-222-2222','전우치','0');

