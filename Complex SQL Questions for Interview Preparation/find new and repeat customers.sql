--	https://www.youtube.com/watch?v=MpAMjtvarrc&list=PLBTZqjSKn0IeKBQDjLmzisazhqQy4iGkb&index=2&ab_channel=AnkitBansal 


create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);
select * from customer_orders
insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)
;

select * from customer_orders;

with temp as (select order_date, 
customer_id,
case when order_date=min(order_date) over (partition by customer_id) then 1 else 0 end is_new_order 
from customer_orders
group by order_date,customer_id)
select order_date, sum(is_new_order) new_customer_cnt, count(1)-sum(is_new_order) repeated_cust_cnt 
from temp
group by order_date