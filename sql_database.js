----- SQL DATABASE-----
1. CREATE DATABASE
	CREATE DATABASE databasename;
2. DROP DATABASE
	DROP DATABASE databasename;
3. CREATE TABLE 
	CREATE TABLE tablename;
4. DROP TABLE
	DROP TABLE tablename;
5. ALTER TABLE 
	ALTER TABLE table_name
	ADD column_name datatype;
6. NOT NULL
	CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

7. SQL UNIQUE Constraint: 
	The UNIQUE constraint ensures that all values in a column are different

	CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
8. SQL PRIMARY KEY
	CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);

9. SQL FOREIGN KEY Constraint
	CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

10. SQL CHECK:
	The CHECK constraint is used to limit the value range that can be placed in a column.

	CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);

11. SQL DEFAULT
	The DEFAULT constraint is used to set a default value for a column.

	CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

12. SQL INDEX :
	The CREATE INDEX statement is used to create indexes in tables.

	CREATE INDEX index_name
	ON table_name (column1, column2, ...);

13. SQL DATES
==>	MySQL comes with the following data types for storing a date or a date/time value in the database:

	DATE - format YYYY-MM-DD
	DATETIME - format: YYYY-MM-DD HH:MI:SS
	TIMESTAMP - format: YYYY-MM-DD HH:MI:SS
	YEAR - format YYYY or YY

==>	SQL Server comes with the following data types for storing a date or a date/time value in the database:

	DATE - format YYYY-MM-DD
	DATETIME - format: YYYY-MM-DD HH:MI:SS
	SMALLDATETIME - format: YYYY-MM-DD HH:MI:SS
	TIMESTAMP - format: a unique number

14. SQL VIEWS
	CREATE VIEW view_name AS
	SELECT column1, column2, ...
	FROM table_name
	WHERE condition;

15. SQL DATA types:
	INTEGER
	DECIMAL/NUMERIC
	FLOAT/DOUBLE
	CHAR
	VARCHAR
	DATE
	TIME
	DATETIME
	TIMESTAMP
	BOOLEAN
	BLOB (Binary Large Object

16. Join table : 

	- INNER JOIN
		The SQL INNER JOIN command joins two tables based on a common column and selects rows with matching values in those columns.

		ex: 
			SELECT Customers.customer_id, Customers.first_name, Orders.amount
			FROM Customers
			INNER JOIN Orders
			ON Customers.customer_id = Orders.customer;	

	- LEFT JOIN
		The SQL LEFT JOIN joins two tables based on a common column. It selects records that have matching values in these columns and the remaining rows from the left table.


		ex:
			SELECT Customers.customer_id, Customers.first_name, Orders.item
			FROM Customers
			LEFT JOIN Orders
			ON Customers.customer_id = Orders.customer_id;

	- RIGHT JOIN
		The SQL RIGHT JOIN statement joins two tables based on a common column. It selects records that have matching values in these columns and the remaining rows from the right table.

		ex:
			SELECT Customers.customer_id, Customers.first_name, Orders.item
			FROM Customers
			RIGHT JOIN Orders
			ON Customers.customer_id = Orders.customer_id;

	- FULL JOIN
		The SQL FULL OUTER JOIN statement joins two tables based on a common column. It selects records that have matching values in these columns and the remaining rows from both of the tables.

		ex:
			SELECT Customers.customer_id, Customers.first_name, Orders.item
			FROM Customers
			FULL OUTER JOIN Orders
			ON Customers.customer_id = Orders.customer_id;

17. SQL SUBQUERY
	In SQL, it's possible to place a SQL query inside another query. This inner query is known as a subquery.

	ex:
		SELECT first_name
		FROM Customers
		WHERE customer_id= (
			SELECT MAX(customer_id)
			FROM CUSTOMERS
		);




