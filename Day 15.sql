- Day - 15
 
/*
in mysql the having clause is used to filter the results of a query afte the group by 
it is just replica of where but while where filters rows before grouping but having
groups after they have been grouped formed
*/
 
-- select dept, count(emp_id) from employee group by dept having count(emp_id) > 1;
-- select dept, count(emp_id) from employee group by dept where count(emp_id) > 1;
 
/*
create table sales(
	product_id int,
    product_name varchar(255),
    quantity_solid int,
    total_revenue decimal(10,2)
)
 
*/
 
-- insert into sales values(1, "watch", 20, 156000),
-- (2, "laptop", 50, 256000),
-- (3, "phone", 60, 186000),
-- (4, "tablefan", 88, 136000),
-- (5, "refrigerator", 39, 126000)
 
 
/*
select product_name, sum(quantity_solid) as total_quantity_solid, sum(total_revenue) as
total_profit from sales
group by product_name
Having sum(quantity_solid) > 3 and sum(total_revenue) > 100000
*/
 
/*
exists operator used in subquries to check whether a subqury returns any rows 
it returns true i the subquery has at least one row.othervise it returns flase
 
this is useful or checking the existence of related records in another table
*/
 
-- select name from customers c where exists(
-- 	select 1 from orders o where o.cus_id = c.cus_id
-- )
 
 
-- delete all customers who have places at least one order we cannot use same table against 
delete from customers where exists(
	select 1 from orders where orders.cus_id = customers.cus_id
)
 
 
-- select * from customers
has context menu