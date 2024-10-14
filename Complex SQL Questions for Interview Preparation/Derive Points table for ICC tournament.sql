/*
	Video URL : https://www.youtube.com/watch?v=qyAgWL066Vo&list=PLBTZqjSKn0IeKBQDjLmzisazhqQy4iGkb&index=3&ab_channel=AnkitBansal
*/

--DDL
create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);

--DML
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

--Input Dataset
select * from icc_world_cup;

--Expected output
with all_team as(
select upper(trim(team_1)) team_name, case when upper(trim(team_1))= upper(trim(winner)) then 1 else 0 end is_winner  from icc_world_cup
union all
select upper(trim(team_2)) team_name, case when upper(trim(team_2))= upper(trim(winner)) then 1 else 0 end is_winner  from icc_world_cup)
select team_name, count(1) total_team_matches, sum(is_winner) team_match_win_cnt, count(1)-sum(is_winner) team_match_loose_cnt from all_team group by team_name