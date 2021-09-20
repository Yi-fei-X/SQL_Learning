create database database_design
go
use database_design
go

----1.	Design a Database for a company to Manage all its projects.
----Company has diverse offices in several countries, which manage and co-ordinate the project of that country.
----Head office has a unique name, city, country, address, phone number and name of the director.
----Every head office manages a set of projects with Project code, title, project starting and end date, assigned budget and name of the person in-charge. One project is formed by the set of operations that can affect to several cities.
----We want to know what actions are realized in each city storing its name, country and number of inhabitants.

create table country(country_id int primary key, country_name varchar(20))
create table city(city_id int primary key, city_name varchar(20), country_id int foreign key references country(country_id) on delete cascade)
create table employee(employee_id int primary key, employee_name varchar(20))
create table office(office_name varchar(20) primary key, city_id int foreign key references city(city_id), address varchar(20), phone int, director_id int foreign key references employee(employee_id) on delete set null)
create table project(project_id int primary key, title varchar(20), starting_date date, end_date date, budget int, person_id int foreign key references employee(employee_id) on delete set null, office_name varchar(20) foreign key references office(office_name) on delete cascade)
create table operation(operation_name varchar(20) primary key, city_id int foreign key references city(city_id) on delete set null, project_id int)

select * from country
select * from city
select * from employee
select * from office
select * from project
select * from operation



----2. Design a database for a lending company which manages lending among people (p2p lending)
----Lenders that lending money are registered with an Id, name and available amount of money for the financial operations. 
----Borrowers are identified by their id and the company registers their name and a risk value depending on their personal situation.
----When borrowers apply for a loan, a new loan code, the total amount, the refund deadline, the interest rate and its purpose are stored in database. 
----Lenders choose the amount they want to invest in each loan. A lender can contribute with different partial amounts to several loans.

create table lenders (lender_id int primary key, lender_name varchar(20), money int)
create table borrowers (borrower_id int primary key, borrower_name varchar(20), risk int)
create table loan (loan_id int primary key, money int, borrower_id int foreign key references borrowers(borrower_id), refund_ddl date, interest int, purpose varchar(20))
create table details(loan_id int foreign key references loan(loan_id), lender_id int foreign key references lenders(lender_id), invest int, primary key(loan_id, lender_id))

select * from lenders
select * from borrowers
select * from loan
select * from details


----3.	Design a database to maintain the menu of a restaurant.
----Each course has its name, a short description, photo and final price.
----Each course has categories characterized by their names, short description, name of the employee in-charge of them.
----Besides the courses some recipes are stored. They are formed by the name of their ingredients, the required amount, units of measurements and the current amount in the store.

create table category (category_id int primary key, category_name varchar(20) not null unique, category_description varchar(50), employee_id int not null)
create table course (course_id int primary key, course_name varchar(20) not null unique, course_description varchar(50), photo image, final_price decimal(6,2), category_id int foreign key references category(category_id) on delete set null)
create table ingredients(ingredients_id int primary key, ingredients_name varchar(20) not null unique, stock_amount int, stock_units varchar(20))
create table recipes (course_id int, ingredients_id int foreign key references ingredients(ingredients_id), amount int, units varchar(20), primary key(course_id, ingredients_id))

select * from category
select * from course
select * from recipes
select * from ingredients