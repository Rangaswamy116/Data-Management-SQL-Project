-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb


-- -----------------------------------------------------
-- Table `gym`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gym` (
  `Gym_id` INT NOT NULL,
  `Gym_name` CHAR(20) NOT NULL,
  `City` CHAR(20) NOT NULL,
  `State` CHAR(20) NOT NULL,
  PRIMARY KEY (`Gym_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `manager` (
  `Manager_id` INT NOT NULL,
  `Manager_Name` CHAR(25) NOT NULL,
  `Manager_age` INT NOT NULL,
  `Gym_id` INT NOT NULL,
  PRIMARY KEY (`Manager_id`),
  INDEX `fk_Manager_Gym1_idx` (`Gym_id` ASC) VISIBLE,
  CONSTRAINT `fk_Manager_Gym1`
    FOREIGN KEY (`Gym_id`)
    REFERENCES `gym` (`Gym_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `trainers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trainers` (
  `Trainers_id` INT NOT NULL,
  `Trainer_name` CHAR(25) NOT NULL,
  `Experience` INT NOT NULL,
  `Age` INT NOT NULL,
  `Gender` CHAR(7) NOT NULL,
  `Gym_id` INT NOT NULL,
  `Manager_id` INT NOT NULL,
  PRIMARY KEY (`Trainers_id`),
  INDEX `fk_Trainers_Gym1_idx` (`Gym_id` ASC) VISIBLE,
  INDEX `fk_Trainers_Manager1_idx` (`Manager_id` ASC) VISIBLE,
  CONSTRAINT `fk_Trainers_Gym1`
    FOREIGN KEY (`Gym_id`)
    REFERENCES `gym` (`Gym_id`),
  CONSTRAINT `fk_Trainers_Manager1`
    FOREIGN KEY (`Manager_id`)
    REFERENCES `manager` (`Manager_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `classes` (
  `Classes_id` INT NOT NULL,
  `Start_time` DATETIME(6) NOT NULL,
  `End_time` DATETIME(6) NOT NULL,
  `Activity_Type` VARCHAR(45) NOT NULL,
  `Trainers_id` INT NOT NULL,
  PRIMARY KEY (`Classes_id`),
  INDEX `fk_Classes_Trainers1_idx` (`Trainers_id` ASC) VISIBLE,
  CONSTRAINT `fk_Classes_Trainers1`
    FOREIGN KEY (`Trainers_id`)
    REFERENCES `trainers` (`Trainers_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `customer` (
  `Customer_id` INT NOT NULL,
  `First_Name` CHAR(25) NOT NULL,
  `Last_Name` VARCHAR(40) NOT NULL,
  `Age` INT NULL DEFAULT NULL,
  `Email` VARCHAR(25) NOT NULL,
  `Phone_no` INT NOT NULL,
  `Gender` CHAR(7) NOT NULL,
  PRIMARY KEY (`Customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `equipments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipments` (
  `Equipments_id` INT NOT NULL,
  `Equipment_name` VARCHAR(45) NOT NULL,
  `Cost` INT NOT NULL,
  `Total_quantity` INT NOT NULL,
  PRIMARY KEY (`Equipments_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `equipments_has_classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipments_has_classes` (
  `Equipments_id` INT NOT NULL,
  `Classes_id` INT NOT NULL,
  INDEX `fk_Equipments_has_Classes_Classes1_idx` (`Classes_id` ASC) VISIBLE,
  INDEX `fk_Equipments_has_Classes_Equipments1_idx` (`Equipments_id` ASC) VISIBLE,
  CONSTRAINT `fk_Equipments_has_Classes_Classes1`
    FOREIGN KEY (`Classes_id`)
    REFERENCES `classes` (`Classes_id`),
  CONSTRAINT `fk_Equipments_has_Classes_Equipments1`
    FOREIGN KEY (`Equipments_id`)
    REFERENCES `equipments` (`Equipments_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `membership` (
  `Membership_id` INT NOT NULL,
  `Date_Start` DATE NOT NULL,
  `Rate` INT NOT NULL,
  `Expiry_date` DATE NOT NULL,
  `Customer_id` INT NOT NULL,
  `Gym_id` INT NOT NULL,
  PRIMARY KEY (`Membership_id`),
  INDEX `fk_Membership_Customer_idx` (`Customer_id` ASC) VISIBLE,
  INDEX `fk_Membership_Gym1_idx` (`Gym_id` ASC) VISIBLE,
  CONSTRAINT `fk_Membership_Customer`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `customer` (`Customer_id`),
  CONSTRAINT `fk_Membership_Gym1`
    FOREIGN KEY (`Gym_id`)
    REFERENCES `gym` (`Gym_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `membership_has_classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `membership_has_classes` (
  `Membership_id` INT NOT NULL,
  `Classes_id` INT NOT NULL,
  INDEX `fk_Membership_has_Classes_Classes1_idx` (`Classes_id` ASC) VISIBLE,
  INDEX `fk_Membership_has_Classes_Membership1_idx` (`Membership_id` ASC) VISIBLE,
  CONSTRAINT `fk_Membership_has_Classes_Classes1`
    FOREIGN KEY (`Classes_id`)
    REFERENCES `classes` (`Classes_id`),
  CONSTRAINT `fk_Membership_has_Classes_Membership1`
    FOREIGN KEY (`Membership_id`)
    REFERENCES `membership` (`Membership_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO Customer VALUES (01 , 'Ravi','Kamat', 22 , 'Ravi1234@gmail.com' , 667345394 , 'Male');
INSERT INTO Customer VALUES (02 , 'Naveen','Agarwal', 21 , 'naveen@gmail.com' , 64545634 , 'Male');
INSERT INTO Customer VALUES (03 , 'Shraddha','Sundaresan', 25 , 'shraddha@gmail.com' , 45735436 , 'Female');
INSERT INTO Customer VALUES (04, 'Vishwa' ,'Aacharya', 24 , 'vishwa@gmail.com' , 66764536 , 'Male');
INSERT INTO Customer VALUES (05, 'Harsha' ,'Bedi', 21 , 'harsha34@gmail.com' , 66734534 , 'Male');
INSERT INTO Customer VALUES (06, 'Sharvani' ,'Chatterjee', 23 , 'Sharvani544@gmail.com' , 97685567, 'Female');
INSERT INTO Customer VALUES (07 , 'Rach'  ,'Pandey',28, 'Rach134@gmail.com' , 44734534 , 'Female');
INSERT INTO Customer VALUES (08 , 'Pavan'  ,'Kumar', 21,'Pavan@gmail.com' , 54646634 , 'Male');
INSERT INTO Customer VALUES (09 , 'Krithi'  ,'Pandey', 26,'krithi9689@gmail.com' , 22335436 , 'Female');
INSERT INTO Customer VALUES (10 , 'Harika'  ,'Shetty', 22,'harika4@gmail.com' , 64554534 , 'Female');
INSERT INTO Customer VALUES (11 , 'Praveen'  ,'Shukla', 21,'praveen@gmail.com' , 95647342 , 'Male');
INSERT INTO Customer VALUES (12 , 'Sohel' ,'Gupta','25', 'sohel53753@gmail.com' , 46353436 , 'Male');
INSERT INTO Customer VALUES (13 , 'Rana'  ,'Reddy',30,'Rana16234@gmail.com' , 86864534 , 'Male');
INSERT INTO Customer VALUES (14 , 'Sameera' , 'Rao', 19 ,'sameera1232212@gmail.com' , 74535634 , 'Female');
INSERT INTO Customer VALUES (15 , 'Madhu' ,'Tiwari',21, 'madhu8586@gmail.com' , 54635436 , 'Female');
INSERT INTO Customer VALUES (16 , 'Naresh'  ,'Meka', 21,'naresh@gmail.com' , 958970342 , 'Male');
INSERT INTO Customer VALUES (17 , 'Trushwanth' ,'Kota','28', 'trushwanth53@gmail.com' , 990853436 , 'Male');
INSERT INTO Customer VALUES (18 , 'Prabhas'  ,'Yeddida',34,'prabhasyeddida@gmail.com' , 987864530 , 'Male');
INSERT INTO Customer VALUES (19 , 'Anushka' , 'Kale', 29 ,'anushkak@gmail.com' , 720987634 , 'Female');
INSERT INTO Customer VALUES (20 , 'Mounika' ,'Ponnuri',24, 'mounika86@gmail.com' , 234135436 , 'Female');
INSERT INTO Customer VALUES (21 , 'Vasanth' ,'Varamaneni',21, 'bvasanth6@gmail.com' , 865095436 , 'Male');
INSERT INTO Customer VALUES (22 , 'Kajal' ,'Salvala',29, 'kajal@gmail.com' , 234654136 , 'Female');
INSERT INTO Customer VALUES (23 , 'Hanish' ,'Sai',27, 'hanishsai@gmail.com' , 980102436 , 'Male');
INSERT INTO Customer VALUES (24 , 'Rohith' ,'Yatindra',25, 'yatindra@gmail.com' , 758905436 , 'Male');
INSERT INTO Customer VALUES (25 , 'Manideep' ,'Vemula',24, 'manideep09@gmail.com' , 240865646 , 'Male');
INSERT INTO Customer VALUES (26 , 'Meenakshi' ,'Polam',22, 'meenakshi@gmail.com' , 982355436 , 'Female');
INSERT INTO Customer VALUES (27 , 'Harshini' ,'Kalagarla',29, 'Harshini@gmail.com' , 283590126 , 'Female');
INSERT INTO Customer VALUES (28 , 'Pavan' ,'Boddu',25, 'Pavan@gmail.com' , 908763543 , 'Male');
INSERT INTO Customer VALUES (29 , 'Ranga' ,'Kappeta',22, 'Ranga@gmail.com' , 876892412 , 'Male');
INSERT INTO Customer VALUES (30 , 'Komali' ,'Potluri',24, 'Komali@gmail.com' , 209725436 , 'Female');



INSERT INTO Gym VALUES (101 , 'Fitness Center' , 'Hyderabad' , 'Telangana');
INSERT INTO Gym VALUES (102 , 'Diamond Gym' , 'Hyderabad' , 'Telangana');
INSERT INTO Gym VALUES (103 , 'Maryland Fitness' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (104 , 'Phani Gym Center' , 'Vijayawada' , 'Andhra Pradesh');
INSERT INTO Gym VALUES (105 , 'Harika Gym' , 'Catonsville' , 'Maryland');
INSERT INTO Gym VALUES (106 , 'Crossfit' , 'Denton' , 'Texas');
INSERT INTO Gym VALUES (107 , 'Infinity Fitness ' , 'Chennai' , 'Tamil Nadu');
INSERT INTO Gym VALUES (108 , 'Jarguar Gym' , 'Hyderabad' , 'Telangana');
INSERT INTO Gym VALUES (109 , 'Sky Gym' , 'kansses ' , 'Kansses');
INSERT INTO Gym VALUES (110 , 'Hard Corp Gym' , 'Washington DC' , 'Virgina');
INSERT INTO Gym VALUES (111 , 'Dumboo Gym' , 'Miami' , 'Florida');
INSERT INTO Gym VALUES (112 , 'Muscle fitness' , 'Hyderabad' , 'Lahore');
INSERT INTO Gym VALUES (113 , 'Fitness freakers' , 'Vizag' , 'Andhra Pradesh');
INSERT INTO Gym VALUES (114 , 'University gym' , 'Delhi' , 'Punjab');
INSERT INTO Gym VALUES (115 , 'RAC' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (116 , 'Retro Fitness' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (117 , 'Planet Fitness' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (118 , 'Federal Hill Fitness' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (119 , 'Brick Bodies' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (120 , 'Athletic Club' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (121 , 'Grind Baltimore' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (122 , 'XPF Studio' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (123 , 'Reflex Fitness' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (124 , 'Crunch Fitness' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (125 , 'Lets Go' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (126 , 'LA fitness' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (127 , 'Charm City' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (128 , 'Merrit Clubs Fitness' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (129 , 'City Fit' , 'Baltimore' , 'Maryland');
INSERT INTO Gym VALUES (130 , 'Push511 Fitness' , 'Baltimore' , 'Maryland');

INSERT INTO Manager VALUES (456, 'naveen', 23, 101);
INSERT INTO Manager VALUES (457, 'Ravi', 24, 102);
INSERT INTO Manager VALUES (458, 'viswa', 23, 103);
INSERT INTO Manager VALUES (459, 'shraddha', 23, 104);
INSERT INTO Manager VALUES (460, 'phani', 27, 105);
INSERT INTO Manager VALUES (461, 'harsha', 23, 106);
INSERT INTO Manager VALUES (462, 'pavan', 32, 107);
INSERT INTO Manager VALUES (463, 'kanth', 24, 108);
INSERT INTO Manager VALUES (464, 'rana', 29, 109);
INSERT INTO Manager VALUES (465, 'shravani', 34, 110);
INSERT INTO Manager VALUES (466, 'rachana', 22, 111);
INSERT INTO Manager VALUES (467, 'samantha', 34, 112);
INSERT INTO Manager VALUES (468, 'praveen', 31, 113);
INSERT INTO Manager VALUES (469, 'veer', 30, 114);
INSERT INTO Manager VALUES (470, 'akash', 33, 115);
INSERT INTO Manager VALUES (471, 'ramesh', 31, 116);
INSERT INTO Manager VALUES (472, 'suresh', 30, 117);
INSERT INTO Manager VALUES (473, 'mohith', 22, 118);
INSERT INTO Manager VALUES (474, 'mokshith', 28, 119);
INSERT INTO Manager VALUES (475, 'dharmesh', 25, 120);
INSERT INTO Manager VALUES (476, 'munna', 29, 121);
INSERT INTO Manager VALUES (477, 'rayudu', 27, 122);
INSERT INTO Manager VALUES (478, 'sachin', 24, 123);
INSERT INTO Manager VALUES (479, 'ram', 22, 124);
INSERT INTO Manager VALUES (480, 'rachel', 26, 125);
INSERT INTO Manager VALUES (481, 'advitha', 23, 126);
INSERT INTO Manager VALUES (482, 'mahesh', 23, 127);
INSERT INTO Manager VALUES (483, 'neeraj', 20, 128);
INSERT INTO Manager VALUES (484, 'ranga', 28, 129);
INSERT INTO Manager VALUES (485, 'harshini', 26, 130);

INSERT INTO Trainers VALUES (501, 'Ram', 10, 24, 'Male', 101, 456); 
INSERT INTO Trainers VALUES (530, 'Shyam', 1, 20, 'Male', 101, 456);
INSERT INTO Trainers VALUES (531, 'Arun', 3, 25, 'Male', 101, 456);
INSERT INTO Trainers VALUES (532, 'Veeresh', 6, 29, 'Male', 101, 456);
INSERT INTO Trainers VALUES (533, 'Radha', 7, 30, 'Male', 101, 456); 
INSERT INTO Trainers VALUES (534, 'Shiv', 14, 35, 'Male', 101, 456); 
INSERT INTO Trainers VALUES (535, 'Prabha', 16, 40, 'Male', 101, 456); 
INSERT INTO Trainers VALUES (536, 'Hridhay',10, 28, 'Male', 101, 456);  
INSERT INTO Trainers VALUES (502, 'Sita', 11, 25, 'Female', 102, 457); 
INSERT INTO Trainers VALUES (503, 'Laxman', 12, 26, 'Male', 103, 458); 
INSERT INTO Trainers VALUES (504, 'Hari', 13, 24, 'Male', 104, 459); 
INSERT INTO Trainers VALUES (505, 'Jayanth', 14, 27, 'Male', 105, 460); 
INSERT INTO Trainers VALUES (506, 'Sravan', 15, 28, 'Male', 106, 461); 
INSERT INTO Trainers VALUES (507, 'Harish', 16, 29, 'Male', 107, 462); 
INSERT INTO Trainers VALUES (508, 'Srikanth', 17, 30, 'Male', 108, 463); 
INSERT INTO Trainers VALUES (509, 'RaviTeja', 18, 31, 'Male', 109, 464); 
INSERT INTO Trainers VALUES (510, 'Sangamesh', 19, 32, 'Male', 110, 465); 
INSERT INTO Trainers VALUES (511, 'Pranavi', 20, 33, 'Female', 111, 466); 
INSERT INTO Trainers VALUES (512, 'Mahesh', 21, 34, 'Male', 112, 467); 
INSERT INTO Trainers VALUES (513, 'Mohini', 22, 35, 'Female', 113, 468); 
INSERT INTO Trainers VALUES (514, 'Vasanth', 23, 36, 'Male', 114, 469); 
INSERT INTO Trainers VALUES (515, 'Kajal', 24, 37, 'Female', 115, 470);
INSERT INTO Trainers VALUES (516, 'Prameela', 25, 38, 'Female', 116, 471); 
INSERT INTO Trainers VALUES (517, 'Mahesh', 26, 39, 'Male', 117, 472); 
INSERT INTO Trainers VALUES (518, 'Mohini', 27, 40, 'Female', 118, 473); 
INSERT INTO Trainers VALUES (519, 'Vasanth', 28, 41, 'Male', 119, 474); 
INSERT INTO Trainers VALUES (520, 'Amala', 29, 42, 'Female', 120, 475);
INSERT INTO Trainers VALUES (521, 'Ajinkya', 30, 43, 'Male', 121, 476);
INSERT INTO Trainers VALUES (522, 'Komali', 31, 44, 'Female', 122, 477);
INSERT INTO Trainers VALUES (523, 'Varalaxmi', 32, 45, 'Female', 123, 478);
INSERT INTO Trainers VALUES (524, 'Vinod', 33, 46, 'Male', 124, 479);
INSERT INTO Trainers VALUES (525, 'Ronaldo', 34, 47, 'Male', 125, 480);
INSERT INTO Trainers VALUES (526, 'John', 35, 48, 'Male', 126, 481);
INSERT INTO Trainers VALUES (527, 'Vasu', 36, 49, 'Male', 127, 482);
INSERT INTO Trainers VALUES (528, 'Mohani', 37, 50, 'Female', 128, 483);
INSERT INTO Trainers VALUES (529, 'Anjali', 38, 51, 'Female', 130, 484);


INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (201 , '2022-11-09 14:45:21' , '2022-11-09 15:45:21' , 'Cardio' , 501);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (202 , '2022-11-09 14:23:44' , '2022-11-09 15:45:21' , 'Cardio' , 502);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (203 , '2022-11-09 14:20:00' , '2022-11-09 15:45:21' , 'Legs' , 503);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (204 , '2022-11-09 13:23:40' , '2022-11-09 15:45:21' , 'Chest' , 504);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (205 , '2022-11-09 12:23:54' , '2022-11-09 15:45:21' , 'Shoulder' , 505);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (206 , '2022-11-09 07:00:00' , '2022-11-09 10:45:00' , 'Muscle' , 506);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (207 , '2022-11-09 12:50:42' , '2022-11-09 14:15:00' , 'Headach' , 507);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (208 , '2022-11-09 15:00:45' , '2022-11-09 15:45:21' , 'Hands ' , 508);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (209 , '2022-11-09 14:30:00' , '2022-11-09 15:45:21' , 'BackPain' , 509);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (210 , '2022-11-09 14:00:00' , '2022-11-09 15:30:00' , 'Shoulder' , 510);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (211 , '2022-11-09 15:00:00' , '2022-11-09 15:45:21' , 'Legs' , 511);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (212 , '2022-11-09 14:23:44' , '2022-11-09 15:45:21' , 'Muscle Mass' , 512);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (213 , '2022-11-09 14:23:44' , '2022-11-09 15:45:21' , 'Shredded' , 513);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (214 , '2022-11-09 14:10:05' , '2022-11-09 15:45:21' , 'lose Weight' , 514);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (215 , '2022-11-09 14:23:44' , '2022-11-09 15:45:21' , 'BackPain' , 515);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (216 , '2022-11-09 14:23:44' , '2022-11-09 15:45:21' , 'Face' , 516);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (217 , '2022-11-09 15:23:44' , '2022-11-09 16:49:21' , 'Walk' , 517);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (218 , '2022-11-09 16:23:44' , '2022-11-09 17:42:21' , 'Jumba' , 518);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (219 , '2022-11-09 17:23:44' , '2022-11-09 18:41:21' , 'composition' , 519);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (220 , '2022-11-09 18:23:44' , '2022-11-09 19:40:21' , 'circuit training' , 520);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (221 , '2022-11-09 19:23:44' , '2022-11-09 20:44:21' , 'jogging' , 521);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (222 , '2022-11-09 20:23:44' , '2022-11-09 21:21:21' , 'Heavy weights' , 522);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (223 , '2022-11-09 21:23:44' , '2022-11-09 22:56:21' , 'Bench press' , 523);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (224 , '2022-11-09 22:23:44' , '2022-11-09 23:11:21' , 'muscle strengthening' , 524);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (225 , '2022-11-09 15:23:44' , '2022-11-09 16:22:21' , 'bone strengthening' , 525);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (226 , '2022-11-09 09:23:44' , '2022-11-09 10:56:21' , 'aerobics' , 526);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (227 , '2022-11-09 10:23:44' , '2022-11-09 11:11:21' , 'squats' , 527);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (228 , '2022-11-09 10:23:44' , '2022-11-09 12:45:21' , 'anaerobic' , 528);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (229 , '2022-11-09 17:23:44' , '2022-11-09 18:30:21' , 'jumping jack' , 529);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (230 , '2022-11-01 17:23:44' , '2022-11-01 18:30:21' , 'aerobics' , 530);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (231 , '2022-11-01 17:23:44' , '2022-11-01 18:30:21' , 'muscle strengthening' , 531);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (232 , '2022-11-01 17:23:44' , '2022-11-01 18:30:21' , 'muscle strengthening' , 532);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (233 , '2022-11-08 17:23:44' , '2022-11-08 18:30:21' , 'muscle strengthening' , 530);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (234 , '2022-11-01 17:23:44' , '2022-11-01 18:30:21' , 'muscle strengthening' , 533);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (235 , '2022-11-01 17:23:44' , '2022-11-01 18:30:21' , 'squats' , 534);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (290 , '2022-11-01 17:23:44' , '2022-11-01 18:30:21' , 'squats' , 535);
INSERT INTO Classes (Classes_id , Start_time , End_time , Activity_Type , Trainers_id)
VALUES (291 , '2022-11-01 17:23:44' , '2022-11-01 18:30:21' , 'aerobics' , 536);



INSERT INTO Membership VALUES (236, '2018-12-11', 23, '2022-11-12', 01, 101);
INSERT INTO Membership VALUES (237, '2018-11-11', 24, '2022-11-09', 02, 102);
INSERT INTO Membership VALUES (238, '2018-11-10', 25, '2022-11-11', 03, 103);
INSERT INTO Membership VALUES (239, '2018-12-11', 26, '2022-11-06', 04, 104);
INSERT INTO Membership VALUES (240, '2018-11-11', 27, '2022-11-09', 05, 105);
INSERT INTO Membership VALUES (241, '2018-11-11', 28, '2022-11-09', 06, 106);
INSERT INTO Membership VALUES (242, '2018-11-11', 29, '2022-11-09', 07, 107);
INSERT INTO Membership VALUES (243, '2018-11-11', 30, '2022-11-09', 08, 108);
INSERT INTO Membership VALUES (244, '2018-11-11', 31, '2022-11-09', 09, 109);
INSERT INTO Membership VALUES (245, '2018-11-11', 32, '2024-11-09', 10, 110);
INSERT INTO Membership VALUES (246, '2018-11-11', 33, '2024-11-09', 11, 111);
INSERT INTO Membership VALUES (247, '2018-11-11', 34, '2024-11-09', 12, 112);
INSERT INTO Membership VALUES (248, '2018-11-11', 35, '2024-11-09', 13, 113);
INSERT INTO Membership VALUES (249, '2019-11-11', 36, '2024-11-09', 14, 114);
INSERT INTO Membership VALUES (250, '2020-11-11', 37, '2024-11-09', 15, 115);
INSERT INTO Membership VALUES (251, '2021-11-11', 38, '2024-11-09', 16, 116);
INSERT INTO Membership VALUES (252, '2022-11-11', 39, '2024-11-09', 17, 117);
INSERT INTO Membership VALUES (253, '2003-11-11', 40, '2024-11-09', 18, 118);
INSERT INTO Membership VALUES (254, '2011-11-11', 41, '2024-11-09', 19, 119);
INSERT INTO Membership VALUES (255, '2012-11-11', 42, '2024-11-09', 20, 120);
INSERT INTO Membership VALUES (256, '2013-11-11', 43, '2024-11-09', 21, 121);
INSERT INTO Membership VALUES (257, '2014-11-11', 44, '2024-11-09', 22, 122);
INSERT INTO Membership VALUES (258, '2015-11-11', 45, '2024-11-09', 23, 123);
INSERT INTO Membership VALUES (259, '2016-11-11', 46, '2024-11-09', 24, 124);
INSERT INTO Membership VALUES (260, '2017-11-11', 47, '2013-11-09', 25, 125);
INSERT INTO Membership VALUES (261, '2018-11-11', 43, '2013-11-09', 26, 126);
INSERT INTO Membership VALUES (262, '2019-11-11', 44, '2023-11-09', 27, 127);
INSERT INTO Membership VALUES (263, '2020-11-11', 45, '2021-11-09', 28, 128);
INSERT INTO Membership VALUES (264, '2021-11-11', 46, '2022-11-09', 29, 129);
INSERT INTO Membership VALUES (265, '2022-11-11', 47, '2022-11-09', 30, 130);




INSERT INTO Membership_has_Classes VALUES (236, 201);
INSERT INTO Membership_has_Classes VALUES (237, 202);
INSERT INTO Membership_has_Classes VALUES (238, 203);
INSERT INTO Membership_has_Classes VALUES (239, 204);
INSERT INTO Membership_has_Classes VALUES (240, 205);
INSERT INTO Membership_has_Classes VALUES (241, 206);
INSERT INTO Membership_has_Classes VALUES (242, 207);
INSERT INTO Membership_has_Classes VALUES (243, 208);
INSERT INTO Membership_has_Classes VALUES (244, 209);
INSERT INTO Membership_has_Classes VALUES (245, 210);
INSERT INTO Membership_has_Classes VALUES (246, 211);
INSERT INTO Membership_has_Classes VALUES (247, 212);
INSERT INTO Membership_has_Classes VALUES (248, 213);
INSERT INTO Membership_has_Classes VALUES (249, 214);
INSERT INTO Membership_has_Classes VALUES (250, 215);
INSERT INTO Membership_has_Classes VALUES (251, 216);
INSERT INTO Membership_has_Classes VALUES (252, 217);
INSERT INTO Membership_has_Classes VALUES (253, 218);
INSERT INTO Membership_has_Classes VALUES (254, 219);
INSERT INTO Membership_has_Classes VALUES (255, 220);
INSERT INTO Membership_has_Classes VALUES (256, 221);
INSERT INTO Membership_has_Classes VALUES (257, 222);
INSERT INTO Membership_has_Classes VALUES (258, 223);
INSERT INTO Membership_has_Classes VALUES (259, 224);
INSERT INTO Membership_has_Classes VALUES (260, 225);
INSERT INTO Membership_has_Classes VALUES (261, 226);
INSERT INTO Membership_has_Classes VALUES (262, 227);
INSERT INTO Membership_has_Classes VALUES (263, 228);
INSERT INTO Membership_has_Classes VALUES (264, 229);




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
INSERT INTO Equipments VALUES (993, 'Rings', 28, 10); 
INSERT INTO Equipments VALUES (994, 'Cable Machine', 21, 3); 
INSERT INTO Equipments VALUES (995, 'Biceps Curl', 20, 6); 
INSERT INTO Equipments VALUES (996, 'Ab Crunch', 27, 5); 
INSERT INTO Equipments VALUES (997, 'Medicine Ball', 40, 3); 
INSERT INTO Equipments VALUES (998, 'Power Rack', 30, 9); 
INSERT INTO Equipments VALUES (999, 'Power Tower', 32, 8); 
INSERT INTO Equipments VALUES (1000, 'Olympic Bench', 28, 6); 
INSERT INTO Equipments VALUES (1001, 'Preacher Bench', 19, 4); 
INSERT INTO Equipments VALUES (1002, 'Tricep Machine', 46, 1); 
INSERT INTO Equipments VALUES (1003, 'Shoulder Machine', 34, 9); 
INSERT INTO Equipments VALUES (1004, 'Overhead Machine', 32, 6); 
INSERT INTO Equipments VALUES (1005, 'Lateral Machine', 40, 3); 
INSERT INTO Equipments VALUES (1006, 'Cable Row Machine', 27, 5);
INSERT INTO Equipments VALUES (1007, 'GHD Machine', 29, 6);
 

INSERT INTO Equipments_has_Classes VALUES (978, 201);
INSERT INTO Equipments_has_Classes VALUES (979, 202);
INSERT INTO Equipments_has_Classes VALUES (980, 203);
INSERT INTO Equipments_has_Classes VALUES (981, 204);
INSERT INTO Equipments_has_Classes VALUES (982, 205);
INSERT INTO Equipments_has_Classes VALUES (983, 206);
INSERT INTO Equipments_has_Classes VALUES (984, 207);
INSERT INTO Equipments_has_Classes VALUES (985, 208);
INSERT INTO Equipments_has_Classes VALUES (986, 209);
INSERT INTO Equipments_has_Classes VALUES (987, 210);
INSERT INTO Equipments_has_Classes VALUES (988, 211);
INSERT INTO Equipments_has_Classes VALUES (989, 212);
INSERT INTO Equipments_has_Classes VALUES (990, 213);
INSERT INTO Equipments_has_Classes VALUES (991, 214);
INSERT INTO Equipments_has_Classes VALUES (992, 215);
INSERT INTO Equipments_has_Classes VALUES (992, 216);
INSERT INTO Equipments_has_Classes VALUES (992, 217);
INSERT INTO Equipments_has_Classes VALUES (992, 218);
INSERT INTO Equipments_has_Classes VALUES (992, 219);
INSERT INTO Equipments_has_Classes VALUES (997, 220);
INSERT INTO Equipments_has_Classes VALUES (998, 221);
INSERT INTO Equipments_has_Classes VALUES (999, 222);
INSERT INTO Equipments_has_Classes VALUES (1000, 223);
INSERT INTO Equipments_has_Classes VALUES (1001, 224);
INSERT INTO Equipments_has_Classes VALUES (1002, 225);
INSERT INTO Equipments_has_Classes VALUES (1003, 226);
INSERT INTO Equipments_has_Classes VALUES (1004, 227);
INSERT INTO Equipments_has_Classes VALUES (1005, 228);
INSERT INTO Equipments_has_Classes VALUES (1006, 229);
INSERT INTO Equipments_has_Classes VALUES (978, 230);
INSERT INTO Equipments_has_Classes VALUES (978, 231);
INSERT INTO Equipments_has_Classes VALUES (978, 232);
INSERT INTO Equipments_has_Classes VALUES (1000, 233);
INSERT INTO Equipments_has_Classes VALUES (1000, 234);
INSERT INTO Equipments_has_Classes VALUES (992, 235);
INSERT INTO Equipments_has_Classes VALUES (991, 290);
INSERT INTO Equipments_has_Classes VALUES (991, 291);



#1 Equipment handled by each Trainer

create view v_equip_trainer as
SELECT equipments.Equipment_name,trainers.Trainer_name
FROM equipments
JOIN equipments_has_classes ON (equipments.Equipments_id=equipments_has_classes.Equipments_id)
join classes on(classes.Classes_id=equipments_has_classes.Classes_id)
join trainers on(trainers.Trainers_id=classes.Trainers_id);


#2 Total price of each equipments
create view v_total_equipments as 
SELECT Equipment_name,
sum(Total_quantity*cost) AS Equipment_total
FROM equipments group by Equipment_name;


#3 Get the customers that paid least membership
create view v_least_cost as 
select concat(y.First_Name,' ',y.Last_name) as cust_name, x.Date_Start, x.Rate
from  membership x join customer y on (x.Customer_id=y.Customer_id)
group by 1=(select
count(distinct Rate)
from membership it 
where x.Rate >= it.Rate);

#4 Return the count of female candidates trained by each Trainer
create view v_count_candidates as 
select trainers.trainer_name,count(customer.customer_id) as count_customer from ((trainers 
join membership on((trainers.Gym_id=membership.Gym_id)))
join customer on((customer.Customer_id=membership.Customer_id))) 
where (customer.Gender="Female") 
group by trainers.trainer_name;

#5 Finding the Employees who work at Fitness Center-
create view v_Employees as 
select Manager_name,gym_name,trainer_name from manager 
join gym on(manager.Gym_id=gym.Gym_id) 
and gym_name like "Fitness Center"  
join trainers on(trainers.gym_id=gym.Gym_id);


#6 Finding the trainer who uses Dumbell for training purpose-
select trainer_name from trainers where 
trainers_id in(select trainers_id from classes where 
Classes_id in(select Classes_id from equipments_has_classes where 
equipments_id in(select Equipments_id from equipments 
where Equipment_name like "Dumbbell")));


#7 List of managers names from the city of Baltimore
create view v_manager_city as 
select manager.manager_name,gym.City from manager 
join gym on(manager.gym_id=gym.Gym_id) 
where gym.city="Bltimore";

#8 Find the list of Customers whos membership expires by end of 2022
create view v_membership_expiry as 
select concat(First_Name,' ',Last_name) as cust_name from customer 
where Customer_id in(select Customer_id from membership where Expiry_date<"2022-12-30");


#9 Count the number of customers state-wise
CREATE VIEW v_Total_customers AS
select count(*)  as Total_customers, State from Customer as C 
JOIN membership as M ON (C.customer_id=M.customer_id) 
JOIN gym as G ON (G.gym_id=M.gym_id) 
GROUP BY state 
ORDER BY Total_customers DESC;


CREATE VIEW v_AVG_RATE_membership  AS
select avg(Rate) as Avg_rate ,City from membership 
right JOIN gym ON(membership.gym_id=gym.Gym_id) 
GROUP BY city;