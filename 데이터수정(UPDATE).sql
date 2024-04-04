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

-- 이름이 Georgi인 사람의 생일을 수정
-- 해당 조건에 매치되는 사람이 253행(레코드) 모두를 수정    
UPDATE employees
SET birth_date = '1970-09-02'
WHERE first_name = 'Georgi';     

-- 속성이 고유한 키를 사용하여 수정할 경우
-- 해당 조건에 매치되는 한개의 행만 수정됨.
UPDATE employees
SET birth_date = '1953-09-02'
WHERE emp_no = 10001;

-- WHERE 절을 생략하면, 테이블의 모든 내용 변경.
UPDATE employees
SET last_name = '없음';

-- 비교연산자 사용
-- 고용일이 1990년 이후인 사람만, 이름을 none로 변경
UPDATE employees
SET first_name = 'none', last_name = 'none'
WHERE hire_date > '1990-01-01';

-- 복합연산자 사용
-- 고용일이 1990년 이전이고, 성별이 여자가 아닌 경우만 이름을 '김남자'로 변경
UPDATE employees
SET first_name = '남자', last_name = '김'
WHERE gender <> 'F' AND hire_date <= '1990-01-01';