DROP SCHEMA IF EXISTS db_index;
CREATE SCHEMA db_index;
use db_index;

-- MySQL 기본 페이지 크기 확인하기 (기본값 16KB)
SHOW VARIABLES LIKE 'innodb_page_size';

-- 클러스터 테이블 생성
DROP TABLE IF EXISTS clustertbl;
CREATE TABLE clustertbl -- Cluster Table 약자
( userID  CHAR(8) ,
  name    VARCHAR(10) 
);
INSERT INTO clustertbl VALUES('LSG', '이승기');
INSERT INTO clustertbl VALUES('KBS', '김범수');
INSERT INTO clustertbl VALUES('KKH', '김경호');
INSERT INTO clustertbl VALUES('JYP', '조용필');
INSERT INTO clustertbl VALUES('SSK', '성시경');
INSERT INTO clustertbl VALUES('LJB', '임재범');
INSERT INTO clustertbl VALUES('YJS', '윤종신');
INSERT INTO clustertbl VALUES('EJW', '은지원');
INSERT INTO clustertbl VALUES('JKW', '조관우');
INSERT INTO clustertbl VALUES('BBK', '바비킴');

SELECT * FROM clustertbl;

-- 현재 인덱스가 없는 상태
SHOW INDEX FROM clustertbl;

-- 인덱스 추가 (기본키 추가로 자동생성)
ALTER TABLE clustertbl
	ADD CONSTRAINT PK_clustertbl_userId
    PRIMARY KEY (userId);

-- 기본키를 생성하며 클러스터형 인덱스가 생성
SHOW INDEX FROM clustertbl;

-- 클러스터형 인덱스(userId)기준으로 오름차순 정렬
SELECT * FROM clustertbl;

-- 클러스터형 인덱스의 루트 페이지 => (리프페이지 또는 인터널페이지)의 참조 주소를 가지고 있음
-- 클러스터형 인덱스의 리프 페이지 => 실제 데이터가 저장이 되어 있음.


-- 보조 인덱스 테이블 생성
DROP TABLE IF EXISTS secondarytbl;
CREATE TABLE secondarytbl -- Secondary Table 약자
( userID  CHAR(8),
  name    VARCHAR(10)
);
INSERT INTO secondarytbl VALUES('LSG', '이승기');
INSERT INTO secondarytbl VALUES('KBS', '김범수');
INSERT INTO secondarytbl VALUES('KKH', '김경호');
INSERT INTO secondarytbl VALUES('JYP', '조용필');
INSERT INTO secondarytbl VALUES('SSK', '성시경');
INSERT INTO secondarytbl VALUES('LJB', '임재범');
INSERT INTO secondarytbl VALUES('YJS', '윤종신');
INSERT INTO secondarytbl VALUES('EJW', '은지원');
INSERT INTO secondarytbl VALUES('JKW', '조관우');
INSERT INTO secondarytbl VALUES('BBK', '바비킴');

-- 인덱스가 없는 상태, 데이터 삽입 순으로 조회
SELECT * FROM secondarytbl;
SHOW INDEX FROM secondarytbl;

-- 보조 인덱스 생성
ALTER TABLE secondarytbl
	ADD CONSTRAINT UK_secondarytbl_userId
		UNIQUE (userId);

-- 보조 인덱스가 생성되고, 데이터는 조회 시 userId 컬럼기준으로 정렬되어있지 않음
-- 보조 인덱스의 리프 페이지에서는 인덱스 컬럼(userId) 기준으로 정렬되어 있음 
-- 보조 인덱스의 리프 페이지는 실제 데이터를 가지고 있는 것이 아니라,
-- 데이터의 위치를 가리키는 위치 포인트를 가지고 있음
SELECT * FROM secondarytbl;
SHOW INDEX FROM secondarytbl;

-- 클러스터형 인덱스는 범위 검색 시, 우수한 성능을 보임
-- 보조 인덱스는 범위 검색을 하기 위해 각기 분산되어있는 페이지에 접근해야 함.

-- 클러스터형 인덱스에서 데이터를 삽입하게 될 경우
-- 인덱스 컴럼 기준으로 페이지를 재정렬 또는 페이지분할 발생할 수 있음 
-- 페이지 분할은 시스템에 많은 부하를 주게 됨
INSERT INTO clustertbl VALUES ('FNT', '푸니타');
INSERT INTO clustertbl VALUES ('KAI', '카아이');

-- 보조형 인덱스에 데이터를 삽입하게 될 경우
-- 실제 데이터 페이지의 빈 부분에 삽입되고, 
-- 인덱스 위치만 조정하게 됨 -> 클러스터형 인덱스보다 성능에 주는 부하가 적음.
INSERT INTO secondarytbl VALUES ('FNT', '푸니타');
INSERT INTO secondarytbl VALUES ('KAI', '카아이');


-- 혼합 인덱스
CREATE TABLE mixedtbl
( userID  CHAR(8) NOT NULL ,
  name    VARCHAR(10) NOT NULL,
  addr     char(2)
);
INSERT INTO mixedtbl VALUES('LSG', '이승기', '서울');
INSERT INTO mixedtbl VALUES('KBS', '김범수', '경남');
INSERT INTO mixedtbl VALUES('KKH', '김경호', '전남');
INSERT INTO mixedtbl VALUES('JYP', '조용필',  '경기');
INSERT INTO mixedtbl VALUES('SSK', '성시경', '서울');
INSERT INTO mixedtbl VALUES('LJB', '임재범',  '서울');
INSERT INTO mixedtbl VALUES('YJS', '윤종신',  '경남');
INSERT INTO mixedtbl VALUES('EJW', '은지원', '경북');
INSERT INTO mixedtbl VALUES('JKW', '조관우', '경기');
INSERT INTO mixedtbl VALUES('BBK', '바비킴',  '서울');

-- 인덱스 추가
-- 클러스터형 인덱스가 추가되며, 실제 데이터 페이자가 정렬
ALTER TABLE mixedtbl
	ADD CONSTRAINT PK_mixedtbl_userId
		PRIMARY KEY (userId);
   
-- 이름, 컬럼 기준으로 보조형 인덱스 추가   
ALTER TABLE mixedtbl
	ADD CONSTRAINT UK_mixedtbl_name
		UNIQUE (name);
        
SHOW INDEX FROM mixedtbl;
SELECT * FROM mixedtbl;

-- 혼합된 인덱스의 경우
-- 보조 인덱스에서 컬럼명(이름) 기준으로 검색하여, 루트페이지에서 리프페이지로 탐색
-- 리프페이지(name 기준으로 정렬되어 있으며 클러스터형 인덱스의 key값을 저장)
-- 리프페이지에서 이름을 기준으로 클러스터형 인텍스의 키값(userId)을 확인 한 후	 
-- 클러스터형 루트 페이지로 가서, 키값으로 검색한 후 원하는 결과를 찾음

-- WHERE절에 인덱스를 사용한 컬럼의 이름이 있을 경우, 해당 인덱스를 사용하게 됨
SELECT addr FROM mixedtbl WHERE name = '임재범';
-- 어떤 인덱스를 사용하였는지 쿼리 확인하기
EXPLAIN SELECT addr FROM mixedtbl WHERE name = '임재범';  

