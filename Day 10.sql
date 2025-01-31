- Day - 10
-- padding -- 
-- select lpad("hi", "5", "0")
-- select rpad("hi", "5", "0")

-- implementing this in table

-- select lpad(emp_name, "20", "*") from employee
-- select rpad(emp_name, "20", "%") from employee
-- select lpad(emp_name, "20", "na-") from employee

-- insert into employee (emp_id, emp_name) values(30,"arjun"), (31,"krishna"),(35,"nakul")

-- select * from employee where address is null
-- select * from employee where dept is not null

-- while retriving the data if that is null we return that with default values
-- select *, ifnull(salary, 30) from employee;

-- using the inbuild timestamps

-- select sysdate()
-- select current_date()

-- converting a string column of date into datetime column

-- select date_format(now(), '%d-%b-%Y') as date1 
-- select date_format(now(), '%b-%Y-%d') as date1 -- b - month name
-- select date_format(now(), '%b-%a-%Y') as date1 -- a -- day name
-- select date_format(now(), '%d-%m-%Y') as date1

-- integer to string conversion
-- select cast(5634 as char) as stringnumber
-- select concat("today is : ", date_format(now(), "%a-%b-%Y")) as result

-- select str_to_date("24 - 05 - 2024", "%d-%m-%Y") as cdate
select str_to_date("24 - 05 - 2024", "%d-%m-%Y") as cdate