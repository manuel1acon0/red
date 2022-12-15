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
	menu_name varchar(20) not null,
	price float not null,
	description varchar(60),
	categorie_id int,	
	foreign key (categorie_id) references CATEGORIE (categorie_id)  on delete cascade
	
	
	
);

DROP TABLE IF EXISTS ordini;
create table ordini(

