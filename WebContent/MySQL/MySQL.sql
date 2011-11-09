DROP TABLE user_roles;
DROP TABLE user_info;

CREATE TABLE users (
	ID SERIAL PRIMARY KEY,
	user_name TEXT,
	password TEXT
);

CREATE TABLE user_roles(
	user_name TEXT,
	role TEXT
);

CREATE TABLE user_info(
	user_name TEXT,
	first_name TEXT,
	last_name TEXT	
);

INSERT INTO users (user_name, password) VALUES ('ali', 'pass');
INSERT INTO user_roles (user_name, role) VALUES ('ali', 'admin');
INSERT INTO user_info (user_name, first_name, last_name) VALUES ('ali', 'Aleksander', 'Torstensen');
