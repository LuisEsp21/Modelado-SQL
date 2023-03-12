/*
	Solución de Luis Antonio Espadero Gómez
*/

create schema practicaegla authorization ayarizqd;

-- Grupo Empresarial

create table practicaegla.carsgroup(
	id SERIAL not null, -- autonumerico
	name varchar(200) not null,
	description varchar(512) null
);

-- PK
alter table practicaegla.carsgroup
add constraint carsgroup_PK primary key (id);

-- DATA

insert into practicaegla.carsgroup (name, description) values ('VAN','');
insert into practicaegla.carsgroup (name, description) values ('RENAULT','');
insert into practicaegla.carsgroup (name, description) values ('PSA','');
insert into practicaegla.carsgroup (name, description) values ('TOYOTA','');

--- MARCAS 

create table practicaegla.carsbrand(
	id_marca SERIAL not null,
	name varchar(200) not null,
	id_group int not null, -- FK
	description varchar(512) null
);

-- PK Y FK

alter table practicaegla.carsbrand
add constraint carsbrand_PK primary key (id_marca);

alter table practicaegla.carsbrand
add constraint carsbrand_FK foreign key (id_group) 
references practicaegla.carsgroup (id);

-- DATOS 

insert into practicaegla.carsbrand (name, id_group) values ('VolksWagen',1);
insert into practicaegla.carsbrand (name, id_group) values ('Audi',1);
insert into practicaegla.carsbrand (name, id_group) values ('Seat',1);
insert into practicaegla.carsbrand (name, id_group) values ('Skoda',1);


insert into practicaegla.carsbrand (name, id_group) values ('Renault',2);
insert into practicaegla.carsbrand (name, id_group) values ('Nissan',2);


insert into practicaegla.carsbrand (name, id_group) values ('Peugeot',3);
insert into practicaegla.carsbrand (name, id_group) values ('Citroen',3);
insert into practicaegla.carsbrand (name, id_group) values ('Opel',3);


insert into practicaegla.carsbrand (name, id_group) values ('Toyota',4);
insert into practicaegla.carsbrand (name, id_group) values ('Lexus',4);

-- MODELOS COCHES

create table practicaegla.carsmodels(
	id_model SERIAL not null,
	name varchar(200) not null,
	id_marca int not null, -- FK
	description varchar(512) null,
	dt_start date not null,
	dt_end date null default '9999-12-31'
);

-- PK Y FK

alter table practicaegla.carsmodels
add constraint carsmodels_PK primary key (id_model);

alter table practicaegla.carsmodels
add constraint carsmodels_FK foreign key (id_marca)
references practicaegla.carsbrand (id_marca);

-- DATOS 

insert into practicaegla.carsmodels (name, id_marca, dt_start)
values('Golf', 1, '1974-01-01');

insert into practicaegla.carsmodels (name, id_marca, dt_start)
values('Passat', 1, '1973-01-01');

insert into practicaegla.carsmodels (name, id_marca, dt_start)
values('A6', 2, '1974-01-01');

insert into practicaegla.carsmodels (name, id_marca, dt_start)
values('A4', 2, '1974-01-01');

insert into practicaegla.carsmodels (name, id_marca, dt_start)
values('A3', 2, '1979-01-01');

insert into practicaegla.carsmodels (name, id_marca, dt_start)
values('Arkana', 5, '2021-01-01');

insert into practicaegla.carsmodels (name, id_marca, dt_start)
values('Clio', 5, '1996-01-01');

insert into practicaegla.carsmodels (name, id_marca, dt_start)
values('XTrail', 6, '2000-09-01');

insert into practicaegla.carsmodels (name, id_marca, dt_start)
values('Micra', 6, '1992-09-01');

insert into practicaegla.carsmodels (name, id_marca, dt_start)
values('3008', 7, '2009-04-01');

insert into practicaegla.carsmodels (name, id_marca, dt_start)
values('308', 7, '2000-04-01');

insert into practicaegla.carsmodels (name, id_marca, dt_start)
values('Insignia', 9, '2008-11-01');

insert into practicaegla.carsmodels (name, id_marca, dt_start)
values('Prius', 10, '1997-01-01');

insert into practicaegla.carsmodels (name, id_marca, dt_start)
values('IS220', 11, '2000-01-01');


-- COLORES DE LOS COCHES

create table practicaegla.carscolors (
	id SERIAL not null, --PK
	name varchar(200) not null	
);

-- PK

alter table practicaegla.carscolors
add constraint carscolors_PK primary key(id);	

-- DATOS

insert into practicaegla.carscolors (name) values ('Blanco');
insert into practicaegla.carscolors (name) values ('Negro');
insert into practicaegla.carscolors (name) values ('Rojo');
insert into practicaegla.carscolors (name) values ('Azul');
insert into practicaegla.carscolors (name) values ('Verde');
insert into practicaegla.carscolors (name) values ('Gris');
insert into practicaegla.carscolors (name) values ('Amarillo');

-- EMPRESAS SEGUROS

create table practicaegla.aseguradoras (
	id SERIAL not null, --PK
	name varchar(200) not null	
);

-- PK 

alter table practicaegla.aseguradoras
add constraint aseguradoras_PK primary key(id);	

-- DATOS

insert into practicaegla.aseguradoras (name) values ('Axa');
insert into practicaegla.aseguradoras (name) values ('Mutua Madrileña');
insert into practicaegla.aseguradoras (name) values ('Mapfre');
insert into practicaegla.aseguradoras (name) values ('Feniz Directo');

