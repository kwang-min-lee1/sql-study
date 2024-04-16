USE tcl;

DROP TABLE IF EXISTS lock_demo;

-- 동시성 테스트 테이블
CREATE TABLE lock_demo (
	id INT,
	data VARCHAR(255)
);

-- 테이트 데이터 삽입
INSERT INTO lock_demo VALUES (1, '데이터1'), (2, '데이터2');

-- 트랜잭션 시작
START TRANSACTION;

-- 테스트 데이터의 1번 행의 데이터에 접근
UPDATE lock_demo SET data = '수정' WHERE id =1; 

SELECT * FROM lock_demo;

COMMIT;