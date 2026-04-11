-- Creación de la base de datos
CREATE DATABASE Inventario_Frutas_Ecuador;
USE Inventario_Frutas_Ecuador;
GO

-- Tabla de Proveedores 
CREATE TABLE Proveedores (
    proveedor_id INT PRIMARY KEY,
    nombre VARCHAR(100), 
    contacto VARCHAR(100),
    ciudad VARCHAR(50) 
);

-- Tabla de Productos 
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,
    nombre VARCHAR(100), 
    categoria VARCHAR(50), 
    precio DECIMAL(10, 2),
    stock INT
);

-- Tabla de Transacciones 
CREATE TABLE Transacciones (
    transaccion_id INT IDENTITY(1,1) PRIMARY KEY,
    producto_id INT,
    proveedor_id INT,
    fecha DATETIME DEFAULT GETDATE(),
    cantidad INT,
    tipo VARCHAR(10), 
    monto DECIMAL(10, 2),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id),
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id)
);
-- Inserción de datos iniciales
INSERT INTO Proveedores VALUES (1, 'Asociación de Fruticultores Quito', '09999999', 'Quito');
INSERT INTO Productos VALUES (101, 'Taxo', 'Fruta de la Sierra', 1.50, 500);

SELECT * FROM Proveedores;
SELECT * FROM Productos;

