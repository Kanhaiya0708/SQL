----Create a customer table which comprises of these columns: ‘customer_id’,--
--‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’------

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zip VARCHAR(10)
);

select * from Customer;

------Insert 5 new records into the table----------
INSERT INTO Customer (customer_id, first_name, last_name, email, address, city, state, zip) VALUES
(1, 'Amit', 'Sharma', 'amit.sharma@email.com', '123 Main St', 'Mumbai', 'Maharashtra', '400001'),
(2, 'Neha', 'Verma', 'neha.verma@email.com', '456 Elm St', 'Delhi', 'Delhi', '110001'),
(3, 'Ravi', 'Kumar', 'ravi.kumar@email.com', '789 Oak St', 'Bangalore', 'Karnataka', '560001'),
(4, 'Anjali', 'Mehta', 'anjali.mehta@email.com', '321 Pine St', 'Chennai', 'Tamil Nadu', '600001'),
(5, 'Vikas', 'Patel', 'vikas.patel@email.com', '654 Maple St', 'Hyderabad', 'Telangana', '500001');

 ---Select only the ‘first_name’ and ‘last_name’ columns from the customer table----

 SELECT first_name,last_name FROM Customer;

 ----Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’.---

 SELECT * FROM customer 
 WHERE first_name LIKE 'G_' AND city ='San Jose';

 --Select those records where Email has only ‘gmail’.
 SELECT * FROM Customer
where email LIKE '%gmail.com';

----SELECT * FROM Customer---
SELECT * FROM Customer
WHERE last_name NOT LIKE '%A';

