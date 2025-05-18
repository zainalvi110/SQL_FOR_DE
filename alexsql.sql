DROP DATABASE IF EXISTS Parks_and_Recreation;
CREATE DATABASE	Parks_and_Recreation;
USE Parks_and_Recreation;






CREATE TABLE employee_demographics (
  employee_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE,
  PRIMARY KEY (employee_id)
);

CREATE TABLE employee_salary (
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);


INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1,'Leslie', 'Knope', 44, 'Female','1979-09-25'),
(3,'Tom', 'Haverford', 36, 'Male', '1987-03-04'),
(4, 'April', 'Ludgate', 29, 'Female', '1994-03-27'),
(5, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
(6, 'Donna', 'Meagle', 46, 'Female', '1977-07-30'),
(7, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
(9, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
(10, 'Andy', 'Dwyer', 34, 'Male', '1989-03-25'),
(11, 'Mark', 'Brendanawicz', 40, 'Male', '1983-06-14'),
(12, 'Craig', 'Middlebrooks', 37, 'Male', '1986-07-27');


INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000,1),
(2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000,1),
(3, 'Tom', 'Haverford', 'Entrepreneur', 50000,1),
(4, 'April', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000,1),
(5, 'Jerry', 'Gergich', 'Office Manager', 50000,1),
(6, 'Donna', 'Meagle', 'Office Manager', 60000,1),
(7, 'Ann', 'Perkins', 'Nurse', 55000,4),
(8, 'Chris', 'Traeger', 'City Manager', 90000,3),
(9, 'Ben', 'Wyatt', 'State Auditor', 70000,6),
(10, 'Andy', 'Dwyer', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Mark', 'Brendanawicz', 'City Planner', 57000, 3),
(12, 'Craig', 'Middlebrooks', 'Parks Director', 65000,1);



CREATE TABLE parks_departments (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);


INSERT INTO parks_departments (department_name)
VALUES
('Parks and Recreation'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),
('Finance');


select * from employee_demographics
select gender,avg(age),count(age) from employee_demographics
group by gender


select occupation from employee_salary group by occupation 


select * from employee_demographics order by gender desc,age


select gender,avg(age) as average_age from employee_demographics
 group by gender
 having avg(age)>40 
 
select * from employee_salary
 select occupation,avg(salary) as average_salary from employee_salary
 where occupation like '%manager%'
 group by occupation
 having avg(salary)>75000




 select * from employee_demographics as dem
 right join  employee_salary as sal
 on dem.employee_id=sal.employee_id


 select first_name,last_name,'old male emp'as label
 from employee_demographics 
 where age >40 and gender='male'
 union
 select first_name,last_name,'old female emp'as label
 from employee_demographics 
 where age >40 and gender='female'
 union
 select first_name,last_name,'high salary earner'
 from employee_salary
 where salary>70000
order by first_name,last_name 
 
 






 select first_name,SUBSTRING(first_name,2,4) as sub_string ,birth_date,SUBSTRING(birth_date,6,2) as birth_month from employee_demographics
 --- substring cant operate with date datatype in mysql server so we have functions to make our work easier just pass the date column in it and use date part and date month functions
 SELECT
    SUBSTRING(first_name, 2, 4) as sub_string,
	birth_date,e
   -- DATENAME(MONTH, birth_date) as birth_month_name
    -- or 
    DATEPART(MONTH, birth_date) as birth_month_number
FROM employee_demographics

select  first_name ,REPLACE(first_name,'mark','zain')from employee_demographics
select first_name,last_name,concat(first_name,' ',last_name) as full_name from employee_demographics


select  age,
 case 
 when age>=45 then'OLD'
 when age<=45 then 'YOUNG'

 end as age_status
 from employee_demographics


 select * ,
 case
 when salary <50000 then salary +(salary*1.05)
 when salary >50000 then salary +(salary*1.07)
 when dept_id=6 then salary +(salary*1.10)
end as incremented_salary
 from employee_salary

SELECT es.*, ed.*,
    CASE
        WHEN es.salary < 50000 THEN es.salary + (es.salary * 0.05)
        WHEN es.salary > 50000 THEN es.salary + (es.salary * 0.07)
        WHEN es.dept_id = 6 THEN es.salary + (es.salary * 0.10)
		when age> 50 then es.salary+(es.salary*1.15) 
	
        ELSE es.salary -- Adding an ELSE clause to handle any unmatched conditions
    END AS incremented_salary,
	case
	when ed.age>59 then 'as our old employee we have given you the loyalty bonus'
	when ed.age<59 then 'stick with us ,give your best for more perks.for now we have incremented your salaries'
	end as other_perks_status
FROM employee_salary es
 inner JOIN employee_demographics ed ON es.employee_id = ed.employee_id



 select * from employee_demographics where employee_id in
                                                    (select employee_id from employee_salary where dept_id=1)
 
 -----------------------------------------------------------------------*************-------------------------------
 --window functions
 ---over
 ---partition by


 select gender,avg(salary)over(partition by gender) as sum_of_salaries, avg(salary)over(partition by gender) as average_Salary from employee_demographics as dem
 join employee_salary as sal on dem.employee_id=sal.employee_id 

-----rolling total
 select dem.first_name,sal.last_name,gender,salary,sum(salary)over(partition by gender order by dem.employee_id) as rolling_total_sum_of_salaries from employee_demographics as dem
 join employee_salary as sal on dem.employee_id=sal.employee_id 


---ctes
with cte_example as(
select gender, avg(salary) as avg_salary,max(salary)as max_salary,min(salary)as min_salary,count(salary)as count_ofmandf from employee_demographics as ed inner join employee_salary
as sl on ed.employee_id=sl.employee_id
group by gender)
select max_salary from cte_example
----------------------temp table

create table #studenttemp(
 StudentID INT,
    StudentName NVARCHAR(100)
);


SELECT * 
INTO #salary_over_50k
FROM employee_salary
WHERE salary >= 50000;


