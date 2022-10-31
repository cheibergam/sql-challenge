
-- *** A) Database creation and configuration ***

-- Step 1: Creating the database "Employee"

-- Step 2: Updating the DataStyle of the database to accept M/D/Y date format when converting from a string
ALTER DATABASE "Employee"
    SET "DateStyle" TO 'iso, mdy';

-- ATTENTION: A reconnection to the database might be required to load the DateStyle configuration

-- Step 3: Updating the DataStyle for the session and presenting the configuration of the DataStyle
SET DATESTYLE = "ISO, MDY";
SHOW DATESTYLE;


-- *** B) Create Database Schema / Tables ***

-- Step 1: Creating table "department". Primary key "dept_no" and no Foreign key
CREATE TABLE department (
    dept_no VARCHAR(5) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(30) NOT NULL
);

-- Step 2: Creating table "title". Primary key "title_id" and no Foreign key
CREATE TABLE title (
    title_id VARCHAR(5) PRIMARY KEY NOT NULL,
    title VARCHAR(30) NOT NULL
);

-- Step 3: Creating table "employee". Primary key "emp_no" and 1 Foreign key (title.title_id)
CREATE TABLE employee (
    emp_no INTEGER PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES title(title_id)
);

-- Step 4: Creating table "salary". 1 Foreign key (employee.emp_no)
CREATE TABLE salary (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);

-- Step 5: Creating table "dept_emp". 2 Foreign keys (employee.emp_no and department.dept_no)
CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(5) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
    FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

-- Step 6: Creating table "dept_manager". 2 Foreign keys (employee.emp_no and department.dept_no)
CREATE TABLE dept_manager (
    dept_no VARCHAR(5) NOT NULL,
    emp_no INTEGER NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES department(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);


-- *** C) Import / Load data from CSV files into the Database ***

-- Step 1: Import data for the "department" table: "departments.csv"

-- Step 2: Import data for the "title" table: "titles.csv"

-- Step 3: Import data for the "employee" table: "employees.csv"

-- Step 4: Import data for the "salary" table: "salaries.csv"

-- Step 5: Import data for the "dept_emp" table: "dept_emp.csv"

-- Step 6: Import data for the "dept_manager" table: "dept_manager.csv"


-- *** D) Checking the total of records imported from CSV files ***

SELECT COUNT (*) FROM department; -- This query should return 9
SELECT COUNT (*) FROM title; -- This query should return 7
SELECT COUNT (*) FROM employee; -- This query should return 300024
SELECT COUNT (*) FROM salary; -- This query should return 300024
SELECT COUNT (*) FROM dept_emp; -- This query should return 331603
SELECT COUNT (*) FROM dept_manager; -- This query should return 24
