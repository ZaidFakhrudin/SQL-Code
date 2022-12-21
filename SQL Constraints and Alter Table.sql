-- CONSTRAINTS & ALTER TABLE --

-- UNIQUE constraint: values cannot be duplicated in other rows --
CREATE TABLE companies (
    supplier_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (supplier_id)
);

-- CHECK constraint: limit the value range that can be placed in a column
CREATE TABLE partiers (
  name VARCHAR(50),
  age INT CHECK (age > 18)
);

-- NAMED constraint --
-- providing a name for constraint
CREATE TABLE partiers2 (
 name VARCHAR(50),
age INT,
CONSTRAINT age_over_18 CHECK (age > 18)
);
  
  -- MULTI-COLUMN CHECKS --
  CREATE TABLE companies (
    supplier_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (supplier_id),
    CONSTRAINT name_address UNIQUE (name , address)
);

-- ALTER TABLE:used to add, delete, or modify columns in an existing table
ALTER TABLE companies 
ADD COLUMN city VARCHAR(25);

-- DROP column
ALTER TABLE suppliers
DROP COLUMN city;

-- RENAME tables
RENAME TABLE companies TO suppliers;

-- RENAME column
ALTER TABLE suppliers 
RENAME COLUMN name TO biz_name;

-- Modifying column
-- modify existing column's type
ALTER TABLE suppliers
MODIFY biz_name VARCHAR(100);

-- CHANGE column
-- use to rename column AND change data type
 ALTER TABLE suppliers
 CHANGE col_name col_new DATATYPE(xx);

