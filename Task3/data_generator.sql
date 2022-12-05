insert into
  level(value)
values
  ('Beginner'),
  ('Intermediate'),
  ('Advanced');

insert into
  lesson_type(type)
values
  ('Individual Lesson'),
  ('Group Lesson'),
  ('Ensemble');

insert into
  lesson_detail(lesson_type_id, level_id, student_price, student_discount, instructor_payment_price)
values
  (1, 1, 100, 15, 50),
  (1, 2, 120, 15, 60),
  (1, 3, 140, 15, 70),
  (2, 1, 50, 15, 40),
  (2, 2, 60, 15, 50),
  (2, 3, 70, 15, 60),
  (3, null, 50, 15, 40);

insert into
  genre(value)
values
  ('Punk Rock'),
  ('Rock'),
  ('Gospel Band');

insert into
  instrument(name)
values
  ('Guitar'),
  ('Piano'),
  ('Drums'),
  ('Violin');

insert into student (person_number,first_name,last_name,phone_number,email,city,street,zip,max_number_of_renting_instruments)
values
  ('200612130050','Kelsie','Schroeder',98724734896,'dolor.fusce@aol.ca','Gävle','697-8565 Porttitor Rd.','58606',2),
  ('201004140819','Ralph','Patton',98714676380,'ipsum.suspendisse.non@aol.ca','Finspång','2692 Purus. St.','82956',2),
  ('201306061301','Claudia','Mayo',98746254976,'fringilla.ornare@icloud.org','Bollnäs','Ap #780-2362 Sed Ave','20125',2),
  ('202004071745','Duncan','Neal',98723439841,'blandit.at.nisi@icloud.org','Lidingo','Ap #984-7452 Lorem, Rd.','70548',2),
  ('197902090815','Jesse','Aguilar',98737865795,'consectetuer.rhoncus@outlook.ca','Åkersberga','465-7314 Dui. Street','71655',2),
  ('197108220856','Leilani','Parker',98767608785,'nunc.quis@icloud.couk','Linköping','P.O. Box 900, 3538 Risus. Av.','61566',2),
  ('197412270544','Dustin','Richmond',98767931955,'magna.lorem.ipsum@outlook.com','Täby','P.O. Box 717, 9419 Donec Road','49412',2),
  ('199710010842','Genevieve','Weiss',98725421696,'auctor.velit.eget@google.com','Vänersborg','9646 Laoreet St.','84437',2),
  ('198804012101','Azalia','Tran',98726939078,'ut@google.org','Motala','613-7743 Taciti Rd.','70526',2),
  ('200410072303','Jaden','Dunn',98786144894,'consectetuer@aol.couk','Gävle','170-8255 Nisi Road','18946',2),
  ('198312100219','Shaeleigh','Hayden',98755576065,'duis.volutpat.nunc@icloud.edu','Mjölby','1236 Penatibus St.','03075',2),
  ('197503080631','Rama','Baldwin',98761207442,'aenean.gravida@icloud.org','Trollhättan','Ap #290-6018 Eget, St.','37153',2),
  ('200509140248','Tanek','Stein',98701565079,'varius.nam.porttitor@outlook.org','Bollnäs','P.O. Box 210, 3941 Ornare, St.','39323',2),
  ('200411060131','Helen','Jennings',98741076229,'sed.dictum.eleifend@outlook.com','Trollhättan','835-6380 Lectus, St.','26283',2),
  ('199304082002','Sean','Salazar',98779042506,'ultricies@yahoo.com','Avesta','840-506 Ad St.','71468',2),
  ('198403201142','Bell','Wolf',98736403505,'ut.erat@protonmail.net','Alingsås','3684 Sollicitudin Road','71740',2),
  ('197802011525','Vance','Abbott',98703466360,'metus.aliquam@yahoo.edu','Märsta','Ap #987-5925 Ullamcorper Ave','33497',2),
  ('198108011705','Indira','Rollins',98714276187,'nulla.ante@icloud.edu','Stockholm','545-8454 Quisque Avenue','16653',2),
  ('199001230246','Mark','Knight',98794509694,'mi.eleifend@google.couk','Tranås','5360 Tempor, Rd.','89459',2),
  ('200201112257','Nina','Perry',98728254789,'mauris@yahoo.ca','Värnamo','P.O. Box 912, 3163 Amet, St.','07522',2),
  ('200007310030','Diana','Dudley',98752413069,'in.consequat.enim@hotmail.ca','Mjölby','6784 Augue St.','64092',2),
  ('199907231711','Linus','Olson',98752318467,'erat@icloud.ca','Märsta','3853 Cursus. Rd.','82552',2),
  ('197505311116','Melvin','Franklin',98780094746,'magnis.dis@hotmail.com','Jönköping','Ap #129-2417 Auctor Street','62132',2),
  ('201207261749','Donovan','Mccormick',98776735096,'lacus.quisque.imperdiet@outlook.edu','Borås','Ap #314-1882 Eu St.','63158',2),
  ('201505190243','Carol','Mcmillan',98744954975,'at.risus@outlook.couk','Upplands Väsby','5833 Faucibus Av.','72156',2),
  ('199203130524','Rae','Walls',98755131608,'faucibus@aol.ca','Märsta','P.O. Box 181, 8792 Tortor. Ave','54246',2),
  ('197905121520','Haley','Hughes',98764307297,'a@outlook.couk','Jönköping','P.O. Box 223, 9030 Tellus. Street','16128',2),
  ('198107211150','Quynn','Franklin',98783238951,'aliquet@protonmail.com','Borlänge','P.O. Box 756, 3182 Pede Avenue','38198',2),
  ('198312230620','Sylvia','Foreman',98721783392,'ipsum.suspendisse@yahoo.couk','Söderhamn','P.O. Box 583, 7772 Dolor Av.','20817',2),
  ('200111090237','Thor','Davis',98720765614,'augue.malesuada.malesuada@google.com','Vallentuna','Ap #845-5225 Ridiculus Av.','64267',2),
  ('198908281116','Derek','Bird',98740115495,'lacus.varius@icloud.net','Söderhamn','Ap #753-8391 Tellus Road','86756',2),
  ('198912310122','Fritz','Sims',98769069999,'cras.dolor@icloud.net','Jönköping','P.O. Box 263, 8130 Id, Avenue','81332',2),
  ('197712040401','Timon','Rios',98711432775,'enim.condimentum.eget@yahoo.couk','Borlänge','625-5237 Et, St.','83644',2),
  ('197609091937','Odette','Solis',98718790402,'arcu@outlook.net','Söderhamn','Ap #321-6204 Ut Rd.','86066',2),
  ('199409011625','Brenna','Beard',98709349684,'ac.risus.morbi@icloud.net','Vänersborg','925-9037 Velit. Road','74508',2),
  ('197205202146','Alma','Stephenson',98730603196,'elit@hotmail.net','Finspång','Ap #201-7555 Aenean Rd.','81489',2),
  ('201802011706','Hop','Anderson',98704688937,'cubilia.curae.phasellus@icloud.com','Mjölby','5670 Lacus. Street','28527',2),
  ('199202071504','Wanda','Gill',98736313668,'pellentesque.massa@outlook.net','Vetlanda','3890 Feugiat. St.','84828',2),
  ('199307142328','Cameron','Mcbride',98756545760,'magnis@outlook.org','Sandviken','710-5361 Conubia Road','60632',2),
  ('201010030723','Colin','Buckley',98786569917,'curabitur@hotmail.org','Vänersborg','Ap #485-1358 Nec, Rd.','84544',2),
  ('199711140012','Bell','Herman',98784090559,'nunc.risus.varius@hotmail.ca','Vänersborg','258-7084 Gravida Avenue','16736',2),
  ('199410132348','Jennifer','Cummings',98794824065,'duis.risus@aol.ca','Ludvika','Ap #523-3063 Phasellus Ave','93556',2),
  ('201510260358','Jerome','Espinoza',98751022265,'neque.sed@yahoo.net','Bollnäs','P.O. Box 456, 4467 A, Avenue','46358',2),
  ('201008260439','Hope','Richardson',98740451232,'lorem@protonmail.com','Ludvika','223-2530 Elit Rd.','15686',2),
  ('200308080724','Mariko','Benton',98714463634,'rhoncus.nullam@yahoo.com','Bollnäs','Ap #670-6062 Eu, Av.','76387',2),
  ('199512072035','Madonna','Gilmore',98749381033,'velit.eget@aol.ca','Avesta','Ap #105-2645 Non, Ave','44365',2),
  ('201010201632','Nehru','Lane',98732735166,'nulla.semper@protonmail.net','Vetlanda','770-1324 Ut Road','77818',2),
  ('198706132340','Anika','Burns',98793221336,'augue@google.org','Falun','2162 A St.','73881',2),
  ('201407050053','Jesse','Armstrong',98736459642,'nunc.sollicitudin@yahoo.net','Trollhättan','7778 Sem Street','53122',2),
  ('199209200803','Kelsie','Bean',98795841702,'tempus.non.lacinia@icloud.com','Norrköping','781 Non Avenue','80582',2);

