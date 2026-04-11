-- Transacción para registrar la compra
BEGIN TRANSACTION;

BEGIN TRY
    -- Insertar registro en la tabla Transacciones
    -- Registramos la COMPRA con el monto pagado al productor
    INSERT INTO Transacciones (producto_id, proveedor_id, cantidad, tipo, monto)
    VALUES (101, 1, 100, 'COMPRA', 250.00);

    -- Actualizar stock en la tabla Productos
    -- Se incrementa el inventario basado en la compra realizada
    UPDATE Productos 
    SET stock = stock + 100 
    WHERE producto_id = 101;

    -- Si ambas operaciones fueron exitosas, guardamos los cambios permanentemente
    COMMIT;
    PRINT 'Abastecimiento de inventario procesado con éxito.';
END TRY
BEGIN CATCH
    -- Si ocurre un error anulamos todo
    ROLLBACK;
    PRINT 'Error en el proceso de compra. Se aplicó ROLLBACK: ' + ERROR_MESSAGE();

END CATCH;