DAY 7

-- and -- if all the conditions matching rows only it will return
-- select * from employee where emp_name = "jhon" and salary = 7000 and emp_id = 22

-- or -- among the given condition any one condition matches also the corresponding rows will appear
-- select * from employee where emp_name = "jhon" or emp_id > 26
-- select * from employee where not emp_name = "jhon" 

-- select * from employee where salary in (3000, 7000)
-- select * from employee where salary not in (3000, 7000)

-- like  -- used in a where clause to search for a specified pattern in a column. it is commonly
--  used for pattern matching with string

-- fetching the record where address starts with b
-- select * from employee where address like "b%"

-- fetching the records where the  name ends with "l"and
-- select * from employee where emp_name like "%l"

-- fetching the records where the 3rd chr of name should o
-- select * from employee where emp_name like "__o%"

-- fetching all the records where address contains "ker"
-- select * from employee where address like "%ker%"

-- to get the sum of the sal

-- select sum(salary) from employee
-- select min(salary) from employee
-- select max(salary) from employee

-- order by

-- fetching all the records by ascending order of the salary

-- select * from employee order by salary asc
-- select * from employee order by salary desc
-- multiple column ascending order

-- select * from employee order by salary asc, emp_name asc

-- fetching the first few records
-- select * from employee limit 3

-- fetching middle few rows
-- select * from employee limit 3 offset 5


-- alter table employee add column dept varchar(30)

-- to update all the records of the specific col
-- update employee set dept = "IT"
# updating the col based some condition 
-- update employee set dept = "HR" where emp_name in ("hema", "swetha")
-- update employee set dept = "sales" where emp_id = 26
-- update employee set dept = "testing" where emp_id in (22, 24)


-- group by in sql is used to group rowsw that have the same values in specifed columns into aggregate the data


-- fetch the count of the people department wise
-- select dept, count(*) as emp_count from employee group by dept

-- select count(*) from employee

-- give the sum of the salary dept
-- select dept, sum(salary) from employee group by dept

-- give the sum of the salary based job
select job, sum(salary) from employee group by job
