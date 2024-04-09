-- JOIN 연습문제
-- sakila 데이터베이스에서 조회하세요.
USE sakila;
-- 참고: https://dev.mysql.com/doc/sakila/en/sakila-structure.html


-- 문제 1: 고객(customer)의 이름과 그들이 대여(rental)한 영화(film)의 제목을 조회하세요.
-- 사용 테이블: customer(customer_id, first_name, last_name), rental(rental_id, customer_id, inventory_id), film(film_id, title), inventory(inventory_id, film_id)

SELECT  c.first_name, c.last_name, f.title
FROM customer c
JOIN rental r ON r.customer_id = c.customer_id
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id= i.film_id;

-- 문제 2: 각 영화(film)의 제목과 해당 영화가 속한 카테고리(category)의 이름을 조회하세요.
-- 사용 테이블: film(film_id, title), film_category(film_id, category_id), category(category_id, name)
SELECT * FROM category;

SELECT f.title, c.name as '카테고리 이름'
FROM film f
JOIN film_category fc ON fc.film_id = f.film_id     -- JOIN film_category fc using (film_id)
JOIN category c ON c.category_id = fc.category_id;  -- JOIN category c using (category_id);

-- 문제 3: 각 영화(film)에 대해 몇 명의 배우(actor)가 출연했는지, 영화 제목과 함께 조회하세요.
-- 사용 테이블: film(film_id, title), film_actor(film_id, actor_id), actor(actor_id, first_name, last_name)

SELECT f.title, COUNT(fa.actor_id) AS '영화별 배우 수'
FROM film f
JOIN film_actor fa ON fa.film_id = f.film_id
GROUP BY f.film_id;  -- 중복 제목이 있을 경우가 있으므로, 고유한 키로 기준

-- 문제 4: 모든 대여(rental) 정보에 대해, 해당 대여가 이루어진 스토어(store)의 ID와 직원(staff)의 이름을 조회하세요.
-- 사용 테이블: rental(rental_id, staff_id), store(store_id), staff(staff_id, first_name, last_name, store_id)
SELECT * FROM staff;

SELECT r.rental_id, s.store_id, sf.first_name, sf.last_name
FROM rental r
JOIN staff sf ON sf.staff_id = r.staff_id  -- JOIN staff st USING (staff_id)
JOIN store s ON s.store_id = sf.store_id;  -- JOIN store s USING (store_id);

-- 문제 5: 가장 많이 대여된 영화 5개의 제목과 대여 횟수를 조회하세요.
-- 사용 테이블: film(film_id, title), inventory(inventory_id, film_id), rental(rental_id, inventory_id)

SELECT f.title, count(r.rental_id) as '대여횟수'
FROM film f
JOIN inventory i ON i.film_id = f.film_id           -- JOIN inventory i USING (film_id)
JOIN rental r ON r.inventory_id = i.inventory_id    -- JOIN rental r USING (inventory_id)
GROUP BY f.film_id               -- 중복 제목이 있을 경우가 있으므로, 고유한 키로 기준      
ORDER BY count(r.rental_id) DESC
LIMIT 5;

-- 문제 6: 각 고객(customer)별로 그들이 지불한 총 금액(payment)을 조회하세요.
-- 사용 테이블: customer(customer_id, first_name, last_name), payment(payment_id, customer_id, amount)

SELECT * FROM payment;
SELECT c.customer_id, first_name, last_name, sum(p.amount) as '총 대여금액'
FROM customer c
JOIN payment p ON p.customer_id = c.customer_id   -- JOIN payment p USING (customer_id)
GROUP BY c.customer_id;

-- 문제 7: 각 카테고리(category)별로 대여된 영화의 총 수를 조회하세요.
-- 사용 테이블: category(category_id, name), film_category(film_id, category_id), inventory(inventory_id, film_id), rental(rental_id, inventory_id)
SELECT * FROM category;
SELECT * FROM rental;

SELECT c.category_id, c.name, count(r.rental_id) as '대여된 수'
FROM category c 
JOIN film_category fc ON fc.category_id = c.category_id
JOIN film f ON f.film_id = fc.film_id
JOIN inventory i ON i.film_id = fc.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY c.category_id;

-- 문제 8: 2005년 7월에 대여된 모든 영화의 제목과 대여 날짜를 조회하세요.
-- 사용 테이블: rental(rental_id, rental_date, inventory_id), inventory(inventory_id, film_id), film(film_id, title)
SELECT * FROM rental;

SELECT r.rental_date, f.title
FROM rental r
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
WHERE r.rental_date BETWEEN '2005-07-01' AND '2005-07-31'; -- WHERE r.rental_date LIKE '2005-07%';

-- 문제 9: 'Comedy' 카테고리에 속하는 영화들의 평균 대여 기간(rental_duration)을 조회하세요.
-- 사용 테이블: category(category_id, name), film_category(film_id, category_id), film(film_id, title, rental_duration)

SELECT  avg(f.rental_duration)
FROM category c
JOIN film_category fc ON fc.category_id = c.category_id
JOIN film f ON f.film_id = fc.film_id
WHERE c.name = 'Comedy';

-- 문제 10: 모든 배우(actor)의 이름과 그들이 출연한 영화(film)의 수를 조회하세요. (LEFT JOIN 사용)
-- 사용 테이블: actor(actor_id, first_name, last_name), film_actor(actor_id, film_id), film(film_id)
SELECT * FROM film;

SELECT a.first_name, a.last_name, count(fa.film_id) as '출연한 영화수'
FROM actor a
LEFT JOIN film_actor fa ON fa.actor_id =a.actor_id
GROUP BY a.actor_id;
