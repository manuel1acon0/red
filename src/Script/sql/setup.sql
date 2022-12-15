DROP TABLE IF EXISTS category;

create table category(
	category_id serial primary key,
	name varchar(20) not null
	
);




DROP TABLE IF EXISTS MENU;
create table MENU(
	menu_id serial primary key,
	name varchar(20) not null,
	price decimal(4,2) not null,
	description varchar(60),
	category_id integer,	
	foreign key (category_id) references category (category_id)  
	
	
	
);


DROP TABLE IF EXISTS cart;
create table cart(
cart_id serial primary key,
price decimal (4,2),
name varchar (20)



);

--DROP TABLE IF EXISTS client;
--create table client(
-- serial primary key;
--first_Name 

--)

