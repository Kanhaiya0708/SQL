CREATE TABLE Salesman (
    SalesmanId INT PRIMARY KEY,
    Name VARCHAR(255),
    Commission DECIMAL(10, 2),
    City VARCHAR(255),
    Age INT
);

Select * from Salesman;


 INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
 VALUES
 (101, 'Joe', 50, 'California', 17),
 (102, 'Simon', 75, 'Texas', 25),
 (103, 'Jessie', 105, 'Florida', 35),
 (104, 'Danny', 100, 'Texas', 22),
 (105, 'Lia', 65, 'New Jersey', 30)

  Create table Orders (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount
 money);

 INSERT INTO Orders Values
 (5001,2345,101,'2021-07-01',550),
 (5003,1234,105,'2022-02-15',1500);

 CREATE TABLE Customer (
 SalesmanId INT,
 CustomerId INT,
 CustomerName VARCHAR(255),
 PurchaseAmount INT,
 );

  INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
 VALUES
 (101, 2345, 'Andrew', 550),
 (103, 1575, 'Lucky', 4500),
 (104, 2345, 'Andrew', 4000),
 (107, 3747, 'Remona', 2700),
 (110, 4004, 'Julia', 4545);

 select * from Customer;

 --1.Insert a new record in your Orders table.----

 insert into Orders (OrderId, CustomerId, SalesmanId, Orderdate, Amount)
values (5002,3456, 103, '2023-01-01', 2000);

---2.Add Primary key constraint for SalesmanId column in Salesman table. Add default 
---constraint for City column in Salesman table.

alter table Salesman
Add default 'Mumbai' FOR City;

alter table Salesman
add primary key (SalesmanId);

--Add Foreign key constraint for SalesmanId 
--column in Customer table. 

alter table Customer
add FOREIGN KEY (SalesmanId) references Customer (SalesmanId);

ALTER TABLE Customer

Select DISTINCT SalesmanId
from Customer
where SalesmanId not in (Select SalesmanId from Salesman);

--Add not null constraint in Customer_name column for the 
--Customer table. 

Alter table Customer
Alter column CustomerName VARCHAR(255) NOT NULL;

--3.Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase 
--amount value greater than 500. 

select * from Customer 
where CustomerName like '%n'
 and PurchaseAmount > 500;

-- 4.Using SET operators, retrieve the first result with unique SalesmanId values from two 
--tables, and the other result containing SalesmanId with duplicates from two tables. 

 Select SalesmanId from Customer
Union all
Select SalesmanId from Orders;

select o.orderdate, s.name, c.customername
from orders o
join salesman s on o.salesmanid = s.salesmanid
join customer c on o.customerid = c.customerid
where c.purchaseamount > 1500;

--5.Display the below columns which has the matching data. 
--Orderdate, Salesman Name, Customer Name, Commission, and City which has the 
--range of Purchase Amount between 500 to 1500.

select o.orderdate,s.name as salesmanname,c.customername,s.commission,s.city
from orders o
join salesman s on o.salesmanid = s.salesmanid
join customer c on o.customerid = c.customerid
where c.purchaseamount between 500 and 1500;

--6.sing right join fetch all the results from Salesman and Orders table. 
 
 select *
from salesman s
right join orders o on s.salesmanid = o.salesmanid;

