CREATE DATABASE zenclass;

USE zenclass;

-- The following queries need to be executed :

-- 1. Create table for the above list given -
 
CREATE TABLE users (id INT, user_name VARCHAR(45));
CREATE TABLE codekata (user_id INT, problems_solved INT);
CREATE TABLE attendance (user_id INT, days_present INT, days_absent INT);
CREATE TABLE topics (topic_id INT, topic_name VARCHAR(45));
CREATE TABLE tasks (task_id INT, task_name VARCHAR(45));
CREATE TABLE company_drives (user_id INT, company_name VARCHAR(45));
CREATE TABLE mentors (user_id INT, mentor_name VARCHAR(45));
CREATE TABLE student_activated_courses (user_id INT, course_id INT);
CREATE TABLE courses (course_id INT, course_name VARCHAR(45));

-- 2. Insert atleast 5 rows of values in each table - 

INSERT INTO users VALUES (1, "ajay"), (2, "sam"), (3, "ron"), (4, "kenny"), (5, "harry");
INSERT INTO codekata VALUES (1, 217), (2, 93), (3, 156), (4, 27), (5, 444);
INSERT INTO attendance VALUES (1, 90, 10), (2, 52, 48), (3, 17, 83), (4, 61, 39), (5, 97, 3);
INSERT INTO topics VALUES (1, "DOM"), (2, "browser components"), (3, "Javascript runtime"), (4, "databases"), (5, "API");
INSERT INTO tasks VALUES (1, "API integration"), (2, "Table creation"), (3, "calculator"), (4, "petshop"), (5, "portfolio creation");
INSERT INTO company_drives VALUES (1, "paypal"), (1, "google"), (2, "zoho"), (3, "paypal"), (3, "amazon"), (4, "google"), (4, "zoho"), (4, "amazon"), (5, "paytm");
INSERT INTO mentors VALUES (1, "ashok"), (2, "ashwini"), (3, "pugazh"), (4, "ashik"), (5, "ashok");
INSERT INTO student_activated_courses VALUES (1, 3), (1, 5), (2, 5), (2, 1), (2, 3), (3, 2), (4, 1), (4, 4), (5, 2);
INSERT INTO courses VALUES (1, "python"), (2, "javascript"), (3, "node"), (4, "php"), (5, "java");

-- 3. Get number of problems solved in codekata by combining the users -

SELECT SUM(problems_solved) as total_problems_solved FROM codekata;

-- 4. Display the number of company drives attended by a user -
 
SELECT user_id, COUNT(company_name) as company_drives FROM company_drives GROUP BY user_id;
 
-- 5. Combine and display student_activated_courses and courses for a specific user grouping them based on the course -
 
SELECT user_id, GROUP_CONCAT(course_name SEPARATOR ", ") AS activated_courses from student_activated_courses INNER JOIN courses ON student_activated_courses.course_id = courses.course_id GROUP BY user_id;

-- 6. List all mentors -

SELECT DISTINCT mentor_name FROM mentors;

-- 7. List the number of students that are assigned for a mentor -

SELECT mentor_name, COUNT(user_id) AS number_of_students FROM mentors GROUP BY mentor_name;

-- DROP DATABASE zenclass;