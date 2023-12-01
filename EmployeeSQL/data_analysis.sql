-- Data Analysis 
-- List the employee number, last name, first name, sex, and salary of each employee.

Select s.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e 
inner join salaries as s
on s.emp_no = e.emp_no
order by s.emp_no; 


-- List the first name, last name, and hire date for the employees who were hired in 1986.

select e.first_name, e.last_name, e.hire_date
from employees as e
where date_part('year', e.hire_date)=1986; 


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

select dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from dept_manager as dm 
inner join departments as d 
on dm.dept_no = d.dept_no
inner join employees as e 
on dm.emp_no = e.emp_no;


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name

select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de 
inner join departments as d 
on de.dept_no = d.dept_no
inner join employees as e 
on de.emp_no = e.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select first_name, last_name, sex 
from employees
where first_name = 'Hercules' 
and last_name like 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de 
inner join departments as d 
on de.dept_no = d.dept_no
inner join employees as e 
on de.emp_no = e.emp_no
where d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de 
inner join departments as d 
on de.dept_no = d.dept_no
inner join employees as e 
on de.emp_no = e.emp_no
where d.dept_name in ('Sales','Development');


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;