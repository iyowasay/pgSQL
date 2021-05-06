-- create tables in database

CREATE TABLE phone (
	id BIGSERIAL NOT NULL PRIMARY KEY, 
	name VARCHAR(100) NOT NULL, 
	phone_id VARCHAR(100) NOT NULL
);

CREATE TABLE calls (
	id BIGSERIAL NOT NULL PRIMARY KEY, 
	caller VARCHAR(100) NOT NULL, 
	callee VARCHAR(100) NOT NULL,
	duration BIGINT NOT NULL
);

INSERT INTO phone (name, phone_id) VALUES ('Joe', '1111');
INSERT INTO phone (name, phone_id) VALUES ('Lily', '9999');
INSERT INTO phone (name, phone_id) VALUES ('Yumi', '6666');
INSERT INTO phone (name, phone_id) VALUES ('Pete', '1234');
INSERT INTO phone (name, phone_id) VALUES ('Scott', '5678');
INSERT INTO phone (name, phone_id) VALUES ('George', '1024');

INSERT INTO calls (caller, callee, duration) VALUES	('1111', '6666', 60);
INSERT INTO calls (caller, callee, duration) VALUES	('1111', '1024', 32);
INSERT INTO calls (caller, callee, duration) VALUES	('1234', '5678', 40);
INSERT INTO calls (caller, callee, duration) VALUES	('5678', '1024', 21);
INSERT INTO calls (caller, callee, duration) VALUES	('9999', '6666', 23);
INSERT INTO calls (caller, callee, duration) VALUES	('1234', '9999', 37);

-- SQL solution

-- SUM(calls.duration) AS total

SELECT name
FROM phone 
INNER JOIN calls ON phone.phone_id = calls.caller OR phone.phone_id = calls.callee 
GROUP BY phone.name HAVING SUM(calls.duration) > 70 
ORDER BY SUM(calls.duration) DESC;