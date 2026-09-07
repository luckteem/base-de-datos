
CREATE DATABASE Formula1;
USE Formula1;

CREATE TABLE Escuderia (
    IDEscuderia INT AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Presupuesto DECIMAL(15, 2) NOT NULL, 
    PRIMARY KEY (IDEscuderia)
);


CREATE TABLE Piloto (
    IDPiloto INT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    DNI VARCHAR(20) NOT NULL ,
    Edad INT NOT NULL, 
    IDEscuderia INT,
    PRIMARY KEY (IDPiloto),
    FOREIGN KEY (IDEscuderia) REFERENCES Escuderia(IDEscuderia)
);

CREATE TABLE Auto (
    IDAuto INT AUTO_INCREMENT,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Precio DECIMAL(12, 2) NOT NULL,
    AnioFabricacion INT NOT NULL,
    Patente VARCHAR(15) NOT NULL ,
    IDEscuderia INT,
    PRIMARY KEY (IDAuto),
    FOREIGN KEY (IDEscuderia) REFERENCES Escuderia(IDEscuderia)
);

CREATE TABLE Carrera (
    IDCarrera INT AUTO_INCREMENT,
    KM INT NOT NULL,
    Pais VARCHAR(50) NOT NULL,
    CantPilotos INT NOT NULL,
    Anio INT NOT NULL,
    PRIMARY KEY (IDCarrera)
);

CREATE TABLE Participacion (
    IDParticipacion INT AUTO_INCREMENT,
    IDPiloto INT,
    IDCarrera INT,
    IDAuto INT,
    Puesto INT NOT NULL,
    PRIMARY KEY (IDParticipacion),
    FOREIGN KEY (IDPiloto) REFERENCES Piloto(IDPiloto),
    FOREIGN KEY (IDCarrera) REFERENCES Carrera(IDCarrera),
    FOREIGN KEY (IDAuto) REFERENCES Auto(IDAuto)
);
INSERT INTO Escuderia (Nombre, Presupuesto) VALUES 
('Ferrari', 400000000.00),
('Mercedes', 380000000.00),
('Red Bull', 420000000.00);

INSERT INTO Piloto (Nombre, Apellido, DNI, Edad, IDEscuderia) VALUES 
('Charles', 'Leclerc', '11111111', 28, 1),
('Lewis', 'Hamilton', '22222222', 41, 2),
('Max', 'Verstappen', '33333333', 29, 3);

INSERT INTO Auto (Marca, Modelo, Precio, AnioFabricacion, Patente, IDEscuderia) VALUES 
('Ferrari', 'SF-24', 15000000.00, 2024, 'FE-001', 1),
('Mercedes', 'W15', 14500000.00, 2024, 'ME-002', 2),
('Red Bull', 'RB20', 16000000.00, 2024, 'RB-003', 3);

INSERT INTO Carrera (KM, Pais, CantPilotos, Anio) VALUES 
(305, 'Monaco', 20, 2021),
(308, 'Monaco', 20, 2023),
(306, 'Silverstone', 20, 2025);

INSERT INTO Participacion (IDPiloto, IDCarrera, IDAuto, Puesto) VALUES 
(1, 1, 1, 2),
(2, 2, 2, 1), 
(3, 3, 3, 1);

SELECT p.Nombre, p.Apellido, e.Nombre AS Escuderia
FROM Piloto p
INNER JOIN Escuderia e ON p.IDEscuderia = e.IDEscuderia;

SELECT Nombre, Presupuesto
FROM Escuderia
WHERE Presupuesto > (SELECT AVG(Presupuesto) FROM Escuderia);

SELECT Marca, Modelo, Precio
FROM Auto
ORDER BY Precio DESC
LIMIT 1;

SELECT Pais, COUNT(*) AS CantidadCarreras
FROM Carrera
WHERE KM > 20
GROUP BY Pais
ORDER BY MIN(Anio) ASC;

SELECT p.Nombre, p.Apellido, p.Edad
FROM Piloto p
INNER JOIN Participacion part ON p.IDPiloto = part.IDPiloto
INNER JOIN Carrera c ON part.IDCarrera = c.IDCarrera
WHERE part.Puesto = 1 AND c.Anio > 2020 AND p.Edad > 25
GROUP BY p.IDPiloto, p.Nombre, p.Apellido, p.Edad;

-- store procedure

DELIMITER //

CREATE PROCEDURE CantidadCarrerasPorPiloto(IN input_nombre VARCHAR(50))
BEGIN
    SELECT COUNT(part.IDCarrera) AS TotalCarreras
    FROM Piloto p
    INNER JOIN Participacion part ON p.IDPiloto = part.IDPiloto
    WHERE p.Nombre = input_nombre;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AutosPorEscuderia(IN input_escuderia VARCHAR(100))
BEGIN
    SELECT a.IDAuto, a.Marca, a.Modelo, a.Patente
    FROM Auto a
    INNER JOIN Escuderia e ON a.IDEscuderia = e.IDEscuderia
    WHERE e.Nombre = input_escuderia;
END //

DELIMITER ;



