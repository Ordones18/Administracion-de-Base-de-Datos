-- Lectura Fantasma SERIALIZABLE

-- Insertamos un dato de prueba 
INSERT INTO Departamentos (id, nombre) VALUES (3, 'Finanzas');
GO

-- VENTANA A transacción que lee un conjunto de datos dos veces
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRANSACTION;
    SELECT * FROM Departamentos; -- Primera lectura
    WAITFOR DELAY '00:00:05'; -- Esperar para que la Ventana B intente insertar un fantasma
    SELECT * FROM Departamentos; -- Segunda lectura debe ser idéntica a la primera
COMMIT TRANSACTION;

