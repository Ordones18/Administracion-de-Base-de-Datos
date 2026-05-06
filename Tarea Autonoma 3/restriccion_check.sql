-- Agregar restricción CHECK para impedir salarios negativos
ALTER TABLE Empleados
ADD CONSTRAINT CK_Salario_Positivo CHECK (salario > 0);
GO
