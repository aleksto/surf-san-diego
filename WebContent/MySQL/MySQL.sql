DROP TABLE IF EXISTS user_info;
DROP TABLE IF EXISTS user_account;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS skill;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS area;
DROP TABLE IF EXISTS weather_forecast;
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS user_event;
DROP TABLE IF EXISTS user_traffic;
DROP TABLE IF EXISTS beach;
DROP TABLE IF EXISTS surf_conditions;
DROP TABLE IF EXISTS news;

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

CREATE TABLE area (
	id INT PRIMARY KEY,
	area VARCHAR(30),
	city_id INT
);

CREATE TABLE weather_forcast (
	w_date DATE PRIMARY KEY,
	description VARCHAR(200),
	tide VARCHAR(20)
);

CREATE TABLE event (
	id INT PRIMARY KEY,
	name VARCHAR(30),
	ev_date DATE,
	ev_time TIME,
	city VARCHAR(20),
	address VARCHAR(50),
	description VARCHAR(200)
);

CREATE TABLE user_event (
	id_user INT,
	id_event INT
);

CREATE TABLE user_traffic (
	id INT PRIMARY KEY,
	comments VARCHAR(200)
);

CREATE TABLE beach (
	id INT PRIMARY KEY,
	name VARCHAR(30),
	description VARCHAR(200),
	picture BLOB
);

CREATE TABLE surf_conditions (
	date_time TIMESTAMP PRIMARY KEY,
	wave_size VARCHAR(10),
	wave_direction VARCHAR(4),
	wind_speed VARCHAR(10),
	wind_direction VARCHAR(4),
	beach_id INT
);
CREATE TABLE news (
	id INT PRIMARY KEY,
	headline VARCHAR(30),
	news_date DATE,
	news_time TIME,
	picture BLOB,
	text VARCHAR(400)
);

/*INSERT INTO user_info VALUES (1, 'Maria', 'Moller', 'mariamollr@gmail.com', '1988-2-28');
UPDATE user_info;
INSERT INTO user_account VALUES (1, 'maria', 'pass');

INSERT INTO role VALUES (1, 'Admin');
INSERT INTO role VALUES (2, 'News poster');
INSERT INTO role VALUES (3, 'Media poster');
INSERT INTO role VALUES (4, 'Registered user');

INSERT INTO skill VALUES (1, 'Pro');
INSERT INTO skill VALUES (2, 'Medium');
INSERT INTO skill VALUES (3, 'Beginner');
