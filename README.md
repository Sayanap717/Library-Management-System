# Library Management System
This project is a Library Management System designed to keep track of all information about books, customers, employees, and library operations. The system uses a relational database to manage and retrieve information about books, their status, customers, and transactions (issue and return of books).

# Features
Branch Management : Store details about library branches such as branch number, manager, and contact information.
Employee Management: Store and manage employee data including their position, salary, and which branch they work at.
Book Management: Manage books available in the library including their ISBN, title, category, rental price, status (available or not), author, and publisher.
Customer Management: Manage customer details, including their unique ID, name, and address.
Issue Status: Track the books issued to customers, including issue date and book details.
Return Status: Track the return of books, including the return date and related book information.
Database Design
The database is named library and consists of the following tables:

# 1. Branch
Stores details about the branches of the library.

# Attribute	    Type	         Description
Branch_no	    INT	Primary key: Unique identifier for each branch
Manager_Id	    INT	              ID of the branch manager
Branch_address	TEXT	          Address of the branch
Contact_no	    VARCHAR	          Contact number of the branch

# 2. Employee
Stores information about the employees working in the library.

# Attribute	Type	         Description
Emp_Id	    INT	Primary key: Unique identifier for each employee
Emp_name	VARCHAR	         Name of the employee
Position	VARCHAR	         Position of the employee (e.g., Librarian)
Salary	    DECIMAL	         Salary of the employee
Branch_no	INT	Foreign key: References Branch_no in the Branch table

# 3. Books
Stores information about the books available in the library.

# Attribute	 Type	    Description
ISBN	     VARCHAR	Primary key: Unique identifier for each book
Book_title	 VARCHAR	Title of the book
Category	VARCHAR	    Category of the book (e.g., Fiction, Science)
Rental_Price DECIMAL	Rental price for the book
Status	     VARCHAR	Availability status (yes = available, no = not available)
Author	     VARCHAR	Author of the book
Publisher	 VARCHAR	Publisher of the book

# 4. Customer
Stores details about the customers who borrow books.

# Attribute	     Type	           Description
Customer_Id	     INT Primary key: Unique identifier for each customer
Customer_name    VARCHAR	      Name of the customer
Customer_address TEXT	          Address of the customer
Reg_date	     DATE	          Registration date of the customer

# 5. IssueStatus
Tracks the books issued to customers.

# Attribute	Type	Description
Issue_Id	 INT	Primary key: Unique identifier for the issue record
Issued_cust	 INT	Foreign key: References Customer_Id in the Customer table
Issued_book_ name	VARCHAR	Name of the book issued
Issue_date	 DATE	Date when the book was issued
ISBN_book	 VARCHAR	Foreign key: References ISBN in the Books table

# 6. ReturnStatus
Tracks the return of books by customers.

# Attribute	Type			Description
Return_Id	INT	Primary key: Unique identifier for the return record
Return_cust	INT	Foreign key: References Customer_Id in the Customer table
Return_book_name	VARCHAR	 Name of the book returned
Return_date	DATE	Date     when the book was returned
ISBN_book2	VARCHAR	Foreign key: References ISBN in the Books table
