create database project;
INSERT INTO Customer VALUES (01 , 'Ravi' , 22 , 'Ravi1234@gmail.com' , 66734534 , 'Male');
INSERT INTO Customer VALUES (02 , 'Naveen' , 21 , 'naveen@gmail.com' , 64545634 , 'Male');
INSERT INTO Customer VALUES (03 , 'Shraddha' , 25 , 'shraddha@gamil.com' , 45735436 , 'Female');
INSERT INTO Customer VALUES (04, 'Vishwa' , 24 , 'vishwa@gmail.com' , 66764536 , 'Male');
INSERT INTO Customer VALUES (05, 'Harsha' , 21 , 'harsha34@gmail.com' , 66734534 , 'Male');
INSERT INTO Customer VALUES (06, 'Sharvani' , 23 , 'Sharvani544@gmail.com' , 97685567, 'Female');
INSERT INTO Customer VALUES (07 , 'Rach' , 28 , 'Rach134@gmail.com' , 44734534 , 'Female');
INSERT INTO Customer VALUES (08 , 'Pavan' , 21 , 'Pavan@gmail.com' , 54646634 , 'Male');
INSERT INTO Customer VALUES (09 , 'Krithi' , 26 , 'krithi9689@gamil.com' , 22335436 , 'Female');
INSERT INTO Customer VALUES (10 , 'Harika' , 22 , 'harika4@gmail.com' , 64554534 , 'Female');
INSERT INTO Customer VALUES (11 , 'Praveen' , 21 , 'praveen@gmail.com' , 95647342 , 'Male');
INSERT INTO Customer VALUES (12 , 'Sohel' , 25 , 'sohel53753@gamil.com' , 46353436 , 'Male');
INSERT INTO Customer VALUES (13 , 'Rana' , 20 , 'Rana16234@gmail.com' , 86864534 , 'Male');
INSERT INTO Customer VALUES (14 , 'Sameera' , 19 , 'sameera1232212@gmail.com' , 74535634 , 'Female');
INSERT INTO Customer VALUES (15 , 'Madhu' , 25 , 'madhu8586@gamil.com' , 54635436 , 'Female');


INSERT INTO Gym VALUES (101 , 'Fitness Center' , 'Hyderabad' , 'Telangana');
INSERT INTO Gym VALUES (102 , 'Diamond Gym' , 'Hyderabad' , 'Telangana');
INSERT INTO Gym VALUES (103 , 'Maryland Fitness' , 'Maryland' , 'Baltimore');
INSERT INTO Gym VALUES (104 , 'Phani Gym Center' , 'Vijayawada' , 'Andhra Pradesh');
INSERT INTO Gym VALUES (105 , 'Harika Gym' , 'Catonsville' , 'Maryland');
INSERT INTO Gym VALUES (106 , 'Crossfit' , 'Denton' , 'Texas');
INSERT INTO Gym VALUES (107 , 'Infinity Fitness ' , 'Chennai' , 'Chennai');
INSERT INTO Gym VALUES (108 , 'Jarguar Gym' , 'Hyderabad' , 'Telangana');
INSERT INTO Gym VALUES (109 , 'Sky Gym' , 'kansses ' , 'Kansses');
INSERT INTO Gym VALUES (110 , 'Hard Corp Gym' , 'Washington DC' , 'Virgina');
INSERT INTO Gym VALUES (111 , 'Dumboo Gym' , 'Miami' , 'Florida');
INSERT INTO Gym VALUES (112 , 'Muscle fitness' , 'Hyderabad' , 'Lahore');
INSERT INTO Gym VALUES (113 , 'Fitness freakers' , 'Vizag' , 'Andhra Pradesh');
INSERT INTO Gym VALUES (114 , 'University gym' , 'Delhi' , 'Punjab');
INSERT INTO Gym VALUES (115 , 'RAC' , 'Bltimore' , 'Maryland');



