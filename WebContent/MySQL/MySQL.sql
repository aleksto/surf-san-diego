DROP TABLE IF EXISTS user_info;
DROP TABLE IF EXISTS user_account;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS skill;
DROP TABLE IF EXISTS city;

CREATE TABLE user_info (
	user_id INT PRIMARY KEY,
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	email VARCHAR(50),
	date_of_birth DATE
);

CREATE TABLE user_account (
	user_id INT PRIMARY KEY,
	username VARCHAR(15),
	password VARCHAR(10)
);

CREATE TABLE role (
	id INT PRIMARY KEY,
	role VARCHAR(20)
);

CREATE TABLE skill (
	id INT PRIMARY KEY,
	skill VARCHAR(20)
);

CREATE TABLE city (
	id INT PRIMARY KEY,
	city VARCHAR(20)
);

INSERT INTO user_info VALUES (1, 'Maria', 'Moller', 'mariamollr@gmail.com', '1988-2-28');
INSERT INTO user_account VALUES (1, 'maria', 'pass');

INSERT INTO role VALUES (1, 'Admin');
INSERT INTO role VALUES (2, 'News poster');
INSERT INTO role VALUES (3, 'Media poster');
INSERT INTO role VALUES (4, 'Registered user');

INSERT INTO skill values (1, 'Pro');
INSERT INTO skill values (2, 'Medium');
INSERT INTO skill values (3, 'Beginner');
