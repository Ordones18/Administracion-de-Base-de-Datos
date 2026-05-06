-- COPIAS DE SEGURIDAD Y TIPOS DE RESPALDO

-- Asegurar que la base de datos no esté en modo simple
ALTER DATABASE RecuperacionFundamentos SET RECOVERY FULL;

-- Respaldo Completo
BACKUP DATABASE RecuperacionFundamentos
TO DISK = 'C:\Backup\RecuperacionFundamentos_Full.bak'
WITH FORMAT, NAME = 'Respaldo Completo - RecuperacionFundamentos';
GO
-- Crea una copia completa de toda la base de datos

-- Realizar algunas modificaciones después del full
INSERT INTO Departamentos (id, nombre) VALUES (5, 'Ventas');
GO

-- Respaldo Diferencial 
BACKUP DATABASE RecuperacionFundamentos
TO DISK = 'C:\Backup\RecuperacionFundamentos_Dif.bak'
WITH DIFFERENTIAL, NAME = 'Respaldo Diferencial - RecuperacionFundamentos';
GO
-- Guarda solo los datos que cambiaron desde el último respaldo completo

-- Realizar otra modificación
UPDATE Empleados SET salario = 1600 WHERE id = 101;
GO

-- Respaldo incremental
BACKUP LOG RecuperacionFundamentos
TO DISK = 'C:\Backup\RecuperacionFundamentos_Log.trn'
WITH NAME = 'Respaldo Log - RecuperacionFundamentos';
GO
-- Respalda el registro de operaciones ocurridas desde el último respaldo de log