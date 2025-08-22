CREATE DATABASE AUDITORIA
GO

USE AUDITORIA
GO 

DROP TABLE IF EXISTS RegistrosContables;

CREATE TABLE RegistrosContables (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Cuenta varchar(50),
    Monto decimal(10,2),
    Fecha date
);

INSERT INTO RegistrosContables (Cuenta, Monto, Fecha) 
VALUES 
('Ventas', 500, '2025-05-10'),
('Compras', -200, '2025-06-15'),
('Ventas', 500, '2025-05-10'),
('Caja', 0,'2024-12-31'),
('Ventas', 300, '2025-01-01');

select * from RegistrosContables
-- Duplicados

SELECT Cuenta, Fecha, COUNT(*) as Duplicados
FROM RegistrosContables
GROUP BY Cuenta, Fecha
HAVING COUNT(*) > 1;

-- Nulos o negativos

SELECT * FROM RegistrosContables
WHERE Monto IS NULL OR Monto < 0;

-- Fecha fuera de rango 

SELECT * FROM RegistrosContables
WHERE Fecha < '2025-05-10' OR Fecha > GETDATE();
