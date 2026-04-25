CREATE PROCEDURE InsertarCompra 
    @prod_id INT, @prov_id INT, @cant INT, @monto DECIMAL(10,2)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO Transacciones (producto_id, proveedor_id, cantidad, tipo, monto)
        VALUES (@prod_id, @prov_id, @cant, 'COMPRA', @monto);
        
        UPDATE Productos SET stock = stock + @cant WHERE producto_id = @prod_id;
        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH
END;

-- Ejecutar la compra
EXEC InsertarCompra @prod_id = 101, @prov_id = 1, @cant = 50, @monto = 75.00;

-- Ver el resultado en Transacciones
SELECT * FROM Transacciones WHERE producto_id = 101 AND tipo = 'COMPRA';

-- Ver el stock actualizado
SELECT * FROM Productos WHERE producto_id = 101;