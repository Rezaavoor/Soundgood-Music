drop table if exists instrument,
student,
renting_instrument,
contact_person,
student_payment,
student_sibling,
availability,
instructor,
instructor_instrument,
individual_lesson,
group_lesson,
ensemble,
student_group_lesson,
student_ensemble,
instructor_payment,
level,
month;

create table level(
	id serial PRIMARY KEY,
	value VARCHAR(80) NOT NULL
);

create table month(
	id serial PRIMARY KEY,
	value VARCHAR(80) NOT NULL
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
	max_number_of_rented_instruments INT NOT NULL
);

create table student_sibling(
	student_id INT,
	CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
	sibling_id INT,
	CONSTRAINT sibling_id FOREIGN KEY (sibling_id) REFERENCES student(id) ON DELETE CASCADE,
	PRIMARY KEY(student_id, sibling_id)
);

create table contact_person(
	id serial,
	student_id INT,
	CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
	PRIMARY KEY (id, student_id),
	phone_number VARCHAR(80) NOT NULL,
	first_name VARCHAR(80),
	last_name VARCHAR(80)
);

create table renting_instrument(
	id serial PRIMARY KEY,
	renting_start_time TIMESTAMP,
	brand VARCHAR(80),
	max_renting_time_length INT,
	student_id INT,
	CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE
	SET
		NULL,
		type VARCHAR(80) NOT NULL
);

create table student_payment(
	id serial,
	student_id INT,
	CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE
	SET
		NULL,
		PRIMARY KEY (id, student_id),
		month_id INT,
		CONSTRAINT month_id FOREIGN KEY (month_id) REFERENCES month(id) ON DELETE
	SET
		NULL,
		has_discount BOOLEAN NOT NULL,
		ensemble_price INT NOT NULL,
		individual_lesson_price INT NOT NULL,
		group_lesson_price INT NOT NULL,
		instrument_renting_price INT NOT NULL
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
	id serial,
	instructor_id INT,
	CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES instructor(id) ON DELETE CASCADE,
	PRIMARY KEY (id, instructor_id),
	available_from TIMESTAMP NOT NULL,
	available_to TIMESTAMP NOT NULL
);

create table instrument(
	id serial PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

create table instructor_instrument(
	instructor_id INT,
	CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES instructor(id) ON DELETE CASCADE,
	instrument_id INT,
	CONSTRAINT instrument_id FOREIGN KEY (instrument_id) REFERENCES instrument(id) ON DELETE CASCADE,
	PRIMARY KEY(instructor_id, instrument_id)
);

create table individual_lesson(
	id serial UNIQUE,
	instructor_id INT,
	CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES instructor(id) ON DELETE CASCADE,
	instrument_id INT,
	CONSTRAINT instrument_id FOREIGN KEY (instrument_id) REFERENCES instrument(id) ON DELETE CASCADE,
	student_id INT,
	CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
	PRIMARY KEY (id, instructor_id, instrument_id, student_id),
	time TIMESTAMP NOT NULL,
	level_id INT,
	CONSTRAINT level_id FOREIGN KEY (level_id) REFERENCES level(id) ON DELETE
	SET
		NULL
);

create table group_lesson(
	id serial UNIQUE,
	instrument_id INT,
	CONSTRAINT instrument_id FOREIGN KEY (instrument_id) REFERENCES instrument(id) ON DELETE CASCADE,
	instructor_id INT,
	CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES instructor(id) ON DELETE CASCADE,
	PRIMARY KEY(id, instrument_id, instructor_id),
	max_number_of_enrollment INT,
	min_number_of_enrollment INT,
	time TIMESTAMP NOT NULL,
	level_id INT,
	CONSTRAINT level_id FOREIGN KEY (level_id) REFERENCES level(id) ON DELETE
	SET
		NULL
);

create table ensemble(
	id serial UNIQUE,
	instructor_id INT,
	CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES instructor(id) ON DELETE CASCADE,
	PRIMARY KEY(id, instructor_id),
	max_number_of_enrollment INT,
	min_number_of_enrollment INT,
	time TIMESTAMP NOT NULL,
	genre VARCHAR(80)
);

create table student_group_lesson(
	student_id INT,
	CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
	group_lesson_id INT,
	CONSTRAINT group_lesson_id FOREIGN KEY (group_lesson_id) REFERENCES group_lesson(id) ON DELETE CASCADE,
	PRIMARY KEY(student_id, group_lesson_id)
);

create table student_ensemble(
	student_id INT,
	CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
	ensemble_id INT,
	CONSTRAINT ensemble_id FOREIGN KEY (ensemble_id) REFERENCES ensemble(id) ON DELETE CASCADE,
	PRIMARY KEY(student_id, ensemble_id)
);

create table instructor_payment(
	id serial,
	instructor_id INT,
	CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES instructor(id) ON DELETE
	SET
		NULL,
		PRIMARY KEY (id, instructor_id),
		month_id INT,
		CONSTRAINT month_id FOREIGN KEY (month_id) REFERENCES month(id) ON DELETE
	SET
		NULL,
		ensemble_price INT NOT NULL,
		individual_lesson_price INT NOT NULL,
		group_lesson_price INT NOT NULL
);