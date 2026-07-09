-- 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher)
VALUES (
	'978-1-60129-456-2', 
	'To Kill a Mockingbird', 
	'Classic', 
	6.00, 
	'yes', 
	'Harper Lee', 
	'J.B. Lippincott & Co.');

-- 2. Update an Existing Member's Address to "125 Main St" -- Objective: Update the address of the member with member_id = 'C101' to '125 Main St'
UPDATE members 
SET member_address = '125 Main St' 
WHERE member_id = 'C101';

-- 3. Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table
DELETE FROM issued_status 
WHERE issued_id = 'IS121';

-- 4. Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'
SELECT * FROM issued_status 
WHERE issued_emp_id = 'E101';

-- 5. List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book
SELECT 
	issued_member_id, 
	COUNT(*) AS books_issued
FROM issued_status
GROUP BY issued_member_id
HAVING COUNT(*) > 1;

-- 6. Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt
CREATE TABLE book_issued_cnt AS
SELECT b.isbn, b.book_title, COUNT(ist.issued_book_isbn) AS issue_count
FROM books b
JOIN issued_status ist ON b.isbn = ist.issued_book_isbn
GROUP BY b.isbn;