USE [MERCANTILBAK]
GO
CREATE TABLE [dbo].[Cuenta](
	[NumeroCuenta] [int] NOT NULL,
	[NombreCliente] [varchar](100) NULL,
	[Saldo] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[NumeroCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaccion]    Script Date: 18/6/2024 02:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaccion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumeroCuenta] [int] NULL,
	[TipoTransaccion] [varchar](20) NULL,
	[Monto] [decimal](10, 2) NULL,
	[FechaTransaccion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD FOREIGN KEY([NumeroCuenta])
REFERENCES [dbo].[Cuenta] ([NumeroCuenta])
GO
USE [master]
GO
ALTER DATABASE [MERCANTIL] SET  READ_WRITE 
GO
