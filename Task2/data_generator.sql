insert into
  level(value)
values
  ('Beginner'),
  ('Intermediate'),
  ('Advanced');

insert into
  student(
    person_number,
    first_name,
    last_name,
    phone_number,
    email,
    city,
    street,
    zip,
    max_number_of_rented_instruments
  )
values
  (
    '199168809545',
    'Jessamine',
    'Ellis',
    '04 76 58 35 87',
    'nec.ligula.consectetuer@google.com',
    'Kharabali',
    '539-1739 Aliquam Street',
    '472978',
    2
  ),
  (
    '197268762448',
    'Cairo',
    'Mathis',
    '05 09 87 11 22',
    'ridiculus.mus@outlook.com',
    'Arequipa',
    'Ap #163-5581 Vitae, Street',
    '266185',
    2
  ),
  (
    '200890237098',
    'Sopoline',
    'Stephenson',
    '03 11 68 36 37',
    'nunc.sit@icloud.couk',
    'Körfez',
    '207-974 Sed, Avenue',
    '787147',
    2
  ),
  (
    '199347977617',
    'Grady',
    'Grant',
    '01 72 16 77 78',
    'purus@google.com',
    'Jaboatão dos Guararapes',
    'P.O. Box 596, 3333 Et Street',
    '86584',
    2
  ),
  (
    '198955984161',
    'Merritt',
    'Freeman',
    '02 72 42 45 53',
    'non.sapien@yahoo.org',
    'Ramillies',
    'P.O. Box 347, 5567 Scelerisque St.',
    '634134',
    2
  );

insert into
  instructor(
    person_number,
    first_name,
    last_name,
    phone_number,
    email,
    city,
    street,
    zip,
    can_teach_ensemble
  )
values
  (
    196400155148,
    'Samuel',
    'Roy',
    '03 15 23 60 22',
    'consequat.enim@yahoo.edu',
    'Yunnan',
    '879 Elit Road',
    '7222-5354',
    true
  ),
  (
    195872541844,
    'Hayes',
    'Reid',
    '08 23 32 53 37',
    'montes.nascetur@protonmail.couk',
    'Cork',
    'Ap #409-8149 Malesuada Avenue',
    '13263',
    true
  ),
  (
    195852427522,
    'Ashton',
    'Romero',
    '07 91 51 69 53',
    'vel.nisl.quisque@yahoo.couk',
    'Nieuwenrode',
    'Ap #539-6443 Gravida St.',
    '25753',
    false
  ),
  (
    198660308431,
    'Risa',
    'Short',
    '04 72 73 22 25',
    'orci.ut.semper@aol.couk',
    'Honolulu',
    'Ap #148-1947 Convallis Ave',
    '4222',
    true
  ),
  (
    195723041768,
    'Nyssa',
    'Morton',
    '08 57 39 36 52',
    'odio.phasellus@aol.edu',
    'Iguala',
    '870-5306 In Road',
    '4265',
    false
  );

insert into
  contact_person(
    student_id,
    first_name,
    last_name,
    phone_number
  )
values
  (4, 'Gareth', 'Salas', '08 17 72 99 77'),
  (5, 'Ali', 'Velez', '06 18 32 63 85'),
  (4, 'Samson', 'Wolf', '08 58 28 21 67'),
  (2, 'Reagan', 'Berg', '03 29 73 88 71'),
  (3, 'Laurel', 'Sparks', '05 64 84 18 13');

insert into
  renting_instrument(
    student_id,
    renting_start_time,
    type,
    brand,
    max_renting_time_length
  )
values
  (
    1,
    '2022-06-22 19:10:25-07',
    'Guitar',
    'Nisi LLP',
    12
  ),
  (
    1,
    '2022-10-08 17:35:25-07',
    'Violin',
    'Est Vitae Company',
    12
  ),
  (
    2,
    '2022-11-23 12:55:25-07',
    'Piano',
    'Faucibus Id Incorporated',
    12
  ),
  (
    2,
    '2022-11-23 12:55:25-07',
    'Guitar',
    'Ac Foundation',
    12
  ),
  (null, null, 'Guitar', 'Euismod Guitar', 12),
  (null, null, 'Guitar', 'Euismod Guitar', 12),
  (null, null, 'Guitar', 'Euismod Guitar', 12);

insert into
  student_sibling(student_id, sibling_id)
values
  (1, 2),
  (2, 1);

insert into
  availability(instructor_id, available_from, available_to)
values
  (
    1,
    '2022-06-22 19:10:25-07',
    '2022-12-22 19:10:25-07'
  ),
  (
    1,
    '2023-02-22 19:10:25-07',
    '2023-06-22 19:10:25-07'
  ),
  (
    1,
    '2023-08-22 19:10:25-07',
    '2023-11-22 19:10:25-07'
  ),
  (
    2,
    '2022-11-22 19:10:25-07',
    '2022-12-10 19:10:25-07'
  ),
  (
    3,
    '2000-06-22 19:10:25-07',
    '2050-06-22 19:10:25-07'
  ),
  (
    5,
    '2023-06-22 19:10:25-07',
    '2050-06-22 19:10:25-07'
  );

insert into
  instrument(name)
values
  ('Guitar'),
  ('Piano'),
  ('drums');

insert into
  instructor_instrument(instructor_id, instrument_id)
values
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 2),
  (3, 1),
  (4, 1),
  (5, 1);

insert into
  individual_lesson(
    student_id,
    instructor_id,
    instrument_id,
    time,
    level_id
  )
values
  (1, 1, 3, '2022-12-02 19:10:25-07', 1),
  (2, 5, 1, '2023-01-01 19:10:25-07', 3);

insert into
  group_lesson(
    instrument_id,
    instructor_id,
    max_number_of_enrollment,
    min_number_of_enrollment,
    time,
    level_id
  )
values
  (1, 2, 10, 3, '2022-11-28 19:10:25', 1);

insert into
  student_group_lesson(student_id, group_lesson_id)
values
  (1, 1),
  (2, 1),
  (3, 1);

insert into
  ensemble(
    instructor_id,
    max_number_of_enrollment,
    min_number_of_enrollment,
    time,
    genre
  )
values
  (1, 10, 2, '2022-12-15 19:10:25', 'rock');

insert into
  student_ensemble(student_id, ensemble_id)
values
  (3, 1),
  (4, 1);

insert into
  student_payment(
    student_id,
    has_discount,
    ensemble_price,
    individual_lesson_price,
    group_lesson_price,
    instrument_renting_price
  )
values
  (1, true, 55, 65, 75, 85),
  (2, true, 55, 65, 75, 85),
  (3, false, 55, 65, 75, 85),
  (4, false, 55, 65, 75, 85),
  (5, false, 55, 65, 75, 85);

insert into
  instructor_payment(
    instructor_id,
    ensemble_price,
    individual_lesson_price,
    group_lesson_price
  )
values
  (1, 555, 565, 575),
  (2, 555, 565, 575),
  (3, 555, 565, 575),
  (4, 555, 565, 575),
  (5, 555, 565, 575);