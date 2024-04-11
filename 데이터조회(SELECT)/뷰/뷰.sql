-- 뷰
USE SCOTT;

-- 뷰 생성
CREATE VIEW view_emp AS
SELECT empno, ename, job, deptno FROM emp;  

-- 생성된 뷰는 새로운 가상의 테이블처럼 접근
SELECT * FROM view_emp;

-- 뷰의 삭제
DROP VIEW view_emp;

-- 1. 뷰의 장점: 보안에 도움이 됨, 사용자에게 보여주고 싶은 속성만 보여줄 수 있음
-- 뷰로 조건부 데이터 선택
CREATE VIEW view_emp_30 AS
SELECT * FROM emp WHERE deptno =30;

-- 일반 테이블처럼 조회하여 사용할 수 있음
SELECT * FROM view_emp_30;
SELECT ename FROM view_emp_30;


-- 2. 복잡한 쿼리를 단순화 시켜줄 수 있음.

SELECT * FROM emp;
SELECT * FROM dept;

CREATE VIEW emp_dept_view AS
SELECT e.ename AS employee_name, d.dname AS department_name 
FROM emp e 
INNER JOIN dept d ON e.deptno = d.deptno;
 
 -- 2개 이상의 테이블이 조인된 복잡한 쿼리도, 결과셋을 뷰로 단쉰화시킬 수 있음
 -- 쿼리 결과셋의 컬럼의 별칭은, 뷰의 컬럼의 컬럼명이 된다.
SELECT employee_name, department_name FROM emp_dept_view;







