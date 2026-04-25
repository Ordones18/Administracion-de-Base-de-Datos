CREATE FUNCTION Transacciones_PorProveedor (@proveedor_id INT)
RETURNS TABLE
AS
RETURN (
    SELECT * FROM Transacciones 
    WHERE proveedor_id = @proveedor_id
);

SELECT * FROM Transacciones_PorProveedor(1);