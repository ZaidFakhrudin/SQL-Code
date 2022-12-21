-- ONE TO MANY & JOINS --
-- Relationship Basics
-- 1. One to One relationship
-- 2. One to Many relationship
-- 3. Many to Many relationship

CREATE DATABASE shop;
USE shop;

CREATE TABLE customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50) );

CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
order_date DATE,
amount DECIMAL (8,2),
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (first_name,last_name,email)
VALUES ('Boy','George','george@gmail.com'),
('George','Michael','gm@gmail.com'),
('David','Bowie','david@gmail.com'),
('Blue','Steele','blue@gmail.com'),
('Bette','Davis','bette@aol.com');

INSERT INTO orders (order_date,amount,customer_id)
VALUES ('2016-02-10',99.99,1),
('2017-11-11',35.50,1),
('2014-12-12',800.67,2),
('2015-01-03',12.50,2),
('1999-04-11',450.25,5);

SELECT * FROM orders;

-- JOINS --
-- JOIN types: Inner,Left,Right

-- Inner Join selects records from A & B where join condition is met

SELECT * FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

-- INNER JOIN with GROUP BY

SELECT first_name,last_name,SUM(amount) AS total FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY first_name,last_name
ORDER BY total DESC;

-- LEFT Join --
-- selects everything from A(left table) along with any matching records from B 

SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS total FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY first_name,last_name;

-- RIGHT Join --
-- selects everything from B(right table) along with any matching records from A

SELECT first_name, last_name, order_date,amount FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;

-- DELETE CASCADE in ref to FOREIGN KEY--

CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
order_date DATE,
amount DECIMAL (8,2),
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- EXERCISE --

CREATE TABLE students(
student_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50)
);

CREATE TABLE papers(
title VARCHAR(100),
grade INT,
student_id INT,
FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT first_name, title, grade FROM students
INNER JOIN papers
ON students.student_id = papers.student_id
ORDER BY grade DESC;

SELECT first_name, title, grade FROM students
LEFT JOIN papers
ON students.student_id = papers.student_id;

SELECT first_name, IFNULL(title, 'missing'), IFNULL(grade,0) FROM students
LEFT JOIN papers
ON students.student_id = papers.student_id;

SELECT first_name, IFNULL(AVG(grade),0) AS average FROM students
LEFT JOIN papers
ON students.student_id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;

SELECT first_name, IFNULL(AVG(grade),0) AS average,
CASE
WHEN IFNULL(AVG(grade),0) >= 75 THEN 'PASS' 
ELSE 'FAIL'
END AS status
FROM students
LEFT JOIN papers
ON students.student_id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;