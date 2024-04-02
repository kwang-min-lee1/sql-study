-- 직원 : 스키마별로 권한 부여
CREATE DATABASE test_db;
-- 특정 스키마에 대해서는 권한이 SELECT 만 있을때
-- 삽입, 수정, 삭제 불가
USE employees;
SELECT*FROM employees;
-- 권한이 있는 스키마
USE shopdb;
SELECT*FROM membertbl;
