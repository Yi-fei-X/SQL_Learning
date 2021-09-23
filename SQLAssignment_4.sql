/*
1.	What is View? What are the benefits of using views?
View is a virtual table. It's contents are defined by the query. Using a view you can customize the data you want for different purposes and make some user procedures easier. 
2.	Can data be modified through views?
Yes. The modification will be done on the base table.
3.	What is stored procedure and what are the benefits of using it?
Stored procedure group some TSQL statements into a logic unit and stored in the SQL server. By using the stored procedure, we can prevent the SQL injection and improve the performance.
4.	What is the difference between view and stored procedure?
View is a virtual table. Stored procedure is a group of TSQL statements.
5.	What is the difference between stored procedure and functions?
Stored precedure is mainly deal with the DML process and functions are mainly deal with calculation and expression.
6.	Can stored procedure return multiple result sets?
Yes. But you need to use the out parameters.
7.	Can stored procedure be executed as part of SELECT Statement? Why?
8.	What is Trigger? What types of Triggers are there?
Trigger is a special type of stored precedure that can be executed when specific event happened. There are 3 types of DML trigger. 1. For. 2. After. 3.Instead of.
9.	What are the scenarios to use Triggers?
If you want to show some information when there are some specific execuations or when you want to automatically update some information.
10.	What is the difference between Trigger and Stored Procedure?
Trigger is a special type of stored precedure that can be automatically executed when specific event happened.
*/

--1.	Lock tables Region, Territories, EmployeeTerritories and Employees. Insert following information into the database. In case of an error, no changes should be made to DB.
--a.	A new region called “Middle Earth”;
--b.	A new territory called “Gondor”, belongs to region “Middle Earth”;
--c.	A new employee “Aragorn King” who's territory is “Gondor”.

--2.	Change territory “Gondor” to “Arnor”.

--3.	Delete Region “Middle Earth”. (tip: remove referenced data first) (Caution: do not forget WHERE or you will delete everything.) In case of an error, no changes should be made to DB. Unlock the tables mentioned in question 1.
begin transaction
insert into region values (5, 'Middle Earth')
insert into Territories values (99999, 'Gondor', 5)
insert into Employees(FirstName, LastName) values('Aragon', 'King')
insert into EmployeeTerritories values((select e.EmployeeID
from Employees as e where FirstName = 'Aragon'), 99999)
--------
update Territories set TerritoryDescription = 'Arnor' where TerritoryDescription = 'Gondor'
--------
delete from EmployeeTerritories where TerritoryID = 99999
delete from Territories where RegionID = 5
delete from Region where RegionID = 5
rollback

--4.	Create a view named “view_product_order_[your_last_name]”, list all products and total ordered quantity for that product.
