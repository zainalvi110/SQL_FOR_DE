use  ac;

select * from [dbo].[people]
select * from products 

select pr.Product, sr.Product ,Sales_person,Boxes,Date from products pr
join sales sr on pr.Product_ID = sr.Product
where pr.Product='Orange Choco'
select * from [dbo].[sales]
select pe.Sales_person,Location,team,Customers,Amount from people pe
join sales sa on pe.SP_ID=sa.Sales_Person
order by Amount desc

select Date,Amount,Boxes,p.Product,p.Size,p.Cost_per_Box from sales s
join products p on p.Product_ID=s.Product
where p.Category='Bars'

------------------- Left JOin---------------------------
select * from products
Insert into products values('P23','Choco Jello','Bites','SMALL',1.02)
Insert into products values('P24','Butter Pocs','Others','SMALL',2.16)
update products set Cost_per_Box=1.82 where Product='Choco Jello'


select s.Date,s.Sales_Person,p.Product,s.Product,p.Product_ID from products p
left join sales s on p.Product_ID= s.Product
where s.Product is null

select * from sales where FORMAT (date,'MMM yy') ='Feb 21'



select * from sales where Date ='2021-02-01'

select p.Product,p.Category,p.Product_ID,s.Date from sales s
join products p on s.Product=p.Product_ID
where s.Date >'2021-02-01'

with feb_sale as(
            select pr.Product,pr.Category,s.Amount,s.Date from products pr
           left join sales s on s.Product=pr.Product_ID and s.Date ='2021-02-01')

select  product,sum(amount)as total_sale,"SHIPMENT_STATUS"=
case when sum(amount)>0 then'Shipped'
else 'not shipped'
end
from feb_sale
group by product


