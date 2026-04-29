create database concierto;
use concierto;

create table generosmusicales(
IDgeneromusical int auto_increment primary key not null,
nombre varchar(30)
);
create table entradas(
IDentrada int auto_increment primary key not null,
tipo varchar(15),
cupos int (3),
valor decimal
);

create table estadios(
IDestadio int auto_increment primary key not null,
nombre varchar(30),
capacidad int (3),
ubicacion varchar(40)
);

create table cantantes(
IDcantante int auto_increment primary key not null,
nombre varchar(30),
apellido varchar (25),
edad int (2),
IDgeneromusical int,
FOREIGN KEY (IDgeneromusical) REFERENCES generosmusicales(IDgeneromusical) 
);


create table temas(
IDtema int auto_increment primary key not null,
nombre varchar(30),
cantante int,
FOREIGN KEY (cantante) REFERENCES cantantes(IDcantante),
IDgeneromusical int,
FOREIGN KEY (IDgeneromusical) REFERENCES generosmusicales(IDgeneromusical)
);

create table albumes(
IDalbum int auto_increment primary key not null,
nombre varchar(40),
IDcantante int,
FOREIGN KEY (IDcantante) REFERENCES cantantes(IDcantante),
fechalanzamiento date,
IDtema int,
FOREIGN KEY (IDtema) REFERENCES temas(IDtema)
);




 
 insert into generosmusicales ( nombre ) values 
('Pop'),
('Folk'),
('Reggaetón'),
('Balada'),
('Rock'),
('Indie'),
('Salsa'),
('Jazz'),
('Bolero'),
('Metal');

 insert into cantantes (nombre, apellido, edad, IDgeneromusical) values
('María', 'Torres', 28, 1),
('Luis', 'Fernández', 35, 2),
('Diego', 'Urbano', 30, 3),
('Clara', 'Gómez', 27, 4),
('Andrés', 'Molina', 33, 5),
( 'Sofía',' Martínez',22,6),
( 'Carlos',' Vega',33,7),
( 'Lucía',' Herrera',43,8),
('Pedro',' Ruiz',67,9),
('Javier',' López',25,10);



insert into temas (nombre, cantante, IDgeneromusical) VALUES
('Luz de Medianoche', 1, 1),
('Caminos de Arena', 2, 2),
('Ritmo del Barrio', 3, 3),
('Viento del Sur', 4, 4),
('Sombras y Luces', 5, 5),
('Olas Eternas', 8, 6),
('Fuego en la Piel', 7, 7),
('Horizonte Azul', 8, 8),
('Latidos del Alma', 9, 9),
('Sueños de Acero', 10, 10);

insert into albumes ( nombre, IDcantante, IDtema, fechalanzamiento) values 
('Noches de Luz', 1, 1, '2021-03-15'),
('Arena y Mar', 2, 2, '2020-07-10'),
('Sonido Urbano', 3, 3, '2022-11-05'),
('Susurros del Viento', 2, 2, '2019-05-22'),
('Entre Sombras', 5, 5, '2021-09-30'),
('Horizonte de Olas', 6, 6, '2020-02-14'),
('Pasión Ardiente', 3, 7, '2022-06-18'),
('Cielos Azules', 8, 8, '2019-12-01'),
('Corazón y Melodía', 2, 2, '2021-08-09'),
('Acero y Sueños', 7, 10, '2023-04-25');

insert into estadios ( nombre, capacidad, ubicacion ) values
 ('Estadio Monumental', 714, 'Buenos Aires, Argentina'),
('Estadio Azteca', 870, 'Ciudad de México, México'),
('Wembley Stadium', 900, 'Londres, Reino Unido'),
('Maracana', 838, 'Rio de Janeiro, Brasil'),
('Camp Nou', 354, 'Barcelona, Espania'),
('MetLife Stadium', 499, 'East Rutherford, Estados Unidos'),
('ANZ Stadium', 300, 'Sídney, Australia'),
('FNB Stadium', 736, 'Johannesburgo, Sudafrica'),
('Rose Bowl', 242, 'Pasadena, Estados Unidos'),
('Estadio Nacional', 400, 'Santiago, Chile');

Insert into entradas (tipo, cupos, valor) values
('General Temprana', 150, 85.00),
('General dia 1', 180, 120.00),
('General dia 2', 180, 120.00),
('Campo VIP', 80, 190.00),
('Platea Preferencial', 60, 175.00),
('Platea Alta', 120, 95.00),
('Palco Lateral', 40, 180.00),
('Meet & Greet', 15, 195.00),
('Acceso Backstage', 10, 199.00),
('Entrada Solidaria', 199, 50.00);

select nombre, capacidad from estadios
where capacidad > 500;

select nombre , cantante from temas;

select IDalbum, nombre, IDtema from albumes
where IDalbum = 2


