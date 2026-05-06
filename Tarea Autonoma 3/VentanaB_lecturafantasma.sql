-- VENTANA B Intento de insertar un nuevo departamento durante la transacción de A
INSERT INTO Departamentos (id, nombre) VALUES (4, 'Recursos Humanos'); 
-- Esta instrucción se quedará bloqueada hasta que la Ventana A termine su transacción.

SELECT * FROM Departamentos 