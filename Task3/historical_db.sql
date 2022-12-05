drop view if exists student_v, individual_lesson_v, group_lesson_v, ensemble_v,
					student_ensemble_v, student_group_lesson_v, lesson_type_v, lesson_detail_v;
drop table if exists lesson, student;
CREATE extension if not exists dblink;


create table lesson(
	lesson_id int NOT NULL,
	student_id int NOT NULL REFERENCES student(id) ON DELETE,
	type varchar(80) NOT NULL,
	PRIMARY KEY(lesson_id, student_id, type),
	time timestamp NOT NULL,
	price int NOT NULL
);
create table student(
	id int unique primary key,
	first_name varchar(80),
	last_name varchar(80),
	phone_number varchar(80),
	email varchar(80),
	street varchar(80),
	zip varchar(80),
	city varchar(80)
);

create view lesson_detail_v as SELECT * 
FROM dblink('dbname=sgm','SELECT id, lesson_type_id, student_price
			FROM lesson_detail')
    AS lesson_detail(id int, lesson_type_id int, student_price int);	
	
	
create view lesson_type_v as SELECT * 
FROM dblink('dbname=sgm','SELECT id, type
			FROM lesson_type')
    AS lesson_type(id int, type varchar(80));
	


create view student_v as SELECT *
FROM dblink('dbname=sgm','SELECT id, first_name, last_name,
			phone_number, email, street, zip, city FROM student')
    AS student(id int, first_name varchar(80), last_name varchar(80), 
			   phone_number varchar(80), email varchar(80), 
			   street varchar(80), zip varchar(80), city varchar(80));

insert into student select * from student_v;


create view individual_lesson_v as SELECT * 
FROM dblink('dbname=sgm','SELECT id, student_id, 
			time, lesson_detail_id
			FROM individual_lesson')
    AS individual_lesson(id int, student_id int, time timestamp, lesson_detail_id int);


insert into lesson 
	(select il.id as lesson_id, student_id, type, time, student_price as price from individual_lesson_v as il
	 join lesson_detail_v as ld on il.lesson_detail_id=ld.id
	 join lesson_type_v as lt on ld.lesson_type_id=lt.id);


create view student_ensemble_v as SELECT * 
FROM dblink('dbname=sgm','SELECT student_id, ensemble_id
			FROM student_ensemble')
    AS student_ensemble(student_id int, ensemble_id int);
	

create view student_group_lesson_v as SELECT * 
FROM dblink('dbname=sgm','SELECT student_id, group_lesson_id
			FROM student_group_lesson')
    AS student_group_lesson(student_id int, group_lesson_id int);


create view group_lesson_v as SELECT * 
FROM dblink('dbname=sgm','SELECT id, time, lesson_detail_id
			FROM group_lesson')
    AS group_lesson(id int, time timestamp, lesson_detail_id int);
	

create view ensemble_v as SELECT * 
FROM dblink('dbname=sgm','SELECT id, time, lesson_detail_id
			FROM ensemble')
    AS ensemble(id int, time timestamp, lesson_detail_id int);
	
insert into lesson 
	(select el.id as lesson_id, student_id, type, time, student_price as price
	from student_ensemble_v as se
	join ensemble_v as el on el.id=se.ensemble_id
	join student_v as s on s.id=se.ensemble_id
	join lesson_detail_v as ld on el.lesson_detail_id=ld.id
	join lesson_type_v as lt on ld.lesson_type_id=lt.id); 
	

insert into lesson
	(select gl.id as lesson_id, student_id, type, time, student_price as price
	from student_group_lesson_v as sg
	join group_lesson_v as gl on gl.id=sg.group_lesson_id
	join student_v as s on s.id=sg.group_lesson_id
	join lesson_detail_v as ld on gl.lesson_detail_id=ld.id
	join lesson_type_v as lt on ld.lesson_type_id=lt.id);