create database Classes;
INSERT INTO Classes (idClasses , Start_time , End_time , Activity_Type , default_Trainers_id)
VALUES (201 , '2008-11-11 13:23:44' , '2008-11-09 15:45:21' , 'abcd' , 101);
INSERT INTO Classes (idClasses , Start_time , End_time , Activity_Type , default_Trainers_id)
VALUES (202 , '2008-11-11 14:23:44' , '2008-11-09 16:45:21' , 'Cardio' , 102);
INSERT INTO Classes (idClasses , Start_time , End_time , Activity_Type , default_Trainers_id)
VALUES (203 , '2008-11-11 11:20:00' , '2008-11-09 13:30:00' , 'Legs' , 103);
INSERT INTO Classes (idClasses , Start_time , End_time , Activity_Type , default_Trainers_id)
VALUES (204 , '2008-11-11 17:23:40' , '2008-11-09 19:25:34' , 'Chest' , 104);
INSERT INTO Classes (idClasses , Start_time , End_time , Activity_Type , default_Trainers_id)
VALUES (205 , '2008-11-11 12:23:54' , '2008-11-09 15:45:21' , 'Shoulder' , 105);
INSERT INTO Classes (idClasses , Start_time , End_time , Activity_Type , default_Trainers_id)
VALUES (206 , '2008-11-11 07:00:00' , '2008-11-09 10:45:00' , 'Muscle' , 106);
INSERT INTO Classes (idClasses , Start_time , End_time , Activity_Type , default_Trainers_id)
VALUES (207 , '2008-11-11 17:50:42' , '2008-11-09 14:15:00' , 'Headach' , 107);
INSERT INTO Classes (idClasses , Start_time , End_time , Activity_Type , default_Trainers_id)
VALUES (208 , '2008-11-11 11:00:45' , '2008-11-09 13:45:30' , 'Hands ' , 108);
INSERT INTO Classes (idClasses , Start_time , End_time , Activity_Type , default_Trainers_id)
VALUES (209 , '2008-11-11 06:30:00' , '2008-11-09 08:00:00' , 'BackPain' , 109);
INSERT INTO Classes (idClasses , Start_time , End_time , Activity_Type , default_Trainers_id)
VALUES (210 , '2008-11-11 13:00:00' , '2008-11-09 15:30:00' , 'Shoulder' , 110);
INSERT INTO Classes (idClasses , Start_time , End_time , Activity_Type , default_Trainers_id)
VALUES (211 , '2008-11-11 09:00:00' , '2008-11-09 13:45:00' , 'Legs' , 111);
INSERT INTO Classes (idClasses , Start_time , End_time , Activity_Type , default_Trainers_id)
VALUES (212 , '2008-11-11 10:23:44' , '2008-11-09 11:00:20' , 'Muscle Mass' , 112);
INSERT INTO Classes (idClasses , Start_time , End_time , Activity_Type , default_Trainers_id)
VALUES (213 , '2008-11-11 13:23:44' , '2008-11-09 15:45:00' , 'Shredded' , 113);
INSERT INTO Classes (idClasses , Start_time , End_time , Activity_Type , default_Trainers_id)
VALUES (214 , '2008-11-11 05:10:05' , '2008-11-09 08:00:20' , 'lose Weight' , 114);
INSERT INTO Classes (idClasses , Start_time , End_time , Activity_Type , default_Trainers_id)
VALUES (215 , '2008-11-11 13:23:44' , '2008-11-09 14:45:21' , 'BackPain' , 115);

create database Manager;
INSERT INTO Manager VALUES (456, 'naveen', 23, 123);
INSERT INTO Manager VALUES (457, 'Ravi', 24, 124);
INSERT INTO Manager VALUES (458, 'viswa', 23, 125);
INSERT INTO Manager VALUES (459, 'shraddha', 23, 126);
INSERT INTO Manager VALUES (460, 'phani', 27, 127);
INSERT INTO Manager VALUES (461, 'harsha', 23, 128);
INSERT INTO Manager VALUES (462, 'pavan', 32, 129);
INSERT INTO Manager VALUES (463, 'kanth', 24, 130);
INSERT INTO Manager VALUES (464, 'rana', 29, 131);
INSERT INTO Manager VALUES (465, 'shravani', 34, 132);
INSERT INTO Manager VALUES (466, 'rachana', 22, 133);
INSERT INTO Manager VALUES (467, 'samantha', 34, 134);
INSERT INTO Manager VALUES (469, 'praveen', 31, 135);
INSERT INTO Manager VALUES (470, 'veer', 30, 136);
INSERT INTO Manager VALUES (471, 'akash', 33, 137);

create database Equipments;
INSERT INTO Equipments VALUES (978, 'Dumbbell', 43, 2); 
INSERT INTO Equipments VALUES (979, 'Barbell', 24, 3); 
INSERT INTO Equipments VALUES (980, 'Treadmill', 78, 5); 
INSERT INTO Equipments VALUES (981, 'Elliptical trainer', 78, 6); 
INSERT INTO Equipments VALUES (982, 'Rowing machine', 53, 2); 
INSERT INTO Equipments VALUES (983, 'bicycle', 67, 7); 
INSERT INTO Equipments VALUES (984, 'Bench', 17, 6); 
INSERT INTO Equipments VALUES (985, 'Leg extension', 73, 8); 
INSERT INTO Equipments VALUES (986, 'Leg Curl', 53, 4); 
INSERT INTO Equipments VALUES (987, 'Kettlebell', 24, 5);
INSERT INTO Equipments VALUES (988, 'Leg Press Machine', 52, 3); 
INSERT INTO Equipments VALUES (989, 'Smith machine', 100, 2); 
INSERT INTO Equipments VALUES (990, 'Stability ball', 13, 20); 
INSERT INTO Equipments VALUES (991, 'Resistance band', 45, 28); 
INSERT INTO Equipments VALUES (992, 'Machine fly', 24, 4);  

