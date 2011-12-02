DROP TABLE IF EXISTS user_info;
DROP TABLE IF EXISTS user_account;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS surf_conditions;
DROP TABLE IF EXISTS news;
DROP TABLE IF EXISTS user_role;
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
       password VARCHAR(10) NOT NULL,
       user_id INT REFERENCES user_info(id)
);

CREATE TABLE user_role (
	   user_account_id INT REFERENCES user_account(id),
       role VARCHAR(25) NOT NULL,
       username VARCHAR(15) UNIQUE
);


CREATE TABLE city (
       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       city VARCHAR(20) UNIQUE
);

CREATE TABLE beach (
       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(30) NOT NULL,
       description VARCHAR(1000) NOT NULL,
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
       dateSC DATE NOT NULL, 
       timeSC TIME NOT NULL, 
       wave_size VARCHAR(10) NOT NULL,
       wave_direction VARCHAR(4) NOT NULL,
       wind_speed VARCHAR(10) NOT NULL,
       wind_direction VARCHAR(4) NOT NULL,
       beach_id INT REFERENCES beach(id)
);

CREATE TABLE news (
       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       headline VARCHAR(60) NOT NULL,
       text VARCHAR(400) NOT NULL,
       newsDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
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

INSERT INTO news (headline, text, city_id) VALUES ('Go Fish. But…where?','Chris Manning normally went surfboard 
fishing in the early morning with the other regulars — Roy and Vicky, Steve, Russell, and the other Roy. 
But with the ocean as flat as a lake and the water at 70 degrees, he headed out one warm September evening 
last year. Walking from his house in North Pacific Beach, Manning carried a soft-top surfboard, a backpack 
containing his rod and reel and, in his unlimited optimism, a large fishing net. This evening that net 
would come in handy.', 1);  

INSERT INTO news (headline, text, city_id) VALUES ('Santa Barbara County Feels the Effects as Santa Ana Winds ',
'The strong santa ana winds that knocked down power lines and trees all over California on Thursday are beginning 
to move across the country. In Santa Barbara County, the winds peaked on Thursday, but windy weather is expected 
to continue Friday and into Saturday.', 2);

INSERT INTO news (headline, text, city_id) VALUES ('Holiday news','Kick the holiday season off with 
Montana Avenues annual Holiday Walk. There will be special promos and sales, and of course, Santa, 
too. Enjoy festive blocks of complimentary holiday delights, family shopping, gourmet restaurants, 
singing, music and a few surprises. For more information, visit montanaave.com.', 3); 

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
 
 INSERT INTO beach (name, description, city_id) VALUES (
'Santa Barbara Beach', 
' Santa Barbara County offers miles and miles of beautiful beaches. But enjoying 
the outdoors in Santa Barbara means more than sand and surf. Santa Barbara is also 
home to some 50 public parks and picnic areas.', 3);
 
 
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
 
 INSERT INTO surf_conditions (dateSC, timeSC, wave_size, wave_direction, wind_speed, wind_direction, beach_id)
 VALUES ('2011-12-02', '10:00:00', '3-4 feet', 'N', '7', 'NW', 3);
INSERT INTO surf_conditions (dateSC, timeSC, wave_size, wave_direction, wind_speed, wind_direction, beach_id)
 VALUES ('2011-12-02', '14:00:00', '3-4 feet', 'N', '5-6', 'W', 3);
INSERT INTO surf_conditions (dateSC, timeSC, wave_size, wave_direction, wind_speed, wind_direction, beach_id)
 VALUES ('2011-12-02', '18:00:00', '2-3 feet', 'WN', '5-6', 'W', 3);
INSERT INTO surf_conditions (dateSC, timeSC, wave_size, wave_direction, wind_speed, wind_direction, beach_id)
 VALUES ('2011-12-02', '22:00:00', '1-2 feet', 'WN', '4-5', 'W', 3);
 
INSERT INTO beach_comment (beach_id, user_id, comment) VALUES (1, 1, 'test');
INSERT INTO beach_rating (beach_id, user_id, rating) VALUES (1, 1, 2);

INSERT INTO surf_location (username, city_id) VALUES ('Ingrid', 2);
INSERT INTO surf_location (username, city_id) VALUES ('maria', 1);
INSERT INTO surf_location (username, city_id) VALUES ('aleksto', 3);
