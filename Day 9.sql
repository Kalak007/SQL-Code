- day -9

-- select * from employee
-- insert into employee values(27, "VIJAY", 7700, "Indraprastham", "ARCHERY")

-- converting the values into lower case to upper and vice versa
-- select lower("HELLO")
-- select lower(emp_name) from employee
-- select upper(dept) from employee

-- insert into employee values(29, "Krishna   ", 5700, "   dwaraka", " knowledge   ");
-- insert into employee values(30, "bhima   ", 12700, "   asthinapur", " kadha   ")

-- select * from employee
-- removing the rights side spaces
-- select rtrim(emp_name) from employee

-- removing the left side spaces
-- select ltrim(address) from employee

-- removing the  spaces around the data
-- select trim(dept) from employee

-- concatenation 
-- select emp_name||dept from employee
-- select "Hello|| World|| SQL" from employee
-- select concat(emp_name,address, dept) from employee
-- select concat(emp_name,"     ", dept) from employee

-- select instr("hello world", "hello")

-- here it will return the position of a in the emp_name column
-- select emp_name, instr(emp_name, "a") from employee

-- based on the position  output it will compare
-- select emp_name, instr(emp_name, "a") from employee where instr(emp_name, "a") > 4

-- slicing text by specifying the number of string we need
-- select substr("hello world",7) -- syntax substr("string", splitting pos)
select substr("hello world",2,8) -- substr("string", splittingpos, count of the value)