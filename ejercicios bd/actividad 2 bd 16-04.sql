create database clinica ;
use clinica;
create table especialidades(
IDespecialidad int primary key auto_increment not null,
nombreespecialidad varchar(20)
);

create table medicos(
IDmedico  int primary key auto_increment not null,
nombre varchar(10),
apellido varchar(10),
especialidad int,
FOREIGN KEY (especialidad) REFERENCES especialidades(IDespecialidad)
);
create table paciente(
nombre varchar(10),
apellido varchar(10),
DNI int(8),
edad int(2)
);
create table estadoturnos(
IDmedico int,
IDpaciente int,
fecha date,
FOREIGN KEY (IDmedico) REFERENCES medicos(IDmedico),
FOREIGN KEY (IDpaciente) REFERENCES pacientes(IDpaciente),
estado varchar(10)
);

insert into especialidad (nombreespecialidad) values ( cardiologia ),(pediatria),(ginecologia),(traumatologia);

insert into medicos (nombre, apellido, IDespecialidad) values ( Marta, Perez, pediatria), ( Martin, Asmir, cardiologia), (Safira, Colman, traumatologia),(Sofia, Godoy, ginecologia);

insert into pacientes(nombre, apellido, DNI, edad) values ( "Mirta", "Avalos", 27996787, 49), ( "Estella", "Gutierrez", 96554738, 58), ( "Lautaro", "Abdel", 50896754, 16), ("Florencia", "Almaraz", 45678890, 22);
insert into estadoturnos( medico, paciente, fecha, estado) values (1, 3, 22-05-26, "pendiente"),(2, 1, 19-04-26, "atendido"), (4,2, 16-03-26, "ausente"),(3,4, 11-08-26,"pendiente");
select * from estadoturnos
where IDmedico= 3
ORDER BY apellido ASC;
