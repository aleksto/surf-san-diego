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
DROP TABLE IF EXISTS surf_conditions;
DROP TABLE IF EXISTS news;
DROP TABLE IF EXISTS user_role;
DROP TABLE IF EXISTS beach_comment;
DROP TABLE IF EXISTS beach_rate;

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
       role VARCHAR(25),
       username VARCHAR(15)
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

DROP TABLE IF EXISTS beach;
CREATE TABLE beach (
       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(30),
       description VARCHAR(1000)
);

CREATE TABLE beach_comment (
		beach_id INT REFERENCES beach(id),
		user_id INT REFERENCES user_account(id),
		comment VARCHAR(200)
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
       text VARCHAR(400),
       newsDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO user_info (firstname, lastname, email, date_of_birth, location, skill_id) VALUES ('Maria', 'Moller', 'mariamollr@gmail.com', '1988-2-28', 'San Dieog', 2);
INSERT INTO user_info (firstname, lastname, email, date_of_birth, location, skill_id) VALUES ('Ingrid', 'Taroy', 'i.taroy@gmail.com', '1987-11-30','LA', 1);
INSERT INTO user_info (firstname, lastname, email, date_of_birth, location, skill_id) VALUES ('Ali', 'Torstensen', 'at@gmail.com', '1988-5-24',' San Fran', 3);

INSERT INTO skill (skill) VALUES ('Pro');
INSERT INTO skill (skill) VALUES ('Medium');
INSERT INTO skill (skill) VALUES ('Beginner');

INSERT INTO city (city) VALUES ('San Diego');
INSERT INTO city (city) VALUES ('Santa Barbara');
INSERT INTO city (city) VALUES ('Los Angeles');

INSERT INTO area (area, city_id) VALUES ('South San Diego', 1);
INSERT INTO area (area, city_id) VALUES ('North San Diego', 1);

INSERT INTO news (headline, text) VALUES ('Shark Attack','A shark attacked danndandan');  
INSERT INTO news (headline, text) VALUES ('Croc Attack','A crock attacked danndandan');


INSERT INTO user_account (username, password, user_id) VALUES ('maria', 'mm', 1);
INSERT INTO user_account (username, password, user_id) VALUES ('ingrid', 'it', 2);
INSERT INTO user_account (username, password, user_id) VALUES ('aleksto', 'at', 3);

INSERT INTO user_role (user_account_id, role, username) VALUES (1, 'user', 'maria');
INSERT INTO user_role (user_account_id, role, username) VALUES (2, 'poster', 'ingrid');
INSERT INTO user_role (user_account_id, role, username) VALUES (3, 'poster', 'aleksto');

INSERT INTO beach (name, description) VALUES ('Pacific Beach', 
'Pacific Beachs namesake stretches for miles from the Mission 
Bay jetty to the cliffs of La Jolla. The boardwalk, officially called 
Ocean Front Walk/Ocean Boulevard, is a pedestrian walkway that runs 
approximately 3.2 miles along the beach from the end of Law St.
 in the north down into Mission Beach, ending at the mouth of
 Mission Bay in the south. There are many local shops, bars, and 
restaurants along the boardwalk, and it is typically crowded with pedestrians,
 cyclists, rollerbladers, and shoppers. Also adjacent to the boardwalk is the Crystal Pier, 
a public pier and hotel at the west end of Garnet Avenue.');

INSERT INTO beach (name, description) VALUES (
'Santa Monica Beach', 
' Permitted year-round depending on the level of beach activity.
 During the summer, surfing is allowed only between lifeguard towers
 18 and 20 (Pico Blvd. and Bay St.), and between 28 and 29(Ashland Ave. and Pier St.).
 Always check with lifeguards before surfing.');

