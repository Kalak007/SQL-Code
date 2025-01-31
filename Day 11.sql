 -- DAY-11

-- normall joins is used to combine rows from two or more tablles based on a
-- related column between them 

/*
create table student (id int primary key,  name varchar(300), department_id int);
create table departments(id int primary key, department_name varchar(60))


insert into student values(1, "john", 101),
(2, "sarah", 102),
(3, "mike", 103),
(4, "anna", null)
*/

-- insert into departments values(105, "Managing director"),(106, "ceo")


-- retrive the employee data along with their depts if exists only
-- select student.name, departments.department_name from student inner join departments
-- on student.department_id = departments.id

-- left join  all the datas from the left table only common datas from right table
-- retrive all the employee even thoug don't belongs any departe

-- select student.name, departments.department_name from student left join departments
-- on student.department_id = departments.id


-- right join  all the datas from the right table only common datas from left table

-- select student.name, departments.department_name from student right join departments
-- on student.department_id = departments.id



-- to achieve the outer join in sql we use union and bring left and right join results together
-- select student.name, departments.department_name from student left join departments
-- on student.department_id = departments.id

-- union
-- select student.name, departments.department_name from student right join departments
-- on student.department_id = departments.id


-- combine every row from the student table withe every row from the tdepartment table

-- select student.name, departments.department_name from student cross join departments

-- union all it will bring the parallel column datas in a single col
-- select student.name, student.department_id from student where department_id > 1
-- union all
-- select departments.department_name, departments.id from departments where id > 1

-- common elemnts we fetched
-- select student.department_id, student.name from student where exists(
-- 	select departments.id from departments where student.department_id = departments.id
-- )

-- select student.department_id, student.name from student where not exists(
-- 	select departments.id from departments where student.department_id = departments.id
-- )

-- case expressiong is used for conditional logic with in queries

-- select emp_id, emp_name , salary,
-- case salary
-- when  9000  then "rich people"
-- when 7000  then "middle peopel"
-- when  5000 then "low salary people"
-- else "need increment"
-- end as category 
-- from employee


-- condition based filtering
select emp_id, emp_name , salary,
case 
when  salary >= 9000  then "rich people"
when salary >= 5000 then "middle peopel"
when  salary >= 3000 then "low salary people"
else "need increment"
end as category 
from employee