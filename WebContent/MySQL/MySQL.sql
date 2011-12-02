DROP TABLE IF EXISTS user_info;
DROP TABLE IF EXISTS user_account;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS surf_conditions;
DROP TABLE IF EXISTS news;
DROP TABLE IF EXISTS user_role;
DROP TABLE IF EXISTS evaluation;
DROP TABLE IF EXISTS surf_location;
DROP TABLE IF EXISTS beach;
DROP TABLE IF EXISTS beach_comment;
DROP TABLE IF EXISTS beach_rating;

CREATE TABLE user_info (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	location VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	skill VARCHAR(20) NOT NULL
);

CREATE TABLE user_account (
	   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       username VARCHAR(15) UNIQUE,
       password VARCHAR(10),
       user_id INT REFERENCES user_info(id)
);

CREATE TABLE user_role (
	   user_account_id INT REFERENCES user_account(id),
       role VARCHAR(25),
       username VARCHAR(15) UNIQUE
);


CREATE TABLE city (
       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       city VARCHAR(20) UNIQUE
);

CREATE TABLE beach (
       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(30),
       description VARCHAR(1000),
       city_id INT REFERENCES city(id)
);

CREATE TABLE beach_comment (
		beach_id INT REFERENCES beach(id),
		user_id INT REFERENCES user_account(id),
		comment VARCHAR(200)	
);

CREATE TABLE beach_rating (
		beach_id INT REFERENCES beach(id),
		user_id INT REFERENCES user_account(id),
		rating INT		
);

CREATE TABLE surf_conditions (      
       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       dateSC DATE, 
       timeSC TIME, 
       wave_size VARCHAR(10),
       wave_direction VARCHAR(4),
       wind_speed VARCHAR(10),
       wind_direction VARCHAR(4),
       beach_id INT REFERENCES beach(id)
);

CREATE TABLE news (
       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       headline VARCHAR(30),
       text VARCHAR(400),
       newsDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       city_id INT REFERENCES city(id)
);

CREATE TABLE surf_location (
		username VARCHAR(15) UNIQUE,
		city_id INT REFERENCES city(id)
);

INSERT INTO user_info (firstname, lastname, email, date_of_birth, location, skill) VALUES ('Maria', 'Moller', 'mariamollr@gmail.com', '1988-2-28', 'San Dieog', 'Pro');
INSERT INTO user_info (firstname, lastname, email, date_of_birth, location, skill) VALUES ('Ingrid', 'Taroy', 'i.taroy@gmail.com', '1987-11-30','LA', 'middle');
INSERT INTO user_info (firstname, lastname, email, date_of_birth, location, skill) VALUES ('Ali', 'Torstensen', 'at@gmail.com', '1988-5-24',' San Fran', 'beginner');

INSERT INTO city (city) VALUES ('San Diego');
INSERT INTO city (city) VALUES ('Santa Barbara');
INSERT INTO city (city) VALUES ('Los Angeles');


INSERT INTO news (headline, text, city_id) VALUES ('Shark Attack','A shark attacked danndandan', 2);  
INSERT INTO news (headline, text, city_id) VALUES ('Croc Attack','A crock attacked danndandan', 1);

INSERT INTO user_account (username, password, user_id) VALUES ('maria', 'mm', 1);
INSERT INTO user_account (username, password, user_id) VALUES ('ingrid', 'it', 2);
INSERT INTO user_account (username, password, user_id) VALUES ('aleksto', 'at', 3);

INSERT INTO user_role (user_account_id, role, username) VALUES (1, 'poster', 'maria');
INSERT INTO user_role (user_account_id, role, username) VALUES (2, 'user', 'ingrid');
INSERT INTO user_role (user_account_id, role, username) VALUES (3, 'poster', 'aleksto');

INSERT INTO beach (name, description, city_id) VALUES ('Pacific Beach', 
'Pacific Beachs namesake stretches for miles from the Mission 
Bay jetty to the cliffs of La Jolla. The boardwalk, officially called 
Ocean Front Walk/Ocean Boulevard, is a pedestrian walkway that runs 
approximately 3.2 miles along the beach from the end of Law St.
 in the north down into Mission Beach, ending at the mouth of
 Mission Bay in the south. There are many local shops, bars, and 
restaurants along the boardwalk, and it is typically crowded with pedestrians,
 cyclists, rollerbladers, and shoppers. Also adjacent to the boardwalk is the Crystal Pier, 
a public pier and hotel at the west end of Garnet Avenue.', 1);

INSERT INTO beach (name, description, city_id) VALUES (
'Santa Monica Beach', 
' Permitted year-round depending on the level of beach activity.
 During the summer, surfing is allowed only between lifeguard towers
 18 and 20 (Pico Blvd. and Bay St.), and between 28 and 29(Ashland Ave. and Pier St.).
 Always check with lifeguards before surfing.', 3);
 
 
INSERT INTO surf_conditions (dateSC, timeSC, wave_size, wave_direction, wind_speed, wind_direction, beach_id)
 VALUES ('2011-12-02', '10:00:00', '2-3 feet', 'WNW', '5-6', 'NW', 1);
INSERT INTO surf_conditions (dateSC, timeSC, wave_size, wave_direction, wind_speed, wind_direction, beach_id)
 VALUES ('2011-12-02', '14:00:00', '1-2 feet', 'NW', '3-4', 'NW', 1);
INSERT INTO surf_conditions (dateSC, timeSC, wave_size, wave_direction, wind_speed, wind_direction, beach_id)
 VALUES ('2011-12-02', '18:00:00', '1-2 feet', 'NW', '3-4', 'NW', 1);
INSERT INTO surf_conditions (dateSC, timeSC, wave_size, wave_direction, wind_speed, wind_direction, beach_id)
 VALUES ('2011-12-02', '22:00:00', '2-3 feet', 'WNW', '5-6', 'NW', 1);
 
INSERT INTO surf_conditions (dateSC, timeSC, wave_size, wave_direction, wind_speed, wind_direction, beach_id)
 VALUES ('2011-12-02', '10:00:00', '3-4 feet', 'WNW', '5-6', 'NW', 2);
INSERT INTO surf_conditions (dateSC, timeSC, wave_size, wave_direction, wind_speed, wind_direction, beach_id)
 VALUES ('2011-12-02', '14:00:00', '3-4 feet', 'WNW', '5-6', 'W', 2);
INSERT INTO surf_conditions (dateSC, timeSC, wave_size, wave_direction, wind_speed, wind_direction, beach_id)
 VALUES ('2011-12-02', '18:00:00', '2-3 feet', 'WNW', '5-6', 'W', 2);
INSERT INTO surf_conditions (dateSC, timeSC, wave_size, wave_direction, wind_speed, wind_direction, beach_id)
 VALUES ('2011-12-02', '22:00:00', '1-2 feet', 'WNW', '4-5', 'W', 2);
 
INSERT INTO beach_comment (beach_id, user_id, comment) VALUES (1, 1, 'ok1');
INSERT INTO beach_rating (beach_id, user_id, rating) VALUES (2, 2, 2);


INSERT INTO surf_location (username, city_id) VALUES ('Ingrid', 2);
