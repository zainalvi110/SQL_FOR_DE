create table employe(
e_id int not null,
e_name varchar(20),
e_salary int,
e_age int,
e_gender varchar(20),
e_dept varchar(20),
primary key(e_id),
);
-----------
INSERT INTO employe VALUES (12,'ameen',55000,33,'male','cleaning'),
(11, 'aleena', 110000, 29, 'Female', 'Data'),
(10, 'ali', 20000, 18, 'male', 'Sales'),
(1, 'asif', 27000, 27, 'male', 'Hr'),
(20, 'raees', 44000, 35, 'male', 'Finance'),
(101, 'haider', 85000, 44, 'male', 'Medical'),
(22, 'zara', 44000, 19, 'Female', 'Media'),
(111, 'sukaina', 35000, 18, 'Female', 'Sales'),
(42, 'yousuf', 140000, 21, 'male', 'Data'),
(202, 'naila', 55000, 25, 'Female', 'Hr'),
(15, 'alvi', 120000, 27, 'male', 'Data');

---------------------
select * from employe;
select e_name from employe order by e_name
select distinct e_age from employe

select * from employe where e_age<=18
use sparta

select * from employe where e_dept='data' and e_gender='Male' and e_age=21

select * from employe where e_dept='sales'or e_dept='finance' 

select * from employe where not e_dept='data'
select * from employe where e_name like '%in'
select * from employe where e_age like '2_'

select * from employe where e_age between 25 and 35 ;
select min(e_salary)from employe
select max(e_age) from employe
select count(*)from employe where e_gender= 'Female' and e_dept='sales'
select sum(e_salary) as total_spent from employe
select avg(e_age) from employe

select '       spartaaaa'
select ltrim('       spartaaaa')
select 'i love ice cream'
select SUBSTRING('i love ice cream',12,5)

select * from employe order by e_salary

select top 3 * from employe order by e_salary desc


select avg(e_salary),e_gender from employe group by e_gender

select avg(e_age),e_dept  from employe group by e_dept order by avg(e_age)  desc 
select e_dept,avg(e_salary) as avg_salary
from employe group by e_dept
having avg(e_salary)>10000

-------------------INNER JOIN--------------
select * from employe
use sparta
create table departmnet( d_id int primary key,
d_name varchar(20),
d_location varchar(50))
	

insert into departmnet values(1,'sales','paksitan')
update departmnet set d_location= 'pakistan' where d_id =1
INSERT INTO departmnet VALUES(2, 'sales', 'azerbaijaan'),
(3, 'finance', 'UAE'),
(4, 'media', 'UAE'),
(5, 'Data', 'turkey'),
(6, 'medical', 'UAE'),
(7,'pressing','pakistan'),
(8,'kitchen','UAE');



select distinct  employe.e_name,employe.e_dept ,departmnet.d_name,departmnet.d_location from employe
inner join departmnet on employe.e_dept=departmnet.d_name


select distinct employe.e_name,employe.e_dept ,departmnet.d_name,departmnet.d_location from employe
left join departmnet on employe.e_dept=departmnet.d_name

select employe.e_name,employe.e_dept ,departmnet.d_name,departmnet.d_location from employe
right join departmnet on employe.e_dept=departmnet.d_name
order by e_dept 



select distinct employe.e_name,employe.e_dept ,departmnet.d_name,departmnet.d_location from employe
full join departmnet on employe.e_dept=departmnet.d_name


