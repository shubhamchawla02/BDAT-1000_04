--Task 1 Create Database

--CREATE DATABASE Assignment_1;
USE Assignment_1; --To get into database Assignment_1 from master

--Task 2 Create table
drop table StudentDetails;
CREATE TABLE StudentDetails
(
	Name varchar (200) NOT NULL,
	Hated_Apps char (50),
	Dream_Destination varchar (100),
	Sports char (50),
	Cuisines varchar (150) NOT NULL,
	SuperPower_ULike varchar (200),
	Most_Hated_Lec_time time NOT NULL,
	Dream_Job varchar (100),
	Date_Of_Acceptance date NOT NULL ,
	Things_AfraidOf varchar (100) NULL,
	Pets char (50),
	Hobbies varchar (200),
	Allergies varchar (150),
	Unwanted_habits varchar (150), 
	Last_Thing_Before_Dying varchar (200),
);

--Task 3 Insert all data from excel file into Assignment_1 database

INSERT INTO StudentDetails
(Name, Hated_Apps, Dream_Destination, Sports, Cuisines, SuperPower_ULike, Most_Hated_Lec_time, Dream_Job, Date_Of_Acceptance, Things_AfraidOf, Pets, Hobbies, Allergies, Unwanted_habits, Last_Thing_Before_Dying)
VALUES 
('Chris','Touchnet 360u','Disney Land','Boxing','Chinese Seafood Fried rice','Late night reader','19:00','Data Scientist','2021-11-28','Afraid of heights','Dog','Driving','NA','Procrastination','Travel to space'),
('Israel','Teams','Florida','Basketball','Fried rice','Control time','20:00','Data Solution Architect','2021-12-13','Constant pressure','Dog','Travelling','NA','Get more sleep','Spend time with love ones'),
('Dipen','News Website,Tiktok','California ','Cricket','Indian ','Teleporting','15:00','Business owner ','2021-08-11','Waves of Sea ','Dog','Driving, Road Tripping','Weather , Exessive Sneezing','Watching Youtube videos','Drive a  Car'),
('Roopa','Tiktok','US','Chess','Indian ','Wonder woman','10:00','Data Scientist','2021-08-01','All animals','NA','Driving','NA','Sleep','Family'),
('Jainil','Apple News','Spain','Tennis','Indian','Invinsibility','10:00','Data Scientist','2021-08-05','Failure','Cats, Dogs','Play tennis','NA','Procrastination','Have my favorite meal'),
('Jay Munjani','Webex','Hawai','Kabbadi','Indian','No sleeping','17:00','Startup','2021-08-15','Bed bugs','Cow','Knowledge sharing & travelling','NA','Not taking enough rest','Doing garba'),
('Harshdeep','Facebook','New York','Volleyball','North Indian','Time travel','17:00','Data Analyst','2021-05-01','Not Trying','NA','Any Physical Exercise ','NA','Procrastination','Spend time with family'),
('Ricky','Twitter','Rio','Cricket','Indian','Fly','10:00','Startup','2021-08-26','Short Deadlines','Dog','Long walks','Egg','Too much sleeping','Family'),
('Himanshu','MobiKwik','California ','Cricket','Indian ','Once that Flash had','10:00','Google','2021-08-04','Height','Dog','Songs','Medicines','Smoking','Enjoy my beer'),
('Nirali','Tiktok','Europe','Badminton','Indian ','Mind reading','10:00','Startup','2021-08-05','Darkness','NA','Cooking, Travelling','NA','Laziness','Family hug'),
('Shivansh','Georgian Assist','Italy','Chess','Indian ','Mind Control','17:00','Data Scientist','2022-09-21','Ghost','NA','Music, Netflix','NA','Procrastination','Sky Dive'),
('Jerin','Tiktok','Venice','Football','Indian ','Thors hammer please','1:30','Data Analyst','2021-10-12','NA','Dog','Playing Football','NA','Irregular food habits','Have A Drink with my dad'),
('Anjali Salvin','NA','Paris, South Korea','Badminton','Indian, Western','Mind reading','12:00','Job that makes me happy','2021-07-27','Snakes','NA','Hangout with Friends, Watch kdramas series','Glitter powder','Sleep duration, laziness','Get together with my loved ones'),
('Bishal Bhatta','Pubg','Switzerland','Tennis','Nepalese','NA','4:00','Python Developer','2021-12-01','Height','Dog','Sketching','Lady finger','Saying yes to everyone','Climbing Mount everest'),
('Sharon HC','NA','Egypt','Swim','Japanese','Electricity','10:00','StatCan','2021-11-01','Height','Dog','Music','Gluten, Dust, Lactose, Soy','Sleep','Family'),
('Isha Gupta','Microsoft Teams','Europe','Cricket','Chinese','Magic','10:00','Data Architecture','2021-09-01','Height','Dog','Sky diving,  Scuba diving, Bungee jumping','NA','To get more sleep','Sky diving'),
('James','Arlo','Australia','Rugby','Indian ','Slow Time','19:00','Entrepeneur','2022-09-21','Always succeeding','Dog','Technology','Vinegar','Not exercising','Kiss my kids'),
('Akash Kumar','Pubg','United Kingdom','Cricket','Indian ','Invinsibility','10:00','Data Analyst','2021-08-01','Weight Losing','Rabbits','Travelling','NA','Short Temper','Enjoy with family'),
('Opeoluwa','NA','Space','Ping Pong','Nigerian','Teleporting','15:00','Data Analyst/Python Developer','2021-10-21','Large Body of Water','NA','NA','NA','NA','NA');

