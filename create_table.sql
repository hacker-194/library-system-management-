-- create table branch
create table branch(
branch_id varchar(10) primary key,
manager_id varchar(10),
branch_adress varchar(30),
contact_no varchar(15)
);

-- create table employee
create table employees(
emp_id varchar(10) primary key,
emp_name varchar(30),
position varchar(30),
salary decimal(10,2),
branch_id varchar(10),
foreign key(branch_id) references branch(branch_id)
);

-- create table member
create table members(
member_id varchar(10) primary key,
member_name varchar(30),
member_adress varchar(30),
reg_date date 
);

-- create table books
create table books(
isbn varchar(50) primary key,
book_title varchar(80),
category varchar(80),
rental_price decimal(10,2),
status varchar(10),
author varchar(30),
publisher varchar(30)
);

-- create table issued_status 
create table issued_status(
issued_id varchar(10) primary key,
issued_member_id varchar(30),
issued_book_name varchar(80),
issued_date date ,
issued_book_isbn varchar(50),
issued_emp_id varchar(10),
foreign key(issued_member_id) references members(member_id),
foreign key(issued_emp_id) references employees(emp_id),
foreign key(issued_book_isbn) references books(isbn)
);

-- Create table "ReturnStatus"
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
(
            return_id VARCHAR(10) PRIMARY KEY,
            issued_id VARCHAR(30),
            return_book_name VARCHAR(80),
            return_date DATE,
            return_book_isbn VARCHAR(50),
            FOREIGN KEY (return_book_isbn) REFERENCES books(isbn)
);
--  link the file with this table throug the query
copy branch from 'D:\archive\branch.csv' delimiter ',' header csv; --copy thw path of your file 
copy employees from 'path of your file here' delimiter ',' header csv;
copy members from 'path of your file here' delimiter ',' header csv;
copy books from 'path of your file here' delimiter ',' header csv;
copy issued_status from 'path of your file here' delimiter ',' header csv;
copy return_status from 'path of your file here' delimiter ',' header csv;

