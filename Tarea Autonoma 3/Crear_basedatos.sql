--  Creación de base de datos de prueba
CREATE DATABASE RecuperacionFundamentos;
GO
USE RecuperacionFundamentos;
GO
-- Crear tabla Departamentos
CREATE TABLE Departamentos (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
-- Crear tabla Empleados
CREATE TABLE Empleados (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    salario DECIMAL(10, 2),
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(id)
);
GO
SELECT * FROM Departamentos;
SELECT * FROM Empleados;