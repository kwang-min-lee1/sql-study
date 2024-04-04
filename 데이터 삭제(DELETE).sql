-- 스키마 생성 및 사용
CREATE SCHEMA IF NOT EXISTS ex_insert; -- ex_insert 가 존재하지 않으면 SCHEMA 를 생성한다
USE ex_insert; -- ex_insert 스키마를 실행

-- 테이블 초기화
DROP TABLE IF EXISTS employees;  -- employees 테이블이 존재하면,  테이블을 삭제한다.
CREATE TABLE employees LIKE employees.employees;  -- employees 에서 employees 를 복사하여 employees 테이블을 생성한다.

DESC employees;
SELECT * FROM employees;

-- 샘플 데이터 대량 삽입
INSERT INTO employees
	SELECT * FROM employees.employees;
    
SELECT * FROM employees;
SELECT * FROM employees WHERE first_name = 'Georgi';

-- 테이터 삭제하기
-- WHERE 조건에 만족하는 모든 행을 삭제
DELETE FROM employees
WHERE first_name = 'Georgi';

SELECT * FROM employees WHERE first_name = 'Bezalel';

-- 테이블 삭제 시 상위 N건만 지우고 싶을 경우, LIMIT 구문과 함께 사용
DELETE FROM employees
WHERE  first_name = 'Bezalel' LIMIT 100;

-- 조건 연산자 사용하여 삭제
-- 조건에 만족하는 모두 삭제
DELETE FROM employees
WHERE birth_date >= '1960-01-01';


SELECT * FROM employees;

-- 복합조건 삭제
DELETE FROM employees
WHERE first_name = 'Parto' AND last_name = 'Bamford';

-- WHERE 조건문을 생략하고 삭제할 경우
-- 모든 행 삭제  => 주의!  DML: 트랜잭션 로그를 기록
DELETE FROM employees;    -- 300024행 모두 삭제에 10초 걸림

-- 테이블의 구조는 남기고, 모든 데이터를 삭제 (속도와 성능이 매우 빠름)
-- DDL: DML의 트랜잭션 로그 기록 없음  
TRUNCATE TABLE employees;  -- 300024행 모두 삭제에 0.75초 걸림

-- 테이블 자체를 지우고 싶을 때 (데이터 및 구조 모두 삭제), DDL
DROP TABLE employees;