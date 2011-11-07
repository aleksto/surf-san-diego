DROP TABLE users;

CREATE TABLE users (
	ID SERIAL PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	username TEXT,
	password TEXT,
	rights TEXT
);

INSERT INTO users (first_name, last_name, username, password, rights) VALUES ('Aleks', 'Zaegers', 'antone', 'az', 'user');