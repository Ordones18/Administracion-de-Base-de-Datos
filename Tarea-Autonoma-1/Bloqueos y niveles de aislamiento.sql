BEGIN TRANSACTION;
-- Bloqueamos la fila del Taxo para una actualización de inventario
UPDATE Productos 
SET stock = stock + 10 
WHERE producto_id = 101;
-- NO ejecutamos COMMIT aún para mantener el bloqueo activo.

BEGIN TRANSACTION;
-- El administrador registra un Ingreso
UPDATE Productos 
SET stock = 500
WHERE producto_id = 101;


-- Cambiamos al nivel Read Committed
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Intentamos ver el stock actual para una venta
SELECT * FROM Productos WHERE producto_id = 101; 


SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRANSACTION;
-- SQL congela toda la categoría de exportación
SELECT * FROM Productos WHERE categoria = 'Fruta de la Sierra';
-- Nadie puede insertar nuevas frutas en esta categoría hasta que terminemos
COMMIT;
