/*
	Video URL : https://www.youtube.com/watch?v=P6kNMyqKD0A&list=PLBTZqjSKn0IeKBQDjLmzisazhqQy4iGkb&index=3&ab_channel=AnkitBansal
*/

--DDL
create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

--DML
insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR');


--Input Dataset
select * from entries;

--Expected output
with 
resources_set as (select name, count(1) emp_visit_cnt, resources from entries group by name, resources),
agg_resources_set as (select name, sum(emp_visit_cnt) emp_visit_cnt, string_agg(resources,',') resources from resources_set group by name),
frequent_floor as (select name, floor, rank() over(partition by name order by count(1) desc ) floor_visiting_rank from entries group by name,floor)
select ar.name, ar.emp_visit_cnt, ff.floor, ar.resources from agg_resources_set ar inner join frequent_floor ff on ar.name=ff.name and ff.floor_visiting_rank=1