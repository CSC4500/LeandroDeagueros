
DROP DATABASE IF EXISTS ASZ;
CREATE DATABASE ASZ;

-- select the database
USE ASZ;

-- create the tables

CREATE TABLE FIELD
(
  Field_ID          INT          NOT NULL,
  Location          VARCHAR(50)  NOT NULL,
  Capacity			INT          NULL,
  constraint		FIELD_PK	 PRIMARY KEY(Field_ID)
);

CREATE TABLE SPORTS
(
  Sport_ID	        INT          NOT NULL,
  Gender			VARCHAR(10)  NOT NULL,
  Age  				VARCHAR(10)  NOT NULL,
  constraint		SPORT_PK	 PRIMARY KEY(Sport_ID)
);



CREATE TABLE MANAGER
(
  Manager_ID        INT          NOT NULL,
  Team_ID           INT          NOT NULL,
  F_Name			VARCHAR(50)  NOT NULL,
  L_Name  			VARCHAR(50)  NOT NULL,
  constraint		MANAGER_PK	 PRIMARY KEY(Manager_ID)
);

CREATE TABLE TEAMS
(
  Team_ID			INT          NOT NULL,
  Sport_ID 			INT          NOT NULL,
  Manager_ID        INT          NOT NULL,
  constraint		TEAMS_PK	 PRIMARY KEY(Team_ID),
  constraint		MANAGER_FK	 FOREIGN KEY(Manager_ID)
						REFERENCES MANAGER(Manager_ID),
  constraint		SPORT_FK	 FOREIGN KEY(Sport_ID)
						REFERENCES SPORTS(Sport_ID)
);

CREATE TABLE PLAYER
(
  Player_ID         INT          NOT NULL,
  F_Name			VARCHAR(50)  NOT NULL,
  L_Name  			VARCHAR(50)  NOT NULL,
  Team_ID			INT 		 NOT NULL,
  Gender			VARCHAR(20)  NOT NULL,
  Position			VARCHAR(20)  NOT NULL,
  Jersey_Num		INT 		 NOT NULL,
  constraint		PLAYER_PK	 PRIMARY KEY(Player_ID),
  constraint		TEAMS_FK	 FOREIGN KEY(Team_ID)
						REFERENCES TEAMS(Team_ID)
);

CREATE TABLE MATCHES
(
  Match_ID 			INT          NOT NULL,
  Sport_ID          INT          NOT NULL,
  Field_ID			INT          NOT NULL,
  Match_Date		Date		 NOT NULL,
  Attendance		INT			 NOT NULL,
  Home_ID			INT          NOT NULL,
  Away_ID			INT          NOT NULL,
  constraint		MATCH_PK	 PRIMARY KEY(Match_ID),
  constraint		MSPORT_FK	 FOREIGN KEY(Sport_ID)
						REFERENCES SPORTS(Sport_ID),
  constraint		FIELD_FK	 FOREIGN KEY(Field_ID)
						REFERENCES FIELD(Field_ID),
  constraint		HOME_FK	 FOREIGN KEY(Home_ID)
						REFERENCES TEAMS(Team_ID),
  constraint		AWAY_FK	 FOREIGN KEY(Away_ID)
						REFERENCES TEAMS(Team_ID)
);

CREATE TABLE SCORE
(
  Score_ID          INT          NOT NULL,
  Match_ID          INT  		 NOT NULL,
  Player_ID			INT  		 NOT NULL,
  Team_ID  			INT  		 NOT NULL,
  Goals				INT  		 NOT NULL,
  Assists  			INT   		 NOT NULL,
  constraint		SCORE_PK	 PRIMARY KEY(Score_ID),
  constraint		MATCH_FK	 FOREIGN KEY(Match_ID)
						REFERENCES MATCHES(Match_ID),
  constraint		PLAYER_FK	 FOREIGN KEY(Player_ID)
						REFERENCES PLAYER(Player_ID),
  constraint		STEAMS_FK	 FOREIGN KEY(Team_ID)
						REFERENCES TEAMS(Team_ID)
);

CREATE TABLE RESULTS
(
  Match_ID          INT          NOT NULL,
  Home				VARCHAR(25)	 NOT NULL,
  Away				VARCHAR(25)  NOT NULL,
  constraint		RMATCH_FK	 FOREIGN KEY(Match_ID)
						REFERENCES MATCHES(Match_ID)
);

