--tables 
create table People (
 pid integer not null,
 firstName text not null,
 lastName text not null,
 DOB date not null,
 primary key(pid)
);

insert into poeple(pid, firstName, lastName, DOB)
values 
(001, 'James', 'Cameron', '1956-05-04'),
(002,'John', 'Marston', '1969-07-23'),
(003, 'Arthur', 'Morgan', '1970-12-09'),
(004, 'Wavey', 'Will',	'1990-11-09'),
(005, 'John', 'Travolta', '2000-03-14'),
(006, 'Vincent', 'Vayga', '1978-04-14'),
(007, 'Marty', 'Mcfly',	'1976-05-19'),
(008, 'Doc', 'Brown', '1999-08-28'),
(009, 'Mario',	'Gorlami',	'1982-10-31'),
(010, 'Antonio', 'Margaretti', '1952-09-20'),
(011, 'Dominic', 'Decoco', '1968-01-20'),
(012, 'Aldo', 'Reign',	'1956-02-09'),
(013, 'Donny', 'Donowitz', '1988-06-22'),
(014, 'Joel', 'Miller',	'2001-01-01'),
(015, 'Tommy', 'Miller', '1960-08-01'),
(016, 'Han', 'Solo', '1986-03-02'),
(017, 'Tom', 'Segura',	'1973-05-23'),
(018, 'Joe', 'Rogan', '1988-07-11'),
(019, 'Theo', 'von', '1945-09-09'),
(020, 'Andrew',	'Tate',	'1986-01-11'),
(021, 'George',	'Lopez', '1942-10-04'),
(022, 'Jules', 'Winnfield',	'1993-04-08'),
(023, 'Mia', 'Wallace',	'1992-11-26'),
(024, 'Bruce', 'Wayne', '1980-06-06'),
(025, 'Tyler', 'Durden', '1955-04-20'),
(026, 'Edward',	'Cullen', '1983-08-23'),
(027, 'Bella', 'Swan', '1980-06-06'),
(028, 'Tony', 'Hawk', '1955-08-12'),
(029, 'Anton', 'Chigurh', '1990-12-25'),
(030, 'Llewelyn', 'Moss', '1992-01-06'),
(031, 'Saul', 'Goodman', '1985-09-08');

create table Depth(
depthInMeters integer not null check (depthInMeters < 2000),
primary key(depthInMeters)
);

insert into depth(depthInMeters)
values
(10),
(20),
(30),
(40),
(50),
(60),
(70),
(80),
(90),
(100),
(150),
(200),
(250),
(300),
(350),
(400),
(450),
(500),
(550),
(600),
(650),
(700),
(750),
(800),
(850),
(900),
(950),
(1000),
(1050),
(1100),
(1150),
(1200),
(1250),
(1300),
(1350),
(1400),
(1450),
(1500);

create table Vehicles(
vehicleName text not null,
speedMPH integer not null,
depthInMeters integer not null,
primary key(vehicleName),
foreign key(depthInMeters) references depth(depthInMeters)
);

insert into vehicles (vehicleName,speedMPH, depthInMeters)
values
('SeaGlider', 20, 500),
('SeaMoth', 40, 1000),
('Cyclops', 30, 1500)

create table sunkenShips(
sid integer not null,
shipName text not null,
depthInMeters integer not null,
primary key(sid),
Foreign key(depthInMeters) references Depth(depthInMeters)
);

insert into sunkenShips(sid, shipName, depthInMeters)
values 
(001, 'Aurora', 500)
(002, 'Mecury 2', 1000)
(003, 'Endurance', 1500)

create table Captains (
 pid integer not null,
 sid integer not null,
 yearsAsCaptain integer not null,
 primary key(pid)
 Foreign key(pid) references people(pid)
);

insert into Captains(pid, sid, yearsAsCaptain)
values
(001,	003,	015),
(007,	002,	003),
(016,	001,	010)

create table crewWorkers (
 pid integer not null,
 sid integer not null,
 hoursTrained integer not null,
 primary key(pid),
 Foreign key(pid) references people(pid)
);

insert into crewWorkers(pid, sid, hoursTrained)
values
(2,	1,	375),
(4,	2,	450),
(5,	2,	310),
(11,	1,	1200),
(13,	3,	330),
(15,	1,	415),
(19,	1,	1200),
(20,	2,	320),
(22,	3,	250),
(23,	2,	280),
(26,	3,	365),
(27,	3,	470);

create table medicalStaff (
 pid integer not null,
 sid integer not null,
 crisesHandled integer not null,
 primary key(pid)
);