-- MONEDAS

create table practicaegla.currency (
	id varchar (10) not null, --PK
	name varchar(200) not null	
);

-- PK 

alter table practicaegla.currency
add constraint currency_PK primary key(id);	

-- DATOS

insert into practicaegla.currency (id, name) values ('EUR', 'Euro');
insert into practicaegla.currency (id, name) values ('USD', 'Dolar Americano');


-- COCHES DE EMPRESA

create table practicaegla.kc_cars(
	id SERIAL not null, --PK
	id_model int not null, --FK
	dt_compra date not null,
	dt_termination date null default '9999-12-31',
	matricula varchar (20) not null,
	id_color int not null, --FK 
	tot_kms int null default 0,
	id_aseguradora int not null, --FK 
	num_poliza_seguro varchar (100) not null,
	description text null
);

-- PK  

alter table practicaegla.kc_cars
add constraint kc_cars_PK primary key (id);

-- FK

alter table practicaegla.kc_cars
add constraint kc_cars_model_FK foreign key (id_model)
references practicaegla.carsmodels (id_model);

alter table practicaegla.kc_cars
add constraint kc_cars_color_FK foreign key (id_color)
references practicaegla.carscolors (id);

alter table practicaegla.kc_cars
add constraint kc_cars_aseguradora_FK foreign key (id_aseguradora)
references practicaegla.aseguradoras (id);

-- DATOS

insert into practicaegla.kc_cars 
(id_model, dt_compra, matricula, id_color, tot_kms, id_aseguradora, num_poliza_seguro)
values (13, '2020-03-15', '1134JKL', 6, 1200, 2, 'M211R790Z1667');

insert into practicaegla.kc_cars 
(id_model, dt_compra, matricula, id_color, tot_kms, id_aseguradora, num_poliza_seguro)
values (4, '2022-03-15', '2234JHL', 6, 599, 1, 'M211R790Z1668');

insert into practicaegla.kc_cars 
(id_model, dt_compra, matricula, id_color, tot_kms, id_aseguradora, num_poliza_seguro)
values (9, '2022-03-15', '1444JSL', 2, 200, 1, 'M211R790Z1680');

insert into practicaegla.kc_cars 
(id_model, dt_compra, matricula, id_color, tot_kms, id_aseguradora, num_poliza_seguro)
values (11, '2019-03-15', '1004JKA', 1, 2000, 3, 'M211R790Z2267');

insert into practicaegla.kc_cars 
(id_model, dt_compra, matricula, id_color, tot_kms, id_aseguradora, num_poliza_seguro)
values (11, '2018-03-15', '0034AKL', 1, 1000, 3, 'M211R790Z8867');

insert into practicaegla.kc_cars 
(id_model, dt_compra, matricula, id_color, tot_kms, id_aseguradora, num_poliza_seguro)
values (14, '2021-03-15', '1100LLL', 4, 5000, 4, 'M211R790Z9867');

insert into practicaegla.kc_cars 
(id_model, dt_compra, matricula, id_color, tot_kms, id_aseguradora, num_poliza_seguro)
values (2, '2022-03-15', '1133JKK', 3, 1800, 4, 'M211R790Z1997');



-- REVISIONES DE UN COCHE

create table practicaegla.kc_cars_revisions (
	id_car int not null, --PK, FK
	dt_revision date not null, --PK 
	importe decimal not null,
	id_currency varchar (10) not null,
	kms int not null,
	description text null
);

-- PK  

alter table practicaegla.kc_cars_revisions
add constraint kc_cars_revisions_PK primary key (id_car, dt_revision); --PK multiple

-- FK

alter table practicaegla.kc_cars_revisions
add constraint kc_cars_revisions_FK foreign key (id_car)
references practicaegla.kc_cars (id);

alter table practicaegla.kc_cars_revisions
add constraint kc_cars_currency_FK foreign key (id_currency)
references practicaegla.currency (id);

-- DATOS

insert into practicaegla.kc_cars_revisions
values (1, '2021-10-01', 350.50, 'EUR', 600, 'Primera revision');

insert into practicaegla.kc_cars_revisions
values (1, '2022-08-01', 550.17, 'EUR', 1000, 'Segunda revision');

insert into practicaegla.kc_cars_revisions
values (2, '2023-03-01', 250.50, 'EUR', 600, 'Primera revision');

insert into practicaegla.kc_cars_revisions
values (4, '2021-12-01', 300.50, 'EUR', 700, 'Primera revision');

insert into practicaegla.kc_cars_revisions
values (4, '2023-01-01', 450.50, 'EUR', 1500, 'Segunda revision');

insert into practicaegla.kc_cars_revisions
values (5, '2022-07-01', 200.75, 'EUR', 650, 'Primera revision');

insert into practicaegla.kc_cars_revisions
values (6, '2019-01-01', 250.50, 'EUR', 1000, 'Primera revision');

insert into practicaegla.kc_cars_revisions
values (6, '2021-10-01', 350.50, 'EUR', 2000, 'Segunda revision');

insert into practicaegla.kc_cars_revisions
values (6, '2023-02-01', 450.50, 'EUR', 3000, 'Tercera revision');

insert into practicaegla.kc_cars_revisions
values (7, '2022-09-01', 150.20, 'EUR', 1000, 'Primera revision');






