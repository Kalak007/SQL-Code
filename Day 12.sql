-- day- 12

-- commit saveall the changes made during the current transaction to the
-- database permenantly


-- select * from student
-- start transaction;

-- insert into student values(7, "david", 105);
-- commit

-- reversing all the changes during the specific transaction

-- start transaction;

-- insert into student values(9, "david", 105),
-- (8, "ram", 106);

-- rollback

-- select * from student


-- delete from student where id = 7


-- to list out the existing

-- select user, host from mysql.user;


-- create user "shiva"@"localhost" identified by "12345"

-- allowing the privilieges the user to modify the all the databases
-- grant all privileges on emp.* to "shiva"@"localhost";

-- see the priviliges for the specific user

-- show grants for "shiva"@"localhost"

-- update the password
-- alter user "shiva"@"localhost" identified by "54321"

 -- drop user "shiva"@"localhost"
 -- select user, host from mysql.user;
 
 -- create user "shiva"@"localhost" identified by "12345";
 -- select user,host from mysql.user;
 
 -- rename user "shiva"@"localhost" to "gangadhar"@"localhost";
 
 -- select user, host from mysql.user;
 
 -- grant all privileges on emp.* to "gangadhar"@"localhost";
 
 -- revoke all privileges , grant option from  "gangadhar"@"localhost";
 -- grant select on emp.*  to "gangadhar"@"localhost"
 
 
 -- alter table employee 
--  modify column emp_id int primary key

-- delete from student where id is null



-- primary index automatically created when we define a primary key on a colum
 -- desc student
 
 -- alter table student
-- modify column id  int primary key

-- unique ensures all values in a column are unique when we create unique constraint that by default become as  unique index
-- alter table student
-- modify column name varchar(250) unique

-- delete from student where id = 6 and name = "john"


-- creating a normal index

/*
indexes in mysql  are used to imporve the performance of database queries by enabling the
faster data retrival. they work like an optimized  lookup table for the database 
*/

create index idx_emp_id on employee(emp_id)