create view male_employees
as
select * from employees
where e_gender= 'male';

select * from male_employees;

------ Drop the View-----

drop view male_employees;

-------Transaction in SQL-------
begin transaction
update employees set e_age=30 where e_name='radha';
commit transaction
select * from employees