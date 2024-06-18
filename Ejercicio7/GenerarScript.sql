USE [master]
GO
/****** Object:  Database [MERCANTIL]    Script Date: 18/6/2024 02:15:55 ******/
CREATE DATABASE [MERCANTIL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MERCANTIL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MERCANTIL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MERCANTIL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MERCANTIL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MERCANTIL] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MERCANTIL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MERCANTIL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MERCANTIL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MERCANTIL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MERCANTIL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MERCANTIL] SET ARITHABORT OFF 
GO
ALTER DATABASE [MERCANTIL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MERCANTIL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MERCANTIL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MERCANTIL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MERCANTIL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MERCANTIL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MERCANTIL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MERCANTIL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MERCANTIL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MERCANTIL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MERCANTIL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MERCANTIL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MERCANTIL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MERCANTIL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MERCANTIL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MERCANTIL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MERCANTIL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MERCANTIL] SET RECOVERY FULL 
GO
ALTER DATABASE [MERCANTIL] SET  MULTI_USER 
GO
ALTER DATABASE [MERCANTIL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MERCANTIL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MERCANTIL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MERCANTIL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MERCANTIL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MERCANTIL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MERCANTIL', N'ON'
GO
ALTER DATABASE [MERCANTIL] SET QUERY_STORE = ON
GO
ALTER DATABASE [MERCANTIL] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MERCANTIL]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 18/6/2024 02:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
