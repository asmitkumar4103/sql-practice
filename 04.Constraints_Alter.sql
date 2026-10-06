-- =========================================
-- SQL CONSTRAINTS
-- =========================================

CREATE DATABASE IF NOT EXISTS company;

USE company;

DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;


-- DEPARTMENT TABLE

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);


-- EMPLOYEE TABLE

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,

    name VARCHAR(100) NOT NULL UNIQUE,

    age INT,

    salary INT DEFAULT 20000,

    email VARCHAR(100) UNIQUE,

    department_id INT,

    CONSTRAINT age_check
        CHECK (age >= 18),

    CONSTRAINT salary_check
        CHECK (salary > 1000),

    CONSTRAINT fk_department
        FOREIGN KEY (department_id)
        REFERENCES department(department_id)
);


-- INSERT DEPARTMENT

INSERT INTO department
(department_id, department_name)
VALUES
(1, 'IT');

INSERT INTO department
(department_id, department_name)
VALUES
(2, 'HR');

INSERT INTO department
(department_id, department_name)
VALUES
(3, 'Finance');


-- INSERT EMPLOYEE

INSERT INTO employee
(employee_id, name, age, salary, email, department_id)
VALUES
(101, 'Amit', 22, 50000, 'amit@gmail.com', 1);


-- DEFAULT EXAMPLE

INSERT INTO employee
(employee_id, name, age, email, department_id)
VALUES
(102, 'Rahul', 23, 'rahul@gmail.com', 2);


INSERT INTO employee
(employee_id, name, age, salary, email, department_id)
VALUES
(103, 'Ankit', 25, 60000, 'ankit@gmail.com', 1);


-- DISPLAY

SELECT * FROM department;

SELECT * FROM employee;


-- =========================================
-- ALTER OPERATIONS
-- =========================================

-- ADD COLUMN

ALTER TABLE employee
ADD COLUMN phone VARCHAR(15);


-- MODIFY COLUMN

ALTER TABLE employee
MODIFY COLUMN phone VARCHAR(20);


-- CHANGE COLUMN NAME

ALTER TABLE employee
CHANGE COLUMN phone mobile VARCHAR(20);


-- RENAME COLUMN

ALTER TABLE employee
RENAME COLUMN mobile TO phone;


-- ADD UNIQUE CONSTRAINT

ALTER TABLE employee
ADD CONSTRAINT unique_phone UNIQUE (phone);


-- RENAME TABLE

ALTER TABLE employee
RENAME TO employees;


-- RENAME BACK

ALTER TABLE employees
RENAME TO employee;


-- CHECK TABLE STRUCTURE

DESC employee;
