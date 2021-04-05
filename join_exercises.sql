use employees;

# TODO Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
select departments.dept_name as 'Department Name', concat(employees.first_name, ' ', employees.last_name) as 'Department Manager'
from employees
         join dept_manager on employees.emp_no = dept_manager.emp_no
         join departments on departments.dept_no = dept_manager.dept_no
where dept_manager.to_date > now()
order by departments.dept_name;

#TODO Find the name of all departments currently managed by women.
select departments.dept_name as 'Department Name', concat(employees.first_name, ' ', employees.last_name) as 'Department Manager'
from employees
         join dept_manager on employees.emp_no = dept_manager.emp_no
         join departments on departments.dept_no = dept_manager.dept_no
where dept_manager.to_date > now()
  and employees.gender = 'f'
order by departments.dept_name;

# TODO Find the current titles of employees currently working in the Customer Service department.
select titles.title, count(*) as Total
from departments
         join dept_emp on dept_emp.dept_no = departments.dept_no
         join titles on dept_emp.emp_no = titles.emp_no
where dept_emp.to_date > now()
  and titles.to_date > now()
  and departments.dept_name = 'Customer Service'
group by titles.title;

# TODO Find the current salary of all current managers.
select departments.dept_name as 'Department Name', concat(employees.first_name, ' ', employees.last_name) as 'Department Manager', salaries.salary as Salary
from employees
         join dept_manager on employees.emp_no = dept_manager.emp_no
         join departments on departments.dept_no = dept_manager.dept_no
         join salaries on salaries.emp_no = dept_manager.emp_no
where dept_manager.to_date > now()
  and salaries.to_date > now()
order by departments.dept_name;

# TODO Bonus Find the names of all current employees, their department name, and their current manager's name .
select concat(employees.first_name, ' ', employees.last_name) as Employee,
       departments.dept_name as Department,
       concat(e.first_name, ' ', e.last_name) as Manager
from employees
         join dept_emp on dept_emp.emp_no = employees.emp_no
         join departments on departments.dept_no = dept_emp.dept_no
        join dept_manager on dept_manager.dept_no = departments.dept_no
        join employees as e on e.emp_no = dept_manager.emp_no
where dept_emp.to_date > now()
  and dept_manager.to_date > now()
order by departments.dept_name;
