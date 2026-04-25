CREATE PROCEDURE InsertarVenta
    @producto_id INT,
    @proveedor_id INT,
    @cantidad INT,
    @monto DECIMAL(10,2)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Reducimos el stock en la tabla Productos
        UPDATE Productos 
        SET stock = stock - @cantidad 
        WHERE producto_id = @producto_id;

        -- Registramos la transacción de venta
        INSERT INTO Transacciones (producto_id, proveedor_id, cantidad, tipo, monto)
        VALUES (@producto_id, @proveedor_id, @cantidad, 'VENTA', @monto);

        COMMIT;
        PRINT 'Venta registrada con éxito y stock actualizado.';
    END TRY
    BEGIN CATCH
        ROLLBACK;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
GO