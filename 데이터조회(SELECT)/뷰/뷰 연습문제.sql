-- 뷰 연습문제
-- sakila DB를 사용하세요.
USE sakila;

-- 문제 1: 'view_actor_info' 뷰를 생성하세요. 
-- 이 뷰는 actor 테이블에서 actor_id, first_name, last_name을 포함해야 합니다.
CREATE VIEW view_actor_info AS
SELECT actor_id, first_name, last_name 
FROM actor;

-- 문제 2: 'view_actor_info' 뷰를 조회하여 모든 배우의 정보를 확인하세요.
SELECT * FROM view_actor_info;

-- 문제 3: 'view_film_list' 뷰를 생성하세요. 
-- 이 뷰는 film 테이블에서 film_id, title, description, release_year를 포함하고, 
-- release_year가 2006년인 영화만 포함해야 합니다.
CREATE VIEW view_film_list AS
SELECT film_id,title, description, release_year
FROM film
WHERE release_year = 2006;

SELECT * FROM view_film_list;

-- 문제 4: 'view_customer_rental_info' 뷰를 생성하세요. 
-- 이 뷰는 customer 테이블과 rental 테이블을 조인하여 
-- 고객의 ID, 이름(first_name, last_name), 그리고 그들이 대여한 영화의 총 수를 포함해야 합니다.
SELECT * FROM customer;
SELECT * FROM rental;

CREATE VIEW view_customer_rental_info AS
SELECT c.customer_id, c.first_name, c.last_name, count(r.rental_id) as 'rental_count'
FROM customer c 
JOIN rental r ON r.customer_id = c.customer_id
GROUP BY c.customer_id;

SELECT * FROM view_customer_rental_info;

-- 문제 5: 'view_category_film_count' 뷰를 생성하세요.
-- 이 뷰는 film_category와 category 테이블을 조인하여 
-- 각 카테고리의 이름과 해당 카테고리에 속한 영화의 수를 포함해야 합니다.
SELECT * FROM film_category;  -- (film_id, category_id, last_update )
SELECT * FROM category;  -- (category_id, name, last_update)
DESC film_category;
DESC category;

CREATE VIEW view_category_film_count AS
SELECT c.name, count(film_id)
FROM  film_category f
JOIN category c ON c.category_id = f.category_id
GROUP BY c.name;

SELECT * FROM view_category_film_count;

-- 문제 6: 생성한 모든 뷰를 확인하세요.
SELECT * FROM view_actor_info;
SELECT * FROM view_film_list;
SELECT * FROM view_customer_rental_info;
SELECT * FROM view_category_film_count;


-- 문제 7 : 생성한 모든 뷰를 삭제하세요.
DROP VIEW view_actor_info;
DROP VIEW view_film_list;
DROP VIEW view_customer_rental_info;
DROP VIEW view_category_film_count;