insert into instructor(person_number, first_name, last_name, phone_number, email, city, street, zip, can_teach_ensemble)
values
  ('197801201340','Cruz','Hamilton',98702319694,'vitae@hotmail.couk','Stockholm','P.O. Box 411, 7103 Fringilla, Avenue','52883','Yes'),
  ('197305240319','Nadine','Velasquez',98711204542,'quisque.nonummy@aol.ca','Södertälje','P.O. Box 857, 3546 Elit. Avenue','51654','Yes'),
  ('198804072343','Dillon','Tran',98776167271,'purus@protonmail.ca','Gävle','Ap #197-962 Urna Road','33186','No'),
  ('197309161515','Sade','Banks',98754036537,'suspendisse.aliquet@hotmail.ca','Borås','P.O. Box 912, 1733 Duis Rd.','55976','No'),
  ('198102120624','Wylie','Castro',98746425190,'enim.gravida@outlook.edu','Avesta','293-4384 Vulputate, St.','03651','No'),
  ('199911050844','Inga','Decker',98726872081,'nonummy.fusce@yahoo.com','Tranås','Ap #726-4478 Ultrices. Street','12838','Yes'),
  ('198005101942','Alan','Howard',98774433925,'et@google.net','Lidingo','683-1594 Nam St.','04743','Yes'),
  ('199705271228','Megan','Sloan',98753842692,'nonummy.ut@aol.org','Göteborg','P.O. Box 384, 8533 Mollis. Rd.','47563','No'),
  ('198612081547','Philip','Kent',98762361426,'sagittis@outlook.couk','Bollnäs','Ap #449-7192 Cursus, St.','14087','No'),
  ('198412061525','Armand','Perez',98776314315,'mi.duis.risus@yahoo.com','Trollhättan','P.O. Box 687, 7276 Diam Rd.','57321','No');

