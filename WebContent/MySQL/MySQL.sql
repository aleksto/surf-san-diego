DROP TABLE IF EXISTS user_info;
DROP TABLE IF EXISTS user_account;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS skill;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS area;
DROP TABLE IF EXISTS weather_forcast;
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS user_event;
DROP TABLE IF EXISTS user_traffic;
DROP TABLE IF EXISTS beach;
DROP TABLE IF EXISTS surf_conditions;
DROP TABLE IF EXISTS news;
DROP TABLE IF EXISTS user_role;
DROP TABLE IF EXISTS beach_comment;

CREATE TABLE user_info (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	email VARCHAR(50),
	location VARCHAR(50),
	date_of_birth DATE,
	skill_id INT REFERENCES skill (id)
);

CREATE TABLE user_account (
	   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       username VARCHAR(15),
       password VARCHAR(10),
       user_id INT REFERENCES user_info(id)
);

CREATE TABLE user_role (
	   user_account_id INT REFERENCES user_account(id),
       role_id INT REFERENCES role(id),
       username VARCHAR(15)
);

CREATE TABLE role (
 Ê Ê Ê id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 Ê Ê Ê role VARCHAR(20)
);

CREATE TABLE city (
       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       city VARCHAR(20)
);

CREATE TABLE area (
       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       area VARCHAR(30),
       city_id INT REFERENCES city (id)
);

CREATE TABLE skill (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	skill VARCHAR(20)
);

CREATE TABLE weather_forcast (
       w_date DATE PRIMARY KEY,
       description VARCHAR(200),
       tide VARCHAR(20)
);

CREATE TABLE event (
       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
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
       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       comments VARCHAR(200)
);

CREATE TABLE beach (
       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(30),
       description VARCHAR(200),
       beach_id INT REFERENCES beach (id),
       user_id INT REFERENCES user_account(id)
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
       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       headline VARCHAR(30),
       news_date DATE,
       news_time TIME,
       text VARCHAR(400)
);

CREATE TABLE beach_comment(
		id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		comment VARCHAR(200),
		beach_id INT
);

INSERT INTO beach (name, description) VALUES ('Mission beach', 'blablabla');
INSERT INTO beach (name, description) VALUES ('Pacific beach', 'blablabla');
INSERT INTO beach (name, description) VALUES ('Lajolla Cove', 'blablabla');

INSERT INTO user_info (firstname, lastname, email, date_of_birth, city_id, skill_id) VALUES ('Maria', 'Moller', 'mariamollr@gmail.com', '1988-2-28', 1, 2);
INSERT INTO user_info (firstname, lastname, email, date_of_birth, city_id, skill_id) VALUES ('Ingrid', 'Taroy', 'i.taroy@gmail.com', '1987-11-30', 2, 1);
INSERT INTO user_info (firstname, lastname, email, date_of_birth, city_id, skill_id) VALUES ('Ali', 'Torstensen', 'at@gmail.com', '1988-5-24', 3, 3);

INSERT INTO skill (skill) VALUES ('Pro');
INSERT INTO skill (skill) VALUES ('Medium');
INSERT INTO skill (skill) VALUES ('Beginner');

INSERT INTO city (city) VALUES ('San Diego');
INSERT INTO city (city) VALUES ('Santa Barbara');
INSERT INTO city (city) VALUES ('Los Angeles');

INSERT INTO area (area, city_id) VALUES ('South San Diego', 1);
INSERT INTO area (area, city_id) VALUES ('North San Diego', 1);

INSERT INTO news (headline, news_date, news_time, text) VALUES ('Shark Attack', '2011-11-17','10:15:54','A shark attacked danndandan');  
INSERT INTO news (headline, news_date, news_time, text) VALUES ('Croc Attack', '2011-11-17','10:15:54','A croc attacked danndandan');  


INSERT INTO user_account (username, password, user_id) VALUES ('maria', 'mm' 1);
INSERT INTO user_account (username, password, user_id) VALUES ('ingrid', 'it' 2);
INSERT INTO user_account (username, password, user_id) VALUES ('aleksto', 'at' 3);

INSERT INTO user_role (user_account_id, role_id, username) VALUES (1, 1, 'maria');
INSERT INTO user_role (user_account_id, role_id, username) VALUES (2, 1, 'ingrid');
INSERT INTO user_role (user_account_id, role_id, username) VALUES (3, 2, 'aleksto');
