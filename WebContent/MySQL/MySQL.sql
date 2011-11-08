DROP TABLE user_roles;
DROP TABLE user_info;

CREATE TABLE users (
	ID SERIAL PRIMARY KEY,
	username TEXT,
	password TEXT
);

CREATE TABLE user_roles(
	username TEXT,
	role TEXT
);

CREATE TABLE user_info(
	username TEXT,
	first_name TEXT,
	last_name TEXT	
);

INSERT INTO users (username, password) VALUES ('ali', 'pass');
INSERT INTO user_roles (username, role) VALUES ('ali', 'admin');
INSERT INTO user_info (username, first_name, last_name) VALUES ('ali', 'Aleksander', 'Torstensen');