insert into
  contact_person(student_id, first_name, last_name, phone_number)
values
  (10,'Clementine','Kramer',98702729609),
  (39,'Savannah','Kent',98785932231),
  (49,'Christen','O''brien',98718590725),
  (39,'Aquila','Howe',98766520467),
  (12,'Amber','Simon',98712342662),
  (48,'Ulysses','Casey',98789392483),
  (18,'Lawrence','Hobbs',98798430266),
  (31,'Myles','Ward',98773303709),
  (44,'Regina','Banks',98764159414),
  (38,'Cullen','Carpenter',98755502330),
  (47,'Hu','Stephens',98747629321),
  (8,'Alisa','Newman',98729173387),
  (46,'Abel','Hines',98732906496),
  (43,'Haley','Carney',98714995416),
  (34,'Joel','Molina',98789685147),
  (9,'Jakeem','Beasley',98790822578),
  (25,'Carol','Davis',98754392992),
  (13,'Hilel','Fulton',98715488624),
  (21,'Melanie','Jarvis',98724736541),
  (32,'Hyatt','Glass',98799855558),
  (11,'Wesley','Hicks',98741543002),
  (45,'Pamela','Benjamin',98771047093),
  (22,'Patience','Harding',98705225537),
  (32,'Shaine','Bowman',98771775389),
  (2,'Kuame','Mcleod',98794796720),
  (36,'Tatiana','Larson',98717826204),
  (19,'Lucy','Wilkinson',98750000212),
  (41,'Louis','Mcintosh',98746054400),
  (6,'Ronan','Acosta',98744703962),
  (21,'Mechelle','Good',98704238880),
  (19,'Denise','Daniel',98723351339),
  (9,'Nasim','Sanford',98797365068),
  (46,'Jeanette','Lopez',98728067938),
  (23,'Erasmus','Flores',98750165077),
  (45,'Dahlia','Kennedy',98722158341),
  (3,'Kermit','Sharpe',98795791729),
  (17,'Keefe','Petersen',98700790091),
  (15,'Melanie','Dalton',98793647785),
  (36,'Colleen','Estrada',98711650434),
  (49,'Shelby','Hanson',98775347508);

