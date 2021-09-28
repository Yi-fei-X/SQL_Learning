--1.	What is an object in SQL?

--2.	What is Index? What are the advantages and disadvantages of using Indexes?
--Like the catelog of the book, index is a faster way to get the data we want.
--Pros: We can get the data faster.
--Cons: When we do the insert and delete statement, it can be slower.

--3.	What are the types of Indexes?
--Clustered index and non clustered index.

--4.	Does SQL Server automatically create indexes when a table is created? If yes, under which constraints?
--Yes, when you create a primary key, it will automatically create clustered index. When you create a unique key it will automatically create a non clustered index.

--5.	Can a table have multiple clustered index? Why?
--No, because the culstered index will sort the data, so you can only have one clustered index.

--6.	Can an index be created on multiple columns? Is yes, is the order of columns matter?
--Yes, when you have a composite key.

--7.	Can indexes be created on views?
--Yes

--8.	What is normalization? What are the steps (normal forms) to achieve normalization?
--normalization is a process to reduce the data redundancy and improve the data integrity. There are 3 kinds of data normalization form.
--1 First normal form. You have primary key and no multiple value in each column and no repeating column.
--2 Second normal form. You meet all requirements in first normal form and remove redundant data to seperate table and create foreign key relationship.
--3 Third normal form. You meet all requirements in second normal form and all the column must be fully dependent on the primary key.

--9.	What is denormalization and under which scenarios can it be preferable?
--Denormalization is a database optimization technique in which we add redundant data to one or more tables.

--10.	How do you achieve Data Integrity in SQL Server?
--Using store procedure.
--Using normalization.

--11.	What are the different kinds of constraint do SQL Server have?
--Not null, primary key, unique, foreign key, check constraint.

--12.	What is the difference between Primary Key and Unique Key?
--1. Primary key can not have null value and unique key can have one null value.
--2. You can have only 1 primary key in a table but you can have multiple unique key.
--3. Primary key will automatically create clustered index, unique key will automatically create non-clustered index.
--4. Primary key will sort the data, unique key will not sort the data.
--5. Primary key can have foreign key relationship.

--13.	What is foreign key?
--Foreign key create the relationship between two tables.

--14.	Can a table have multiple foreign keys?
--Yes

--15.	Does a foreign key have to be unique? Can it be null?
--No. Yes

--16.	Can we create indexes on Table Variables or Temporary Tables?
--Yes

--17.	What is Transaction? What types of transaction levels are there in SQL Server?
--Transaction is a logic unit of code that can be either executed completely or not at all.
--read uncommitted
--read committed
--repeatable read
--serializable

----1.	Write an sql statement that will display the name of each customer and the sum of order totals placed by that customer during the year 2002
---- Create table customer(cust_id int,  iname varchar (50)) create table order(order_id int,cust_id int,amount money,order_date smalldatetime)

--create table customer(cust_id int,  iname varchar (50))
--create table [order](order_id int,cust_id int,amount money,order_date smalldatetime)

--select c.cust_id, sum(amount)
--from customer as c
--inner join [order] as o
--on c.cust_id = o.cust_id
--group by c.cust_id, o.order_date
--having o.order_date = 2002

----2. The following table is used to store information about company’s personnel:
----Create table person (id int, firstname varchar(100), lastname varchar(100)) write a query that returns all employees whose last names  start with “A”.

--Create table person (id int, firstname varchar(100), lastname varchar(100))

--select p.id, p.firstname, p.lastname
--from person as p
--where p.lastname like 'A%'

----3.  The information about company’s personnel is stored in the following table:
----Create table person(person_id int primary key, manager_id int null, name varchar(100)not null) The filed managed_id contains the person_id of the employee’s manager.
----Please write a query that would return the names of all top managers(an employee who does not have  a manger, and the number of people that report directly to this manager.

--Create table person(person_id int primary key, manager_id int, name varchar(100)not null)

--select dt.name, count(p2.manager_id) as number_reporting
--from 
--(select p.person_id, p.name
--from person as p
--where manager_id is null) as dt
--left join person as p2
--on dt.person_id = p2.manager_id
--group by dt.name

----4  List all events that can cause a trigger to be executed.

----5. Generate a destination schema in 3rd Normal Form.  Include all necessary fact, join, and dictionary tables, and all Primary and Foreign Key relationships.  The following assumptions can be made:
----a. Each Company can have one or more Divisions.
----b. Each record in the Company table represents a unique combination 
----c. Physical locations are associated with Divisions.
----d. Some Company Divisions are collocated at the same physical of Company Name and Division Name.
----e. Contacts can be associated with one or more divisions and the address, but are differentiated by suite/mail drop records.status of each association should be separately maintained and audited.