insert into medicalStaff(pid, sid, crisesHandled)
values
(3,	1,	15),
(6,	1,	12),
(9,	2,	31),
(10,	1,	9),
(17,	3,	60),
(18,	2,	2),
(21,	3,	5),
(28,	3,	48),
(31,	2,	100);


create table Passengers (
 pid integer not null,
 sid integer not null,
 seatNumber integer not null,
 primary key(pid)
);

insert into Passengers(pid, sid, seatNumber)
values
(8,	1,	1),
(14,	2,	1),
(24,	1,	2),
(25,	2,	2),
(29,	3,	1),
(30,	3,	2);

create table Islands(
iid integer not null,
islandName text not null, 
lengthInMeters integer not null,
primary key(iid)
);

insert into Islands(iid, islandName, lengthInMeters)
values
(1,	'Mountain Island',	750),
(2,	'Coconut Bay Island',	1000)
(3,	'Deep Island',	300);

create table Creatures (
 cid integer not null,
 creatureName text not null,
 lengthInFeet integer not null,
 Invasive boolean,
 depthInMeters integer not null check (depthInMeters < 2000),
 primary key(cid),
 Foreign key(depthInMeters) references Depth(depthInMeters)
);
 
insert into Creatures()
values
(1,	'Warper',	30,	true,	1000),
(2,	'Stalker',	18,	false,	50),
(3,	'Bruiser',	10,	true,	100),
(4,	'SkyRay',	5,	false,	10),
(5,	'Reefback',	100,	false,	250),
(6,	'Spadefish',	2,	false,	20),
(7,	'Mesmer',	4,	true,	500),
(8,	'Crabsquid',	25,	false,	850),
(9,	'Cuddlefish',	1,	false,	20),
(10,	'Garryfish',	2,	false,	10),
(11,	'Ghostray',	17,	false,	150),
(12,	'RiverProwler',	9,	true,	200),
(13,	'Blighter',	3,	false,	40),
(14,	'Biter',	3,	false,	40),
(15,	'Crashfish',	5,	true,	50),
(16,	'Bladderfish',	2,	false,	10),
(17,	'Boomerang',	1,	false,	80),
(18,	'Lavalizard',	40,	true,	150),
(19,	'Eyeye',	1,	false,	20),
(20,	'Hoopfish'	1,	false,	50),
(21,	'Hoverfish',	4,	false,	60),
(22,	'Jellyray',	20,	false,	250),
(23,	'Oculus',	5,	false,	1200),
(24,	'Reginald',	2,	true,	1150),
(25,	'Spinefish',	8,	false,	700);

create table carnivoreCreatures (cid, creatureName, lengthInFeet, Invasive, depthInMeters)
values

	cid integer not null,
	Dangerous boolean,
	primary key(cid),
	Foreign key(cid) references creatures(cid)
);

insert into carnivoreCreatures(cid, dangerous)
values
(1,	true),
(2,	true),
(3,	true),
(7,	false),
(8,	true),
(12,	false),
(13,	false),
(14,	false),
(15,	true),
(18,	false);


create table herbivoreCreatures (
 cid integer not null,
 foodSource integer not null,
 primary key(cid),
 Foreign key(cid) references creatures(cid),
 Foreign key(foodSource) references flora(fid)
);

insert into herbivoreCreatures(cid, foodSource)
values
(4,	19),
(5,	11),
(6,	22),
(9,	21),
(10,	8),
(11,	15),
(16,	9),
(17,	7),
(19,	23),
(20,	12),
(21,	4),
(22,	13),
(23,	20),
(24,	16),
(25,	1);

create table flora (
 fid integer not null,
 floraName text not null,
 Consumable boolean,
 primary key(fid),
 Foreign key(fid) references flora(fid)
);

insert into Flora(fid, floraName, Consumable)
values
(1,	'Bullseye Mushroom',	true),
(2,	'Thermal Lily',	false),
(3,	'Blue Scrub Bush',	false),
(4,	'Gel Sack',	true),
(5,	'Fevered Pepper Tree',	false),
(6,	'Creepvine',	false),
(7,	'Twisted Mandrake',	true),
(8,	'Scaly Maw Anemone',	true),
(9,	'Purple Cattail',	true),
(10,	'Polycage'	false),
(11,	'Pink Narrowleaf',	true),
(12,	'Oxygen Plant',	true),
(13,	'Luna Plant',	true),
(14,	'Loop Plant',	false),
(15,	'Lilypad',	true),
(16,	'Jade Membrane',	true),
(17,	'Hardy Cave Bush',	false),
(18,	'Green Ternion',	false),
(19,	'Grand Bulb Anemone',	true),
(20,	'Eclipse Plant',	true),
(21,	'Double Lung Plant'	true),
(22,	'Crescent Moon Coral',	true),
(23,	'Antannae Plant'	true);