insert into instrument_stock(
   type, brand, renting_price 
)
values
  (3,'Dignissim Corp.',368),
  (1,'Ornare Placerat Corp.',496),
  (1,'Tortor Nibh LLC',480),
  (4,'Enim Nunc LLP',293),
  (4,'Id Incorporated',60),
  (3,'Pede Suspendisse Dui Inc.',449),
  (1,'Nunc Sed Institute',106),
  (1,'Diam Luctus Company',428),
  (2,'Inceptos Hymenaeos Mauris Institute',352),
  (2,'Dolor Sit PC',460),
  (1,'Nunc LLC',345),
  (3,'Mi Eleifend Consulting',271),
  (4,'Diam Nunc PC',485),
  (4,'Et Ipsum Cursus Corp.',271),
  (3,'Nunc Commodo Auctor LLC',459),
  (3,'Tristique Senectus Inc.',283),
  (3,'Taciti Sociosqu Ad Incorporated',150),
  (4,'Eget Laoreet Limited',260),
  (3,'Sodales Purus In Associates',300),
  (3,'Non Luctus LLC',234);

insert into renting_instrument(
  student_id, instrument_stock_id, renting_start_time, max_renting_time_length
)
values
  (6,11,'2022-08-27 08:56',12),
  (16,10,'2022-11-02 13:03',12),
  (10,15,'2022-08-20 03:08',12),
  (41,6,'2022-11-22 04:40',12),
  (29,7,'2022-10-23 09:39',12),
  (26,4,'2022-08-09 18:39',12),
  (49,18,'2022-08-14 03:51',12),
  (28,12,'2022-08-21 17:16',12),
  (35,9,'2022-08-03 14:55',12),
  (26,19,'2022-07-28 16:26',12);

insert into
  student_sibling(student_id, sibling_id)
values
  (42,2),
  (2,42),
  (40,2),
  (2,40),
  (1,2),
  (2,1),
  (48,15),
  (15,48),
  (48,10),
  (48,14),
  (14,48),
  (10,48),
  (6,9),
  (9,6),
  (39,36),
  (36,39),
  (39,3),
  (3,39),
  (10,11),
  (11,10);

insert into
  availability(instructor_id, available_from, available_to)
values
  (1,'2021-01-01 00:00','2025-12-28 11:23'),
  (2,'2023-01-15 00:00','2025-12-28 11:23'),
  (4,'2022-08-01 00:00','2022-12-28 11:23'),
  (4,'2023-01-05 00:00','2025-12-28 11:23'),
  (5,'2022-09-01 00:00','2022-09-11 11:23'),
  (5,'2022-10-01 08:30','2022-10-15 11:23'),
  (5,'2022-11-05 00:00','2022-12-28 11:23'),
  (6,'2023-06-05 00:00','2025-12-28 11:23'),
  (7,'2021-01-01 00:00','2025-12-28 11:23'),
  (8,'2021-01-01 00:00','2025-12-28 11:23'),
  (9,'2021-01-01 00:00','2025-12-28 11:23'),
  (10,'2021-01-01 00:00','2025-12-28 11:23');

insert into
  instructor_instrument(instructor_id, instrument_id)
values
  (1, 1), (1, 2), (1, 3), (1, 4), 
  (2, 1), (2, 2), 
  (3, 1), (3, 2), 
  (4, 1), 
  (5, 1), 
  (6, 1), (6, 2), (6, 3), (6, 4), 
  (7, 1), (7, 2), (7, 3), (7, 4), 
  (8, 1), (8, 2), (8, 3), (8, 4), 
  (9, 4), 
  (10, 1);

insert into
  individual_lesson(student_id, instructor_id, instrument_id, time, lesson_detail_id)
