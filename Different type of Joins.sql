
---Create an ‘Orders’ table which comprises of these columns: ‘order_id’,
 --‘order_date’, ‘amount’, ‘customer_id’--

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    customer_id INT
);
select * from orders;

INSERT INTO Orders (order_id, order_date, amount, customer_id) 
VALUES 
(1, '2024-07-01', 150.0, 101),
(2, '2024-07-02', 200.50, 102),
(3, '2024-07-04', 75.25, 103),
(4, '2024-07-05', 300.0, 101),
(5, '2024-07-03', 125.90, 104);

select * from Customer;