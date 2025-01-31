DAY -8
-- delete  statement used to delete one or more records from the table
-- delete from employee where dept = "HR"

-- SET SQL_SAFE_UPDATES = 0

-- fetching the datas from a table with database

-- select * from 7pmbatch.employee

use 7pmbatch;

-- between it will pick up the data the falls with in the range
-- select * from employee where emp_id between 20 and 24

-- to get unique results of the data without count

-- select distinct emp_id from employee 
-- select distinct * from employee

-- select * from employee where salary = (select max(salary) from employee)
-- select * from employee where emp_id in (select emp_id from employee where salary < 5000 )
-- select * from employee where emp_id in (24,26)

-- insert into customers values(22,"user1"),(26,"user2"),(23,"user3"),(24,"user4"),(25,"user5")

-- select * from employee where emp_id in (select cus_id from customers where cus_id < 25 )

-- select * from employee where salary < 9000
-- create table employee_dup as select * from employee where salary < 9000
-- select * from employee_dup

-- using the common columns inbetween employee and employee duplicate
-- insert into employee_dup values(34, "steven", 9000, "manhattan", "mystic arts")

-- select emp_id, emp_name, salary from  employee, employee_dup where emp_id = emp_id -- ambiguasly defined

-- to achive the above query we need create reference
select employee.emp_id, employee.emp_name, employee.salary, employee_dup.emp_id,
employee_dup.emp_name,employee_dup.salary from employee, employee_dup where employee.emp_id = employee_dup.emp_id