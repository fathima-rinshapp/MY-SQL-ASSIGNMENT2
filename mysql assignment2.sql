select * from employees;
select * from departments order by department_id asc;
select * from location  order by location_id asc;

-- a query to retrieve distinct salaries from the Employees table.
select distinct salary  from employees;

-- Provide aliases for the "age" and "salary" columns as "Employee_Age" and "Employee_Salary", respectively.
select age as  employees_age, salary as employee_salary from employees;

-- Retrieve employees with a salary greater than ₹50000 and hired before 2016-01-01.
select * from employees where salary >50000 and hire_date < "2016-01-01";

-- Finding the employee whose designation is missing and fill it with "Data Scientist".
select * from employees where   designation is null ;
set sql_safe_updates=0;
update employees set designation ="data scientist" where   designation is null;
set sql_safe_updates=1;

-- Find employees sorted by department ID in ascending order and salary in descending order.
select * from employees order by department_id asc ,salary desc;

-- Display the first 5 employees hired in the year 2018.
select * from employees where year(hire_date)="2018" order by hire_date asc limit 5;

-- Calculate the sum of all salaries in the Finance department.
select sum(salary) from employees where department_id=7;

-- Find the minimum age among all employees
select min(age) as minimum_age from employees;

-- List the maximum salary for each location.
select location_id,max(salary) as max_salary from employees group by location_id ;

-- Calculate the average salary for each designation containing the word 'Analyst'
select avg(salary)as average_salary,designation from employees where designation 
like "%analyst%" group by designation;

-- Find departments with less than 3 employees
select department_id,count(employee_id) as no_of_emp from employees
 group by department_id having no_of_emp<3 ; 
 
 --  Find locations with female employees whose average age is below 30
 select gender,location_id,avg(age) as avg_age from employees where gender="f" 
 group by location_id  having avg_age<30;
 
 -- inner join
 -- List employee names, their designations, and department names where employees are assigned to a department.
select emp.employee_name,emp.designation,dep.department_name from 
employees emp inner join departments dep
on emp.department_id=dep.department_id;

-- left join
-- List all departments along with the total number of employees in each department, including departments with no employees.
select dep.department_name,count(emp.employee_id) as no_of_emp from 
departments dep left join employees emp
on emp.department_id= dep.department_id  
group by dep.department_name;

-- right join
/* Display all locations along with the names of employees assigned to each
location. If no employees are assigned to a location, display NULL for
employee name*/
select l.location,e.employee_name from location l right join employees e 
on l.location_id=e.location_id;
