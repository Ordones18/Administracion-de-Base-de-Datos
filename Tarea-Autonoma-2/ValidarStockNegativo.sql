CREATE TRIGGER TR_ValidarStockNegativo
ON Transacciones
AFTER INSERT
AS
BEGIN
    -- Verificamos si después de la transacción algún stock quedó en negativo
    IF EXISTS (
        SELECT 1 FROM Productos WHERE stock < 0
    )
    BEGIN
        -- Si hay stock negativo, deshacemos todo y lanzamos error
        ROLLBACK TRANSACTION;
        RAISERROR('Error: Stock insuficiente para completar la venta. Operación cancelada.', 16, 1);
    END
END;
GO

-- Intentamos vender 100 unidades cuando solo hay 5
EXEC InsertarVenta 
    @producto_id = 104, 
    @proveedor_id = 2, 
    @cantidad = 100, 
    @monto = 80.00;