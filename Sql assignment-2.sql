Q1) Create   Database Name as Order_Stores_Data 


create database order_Stores_data

Q2) Create two Table names as Orders_Table and Stores_Table

create table orders_table
(
OrderDate date	,
Region varchar(100),
Rep	varchar(100),
Order_Item varchar(100),
Units int,	
Unit_Cost money,
Total_Price money,
Order_Id int
)

select*from orders_table


create table Stores_Table
(
Store_Id int,	
Store_Type varchar(100),
Assortment int,
Competition_Distance bigint,
Month int,
Year int,
Promo_Interval varchar(100)
)

select * from Stores_Table

Q3) Insert All records present here in the Orders_table and Stores_Table.

orders_table

insert into orders_table values('1-6-21','East','Aruna','Pencil',95, 1.99, 189.05 ,1)
insert into orders_table values('1-23-21','Central','Kivell	','Eraser',	50, 19.99, 999.50 ,2)
insert into orders_table values('2-9-21','Central','Ganesh'	,'',36, 4.99 ,179.64 ,	3)
insert into orders_table values('2-26-21','	Central','Payal','',27,19.99, 539.73, 4)
insert into orders_table values('3-15-21','	West','Sorvino','',56, 2.99, 	167.44, 5)
insert into orders_table values('4-1-21','East','Hitesh','Pencil',60, 4.99, 299.40, 6)
insert into orders_table values('4-18-21'	,'Central','Akshita	','',75	, 1.99 ,149.25 ,7)
insert into orders_table values('5-5-21','Central',	'Ruchika',	'Books',90, 4.99,449.10, 8)
insert into orders_table values('5-22-21','West','Surbhi','',32,1.99 ,63.68 ,9)
insert into orders_table values('6-8-21','East','Jones','Suitcase',60, 8.99 , 539.40, 10)


stores_table

insert into Stores_Table values(1,'c',20, 1270 , 9 , 2008 ,'Jan')

insert into Stores_Table values(2,'a', 36 , 570 , 11 , 2007 ,'Feb')

insert into Stores_Table values(3,'a',22 , 14130 , 12,2006,'Mar')

insert into Stores_Table values(4,'c', 17 , 620, 9 ,	2009,'')	

insert into Stores_Table values(5,'a', 21 , 29910 ,	4,2015,'May')

insert into Stores_Table values(6,'a',22 , 310 , 12 , 2013 ,'June')

insert into Stores_Table values(7,'a',27 , 24000 ,4,2013,'')	

insert into Stores_Table values(8,'a',	42,	7520,10,2014,'Aug')

insert into Stores_Table values(9,	'a',	41,2030,8,2000,'')	

insert into Stores_Table values(10,	'a',35,	3160,9,	2009,'Oct')


Q3) Make Order_Id  Column as Primary Key.

alter table orders_table
alter column order_id int not null;


alter table orders_table
add primary key(order_id);


Q4) Add one Column Name  as Store_Names and insert the records given above in Stores table.


alter table [dbo].[Stores_Table]
add store_name varchar(100);

select *from Stores_Table

update Stores_Table
set store_name=
case
when Your_condition 1 then 'Car'
when Your_condition 2  then 'bikes'
when Your_condition 3 then 'hardware'
when Your_condition 4 then 'Electrics'
when Your_condition 5 then 'Fibers'
when Your_condition 6 then 'Elastics'
when Your_condition 7 then 'books'
when Your_condition 8 then 'shoes'
when Your_condition 9 then 'Cloths'
when Your_condition 10 then'Scraps'
end;




Q5) Make Stored_Id as a Foreign Key with reference too Orders_Table 

alter table stores_table
add foreign key ( store_id) references Orders_table

select *from orders_table
select*from Stores_Table


Q6) Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet

update orders_table
set Order_Item='pencil'
where Order_Item='';



Q7) Update the missing records in the PromoInterval Column in Stores Table.

select*from Stores_Table


update Stores_Table
set Promo_Interval='april'
where Store_Id=4 and (Promo_Interval='');

update Stores_Table
set Promo_Interval='july'
where Store_Id=7 and (Promo_Interval='');

update Stores_Table
set Promo_Interval='sept'
where Store_Id=9 and (Promo_Interval='');


Q8) Rename the column name  of Assortment to Store_Nos in Stores_Table.

sp_rename 'stores_table.Assortment','Store_nos'

Q9) Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table.

sp_rename 'orders_table.Order_item','Item_name'

sp_rename 'orders_table.rep','Customers_name'


Q10) Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order

select *from orders_table

select*from
orders_table
order by unit_cost desc , total_price asc;


select*from
orders_table
order by total_price asc;


Q11) Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region.

select*from orders_table

sp_rename 'orders_table.customers_name','Cus_name'


select*from orders_table

select Region, count(Cus_name)as Customer_region
from orders_table
group by region

Q12) Find the sum of Total_Price Column and Unit Cost  in Orders_Table 


select SUM(Total_price) as sum_total_price, SUM(Unit_cost) as sum_unit_price from [dbo].[orders_table]


Q13) Show me OrderDate  , Unit Cost  , StoreType and Year in One table and names that table as Order_Stores_Table.


select*from orders_table

select * from stores_table

select
orders_table.orderDate,
orders_table.unit_cost,
stores_table.store_type,
stores_table.year
into Order_Stores_Table
from orders_table
join
Stores_table
on orders_table.order_id=stores_table.store_id;

select*from [dbo].[Order_Stores_Table]

Q14)  Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9


Select item_name,region
from[dbo].[orders_table]
where order_id in (4,5,6,9)

Q15) Show me year  whose ComptetitionDistance is 29910  , 310 , 3160


select* from stores_table

Select year
from[dbo].[Stores_Table]
where competition_Distance  in (29910,310,3160)

Q16)  Give me that Item_name whose  Total_Price is greater than 200 and less than 400

select*from orders_table


select item_name
from [dbo].[orders_table]
where Total_price between 200 and 400

Q17) Rename the CompetitionDistance as CD and find the total CD in Stores_Table.

sp_rename 'stores_table.competition_distance','CD'

select sum(cd) as Total_CD from[dbo].[Stores_Table]

Q18) What is the Total Count of Stores_Type and CD columns

select count(Store_type) as Total_store, count(CD) as total_cd from stores_table

Q19) Apply the Cross Join in  Orders_Table and Stores_Table.


Select *from
orders_table
cross join
Stores_table

Q20) DROP both the databases

drop database [order_Stores_data]









