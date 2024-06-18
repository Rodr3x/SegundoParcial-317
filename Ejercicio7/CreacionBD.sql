CREATE DATABASE MERCANTIL;
USE MERCANTIL;

CREATE TABLE Cuenta (
    NumeroCuenta INT PRIMARY KEY,
    NombreCliente VARCHAR(100),
    Saldo DECIMAL(10, 2)
);

CREATE TABLE Transaccion (
    ID INT PRIMARY KEY IDENTITY,
    NumeroCuenta INT,
    TipoTransaccion VARCHAR(20),
    Monto DECIMAL(10, 2),
    FechaTransaccion DATETIME,
    FOREIGN KEY (NumeroCuenta) REFERENCES Cuenta(NumeroCuenta)
);

INSERT INTO Cuenta (NumeroCuenta, NombreCliente, Saldo) VALUES
(1001, 'Juan Pérez', 1500.00),
(1002, 'María García', 2500.00),
(1003, 'Pedro López', 500.00);

INSERT INTO Transaccion (NumeroCuenta, TipoTransaccion, Monto, FechaTransaccion) VALUES
(1001, 'Depósito', 500.00, '2024-06-18 10:30:00'),
(1001, 'Retiro', 200.00, '2024-06-18 11:45:00'),
(1002, 'Depósito', 1000.00, '2024-06-18 09:15:00'),
(1003, 'Depósito', 200.00, '2024-06-18 08:00:00');


