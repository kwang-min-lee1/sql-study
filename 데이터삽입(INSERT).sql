-- ex_insert SCHEMA 생성
CREATE SCHEMA ex_insert;

-- ex_insert 사용하기
USE ex_insert;

-- employees 복사해서 employees 테이블 만들기
CREATE TABLE employees LIKE employees.employees;

DESC employees;

-- 데이터 삽입 : 컬럼명 기재
INSERT INTO employees (emp_no,birth_date,first_name,last_name,gender,hire_date)
VALUES (101, '1980-01-01','길동','홍','M','2020-01-01');
SELECT * FROM employees;  -- 확인

INSERT INTO employees
VALUES (102,'1981-02-02','생','허','M','2020-01-01');
SELECT * FROM employees; -- 확인

DESC employees;

-- 데이터 구조 변경 : NULL 허용 및 기본키 자동 증가  // 자동으로 NOT NULL 해제 시킨 후, 복사해온 부분
ALTER TABLE `ex_insert`.`employees` 
CHANGE COLUMN `emp_no` `emp_no` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `birth_date` `birth_date` DATE NULL ,
CHANGE COLUMN `hire_date` `hire_date` DATE NULL ;

-- 특정 컬럼만 지정하여 삽입
INSERT INTO employees ( first_name, last_name, gender )
VALUES ('사임당', '신', 'F');
SELECT * FROM employees;		-- 확인

-- INSERT문에서 컬럼의 순서를 변경하여 삽입
INSERT INTO employees ( gender, last_name, first_name )
VALUES ('M', '전', '우치');
SELECT * FROM employees;		-- 확인

-- 여러 줄 삽입
INSERT INTO employees ( gender, last_name, first_name )
VALUES ('F', '유', '관순'),
	   ('M', '김', '철수');
SELECT * FROM employees;		-- 확인

-- 대량의 데이터 삽입
INSERT INTO employees
	SELECT * FROM employees.employees;
SELECT * FROM employees;
