-- DATATYPES --

-- CHAR vs VARCHAR --
-- Similar but differ in the way they are stored. They also differ in max length and trailing space retention

-- VARCHAR is best used for values that are varied in character such as names;
-- CHAR has a FIXED length. Every string data will be stored in the specified character length;

-- INT: Whole Numbers --
-- SMALLINT,TINYINT,MEDIUMINT,BIGINT;
-- Differ in terms of how large of int that can be stored. Memory & storage optimization 

-- Fixed-Point: DECIMAL/NUMERIC The DECIMAL and NUMERIC types store exact numeric data values. 
-- These types are used when it is important to preserve exact precision, for example with monetary data 
-- DECIMAL: syntax DECIMAL(X,Y)
-- X: total no of digits Y: digits after the decimal point

-- FLOAT & DOUBLE --
-- stores larger numbers using less space BUT it is less precise
-- Float: ~7 digits, Double ~15 digits

-- DATE/TIME --
-- DATE: Values w date but no time YYYY-MM-DD --
-- TIME: Values w time but no date HH:MM:SS --
-- DATETIME: Values w date & time YYYY-MM-DD HH:MM:SS

CREATE TABLE people (
name VARCHAR(50),
birthdate DATE,
birthtime TIME,
birthdt DATETIME);

DESC people;

INSERT INTO people (name,birthdate, birthtime, birthdt)
VALUES ('Elton', '1997-06-25', '03:15:54', '1997-06-25 03:15:54');

SELECT * FROM people;

INSERT INTO people (name,birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-03-02', '11:00:32', '1985-03-02 11:00:32'),
('Zola', '2000-12-15', '15:06:14', '2000-12-15 15:06:14')
;

SELECT * FROM people;

-- CURDATE(), CURTIME(), NOW() --
-- gives current date, current time and current datetime

INSERT INTO people (name,birthdate,birthtime,birthdt)
VALUES ('Lidia', CURDATE(), CURTIME(), NOW());

-- DATE FUNCTIONS --

-- DAY (dayofmonth)
SELECT birthdate, DAY(birthdate), DAYOFWEEK(birthdate),
DAYOFYEAR(birthdate) FROM people;

-- Month/Year --
SELECT name,birthdt, MONTHNAME(birthdt), YEAR(birthdt) FROM people;

-- TIME functions --
SELECT name,birthtime, HOUR(birthtime), 
MINUTE(birthtime), SECOND(birthtime) FROM people;

-- Format Dates --
-- DATE_FORMAT(date,format)
SELECT birthdate, DATE_FORMAT(birthdate,'%a %b %e') FROM people;

-- DATE MATH --

-- DATEDIFF(expr1,expr2): returns 1-2 as a value in days
-- from one date to the other
SELECT birthdate, DATEDIFF(CURDATE(),birthdate) FROM people;

-- DATE_ADD/DATE_SUB
-- (date,INTERVAL expr_unit)
SELECT DATE_ADD(CURDATE(), INTERVAL 1 YEAR);
SELECT DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- TIMEDIFF(expr1,expr2): returns 1-2 as a value in time
-- from one time to the other
SELECT CURTIME(), TIMEDIFF(CURTIME(), '07:00:00');

-- TIMESTAMP: combines date and time --
-- differ from DATETIME in terms of storage because they support a lesser time range

-- DEFAULT/ ON UPDATE --

CREATE TABLE captions (
text VARCHAR(100),
created_at TIMESTAMP default CURRENT_TIMESTAMP,
updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO captions (text) 
VALUES ('today is a saturday'),
('beautiful sunset');

SELECT * FROM captions;

UPDATE captions SET text='today is sunday' WHERE text='today is a saturday';
SELECT * FROM captions;

-- DATA TYPES EXERCISE --

-- What's a good use for CHAR? It's good to use CHAR for instances where
-- you know a column requires values with fixed character
-- eg. Country codes HND,SIN,CDG so CHAR(3)

CREATE TABLE inventory (
item_name VARCHAR(50),
price DECIMAL(8,2),
quantity INT
);

-- Difference between DATETIME & TIMESTAMP
-- differ in terms of storage space required
-- TIMESTAMP has a narrow range ie; 1970-2038 where
-- DATETIME has limit of year 1000-9999
-- similar in sense that both display date and time

SELECT CURTIME();
SELECT CURDATE();

-- Current Day of the Week as a number

SELECT CURDATE(), DAYOFWEEK(CURDATE());
SELECT CURDATE(), DAYNAME(CURDATE());

-- print out current date and time in mm/dd/yyyy

SELECT NOW(), DATE_FORMAT(NOW(), '%m'/'%d'/'%Y');

SELECT DATE_FORMAT(NOW(), '%M %D at %k:%i');

CREATE TABLE tweets (
caption VARCHAR(140),
username VARCHAR(20),
tweet_created TIMESTAMP default CURRENT_TIMESTAMP()
);