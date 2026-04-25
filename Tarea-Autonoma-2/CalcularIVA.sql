CREATE FUNCTION CalcularIVA (@monto DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @monto * 0.12;
END;

-- Visualizamos el IVA aplicado a las transacciones
SELECT 
    transaccion_id AS [ID], 
    tipo AS [Operación], 
    monto AS [Monto_Base], 
    dbo.CalcularIVA(monto) AS [IVA_Calculado]
FROM Transacciones;