Create database Membership_has_Classes;
INSERT INTO Membership_has_Classes VALUES (236, 345);
INSERT INTO Membership_has_Classes VALUES (237, 346);
INSERT INTO Membership_has_Classes VALUES (238, 347);
INSERT INTO Membership_has_Classes VALUES (239, 348);
INSERT INTO Membership_has_Classes VALUES (240, 349);
INSERT INTO Membership_has_Classes VALUES (241, 350);
INSERT INTO Membership_has_Classes VALUES (242, 351);
INSERT INTO Membership_has_Classes VALUES (243, 352);
INSERT INTO Membership_has_Classes VALUES (244, 353);
INSERT INTO Membership_has_Classes VALUES (245, 354);
INSERT INTO Membership_has_Classes VALUES (246, 355);
INSERT INTO Membership_has_Classes VALUES (247, 356);
INSERT INTO Membership_has_Classes VALUES (248, 357);
INSERT INTO Membership_has_Classes VALUES (249, 358);
INSERT INTO Membership_has_Classes VALUES (250, 359);

create database Equipments_has_Classes;
INSERT INTO Equipments_has_Classes VALUES (431, 2002);
INSERT INTO Equipments_has_Classes VALUES (432, 2003);
INSERT INTO Equipments_has_Classes VALUES (433, 2004);
INSERT INTO Equipments_has_Classes VALUES (434, 2005);
INSERT INTO Equipments_has_Classes VALUES (435, 2006);
INSERT INTO Equipments_has_Classes VALUES (436, 2007);
INSERT INTO Equipments_has_Classes VALUES (437, 2008);
INSERT INTO Equipments_has_Classes VALUES (438, 2009);
INSERT INTO Equipments_has_Classes VALUES (439, 2010);
INSERT INTO Equipments_has_Classes VALUES (440, 2011);
INSERT INTO Equipments_has_Classes VALUES (441, 2012);
INSERT INTO Equipments_has_Classes VALUES (442, 2013);
INSERT INTO Equipments_has_Classes VALUES (443, 2014);
INSERT INTO Equipments_has_Classes VALUES (444, 2015);
INSERT INTO Equipments_has_Classes VALUES (445, 2016);

create database Membership;
INSERT INTO Membership VALUES (236, '2008-12-11', 23, '2008-11-12', 341, 904, 240);
INSERT INTO Membership VALUES (237, '2008-11-11', 24, '2008-11-09', 342, 905, 239);
INSERT INTO Membership VALUES (238, '2008-11-10', 25, '2009-11-11', 343, 906, 241);
INSERT INTO Membership VALUES (239, '2009-12-11', 26, '2010-11-06', 344, 907, 242);
INSERT INTO Membership VALUES (240, '2010-11-11', 27, '2011-11-09', 345, 908, 243);
INSERT INTO Membership VALUES (241, '2011-11-11', 28, '2012-11-09', 346, 909, 244);
INSERT INTO Membership VALUES (242, '2012-11-11', 29, '2013-11-09', 347, 910, 245);
INSERT INTO Membership VALUES (243, '2013-11-11', 30, '2014-11-09', 348, 911, 246);
INSERT INTO Membership VALUES (244, '2014-11-11', 31, '2015-11-09', 349, 912, 247);
INSERT INTO Membership VALUES (245, '2015-11-11', 32, '2016-11-09', 350, 913, 248);
INSERT INTO Membership VALUES (246, '2016-11-11', 33, '2017-11-09', 351, 914, 249);
INSERT INTO Membership VALUES (247, '2017-11-11', 34, '2018-11-09', 352, 915, 250);
INSERT INTO Membership VALUES (248, '2018-11-11', 35, '2019-11-09', 353, 916, 251);
INSERT INTO Membership VALUES (249, '2019-11-11', 36, '2020-11-09', 354, 917, 252);
INSERT INTO Membership VALUES (250, '2020-11-11', 37, '2021-11-09', 355, 918, 253);

create database Trainers;
INSERT INTO Trainers VALUES (101, 'Ram', 10, 24, 'Male', 123, 456); 
INSERT INTO Trainers VALUES (102, 'Sita', 11, 25, 'Female', 124, 457); 
INSERT INTO Trainers VALUES (103, 'Laxman', 12, 26, 'Male', 125, 458); 
INSERT INTO Trainers VALUES (104, 'Hari', 13, 24, 'Male', 126, 459); 
INSERT INTO Trainers VALUES (105, 'Jayanth', 14, 27, 'Male', 127, 460); 
INSERT INTO Trainers VALUES (106, 'Sravan', 15, 28, 'Male', 128, 461); 
INSERT INTO Trainers VALUES (107, 'Harish', 16, 29, 'Male', 129, 462); 
INSERT INTO Trainers VALUES (108, 'Srikanth', 17, 30, 'Male', 130, 463); 
INSERT INTO Trainers VALUES (109, 'RaviTeja', 18, 31, 'Male', 131, 464); 
INSERT INTO Trainers VALUES (110, 'Sangamesh', 19, 32, 'Male', 132, 465); 
INSERT INTO Trainers VALUES (111, 'Pranavi', 20, 33, 'Female', 133, 466); 
INSERT INTO Trainers VALUES (112, 'Mahesh', 21, 34, 'Male', 134, 467); 
INSERT INTO Trainers VALUES (113, 'Mohini', 22, 35, 'Female', 135, 468); 
INSERT INTO Trainers VALUES (114, 'Vasanth', 23, 36, 'Male', 136, 469); 
INSERT INTO Trainers VALUES (115, 'Kajal', 24, 37, 'Female', 137, 470); 
