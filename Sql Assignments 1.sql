------------------------------------basic questions----------------------------------------

1) Create two Databases Name :- Brands , and  Products

Create database brands

Create database Products

2) Create two tables in SQL Server  name  as ITEMS_Table in Brands database and PRODUCT_Table in Products database.

use brands

create table Items_table

(Item_id int primary key,
Item_description varchar(100),
Vendor_nos bigint ,
Vendor_name varchar(100),
bottle_size bigint,
bottle_price money
)
3)  After Creating both the tables Add records in that tables (records are available above)done.


insert into Items_table(Item_id,Item_description,Vendor_nos,Vendor_name,bottle_size,bottle_price) values(1,'travis hasse apple pie',305,'MhwLtd',750,9.77)
insert into Items_table values(2,'Daristi Xtabentum',391,'Anchor Distilling(preiss imports',750,14.12)

-------values insterted through- right click on the item table edit top 200 rows----------


select* from Items_table

use Products

create table Products_table
(
Product_id int,
country varchar(100),
Product varchar(100),
Units_Sold decimal(12,0),
Manufacturing_price money,
Sale_Price money,
Gross_Sales money,
Sales money,
COGS money,
Profit money,
Sales_Date Date,
Month_number int,
Month_Name varchar(100),
Year_ INT,
)

3)  After Creating both the tables Add records in that tables (records are available above)done.

insert into Products_table values(1,'canada','carretera',1618.5,3,20,32370,32370,16185,16185,'2014-01-01',1,'January',2014)

---------values insterted through- right click on the item table edit top 200 rows----------

Select*from Products_table

-----------------------------------------------------------
4) Delete those product having the Units Sold 1618.5 , 888 and 2470.

Delete from Products_table 
where Units_Sold in (1619,888,2470)


--------------------------------------------------------------
5) DROP the table and Create it again.

drop table Products_table

-------------------------Itermidiate Questions-----------------------------------------------------------------
----big table-------------------------------------
1.Sum of Sale_price and Gross_sales

select SUM(Sale_price), SUM(Gross_Sales) from [dbo].[Products_table]

2. Highest Sales year


Select year_ from [dbo].[Products_table]
where sales=(select MAX(sales)from [dbo].[Products_table])

3.Product having the sales of $ 37,050.00

select product from [dbo].[Products_table]
where sales=37050

4.Countries lies between profit of $ 4,605 to $  22 , 662.00


select country from[dbo].[Products_table]

where profit between  4605 and 22662

5.Product Id having the sales of $ 24 , 700.00


select  product_id from [dbo].[Products_table]

where sales=24700

---------small table----------------------------------------
use brands
select * from [dbo].[Items_table]


1.item_description having the bottle size of 750

select item_description from Items_table
where bottle_size=750

2.vendor Name having the vendor_nos 305 , 380 , 391

select Vendor_name from Items_table
where Vendor_nos in( 305 , 380 ,391)

3.total Bottle_price 

select SUM(bottle_price) from Items_table

4.Primary Key to Item_id

have already made but if want to make

alter  table [dbo].[Items_table]
add primary key (item_id)

5.item id having the bottle_price of $ 5.06

select item_id from Items_table
where bottle_price=5.06



---------------------------------Advanced Questions---------------------------------------------
use brands


select *from [dbo].[Items_table]

select * from[dbo].[Products_table]

1) Apply INNER  , FULL OUTER , LEFT JOIN types on both the table 

INNER JOIN

Select *from[brands].[dbo].[Items_table] 
inner join
[Products] .[dbo].[Products_table] on[brands].[dbo].[Items_table].item_id=[Products] .[dbo].[Products_table].Product_id

select *from 
[brands].[dbo].[Items_table] as item
Full outer join
[Products].[dbo].[Products_table] as product on item. item_id = product.product_id



select *from 
[brands].[dbo].[Items_table] as item
left join
[Products].[dbo].[Products_table] as product on item. item_id = product.product_id

2) Apply  OUTER  ,  RIGHT JOIN , CROSS JOIN types  on both the table 

select *from 
[brands].[dbo].[Items_table] as item
outer join
[Products].[dbo].[Products_table] as product on item. item_id = product.product_id


select *from 
[brands].[dbo].[Items_table] as item
right join
[Products].[dbo].[Products_table] as product on item. item_id = product.product_id


select *from 
[brands].[dbo].[Items_table] as item
Cross join
[Products].[dbo].[Products_table] 


3) Find the item_description and Product having the gross sales of 13,320.00

Select *from[brands].[dbo].[Items_table] 
inner join
[Products] .[dbo].[Products_table] on[brands].[dbo].[Items_table].item_id=[Products] .[dbo].[Products_table].Product_id

where Gross_sales=13320

4) Combine the  bottle_price and profit Column and show total value of both the columns in a new temporary columns

select sum ([brands].[dbo].[Items_table].bottle_Price +[Products]. [dbo].[Products_table].profit) as Total_value
from [brands].[dbo].[Items_table].item_id
join 
[Products].[dbo].[Products_table].Product_id on [dbo].[Items_table].item_id=[dbo].[Products_table].product_id



use brands

use products

select *from [dbo].[Items_table]

select * from[dbo].[Products_table]

5)   Split the Item_description Column into Columns Item_desc1 and Item_desc2
item_description

SELECT 
    CASE WHEN CHARINDEX(' ', Item_description) > 0
         THEN SUBSTRING(Item_description, 1, CHARINDEX(' ', Item_description) - 1)
         ELSE Item_description
    END AS Item_desc1,
    CASE WHEN CHARINDEX(' ', Item_description) > 0
         THEN SUBSTRING(Item_description, CHARINDEX(' ', Item_description) + 1, LEN(Item_description))
         ELSE Item_description
    END AS Item_desc2
FROM [dbo].[Items_table]
