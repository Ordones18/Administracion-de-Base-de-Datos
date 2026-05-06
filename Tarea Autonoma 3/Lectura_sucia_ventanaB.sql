-- VENTANA B Lectura sucia
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SELECT salario FROM Empleados WHERE id = 101; -- Leerá 2500 dato sucio, no confirmado
