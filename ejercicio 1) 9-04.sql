
create database clinica_veterinaria;
use clinica_veterinaria;

create table dueños (
    ID_dueno int auto_increment primary key,
    nombre varchar(50) not null,
    direccion varchar(100),
    telefono varchar(20) not null
);

create table mascotas (
    ID_mascota int auto_increment primary key,
    nombre varchar(30) not null,
    especie varchar(20), -- perro, gato, etc.
    edad int,
    sexo char(1),
    color varchar(20),
    ID_dueno int,
    foreign key (ID_dueno) references dueños(ID_dueno)
);

create table veterinarios (
    ID_veterinario int auto_increment primary key,
    nombre varchar(50) not null,
    telefono varchar(20),
    especialidad varchar(50)
);

create table consultas (
    ID_consulta int auto_increment primary key,
    fecha date not null,
    diagnostico text,
    ID_veterinario int,
    ID_mascota int,
    foreign key (ID_veterinario) references veterinarios(ID_veterinario),
    foreign key (ID_mascota) references mascotas(ID_mascota)
);


