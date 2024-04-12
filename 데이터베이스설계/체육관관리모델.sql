USE gym_management;

SELECT  * from class;
SELECT  * from member;
SELECT  * from enrollment;
SELECT  * from trainer;


SELECT m.name, class_name
FROM member m 
JOIN enrollment e ON e.member_id = m.member_id
JOIN class c ON c.class_id = e.class_id;

SELECT count(class_id)
FROM trainer t
JOIN CLass c ON c.trainer_trainer_id = 