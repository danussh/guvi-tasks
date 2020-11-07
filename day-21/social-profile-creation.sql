CREATE DATABASE social_profile;

USE social_profile;

CREATE TABLE user_profile (id INT, username Text);
CREATE TABLE profile_status (user_id INT, is_active TEXT);
CREATE TABLE friends (user_id INT, id_of_friends INT);
CREATE TABLE comments (user_id INT, comments TEXT);
CREATE TABLE likes (user_id INT, likes INT);
CREATE TABLE user_login_details (user_id INT, email VARCHAR(25), phone VARCHAR(10));
CREATE TABLE posts (user_id INT, posts VARCHAR(100));

INSERT INTO user_profile (id, username) VALUES (1, "Ashwin"), (2, "Ajay"), (3, "Vikram"), (4, "Manav"), (5, "Sajin");
INSERT INTO profile_status (user_id, is_active) VALUES (1, "Active"), (2, "Active"), (3, "Inactive"), (4, "Active"), (5, "Inactive");
INSERT INTO friends (user_id, id_of_friends) VALUES (1, 3), (1, 4), (2, 5), (3, 1), (3, 4), (4, 1), (5, 2);
INSERT INTO comments (user_id, comments) VALUES (1, "wow,how are you?"), (1, "sign it"), (2, "Thank you"), (3, "Just do it..."), (3, "Common!!!"), (3, "GOCH YA"), (3, "Fantastic"), (3, "colorful"), (3, "vivooo.."), (4, "Move around"), (4, "Swap it!!"), (5, "WONDERFUL!!!"), (5, "Peace of mind.");
INSERT INTO likes (user_id, likes) VALUES (1, 23), (2, 19), (3, 65), (4, 7), (5, 34);
INSERT INTO user_login_details (user_id, email, phone) VALUES (1, "ashwin@gmail.com", 1237896545), (2, "ajay123@hotmail.com", 9517563245), (3, "vikraaam@outlook,com", 9998886665), (4, "maanavji@gmail.com", 6546546541), (5, "sajin@gmail.com", 9999999999);
INSERT INTO posts (user_id, posts) VALUES (1, "this is a post 1"), (1, "like this it will happenn."), (2, "Pic of albatrozz"), (3, "I'm a MasterChef"), (4, "the food in tri is awsome"), (5, "tap the light"), (5, "The food in date night is good");



-- Queries Executed

-- 1. In friends table list the data which are matched with user profile id
SELECT id, username, id_of_friends FROM user_profile INNER JOIN friends ON user_profile.id = friends.user_id;

-- 2. Display all the posts of user id 5
SELECT id, username, posts FROM user_profile INNER JOIN posts ON user_profile.id = posts.user_id WHERE id = 5;

-- 3. Write a query that matching the words or character with %gmail%
SELECT user_id, email FROM user_login_details WHERE email LIKE "%gmail%";

-- 4. Limit the display data from the table comments for 5 which belongs to the user 3
SELECT comments as comments_of_user_3 FROM comments WHERE user_id = 3 LIMIT 5;

-- 5. Combine profile_status and user_profile and user_login details display matching records
SELECT id, username, is_active, email, phone FROM user_profile AS u INNER JOIN profile_status AS p ON u.id = p.user_id INNER JOIN user_login_details as uld ON u.id = uld.user_id;



-- DROP DATABASE social_profile;
