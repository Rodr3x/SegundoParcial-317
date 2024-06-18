-- master
select * from MERCANTIL.dbo.Cuenta

--slave
select * from MERCANTILBAK.dbo.Cuenta

-- INSERTAR 
INSERT INTO MERCANTIL.dbo.Cuenta (NumeroCuenta, NombreCliente, Saldo)
VALUES (985621, 'Rodrigo', 1000.00);

-- CAMBIOS
UPDATE MERCANTIL.dbo.Cuenta
SET Saldo = 5500.00
WHERE NumeroCuenta = 1001;



-- creamos un job para que la actualizacion del saldo se haga de manera auto
DECLARE @sql NVARCHAR(2000);

SET @sql = '
UPDATE MERCANTIL.dbo.Cuenta
SET Saldo = B.Saldo
FROM MERCANTIL.dbo.Cuenta A
INNER JOIN MERCANTILBAK.dbo.Cuenta B ON A.NumeroCuenta = B.NumeroCuenta
WHERE A.Saldo <> B.Saldo;
';

EXEC sp_executesql @sql;

-- creamos un job para la insercion de datos nuevos
-- Insertar datos desde MERCANTIL hacia MERCANTILBAK
INSERT INTO MERCANTILBAK.dbo.Cuenta (NumeroCuenta, NombreCliente, Saldo)
SELECT NumeroCuenta, NombreCliente, Saldo
FROM MERCANTIL.dbo.Cuenta AS M
WHERE NOT EXISTS (
    SELECT 1
    FROM MERCANTILBAK.dbo.Cuenta AS B
    WHERE B.NumeroCuenta = M.NumeroCuenta
);


-- master
select * from MERCANTIL.dbo.Cuenta

--slave
select * from MERCANTILBAK.dbo.Cuenta








