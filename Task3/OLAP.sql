--------------------------------------------------------------------------------------
-- Show the number of lessons given per month during
-- 2023, seperated by lesson type.
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





--------------------------------------------------------------------------------------
-- Show how many students there are with no sibling, with one sibling, with two siblings, etc.
select * from
	(select count as num_of_siblings, count(*) from
		(select ss.student_id, count(*) from student_sibling as ss
		group by ss.student_id) as grouped
	group by count) as students_with_sibling
union
	(select 0 as num_of_siblings, count(*) from 
		student as s
		left join student_sibling as ss on s.id=ss.student_id
	where ss.student_id is null)
order by num_of_siblings;






--------------------------------------------------------------------------------------
-- List all instructors who has given more than 1 lessons during the current month.
select i.id, i.first_name as name, count(*) as num_of_lessons from
	(select * from
		(select instructor_id, time from individual_lesson
		union all
		select instructor_id, time from group_lesson
		union all
		select instructor_id, time from ensemble) as all_lessons
	where extract( month from time) = extract( month from current_date) 
	and extract( year from time) = extract( year from current_date)) as list
	join instructor as i on list.instructor_id=i.id
group by i.id, i.first_name
having count(*) > 1;





--------------------------------------------------------------------------------------
-- List all ensembles held during the next week, sorted by music genre and weekday.
select id, genre, weekday, max, min, count(*) as enrolled,
case 
	when count(*) >= max then 'full booked'
	when max-count(*) <= 2 then '1-2 seats left'
	else 'more seats left'
end status
	from
		(select 
			id, 
			(select value from genre where genre.id=genre_id) as genre,
			extract(isodow from time) as weekday,
			max_number_of_enrollment as max,
			min_number_of_enrollment as min
		from ensemble 
		join student_ensemble as se on ensemble.id=se.ensemble_id
		where extract( year from time) = extract( year from now())
		and extract( week from time) = extract( week from now()::timestamp(0) + interval '7 day')) as all_ensemble
	group by genre, weekday, max, min, id
	order by genre, weekday;