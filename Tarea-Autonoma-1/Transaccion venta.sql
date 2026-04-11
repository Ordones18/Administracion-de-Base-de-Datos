-- Transacción para registrar la venta 
BEGIN TRANSACTION;
BEGIN TRY
    INSERT INTO Transacciones (producto_id, proveedor_id, cantidad, tipo, monto)
    VALUES (101, 1, 20, 'VENTA', 60.00);

    UPDATE Productos 
    SET stock = stock - 20 
    WHERE producto_id = 101;

    -- No permitir stock negativo
    IF (SELECT stock FROM Productos WHERE producto_id = 101) < 0
        THROW 50000, 'Error: No hay suficientes cajas de fruta en stock.', 1;

    COMMIT;
    PRINT 'Venta de fruta realizada con éxito.';
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Venta cancelada: ' + ERROR_MESSAGE();
END CATCH;

SELECT * FROM Transacciones;