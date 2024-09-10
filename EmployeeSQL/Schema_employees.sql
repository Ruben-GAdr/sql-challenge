DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_empl;
DROP TABLE IF EXISTS dept_mng;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

--ºººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººº
CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY NOT NULL,
	title VARCHAR(30) NOT NULL
);

--ºººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººº
CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(50)
);

--ºººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººº
CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date VARCHAR(10) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

--ºººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººº
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--ºººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººº
CREATE TABLE dept_mng(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--ºººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººº
CREATE TABLE dept_empl(
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
