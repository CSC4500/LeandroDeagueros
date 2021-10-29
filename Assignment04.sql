
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
