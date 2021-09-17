/*
1. Use Join, because it's faster.
2. CTE is common table expression. CTE can be used to create a recursive query and make the code more readable.
3. Table variable is a data type that can be used within TSQL. 
4. Delete is to remove specific rows from a table and can be rolled back. Truncate is to remove all the rows from a table and can not be rolled back. Truncate has better performance because it makes less use of the transaction log.
*/

--1
select distinct c.City
from Customers as c
join Employees as e
on c.City = e.City

--2
select distinct c.City
from Customers as c
where c.city not in (
select e.City
from Employees as e
)

select distinct c.City
from Customers as c
left join Employees as e
on c.City = e.City
where e.city is null

--3
select od.ProductName, SUM(od.Quantity) as total_quantities
from [Order Details Extended] as od
group by od.ProductName

--4
select c.City, sum(od.Quantity) as total_products
from Customers as c
join Orders as o
on c.CustomerID = o.CustomerID
join [Order Details] as od
on o.OrderID = od.OrderID
group by c.City

--5
select c.city, count(1) as number_of_customers
from Customers as c
group by c.City
having count(1) >= 2

--6
with city_product
as
(
select distinct c.City, od.ProductName
from Customers as c
join Orders as o
on c.CustomerID = o.CustomerID
join [Order Details Extended] as od
on o.OrderID = od.OrderID
)
select cp.City, count(1) as number_of_products
from city_product as cp
group by cp.City
having count(1) >= 2

--7
select distinct c.CustomerID
from Customers as c
join Orders as o
on c.CustomerID = o.CustomerID
where c.City != o.ShipCity

--8
with Product_City
as
(
select od.ProductName, c.City, sum(od.Quantity) as total, sum(od.ExtendedPrice) as sum_price
from Customers as c
join Orders as o
on c.CustomerID = o.CustomerID
join [Order Details Extended] as od
on o.OrderID = od.OrderID
group by od.ProductName, c.City
)
select top 5 pc.ProductName, sum(pc.total) as total, sum(pc.sum_price)/sum(pc.total) as avg_price
from Product_City as pc
group by pc.ProductName
order by total desc

--9
select distinct e.city
from Employees as e
where e.city not in (
select o.ShipCity
from orders as o
)

select distinct e.city
from Employees as e
left join Orders as o
on e.City = o.ShipCity
where o.ShipCity is null

--10
select tb1.ShipCity as City
from
(
select top 1 o.ShipCity, count(1) as order_numbers
from orders as o
group by o.ShipCity
order by order_numbers desc
) as tb1
join
(
select top 1 o1.ShipCity, sum(od.Quantity) as total_quantities
from Orders as o1
join [Order Details] as od
on o1.OrderID = od.OrderID
group by o1.ShipCity
order by total_quantities desc
) as tb2
on tb1.ShipCity = tb2.ShipCity

--11
distinct

--12
select concat(e3.FirstName, ' ', e3.LastName) as employee
from Employees as e3
where concat(e3.FirstName, ' ', e3.LastName) not in 
(
select distinct concat(e1.FirstName, ' ', e1.LastName) as manager
from Employees as e1
join Employees as e2
on e1.EmployeeID = e2.ReportsTo
)

--13 and 14
--No related tables with the questions
