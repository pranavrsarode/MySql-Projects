create database ipl_analysis;
use ipl_analysis;

create table matches (
    id int primary key,
    season varchar(20),
    city varchar(100),
    match_date date,
    team1 varchar(100),
    team2 varchar(100),
    toss_winner varchar(100),
    toss_decision varchar(20),
    result varchar(50),
    dl_applied int,
    winner varchar(100),
    win_by_runs int,
    win_by_wickets int,
    player_of_match varchar(100),
    venue varchar(255),
    umpire1 varchar(100),
    umpire2 varchar(100),
    umpire3 varchar(100)
);
select * from matches;

describe matches;

insert into matches(id,season,city,match_date,team1,team2,toss_winner,toss_decision,result,dl_applied,winner,win_by_runs,win_by_wickets,player_of_match,venue,umpire1,umpire2,umpire3)
values (1,2017,'Hyderabad','2017-04-05','Sunrisers Hyderabad','Royal Challengers Bangalore','Royal Challengers Bangalore','field','Normal',0,'Sunrisers Hyderabad',35,0,'Yuvraj Singh','Rajiv Gandhi International Stadium, Uppal','AY Dandekar','NJ Llong',NULL);

insert into matches(id,season,city,match_date,team1,team2,toss_winner,toss_decision,result,dl_applied,winner,win_by_runs,win_by_wickets,player_of_match,venue,umpire1,umpire2,umpire3)
values (2,2017,'Pune','2017-04-06','Mumbai Indians','Rising Pune Supergiant','Rising Pune Supergiant','field','Normal',0,'Rising Pune Supergiant',0,7,'SPD Smith','Maharashtra Cricket Association Stadium','A Nand Kishore','S Ravi',NULL);
	  
insert into matches(id,season,city,match_date,team1,team2,toss_winner,toss_decision,result,dl_applied,winner,win_by_runs,win_by_wickets,player_of_match,venue,umpire1,umpire2,umpire3)
values (3,2017,'Rajkot','2017-04-07','Gujarat Lions','Kolkata Knight Riders','Kolkata Knight Riders','field','Normal',0,'Kolkata Knight Riders',0,10,'CA Lynn','Saurashtra Cricket Association Stadium','Nitin Menon','CK Nandan',NULL);
	  
insert into matches(id,season,city,match_date,team1,team2,toss_winner,toss_decision,result,dl_applied,winner,win_by_runs,win_by_wickets,player_of_match,venue,umpire1,umpire2,umpire3)
values (4,2017,'Indore','2017-04-08','Rising Pune Supergiant','Kings XI Punjab','Kings XI Punjab','field','Normal',0,'Kings XI Punjab',0,6,'GJ Maxwell','Holkar Cricket Stadium','AK Chaudhary','C Shamshuddin',NULL);

insert into matches(id,season,city,match_date,team1,team2,toss_winner,toss_decision,result,dl_applied,winner,win_by_runs,win_by_wickets,player_of_match,venue,umpire1,umpire2,umpire3)
values (5,2017,'Bangalore','2017-04-08','Royal Challengers Bangalore','Delhi Daredevils','Royal Challengers Bangalore','bat','Normal',0,'Royal Challengers Bangalore',15,0,'KM Jadhav','M Chinnaswamy Stadium',NULL,NULL,NULL);

select  id,season,city,team1,team2,winner from matches;

select * from matches where city is null or winner is null;

select count(*) as Total_Matches from matches;

select count(season) as Total_Seasons from matches;

select count(city) as Total_Cities from matches;
select city, count(*) over() as total_city_count from matches;

select count(venue) as Total_Venue from matches;

select winner as Team,COUNT(*) as Matches_Won from matches where winner is not null group by winner order by Matches_Won;

select Team, count(*) as Matches_Played from (select team1 as Team from matches union all select team2 as Team from matches) as All_Teams group by Team order by Matches_Played;

select Team1,count(*) over() as Toss_And_Match_Won from matches where toss_winner = winner;
select Team2,count(*) over() as Toss_And_Match_Won from matches where toss_winner = winner;

select toss_decision,count(*) as Total_Matches from matches group by toss_decision;

select player_of_match,count(*) AS Awards from matches where player_of_match is not null group by player_of_match order by Awards;

select venue,count(*) as Match_Hosted from matches where venue is not null group by venue order by Match_Hosted;

select city,count(*) as City_Hosted from matches where city is not null group by city order by City_Hosted;

select team1,team2,winner,win_by_runs from matches where win_by_runs > 0 order by win_by_runs;

select team1,team2,winner,win_by_wickets from matches where win_by_wickets > 2 order by win_by_wickets;
