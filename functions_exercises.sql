USE employees;

#TODO Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column in your results.
SELECT concat(first_name, ' ', last_name) AS 'Full name' FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%e';

#TODO Find all employees born on Christmas — 842 rows.
SELECT * from employees where day(birth_date) = 25 and month(birth_date) = 12;

#TODO Find all employees hired in the 90s and born on Christmas — 362 rows.
select * from employees where year(hire_date) between 1990 and 1999 and day(birth_date) = 25 and month(birth_date) = 12;

#TODO Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.
select * from employees where year(hire_date) between 1990 and 1999 and day(birth_date) = 25 and month(birth_date) = 12 order by birth_date, hire_date desc;

#TODO For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You might also need to use now() or curdate()).
select *, DATEDIFF(now(), hire_date) as 'Days working at co' from employees where year(hire_date) between 1990 and 1999 and day(birth_date) = 25 and month(birth_date) = 12;