insert into FIELD (Field_ID, Location, Capacity) values (1, 'Chicago', 100000);
insert into FIELD (Field_ID, Location, Capacity) values (2, 'Naperville', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (3, 'Aurora', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (4, 'Joliet', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (5, 'Orland Park', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (6, 'Elgin', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (7, 'Romeoville', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (8, 'Bolingbrook', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (9, 'Wheaton', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (10, 'Oak Lawn', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (11, 'Niles', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (12, 'Lockport', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (13, 'Mokena', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (14, 'Shorewood', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (15, 'Plainfield', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (16, 'Lombard', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (17, 'Evanston', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (18, 'Cicero', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (19, 'Willowbrook', 10000);
insert into FIELD (Field_ID, Location, Capacity) values (20, 'Northbrook', 10000);

insert into SPORTS (Sport_ID, Gender, Age) values (1, 'M', 8);
insert into SPORTS (Sport_ID, Gender, Age) values (2, 'M', 9);
insert into SPORTS (Sport_ID, Gender, Age) values (3, 'M', 10);
insert into SPORTS (Sport_ID, Gender, Age) values (4, 'M', 11);
insert into SPORTS (Sport_ID, Gender, Age) values (5, 'M', 12);
insert into SPORTS (Sport_ID, Gender, Age) values (6, 'M', 13);
insert into SPORTS (Sport_ID, Gender, Age) values (7, 'M', 14);
insert into SPORTS (Sport_ID, Gender, Age) values (8, 'M', 15);
insert into SPORTS (Sport_ID, Gender, Age) values (9, 'M', 16);
insert into SPORTS (Sport_ID, Gender, Age) values (10, 'M', 17);
insert into SPORTS (Sport_ID, Gender, Age) values (11, 'F', 8);
insert into SPORTS (Sport_ID, Gender, Age) values (12, 'F', 9);
insert into SPORTS (Sport_ID, Gender, Age) values (13, 'F', 10);
insert into SPORTS (Sport_ID, Gender, Age) values (14, 'F', 11);
insert into SPORTS (Sport_ID, Gender, Age) values (15, 'F', 12);
insert into SPORTS (Sport_ID, Gender, Age) values (16, 'F', 13);
insert into SPORTS (Sport_ID, Gender, Age) values (17, 'F', 14);
insert into SPORTS (Sport_ID, Gender, Age) values (18, 'F', 15);
insert into SPORTS (Sport_ID, Gender, Age) values (19, 'F', 16);
insert into SPORTS (Sport_ID, Gender, Age) values (20, 'F', 17);

insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (1, 1, 'Elsa', 'Skocroft');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (2, 2, 'Row', 'Bartol');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (3, 3, 'Gretchen', 'Marczyk');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (4, 4, 'Isak', 'Aulsford');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (5, 5, 'Adriana', 'Lisciandri');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (6, 6, 'Barr', 'Downing');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (7, 7, 'Leonora', 'Cambden');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (8, 8, 'Torrey', 'Jessett');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (9, 9, 'Genna', 'Dewhirst');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (10, 10, 'Kelley', 'Staines');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (11, 11, 'Shalna', 'Kryszka');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (12, 12, 'Glynnis', 'Gook');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (13, 13, 'Shannah', 'Gilcriest');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (14, 14, 'Annmarie', 'Merriott');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (15, 15, 'Hale', 'Hedin');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (16, 16, 'Dru', 'Meeks');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (17, 17, 'Susie', 'Bravery');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (18, 18, 'Brose', 'Briance');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (19, 19, 'Jeth', 'Eyden');
insert into MANAGER (Manager_ID, Team_ID, F_Name, L_Name) values (20, 20, 'Douglas', 'Fawcett');

insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (1, 1, 1);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (2, 2, 2);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (3, 3, 3);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (4, 4, 4);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (5, 5, 5);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (6, 6, 6);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (7, 7, 7);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (8, 8, 8);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (9, 9, 9);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (10, 10, 10);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (11, 11, 11);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (12, 12, 12);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (13, 13, 13);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (14, 14, 14);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (15, 15, 15);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (16, 16, 16);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (17, 17, 17);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (18, 18, 18);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (19, 19, 19);
insert into TEAMS (Team_ID, Sport_ID, Manager_ID) values (20, 20, 20);

insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (1, 'Laure', 'Royston', 1, 'F', 'Luisa', 1);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (2, 'Becky', 'Brockest', 2, 'F', 'Lillian', 2);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (3, 'Shadow', 'Leask', 3, 'M', 'Porty', 3);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (4, 'Boycie', 'McSkeagan', 4, 'M', 'Dunn', 4);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (5, 'Blithe', 'Ridgers', 5, 'F', 'Phelia', 5);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (6, 'Nonie', 'Prue', 6, 'F', 'Philomena', 6);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (7, 'Derrick', 'Bletsoe', 7, 'M', 'Peterus', 7);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (8, 'Ambros', 'Waggett', 8, 'M', 'Hazel', 8);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (9, 'Andrej', 'Gibbieson', 9, 'M', 'Darryl', 9);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (10, 'Pamella', 'Kincade', 10, 'F', 'Blondy', 10);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (11, 'Riobard', 'Strowther', 11, 'M', 'Carlin', 11);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (12, 'Rosaline', 'Ransom', 12, 'F', 'Paolina', 12);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (13, 'Elsbeth', 'Moan', 13, 'F', 'Gaylene', 13);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (14, 'Blondell', 'Macura', 14, 'F', 'Delly', 14);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (15, 'Maible', 'Abbotson', 15, 'F', 'Gnni', 15);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (16, 'Peyter', 'Ambrosio', 16, 'M', 'Bogey', 16);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (17, 'Ritchie', 'Seide', 17, 'M', 'Vern', 17);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (18, 'Netti', 'Bouldon', 18, 'F', 'Verla', 18);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (19, 'Kat', 'McPake', 19, 'F', 'Rebbecca', 19);
insert into PLAYER (Player_ID, F_Name, L_Name, Team_ID, Gender, Position, Jersey_Num) values (20, 'Oswald', 'Dmych', 20, 'M', 'Winston', 20);

insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (1, 1, 1, '2021/9/17', 10000, 1, 1);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (2, 2, 2, '2021/9/7', 10000, 2, 2);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (3, 3, 3, '2021/2/15', 10000, 3, 3);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (4, 4, 4, '2021/10/2', 10000, 4, 4);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (5, 5, 5, '2021/9/27', 10000, 5, 5);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (6, 6, 6, '2021/9/27', 10000, 6, 6);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (7, 7, 7, '2021/9/27', 10000, 7, 7);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (8, 8, 8, '2021/9/27', 10000, 8, 8);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (9, 9, 9, '2021/9/27', 10000, 9, 9);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (10, 10, 10, '2021/9/27', 10000, 10, 10);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (11, 11, 11, '2021/9/27', 10000, 11, 11);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (12, 12, 12, '2021/9/27', 10000, 12, 12);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (13, 13, 13, '2021/9/27', 10000, 13, 13);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (14, 14, 14, '2021/9/27', 10000, 14, 14);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (15, 15, 15, '2021/9/27', 10000, 15, 15);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (16, 16, 16, '2021/9/27', 10000, 16, 16);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (17, 17, 17, '2021/9/27', 10000, 17, 17);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (18, 18, 18, '2021/9/27', 10000, 18, 18);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (19, 19, 19, '2021/9/27', 10000, 19, 19);
insert into MATCHES (Match_ID, Sport_ID, Field_ID, Match_Date, Attendance, Home_ID, Away_ID) values (20, 20, 20, '2021/9/27', 10000, 20, 20);

insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (1, 1, 1, 1, 10, 10);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (2, 2, 2, 2, 20, 20);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (3, 3, 3, 3, 30, 30);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (4, 4, 4, 4, 40, 40);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (5, 5, 5, 5, 50, 50);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (6, 6, 6, 6, 60, 60);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (7, 7, 7, 7, 70, 70);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (8, 8, 8, 8, 80, 80);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (9, 9, 9, 9, 90, 90);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (10, 10, 10, 10, 10, 10);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (11, 11, 11, 11, 11, 11);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (12, 12, 12, 12, 12, 12);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (13, 13, 13, 13, 13, 13);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (14, 14, 14, 14, 14, 14);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (15, 15, 15, 15, 15, 15);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (16, 16, 16, 16, 16, 16);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (17, 17, 17, 17, 17, 17);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (18, 18, 18, 18, 18, 18);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (19, 19, 19, 19, 19, 19);
insert into SCORE (Score_ID, Match_ID, Player_ID, Team_ID, Goals, Assists) values (20, 20, 20, 20, 20, 20);

insert into RESULTS (Match_ID, Home, Away) values (1, 1, 1);
insert into RESULTS (Match_ID, Home, Away) values (2, 2, 2);
insert into RESULTS (Match_ID, Home, Away) values (3, 3, 3);
insert into RESULTS (Match_ID, Home, Away) values (4, 4, 4);
insert into RESULTS (Match_ID, Home, Away) values (5, 5, 5);
insert into RESULTS (Match_ID, Home, Away) values (6, 6, 6);
insert into RESULTS (Match_ID, Home, Away) values (7, 7, 7);
insert into RESULTS (Match_ID, Home, Away) values (8, 8, 8);
insert into RESULTS (Match_ID, Home, Away) values (9, 9, 9);
insert into RESULTS (Match_ID, Home, Away) values (10, 1, 1);
insert into RESULTS (Match_ID, Home, Away) values (11, 1, 1);
insert into RESULTS (Match_ID, Home, Away) values (12, 1, 2);
insert into RESULTS (Match_ID, Home, Away) values (13, 1, 3);
insert into RESULTS (Match_ID, Home, Away) values (14, 1, 4);
insert into RESULTS (Match_ID, Home, Away) values (15, 5, 5);
insert into RESULTS (Match_ID, Home, Away) values (16, 6, 1);
insert into RESULTS (Match_ID, Home, Away) values (17, 7, 1);
insert into RESULTS (Match_ID, Home, Away) values (18, 8, 1);
insert into RESULTS (Match_ID, Home, Away) values (19, 9, 1);
insert into RESULTS (Match_ID, Home, Away) values (20, 2, 2);
