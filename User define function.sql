create table orders(
 order_id int,
 customer_name varchar(50),
 amount float
 );
 insert into orders(order_id, customer_name,  amount) values
 (1,'Amit', 2500),
 (2,'Neha', 1800),
 (3,'Ravi',3200),
 (4, 'Anjali',1500),
 (5, 'Vikas',2900);

 select * from orders;

select
min(amount) as minimum_amount,
max(amount) as maximum_amount,
avg(amount) as average_amount
from orders;

create function multiplybyten(@number int)
returns int
as
begin
return @number * 10
end;

select DBO.multiplybyten(7) AS RESULT;

CREATE FUNCTION GetOrdersAbove(@aboveAmount int)
RETURNS TABLE
AS
RETURN
(
    SELECT order_id, customer_name, amount
    from orders
    WHERE amount > @aboveAmount
);

SELECT * from GetOrdersAbove(2000);

