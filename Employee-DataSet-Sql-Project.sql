create database	Empployee;
use Empployee;

create table departments (
    department_id int primary key,
    department_name varchar(50)
);
select * from departments;

create table employees (
    employee_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    gender varchar(10),
    age int,
    hire_date date,
    department_id int,
    foreign key (department_id)
    references departments(department_id)
);
select * from employees;

create table salaries (
salary_id int primary key,
employee_id int,
salary decimal(10,2),
bonus decimal (10,2),
foreign key (employee_id)
references employees(employee_id)
);
select * from salaries;

create table performance (
performance_id int primary key,
employee_id int,
rating decimal(3,1),
review_year int,
foreign key (employee_id) 
references employees(employee_id)
);
select * from performance;

insert into departments values
(1,'HR'),
(2,'IT'),
(3,'Finance'),
(4,'Marketing');

insert into employees values
(101,'Rahul','Sharma','Male',28,'2022-01-15',2),
(102,'Priya','Patil','Female',26,'2021-08-10',1),
(103,'Amit','Joshi','Male',32,'2020-03-22',3),
(104,'Sneha','Kulkarni','Female',29,'2023-02-18',4);

insert into salaries values
(1,101,60000,5000),
(2,102,45000,3000),
(3,103,70000,8000),
(4,104,55000,4000);

insert into performance values
(1,101,4.5,2024),
(2,102,4.2,2024),
(3,103,4.8,2024),
(4,104,4.0,2024);

select e.first_name,e.last_name,d.department_name from employees e join departments d on e.department_id = d.department_id where d.department_name = 'IT';

select e.first_name,e.last_name,s.salary,s.bonus from employees e join salaries s on e.employee_id = s.employee_id;

select avg(salary) as average_salary from salaries;

select max(salary) as highest_salary from salaries;

select min(salary) as highest_salary from salaries;

select e.first_name,e.last_name,p.rating from employees e join performance p on e.employee_id = p.employee_id order by p.rating desc;

select e.employee_id,e.first_name,e.last_name,d.department_name,s.salary 
from employees e join salaries s on e.employee_id = s.employee_id 
join departments d on e.department_id = d.department_id order by s.salary desc limit 5;

select d.department_name, avg(s.salary) as avg_salary
from departments d join employees e on d.department_id = e.department_id
JOIN salaries s on e.employee_id = s.employee_id
group by d.department_name order by avg_salary desc limit 1;

select employee_id,first_name,last_name,hire_date 
from employees where hire_date >= DATE_SUB(CURDATE(), interval 2 year);

select d.department_name,count(e.employee_id) as total_employees,
min(s.salary) as minimum_salary,max(s.salary) as maximum_salary,
avg(s.salary) as average_salary from departments d join employees e
on d.department_id = e.department_id join salaries s 
on e.employee_id = s.employee_id group by d.department_name;

select e.employee_id,e.first_name,e.last_name,p.rating 
from employees e join performance p on e.employee_id = p.employee_id
where p.rating > 4.5 order by p.rating desc;

select sum(salary + bonus) as total_monthly_payroll from salaries;

select sum((salary + bonus) * 12) as total_annual_payroll from salaries;

select employee_id,first_name,last_name,hire_date,
timestampdiff(year, hire_date, CURDATE()) as years_worked
from employees where timestampdiff(year, hire_date, CURDATE()) >= 2;

select round(avg(timestampdiff(year, hire_date, CURDATE())),2) as average_tenure_years from employees;

select timestampdiff(year, hire_date, CURDATE()) as years_of_service,COUNT(*) as employee_count from employees
group by years_of_service order by years_of_service;

select e.employee_id,e.first_name,e.last_name,s.salary 
from employees e join salaries s on e.employee_id = s.employee_id 
where s.salary > (
    select avg(salary)
    from salaries
);