create table seaFlora(
fid integer not null,
depthInMeters integer not null check (depthInMeters < 2000),
Primary key(fid),
Foreign key(fid) references flora(fid),
Foreign key(depthInMeters) references depth(depthInMeters)
);

insert into seaFlora(fid, depthInMeters)
values
(1,	100)
(4,	200),
(5,	10),
(6,	60),
(7,	300),
(8,	1000),
(9,	450),
(10,	20),
(11,	10),
(13,	10),
(14,	40),
(16,	200),
(19,	60),
(20,	50),
(21,	10),
(22	1000);

create table landFlora(
fid integer not null,
islandID integer not null references islands(iid),
primary key(fid),
foreign key(fid) references flora(fid)
);

insert into landFlora(fid, islandID)
values
(2,	3),
(3,	2),
(12,	1),
(15,	3),
(17,	1),
(18,	3),
(23,	2);

--views
create view shipCaptains
as
select firstname, lastname, shipname
from people p inner join captains c on p.pid = c.pid
inner join sunkenShips s on c.sid = s.sid 
select*
from shipcaptains

create view creaturesOfTheVoid
as
select creaturename, depthInMeters
from creatures
where depthInMeters > 1000;
select * 
from creaturesOftheVoid

create view dangerousCreatures
as
select creaturename, depthInMeters
from creatures
where cid in (select cid
			  from carnivoreCreatures
			  where dangerous is true)
select *
from dangerousCreatures

create view veteranCrewWorkers
as
select firstname, lastname
from people
where pid in (select pid
			 from crewWorkers
			 where hoursTrained > 1000)
select *
from veteranCrewWorkers


--Stored Procedures
--cyclopsSpeed
create or replace function cyclopsSpeed() returns trigger as 
$$
begin
	if new.depthInMeters = 1500 
	and (select v.vehicleName from vehicles v where new.vehicleName = 'Cyclops')
	then
		update vehicles
		set speedmph = 10
		where depthInMeters = new.depthinmeters;
end if;
return new;
end;
$$
language plpgsql;

--creatureInfo
create or replace function creatureInfo(integer, refcursor) returns refcursor as 
$$
declare
	searchDepth integer := $1;
	resultSet refcursor := $2;
begin
	open resultSet for 
	select *
	from creatures c
	where c.depthInMeters = searchDepth ;
return resultSet;
end;
$$
language plpgsql;

select creatureInfo(10, 'res');
fetch all from res;

--whichFlora
create or replace function whichFlora(integer, refcursor) returns refcursor as
$$
declare 
	searchIsland int := $1;
	resultSet refcursor := $2;
begin
	open resultSet for 
	select floraName, islandName
	from flora f inner join landFlora l on f.fid = l.fid
	inner join islands i on l.islandID = i.iid
	where i.iid = searchIsland;
	return resultset;
end;
$$
language plpgsql;

select WhichFlora(002, 'res');
fetch all from res;
--Triggers
create trigger cyclopsSpeed
after update on vehicles
for each row
execute procedure cyclopsSpeed()

--reports 
select vehicleName, shipName, s.depthInMeters
from vehicles v inner join sunkenships s on v.depthInMeters >= s.depthInMeters
order by v.depthInMeters ASC

select creatureName, floraName, s.depthInMeters
from creatures c inner join seaFlora s on c.depthInMeters = s.depthInMeters
inner join flora f on s.fid = f.fid

--security
create role admin;
create role spaceAdmin;
grant all on all tables in schema public to admin;

grant select, insert, update, delete on people to spaceAdmin;
grant select, insert, update, delete on Captains to spaceAdmin;
grant select, insert, update, delete on crewWorkers to spaceAdmin;
grant select, insert, update, delete on medicalStaff to spaceAdmin;	
grant select, insert, update, delete on Passengers to spaceAdmin;
grant select, insert, update, delete on Creatures to spaceAdmin;
grant select, insert, update, delete on carnivoreCreatures to spaceAdmin;
grant select, insert, update, delete on herbivoreCreatures to spaceAdmin;
grant select, insert, update, delete on flora to spaceAdmin;
grant select, insert, update, delete on seaFlora to spaceAdmin;
grant select, insert, update, delete on landFlora to spaceAdmin;

revoke all on all tables in schema public from spaceAdmin;