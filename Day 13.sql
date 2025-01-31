day - 13
-- creating a normal index

/*
indexes in mysql  are used to imporve the performance of database queries by enabling the
faster data retrival. they work like an optimized  lookup table for the database 
*/

-- create index idx_emp_id on employee(emp_id)

/*
an index in mysql isa data structure that imporves the speed of data retrival from a table

=> speeds up queries
=> optimized the "where" and join conditions
=> enhances the sortings - order by
=> reduces the computational power -- queries access only the required data
*/

-- create index idx_name on employee(emp_name)

-- select * from employee where emp_name = "hema"

-- listing out the indexes on the table
-- show index from employee

-- select * from employee where emp_id > 20 and emp_name = "krishna"

-- dropping out the indexes on the table

-- drop index idx_name on employee

/*
a view in mysql is a virtual table that stores the result. it does not
store actual data but simplifies complex queries, enhaces the security,
data abstraction
*/
-- select * from employee

-- create view employee_view as select emp_name, salary from employee

-- select * from employee_view
-- creating a view with calculated results
-- create view emp_sal_bonus as select emp_name, salary , (salary*2.5) as salary_with_bonus
-- from employee;


-- select * from emp_sal_bonus

-- updating the views

-- create or replace view emp_sal_bonus as select emp_id,address, salary from employee
-- select * from emp_sal_bonus

-- update employee set salary = 10000 where emp_name = "nandhagopal" 

-- what ever happens in the orgin table that will instantly reflected in 
-- the virtual table too

-- what if do some changes in the virtual table will it affect the orgin table

-- we can modify the virtual table
-- update emp_sal_bonus set salary = 19000 where salary = 9000
-- select * from employee

-- how to drop a view table 
-- drop view emp_sal_bonus