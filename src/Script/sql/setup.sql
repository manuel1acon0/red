DROP TABLE IF EXISTS CATEGORIE;

create table CATEGORIE(
	categorie_id serial primary key,
	category_name varchar(20) not null
	
);

insert into CATEGORIE(category_name) values('Pizze');
insert into CATEGORIE(category_name) values('Pinse');
insert into CATEGORIE(category_name) values('Dolci');
insert into CATEGORIE(category_name) values('Bevande');
insert into CATEGORIE(category_name) values('Antipasto');


DROP TABLE IF EXISTS MENU;
create table MENU(
	menu_id serial primary key,
	name varchar(20) not null,
	price decimal(4,2) not null,
	description varchar(60),
	categorie_id integer,	
	foreign key (categorie_id) references CATEGORIE (categorie_id)  
	
	
	
);

--DROP TABLE IF EXISTS ordini;
--create table ordini(
--client_id serial primary key;

