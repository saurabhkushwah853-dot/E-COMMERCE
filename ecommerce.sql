use ecommerce;
select*from ecommerce1;
select*from ecommerce2;

-- delete unknown column - ecommerce1 & ecommerce2
alter table ecommerce1 drop column myunknowncolumn;
alter table ecommerce2 drop column myunknowncolumn;

-- change data type string to date - ecommerce1 & ecommerce2
alter table ecommerce1 modify column transaction_date date;
alter table ecommerce2 modify column order_date date;

-- country  wise purchase amount in descending order - ecommerce1
select country, round(sum(purchase_amount), 2) as total_amount from ecommerce1 group by country order by total_amount desc;

-- product category wise purchase amount - ecommerce1
select product_category, round(sum(purchase_amount), 2) as total_amount from ecommerce1 group by product_category;

-- payment_method wise purchase_amount - ecommerce1
select payment_method, round(sum(purchase_amount), 2) as total_amount from ecommerce1 group by payment_method;

-- year wise purchase amount - ecommerce1
select year(transaction_date) as year, round(sum(purchase_amount),2) as total_amount from ecommerce1 group by year(transaction_date) order by year;

-- age and total purchase quantity wise purchase amount - ecommerce1
select 
	case 
		when age between 18 and 30 then '18-30'
        when age between 31 and 40 then '31-40'
        when age between 41 and 50 then '41-50'
        when age between 51 and 60 then '51-60'
        when age between 61 and 100 then '61-100'
	end as group_age, count(*) as total_customers, round(sum(purchase_amount), 2) as total_purchase
    from ecommerce1 where age between 18 and 100 group by group_age order by min(age);

-- Category wise Sales and Profit in descending order - ecommerce2
select category, round(sum(price), 2) as total_price, round(sum(total_amount), 2) as total_amount,
 round(sum(profit_margin), 2) as total_profit from ecommerce2 group by category order by total_price desc;
 
--  region wise sales and profit in descending order - ecommerce2
select region, round(sum(price), 2) as total_price, round(sum(total_amount), 2) as region_amount, round(sum(profit_margin), 2) as total_profit
from ecommerce2 group by region order by total_price desc;

-- gender wise sales and profit in descending order - ecommerce2
select customer_gender, round(sum(price), 2) as total_price, round(sum(total_amount), 2) as genderwise_amount, round(sum(profit_margin), 2)as total_profit 
from ecommerce2 group by customer_gender order by total_price desc;

-- category and gender wise sale in descending order - ecommerce2
select category, customer_gender, count(*) as total_purchase from ecommerce2 group by category, customer_gender order by customer_gender, total_purchase desc;

-- year and category wise sale - ecommerce2
select year(order_date) as year_date, category, round(sum(price), 2) as total_price from ecommerce2 group by year_date, category order by year_date; 

-- year and total quantity wise sale - ecommerce2
select year(order_date) as year_date, sum(quantity) as total_quatity, round(sum(price), 2) as total_price from ecommerce2 group by year_date order by year_date;

-- age and total customer wise sale and profit - ecommerce2
select 
	case
		when customer_age between 18 and 30 then'18-30'
        when customer_age between 31 and 40 then'31-40'
        when customer_age between 41 and 50 then'41-50'
        when customer_age between 51 and 60 then'51-60'
        when customer_age between 61 and 70 then'61-70'
        when customer_age between 71 and 100 then'71-100'
	end as age_group, count(*) as total_customer,
    round(sum(price), 2) as total_price, round(sum(total_amount), 2) as group_amount, round(sum(profit_margin), 2) as total_profit
    from ecommerce2 where customer_age between 18 and 100 group by age_group order by age_group;
    
-- Total returned and non-returned customers - ecommerce2
select returned, count(*) as total_customer from ecommerce2 group by returned;

-- Category-wise returned and non-returned customer count - ecommerce2
select returned, category, count(*) as total_customer from ecommerce2 group by returned, category;

-- region wise shipping cost in descending order - ecommerce2
select region, round(sum(shipping_cost), 2) as total_shipping from ecommerce2 group by region order by total_shipping desc;

-- category wise discount - ecommerce2
select category, round(sum(discount), 2) as total_discount from ecommerce2 group by category order by total_discount desc; 






    



     
     
     
    

select*from ecommerce1;

select*from ecommerce2;

	


