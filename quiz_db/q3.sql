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
문제3. 스토어드 프로시저 작성


같은 스키마의 `salaries` 테이블을 이용해서 스토어드 프로시저를 작성하세요.

1.  입력 매개변수 :  직원의 ID(emp_no)와 연도(year)를 입력받습니다.

2. 입력받은 연도에 해당 직원이 받은 급여 정보(급여 salary와 해당 급여의 시작 날짜 from_date)를 조회합니다.

3. 스토어드 프로시저를 작성하고 호출합니다.

 - 호출 및 예시

 CALL GetEmployeeSalariesByYear(10001, 2000);

| salary  |  from_date |
| ------- | ---------- |
| 85,112  | 2000-06-22 |
*/