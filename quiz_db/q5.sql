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
문제5. 트리거 사용하기

- 아래와 같은 주문 테이블과 주문 기록 테이블이 있습니다.

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE,
    order_amount DECIMAL(10, 2)
);

CREATE TABLE order_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    log_message VARCHAR(255),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

- 주문이 발생할 때마다(order 테이블에 INSERT 이벤트가 발생한 이후에)
- 자동으로 실행되는 order_logs에 기록을 남기는 트리거를 만드세요.

1. 트리거를 생성하세요
2. orders 테이블에 데이터를 삽입하세요.
3. order_logs 테이블에 자동으로 트리거가 작동하였는지 확인하세요.
*/