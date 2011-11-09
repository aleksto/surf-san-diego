
CREATE TABLE users (
    user_id     SERIAL PRIMARY KEY,
    user_name   TEXT NOT NULL,
    password    TEXT NOT NULL,
    UNIQUE(user_name)
);

INSERT INTO users (user_name, password) VALUES ('john', md5('john'));
INSERT INTO users (user_name, password) VALUES ('ted', md5('ted'));
INSERT INTO users (user_name, password) VALUES ('mary', md5('mary'));

CREATE TABLE user_roles (
    user_role_id    SERIAL PRIMARY KEY,
    user_ref        INTEGER REFERENCES users(user_id),
    user_name       TEXT NOT NULL,
    role            TEXT NOT NULL
);
INSERT INTO user_roles (user_ref, user_name, role) VALUES (1, 'john','student');
INSERT INTO user_roles (user_ref, user_name, role) VALUES (2, 'ted','student');
INSERT INTO user_roles (user_ref, user_name, role) VALUES (3, 'mary','admin');
