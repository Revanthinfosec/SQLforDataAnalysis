create database if not exists salesDatawalmart;

create table if not exists sales (
	invoice_id varchar(30) not null primary key,
    branch varchar(5) not null,
    city varchar(30) not null,
    customer_type varchar(30) not null,
    gender varchar(10) not null,
    product_line varchar(100) not null,
    unit_price decimal not null,
    quantity int not null,
    VAT float not null,
    total decimal not null,
	date datetime not null,
	time time not null,
	payment_method varchar(15) not null,
	cogs decimal not null,
	gross_margin_pct float,
	gross_income decimal not null,
	rating float
);

select * from salesDatawalmart.sales;


-- feature engineering --
--   time_of_day 
SELECT time,
CASE
    WHEN TIME(time) BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
    WHEN TIME(time) BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
    ELSE 'Evening'
END AS time_of_day
FROM sales;

alter table sales add column time_of_day varchar(20);

update sales 
set time_of_day=(
CASE
    WHEN TIME(time) BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
    WHEN TIME(time) BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
    ELSE 'Evening'
END 
);
-- day name
ALTER TABLE sales DROP COLUMN time_of_day;

select date, DAYNAME(date) as day_name from sales;

ALTER TABLE sales RENAME COLUMN day_name TO new_day_name;
alter table sales rename column new_day_name to  day_name;

update sales set day_name = DAYNAME(date);
-- month name
select date, monthname(date) from sales;
alter table sales add column month_name varchar(10);

alter table sales add column day_name varchar(10);
update sales set month_name = MONTHNAME(date);
 select * from salesDatawalmart.sales;





-- above will push some error then we should use tghis below command as it will do disable the safe updates of the current session
SET SQL_SAFE_UPDATES = 0;
----------------------
-------------- Generic Question for this project -----------------------
-- findin the quique products, cities seperately in the table
select distinct product_line from sales;
select distinct city from sales;
select distinct branch from sales;
select distinct city, branch from sales;

-------- product quetions ----
select distinct product_line from sales;
-- finding the unique payments--
select payment_method, count(payment_method) as CNT from sales
group by payment_method order by CNT desc;
-- common selling product line --
select * from sales;
select product_line, count(product_line) as PRODUCT_COUNT from sales
group by product_line order by PRODUCT_COUNT desc;

-- total revenue by month
select month_name as month, sum(total) as total_sales
from sales 
group by month_name order by total_sales desc;
