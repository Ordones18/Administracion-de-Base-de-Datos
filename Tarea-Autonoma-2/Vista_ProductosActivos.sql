CREATE VIEW Vista_Productos_Activos AS
SELECT p.producto_id, p.nombre AS Producto, p.stock, pr.nombre AS Proveedor
FROM Productos p
JOIN Proveedores pr ON p.proveedor_id = pr.proveedor_id
WHERE p.stock > 0;

SELECT * FROM Vista_Productos_Activos