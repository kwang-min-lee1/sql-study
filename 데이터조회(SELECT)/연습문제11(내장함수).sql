-- 내장함수 연습

-- scott DB를 사용하세요.
USE scott;

-- 문제 1: EMP 테이블에서 모든 직원의 ENAME을 대문자로 변환하여 조회하세요.
SELECT ENAME FROM EMP;
SELECT upper(ENAME) FROM EMP;

-- 문제 2: EMP 테이블에서 모든 직원의 입사 연도(HIREDATE)만 추출하여 조회하세요.
SELECT * FROM EMP;
SELECT YEAR(HIREDATE) FROM EMP;

-- 문제 3: EMP 테이블에서 각 직원의 이름(ENAME)과 '1981-12-01'부터 각 직원의 입사일까지 몇 일이 지났는지 계산하여 조회하세요.
SELECT ENAME, datediff('1981-12-01', HIREDATE) FROM EMP;

-- 문제 4: EMP 테이블에서 모든 직원의 이름(ENAME)에 "님"을 붙여서 조회하세요.
SELECT CONCAT(ENAME,"님") AS "직원이름" FROM EMP;

-- 문제 5: EMP 테이블에서 가장 높은 SAL을 가진 직원의 SAL을 조회하세요. 
SELECT ENAME, SAL FROM EMP
WHERE SAL = (SELECT  MAX(SAL) FROM EMP);

-- 문제 6: EMP 테이블에서 직원의 이름과 COMM 이 null인 사람을 "커미션 없음"이라는 컬럼으로 나타내어 조회하세요. 
SELECT * FROM EMP;
SELECT ENAME, IFNULL(COMM, "커미션 없음") 
FROM EMP;



