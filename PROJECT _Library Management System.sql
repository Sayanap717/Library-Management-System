CREATE DATABASE LIBRARY;
USE LIBRARY;
CREATE TABLE Branch(
Branch_No INT PRIMARY KEY,
Manager_Id INT,
Branch_Address VARCHAR(255),
Contact_No INT
);

CREATE TABLE Employee (
Emp_Id INT PRIMARY KEY,
Emp_Name VARCHAR(100),
Position VARCHAR(50),
Salary DECIMAL(10, 2),
Branch_No INT,
FOREIGN KEY (Branch_No) REFERENCES Branch(Branch_No)
);

CREATE TABLE Books (
ISBN INT PRIMARY KEY,
Book_Title VARCHAR(255),
Category VARCHAR(100),
Rental_Price DECIMAL(10, 2),
Status VARCHAR(3) CHECK (Status IN ('Yes', 'No')) NOT NULL,
Author VARCHAR(100),
Publisher VARCHAR(100)
);

CREATE TABLE Customer (
Customer_Id INT PRIMARY KEY,
Customer_Name VARCHAR(100),
Customer_Address VARCHAR(255),
Reg_Date DATE
);

CREATE TABLE IssueStatus (
Issue_Id INT PRIMARY KEY,
Issued_Cust INT,
Issued_Book_Name VARCHAR(255),
Issue_Date DATE,
ISBN_Book INT,
FOREIGN KEY (Issued_Cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus 
(
Return_Id INT PRIMARY KEY,
Return_Cust INT,
Return_Book_Name VARCHAR(255),
Return_Date DATE,
ISBN_Book2 INT,
FOREIGN KEY (Return_Cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
INSERT INTO Branch(Branch_No, Manager_Id, Branch_Address, Contact_No)
VALUES 
    (1, 111, '123 Elm Street, New York, NY', 212555123),
    (2, 222, '456 Maple Avenue, Los Angeles, CA', 323555234),
    (3, 333, '789 Pine Road, Chicago, IL', 312555345),
    (4, 444, '321 Oak Street, Houston, TX', 713555456),
    (5, 555, '654 Cedar Avenue, Phoenix, AZ', 602555567);

INSERT INTO Employee (Emp_Id, Emp_Name, Position, Salary, Branch_No)
VALUES 
    (111, 'John Doe', 'Manager', 55000.00, 1),
    (202, 'Jane Smith', 'Assistant Manager', 45000.00, 2),
    (203, 'Michael Brown', 'Librarian', 40000.00, 3),
    (204, 'Emily Davis', 'Clerk', 35000.00, 4),
    (222, 'William Wilson', 'Manager', 56000.00, 5),
    (206, 'Alice Johnson', 'Senior Librarian', 50000.00, 3),
    (207, 'Bob Miller', 'Librarian', 42000.00, 3),
    (208, 'Charlie Taylor', 'Assistant Librarian', 40000.00, 3),
    (209, 'David Anderson', 'Clerk', 35000.00, 3),
    (210, 'Eve Martinez', 'Janitor', 30000.00, 3),
    (211, 'Michael Brown', 'Librarian', 42000.00, 2),
    (212, 'Emily Davis', 'Clerk', 36000.00, 2),
    (213, 'William Wilson', 'Janitor', 30000.00, 2),
    (214, 'Olivia Taylor', 'Assistant Librarian', 40000.00, 2),
    (215, 'James Anderson', 'IT Support', 45000.00, 2);
INSERT INTO Books (ISBN, Book_Title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
    (1001, 'The C Programming Language', 'Programming', 25.99, 'Yes', 'Brian W. Kernighan Dennis M. Ritchie', 'Prentice Hall'),
    (1002, 'Head First Java', 'Programming', 26.50, 'No', 'Kathy Sierra Bert Bates', 'O Reilly Media'),
    (1003, 'The Great Gatsby', 'Fiction', 3.75, 'Yes', 'F. Scott Fitzgerald', 'Scribner'),
    (1004, 'Introduction to Algorithms', 'Computer Science', 48.99, 'No', 'Thomas H. Cormen', 'MIT Press'),
    (1005, '1984', 'Dystopian', 4.25, 'Yes', 'George Orwell', 'Signet Classics'),
    (1006, 'The History of the Ancient World', 'History', 74.99, 'Yes', 'Susan Wise Bauer', 'W. W. Norton & Company'),
    (1007, 'Guns, Germs, and Steel', 'History', 16.50, 'No', 'Jared Diamond', 'W. W. Norton & Company'),
    (1008, 'The Silk Roads: A New History of the World', 'History', 22.25, 'Yes', 'Peter Frankopan', 'Vintage Books');

INSERT INTO Customer (Customer_Id, Customer_Name, Customer_Address, Reg_Date)
VALUES 
    (301, 'Alice Johnson', '789 Birch Lane, Seattle, WA', '2024-01-15'),
    (302, 'Bob Miller', '456 Oak Drive, Austin, TX', '2024-02-10'),
    (303, 'Charlie Taylor', '123 Pine Avenue, Boston, MA', '2024-03-05'),
    (304, 'David Anderson', '321 Elm Road, Denver, CO', '2024-04-01'),
    (305, 'Eve Martinez', '654 Cedar Street, Nashville, TN', '2024-05-12'),
    (306, 'EMMA MARIA', '432 SAND FRANCISCO, USA', '2020-01-15'),
    (307, 'TEKIE SEMAHAR', '775 JEBEL ALI, UAE', '2022-10-14'),
    (308, 'JOHN LUKKA', '22 BLUE BERRY ROAD, CO', '2021-10-14');
INSERT INTO IssueStatus (Issue_Id, Issued_Cust, Issued_Book_Name, Issue_Date, ISBN_Book)
VALUES 
    (401, 301, 'The C Programming Language', '2024-06-01', 1001),
    (402, 302, '1984', '2023-06-15', 1005),
    (403, 303, 'Head First Java', '2024-07-01', 1002),
    (404, 304, 'The Great Gatsby', '2023-06-10', 1003),
    (405, 305, 'Introduction to Algorithms', '2024-08-01', 1004);

INSERT INTO ReturnStatus (Return_Id, Return_Cust, Return_Book_Name, Return_Date, ISBN_Book2)
VALUES 
    (501, 301, 'The C Programming Language', '2024-06-20', 1001),
    (502, 302, '1984', '2024-06-25', 1005),
    (503, 303, 'Head First Java', '2024-07-15', 1002),
    (504, 304, 'The Great Gatsby', '2024-07-20', 1003),
    (505, 305, 'Introduction to Algorithms', '2024-08-15', 1004);

select Book_Title, category,Rental_Price from Books ;

select Salary,Emp_Name from employee order by salary desc;

select books.Book_Title ,customer.Customer_Name from issuestatus 
join books on issuestatus.ISBN_Book=books.ISBN
join customer on issuestatus.issued_Cust=customer.customer_id;

select Issued_Book_Name,Issued_Cust from issuestatus ;

select Category,count(Book_Title) from books group by Category;

select Emp_Name,Position from employee where Salary>50000;

select Customer_Name from customer where Reg_Date < "2022-01-01";

select Branch_No,count(*) as Total_Emp
from employee 
group by Branch_No;

select Issued_Cust from issuestatus where Issue_Date between "2023-06-01" and "2023-06-30";
select customer.Customer_Name
from customer INNER JOIN issuestatus
on customer.Customer_Id=issuestatus.Issued_Cust
where Issue_Date between "2023-06-01" and "2023-06-30";

select Book_Title from books where Category = "history";

select Branch_No,count(*) as count
from employee
group by Branch_No having count(*)>5;

select employee.Emp_Name ,branch.Branch_Address from employee inner join branch on employee.Emp_id=branch.Manager_Id;

select distinct Customer_Name from customer inner join issuestatus on customer.Customer_Id=issuestatus.Issued_Cust join books on issuestatus.ISBN_Book=books.isbn 
where books.Rental_Price>25;

