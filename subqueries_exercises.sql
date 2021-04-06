use employees;

# TODO Find all the employees with the same hire date as employee 101010 using a subquery.
# 69 Rows
select first_name, last_name
from employees
where hire_date in (
    select hire_date
    from employees
    where emp_no = 101010
    );

# TODO Find all the titles held by all employees with the first name Aamod.
select titles.title
from titles
where emp_no in (
    select emp_no
    from employees
    where first_name = 'Aamod'
    )
order by title;

# TODO Find all the current department managers that are female.
select first_name, last_name
from employees
where gender = 'f'
and emp_no in(
    select emp_no
    from dept_manager
    where to_date > now()
);

# TODO BONUS Find all the department names that currently have female managers.
select departments.dept_name
from departments
where dept_no in (
    select dm.dept_no
    from dept_manager dm
    join employees as e
    on dm.emp_no = e.emp_no
    where e.gender = 'f'
    and dm.to_date > now()
    );

# TODO BONUS Find the first and last name of the employee with the highest salary.
select first_name, last_name
from employees
where emp_no in (
    select emp_no
    from salaries
    where salary = (select max(salary) from salaries)
);

