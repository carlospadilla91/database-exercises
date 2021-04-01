USE employees;

#TODO For example, to find all the unique titles within the company, we could run the following query:
SELECT DISTINCT title FROM titles;

#TODO List the first 10 distinct last name sorted in descending order. Your result should look like this:
SELECT DISTINCT last_name FROM employees ORDER BY last_name DESC LIMIT 10;

#TODO Create a query to get the top 5 salaries and display just the employees number from the salaries table. The employee number results should be:
SELECT emp_no FROM salaries ORDER BY salary DESC LIMIT 5;

#TODO Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the previous query to find the tenth page of results. The employee number results should be:
SELECT emp_no FROM salaries ORDER BY salary DESC LIMIT 5 OFFSET 45;

# https://www.petefreitag.com/item/451.cfm
#Suppose you want page 3 of your SQL result, in that case you want LIMIT 10 OFFSET 20, here is some psudo code to calculate the page:
# limit = 10;
# offset = (limit * pageNumber) - limit;
