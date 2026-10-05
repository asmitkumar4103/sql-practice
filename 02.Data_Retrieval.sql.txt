-- ==========================================
-- EMPLOYEE DATABASE
-- ==========================================

CREATE DATABASE ORG;

USE ORG;


-- ==========================================
-- WORKER TABLE
-- ==========================================

CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);


-- ==========================================
-- INSERT WORKER DATA
-- ==========================================

INSERT INTO Worker
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES
(001, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');


-- ==========================================
-- VIEW WORKER DATA
-- ==========================================

SELECT * FROM Worker;


-- ==========================================
-- BONUS TABLE
-- ==========================================

CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);


-- ==========================================
-- INSERT BONUS DATA
-- ==========================================

INSERT INTO Bonus
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE)
VALUES
(001, 5000, '2016-02-20'),
(002, 3000, '2016-06-11'),
(003, 4000, '2016-02-20'),
(001, 4500, '2016-02-20'),
(002, 3500, '2016-06-11');


-- ==========================================
-- TITLE TABLE
-- ==========================================

CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);


-- ==========================================
-- INSERT TITLE DATA
-- ==========================================

INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(001, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(001, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');


-- ==========================================
-- DATA RETRIEVAL
-- ==========================================

-- Select all columns
SELECT * FROM Worker;

-- Select specific column
SELECT SALARY FROM Worker;

-- Select multiple columns
SELECT FIRST_NAME, SALARY
FROM Worker;


-- ==========================================
-- WHERE CLAUSE
-- ==========================================

-- Salary greater than 80000
SELECT *
FROM Worker
WHERE SALARY > 80000;

-- Workers from HR department
SELECT *
FROM Worker
WHERE DEPARTMENT = 'HR';


-- ==========================================
-- BETWEEN
-- ==========================================

SELECT *
FROM Worker
WHERE SALARY BETWEEN 80000 AND 300000;


-- ==========================================
-- OR OPERATOR
-- ==========================================

SELECT *
FROM Worker
WHERE DEPARTMENT = 'HR'
   OR DEPARTMENT = 'Admin';


-- ==========================================
-- IN OPERATOR
-- ==========================================

SELECT *
FROM Worker
WHERE DEPARTMENT IN ('HR', 'Admin');


-- ==========================================
-- NOT IN OPERATOR
-- ==========================================

SELECT *
FROM Worker
WHERE DEPARTMENT NOT IN ('HR', 'Admin');


-- ==========================================
-- LIKE OPERATOR
-- ==========================================

-- Names containing the letter 'i'
SELECT *
FROM Worker
WHERE FIRST_NAME LIKE '%i%';
