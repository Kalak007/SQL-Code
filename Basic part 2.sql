-- use 7pmbatch

-- replacing the oldname with new name in table
-- select * from employee 
-- alter table employee rename column city to address

-- modifying the datatype of a column

-- alter table employee modify column address varchar(90)

-- desc employees

-- creating the table with not null values column
/*

ensures that a column cannot have a Null values
*/

-- show tables
-- drop table employees

/* create table employees(
	emp_id int not null,
    name varchar(70) not null,
    address text)
    /*
    
    
-- insert into employees (name,emp_id) values("nandhini",1)


/*
UNIQUE -- will make sure that every value of the specific should be unique

create table employees(
	emp_id int unique,
    email varchar(70) unique,
    name text
)


insert into employees values(2,"admin@sample.com", "admin"), (3,"admin@sample.com", "admin")

*/
/*
combines not null and unique -- uniquely identifies each record in a table



create table employees(
	emp_id int primary key,
    name text
)


-- insert into employees values(1,"user1"),(1,"user1")
insert into employees (name) values("user")

*/

/*
Foreign Key -- established a relationship between columns in two tables
*/

/*
create table customers(cus_id int primary key, name varchar(50));
create table orders(order_id int primary key, cus_id int, foreign key (cus_id)
 	references customers(cus_id))
    
*/
-- describe orders