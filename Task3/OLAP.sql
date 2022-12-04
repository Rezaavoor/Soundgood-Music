-- Show the number of lessons given per month during
-- a specified year (2023), seperated by lesson type

drop view if exists individual_l, group_l, ensemble_l;
drop table if exists months;

create temp table months(
	id serial PRIMARY KEY,
	month VARCHAR(20) NOT NULL
);
insert into months(month)values
 ('January'), ('February'), ('March'), 
 ('April'), ('May'), ('June'), ('July'),
 ('August'), ('September'), ('October'), ('November'), ('December');

create view individual_l as 
select month, count(month) as num from 
	(select il.time, extract( month from il.time) as month from individual_lesson as il
	where extract( year from il.time) = 2023) as monthss
group by month;

create view group_l as
select month, count(month) as num from 
	(select gl.time, extract( month from gl.time) as month from group_lesson as gl
	where extract( year from gl.time) = 2023) as monthss
group by month;

create view ensemble_l as
select month, count(month) as num from 
	(select el.time, extract( month from el.time) as month from ensemble as el
	where extract( year from el.time) = 2023) as monthss
group by month;

select 
	months.month,
	coalesce(individual_l.num, 0) as individual_lessons,
	coalesce(group_l.num, 0) as group_lessons,
	coalesce(ensemble_l.num, 0) as ensemble_lessons,
	coalesce(individual_l.num, 0) + 
	coalesce(group_l.num, 0) + 
	coalesce(ensemble_l.num, 0) as total
from individual_l 
full outer join group_l on individual_l.month = group_l.month
full outer join ensemble_l on individual_l.month = ensemble_l.month
right join months on 
individual_l.month = months.id or
group_l.month = months.id or
ensemble_l.month = months.id;