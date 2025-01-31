/*
window function in mysql allow us to perform calculatiosn across a swet of rows related to the current
row
*/

-- row_number()  assings a unique row number to each row in the partition

-- select emp_id,emp_name, dept, row_number() over(partition by dept order  by emp_id desc)
 -- as row_num from employee
 
-- rank() -- assiging a ranking with gaps if there are duplicates

/*
if two employees have the same salary they get the same rank, but the next rank is skipped
*/
-- select * from employee
-- select emp_id, emp_name, dept, salary, rank() over( partition by dept order by salary desc) as ranking
-- from employee


/*
running total within a partition
*/

-- calculates the cumulative salary sum for each department
-- select emp_id, dept,emp_name, salary, sum(salary) over (partition by dept order by emp_name desc) as
-- cumulative_sum from employee;

-- LAG() -- access the previous value

-- trying get the previous salary of employees only works if we have duplicate values
-- select emp_id, emp_name, dept, salary, lag(salary) over (partition by dept order by emp_name)
-- as previous_salary from employee

-- LEAD() -- access the next salary
-- get the next salary of the employee

-- select emp_id, emp_name, salary, dept, lead(salary) over ( partition by dept order by emp_name ) as
-- next_salary from employee


-- how to select the datas inbetween Foreign key tables
-- desc customers

-- insert into customers values (1, "alice" ), (2, "bob"), (3, "peter");
-- insert into orders values(101, 1, "laptop"),(102, 2, "keyboard"),(103, 3, "phone")

-- retrive the data using inner join with foreign key
-- select c.cus_id, c.name, o.order_id, o.product from customers  c
-- join orders o on c.cus_id = o.cus_id;

-- using the where on the foreign key

-- select order_id, product, cus_id from orders where cus_id = (select
--  cus_id from customers where name = "alice")