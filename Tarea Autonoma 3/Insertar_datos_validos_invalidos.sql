-- Insertar datos de prueba válidos
INSERT INTO Departamentos (id, nombre) VALUES (1, 'Tecnología');
INSERT INTO Departamentos (id, nombre) VALUES (2, 'Marketing');
GO

-- Insertar empleado válido
INSERT INTO Empleados (id, nombre, salario, departamento_id)
VALUES (101, 'Ana Pérez', 1500.00, 1);
GO

-- Insertar un empleado con datos inválidos
-- Salario negativo viola la restricción CHECK
INSERT INTO Empleados (id, nombre, salario, departamento_id)
VALUES (102, 'Carlos Ruiz', -100.00, 2);
GO

-- Asignar a un departamento que no existe viola la restricción FOREIGN KEY
INSERT INTO Empleados (id, nombre, salario, departamento_id)
VALUES (103, 'Lucía Gómez', 1200.00, 99);
GO

SELECT * FROM Departamentos;
SELECT * FROM Empleados;