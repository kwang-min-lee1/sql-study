/*
데이터베이스 퀴즈
아래는 employees 샘플 데이터베이스의 일부 테이블을 복사해서 새로운 스키마에 저장하는 SQL문입니다.
해당 스키마를 기반으로 아래 퀴즈들을 풀어보세요.
*/
DROP SCHEMA IF EXISTS quiz;
CREATE SCHEMA quiz;
USE quiz;

CREATE TABLE employees LIKE employees.employees;
CREATE TABLE salaries LIKE employees.salaries;
INSERT INTO employees SELECT * FROM employees.employees;
INSERT INTO salaries SELECT * FROM employees.salaries;

SELECT * FROM employees;

-- 문제 2. 복합 컬럼 인덱스 생성

-- 1. 인덱스 생성 전 `employees` 테이블에 `first_name`과  `last_name`  컬럼을 조건으로 하는 쿼리문을 실행하세요.
SELECT * FROM employees WHERE first_name =Georgi AND last_name = Facello ;

-- 2. `EXPLAIN`과 Execution Plan을 사용하여 `first_name`과  `last_name`을 조건으로 하는 SELECT 쿼리의 실행 계획을 확인하세요.
EXPLAIN SELECT * FROM employees WHERE first_name =Georgi AND last_name = Facello ;

-- 3. `employees` 테이블에 `first_name`과  `last_name` 컬럼에 대한 복합 인덱스를 생성하세요.
CREATE INDEX idx_name ON employees (first_name, last_name );

-- 4. 인덱스 생성 전후의 쿼리문의 실행 시간을 비교하세요.
SELECT * FROM employees WHERE first_name =Georgi AND last_name = Facello;

-- 5.  `employees` 테이블의 모든 인덱스 정보를 조회하세요.
SHOW INDEX FROM employees;