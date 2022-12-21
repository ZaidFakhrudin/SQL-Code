USE cats;
DROP TABLE cats;

CREATE TABLE Cats (
Cat_id INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(50),
Breed VARCHAR(50),
Age INT
); 

DESC Cats;

INSERT INTO Cats (Name,Breed,Age)
VALUES ('Ringo','Tabby',4),
('Cindy','Maine Coon',10),
('Dumbledore','Maine Coon',11),
('Egg','Persian',4),
('Misty','Tabby',13),
('George Michael','Ragdoll',9),
('Jackson','Sphynx',7);

SELECT * FROM Cats;

SELECT Name From Cats;
SELECT * FROM Cats WHERE Age = 4;

-- EXERCISE --

SELECT Cat_id FROM Cats;

SELECT Name, Breed FROM Cats;

SELECT Name, Age FROM Cats WHERE Breed = 'Tabby';

SELECT Cat_id, Age FROM Cats WHERE Cat_id = Age;

-- ALIASES : Use 'AS' to alias a column in your output to give 
-- it a meaningful name. Does not change the name in original dataset

SELECT Cat_id AS ID, Name FROM Cats;

-- Update: Alter existing data

-- SYNTAX - UPDATE (tablename) SET (column_name) = (new_name);

SELECT * FROM Cats;

UPDATE Cats SET Name='Jack' WHERE Name='Jackson';

UPDATE Cats SET breed='British Shorthair' WHERE Name='Ringo';

UPDATE Cats SET Age=12 WHERE Breed='Maine Coon';

SELECT * FROM Cats;

-- DELETION --
-- SYNTAX: DELETE FROM tablename WHERE col=val --

DELETE FROM Cats WHERE Age=4;

DELETE FROM Cats WHERE Cat_id=Age;

DELETE FROM Cats;

SELECT * FROM Cats;

-- CRUD EXERCISE USING NEW DATABASE SHIRTS_DB

CREATE DATABASE shirts_db;
USE shirts_db;

CREATE TABLE shirts (
shirt_id INT AUTO_INCREMENT PRIMARY KEY,
article VARCHAR(50),
color VARCHAR(30),
shirt_size VARCHAR(30),
last_worn INT);

DESC shirts;

INSERT INTO shirts (article,color,shirt_size,last_worn)
VALUES ('t-shirt','white','S',10),
('t-shirt','green','S',200),
('polo shirt','black','M',10),
('tank top','blue','S',50),
('t-shirt','pink','S',0),
('polo shirt','red','M',5),
('tank top','white','S',200),
('tank top','blue','M',15);

SELECT * FROM shirts;

INSERT INTO shirts (article,color,shirt_size,last_worn)
VALUES ('polo shirt','purple','M',50);

SELECT * FROM shirts;

SELECT article,color FROM shirts;

SELECT * FROM shirts WHERE shirt_size='M';

UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';

SELECT * FROM shirts;

UPDATE shirts SET last_worn='0' WHERE last_worn='15';

UPDATE shirts SET shirt_size='XS', color='off white' WHERE color='white';

DELETE FROM shirts WHERE last_worn='200';

DELETE FROM shirts WHERE article='tank top';

DELETE FROM shirts;

DROP TABLE shirts;