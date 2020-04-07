CREATE TABLE departments (
	id VARCHAR(5) NOT NULL,
	name VARCHAR(25),
	PRIMARY KEY (id)
);

CREATE TABLE  dept_emp (
	emp_no INT,
	dept_id VARCHAR(5),
	from_date VARCHAR(10),
	to_date VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_id) REFERENCES departments(id)
);

CREATE TABLE  dept_manager (
	dept_id VARCHAR(5),
	emp_no INT,
	from_date VARCHAR(10),
	to_date VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_id) REFERENCES departments(id)
);

CREATE TABLE  employees (
	emp_no INT NOT NULL,
	birth_date VARCHAR(10),
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR(3),
	hire_date VARCHAR(10),
	PRIMARY KEY (emp_no)
);

CREATE TABLE salaries (
	emp_no INT,
	salary INT,
	from_date VARCHAR(10),
	to_date VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE title (
	emp_no INT,
	title VARCHAR,
	from_date VARCHAR(10),
	to_date VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);