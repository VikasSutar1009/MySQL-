CREATE DATABASE Amazon;

USE Amazon;

select * from amazon;

--  max and min unit sold
select
	min(units_sold) as min_sold,
	max(units_sold) as max_sold
from amazon;

-- averages
select 
avg(unit_price) as avg_price 
from amazon;

-- sum
select
sum(units_sold) as total_sold
from amazon;

-- count
select 
count(*) as total_sold
from amazon;

-- filter
select * from amazon where customer_region = 'East';

select * from amazon where customer_region = 'West';

select * from amazon where customer_region = 'North';

select * from amazon where customer_region = 'South';

select * from amazon where customer_region = 'Central';

--  only Payment mode
select * from amazon where payment_mode = 'Credit Card';

select * from amazon where payment_mode = 'EMI';

select * from amazon where payment_mode = 'UPI';

select * from amazon where payment_mode = 'Debit Card';

select * from amazon where payment_mode = 'Net Banking';

-- Overall discount
SELECT AVG(discount_percent) as overovall_discount FROM amazon;

-- payment mode wise
select payment_mode, count(*) as unit_price from amazon group by payment_mode;

-- region wise payment mode
select distinct customer_region,payment_mode from amazon havingpayment_mode;