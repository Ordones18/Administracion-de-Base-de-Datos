-- reamos la tabla de auditoría
CREATE TABLE Auditoria_Transacciones (
    auditoria_id INT IDENTITY(1,1) PRIMARY KEY,
    id_transaccion INT,
    tipo VARCHAR(10),
    fecha DATETIME
);
GO
-- Creamos el Trigger de Auditoría
CREATE TRIGGER TR_AuditarTransacciones
ON Transacciones
AFTER INSERT
AS
BEGIN
    INSERT INTO Auditoria_Transacciones (id_transaccion, tipo, fecha)
    SELECT transaccion_id, tipo, GETDATE() FROM inserted;
END;
GO

-- Agregamos nuevos proveedores para visualizar mejor los logs 
INSERT INTO Proveedores (proveedor_id, nombre, contacto, ciudad) VALUES 
(2, 'Frutas del Guayas S.A.', '0987654321', 'Guayaquil'),
(3, 'Cosechas Ambateñas', '0912345678', 'Ambato');

-- Agregamos nuevos productos Stock inicial en 0 o bajo para probar compras
INSERT INTO Productos (producto_id, nombre, categoria, precio, stock, proveedor_id) VALUES 
(102, 'Pitahaya Amarilla', 'Fruta Exótica', 2.50, 0, 2),
(103, 'Mora de Castilla', 'Fruta de la Sierra', 1.20, 10, 3),
(104, 'Banano Premium', 'Fruta de la Costa', 0.80, 5, 2);


-- Compramos 100 unidades de Pitahaya
EXEC InsertarCompra @prod_id = 102, @prov_id = 2, @cant = 100, @monto = 150.00;
-- Compramos 200 unidades de Mora
EXEC InsertarCompra @prod_id = 103, @prov_id = 3, @cant = 200, @monto = 180.00;

-- Venta exitosa Pitahaya
EXEC InsertarVenta @producto_id = 102, @proveedor_id = 2, @cantidad = 15, @monto = 37.50;
-- Venta que DEBERÍA FALLAR por stock insuficiente (Banano solo tiene 5)
EXEC InsertarVenta @producto_id = 104, @proveedor_id = 2, @cantidad = 50, @monto = 40.00;

-- Reporte final de inventario
SELECT * FROM Vista_Productos_Activos;
-- Historial de movimientos detallado
SELECT * FROM Vista_Transacciones;
-- Comprobación de seguridad Logs automáticos
SELECT * FROM Auditoria_Transacciones;