
DROP TABLE IF EXISTS MENU;
DROP TABLE IF EXISTS cart;
DROP TABLE IF EXISTS category;

create table category(
	category_id serial primary key,
	name varchar(20) not null
	
);
insert into category(name) values('Pizze');
insert into category(name) values('Pinse');
insert into category(name) values('Dolci');
insert into category(name) values('Bevande');
insert into category(name) values('Antipasto');




create table MENU(
	menu_id serial primary key,
	name varchar(20) not null,
	price decimal(4,2) not null,
	description varchar(60),
	category_id integer,	
	foreign key (category_id) references category (category_id) 
	
	
	
);
insert into menu (name,price,description,category_id) values('Margherita',6.00,'mozzarella,pomodoro',1);
insert into menu (name,price,description,category_id) values('Romana',7.00,'mozzarella,prosciutto',1);
insert into menu (name,price,description,category_id) values('Tricolore',8.50,'mozzarella,pomodorini,basilico',2);
insert into menu (name,price,description,category_id) values('Diavola',9.00,'fior di latte,salame',2);
insert into menu (name,price,description,category_id) values('Tiramisù',6.00,'savoiardi,mascarpone',3);
insert into menu (name,price,description,category_id) values('Semifreddo al cocco',6.00,'cocco, frutta esotica',3);
insert into menu (name,price,description,category_id) values('Coca-cola(spina)',3.00,'33 cl',4);
insert into menu (name,price,description,category_id) values('Acqua',2.50,null,4);
insert into menu (name,price,description,category_id) values('Pizzette fritte',3.00,'fritto in olio evo',5);
insert into menu (name,price,description,category_id) values('Burratina',3.00,'100g',5);


create table cart(
cart_id serial primary key,
price decimal (4,2),
name varchar (20)



);



