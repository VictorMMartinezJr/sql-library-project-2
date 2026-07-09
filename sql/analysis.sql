--- INITAL ANALYSIS ---

-- Retrieve All Books in a Specific Category
SELECT * FROM books
WHERE category = 'Classic';

-- Find Total Rental Income by Category
SELECT 
 	b.category, 	
	SUM(b.rental_price) as rental_price,
	COUNT(*) as issued_amount,
	SUM(b.rental_price) * COUNT(*) AS total_income
FROM books b
JOIN issued_status ist ON ist.issued_book_isbn = b.isbn
GROUP BY category;

-- List Members Who Registered in the Last 180 Days
SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL '180 DAYS';

-- List Employees with Their Branch Manager's Name and their branch details
SELECT 
	emp1.*,
	b.*,
	emp2.emp_name AS manager
FROM employees emp1
JOIN branch b ON emp1.branch_id = b.branch_id
JOIN employees emp2 ON emp2.emp_id = b.manager_id;

-- Create a Table of Books with Rental Price Above $7
CREATE TABLE books_rental_price_greater_than_7 AS
SELECT * FROM books 
WHERE rental_price > 7;

-- Retrieve the List of Books Not Yet Returned
SELECT DISTINCT ist.issued_book_name 
FROM issued_status ist 
LEFT JOIN return_status rst ON rst.issued_id = ist.issued_id
WHERE rst.return_id IS NULL;