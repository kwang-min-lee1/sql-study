/*
데이터베이스 퀴즈
아래는 employees 샘플 데이터베이스의 일부 테이블을 복사해서 새로운 스키마에 저장하는 SQL문입니다.
해당 스키마를 기반으로 아래 퀴즈들을 풀어보세요.

DROP SCHEMA IF EXISTS quiz;
CREATE SCHEMA quiz;
USE quiz;

CREATE TABLE employees LIKE employees.employees;
CREATE TABLE salaries LIKE employees.salaries;
INSERT INTO employees SELECT * FROM employees.employees;
INSERT INTO salaries SELECT * FROM employees.salaries;
*/

/*
문제4. 동적SQL문 사용하기

동적SQL문을 사용하여 특정 직원의 급여 이력 조회

요구사항:

- 직원의 ID(`emp_no`)를 입력받습니다.
- 해당 직원의 모든 급여 이력(급여 `salary`, 급여 시작 날짜 `from_date`, 급여 종료 날짜 `to_date`)을 조회합니다.
- 결과는 급여 시작 날짜(`from_date`) 기준으로 오름차순으로 정렬해야 합니다.


1. 동적으로 입력받을 값와 SQL문을 변수로 선언하세요.
2. PREPARE 문으로 동적 SQL문을 준비하세요.
3. EXECUTE 문을 매개변수를 바인딩하여 실행하세요.
4. 준비된 문장을 메모리 해제하세요.
*/