--Normalization Process
----Adding a Primary key to the table - StudentID
ALTER TABLE StudentDetails
ADD StudentID int IDENTITY(1,1)
-- Making this column a PRIMARY KEY
ALTER TABLE StudentDetails
ADD CONSTRAINT PK_StudentDetails PRIMARY KEY(StudentID)


-- Split Name into Fname and LName, using space as a delimiter, create new table with Fname and Lname as new columns 
--instead of Name column and transfer remaining data from StudentDetails to the new table StudentDetails_1
--drop table StudentDetails_1
CREATE TABLE StudentDetails_1
(
	StudentID int NOT NULL PRIMARY KEY,
	Fname varchar (100) NOT NULL,
	Lname varchar (100),
	Hated_Apps char (50) NULL,
	Dream_Destination varchar (100),
	Sports char (50),
	Cuisines varchar (150) NOT NULL,
	SuperPower_ULike varchar (200),
	Most_Hated_Lec_time time NOT NULL,
	Dream_Job varchar (100),
	Date_Of_Acceptance date NOT NULL ,
	Things_AfraidOf varchar (100) NULL,
	Pets char (50),
	Hobbies varchar (200) NULL,
	Allergies varchar (150),
	Unwanted_habits varchar (150) NULL, 
	Last_Thing_Before_Dying varchar (200) NULL,
);
-- data transfer ( Split column: https://www.mssqltips.com/sqlservertip/6321/split-delimited-string-into-columns-in-sql-server-with-parsename/ )
INSERT INTO StudentDetails_1
(StudentID,FName,LName, Hated_Apps, Dream_Destination, Sports, Cuisines, SuperPower_ULike, Most_Hated_Lec_time, Dream_Job, Date_Of_Acceptance, Things_AfraidOf, Pets, Hobbies, Allergies, Unwanted_habits, Last_Thing_Before_Dying)
SELECT StudentID,
REVERSE(PARSENAME(REPLACE(REVERSE(NAME), ' ', '.'), 1)) AS [FName],
REVERSE(PARSENAME(REPLACE(REVERSE(NAME), ' ', '.'), 2)) AS [LName],
Hated_Apps,Dream_Destination,Sports,Cuisines,SuperPower_ULike,Most_Hated_Lec_time,Dream_Job,Date_Of_Acceptance,Things_AfraidOf,Pets,Hobbies,Allergies,Unwanted_habits,Last_Thing_Before_Dying
FROM StudentDetails

-- Removing Multi Value attributes and redundancy from table StudentDetails_1
-----------------------------------------------------------------------------------------------------------------------------------------------
-- Create table Sports
--drop table Sports;
CREATE TABLE Sports(
    SID int IDENTITY(1,1) PRIMARY KEY,
	Sports varchar (150) UNIQUE
);
-- Create table MappingSports
--drop table MappingSports;
CREATE TABLE MappingSports
(
	MSID int IDENTITY(100,1) PRIMARY KEY,
	StudentID int FOREIGN KEY REFERENCES StudentDetails_1(StudentID),
	SID int FOREIGN KEY REFERENCES Sports(SID)
);
-- Insert values in Sports Table
INSERT INTO Sports(Sports)
VALUES ('Boxing'),('Basketball'),('Cricket'),('Chess'),('Tennis'),('Kabbadi'),('Volleyball'),('Badminton'),('Football'),('Swim'),('Rugby'),('Ping Pong');

-- Insert values in MappingSports Table
INSERT INTO MappingSports (StudentID,SID)
SELECT StudentID, SID
FROM StudentDetails_1 JOIN Sports ON StudentDetails_1.Sports=Sports.Sports

-- Modify StudentDetails_1 table, remove 'Sports' Column
ALTER TABLE StudentDetails_1
DROP COLUMN Sports;
-----------------------------------------------------------------------------------------------------------------------------------------------
-- Create table Hated_Lec_Time
--drop table Hated_Lec_Time;
CREATE TABLE Hated_Lec_Time(
    TID int IDENTITY(1,1) PRIMARY KEY,
	Lec_Time time UNIQUE
);
-- Create table MappingTime
--drop table MappingTime;
CREATE TABLE MappingTime
(
	MTID int IDENTITY(100,1) PRIMARY KEY,
	StudentID int FOREIGN KEY REFERENCES StudentDetails_1(StudentID),
	TID int FOREIGN KEY REFERENCES Hated_Lec_Time(TID)
);

-- Insert values in Hated_Lec_Time Table
INSERT INTO Hated_Lec_Time(Lec_Time)
VALUES ('19:00'),('20:00'),('15:00'),('10:00'),('17:00'),('1:30'),('12:00'),('4:00');

-- Insert values in MappingTime Table
INSERT INTO MappingTime (StudentID,TID)
SELECT StudentID, TID
FROM StudentDetails_1 JOIN Hated_Lec_Time ON StudentDetails_1.Most_Hated_Lec_time=Hated_Lec_Time.Lec_Time

-- Modify StudentDetails_1 table, remove 'Most_Hated_Lec_Time' Column
ALTER TABLE StudentDetails_1
DROP COLUMN Most_Hated_Lec_Time;
-----------------------------------------------------------------------------------------------------------------------------------------------
-- Create table SuperPower
--drop table SuperPower;
CREATE TABLE SuperPower(
    SPID int IDENTITY(1,1) PRIMARY KEY,
	SuperPower varchar (200) UNIQUE
);
-- Create table MappingSuperPower 
--drop table MappingSuperPower;
CREATE TABLE MappingSuperPower
(
	MSPID int IDENTITY(100,1) PRIMARY KEY,
	StudentID int FOREIGN KEY REFERENCES StudentDetails_1(StudentID),
	SPID int FOREIGN KEY REFERENCES SuperPower(SPID)
);

-- Insert values in SuperPower Table
INSERT INTO SuperPower(SuperPower)
VALUES ('Late night reader'),('Control time'),('Teleporting'),('Wonder woman'),('Invinsibility'),('No sleeping'),('Time travel'),('Fly'),('Once that Flash had'),('Mind reading'),
('Mind Control'),('Thors hammer please'),('NA'),('Electricity'),('Magic'),('Slow Time');

-- Insert values in MappingSuperPower Table
INSERT INTO MappingSuperPower (StudentID,SPID)
SELECT StudentID, SPID
FROM StudentDetails_1 JOIN SuperPower ON StudentDetails_1.SuperPower_ULike=SuperPower.SuperPower

-- Modify StudentDetails_1 table, remove 'SuperPower_'ULike Column
ALTER TABLE StudentDetails_1
DROP COLUMN SuperPower_ULike;
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Create table Dream_Destination
--drop table Dream_Destination;
CREATE TABLE Dream_Destination(
    DID int IDENTITY(1,1) PRIMARY KEY,
	Dream_Destination varchar (100) UNIQUE
);
-- Create table MappingDestination
--drop table MappingDestination;
CREATE TABLE MappingDestination
(
	MDID int IDENTITY(100,1) PRIMARY KEY,
	StudentID int FOREIGN KEY REFERENCES StudentDetails_1(StudentID),
	DID int FOREIGN KEY REFERENCES Dream_Destination(DID)
);

-- Insert values in Dream_Destination Table
INSERT INTO Dream_Destination(Dream_Destination)
VALUES ('Disney Land'),('Florida'),('US'),('Spain'),('Hawai'),('New York'),
('Rio'),('California '),('Italy'),('Venice'),('Paris, South Korea'),('Switzerland'),('Egypt'),('Europe'),('Australia'),('United Kingdom'),('Space');

-- Insert values in MappingDestination Table
INSERT INTO MappingDestination (StudentID,DID)
SELECT StudentID, DID
FROM StudentDetails_1 JOIN Dream_Destination ON StudentDetails_1.Dream_Destination=Dream_Destination.Dream_Destination

-- Modify StudentDetails_1 table, remove Dream_Destination column
ALTER TABLE StudentDetails_1
DROP COLUMN Dream_Destination;
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Create table Dream_Job
--drop table Dream_Job;
CREATE TABLE Dream_Job(
    JID int IDENTITY(1,1) PRIMARY KEY,
	Dream_Job varchar (100) UNIQUE
);
-- Create table MappingJob
--drop table MappingJob;
CREATE TABLE MappingJob
(
	MJID int IDENTITY(100,1) PRIMARY KEY,
	StudentID int FOREIGN KEY REFERENCES StudentDetails_1(StudentID),
	JID int FOREIGN KEY REFERENCES Dream_Job(JID)
);

-- Insert values in Dream_Job Table
INSERT INTO Dream_Job(Dream_Job)
VALUES ('Data Scientist'),('Data Solution Architect'),('Business owner '),('Startup'),('Data Analyst'),('Google'),
('Job that makes me happy'),('Python Developer'),('StatCan'),('Data Architecture'),('Entrepeneur'),('Data Analyst/Python Developer');

-- Insert values in MappingJob Table
INSERT INTO MappingJob (StudentID,JID)
SELECT StudentID, JID
FROM StudentDetails_1 JOIN Dream_Job ON StudentDetails_1.Dream_Job=Dream_Job.Dream_Job

-- Modify StudentDetails_1 table, remove Dream_Job column
ALTER TABLE StudentDetails_1
DROP COLUMN Dream_Job;
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Create table Things_AfraidOf
--drop table Things_AfraidOf;
CREATE TABLE Things_AfraidOf(
    Things_ID int IDENTITY(1,1) PRIMARY KEY,
	Things_AfraidOf varchar (100) UNIQUE
);
-- Create table MappingThings_AfraidOf
--drop table MappingThings_AfraidOf;
CREATE TABLE MappingThings_AfraidOf
(
	MTAOID int IDENTITY(100,1) PRIMARY KEY,
	StudentID int FOREIGN KEY REFERENCES StudentDetails_1(StudentID),
	Things_ID int FOREIGN KEY REFERENCES Things_AfraidOf(Things_ID)
);

-- Insert values in Things_AfraidOf Table
INSERT INTO Things_AfraidOf(Things_AfraidOf)
VALUES ('Height'),('Constant pressure'),('Waves of Sea '),('All animals'),('Failure'),('Bed bugs'),('Not Trying'),('Short Deadlines'),
('Darkness'),('Ghost'),('NA'),('Snakes'),('Always succeeding'),('Weight Losing'),('Large Body of Water');

-- Insert values in MappingThings_AfraidOf Table
INSERT INTO MappingThings_AfraidOf (StudentID,Things_ID)
SELECT StudentID, Things_ID
FROM StudentDetails_1 JOIN Things_AfraidOf ON StudentDetails_1.Things_AfraidOf=Things_AfraidOf.Things_AfraidOf

-- Modify StudentDetails_1 table, remove Things_AfraidOf column
ALTER TABLE StudentDetails_1
DROP COLUMN Things_AfraidOf;
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Create table Pets
--drop table Pets;
CREATE TABLE Pets(
    Pets_ID int IDENTITY(1,1) PRIMARY KEY,
	Pets char (50) UNIQUE
);
-- Create table MappingPets
--drop table MappingPets;
CREATE TABLE MappingPets
(
	MPetsID int IDENTITY(100,1) PRIMARY KEY,
	StudentID int FOREIGN KEY REFERENCES StudentDetails_1(StudentID),
	Pets_ID int FOREIGN KEY REFERENCES Pets(Pets_ID)
);
-- Insert values in Pets Table
INSERT INTO Pets(Pets)
VALUES ('Dog'),('Cats, Dogs'),('Cow'),('Rabbits'),('NA');

-- Insert values in MappingPets Table
INSERT INTO MappingPets (StudentID,Pets_ID)
SELECT StudentID, Pets_ID
FROM StudentDetails_1 JOIN Pets ON StudentDetails_1.Pets=Pets.Pets

-- Modify StudentDetails_1 table, remove Pets column
ALTER TABLE StudentDetails_1
DROP COLUMN Pets;
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Create table Unwanted_Habits
--drop table Unwanted_Habits;
CREATE TABLE Unwanted_Habits(
    Habit_ID int IDENTITY(1,1) PRIMARY KEY,
	Unwanted_habits varchar (150) UNIQUE
);
-- Create table MappingHabits
--drop table MappingHabits;
CREATE TABLE MappingHabits
(
	MHabit_ID int IDENTITY(100,1) PRIMARY KEY,
	StudentID int FOREIGN KEY REFERENCES StudentDetails_1(StudentID),
	Habit_ID int FOREIGN KEY REFERENCES Unwanted_Habits(Habit_ID)
);
-- Insert values in Unwanted_Habits Table
INSERT INTO Unwanted_Habits(Unwanted_habits)
VALUES ('Procrastination'),('Sleep'),('Watching Youtube videos'),('Not taking enough rest'),('Smoking'),('Laziness'),('Irregular food habits'),
('Saying yes to everyone'),('Not exercising'),('Short Temper'),('NA');

-- Insert values in MappingHabits Table
INSERT INTO MappingHabits (StudentID,Habit_ID)
SELECT StudentID, Habit_ID
FROM StudentDetails_1 JOIN Unwanted_Habits ON StudentDetails_1.Unwanted_habits=Unwanted_Habits.Unwanted_habits

-- Modify StudentDetails_1 table, remove Unwanted_Habits column
ALTER TABLE StudentDetails_1
DROP COLUMN Unwanted_habits;
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Create table DateOfAcceptance
--drop table DateOfAcceptance;
CREATE TABLE DateOfAcceptance(
    DOA_ID int IDENTITY(1,1) PRIMARY KEY,
	DOA date UNIQUE
);
-- Create table MappingDateOfAcceptance
--drop table MappingDateOfAcceptance;
CREATE TABLE MappingDateOfAcceptance
(
	MDOA_ID int IDENTITY(100,1) PRIMARY KEY,
	StudentID int FOREIGN KEY REFERENCES StudentDetails_1(StudentID),
	DOA_ID int FOREIGN KEY REFERENCES DateOfAcceptance(DOA_ID)
);

-- Insert values in DateOfAcceptance Table
INSERT INTO DOA(DOA)
VALUES ('2021-11-28'),('2021-12-13'),('2021-08-11'),('2021-08-01'),('2021-08-15'),('2021-05-01'),('2021-08-26'),
('2021-08-04'),('2021-08-05'),('2021-10-12'),('2021-07-27'),('2021-12-01'),('2021-11-01'),('2021-09-01'),('2021-09-21'),('2021-10-21')

-- Insert values in MappingDateOfAcceptance Table
INSERT INTO MappingDateOfAcceptance (StudentID,DOA_ID)
SELECT StudentID, DOA_ID
FROM StudentDetails_1 JOIN DOA ON StudentDetails_1.Date_Of_Acceptance=DOA.DOA

-- Modify StudentDetails_1 table, remove Date_Of_Acceptance column
ALTER TABLE StudentDetails_1
DROP COLUMN Date_Of_Acceptance;
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Create table Last_Thing_Before_Dying -(Last_Thing_Before_Dying  table)
--drop table Last_Thing_Before_Dying;
CREATE TABLE Last_Thing_Before_Dying (
    LTBD_ID int IDENTITY(1,1) PRIMARY KEY,
	Last_Thing_Before_Dying varchar(200) UNIQUE
);
-- Create table MappingLTBD
--drop table MappingLTBD;
CREATE TABLE MappingLTBD
(
	MLTBD_ID int IDENTITY(100,1) PRIMARY KEY,
	StudentID int FOREIGN KEY REFERENCES StudentDetails_1(StudentID),
	LTBD_ID int FOREIGN KEY REFERENCES Last_Thing_Before_Dying(LTBD_ID)
);
-- Insert values in Last_Thing_Before_Dying  Table
INSERT INTO Last_Thing_Before_Dying (Last_Thing_Before_Dying )
VALUES ('Travel to space'),('Spend time with love ones'),('Drive a  Car'),('Family'),('Have my favorite meal'),('Doing garba'),('Enjoy my beer'),('Sky Diving'),
('Have A Drink with my dad'),('Climbing Mount everest'),('Kiss my kids'),('NA');

-- Insert values in MappingLTBD Table
INSERT INTO MappingLTBD (StudentID,LTBD_ID)
SELECT StudentID, LTBD_ID
FROM StudentDetails_1 JOIN Last_Thing_Before_Dying ON StudentDetails_1.Last_Thing_Before_Dying=Last_Thing_Before_Dying.Last_Thing_Before_Dying

-- Modify StudentDetails_1 table, remove Last_Thing_Before_Dying  column
ALTER TABLE StudentDetails_1
DROP COLUMN Last_Thing_Before_Dying;
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Creating table Hated_Apps
--drop TABLE Hated_Apps;
CREATE TABLE Hated_Apps
(
    AppID int IDENTITY(1,1) PRIMARY KEY,
	HApps char (50) UNIQUE 
);
-- Creating table MappingApps
--drop table MappingApps
CREATE TABLE MappingApps
(
	MID int IDENTITY(100,1) PRIMARY KEY,
	StudentID int FOREIGN KEY REFERENCES StudentDetails_1(StudentID),
	AppID int FOREIGN KEY REFERENCES Hated_Apps(AppID)
);
-- Inserting values in Hated_Apps Table
INSERT INTO Hated_Apps (HApps)
VALUES 
('Touchnet 360u'),('Teams'),('News Website'),('Tiktok'),('Apple News'),('Webex'),('Facebook'),('Twitter'),
('MobiKwik'),('Georgian Assist'),('NA'),('Pubg'),('Arlo');
-- Inserting values in MappingApps Table
INSERT INTO MappingApps (StudentID, AppID)
SELECT StudentID,AppID 
FROM StudentDetails_1 JOIN Hated_Apps ON StudentDetails_1.Hated_Apps = Hated_Apps.HApps
-- Modify StudentDetails_1 table, remove 'Hated_Apps' Column
ALTER TABLE StudentDetails_1
DROP COLUMN Hated_Apps;
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Create table Cuisine
--drop table Cuisine;
CREATE TABLE Cuisine(
    CID int IDENTITY(1,1) PRIMARY KEY,
	Cuisines varchar (150) UNIQUE
);
-- Create table MappingCuisines
--drop table MappingCuisines;
CREATE TABLE MappingCuisines
(
	MCID int IDENTITY(100,1) PRIMARY KEY,
	StudentID int FOREIGN KEY REFERENCES StudentDetails_1(StudentID),
	CID int FOREIGN KEY REFERENCES Cuisine(CID)
);
-- Insert values in Cuisine Table
INSERT INTO Cuisine (Cuisines)
VALUES ('Chinese'),('Seafood'),('Fried rice'),('Indian '),('North Indian'),('Western'),('Nepalese'),('Japanese'),('Nigerian');

-- Insert values in MappingCuisines Table
INSERT INTO MappingCuisines (StudentID,CID)
SELECT StudentID, CID
FROM StudentDetails_1 JOIN Cuisine ON StudentDetails_1.Cuisines=Cuisine.Cuisines

-- Modify StudentDetails_1 table, remove 'Cuisines' Column
ALTER TABLE StudentDetails_1
DROP COLUMN Cuisines;
-----------------------------------------------------------------------------------------------------------------------------------------------

--Create table Hobbies
--drop table Hobbies;
CREATE TABLE Hobbies(
    Hobby_ID int IDENTITY(1,1) PRIMARY KEY,
	Hobbies varchar (200) UNIQUE
);
-- Create table MappingHobbies
--drop table MappingHobbies;
CREATE TABLE MappingHobbies
(
	MHobbyID int IDENTITY(100,1) PRIMARY KEY,
	StudentID int FOREIGN KEY REFERENCES StudentDetails_1(StudentID),
	Hobby_ID int FOREIGN KEY REFERENCES Hobbies(Hobby_ID)
);
-- Insert values in Hobbies Table
INSERT INTO Hobbies(Hobbies)
VALUES ('Driving'),('Travelling'),('Road Tripping'),('Play tennis'),('Knowledge sharing & travelling'),('Any Physical Exercise '),('Long walks'),('Songs'),('Cooking'),('Netflix'),
('Playing Football'),('Hangout with Friends'),('Watch kdramas series'),('Sketching'),('Music'),
('Sky diving'),('Scuba diving'),('Bungee jumping'),('Technology'),('NA');

-- Insert values in MappingHobbies Table
INSERT INTO MappingHobbies (StudentID,Hobby_ID)
SELECT StudentID, Hobby_ID
FROM StudentDetails_1 JOIN Hobbies ON StudentDetails_1.Hobbies=Hobbies.Hobbies

-- Modify StudentDetails_1 table, remove Hobbies column
ALTER TABLE StudentDetails_1
DROP COLUMN Hobbies;
------------------------------------------------------------------------------------------------------------------------------------------------

--Create table Allergies
--drop table Allergies;
CREATE TABLE Allergies(
    Allergy_ID int IDENTITY(1,1) PRIMARY KEY,
	Allergies varchar (50) UNIQUE
);
-- Create table MappingAllergies
--drop table MappingAllergies;
CREATE TABLE MappingAllergies
(
	MAllergyID int IDENTITY(100,1) PRIMARY KEY,
	StudentID int FOREIGN KEY REFERENCES StudentDetails_1(StudentID),
	Allergy_ID int FOREIGN KEY REFERENCES Allergies(Allergy_ID)
);
-- Insert values in Allergies Table
INSERT INTO Allergies(Allergies)
VALUES ('Weather'),('Exessive Sneezing'),('NA'),('Egg'),('Medicines'),('Glitter powder'),('Lady finger'),('Gluten'),('Dust'), ('Lactose'), ('Soy'),('Vinegar');

-- Insert values in MappingAllergies Table
INSERT INTO MappingAllergies (StudentID,Allergy_ID)
SELECT StudentID, Allergy_ID
FROM StudentDetails_1 JOIN Allergies ON StudentDetails_1.Allergies=Allergies.Allergies

-- Modify StudentDetails_1 table, remove Allergies column
ALTER TABLE StudentDetails_1
DROP COLUMN Allergies;
-----------------------------------------------------------------------------------------------------------------------------------------------

--Some Queries to check database and table connections
--Count Students who like Indian Food
SELECT Cuisines,COUNT(StudentDetails_1.StudentID) AS 'Students'
FROM StudentDetails_1 JOIN MappingCuisines ON MappingCuisines.StudentID = StudentDetails_1.StudentID JOIN Cuisine ON Cuisine.CID = MappingCuisines.CID
WHERE Cuisines = 'Indian'
GROUP BY Cuisines

--Students who like to drive
SELECT StudentDetails_1.StudentID,Fname,Hobbies
FROM StudentDetails_1 JOIN MappingHobbies ON MappingHobbies.StudentID = StudentDetails_1.StudentID JOIN Hobbies ON Hobbies.Hobby_ID = MappingHobbies.Hobby_ID
WHERE Hobbies = 'Driving'

--Count No. of students who have their dream job as Data Analyst
SELECT Dream_Job,COUNT(StudentDetails_1.StudentID) AS 'No Of Students'
FROM StudentDetails_1 JOIN MappingJob ON StudentDetails_1.StudentID = MappingJob.StudentID JOIN Dream_Job ON MappingJob.JID = Dream_Job.JID
WHERE Dream_Job = 'Data Analyst'
GROUP BY Dream_Job

--Count Students who prefer to take lecture before 12pm
SELECT Lec_Time,COUNT(StudentDetails_1.StudentID) AS 'Students Who like to take lecture before 12pm'
FROM StudentDetails_1 JOIN MappingTime ON MappingTime.StudentID = StudentDetails_1.StudentID JOIN Hated_Lec_Time ON Hated_Lec_Time.TID = MappingTime.TID
WHERE Lec_Time < '12:00'
GROUP BY Lec_Time

--Find all student names who hate the app Tiktok
SELECT Fname, HApps
FROM StudentDetails_1 JOIN MappingApps ON StudentDetails_1.StudentID = MappingApps.StudentID JOIN Hated_Apps ON MappingApps.AppID = Hated_Apps.AppID
WHERE HApps = 'Tiktok'







































































