create database CHESS_TOURNAMENT;

create table players(
player_id int not null auto_increment , 
first_name varchar (20) not null,
last_name varchar (20)not null,
email varchar (50),
age int,
primary key (player_id)
);
insert into players (first_name, last_name, email, age)
values
("Vitaliy", "Johnson", "dwayne_rock_johnson@gmailcom", 41),
("Joe", "Biden", "Joe_Biden_123@gmail.com",56),
("Jeff", "Bezos", "Jeff_Amazon_Bezos@gmail.com", 43),
("Bill", "Gates", "Bill_WIN_95_Gates@gmail.com", 64),
("Kylie", "Jenner", "Kylie_Pretty_Jenner@gmail.com",23),
("Robert","Downey Jr.","Iron_Downey_Jr@gmail.com", 49),
("Cristiano","Ronaldo","	Cristiano_The_Goal@gmail.com",	36),
("Barack"	,"Obama","Barack_Obama_009@gmail.com",58),
("Justin","Beiber","Justin_969_Beiber@gmail.com",	22),
("Taylor","Swift","Taylor_Sign_a_Song_Swift@gmail.com",30),
("John","Snow", null, 31),
("Peter", "Parker",null,21);


create table games(
  game_id int not null auto_increment,
  first_player_id int,
  second_player_id int,
  primary key ( game_id)
  );

insert into games (first_player_id, second_player_id)
values
(3,6),
(2,1),
(5,5),
(4,8),
(1,7),
(2,5),
(3,10),
(9,8),
(4,7),
(3,10);

create table games_result (
result_id int not null auto_increment,
result_value varchar (10),
 primary key (result_id)
);
insert into games_result (result_value)
values
("win"),
("lose"),
("draw");

create table achievements(
  achiev_id int not null auto_increment,
  achiev_value varchar (15),
  primary key (achiev_id)
  );
  insert into achievements (achiev_value)
  values
  ("newbie"),
  ("amareur"),
  ("professional"),
  ("master"),
  ("grand master"); 
  
create table player_achievs(
  pair_id int not null auto_increment,
  player_id int,
  achiev_id int,
  primary key (pair_id)
  );
  insert into player_achievs (player_id, achiev_id)
  values
  (2,1),
  (2,2),
  (2,3),
  (7,1),
  (5,1),
  (5,2),
  (1,1),
  (9,1),
  (10,1),
  (3,1),
  (7,2),
  (8,1),
  (8,2),
  (8,3),
  (8,4);

create table player_results(
  pair_id int not null auto_increment,
  game_id int,
  player_id	int,
  result_id int,
  primary key (pair_id)
  );
insert into player_results (player_id, result_id)
values 
(3,1),
(6,2),
(2,3),
(1,3),
(8,2),
(5,1),
(4,3),
(8,3),
(1,2),
(7,1),
(2,1),
(5,2),
(3,3),
(10,3),
(9,3),
(8,3),
(4,2),
(7,1),
(3,1),
(10,2);
  
  delete from players 
  where player_id>10;
  
    update players
  set first_name = "SOFIA", email = "Sofia_Pretty_Jenner@gmail.com"
  where player_id = 5;
  
  
 alter table players 
 add column nickname varchar (20) not null; 
 update players
 set nickname = "grumpy"
 where player_id=1;
 
 update players
 set nickname = "honey"
 where player_id =3;
 
 update players
 set nickname ="lovely"
 where player_id=5;
 
 update players
 set nickname="woody"
 where player_id=7;
 
 update players
 set nickname="snoopy"
 where player_id=9;
 
 
 Alter table games
Add constraint FK_games foreign key (first_player_id)
References players (player_id);

Alter table games
Add constraint FK_games1 foreign key (second_player_id)
References players (player_id);

Alter table player_achievs
Add constraint FK_player_ach foreign key (player_id)
References players (player_id);


Alter table player_achievs
Add constraint FK_player_achi foreign key (achiev_id)
References achievements (achiev_id);

Alter table player_results
Add constraint FK_player_res foreign key (player_id)
References players (player_id);

Alter table player_results
Add constraint FK_player_resul foreign key (result_id)
References games_result (result_id);

Alter table player_results
Add constraint FK_player_result foreign key (game_id)
References games (game_id);