values
  (24,6,3,'2023-10-10 01:58',2),
  (12,4,1,'2023-06-25 18:04',3),
  (17,5,1,'2022-12-25 10:00',2),
  (6,2,2,'2023-01-26 20:14',2),
  (15,1,4,'2023-02-10 05:18',2),
  (17,2,2,'2023-11-10 19:14',2),
  (41,7,2,'2023-08-17 04:13',3),
  (16,5,1,'2022-12-13 19:43',2),
  (11,1,3,'2023-03-18 13:21',2),
  (8,7,2,'2023-04-11 19:35',3),
  (42,7,3,'2023-04-05 18:36',1),
  (50,7,4,'2023-02-11 05:59',3),
  (6,7,1,'2023-02-13 22:10',2),
  (36,7,3,'2023-01-09 22:46',2),
  (34,5,1,'2023-10-10 03:34',3),
  (48,7,3,'2023-02-02 10:31',3),
  (9,9,4,'2023-07-02 07:13',3),
  (34,8,2,'2022-12-23 04:05',3),
  (36,8,4,'2022-12-17 00:13',1),
  (22,2,1,'2023-02-17 16:37',3);

insert into
  group_lesson(instrument_id, instructor_id, max_number_of_enrollment, min_number_of_enrollment, time, lesson_detail_id)
values
  (3,1,8,2,'2022-12-07 16:01',5),
  (3,1,9,2,'2022-12-06 19:41',5),
  (2,8,14,4,'2022-11-02 06:29',6),
  (1,10,13,1,'2022-04-25 16:16',4),
  (3,6,12,2,'2023-06-06 02:46',4),
  (4,9,12,2,'2022-12-30 20:29',6),
  (4,8,10,1,'2023-03-24 19:56',5),
  (2,6,14,2,'2023-12-21 11:39',6),
  (3,8,9,1,'2022-12-22 18:01',5),
  (2,2,14,3,'2023-01-25 22:13',6);
  
insert into
  student_group_lesson(student_id, group_lesson_id)
values
  (16,4), (37,4), (5,1), (2,2), (19,8), (16,1), (48,7), (37,5), (5,2), (17,5), (42,5), 
  (33,1), (30,4), (48,3), (27,3), (17,3), (38,10), (33,5), (12,10), (32,9), (18,5), (16,7), 
  (26,7), (24,8), (7,4), (4,8), (16,10), (3,2), (14,8), (49,2), (31,6), (2,1), (20,6), 
  (47,4), (47,6), (12,7), (15,8), (43,3), (18,3), (10,4), (42,6), (40,3), (25,6), (22,8), 
  (1,5), (1,8), (50,8), (36,2), (49,5), (11,5), (13,5), (9,9), (5,7), (15,3), (45,2), 
  (13,10), (46,6), (8,2), (37,8), (25,3), (40,6), (30,8), (34,4), (29,9), (21,3), 
  (32,2), (32,7), (15,6), (44,3), (45,7), (13,1), (28,5), (33,6), (36,4), (43,6), 
  (7,9), (22,3), (9,10), (50,6), (3,8), (7,3), (10,3), (27,4), (35,5), (50,10), (31,2), 
  (9,8), (12,9), (25,7), (32,8), (38,9), (9,7), (43,10);
  

insert into
  ensemble(instructor_id, max_number_of_enrollment, min_number_of_enrollment, time, genre_id, lesson_detail_id)
values
  (1,15,3,'2023-05-16 13:10',1, 7),
  (2,12,1,'2023-02-10 13:41',2, 7),
  (1,13,2,'2023-11-23 11:32',2, 7),
  (6,11,1,'2023-06-23 06:41',2, 7),
  (7,13,2,'2023-10-02 05:16',3, 7),
  (1,15,5,now()::timestamp(0) + interval '8 day',1, 7),
  (1,10,3,now()::timestamp(0) + interval '10 day',2, 7),
  (1,6,2,now()::timestamp(0) + interval '11 day',3, 7),
  (1,6,2,now()::timestamp(0) + interval '12 day',1, 7);
  
insert into
  student_ensemble(student_id, ensemble_id)
values
  (4,1), (35,4), (20,1), (31,2), (32,4), (26,3), (24,2), (5,3), (33,3), (35,2),
  (44,2), (1,4), (18,4), (12,2), (36,2), (40,3), (4,3), (11,1), (28,2), (17,4), (26,2), 
  (15,4), (13,4), (1,1), (3,4), (49,3), (34,4), (1,3), (45,5), (46,5),
  (1,6), (2,6), (3,6), (4,6), (5,6),
  (10,7), (12,7), (13,7), (14,7), (15,7), (11,7), (22,7), (23,7), (24,7), (25,7),
  (1,8), (2,8), (3,8), (4,8), (5,8),
  (10,9), (28,9), (30,9), (40,9), (45,9);