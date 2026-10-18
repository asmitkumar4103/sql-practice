
-- SQL JOINS: STUDY AND REVISION

-- 1. INNER JOIN
SELECT *
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;

-- 2. LEFT JOIN
SELECT *
FROM Employees e
LEFT JOIN Departments d
ON e.department_id = d.department_id;

-- 3. RIGHT JOIN
SELECT *
FROM Employees e
RIGHT JOIN Departments d
ON e.department_id = d.department_id;

-- 4. LEFT EXCLUSIVE JOIN
-- Employees with no matching department
SELECT *
FROM Employees e
LEFT JOIN Departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- 5. RIGHT EXCLUSIVE JOIN
-- Departments with no matching employees
SELECT *
FROM Employees e
RIGHT JOIN Departments d
ON e.department_id = d.department_id
WHERE e.department_id IS NULL;

-- 6. FULL OUTER JOIN
SELECT *
FROM Employees e
FULL OUTER JOIN Departments d
ON e.department_id = d.department_id;

-- 7. UNION
-- Combines results and removes duplicates
SELECT employee_name AS name
FROM Employees
UNION
SELECT department_name AS name
FROM Departments;
