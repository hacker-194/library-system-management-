-- project task

-- Task 1. Create a New Book Record -- '978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
insert into books(isbn,book_title,category,rental_price,status,author,publisher)
values ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
select * from books;

-- Task 2: Update an Existing Member's Address
update members
set member_adress ='123 tinkune'
where member_id = 'C101';
select * from members;

-- task 3: Delete the record with issued_id = 'IS121' from the issued_status table.
delete from issued_status 
where issued_id ='IS121';

-- Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
select * from issued_status
where issued_emp_id ='E101';

-- Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.
SELECT 
    issued_member_id,
    COUNT(issued_id) AS total_books_issued
FROM issued_status
GROUP BY issued_member_id
HAVING COUNT(issued_id) > 1;

-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**
create table  book_cnts
as select isbn, book_title, count(issued_id) 
from books
join issued_status
on issued_book_isbn = isbn
group by 1,2;

-- syntax of task 6
-- cretate table name
--as select required columns 
-- from table1
-- join table 2
-- on table1.common_columns = table2.common_columns
-- group by 1 ,2

-- Task 7. Retrieve All Books in a Specific Category:
select * from books
where category ='Classic';

-- Task 8: Find Total Rental Income by Category:
select category, sum(rental_price) , count(*)
from books as b
join issued_status as ist
on b.isbn = ist.issued_book_isbn
group by 1;


