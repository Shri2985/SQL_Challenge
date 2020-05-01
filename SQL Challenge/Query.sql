
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select 
a.employee_number,last_name,first_name,sex,salary
from employee a  inner join  salary b
on a.employee_number=b.employee_number
;

--2. List first name, last name, and hire date for employees who were hired in 1986.

select 
a.employee_number,last_name,first_name,hier_date
from employee a  
where extract(year from hier_date)=1986
;
--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.

select 
a.dept_number,dept_name,a.employee_number as Manager_employee_number,last_name,first_name
from 
department_manager a 
inner join employee b on  a.employee_number=b.employee_number
inner join department c on c.dept_number=a.dept_number
;
--4.List the department of each employee with the following information: 
---employee number, last name, first name, and department name.

select 
a.employee_number ,last_name,first_name,b.dept_number,dept_name
from 
 employee a 
inner join department_employee b on  a.employee_number=b.employee_number
inner join department c on c.dept_number=b.dept_number
;
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select 
a.employee_number,last_name,first_name,sex
from employee a  
where first_name='Hercules'
and last_name like'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name

select 
a.employee_number ,last_name,first_name,dept_name
from 
 employee a 
inner join department_employee b on  a.employee_number=b.employee_number
inner join department c on c.dept_number=b.dept_number
where c.dept_number='d007';

--7.List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

select 
a.employee_number ,last_name,first_name,dept_name
from 
 employee a 
inner join department_employee b on  a.employee_number=b.employee_number
inner join department c on c.dept_number=b.dept_number
where c.dept_number in('d007','d005')
;

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
select 
a.last_name,count(*)
from employee a  
group by 1
order by 2 desc;
;