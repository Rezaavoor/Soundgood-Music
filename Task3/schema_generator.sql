drop view if exists individual_l, group_l, ensemble_l;

drop table if exists instrument,
student,
renting_instrument,
instrument_stock,
contact_person,
student_sibling,
availability,
instructor,
instructor_instrument,
individual_lesson,
group_lesson,
ensemble,
student_group_lesson,
student_ensemble,
level,
lesson_detail,
lesson_type,
genre,
months; --temp table


create table level(
	id serial PRIMARY KEY,
	value VARCHAR(80) NOT NULL
);

create table lesson_type(
	id serial PRIMARY KEY,
	type VARCHAR(80) NOT NULL
);

create table lesson_detail(
	id serial PRIMARY KEY,
	lesson_type_id INT NOT NULL REFERENCES lesson_type(id) ON DELETE SET NULL,
	level_id INT REFERENCES level(id) ON DELETE SET NULL,
	student_price INT NOT NULL,
	student_discount INT NOT NULL,
	instructor_payment_price INT NOT NULL
);

create table genre(
	id serial PRIMARY KEY,
	value VARCHAR(80) NOT NULL
);

create table instrument(
	id serial PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

create table student(
	id serial PRIMARY KEY,
	person_number VARCHAR(80) UNIQUE NOT NULL,
	first_name VARCHAR(80) NOT NULL,
	last_name VARCHAR(80) NOT NULL,
	phone_number VARCHAR(80),
	email VARCHAR(80),
	street VARCHAR(80),
	zip VARCHAR(80),
	city VARCHAR(80),
	max_number_of_renting_instruments INT NOT NULL
);

create table student_sibling(
	student_id INT NOT NULL REFERENCES student(id) ON DELETE CASCADE,
	sibling_id INT NOT NULL REFERENCES student(id) ON DELETE CASCADE,
	PRIMARY KEY(student_id, sibling_id)
);

create table contact_person(
	id serial PRIMARY KEY,
	student_id INT NOT NULL REFERENCES student(id) ON DELETE CASCADE,
	phone_number VARCHAR(80) NOT NULL,
	first_name VARCHAR(80),
	last_name VARCHAR(80)
);

create table instrument_stock(
	id serial PRIMARY KEY,
	type INT NOT NULL REFERENCES instrument(id) ON DELETE SET NULL,
	brand VARCHAR(80),
	renting_price INT NOT NULL
);

create table renting_instrument(
	id serial PRIMARY KEY,
	student_id INT NOT NULL REFERENCES student(id) ON DELETE SET NULL,
	instrument_stock_id INT REFERENCES instrument_stock(id) ON DELETE SET NULL,
	renting_start_time TIMESTAMP NOT NULL,
	max_renting_time_length INT NOT NULL
);

create table instructor(
	id serial PRIMARY KEY,
	person_number VARCHAR(80) UNIQUE NOT NULL,
	first_name VARCHAR(80) NOT NULL,
	last_name VARCHAR(80) NOT NULL,
	phone_number VARCHAR(80),
	email VARCHAR(80),
	street VARCHAR(80),
	zip VARCHAR(80),
	city VARCHAR(80),
	can_teach_ensemble BOOLEAN
);

create table availability(
	id serial PRIMARY KEY,
	instructor_id INT NOT NULL REFERENCES instructor(id) ON DELETE CASCADE,
	available_from TIMESTAMP NOT NULL,
	available_to TIMESTAMP NOT NULL
);

create table instructor_instrument(
	instructor_id INT NOT NULL REFERENCES instructor(id) ON DELETE CASCADE,
	instrument_id INT NOT NULL REFERENCES instrument(id) ON DELETE CASCADE,
	PRIMARY KEY(instructor_id, instrument_id)
);

create table individual_lesson(
	id serial PRIMARY KEY,
	instructor_id INT NOT NULL REFERENCES instructor(id) ON DELETE SET NULL,
	instrument_id INT NOT NULL REFERENCES instrument(id) ON DELETE SET NULL,
	student_id INT NOT NULL REFERENCES student(id) ON DELETE SET NULL,
	time TIMESTAMP NOT NULL,
	lesson_detail_id INT NOT NULL REFERENCES lesson_detail(id) ON DELETE SET NULL
);

create table group_lesson(
	id serial PRIMARY KEY,
	instrument_id INT NOT NULL REFERENCES instrument(id) ON DELETE SET NULL,
	instructor_id INT NOT NULL REFERENCES instructor(id) ON DELETE SET NULL,
	max_number_of_enrollment INT,
	min_number_of_enrollment INT,
	time TIMESTAMP NOT NULL,
	lesson_detail_id INT NOT NULL REFERENCES lesson_detail(id) ON DELETE SET NULL
);

create table ensemble(
	id serial PRIMARY KEY,
	instructor_id INT NOT NULL REFERENCES instructor(id) ON DELETE SET NULL,
	max_number_of_enrollment INT,
	min_number_of_enrollment INT,
	time TIMESTAMP NOT NULL,
	genre_id INT NOT NULL REFERENCES genre(id) ON DELETE SET NULL,
	lesson_detail_id INT NOT NULL REFERENCES lesson_detail(id) ON DELETE SET NULL
);

create table student_group_lesson(
	student_id INT NOT NULL REFERENCES student(id) ON DELETE CASCADE,
	group_lesson_id INT NOT NULL REFERENCES group_lesson(id) ON DELETE CASCADE,
	PRIMARY KEY(student_id, group_lesson_id)
);

create table student_ensemble(
	student_id INT NOT NULL REFERENCES student(id) ON DELETE CASCADE,
	ensemble_id INT NOT NULL REFERENCES ensemble(id) ON DELETE CASCADE,
	PRIMARY KEY(student_id, ensemble_id)
);