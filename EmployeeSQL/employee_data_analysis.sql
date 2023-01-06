--Data Analysis for Employee_DB

select * from employees;
select * from salaries;

--List the employee number, last name, first name, sex, and salary of each employee.

select employees.emp_no
	  ,employees.last_name
	  ,employees.first_name
	  ,employees.sex
	  ,salaries.salary
from employees
left join salaries on employees.emp_no = salaries.emp_no
order by employees.last_name

--List the first name, last name, and hire date for the employees who were hired in 1986.
select employees.last_name
	, employees.first_name
	, employees.hire_date
	from employees
	where hire_date >= '01/01/1986'
		and hire_date <= '12/31/1986'
	order by employees.hire_date;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select * from dept_manager;
select * from dept_emp;
select * from departments;
select * from employees;
	   
select departments.dept_no
		, departments.dept_name
		, employees.emp_no
		, employees.last_name
		, employees.first_name
		from dept_manager
		inner join employees on dept_manager.emp_no = employees.emp_no
		inner join departments on dept_manager.dept_no = departments.dept_no;
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select departments.dept_no
		, employees.emp_no
		, employees.last_name
		, employees.first_name
		, departments.dept_name
		from employees
		join dept_emp on employees.emp_no = dept_emp.emp_no
		left join departments on departments.dept_no = dept_emp.dept_no
		order by employees.last_name;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select employees.first_name
		, employees.last_name
		, employees.sex
		from employees
		where employees.first_name = 'Hercules'
		and employees.last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
select employees.emp_no
		, employees.last_name
		, employees.first_name
		, dept_emp.dept_no
		, departments.dept_name
		from employees
		left join dept_emp  on employees.emp_no = dept_emp.emp_no
		left join departments on departments.dept_no = dept_emp.dept_no
		where departments.dept_name = 'Sales'
		order by employees.emp_no;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no
		, employees.last_name
		, employees.first_name
		, dept_emp.dept_no
		, departments.dept_name
		from employees
		left join dept_emp on employees.emp_no = dept_emp.emp_no
		left join departments on departments.dept_no = dept_emp.dept_no
		where departments.dept_name = 'Sales'
		or departments.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select employees.last_name, count(employees.last_name) as last_name_count
	from employees
	group by employees.last_name
	order by last_name_count desc;
