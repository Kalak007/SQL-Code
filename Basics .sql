-- to list out the databases 
-- show databases

/*
mysql is one of
a variant of the sql
such like oracle
*/

-- to create a database 
-- create database 7pmbatch

-- to delete a database
-- drop database 5pmjune

-- selecting database to perform actions and create the tables

-- use 7pmbatch;

-- to check the existing tables in the database 

-- show tables

-- creating the table

-- create table employee(emp_id int, emp_name varchar(80), salary float, address text)

-- to describe (to see lay out of the table)

-- desc employee

-- deleting the table from the database

-- drop table employee 

-- inserting the data into a table for all columns and multiple values

/*
insert into employee values(22, "nandhagopal", 9000, "bleeker st, florida"),
(24, "Yuvaraj", 9000, "baker st, texas"),
(26, "hema", 9000, "seeker st, boston"),
(29, "swetha", 9000, "rocker st, newjersy")
/*

-- populating the data for a specific column

/*
insert into employee (emp_id, emp_name, salary) values(44, "nadhini",4000),
(45, "Karthick",7000)
*/



-- to display the content table
-- select * from employee

-- deleting erase all the datas from the table and keep the empty table

-- truncate table employee

-- modifying the table structure by adding column

 -- alter table employee add column pincode int

-- describe employee

-- dropping an existing column in a table

-- alter table employee drop column pincode