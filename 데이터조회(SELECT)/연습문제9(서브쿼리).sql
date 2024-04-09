-- 서브쿼리 문제 

-- scott 데이터베이스 사용
USE scott;

-- 문제 1: 회사 전체 평균 급여보다 많이 받는 모든 직원의 이름을 조회하세요.
-- 사용 테이블: EMP (ENAME, SAL)

SELECT ENAME FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP );


-- 문제 2: 가장 많은 급여를 받는 직원의 이름을 조회하세요.
-- 사용 테이블: EMP (ENAME, SAL)

SELECT ENAME FROM EMP WHERE SAL >= (SELECT MAX(SAL) FROM EMP);

-- 문제 3: SMITH보다 먼저 입사한 모든 직원의 이름을 조회하세요.
-- 사용 테이블: EMP (ENAME, HIREDATE)

SELECT * FROM EMP;
SELECT ENAME FROM EMP WHERE HIREDATE  < (SELECT HIREDATE FROM EMP WHERE ENAME = "SMITH");

-- 문제 4: 자신의 부서에서 평균보다 더 많은 급여를 받는 직원의 이름을 조회하세요.
-- 사용 테이블: EMP (ENAME, SAL, DEPTNO)

SELECT ENAME FROM emp WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = EMP.DEPTNO);
