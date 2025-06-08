SELECT order_id, customer_name, amount
FROM orders
ORDER BY amount DESC;

CREATE TABLE Employee_details1 (
    Emp_id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Emp_salary INT
);

CREATE TABLE Employee_details2 (
    Emp_id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Emp_salary INT
);

-- Inserting values into Employee_details1
INSERT INTO Employee_details1 (Emp_id, Emp_name, Emp_salary) VALUES
(1, 'Amit', 50000),
(2, 'Neha', 60000),
(3, 'Ravi', 55000),
(4, 'Anjali', 45000),
(5, 'Vikas', 70000);

-- Inserting values into Employee_details2 (including duplicates)
INSERT INTO Employee_details2 (Emp_id, Emp_name, Emp_salary) VALUES
(3, 'Ravi', 55000),  -- Duplicate from Employee_details1
(4, 'Anjali', 45000),  -- Duplicate from Employee_details1
(6, 'Pooja', 65000),
(7, 'Rahul', 58000),
(8, 'Amit', 50000); -- Duplicate name but different ID


SELECT Emp_id, Emp_name, Emp_salary FROM Employee_details1
UNION
SELECT Emp_id, Emp_name, Emp_salary FROM Employee_details2;

SELECT Emp_id, Emp_name, Emp_salary FROM Employee_details1
UNION ALL
SELECT Emp_id, Emp_name, Emp_salary FROM Employee_details2;

 --Apply the INTERSECT operator on these two tables---

 SELECT Emp_id, Emp_name, Emp_salary FROM Employee_details1
INTERSECT
SELECT Emp_id, Emp_name, Emp_salary FROM Employee_details2;

---Apply the EXCEPT operator on these two tables---

SELECT Emp_id, Emp_name, Emp_salary FROM Employee_details1
EXCEPT
SELECT Emp_id, Emp_name, Emp_salary FROM Employee_details2;
