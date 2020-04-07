--1. of each employee: employee number, last name, first name, gender, and salary.

select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no;

--2. List employees who were hired in 1986.
select * from employees
where hire_date like '1985%';

--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.

select de.dept_id, d.name, de.emp_no, e.last_name, e.first_name, de.from_date, de.to_date
from dept_emp as de
inner join departments as d
on de.dept_id = d.id
inner join employees as e
on de.emp_no = e.emp_no;

--4. List the department of each employee with the following information: employee number, last name, 
--first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.name
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on d.id = de.dept_id;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees
where first_name = 'Hercules'
and last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.

select emp_no, last_name, first_name, 'Sales' as department
from employees
where emp_no in (
	select emp_no from dept_emp
	where dept_id in (
		select id from departments 
		where name = 'Sales'
)
);

--7. List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.name as "Department"
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on d.id = de.dept_id
where d.name in ('Sales', 'Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) 
from employees
group by last_name
order by count desc