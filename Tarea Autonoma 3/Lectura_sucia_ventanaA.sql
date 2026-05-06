-- Lectura Sucia READ UNCOMMITTED
-- VENTANA A transacción que modifica y luego se revierte
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
    UPDATE Empleados SET salario = 2500 WHERE id = 101;
    -- En este punto la VENTANA B leerá el dato sucio
    WAITFOR DELAY '00:00:05'; -- Esperar 5 segundos para dar tiempo a la consulta B
ROLLBACK TRANSACTION; -- La actualización se deshace
