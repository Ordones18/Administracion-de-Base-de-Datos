CREATE VIEW Vista_Transacciones AS
SELECT t.transaccion_id, p.nombre AS Producto, pr.nombre AS Proveedor, 
       t.fecha, t.cantidad, t.tipo, t.monto
FROM Transacciones t
JOIN Productos p ON t.producto_id = p.producto_id
JOIN Proveedores pr ON t.proveedor_id = pr.proveedor_id;

SELECT * FROM Vista_Transacciones