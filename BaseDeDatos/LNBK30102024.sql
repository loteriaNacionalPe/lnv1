USE [master]
GO
/****** Object:  Database [bdLoteria]    Script Date: 30/10/2024 11:19:41 ******/
CREATE DATABASE [bdLoteria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bdLoteria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\bdLoteria.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bdLoteria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\bdLoteria_log.ldf' , SIZE = 9216KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bdLoteria] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bdLoteria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bdLoteria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bdLoteria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bdLoteria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bdLoteria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bdLoteria] SET ARITHABORT OFF 
GO
ALTER DATABASE [bdLoteria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bdLoteria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bdLoteria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bdLoteria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bdLoteria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bdLoteria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bdLoteria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bdLoteria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bdLoteria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bdLoteria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bdLoteria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bdLoteria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bdLoteria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bdLoteria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bdLoteria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bdLoteria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bdLoteria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bdLoteria] SET RECOVERY FULL 
GO
ALTER DATABASE [bdLoteria] SET  MULTI_USER 
GO
ALTER DATABASE [bdLoteria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bdLoteria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bdLoteria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bdLoteria] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [bdLoteria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bdLoteria] SET QUERY_STORE = OFF
GO
USE [bdLoteria]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [bdLoteria]
GO
/****** Object:  Schema [autenticacion]    Script Date: 30/10/2024 11:19:41 ******/
CREATE SCHEMA [autenticacion]
GO
/****** Object:  Schema [juego]    Script Date: 30/10/2024 11:19:41 ******/
CREATE SCHEMA [juego]
GO
/****** Object:  Schema [pago]    Script Date: 30/10/2024 11:19:41 ******/
CREATE SCHEMA [pago]
GO
/****** Object:  Schema [usuario]    Script Date: 30/10/2024 11:19:41 ******/
CREATE SCHEMA [usuario]
GO
/****** Object:  Table [juego].[codigoPromocional]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [juego].[codigoPromocional](
	[idCodigoPromocional] [int] IDENTITY(1,1) NOT NULL,
	[idInfluencer] [int] NULL,
	[codigo] [varchar](50) NULL,
	[multiplicador] [decimal](10, 2) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_codigoPromocional] PRIMARY KEY CLUSTERED 
(
	[idCodigoPromocional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [juego].[indicadorInfluencer]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [juego].[indicadorInfluencer](
	[idIndicadorInfluencer] [int] IDENTITY(1,1) NOT NULL,
	[idCodigoPromocional] [int] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_IndicadorInfluencer] PRIMARY KEY CLUSTERED 
(
	[idIndicadorInfluencer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [juego].[Influencer]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [juego].[Influencer](
	[idInfluencer] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](350) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Influencer] PRIMARY KEY CLUSTERED 
(
	[idInfluencer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [juego].[Juego]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [juego].[Juego](
	[idJuego] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](250) NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Juego] PRIMARY KEY CLUSTERED 
(
	[idJuego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [juego].[pack]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [juego].[pack](
	[idPack] [int] IDENTITY(1,1) NOT NULL,
	[IdJuego] [int] NULL,
	[IdSorteo] [int] NULL,
	[descripcion] [varchar](150) NULL,
	[multiplicador] [decimal](10, 2) NULL,
	[monto] [decimal](10, 2) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_pack] PRIMARY KEY CLUSTERED 
(
	[idPack] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [juego].[Sorteo]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [juego].[Sorteo](
	[idSorteo] [int] IDENTITY(1,1) NOT NULL,
	[idJuego] [int] NULL,
	[fechaSorteo] [date] NULL,
	[limiteInferiorOnline] [int] NULL,
	[ticketGanador] [varchar](50) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Sorteo] PRIMARY KEY CLUSTERED 
(
	[idSorteo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [juego].[ticketSorteo]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [juego].[ticketSorteo](
	[idTicketSorteo] [int] IDENTITY(1,1) NOT NULL,
	[idCompraSorteo] [int] NULL,
	[numeroTicket] [int] NULL,
	[fecha] [date] NULL,
	[idTipoResultado] [int] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_ticketSorteo] PRIMARY KEY CLUSTERED 
(
	[idTicketSorteo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [juego].[tipoResultado]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [juego].[tipoResultado](
	[idTipoResultado] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_tipoResultado] PRIMARY KEY CLUSTERED 
(
	[idTipoResultado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [juego].[tipoTicket]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [juego].[tipoTicket](
	[idTipoTicket] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_tipoTicket] PRIMARY KEY CLUSTERED 
(
	[idTipoTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [pago].[compraSorteo]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pago].[compraSorteo](
	[idCompraSorteo] [int] IDENTITY(1,1) NOT NULL,
	[idSorteo] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idTipoUsuario] [int] NOT NULL,
	[fecha] [date] NULL,
	[cantidadInicial] [int] NOT NULL,
	[cantidadFinal] [int] NOT NULL,
	[idTipoTicket] [int] NOT NULL,
	[primerTicketFisico] [int] NULL,
	[monto] [decimal](10, 2) NOT NULL,
	[idMetodoPago] [int] NOT NULL,
	[idPack] [int] NULL,
	[idCodigoPromocional] [int] NULL,
	[idTipoDocumento] [int] NOT NULL,
	[dni] [varchar](20) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[email] [varchar](250) NOT NULL,
	[idTipoResultado] [int] NULL,
	[idEstadoPago] [int] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_compraSorteo] PRIMARY KEY CLUSTERED 
(
	[idCompraSorteo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [pago].[estadoPago]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pago].[estadoPago](
	[idEstadoPago] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_estadoPago] PRIMARY KEY CLUSTERED 
(
	[idEstadoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [pago].[metodoPago]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pago].[metodoPago](
	[idMetodoPago] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_metodoPago] PRIMARY KEY CLUSTERED 
(
	[idMetodoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usuario].[paises]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usuario].[paises](
	[id] [int] NOT NULL,
	[code] [int] NULL,
	[iso1] [varchar](2) NULL,
	[iso2] [varchar](3) NULL,
	[nombre] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usuario].[tipoDocumento]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usuario].[tipoDocumento](
	[idTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_tipoDocumento] PRIMARY KEY CLUSTERED 
(
	[idTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usuario].[tipoUsuario]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usuario].[tipoUsuario](
	[idTipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_tipoUsuario] PRIMARY KEY CLUSTERED 
(
	[idTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usuario].[ubigeoPeruDepartments]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usuario].[ubigeoPeruDepartments](
	[id] [varchar](2) NOT NULL,
	[name] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usuario].[ubigeoPeruDistricts]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usuario].[ubigeoPeruDistricts](
	[id] [varchar](6) NOT NULL,
	[name] [varchar](45) NULL,
	[provinceId] [varchar](4) NULL,
	[departmentId] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usuario].[ubigeoPeruProvinces]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usuario].[ubigeoPeruProvinces](
	[id] [varchar](4) NOT NULL,
	[name] [varchar](45) NOT NULL,
	[departmentId] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [usuario].[Usuario]    Script Date: 30/10/2024 11:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [usuario].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombreUsuario] [varchar](150) NOT NULL,
	[nombres] [varchar](100) NOT NULL,
	[apellidos] [varchar](100) NOT NULL,
	[dni] [varchar](10) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[email] [varchar](150) NOT NULL,
	[direccion] [varchar](150) NOT NULL,
	[idPais] [int] NOT NULL,
	[idDepartamento] [varchar](2) NOT NULL,
	[idProvincia] [varchar](4) NOT NULL,
	[idDistrito] [varchar](6) NOT NULL,
	[codigoPostal] [varchar](10) NULL,
	[contrasena] [varchar](350) NOT NULL,
	[celular] [varchar](50) NOT NULL,
	[idTipoUsuario] [int] NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [juego].[codigoPromocional] ON 

INSERT [juego].[codigoPromocional] ([idCodigoPromocional], [idInfluencer], [codigo], [multiplicador], [activo]) VALUES (1, 1, N'Influ1_50', CAST(2.00 AS Decimal(10, 2)), 1)
INSERT [juego].[codigoPromocional] ([idCodigoPromocional], [idInfluencer], [codigo], [multiplicador], [activo]) VALUES (2, 1, N'Influ1_60', CAST(3.00 AS Decimal(10, 2)), 1)
INSERT [juego].[codigoPromocional] ([idCodigoPromocional], [idInfluencer], [codigo], [multiplicador], [activo]) VALUES (3, 2, N'Influ2_40', CAST(2.00 AS Decimal(10, 2)), 0)
INSERT [juego].[codigoPromocional] ([idCodigoPromocional], [idInfluencer], [codigo], [multiplicador], [activo]) VALUES (4, 2, N'Influ2_70', CAST(4.00 AS Decimal(10, 2)), 1)
SET IDENTITY_INSERT [juego].[codigoPromocional] OFF
GO
SET IDENTITY_INSERT [juego].[indicadorInfluencer] ON 

INSERT [juego].[indicadorInfluencer] ([idIndicadorInfluencer], [idCodigoPromocional], [fecha]) VALUES (1, 1, CAST(N'2024-10-17' AS Date))
INSERT [juego].[indicadorInfluencer] ([idIndicadorInfluencer], [idCodigoPromocional], [fecha]) VALUES (2, 2, CAST(N'2024-10-17' AS Date))
SET IDENTITY_INSERT [juego].[indicadorInfluencer] OFF
GO
SET IDENTITY_INSERT [juego].[Influencer] ON 

INSERT [juego].[Influencer] ([idInfluencer], [descripcion], [activo]) VALUES (1, N'Influencer 1', 1)
INSERT [juego].[Influencer] ([idInfluencer], [descripcion], [activo]) VALUES (2, N'Influencer 2', 1)
INSERT [juego].[Influencer] ([idInfluencer], [descripcion], [activo]) VALUES (3, N'Influencer 3', 0)
SET IDENTITY_INSERT [juego].[Influencer] OFF
GO
SET IDENTITY_INSERT [juego].[Juego] ON 

INSERT [juego].[Juego] ([idJuego], [nombre], [descripcion], [precio], [activo]) VALUES (1, N'Billete de la Fortuna', N'Juego billete de la fortuna', CAST(5.00 AS Decimal(10, 2)), 1)
INSERT [juego].[Juego] ([idJuego], [nombre], [descripcion], [precio], [activo]) VALUES (2, N'BF 25', N'BF 25 descrip', CAST(10.60 AS Decimal(10, 2)), 0)
SET IDENTITY_INSERT [juego].[Juego] OFF
GO
SET IDENTITY_INSERT [juego].[pack] ON 

INSERT [juego].[pack] ([idPack], [IdJuego], [IdSorteo], [descripcion], [multiplicador], [monto], [activo]) VALUES (1, 1, 1, N'Pack 30', CAST(2.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), 1)
INSERT [juego].[pack] ([idPack], [IdJuego], [IdSorteo], [descripcion], [multiplicador], [monto], [activo]) VALUES (2, 1, 1, N'Pack 40', CAST(2.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), 1)
INSERT [juego].[pack] ([idPack], [IdJuego], [IdSorteo], [descripcion], [multiplicador], [monto], [activo]) VALUES (3, 1, 1, N'Pack 50', CAST(2.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), 1)
INSERT [juego].[pack] ([idPack], [IdJuego], [IdSorteo], [descripcion], [multiplicador], [monto], [activo]) VALUES (8, 1, 3, N'Pack 25', CAST(2.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), 1)
INSERT [juego].[pack] ([idPack], [IdJuego], [IdSorteo], [descripcion], [multiplicador], [monto], [activo]) VALUES (9, 1, 3, N'Pack 45', CAST(2.00 AS Decimal(10, 2)), CAST(45.00 AS Decimal(10, 2)), 1)
INSERT [juego].[pack] ([idPack], [IdJuego], [IdSorteo], [descripcion], [multiplicador], [monto], [activo]) VALUES (10, 1, 3, N'Pack 65', CAST(2.00 AS Decimal(10, 2)), CAST(65.00 AS Decimal(10, 2)), 1)
INSERT [juego].[pack] ([idPack], [IdJuego], [IdSorteo], [descripcion], [multiplicador], [monto], [activo]) VALUES (11, 1, 1, N'Pack 60', CAST(2.00 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), 0)
SET IDENTITY_INSERT [juego].[pack] OFF
GO
SET IDENTITY_INSERT [juego].[Sorteo] ON 

INSERT [juego].[Sorteo] ([idSorteo], [idJuego], [fechaSorteo], [limiteInferiorOnline], [ticketGanador], [activo]) VALUES (1, 1, CAST(N'2024-10-07' AS Date), 1, N'00000', 1)
INSERT [juego].[Sorteo] ([idSorteo], [idJuego], [fechaSorteo], [limiteInferiorOnline], [ticketGanador], [activo]) VALUES (3, 1, CAST(N'2024-10-10' AS Date), 500, N'00000', 1)
INSERT [juego].[Sorteo] ([idSorteo], [idJuego], [fechaSorteo], [limiteInferiorOnline], [ticketGanador], [activo]) VALUES (4, 1, CAST(N'2024-10-06' AS Date), 1000, N'5215', 0)
INSERT [juego].[Sorteo] ([idSorteo], [idJuego], [fechaSorteo], [limiteInferiorOnline], [ticketGanador], [activo]) VALUES (5, 1, CAST(N'2024-10-06' AS Date), 1500, NULL, 0)
INSERT [juego].[Sorteo] ([idSorteo], [idJuego], [fechaSorteo], [limiteInferiorOnline], [ticketGanador], [activo]) VALUES (6, 1, NULL, NULL, N'5212', 0)
INSERT [juego].[Sorteo] ([idSorteo], [idJuego], [fechaSorteo], [limiteInferiorOnline], [ticketGanador], [activo]) VALUES (7, 1, CAST(N'2024-10-29' AS Date), 1000, NULL, 1)
SET IDENTITY_INSERT [juego].[Sorteo] OFF
GO
SET IDENTITY_INSERT [juego].[ticketSorteo] ON 

INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (906, 108, 1501, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (907, 108, 1502, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (908, 108, 1503, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (909, 108, 1504, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (910, 108, 1505, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (911, 108, 1506, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (912, 108, 1507, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (913, 108, 1508, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (914, 108, 1509, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (915, 108, 1510, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (916, 109, 500, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (917, 109, 501, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (918, 109, 502, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (919, 109, 503, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (920, 109, 504, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (921, 109, 505, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (922, 109, 506, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (923, 109, 507, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (924, 109, 508, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (925, 109, 509, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (926, 110, 1511, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (927, 110, 1512, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (928, 110, 1513, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (929, 110, 1514, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (930, 110, 1515, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (931, 110, 1516, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (932, 110, 1517, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (933, 110, 1518, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (934, 110, 1519, CAST(N'2024-10-30' AS Date), 3, 1)
INSERT [juego].[ticketSorteo] ([idTicketSorteo], [idCompraSorteo], [numeroTicket], [fecha], [idTipoResultado], [activo]) VALUES (935, 110, 1520, CAST(N'2024-10-30' AS Date), 3, 1)
SET IDENTITY_INSERT [juego].[ticketSorteo] OFF
GO
SET IDENTITY_INSERT [juego].[tipoResultado] ON 

INSERT [juego].[tipoResultado] ([idTipoResultado], [descripcion]) VALUES (1, N'Con Premio')
INSERT [juego].[tipoResultado] ([idTipoResultado], [descripcion]) VALUES (2, N'Sin Premio')
INSERT [juego].[tipoResultado] ([idTipoResultado], [descripcion]) VALUES (3, N'Sorteo pendiente')
SET IDENTITY_INSERT [juego].[tipoResultado] OFF
GO
SET IDENTITY_INSERT [juego].[tipoTicket] ON 

INSERT [juego].[tipoTicket] ([idTipoTicket], [descripcion]) VALUES (1, N'Fisico')
INSERT [juego].[tipoTicket] ([idTipoTicket], [descripcion]) VALUES (2, N'Virtual')
SET IDENTITY_INSERT [juego].[tipoTicket] OFF
GO
SET IDENTITY_INSERT [pago].[compraSorteo] ON 

INSERT [pago].[compraSorteo] ([idCompraSorteo], [idSorteo], [idUsuario], [idTipoUsuario], [fecha], [cantidadInicial], [cantidadFinal], [idTipoTicket], [primerTicketFisico], [monto], [idMetodoPago], [idPack], [idCodigoPromocional], [idTipoDocumento], [dni], [telefono], [email], [idTipoResultado], [idEstadoPago], [activo]) VALUES (108, 5, 1014, 1, CAST(N'2024-10-30' AS Date), 10, 10, 2, NULL, CAST(50.00 AS Decimal(10, 2)), 1, NULL, NULL, 1, N'00112233', N'923167601', N'escalante.nicolas@gmail.com', 3, 2, 1)
INSERT [pago].[compraSorteo] ([idCompraSorteo], [idSorteo], [idUsuario], [idTipoUsuario], [fecha], [cantidadInicial], [cantidadFinal], [idTipoTicket], [primerTicketFisico], [monto], [idMetodoPago], [idPack], [idCodigoPromocional], [idTipoDocumento], [dni], [telefono], [email], [idTipoResultado], [idEstadoPago], [activo]) VALUES (109, 5, 1014, 1, CAST(N'2024-10-30' AS Date), 10, 10, 1, 500, CAST(50.00 AS Decimal(10, 2)), 1, NULL, NULL, 1, N'00112233', N'923167601', N'escalante.nicolas@gmail.com', 3, 2, 1)
INSERT [pago].[compraSorteo] ([idCompraSorteo], [idSorteo], [idUsuario], [idTipoUsuario], [fecha], [cantidadInicial], [cantidadFinal], [idTipoTicket], [primerTicketFisico], [monto], [idMetodoPago], [idPack], [idCodigoPromocional], [idTipoDocumento], [dni], [telefono], [email], [idTipoResultado], [idEstadoPago], [activo]) VALUES (110, 5, 1014, 1, CAST(N'2024-10-30' AS Date), 10, 10, 2, NULL, CAST(50.00 AS Decimal(10, 2)), 1, NULL, NULL, 1, N'00112233', N'923167601', N'escalante.nicolas@gmail.com', 3, 2, 1)
SET IDENTITY_INSERT [pago].[compraSorteo] OFF
GO
SET IDENTITY_INSERT [pago].[estadoPago] ON 

INSERT [pago].[estadoPago] ([idEstadoPago], [descripcion]) VALUES (1, N'Pendiente')
INSERT [pago].[estadoPago] ([idEstadoPago], [descripcion]) VALUES (2, N'Pagado')
INSERT [pago].[estadoPago] ([idEstadoPago], [descripcion]) VALUES (3, N'Rechazado')
SET IDENTITY_INSERT [pago].[estadoPago] OFF
GO
SET IDENTITY_INSERT [pago].[metodoPago] ON 

INSERT [pago].[metodoPago] ([idMetodoPago], [descripcion], [activo]) VALUES (1, N'Efectivo', 1)
INSERT [pago].[metodoPago] ([idMetodoPago], [descripcion], [activo]) VALUES (2, N'Tarjeta', 1)
INSERT [pago].[metodoPago] ([idMetodoPago], [descripcion], [activo]) VALUES (3, N'Yape', 1)
INSERT [pago].[metodoPago] ([idMetodoPago], [descripcion], [activo]) VALUES (4, N'Plin', 1)
INSERT [pago].[metodoPago] ([idMetodoPago], [descripcion], [activo]) VALUES (5, N'PayPal', 1)
SET IDENTITY_INSERT [pago].[metodoPago] OFF
GO
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (1, 4, N'AF', N'AFG', N'Afganistán')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (2, 248, N'AX', N'ALA', N'Islas Gland')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (3, 8, N'AL', N'ALB', N'Albania')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (4, 276, N'DE', N'DEU', N'Alemania')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (5, 20, N'AD', N'AND', N'Andorra')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (6, 24, N'AO', N'AGO', N'Angola')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (7, 660, N'AI', N'AIA', N'Anguilla')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (8, 10, N'AQ', N'ATA', N'Antártida')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (9, 28, N'AG', N'ATG', N'Antigua y Barbuda')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (10, 530, N'AN', N'ANT', N'Antillas Holandesas')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (11, 682, N'SA', N'SAU', N'Arabia Saudí')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (12, 12, N'DZ', N'DZA', N'Argelia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (13, 32, N'AR', N'ARG', N'Argentina')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (14, 51, N'AM', N'ARM', N'Armenia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (15, 533, N'AW', N'ABW', N'Aruba')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (16, 36, N'AU', N'AUS', N'Australia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (17, 40, N'AT', N'AUT', N'Austria')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (18, 31, N'AZ', N'AZE', N'Azerbaiyán')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (19, 44, N'BS', N'BHS', N'Bahamas')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (20, 48, N'BH', N'BHR', N'Bahréin')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (21, 50, N'BD', N'BGD', N'Bangladesh')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (22, 52, N'BB', N'BRB', N'Barbados')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (23, 112, N'BY', N'BLR', N'Bielorrusia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (24, 56, N'BE', N'BEL', N'Bélgica')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (25, 84, N'BZ', N'BLZ', N'Belice')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (26, 204, N'BJ', N'BEN', N'Benin')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (27, 60, N'BM', N'BMU', N'Bermudas')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (28, 64, N'BT', N'BTN', N'Bhután')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (29, 68, N'BO', N'BOL', N'Bolivia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (30, 70, N'BA', N'BIH', N'Bosnia y Herzegovina')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (31, 72, N'BW', N'BWA', N'Botsuana')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (32, 74, N'BV', N'BVT', N'Isla Bouvet')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (33, 76, N'BR', N'BRA', N'Brasil')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (34, 96, N'BN', N'BRN', N'Brunéi')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (35, 100, N'BG', N'BGR', N'Bulgaria')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (36, 854, N'BF', N'BFA', N'Burkina Faso')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (37, 108, N'BI', N'BDI', N'Burundi')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (38, 132, N'CV', N'CPV', N'Cabo Verde')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (39, 136, N'KY', N'CYM', N'Islas Caimán')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (40, 116, N'KH', N'KHM', N'Camboya')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (41, 120, N'CM', N'CMR', N'Camerún')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (42, 124, N'CA', N'CAN', N'Canadá')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (43, 140, N'CF', N'CAF', N'República Centroafricana')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (44, 148, N'TD', N'TCD', N'Chad')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (45, 203, N'CZ', N'CZE', N'República Checa')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (46, 152, N'CL', N'CHL', N'Chile')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (47, 156, N'CN', N'CHN', N'China')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (48, 196, N'CY', N'CYP', N'Chipre')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (49, 162, N'CX', N'CXR', N'Isla de Navidad')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (50, 336, N'VA', N'VAT', N'Ciudad del Vaticano')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (51, 166, N'CC', N'CCK', N'Islas Cocos')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (52, 170, N'CO', N'COL', N'Colombia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (53, 174, N'KM', N'COM', N'Comoras')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (54, 180, N'CD', N'COD', N'República Democrática del Congo')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (55, 178, N'CG', N'COG', N'Congo')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (56, 184, N'CK', N'COK', N'Islas Cook')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (57, 408, N'KP', N'PRK', N'Corea del Norte')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (58, 410, N'KR', N'KOR', N'Corea del Sur')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (59, 384, N'CI', N'CIV', N'Costa de Marfil')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (60, 188, N'CR', N'CRI', N'Costa Rica')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (61, 191, N'HR', N'HRV', N'Croacia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (62, 192, N'CU', N'CUB', N'Cuba')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (63, 208, N'DK', N'DNK', N'Dinamarca')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (64, 212, N'DM', N'DMA', N'Dominica')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (65, 214, N'DO', N'DOM', N'República Dominicana')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (66, 218, N'EC', N'ECU', N'Ecuador')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (67, 818, N'EG', N'EGY', N'Egipto')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (68, 222, N'SV', N'SLV', N'El Salvador')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (69, 784, N'AE', N'ARE', N'Emiratos Árabes Unidos')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (70, 232, N'ER', N'ERI', N'Eritrea')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (71, 703, N'SK', N'SVK', N'Eslovaquia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (72, 705, N'SI', N'SVN', N'Eslovenia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (73, 724, N'ES', N'ESP', N'España')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (74, 581, N'UM', N'UMI', N'Islas ultramarinas de Estados Unidos')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (75, 840, N'US', N'USA', N'Estados Unidos')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (76, 233, N'EE', N'EST', N'Estonia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (77, 231, N'ET', N'ETH', N'Etiopía')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (78, 234, N'FO', N'FRO', N'Islas Feroe')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (79, 608, N'PH', N'PHL', N'Filipinas')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (80, 246, N'FI', N'FIN', N'Finlandia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (81, 242, N'FJ', N'FJI', N'Fiyi')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (82, 250, N'FR', N'FRA', N'Francia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (83, 266, N'GA', N'GAB', N'Gabón')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (84, 270, N'GM', N'GMB', N'Gambia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (85, 268, N'GE', N'GEO', N'Georgia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (86, 239, N'GS', N'SGS', N'Islas Georgias del Sur y Sandwich del Sur')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (87, 288, N'GH', N'GHA', N'Ghana')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (88, 292, N'GI', N'GIB', N'Gibraltar')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (89, 308, N'GD', N'GRD', N'Granada')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (90, 300, N'GR', N'GRC', N'Grecia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (91, 304, N'GL', N'GRL', N'Groenlandia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (92, 312, N'GP', N'GLP', N'Guadalupe')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (93, 316, N'GU', N'GUM', N'Guam')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (94, 320, N'GT', N'GTM', N'Guatemala')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (95, 254, N'GF', N'GUF', N'Guayana Francesa')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (96, 324, N'GN', N'GIN', N'Guinea')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (97, 226, N'GQ', N'GNQ', N'Guinea Ecuatorial')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (98, 624, N'GW', N'GNB', N'Guinea-Bissau')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (99, 328, N'GY', N'GUY', N'Guyana')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (100, 332, N'HT', N'HTI', N'Haití')
GO
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (101, 334, N'HM', N'HMD', N'Islas Heard y McDonald')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (102, 340, N'HN', N'HND', N'Honduras')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (103, 344, N'HK', N'HKG', N'Hong Kong')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (104, 348, N'HU', N'HUN', N'Hungría')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (105, 356, N'IN', N'IND', N'India')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (106, 360, N'ID', N'IDN', N'Indonesia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (107, 364, N'IR', N'IRN', N'Irán')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (108, 368, N'IQ', N'IRQ', N'Iraq')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (109, 372, N'IE', N'IRL', N'Irlanda')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (110, 352, N'IS', N'ISL', N'Islandia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (111, 376, N'IL', N'ISR', N'Israel')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (112, 380, N'IT', N'ITA', N'Italia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (113, 388, N'JM', N'JAM', N'Jamaica')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (114, 392, N'JP', N'JPN', N'Japón')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (115, 400, N'JO', N'JOR', N'Jordania')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (116, 398, N'KZ', N'KAZ', N'Kazajstán')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (117, 404, N'KE', N'KEN', N'Kenia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (118, 417, N'KG', N'KGZ', N'Kirguistán')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (119, 296, N'KI', N'KIR', N'Kiribati')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (120, 414, N'KW', N'KWT', N'Kuwait')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (121, 418, N'LA', N'LAO', N'Laos')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (122, 426, N'LS', N'LSO', N'Lesotho')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (123, 428, N'LV', N'LVA', N'Letonia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (124, 422, N'LB', N'LBN', N'Líbano')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (125, 430, N'LR', N'LBR', N'Liberia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (126, 434, N'LY', N'LBY', N'Libia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (127, 438, N'LI', N'LIE', N'Liechtenstein')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (128, 440, N'LT', N'LTU', N'Lituania')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (129, 442, N'LU', N'LUX', N'Luxemburgo')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (130, 446, N'MO', N'MAC', N'Macao')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (131, 807, N'MK', N'MKD', N'ARY Macedonia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (132, 450, N'MG', N'MDG', N'Madagascar')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (133, 458, N'MY', N'MYS', N'Malasia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (134, 454, N'MW', N'MWI', N'Malawi')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (135, 462, N'MV', N'MDV', N'Maldivas')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (136, 466, N'ML', N'MLI', N'Malí')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (137, 470, N'MT', N'MLT', N'Malta')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (138, 238, N'FK', N'FLK', N'Islas Malvinas')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (139, 580, N'MP', N'MNP', N'Islas Marianas del Norte')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (140, 504, N'MA', N'MAR', N'Marruecos')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (141, 584, N'MH', N'MHL', N'Islas Marshall')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (142, 474, N'MQ', N'MTQ', N'Martinica')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (143, 480, N'MU', N'MUS', N'Mauricio')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (144, 478, N'MR', N'MRT', N'Mauritania')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (145, 175, N'YT', N'MYT', N'Mayotte')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (146, 484, N'MX', N'MEX', N'México')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (147, 583, N'FM', N'FSM', N'Micronesia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (148, 498, N'MD', N'MDA', N'Moldavia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (149, 492, N'MC', N'MCO', N'Mónaco')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (150, 496, N'MN', N'MNG', N'Mongolia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (151, 500, N'MS', N'MSR', N'Montserrat')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (152, 508, N'MZ', N'MOZ', N'Mozambique')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (153, 104, N'MM', N'MMR', N'Myanmar')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (154, 516, N'NA', N'NAM', N'Namibia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (155, 520, N'NR', N'NRU', N'Nauru')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (156, 524, N'NP', N'NPL', N'Nepal')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (157, 558, N'NI', N'NIC', N'Nicaragua')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (158, 562, N'NE', N'NER', N'Níger')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (159, 566, N'NG', N'NGA', N'Nigeria')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (160, 570, N'NU', N'NIU', N'Niue')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (161, 574, N'NF', N'NFK', N'Isla Norfolk')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (162, 578, N'NO', N'NOR', N'Noruega')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (163, 540, N'NC', N'NCL', N'Nueva Caledonia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (164, 554, N'NZ', N'NZL', N'Nueva Zelanda')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (165, 512, N'OM', N'OMN', N'Omán')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (166, 528, N'NL', N'NLD', N'Países Bajos')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (167, 586, N'PK', N'PAK', N'Pakistán')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (168, 585, N'PW', N'PLW', N'Palau')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (169, 275, N'PS', N'PSE', N'Palestina')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (170, 591, N'PA', N'PAN', N'Panamá')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (171, 598, N'PG', N'PNG', N'Papúa Nueva Guinea')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (172, 600, N'PY', N'PRY', N'Paraguay')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (173, 604, N'PE', N'PER', N'Perú')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (174, 612, N'PN', N'PCN', N'Islas Pitcairn')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (175, 258, N'PF', N'PYF', N'Polinesia Francesa')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (176, 616, N'PL', N'POL', N'Polonia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (177, 620, N'PT', N'PRT', N'Portugal')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (178, 630, N'PR', N'PRI', N'Puerto Rico')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (179, 634, N'QA', N'QAT', N'Qatar')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (180, 826, N'GB', N'GBR', N'Reino Unido')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (181, 638, N'RE', N'REU', N'Reunión')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (182, 646, N'RW', N'RWA', N'Ruanda')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (183, 642, N'RO', N'ROU', N'Rumania')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (184, 643, N'RU', N'RUS', N'Rusia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (185, 732, N'EH', N'ESH', N'Sahara Occidental')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (186, 90, N'SB', N'SLB', N'Islas Salomón')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (187, 882, N'WS', N'WSM', N'Samoa')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (188, 16, N'AS', N'ASM', N'Samoa Americana')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (189, 659, N'KN', N'KNA', N'San Cristóbal y Nevis')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (190, 674, N'SM', N'SMR', N'San Marino')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (191, 666, N'PM', N'SPM', N'San Pedro y Miquelón')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (192, 670, N'VC', N'VCT', N'San Vicente y las Granadinas')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (193, 654, N'SH', N'SHN', N'Santa Helena')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (194, 662, N'LC', N'LCA', N'Santa Lucía')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (195, 678, N'ST', N'STP', N'Santo Tomé y Príncipe')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (196, 686, N'SN', N'SEN', N'Senegal')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (197, 891, N'CS', N'SCG', N'Serbia y Montenegro')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (198, 690, N'SC', N'SYC', N'Seychelles')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (199, 694, N'SL', N'SLE', N'Sierra Leona')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (200, 702, N'SG', N'SGP', N'Singapur')
GO
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (201, 760, N'SY', N'SYR', N'Siria')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (202, 706, N'SO', N'SOM', N'Somalia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (203, 144, N'LK', N'LKA', N'Sri Lanka')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (204, 748, N'SZ', N'SWZ', N'Suazilandia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (205, 710, N'ZA', N'ZAF', N'Sudáfrica')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (206, 736, N'SD', N'SDN', N'Sudán')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (207, 752, N'SE', N'SWE', N'Suecia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (208, 756, N'CH', N'CHE', N'Suiza')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (209, 740, N'SR', N'SUR', N'Surinam')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (210, 744, N'SJ', N'SJM', N'Svalbard y Jan Mayen')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (211, 764, N'TH', N'THA', N'Tailandia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (212, 158, N'TW', N'TWN', N'Taiwán')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (213, 834, N'TZ', N'TZA', N'Tanzania')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (214, 762, N'TJ', N'TJK', N'Tayikistán')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (215, 86, N'IO', N'IOT', N'Territorio Británico del Océano Índico')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (216, 260, N'TF', N'ATF', N'Territorios Australes Franceses')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (217, 626, N'TL', N'TLS', N'Timor Oriental')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (218, 768, N'TG', N'TGO', N'Togo')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (219, 772, N'TK', N'TKL', N'Tokelau')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (220, 776, N'TO', N'TON', N'Tonga')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (221, 780, N'TT', N'TTO', N'Trinidad y Tobago')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (222, 788, N'TN', N'TUN', N'Túnez')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (223, 796, N'TC', N'TCA', N'Islas Turcas y Caicos')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (224, 795, N'TM', N'TKM', N'Turkmenistán')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (225, 792, N'TR', N'TUR', N'Turquía')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (226, 798, N'TV', N'TUV', N'Tuvalu')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (227, 804, N'UA', N'UKR', N'Ucrania')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (228, 800, N'UG', N'UGA', N'Uganda')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (229, 858, N'UY', N'URY', N'Uruguay')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (230, 860, N'UZ', N'UZB', N'Uzbekistán')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (231, 548, N'VU', N'VUT', N'Vanuatu')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (232, 862, N'VE', N'VEN', N'Venezuela')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (233, 704, N'VN', N'VNM', N'Vietnam')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (234, 92, N'VG', N'VGB', N'Islas Vírgenes Británicas')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (235, 850, N'VI', N'VIR', N'Islas Vírgenes de los Estados Unidos')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (236, 876, N'WF', N'WLF', N'Wallis y Futuna')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (237, 887, N'YE', N'YEM', N'Yemen')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (238, 262, N'DJ', N'DJI', N'Yibuti')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (239, 894, N'ZM', N'ZMB', N'Zambia')
INSERT [usuario].[paises] ([id], [code], [iso1], [iso2], [nombre]) VALUES (240, 716, N'ZW', N'ZWE', N'Zimbabue')
GO
SET IDENTITY_INSERT [usuario].[tipoDocumento] ON 

INSERT [usuario].[tipoDocumento] ([idTipoDocumento], [descripcion], [activo]) VALUES (1, N'DNI', 1)
INSERT [usuario].[tipoDocumento] ([idTipoDocumento], [descripcion], [activo]) VALUES (2, N'CARNET DE EXTRANJERIA', 1)
SET IDENTITY_INSERT [usuario].[tipoDocumento] OFF
GO
SET IDENTITY_INSERT [usuario].[tipoUsuario] ON 

INSERT [usuario].[tipoUsuario] ([idTipoUsuario], [descripcion]) VALUES (1, N'USER')
INSERT [usuario].[tipoUsuario] ([idTipoUsuario], [descripcion]) VALUES (2, N'SELLER')
INSERT [usuario].[tipoUsuario] ([idTipoUsuario], [descripcion]) VALUES (3, N'ADMIN')
SET IDENTITY_INSERT [usuario].[tipoUsuario] OFF
GO
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'01', N'Amazonas')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'02', N'Áncash')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'03', N'Apurímac')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'04', N'Arequipa')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'05', N'Ayacucho')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'06', N'Cajamarca')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'07', N'Callao')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'08', N'Cusco')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'09', N'Huancavelica')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'10', N'Huánuco')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'11', N'Ica')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'12', N'Junín')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'13', N'La Libertad')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'14', N'Lambayeque')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'15', N'Lima')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'16', N'Loreto')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'17', N'Madre de Dios')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'18', N'Moquegua')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'19', N'Pasco')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'20', N'Piura')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'21', N'Puno')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'22', N'San Martín')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'23', N'Tacna')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'24', N'Tumbes')
INSERT [usuario].[ubigeoPeruDepartments] ([id], [name]) VALUES (N'25', N'Ucayali')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010101', N'Chachapoyas', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010102', N'Asunción', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010103', N'Balsas', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010104', N'Cheto', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010105', N'Chiliquin', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010106', N'Chuquibamba', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010107', N'Granada', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010108', N'Huancas', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010109', N'La Jalca', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010110', N'Leimebamba', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010111', N'Levanto', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010112', N'Magdalena', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010113', N'Mariscal Castilla', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010114', N'Molinopampa', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010115', N'Montevideo', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010116', N'Olleros', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010117', N'Quinjalca', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010118', N'San Francisco de Daguas', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010119', N'San Isidro de Maino', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010120', N'Soloco', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010121', N'Sonche', N'0101', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010201', N'Bagua', N'0102', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010202', N'Aramango', N'0102', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010203', N'Copallin', N'0102', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010204', N'El Parco', N'0102', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010205', N'Imaza', N'0102', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010206', N'La Peca', N'0102', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010301', N'Jumbilla', N'0103', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010302', N'Chisquilla', N'0103', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010303', N'Churuja', N'0103', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010304', N'Corosha', N'0103', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010305', N'Cuispes', N'0103', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010306', N'Florida', N'0103', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010307', N'Jazan', N'0103', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010308', N'Recta', N'0103', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010309', N'San Carlos', N'0103', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010310', N'Shipasbamba', N'0103', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010311', N'Valera', N'0103', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010312', N'Yambrasbamba', N'0103', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010401', N'Nieva', N'0104', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010402', N'El Cenepa', N'0104', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010403', N'Río Santiago', N'0104', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010501', N'Lamud', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010502', N'Camporredondo', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010503', N'Cocabamba', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010504', N'Colcamar', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010505', N'Conila', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010506', N'Inguilpata', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010507', N'Longuita', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010508', N'Lonya Chico', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010509', N'Luya', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010510', N'Luya Viejo', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010511', N'María', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010512', N'Ocalli', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010513', N'Ocumal', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010514', N'Pisuquia', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010515', N'Providencia', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010516', N'San Cristóbal', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010517', N'San Francisco de Yeso', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010518', N'San Jerónimo', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010519', N'San Juan de Lopecancha', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010520', N'Santa Catalina', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010521', N'Santo Tomas', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010522', N'Tingo', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010523', N'Trita', N'0105', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010601', N'San Nicolás', N'0106', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010602', N'Chirimoto', N'0106', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010603', N'Cochamal', N'0106', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010604', N'Huambo', N'0106', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010605', N'Limabamba', N'0106', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010606', N'Longar', N'0106', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010607', N'Mariscal Benavides', N'0106', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010608', N'Milpuc', N'0106', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010609', N'Omia', N'0106', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010610', N'Santa Rosa', N'0106', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010611', N'Totora', N'0106', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010612', N'Vista Alegre', N'0106', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010701', N'Bagua Grande', N'0107', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010702', N'Cajaruro', N'0107', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010703', N'Cumba', N'0107', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010704', N'El Milagro', N'0107', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010705', N'Jamalca', N'0107', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010706', N'Lonya Grande', N'0107', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'010707', N'Yamon', N'0107', N'01')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020101', N'Huaraz', N'0201', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020102', N'Cochabamba', N'0201', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020103', N'Colcabamba', N'0201', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020104', N'Huanchay', N'0201', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020105', N'Independencia', N'0201', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020106', N'Jangas', N'0201', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020107', N'La Libertad', N'0201', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020108', N'Olleros', N'0201', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020109', N'Pampas Grande', N'0201', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020110', N'Pariacoto', N'0201', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020111', N'Pira', N'0201', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020112', N'Tarica', N'0201', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020201', N'Aija', N'0202', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020202', N'Coris', N'0202', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020203', N'Huacllan', N'0202', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020204', N'La Merced', N'0202', N'02')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020205', N'Succha', N'0202', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020301', N'Llamellin', N'0203', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020302', N'Aczo', N'0203', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020303', N'Chaccho', N'0203', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020304', N'Chingas', N'0203', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020305', N'Mirgas', N'0203', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020306', N'San Juan de Rontoy', N'0203', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020401', N'Chacas', N'0204', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020402', N'Acochaca', N'0204', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020501', N'Chiquian', N'0205', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020502', N'Abelardo Pardo Lezameta', N'0205', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020503', N'Antonio Raymondi', N'0205', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020504', N'Aquia', N'0205', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020505', N'Cajacay', N'0205', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020506', N'Canis', N'0205', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020507', N'Colquioc', N'0205', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020508', N'Huallanca', N'0205', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020509', N'Huasta', N'0205', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020510', N'Huayllacayan', N'0205', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020511', N'La Primavera', N'0205', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020512', N'Mangas', N'0205', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020513', N'Pacllon', N'0205', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020514', N'San Miguel de Corpanqui', N'0205', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020515', N'Ticllos', N'0205', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020601', N'Carhuaz', N'0206', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020602', N'Acopampa', N'0206', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020603', N'Amashca', N'0206', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020604', N'Anta', N'0206', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020605', N'Ataquero', N'0206', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020606', N'Marcara', N'0206', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020607', N'Pariahuanca', N'0206', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020608', N'San Miguel de Aco', N'0206', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020609', N'Shilla', N'0206', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020610', N'Tinco', N'0206', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020611', N'Yungar', N'0206', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020701', N'San Luis', N'0207', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020702', N'San Nicolás', N'0207', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020703', N'Yauya', N'0207', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020801', N'Casma', N'0208', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020802', N'Buena Vista Alta', N'0208', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020803', N'Comandante Noel', N'0208', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020804', N'Yautan', N'0208', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020901', N'Corongo', N'0209', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020902', N'Aco', N'0209', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020903', N'Bambas', N'0209', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020904', N'Cusca', N'0209', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020905', N'La Pampa', N'0209', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020906', N'Yanac', N'0209', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'020907', N'Yupan', N'0209', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021001', N'Huari', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021002', N'Anra', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021003', N'Cajay', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021004', N'Chavin de Huantar', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021005', N'Huacachi', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021006', N'Huacchis', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021007', N'Huachis', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021008', N'Huantar', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021009', N'Masin', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021010', N'Paucas', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021011', N'Ponto', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021012', N'Rahuapampa', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021013', N'Rapayan', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021014', N'San Marcos', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021015', N'San Pedro de Chana', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021016', N'Uco', N'0210', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021101', N'Huarmey', N'0211', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021102', N'Cochapeti', N'0211', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021103', N'Culebras', N'0211', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021104', N'Huayan', N'0211', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021105', N'Malvas', N'0211', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021201', N'Caraz', N'0212', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021202', N'Huallanca', N'0212', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021203', N'Huata', N'0212', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021204', N'Huaylas', N'0212', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021205', N'Mato', N'0212', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021206', N'Pamparomas', N'0212', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021207', N'Pueblo Libre', N'0212', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021208', N'Santa Cruz', N'0212', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021209', N'Santo Toribio', N'0212', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021210', N'Yuracmarca', N'0212', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021301', N'Piscobamba', N'0213', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021302', N'Casca', N'0213', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021303', N'Eleazar Guzmán Barron', N'0213', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021304', N'Fidel Olivas Escudero', N'0213', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021305', N'Llama', N'0213', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021306', N'Llumpa', N'0213', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021307', N'Lucma', N'0213', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021308', N'Musga', N'0213', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021401', N'Ocros', N'0214', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021402', N'Acas', N'0214', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021403', N'Cajamarquilla', N'0214', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021404', N'Carhuapampa', N'0214', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021405', N'Cochas', N'0214', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021406', N'Congas', N'0214', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021407', N'Llipa', N'0214', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021408', N'San Cristóbal de Rajan', N'0214', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021409', N'San Pedro', N'0214', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021410', N'Santiago de Chilcas', N'0214', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021501', N'Cabana', N'0215', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021502', N'Bolognesi', N'0215', N'02')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021503', N'Conchucos', N'0215', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021504', N'Huacaschuque', N'0215', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021505', N'Huandoval', N'0215', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021506', N'Lacabamba', N'0215', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021507', N'Llapo', N'0215', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021508', N'Pallasca', N'0215', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021509', N'Pampas', N'0215', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021510', N'Santa Rosa', N'0215', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021511', N'Tauca', N'0215', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021601', N'Pomabamba', N'0216', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021602', N'Huayllan', N'0216', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021603', N'Parobamba', N'0216', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021604', N'Quinuabamba', N'0216', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021701', N'Recuay', N'0217', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021702', N'Catac', N'0217', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021703', N'Cotaparaco', N'0217', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021704', N'Huayllapampa', N'0217', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021705', N'Llacllin', N'0217', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021706', N'Marca', N'0217', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021707', N'Pampas Chico', N'0217', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021708', N'Pararin', N'0217', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021709', N'Tapacocha', N'0217', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021710', N'Ticapampa', N'0217', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021801', N'Chimbote', N'0218', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021802', N'Cáceres del Perú', N'0218', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021803', N'Coishco', N'0218', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021804', N'Macate', N'0218', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021805', N'Moro', N'0218', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021806', N'Nepeña', N'0218', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021807', N'Samanco', N'0218', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021808', N'Santa', N'0218', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021809', N'Nuevo Chimbote', N'0218', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021901', N'Sihuas', N'0219', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021902', N'Acobamba', N'0219', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021903', N'Alfonso Ugarte', N'0219', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021904', N'Cashapampa', N'0219', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021905', N'Chingalpo', N'0219', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021906', N'Huayllabamba', N'0219', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021907', N'Quiches', N'0219', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021908', N'Ragash', N'0219', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021909', N'San Juan', N'0219', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'021910', N'Sicsibamba', N'0219', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'022001', N'Yungay', N'0220', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'022002', N'Cascapara', N'0220', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'022003', N'Mancos', N'0220', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'022004', N'Matacoto', N'0220', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'022005', N'Quillo', N'0220', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'022006', N'Ranrahirca', N'0220', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'022007', N'Shupluy', N'0220', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'022008', N'Yanama', N'0220', N'02')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030101', N'Abancay', N'0301', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030102', N'Chacoche', N'0301', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030103', N'Circa', N'0301', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030104', N'Curahuasi', N'0301', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030105', N'Huanipaca', N'0301', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030106', N'Lambrama', N'0301', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030107', N'Pichirhua', N'0301', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030108', N'San Pedro de Cachora', N'0301', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030109', N'Tamburco', N'0301', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030201', N'Andahuaylas', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030202', N'Andarapa', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030203', N'Chiara', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030204', N'Huancarama', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030205', N'Huancaray', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030206', N'Huayana', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030207', N'Kishuara', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030208', N'Pacobamba', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030209', N'Pacucha', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030210', N'Pampachiri', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030211', N'Pomacocha', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030212', N'San Antonio de Cachi', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030213', N'San Jerónimo', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030214', N'San Miguel de Chaccrampa', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030215', N'Santa María de Chicmo', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030216', N'Talavera', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030217', N'Tumay Huaraca', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030218', N'Turpo', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030219', N'Kaquiabamba', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030220', N'José María Arguedas', N'0302', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030301', N'Antabamba', N'0303', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030302', N'El Oro', N'0303', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030303', N'Huaquirca', N'0303', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030304', N'Juan Espinoza Medrano', N'0303', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030305', N'Oropesa', N'0303', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030306', N'Pachaconas', N'0303', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030307', N'Sabaino', N'0303', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030401', N'Chalhuanca', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030402', N'Capaya', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030403', N'Caraybamba', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030404', N'Chapimarca', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030405', N'Colcabamba', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030406', N'Cotaruse', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030407', N'Ihuayllo', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030408', N'Justo Apu Sahuaraura', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030409', N'Lucre', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030410', N'Pocohuanca', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030411', N'San Juan de Chacña', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030412', N'Sañayca', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030413', N'Soraya', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030414', N'Tapairihua', N'0304', N'03')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030415', N'Tintay', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030416', N'Toraya', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030417', N'Yanaca', N'0304', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030501', N'Tambobamba', N'0305', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030502', N'Cotabambas', N'0305', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030503', N'Coyllurqui', N'0305', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030504', N'Haquira', N'0305', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030505', N'Mara', N'0305', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030506', N'Challhuahuacho', N'0305', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030601', N'Chincheros', N'0306', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030602', N'Anco_Huallo', N'0306', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030603', N'Cocharcas', N'0306', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030604', N'Huaccana', N'0306', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030605', N'Ocobamba', N'0306', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030606', N'Ongoy', N'0306', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030607', N'Uranmarca', N'0306', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030608', N'Ranracancha', N'0306', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030609', N'Rocchacc', N'0306', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030610', N'El Porvenir', N'0306', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030611', N'Los Chankas', N'0306', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030701', N'Chuquibambilla', N'0307', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030702', N'Curpahuasi', N'0307', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030703', N'Gamarra', N'0307', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030704', N'Huayllati', N'0307', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030705', N'Mamara', N'0307', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030706', N'Micaela Bastidas', N'0307', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030707', N'Pataypampa', N'0307', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030708', N'Progreso', N'0307', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030709', N'San Antonio', N'0307', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030710', N'Santa Rosa', N'0307', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030711', N'Turpay', N'0307', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030712', N'Vilcabamba', N'0307', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030713', N'Virundo', N'0307', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'030714', N'Curasco', N'0307', N'03')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040101', N'Arequipa', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040102', N'Alto Selva Alegre', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040103', N'Cayma', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040104', N'Cerro Colorado', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040105', N'Characato', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040106', N'Chiguata', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040107', N'Jacobo Hunter', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040108', N'La Joya', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040109', N'Mariano Melgar', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040110', N'Miraflores', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040111', N'Mollebaya', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040112', N'Paucarpata', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040113', N'Pocsi', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040114', N'Polobaya', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040115', N'Quequeña', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040116', N'Sabandia', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040117', N'Sachaca', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040118', N'San Juan de Siguas', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040119', N'San Juan de Tarucani', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040120', N'Santa Isabel de Siguas', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040121', N'Santa Rita de Siguas', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040122', N'Socabaya', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040123', N'Tiabaya', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040124', N'Uchumayo', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040125', N'Vitor', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040126', N'Yanahuara', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040127', N'Yarabamba', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040128', N'Yura', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040129', N'José Luis Bustamante Y Rivero', N'0401', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040201', N'Camaná', N'0402', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040202', N'José María Quimper', N'0402', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040203', N'Mariano Nicolás Valcárcel', N'0402', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040204', N'Mariscal Cáceres', N'0402', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040205', N'Nicolás de Pierola', N'0402', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040206', N'Ocoña', N'0402', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040207', N'Quilca', N'0402', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040208', N'Samuel Pastor', N'0402', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040301', N'Caravelí', N'0403', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040302', N'Acarí', N'0403', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040303', N'Atico', N'0403', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040304', N'Atiquipa', N'0403', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040305', N'Bella Unión', N'0403', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040306', N'Cahuacho', N'0403', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040307', N'Chala', N'0403', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040308', N'Chaparra', N'0403', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040309', N'Huanuhuanu', N'0403', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040310', N'Jaqui', N'0403', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040311', N'Lomas', N'0403', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040312', N'Quicacha', N'0403', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040313', N'Yauca', N'0403', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040401', N'Aplao', N'0404', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040402', N'Andagua', N'0404', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040403', N'Ayo', N'0404', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040404', N'Chachas', N'0404', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040405', N'Chilcaymarca', N'0404', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040406', N'Choco', N'0404', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040407', N'Huancarqui', N'0404', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040408', N'Machaguay', N'0404', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040409', N'Orcopampa', N'0404', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040410', N'Pampacolca', N'0404', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040411', N'Tipan', N'0404', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040412', N'Uñon', N'0404', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040413', N'Uraca', N'0404', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040414', N'Viraco', N'0404', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040501', N'Chivay', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040502', N'Achoma', N'0405', N'04')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040503', N'Cabanaconde', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040504', N'Callalli', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040505', N'Caylloma', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040506', N'Coporaque', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040507', N'Huambo', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040508', N'Huanca', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040509', N'Ichupampa', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040510', N'Lari', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040511', N'Lluta', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040512', N'Maca', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040513', N'Madrigal', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040514', N'San Antonio de Chuca', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040515', N'Sibayo', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040516', N'Tapay', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040517', N'Tisco', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040518', N'Tuti', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040519', N'Yanque', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040520', N'Majes', N'0405', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040601', N'Chuquibamba', N'0406', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040602', N'Andaray', N'0406', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040603', N'Cayarani', N'0406', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040604', N'Chichas', N'0406', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040605', N'Iray', N'0406', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040606', N'Río Grande', N'0406', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040607', N'Salamanca', N'0406', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040608', N'Yanaquihua', N'0406', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040701', N'Mollendo', N'0407', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040702', N'Cocachacra', N'0407', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040703', N'Dean Valdivia', N'0407', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040704', N'Islay', N'0407', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040705', N'Mejia', N'0407', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040706', N'Punta de Bombón', N'0407', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040801', N'Cotahuasi', N'0408', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040802', N'Alca', N'0408', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040803', N'Charcana', N'0408', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040804', N'Huaynacotas', N'0408', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040805', N'Pampamarca', N'0408', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040806', N'Puyca', N'0408', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040807', N'Quechualla', N'0408', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040808', N'Sayla', N'0408', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040809', N'Tauria', N'0408', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040810', N'Tomepampa', N'0408', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'040811', N'Toro', N'0408', N'04')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050101', N'Ayacucho', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050102', N'Acocro', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050103', N'Acos Vinchos', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050104', N'Carmen Alto', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050105', N'Chiara', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050106', N'Ocros', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050107', N'Pacaycasa', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050108', N'Quinua', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050109', N'San José de Ticllas', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050110', N'San Juan Bautista', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050111', N'Santiago de Pischa', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050112', N'Socos', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050113', N'Tambillo', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050114', N'Vinchos', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050115', N'Jesús Nazareno', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050116', N'Andrés Avelino Cáceres Dorregaray', N'0501', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050201', N'Cangallo', N'0502', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050202', N'Chuschi', N'0502', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050203', N'Los Morochucos', N'0502', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050204', N'María Parado de Bellido', N'0502', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050205', N'Paras', N'0502', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050206', N'Totos', N'0502', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050301', N'Sancos', N'0503', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050302', N'Carapo', N'0503', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050303', N'Sacsamarca', N'0503', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050304', N'Santiago de Lucanamarca', N'0503', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050401', N'Huanta', N'0504', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050402', N'Ayahuanco', N'0504', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050403', N'Huamanguilla', N'0504', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050404', N'Iguain', N'0504', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050405', N'Luricocha', N'0504', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050406', N'Santillana', N'0504', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050407', N'Sivia', N'0504', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050408', N'Llochegua', N'0504', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050409', N'Canayre', N'0504', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050410', N'Uchuraccay', N'0504', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050411', N'Pucacolpa', N'0504', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050412', N'Chaca', N'0504', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050501', N'San Miguel', N'0505', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050502', N'Anco', N'0505', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050503', N'Ayna', N'0505', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050504', N'Chilcas', N'0505', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050505', N'Chungui', N'0505', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050506', N'Luis Carranza', N'0505', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050507', N'Santa Rosa', N'0505', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050508', N'Tambo', N'0505', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050509', N'Samugari', N'0505', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050510', N'Anchihuay', N'0505', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050511', N'Oronccoy', N'0505', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050601', N'Puquio', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050602', N'Aucara', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050603', N'Cabana', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050604', N'Carmen Salcedo', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050605', N'Chaviña', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050606', N'Chipao', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050607', N'Huac-Huas', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050608', N'Laramate', N'0506', N'05')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050609', N'Leoncio Prado', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050610', N'Llauta', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050611', N'Lucanas', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050612', N'Ocaña', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050613', N'Otoca', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050614', N'Saisa', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050615', N'San Cristóbal', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050616', N'San Juan', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050617', N'San Pedro', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050618', N'San Pedro de Palco', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050619', N'Sancos', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050620', N'Santa Ana de Huaycahuacho', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050621', N'Santa Lucia', N'0506', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050701', N'Coracora', N'0507', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050702', N'Chumpi', N'0507', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050703', N'Coronel Castañeda', N'0507', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050704', N'Pacapausa', N'0507', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050705', N'Pullo', N'0507', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050706', N'Puyusca', N'0507', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050707', N'San Francisco de Ravacayco', N'0507', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050708', N'Upahuacho', N'0507', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050801', N'Pausa', N'0508', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050802', N'Colta', N'0508', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050803', N'Corculla', N'0508', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050804', N'Lampa', N'0508', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050805', N'Marcabamba', N'0508', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050806', N'Oyolo', N'0508', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050807', N'Pararca', N'0508', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050808', N'San Javier de Alpabamba', N'0508', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050809', N'San José de Ushua', N'0508', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050810', N'Sara Sara', N'0508', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050901', N'Querobamba', N'0509', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050902', N'Belén', N'0509', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050903', N'Chalcos', N'0509', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050904', N'Chilcayoc', N'0509', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050905', N'Huacaña', N'0509', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050906', N'Morcolla', N'0509', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050907', N'Paico', N'0509', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050908', N'San Pedro de Larcay', N'0509', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050909', N'San Salvador de Quije', N'0509', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050910', N'Santiago de Paucaray', N'0509', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'050911', N'Soras', N'0509', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051001', N'Huancapi', N'0510', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051002', N'Alcamenca', N'0510', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051003', N'Apongo', N'0510', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051004', N'Asquipata', N'0510', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051005', N'Canaria', N'0510', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051006', N'Cayara', N'0510', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051007', N'Colca', N'0510', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051008', N'Huamanquiquia', N'0510', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051009', N'Huancaraylla', N'0510', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051010', N'Hualla', N'0510', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051011', N'Sarhua', N'0510', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051012', N'Vilcanchos', N'0510', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051101', N'Vilcas Huaman', N'0511', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051102', N'Accomarca', N'0511', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051103', N'Carhuanca', N'0511', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051104', N'Concepción', N'0511', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051105', N'Huambalpa', N'0511', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051106', N'Independencia', N'0511', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051107', N'Saurama', N'0511', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'051108', N'Vischongo', N'0511', N'05')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060101', N'Cajamarca', N'0601', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060102', N'Asunción', N'0601', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060103', N'Chetilla', N'0601', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060104', N'Cospan', N'0601', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060105', N'Encañada', N'0601', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060106', N'Jesús', N'0601', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060107', N'Llacanora', N'0601', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060108', N'Los Baños del Inca', N'0601', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060109', N'Magdalena', N'0601', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060110', N'Matara', N'0601', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060111', N'Namora', N'0601', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060112', N'San Juan', N'0601', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060201', N'Cajabamba', N'0602', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060202', N'Cachachi', N'0602', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060203', N'Condebamba', N'0602', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060204', N'Sitacocha', N'0602', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060301', N'Celendín', N'0603', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060302', N'Chumuch', N'0603', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060303', N'Cortegana', N'0603', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060304', N'Huasmin', N'0603', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060305', N'Jorge Chávez', N'0603', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060306', N'José Gálvez', N'0603', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060307', N'Miguel Iglesias', N'0603', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060308', N'Oxamarca', N'0603', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060309', N'Sorochuco', N'0603', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060310', N'Sucre', N'0603', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060311', N'Utco', N'0603', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060312', N'La Libertad de Pallan', N'0603', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060401', N'Chota', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060402', N'Anguia', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060403', N'Chadin', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060404', N'Chiguirip', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060405', N'Chimban', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060406', N'Choropampa', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060407', N'Cochabamba', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060408', N'Conchan', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060409', N'Huambos', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060410', N'Lajas', N'0604', N'06')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060411', N'Llama', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060412', N'Miracosta', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060413', N'Paccha', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060414', N'Pion', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060415', N'Querocoto', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060416', N'San Juan de Licupis', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060417', N'Tacabamba', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060418', N'Tocmoche', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060419', N'Chalamarca', N'0604', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060501', N'Contumaza', N'0605', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060502', N'Chilete', N'0605', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060503', N'Cupisnique', N'0605', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060504', N'Guzmango', N'0605', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060505', N'San Benito', N'0605', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060506', N'Santa Cruz de Toledo', N'0605', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060507', N'Tantarica', N'0605', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060508', N'Yonan', N'0605', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060601', N'Cutervo', N'0606', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060602', N'Callayuc', N'0606', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060603', N'Choros', N'0606', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060604', N'Cujillo', N'0606', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060605', N'La Ramada', N'0606', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060606', N'Pimpingos', N'0606', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060607', N'Querocotillo', N'0606', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060608', N'San Andrés de Cutervo', N'0606', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060609', N'San Juan de Cutervo', N'0606', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060610', N'San Luis de Lucma', N'0606', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060611', N'Santa Cruz', N'0606', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060612', N'Santo Domingo de la Capilla', N'0606', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060613', N'Santo Tomas', N'0606', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060614', N'Socota', N'0606', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060615', N'Toribio Casanova', N'0606', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060701', N'Bambamarca', N'0607', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060702', N'Chugur', N'0607', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060703', N'Hualgayoc', N'0607', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060801', N'Jaén', N'0608', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060802', N'Bellavista', N'0608', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060803', N'Chontali', N'0608', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060804', N'Colasay', N'0608', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060805', N'Huabal', N'0608', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060806', N'Las Pirias', N'0608', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060807', N'Pomahuaca', N'0608', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060808', N'Pucara', N'0608', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060809', N'Sallique', N'0608', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060810', N'San Felipe', N'0608', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060811', N'San José del Alto', N'0608', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060812', N'Santa Rosa', N'0608', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060901', N'San Ignacio', N'0609', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060902', N'Chirinos', N'0609', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060903', N'Huarango', N'0609', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060904', N'La Coipa', N'0609', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060905', N'Namballe', N'0609', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060906', N'San José de Lourdes', N'0609', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'060907', N'Tabaconas', N'0609', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061001', N'Pedro Gálvez', N'0610', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061002', N'Chancay', N'0610', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061003', N'Eduardo Villanueva', N'0610', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061004', N'Gregorio Pita', N'0610', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061005', N'Ichocan', N'0610', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061006', N'José Manuel Quiroz', N'0610', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061007', N'José Sabogal', N'0610', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061101', N'San Miguel', N'0611', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061102', N'Bolívar', N'0611', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061103', N'Calquis', N'0611', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061104', N'Catilluc', N'0611', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061105', N'El Prado', N'0611', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061106', N'La Florida', N'0611', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061107', N'Llapa', N'0611', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061108', N'Nanchoc', N'0611', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061109', N'Niepos', N'0611', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061110', N'San Gregorio', N'0611', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061111', N'San Silvestre de Cochan', N'0611', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061112', N'Tongod', N'0611', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061113', N'Unión Agua Blanca', N'0611', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061201', N'San Pablo', N'0612', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061202', N'San Bernardino', N'0612', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061203', N'San Luis', N'0612', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061204', N'Tumbaden', N'0612', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061301', N'Santa Cruz', N'0613', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061302', N'Andabamba', N'0613', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061303', N'Catache', N'0613', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061304', N'Chancaybaños', N'0613', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061305', N'La Esperanza', N'0613', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061306', N'Ninabamba', N'0613', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061307', N'Pulan', N'0613', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061308', N'Saucepampa', N'0613', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061309', N'Sexi', N'0613', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061310', N'Uticyacu', N'0613', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'061311', N'Yauyucan', N'0613', N'06')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'070101', N'Callao', N'0701', N'07')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'070102', N'Bellavista', N'0701', N'07')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'070103', N'Carmen de la Legua Reynoso', N'0701', N'07')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'070104', N'La Perla', N'0701', N'07')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'070105', N'La Punta', N'0701', N'07')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'070106', N'Ventanilla', N'0701', N'07')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'070107', N'Mi Perú', N'0701', N'07')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080101', N'Cusco', N'0801', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080102', N'Ccorca', N'0801', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080103', N'Poroy', N'0801', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080104', N'San Jerónimo', N'0801', N'08')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080105', N'San Sebastian', N'0801', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080106', N'Santiago', N'0801', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080107', N'Saylla', N'0801', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080108', N'Wanchaq', N'0801', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080201', N'Acomayo', N'0802', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080202', N'Acopia', N'0802', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080203', N'Acos', N'0802', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080204', N'Mosoc Llacta', N'0802', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080205', N'Pomacanchi', N'0802', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080206', N'Rondocan', N'0802', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080207', N'Sangarara', N'0802', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080301', N'Anta', N'0803', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080302', N'Ancahuasi', N'0803', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080303', N'Cachimayo', N'0803', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080304', N'Chinchaypujio', N'0803', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080305', N'Huarocondo', N'0803', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080306', N'Limatambo', N'0803', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080307', N'Mollepata', N'0803', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080308', N'Pucyura', N'0803', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080309', N'Zurite', N'0803', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080401', N'Calca', N'0804', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080402', N'Coya', N'0804', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080403', N'Lamay', N'0804', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080404', N'Lares', N'0804', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080405', N'Pisac', N'0804', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080406', N'San Salvador', N'0804', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080407', N'Taray', N'0804', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080408', N'Yanatile', N'0804', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080501', N'Yanaoca', N'0805', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080502', N'Checca', N'0805', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080503', N'Kunturkanki', N'0805', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080504', N'Langui', N'0805', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080505', N'Layo', N'0805', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080506', N'Pampamarca', N'0805', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080507', N'Quehue', N'0805', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080508', N'Tupac Amaru', N'0805', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080601', N'Sicuani', N'0806', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080602', N'Checacupe', N'0806', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080603', N'Combapata', N'0806', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080604', N'Marangani', N'0806', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080605', N'Pitumarca', N'0806', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080606', N'San Pablo', N'0806', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080607', N'San Pedro', N'0806', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080608', N'Tinta', N'0806', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080701', N'Santo Tomas', N'0807', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080702', N'Capacmarca', N'0807', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080703', N'Chamaca', N'0807', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080704', N'Colquemarca', N'0807', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080705', N'Livitaca', N'0807', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080706', N'Llusco', N'0807', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080707', N'Quiñota', N'0807', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080708', N'Velille', N'0807', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080801', N'Espinar', N'0808', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080802', N'Condoroma', N'0808', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080803', N'Coporaque', N'0808', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080804', N'Ocoruro', N'0808', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080805', N'Pallpata', N'0808', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080806', N'Pichigua', N'0808', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080807', N'Suyckutambo', N'0808', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080808', N'Alto Pichigua', N'0808', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080901', N'Santa Ana', N'0809', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080902', N'Echarate', N'0809', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080903', N'Huayopata', N'0809', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080904', N'Maranura', N'0809', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080905', N'Ocobamba', N'0809', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080906', N'Quellouno', N'0809', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080907', N'Kimbiri', N'0809', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080908', N'Santa Teresa', N'0809', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080909', N'Vilcabamba', N'0809', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080910', N'Pichari', N'0809', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080911', N'Inkawasi', N'0809', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080912', N'Villa Virgen', N'0809', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080913', N'Villa Kintiarina', N'0809', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'080914', N'Megantoni', N'0809', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081001', N'Paruro', N'0810', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081002', N'Accha', N'0810', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081003', N'Ccapi', N'0810', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081004', N'Colcha', N'0810', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081005', N'Huanoquite', N'0810', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081006', N'Omachaç', N'0810', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081007', N'Paccaritambo', N'0810', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081008', N'Pillpinto', N'0810', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081009', N'Yaurisque', N'0810', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081101', N'Paucartambo', N'0811', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081102', N'Caicay', N'0811', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081103', N'Challabamba', N'0811', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081104', N'Colquepata', N'0811', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081105', N'Huancarani', N'0811', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081106', N'Kosñipata', N'0811', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081201', N'Urcos', N'0812', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081202', N'Andahuaylillas', N'0812', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081203', N'Camanti', N'0812', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081204', N'Ccarhuayo', N'0812', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081205', N'Ccatca', N'0812', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081206', N'Cusipata', N'0812', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081207', N'Huaro', N'0812', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081208', N'Lucre', N'0812', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081209', N'Marcapata', N'0812', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081210', N'Ocongate', N'0812', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081211', N'Oropesa', N'0812', N'08')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081212', N'Quiquijana', N'0812', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081301', N'Urubamba', N'0813', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081302', N'Chinchero', N'0813', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081303', N'Huayllabamba', N'0813', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081304', N'Machupicchu', N'0813', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081305', N'Maras', N'0813', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081306', N'Ollantaytambo', N'0813', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'081307', N'Yucay', N'0813', N'08')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090101', N'Huancavelica', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090102', N'Acobambilla', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090103', N'Acoria', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090104', N'Conayca', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090105', N'Cuenca', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090106', N'Huachocolpa', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090107', N'Huayllahuara', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090108', N'Izcuchaca', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090109', N'Laria', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090110', N'Manta', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090111', N'Mariscal Cáceres', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090112', N'Moya', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090113', N'Nuevo Occoro', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090114', N'Palca', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090115', N'Pilchaca', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090116', N'Vilca', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090117', N'Yauli', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090118', N'Ascensión', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090119', N'Huando', N'0901', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090201', N'Acobamba', N'0902', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090202', N'Andabamba', N'0902', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090203', N'Anta', N'0902', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090204', N'Caja', N'0902', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090205', N'Marcas', N'0902', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090206', N'Paucara', N'0902', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090207', N'Pomacocha', N'0902', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090208', N'Rosario', N'0902', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090301', N'Lircay', N'0903', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090302', N'Anchonga', N'0903', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090303', N'Callanmarca', N'0903', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090304', N'Ccochaccasa', N'0903', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090305', N'Chincho', N'0903', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090306', N'Congalla', N'0903', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090307', N'Huanca-Huanca', N'0903', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090308', N'Huayllay Grande', N'0903', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090309', N'Julcamarca', N'0903', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090310', N'San Antonio de Antaparco', N'0903', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090311', N'Santo Tomas de Pata', N'0903', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090312', N'Secclla', N'0903', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090401', N'Castrovirreyna', N'0904', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090402', N'Arma', N'0904', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090403', N'Aurahua', N'0904', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090404', N'Capillas', N'0904', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090405', N'Chupamarca', N'0904', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090406', N'Cocas', N'0904', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090407', N'Huachos', N'0904', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090408', N'Huamatambo', N'0904', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090409', N'Mollepampa', N'0904', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090410', N'San Juan', N'0904', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090411', N'Santa Ana', N'0904', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090412', N'Tantara', N'0904', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090413', N'Ticrapo', N'0904', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090501', N'Churcampa', N'0905', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090502', N'Anco', N'0905', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090503', N'Chinchihuasi', N'0905', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090504', N'El Carmen', N'0905', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090505', N'La Merced', N'0905', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090506', N'Locroja', N'0905', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090507', N'Paucarbamba', N'0905', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090508', N'San Miguel de Mayocc', N'0905', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090509', N'San Pedro de Coris', N'0905', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090510', N'Pachamarca', N'0905', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090511', N'Cosme', N'0905', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090601', N'Huaytara', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090602', N'Ayavi', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090603', N'Córdova', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090604', N'Huayacundo Arma', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090605', N'Laramarca', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090606', N'Ocoyo', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090607', N'Pilpichaca', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090608', N'Querco', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090609', N'Quito-Arma', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090610', N'San Antonio de Cusicancha', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090611', N'San Francisco de Sangayaico', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090612', N'San Isidro', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090613', N'Santiago de Chocorvos', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090614', N'Santiago de Quirahuara', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090615', N'Santo Domingo de Capillas', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090616', N'Tambo', N'0906', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090701', N'Pampas', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090702', N'Acostambo', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090703', N'Acraquia', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090704', N'Ahuaycha', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090705', N'Colcabamba', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090706', N'Daniel Hernández', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090707', N'Huachocolpa', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090709', N'Huaribamba', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090710', N'Ñahuimpuquio', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090711', N'Pazos', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090713', N'Quishuar', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090714', N'Salcabamba', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090715', N'Salcahuasi', N'0907', N'09')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090716', N'San Marcos de Rocchac', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090717', N'Surcubamba', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090718', N'Tintay Puncu', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090719', N'Quichuas', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090720', N'Andaymarca', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090721', N'Roble', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090722', N'Pichos', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'090723', N'Santiago de Tucuma', N'0907', N'09')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100101', N'Huanuco', N'1001', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100102', N'Amarilis', N'1001', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100103', N'Chinchao', N'1001', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100104', N'Churubamba', N'1001', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100105', N'Margos', N'1001', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100106', N'Quisqui (Kichki)', N'1001', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100107', N'San Francisco de Cayran', N'1001', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100108', N'San Pedro de Chaulan', N'1001', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100109', N'Santa María del Valle', N'1001', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100110', N'Yarumayo', N'1001', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100111', N'Pillco Marca', N'1001', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100112', N'Yacus', N'1001', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100113', N'San Pablo de Pillao', N'1001', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100201', N'Ambo', N'1002', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100202', N'Cayna', N'1002', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100203', N'Colpas', N'1002', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100204', N'Conchamarca', N'1002', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100205', N'Huacar', N'1002', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100206', N'San Francisco', N'1002', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100207', N'San Rafael', N'1002', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100208', N'Tomay Kichwa', N'1002', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100301', N'La Unión', N'1003', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100307', N'Chuquis', N'1003', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100311', N'Marías', N'1003', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100313', N'Pachas', N'1003', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100316', N'Quivilla', N'1003', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100317', N'Ripan', N'1003', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100321', N'Shunqui', N'1003', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100322', N'Sillapata', N'1003', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100323', N'Yanas', N'1003', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100401', N'Huacaybamba', N'1004', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100402', N'Canchabamba', N'1004', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100403', N'Cochabamba', N'1004', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100404', N'Pinra', N'1004', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100501', N'Llata', N'1005', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100502', N'Arancay', N'1005', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100503', N'Chavín de Pariarca', N'1005', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100504', N'Jacas Grande', N'1005', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100505', N'Jircan', N'1005', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100506', N'Miraflores', N'1005', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100507', N'Monzón', N'1005', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100508', N'Punchao', N'1005', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100509', N'Puños', N'1005', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100510', N'Singa', N'1005', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100511', N'Tantamayo', N'1005', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100601', N'Rupa-Rupa', N'1006', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100602', N'Daniel Alomía Robles', N'1006', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100603', N'Hermílio Valdizan', N'1006', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100604', N'José Crespo y Castillo', N'1006', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100605', N'Luyando', N'1006', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100606', N'Mariano Damaso Beraun', N'1006', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100607', N'Pucayacu', N'1006', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100608', N'Castillo Grande', N'1006', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100609', N'Pueblo Nuevo', N'1006', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100610', N'Santo Domingo de Anda', N'1006', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100701', N'Huacrachuco', N'1007', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100702', N'Cholon', N'1007', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100703', N'San Buenaventura', N'1007', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100704', N'La Morada', N'1007', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100705', N'Santa Rosa de Alto Yanajanca', N'1007', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100801', N'Panao', N'1008', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100802', N'Chaglla', N'1008', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100803', N'Molino', N'1008', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100804', N'Umari', N'1008', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100901', N'Puerto Inca', N'1009', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100902', N'Codo del Pozuzo', N'1009', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100903', N'Honoria', N'1009', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100904', N'Tournavista', N'1009', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'100905', N'Yuyapichis', N'1009', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'101001', N'Jesús', N'1010', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'101002', N'Baños', N'1010', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'101003', N'Jivia', N'1010', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'101004', N'Queropalca', N'1010', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'101005', N'Rondos', N'1010', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'101006', N'San Francisco de Asís', N'1010', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'101007', N'San Miguel de Cauri', N'1010', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'101101', N'Chavinillo', N'1011', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'101102', N'Cahuac', N'1011', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'101103', N'Chacabamba', N'1011', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'101104', N'Aparicio Pomares', N'1011', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'101105', N'Jacas Chico', N'1011', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'101106', N'Obas', N'1011', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'101107', N'Pampamarca', N'1011', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'101108', N'Choras', N'1011', N'10')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110101', N'Ica', N'1101', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110102', N'La Tinguiña', N'1101', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110103', N'Los Aquijes', N'1101', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110104', N'Ocucaje', N'1101', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110105', N'Pachacutec', N'1101', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110106', N'Parcona', N'1101', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110107', N'Pueblo Nuevo', N'1101', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110108', N'Salas', N'1101', N'11')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110109', N'San José de Los Molinos', N'1101', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110110', N'San Juan Bautista', N'1101', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110111', N'Santiago', N'1101', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110112', N'Subtanjalla', N'1101', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110113', N'Tate', N'1101', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110114', N'Yauca del Rosario', N'1101', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110201', N'Chincha Alta', N'1102', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110202', N'Alto Laran', N'1102', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110203', N'Chavin', N'1102', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110204', N'Chincha Baja', N'1102', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110205', N'El Carmen', N'1102', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110206', N'Grocio Prado', N'1102', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110207', N'Pueblo Nuevo', N'1102', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110208', N'San Juan de Yanac', N'1102', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110209', N'San Pedro de Huacarpana', N'1102', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110210', N'Sunampe', N'1102', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110211', N'Tambo de Mora', N'1102', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110301', N'Nasca', N'1103', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110302', N'Changuillo', N'1103', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110303', N'El Ingenio', N'1103', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110304', N'Marcona', N'1103', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110305', N'Vista Alegre', N'1103', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110401', N'Palpa', N'1104', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110402', N'Llipata', N'1104', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110403', N'Río Grande', N'1104', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110404', N'Santa Cruz', N'1104', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110405', N'Tibillo', N'1104', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110501', N'Pisco', N'1105', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110502', N'Huancano', N'1105', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110503', N'Humay', N'1105', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110504', N'Independencia', N'1105', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110505', N'Paracas', N'1105', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110506', N'San Andrés', N'1105', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110507', N'San Clemente', N'1105', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'110508', N'Tupac Amaru Inca', N'1105', N'11')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120101', N'Huancayo', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120104', N'Carhuacallanga', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120105', N'Chacapampa', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120106', N'Chicche', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120107', N'Chilca', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120108', N'Chongos Alto', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120111', N'Chupuro', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120112', N'Colca', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120113', N'Cullhuas', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120114', N'El Tambo', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120116', N'Huacrapuquio', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120117', N'Hualhuas', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120119', N'Huancan', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120120', N'Huasicancha', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120121', N'Huayucachi', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120122', N'Ingenio', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120124', N'Pariahuanca', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120125', N'Pilcomayo', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120126', N'Pucara', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120127', N'Quichuay', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120128', N'Quilcas', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120129', N'San Agustín', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120130', N'San Jerónimo de Tunan', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120132', N'Saño', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120133', N'Sapallanga', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120134', N'Sicaya', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120135', N'Santo Domingo de Acobamba', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120136', N'Viques', N'1201', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120201', N'Concepción', N'1202', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120202', N'Aco', N'1202', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120203', N'Andamarca', N'1202', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120204', N'Chambara', N'1202', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120205', N'Cochas', N'1202', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120206', N'Comas', N'1202', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120207', N'Heroínas Toledo', N'1202', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120208', N'Manzanares', N'1202', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120209', N'Mariscal Castilla', N'1202', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120210', N'Matahuasi', N'1202', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120211', N'Mito', N'1202', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120212', N'Nueve de Julio', N'1202', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120213', N'Orcotuna', N'1202', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120214', N'San José de Quero', N'1202', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120215', N'Santa Rosa de Ocopa', N'1202', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120301', N'Chanchamayo', N'1203', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120302', N'Perene', N'1203', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120303', N'Pichanaqui', N'1203', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120304', N'San Luis de Shuaro', N'1203', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120305', N'San Ramón', N'1203', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120306', N'Vitoc', N'1203', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120401', N'Jauja', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120402', N'Acolla', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120403', N'Apata', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120404', N'Ataura', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120405', N'Canchayllo', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120406', N'Curicaca', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120407', N'El Mantaro', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120408', N'Huamali', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120409', N'Huaripampa', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120410', N'Huertas', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120411', N'Janjaillo', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120412', N'Julcán', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120413', N'Leonor Ordóñez', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120414', N'Llocllapampa', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120415', N'Marco', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120416', N'Masma', N'1204', N'12')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120417', N'Masma Chicche', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120418', N'Molinos', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120419', N'Monobamba', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120420', N'Muqui', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120421', N'Muquiyauyo', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120422', N'Paca', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120423', N'Paccha', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120424', N'Pancan', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120425', N'Parco', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120426', N'Pomacancha', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120427', N'Ricran', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120428', N'San Lorenzo', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120429', N'San Pedro de Chunan', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120430', N'Sausa', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120431', N'Sincos', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120432', N'Tunan Marca', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120433', N'Yauli', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120434', N'Yauyos', N'1204', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120501', N'Junin', N'1205', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120502', N'Carhuamayo', N'1205', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120503', N'Ondores', N'1205', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120504', N'Ulcumayo', N'1205', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120601', N'Satipo', N'1206', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120602', N'Coviriali', N'1206', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120603', N'Llaylla', N'1206', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120604', N'Mazamari', N'1206', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120605', N'Pampa Hermosa', N'1206', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120606', N'Pangoa', N'1206', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120607', N'Río Negro', N'1206', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120608', N'Río Tambo', N'1206', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120609', N'Vizcatan del Ene', N'1206', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120701', N'Tarma', N'1207', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120702', N'Acobamba', N'1207', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120703', N'Huaricolca', N'1207', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120704', N'Huasahuasi', N'1207', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120705', N'La Unión', N'1207', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120706', N'Palca', N'1207', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120707', N'Palcamayo', N'1207', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120708', N'San Pedro de Cajas', N'1207', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120709', N'Tapo', N'1207', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120801', N'La Oroya', N'1208', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120802', N'Chacapalpa', N'1208', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120803', N'Huay-Huay', N'1208', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120804', N'Marcapomacocha', N'1208', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120805', N'Morococha', N'1208', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120806', N'Paccha', N'1208', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120807', N'Santa Bárbara de Carhuacayan', N'1208', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120808', N'Santa Rosa de Sacco', N'1208', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120809', N'Suitucancha', N'1208', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120810', N'Yauli', N'1208', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120901', N'Chupaca', N'1209', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120902', N'Ahuac', N'1209', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120903', N'Chongos Bajo', N'1209', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120904', N'Huachac', N'1209', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120905', N'Huamancaca Chico', N'1209', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120906', N'San Juan de Iscos', N'1209', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120907', N'San Juan de Jarpa', N'1209', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120908', N'Tres de Diciembre', N'1209', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'120909', N'Yanacancha', N'1209', N'12')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130101', N'Trujillo', N'1301', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130102', N'El Porvenir', N'1301', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130103', N'Florencia de Mora', N'1301', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130104', N'Huanchaco', N'1301', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130105', N'La Esperanza', N'1301', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130106', N'Laredo', N'1301', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130107', N'Moche', N'1301', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130108', N'Poroto', N'1301', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130109', N'Salaverry', N'1301', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130110', N'Simbal', N'1301', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130111', N'Victor Larco Herrera', N'1301', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130201', N'Ascope', N'1302', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130202', N'Chicama', N'1302', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130203', N'Chocope', N'1302', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130204', N'Magdalena de Cao', N'1302', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130205', N'Paijan', N'1302', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130206', N'Rázuri', N'1302', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130207', N'Santiago de Cao', N'1302', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130208', N'Casa Grande', N'1302', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130301', N'Bolívar', N'1303', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130302', N'Bambamarca', N'1303', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130303', N'Condormarca', N'1303', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130304', N'Longotea', N'1303', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130305', N'Uchumarca', N'1303', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130306', N'Ucuncha', N'1303', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130401', N'Chepen', N'1304', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130402', N'Pacanga', N'1304', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130403', N'Pueblo Nuevo', N'1304', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130501', N'Julcan', N'1305', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130502', N'Calamarca', N'1305', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130503', N'Carabamba', N'1305', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130504', N'Huaso', N'1305', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130601', N'Otuzco', N'1306', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130602', N'Agallpampa', N'1306', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130604', N'Charat', N'1306', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130605', N'Huaranchal', N'1306', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130606', N'La Cuesta', N'1306', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130608', N'Mache', N'1306', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130610', N'Paranday', N'1306', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130611', N'Salpo', N'1306', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130613', N'Sinsicap', N'1306', N'13')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130614', N'Usquil', N'1306', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130701', N'San Pedro de Lloc', N'1307', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130702', N'Guadalupe', N'1307', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130703', N'Jequetepeque', N'1307', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130704', N'Pacasmayo', N'1307', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130705', N'San José', N'1307', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130801', N'Tayabamba', N'1308', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130802', N'Buldibuyo', N'1308', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130803', N'Chillia', N'1308', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130804', N'Huancaspata', N'1308', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130805', N'Huaylillas', N'1308', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130806', N'Huayo', N'1308', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130807', N'Ongon', N'1308', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130808', N'Parcoy', N'1308', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130809', N'Pataz', N'1308', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130810', N'Pias', N'1308', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130811', N'Santiago de Challas', N'1308', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130812', N'Taurija', N'1308', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130813', N'Urpay', N'1308', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130901', N'Huamachuco', N'1309', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130902', N'Chugay', N'1309', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130903', N'Cochorco', N'1309', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130904', N'Curgos', N'1309', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130905', N'Marcabal', N'1309', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130906', N'Sanagoran', N'1309', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130907', N'Sarin', N'1309', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'130908', N'Sartimbamba', N'1309', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'131001', N'Santiago de Chuco', N'1310', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'131002', N'Angasmarca', N'1310', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'131003', N'Cachicadan', N'1310', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'131004', N'Mollebamba', N'1310', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'131005', N'Mollepata', N'1310', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'131006', N'Quiruvilca', N'1310', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'131007', N'Santa Cruz de Chuca', N'1310', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'131008', N'Sitabamba', N'1310', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'131101', N'Cascas', N'1311', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'131102', N'Lucma', N'1311', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'131103', N'Marmot', N'1311', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'131104', N'Sayapullo', N'1311', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'131201', N'Viru', N'1312', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'131202', N'Chao', N'1312', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'131203', N'Guadalupito', N'1312', N'13')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140101', N'Chiclayo', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140102', N'Chongoyape', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140103', N'Eten', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140104', N'Eten Puerto', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140105', N'José Leonardo Ortiz', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140106', N'La Victoria', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140107', N'Lagunas', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140108', N'Monsefu', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140109', N'Nueva Arica', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140110', N'Oyotun', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140111', N'Picsi', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140112', N'Pimentel', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140113', N'Reque', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140114', N'Santa Rosa', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140115', N'Saña', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140116', N'Cayalti', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140117', N'Patapo', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140118', N'Pomalca', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140119', N'Pucala', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140120', N'Tuman', N'1401', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140201', N'Ferreñafe', N'1402', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140202', N'Cañaris', N'1402', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140203', N'Incahuasi', N'1402', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140204', N'Manuel Antonio Mesones Muro', N'1402', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140205', N'Pitipo', N'1402', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140206', N'Pueblo Nuevo', N'1402', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140301', N'Lambayeque', N'1403', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140302', N'Chochope', N'1403', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140303', N'Illimo', N'1403', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140304', N'Jayanca', N'1403', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140305', N'Mochumi', N'1403', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140306', N'Morrope', N'1403', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140307', N'Motupe', N'1403', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140308', N'Olmos', N'1403', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140309', N'Pacora', N'1403', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140310', N'Salas', N'1403', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140311', N'San José', N'1403', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'140312', N'Tucume', N'1403', N'14')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150101', N'Lima', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150102', N'Ancón', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150103', N'Ate', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150104', N'Barranco', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150105', N'Breña', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150106', N'Carabayllo', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150107', N'Chaclacayo', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150108', N'Chorrillos', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150109', N'Cieneguilla', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150110', N'Comas', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150111', N'El Agustino', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150112', N'Independencia', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150113', N'Jesús María', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150114', N'La Molina', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150115', N'La Victoria', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150116', N'Lince', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150117', N'Los Olivos', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150118', N'Lurigancho', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150119', N'Lurin', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150120', N'Magdalena del Mar', N'1501', N'15')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150121', N'Pueblo Libre', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150122', N'Miraflores', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150123', N'Pachacamac', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150124', N'Pucusana', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150125', N'Puente Piedra', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150126', N'Punta Hermosa', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150127', N'Punta Negra', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150128', N'Rímac', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150129', N'San Bartolo', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150130', N'San Borja', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150131', N'San Isidro', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150132', N'San Juan de Lurigancho', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150133', N'San Juan de Miraflores', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150134', N'San Luis', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150135', N'San Martín de Porres', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150136', N'San Miguel', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150137', N'Santa Anita', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150138', N'Santa María del Mar', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150139', N'Santa Rosa', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150140', N'Santiago de Surco', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150141', N'Surquillo', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150142', N'Villa El Salvador', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150143', N'Villa María del Triunfo', N'1501', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150201', N'Barranca', N'1502', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150202', N'Paramonga', N'1502', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150203', N'Pativilca', N'1502', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150204', N'Supe', N'1502', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150205', N'Supe Puerto', N'1502', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150301', N'Cajatambo', N'1503', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150302', N'Copa', N'1503', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150303', N'Gorgor', N'1503', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150304', N'Huancapon', N'1503', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150305', N'Manas', N'1503', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150401', N'Canta', N'1504', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150402', N'Arahuay', N'1504', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150403', N'Huamantanga', N'1504', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150404', N'Huaros', N'1504', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150405', N'Lachaqui', N'1504', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150406', N'San Buenaventura', N'1504', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150407', N'Santa Rosa de Quives', N'1504', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150501', N'San Vicente de Cañete', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150502', N'Asia', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150503', N'Calango', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150504', N'Cerro Azul', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150505', N'Chilca', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150506', N'Coayllo', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150507', N'Imperial', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150508', N'Lunahuana', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150509', N'Mala', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150510', N'Nuevo Imperial', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150511', N'Pacaran', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150512', N'Quilmana', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150513', N'San Antonio', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150514', N'San Luis', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150515', N'Santa Cruz de Flores', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150516', N'Zúñiga', N'1505', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150601', N'Huaral', N'1506', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150602', N'Atavillos Alto', N'1506', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150603', N'Atavillos Bajo', N'1506', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150604', N'Aucallama', N'1506', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150605', N'Chancay', N'1506', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150606', N'Ihuari', N'1506', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150607', N'Lampian', N'1506', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150608', N'Pacaraos', N'1506', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150609', N'San Miguel de Acos', N'1506', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150610', N'Santa Cruz de Andamarca', N'1506', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150611', N'Sumbilca', N'1506', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150612', N'Veintisiete de Noviembre', N'1506', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150701', N'Matucana', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150702', N'Antioquia', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150703', N'Callahuanca', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150704', N'Carampoma', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150705', N'Chicla', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150706', N'Cuenca', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150707', N'Huachupampa', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150708', N'Huanza', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150709', N'Huarochiri', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150710', N'Lahuaytambo', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150711', N'Langa', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150712', N'Laraos', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150713', N'Mariatana', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150714', N'Ricardo Palma', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150715', N'San Andrés de Tupicocha', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150716', N'San Antonio', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150717', N'San Bartolomé', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150718', N'San Damian', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150719', N'San Juan de Iris', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150720', N'San Juan de Tantaranche', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150721', N'San Lorenzo de Quinti', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150722', N'San Mateo', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150723', N'San Mateo de Otao', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150724', N'San Pedro de Casta', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150725', N'San Pedro de Huancayre', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150726', N'Sangallaya', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150727', N'Santa Cruz de Cocachacra', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150728', N'Santa Eulalia', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150729', N'Santiago de Anchucaya', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150730', N'Santiago de Tuna', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150731', N'Santo Domingo de Los Olleros', N'1507', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150732', N'Surco', N'1507', N'15')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150801', N'Huacho', N'1508', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150802', N'Ambar', N'1508', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150803', N'Caleta de Carquin', N'1508', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150804', N'Checras', N'1508', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150805', N'Hualmay', N'1508', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150806', N'Huaura', N'1508', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150807', N'Leoncio Prado', N'1508', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150808', N'Paccho', N'1508', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150809', N'Santa Leonor', N'1508', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150810', N'Santa María', N'1508', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150811', N'Sayan', N'1508', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150812', N'Vegueta', N'1508', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150901', N'Oyon', N'1509', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150902', N'Andajes', N'1509', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150903', N'Caujul', N'1509', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150904', N'Cochamarca', N'1509', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150905', N'Navan', N'1509', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'150906', N'Pachangara', N'1509', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151001', N'Yauyos', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151002', N'Alis', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151003', N'Allauca', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151004', N'Ayaviri', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151005', N'Azángaro', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151006', N'Cacra', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151007', N'Carania', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151008', N'Catahuasi', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151009', N'Chocos', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151010', N'Cochas', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151011', N'Colonia', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151012', N'Hongos', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151013', N'Huampara', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151014', N'Huancaya', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151015', N'Huangascar', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151016', N'Huantan', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151017', N'Huañec', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151018', N'Laraos', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151019', N'Lincha', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151020', N'Madean', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151021', N'Miraflores', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151022', N'Omas', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151023', N'Putinza', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151024', N'Quinches', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151025', N'Quinocay', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151026', N'San Joaquín', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151027', N'San Pedro de Pilas', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151028', N'Tanta', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151029', N'Tauripampa', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151030', N'Tomas', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151031', N'Tupe', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151032', N'Viñac', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'151033', N'Vitis', N'1510', N'15')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160101', N'Iquitos', N'1601', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160102', N'Alto Nanay', N'1601', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160103', N'Fernando Lores', N'1601', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160104', N'Indiana', N'1601', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160105', N'Las Amazonas', N'1601', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160106', N'Mazan', N'1601', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160107', N'Napo', N'1601', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160108', N'Punchana', N'1601', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160110', N'Torres Causana', N'1601', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160112', N'Belén', N'1601', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160113', N'San Juan Bautista', N'1601', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160201', N'Yurimaguas', N'1602', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160202', N'Balsapuerto', N'1602', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160205', N'Jeberos', N'1602', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160206', N'Lagunas', N'1602', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160210', N'Santa Cruz', N'1602', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160211', N'Teniente Cesar López Rojas', N'1602', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160301', N'Nauta', N'1603', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160302', N'Parinari', N'1603', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160303', N'Tigre', N'1603', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160304', N'Trompeteros', N'1603', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160305', N'Urarinas', N'1603', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160401', N'Ramón Castilla', N'1604', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160402', N'Pebas', N'1604', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160403', N'Yavari', N'1604', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160404', N'San Pablo', N'1604', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160501', N'Requena', N'1605', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160502', N'Alto Tapiche', N'1605', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160503', N'Capelo', N'1605', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160504', N'Emilio San Martín', N'1605', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160505', N'Maquia', N'1605', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160506', N'Puinahua', N'1605', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160507', N'Saquena', N'1605', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160508', N'Soplin', N'1605', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160509', N'Tapiche', N'1605', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160510', N'Jenaro Herrera', N'1605', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160511', N'Yaquerana', N'1605', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160601', N'Contamana', N'1606', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160602', N'Inahuaya', N'1606', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160603', N'Padre Márquez', N'1606', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160604', N'Pampa Hermosa', N'1606', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160605', N'Sarayacu', N'1606', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160606', N'Vargas Guerra', N'1606', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160701', N'Barranca', N'1607', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160702', N'Cahuapanas', N'1607', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160703', N'Manseriche', N'1607', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160704', N'Morona', N'1607', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160705', N'Pastaza', N'1607', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160706', N'Andoas', N'1607', N'16')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160801', N'Putumayo', N'1608', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160802', N'Rosa Panduro', N'1608', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160803', N'Teniente Manuel Clavero', N'1608', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'160804', N'Yaguas', N'1608', N'16')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'170101', N'Tambopata', N'1701', N'17')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'170102', N'Inambari', N'1701', N'17')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'170103', N'Las Piedras', N'1701', N'17')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'170104', N'Laberinto', N'1701', N'17')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'170201', N'Manu', N'1702', N'17')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'170202', N'Fitzcarrald', N'1702', N'17')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'170203', N'Madre de Dios', N'1702', N'17')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'170204', N'Huepetuhe', N'1702', N'17')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'170301', N'Iñapari', N'1703', N'17')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'170302', N'Iberia', N'1703', N'17')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'170303', N'Tahuamanu', N'1703', N'17')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180101', N'Moquegua', N'1801', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180102', N'Carumas', N'1801', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180103', N'Cuchumbaya', N'1801', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180104', N'Samegua', N'1801', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180105', N'San Cristóbal', N'1801', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180106', N'Torata', N'1801', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180201', N'Omate', N'1802', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180202', N'Chojata', N'1802', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180203', N'Coalaque', N'1802', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180204', N'Ichuña', N'1802', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180205', N'La Capilla', N'1802', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180206', N'Lloque', N'1802', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180207', N'Matalaque', N'1802', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180208', N'Puquina', N'1802', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180209', N'Quinistaquillas', N'1802', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180210', N'Ubinas', N'1802', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180211', N'Yunga', N'1802', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180301', N'Ilo', N'1803', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180302', N'El Algarrobal', N'1803', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'180303', N'Pacocha', N'1803', N'18')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190101', N'Chaupimarca', N'1901', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190102', N'Huachon', N'1901', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190103', N'Huariaca', N'1901', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190104', N'Huayllay', N'1901', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190105', N'Ninacaca', N'1901', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190106', N'Pallanchacra', N'1901', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190107', N'Paucartambo', N'1901', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190108', N'San Francisco de Asís de Yarusyacan', N'1901', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190109', N'Simon Bolívar', N'1901', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190110', N'Ticlacayan', N'1901', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190111', N'Tinyahuarco', N'1901', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190112', N'Vicco', N'1901', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190113', N'Yanacancha', N'1901', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190201', N'Yanahuanca', N'1902', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190202', N'Chacayan', N'1902', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190203', N'Goyllarisquizga', N'1902', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190204', N'Paucar', N'1902', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190205', N'San Pedro de Pillao', N'1902', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190206', N'Santa Ana de Tusi', N'1902', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190207', N'Tapuc', N'1902', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190208', N'Vilcabamba', N'1902', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190301', N'Oxapampa', N'1903', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190302', N'Chontabamba', N'1903', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190303', N'Huancabamba', N'1903', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190304', N'Palcazu', N'1903', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190305', N'Pozuzo', N'1903', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190306', N'Puerto Bermúdez', N'1903', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190307', N'Villa Rica', N'1903', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'190308', N'Constitución', N'1903', N'19')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200101', N'Piura', N'2001', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200104', N'Castilla', N'2001', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200105', N'Catacaos', N'2001', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200107', N'Cura Mori', N'2001', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200108', N'El Tallan', N'2001', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200109', N'La Arena', N'2001', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200110', N'La Unión', N'2001', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200111', N'Las Lomas', N'2001', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200114', N'Tambo Grande', N'2001', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200115', N'Veintiseis de Octubre', N'2001', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200201', N'Ayabaca', N'2002', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200202', N'Frias', N'2002', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200203', N'Jilili', N'2002', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200204', N'Lagunas', N'2002', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200205', N'Montero', N'2002', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200206', N'Pacaipampa', N'2002', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200207', N'Paimas', N'2002', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200208', N'Sapillica', N'2002', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200209', N'Sicchez', N'2002', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200210', N'Suyo', N'2002', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200301', N'Huancabamba', N'2003', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200302', N'Canchaque', N'2003', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200303', N'El Carmen de la Frontera', N'2003', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200304', N'Huarmaca', N'2003', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200305', N'Lalaquiz', N'2003', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200306', N'San Miguel de El Faique', N'2003', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200307', N'Sondor', N'2003', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200308', N'Sondorillo', N'2003', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200401', N'Chulucanas', N'2004', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200402', N'Buenos Aires', N'2004', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200403', N'Chalaco', N'2004', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200404', N'La Matanza', N'2004', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200405', N'Morropon', N'2004', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200406', N'Salitral', N'2004', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200407', N'San Juan de Bigote', N'2004', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200408', N'Santa Catalina de Mossa', N'2004', N'20')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200409', N'Santo Domingo', N'2004', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200410', N'Yamango', N'2004', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200501', N'Paita', N'2005', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200502', N'Amotape', N'2005', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200503', N'Arenal', N'2005', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200504', N'Colan', N'2005', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200505', N'La Huaca', N'2005', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200506', N'Tamarindo', N'2005', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200507', N'Vichayal', N'2005', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200601', N'Sullana', N'2006', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200602', N'Bellavista', N'2006', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200603', N'Ignacio Escudero', N'2006', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200604', N'Lancones', N'2006', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200605', N'Marcavelica', N'2006', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200606', N'Miguel Checa', N'2006', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200607', N'Querecotillo', N'2006', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200608', N'Salitral', N'2006', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200701', N'Pariñas', N'2007', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200702', N'El Alto', N'2007', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200703', N'La Brea', N'2007', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200704', N'Lobitos', N'2007', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200705', N'Los Organos', N'2007', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200706', N'Mancora', N'2007', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200801', N'Sechura', N'2008', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200802', N'Bellavista de la Unión', N'2008', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200803', N'Bernal', N'2008', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200804', N'Cristo Nos Valga', N'2008', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200805', N'Vice', N'2008', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'200806', N'Rinconada Llicuar', N'2008', N'20')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210101', N'Puno', N'2101', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210102', N'Acora', N'2101', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210103', N'Amantani', N'2101', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210104', N'Atuncolla', N'2101', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210105', N'Capachica', N'2101', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210106', N'Chucuito', N'2101', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210107', N'Coata', N'2101', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210108', N'Huata', N'2101', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210109', N'Mañazo', N'2101', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210110', N'Paucarcolla', N'2101', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210111', N'Pichacani', N'2101', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210112', N'Plateria', N'2101', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210113', N'San Antonio', N'2101', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210114', N'Tiquillaca', N'2101', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210115', N'Vilque', N'2101', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210201', N'Azángaro', N'2102', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210202', N'Achaya', N'2102', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210203', N'Arapa', N'2102', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210204', N'Asillo', N'2102', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210205', N'Caminaca', N'2102', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210206', N'Chupa', N'2102', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210207', N'José Domingo Choquehuanca', N'2102', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210208', N'Muñani', N'2102', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210209', N'Potoni', N'2102', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210210', N'Saman', N'2102', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210211', N'San Anton', N'2102', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210212', N'San José', N'2102', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210213', N'San Juan de Salinas', N'2102', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210214', N'Santiago de Pupuja', N'2102', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210215', N'Tirapata', N'2102', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210301', N'Macusani', N'2103', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210302', N'Ajoyani', N'2103', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210303', N'Ayapata', N'2103', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210304', N'Coasa', N'2103', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210305', N'Corani', N'2103', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210306', N'Crucero', N'2103', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210307', N'Ituata', N'2103', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210308', N'Ollachea', N'2103', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210309', N'San Gaban', N'2103', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210310', N'Usicayos', N'2103', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210401', N'Juli', N'2104', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210402', N'Desaguadero', N'2104', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210403', N'Huacullani', N'2104', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210404', N'Kelluyo', N'2104', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210405', N'Pisacoma', N'2104', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210406', N'Pomata', N'2104', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210407', N'Zepita', N'2104', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210501', N'Ilave', N'2105', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210502', N'Capazo', N'2105', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210503', N'Pilcuyo', N'2105', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210504', N'Santa Rosa', N'2105', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210505', N'Conduriri', N'2105', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210601', N'Huancane', N'2106', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210602', N'Cojata', N'2106', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210603', N'Huatasani', N'2106', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210604', N'Inchupalla', N'2106', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210605', N'Pusi', N'2106', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210606', N'Rosaspata', N'2106', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210607', N'Taraco', N'2106', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210608', N'Vilque Chico', N'2106', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210701', N'Lampa', N'2107', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210702', N'Cabanilla', N'2107', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210703', N'Calapuja', N'2107', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210704', N'Nicasio', N'2107', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210705', N'Ocuviri', N'2107', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210706', N'Palca', N'2107', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210707', N'Paratia', N'2107', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210708', N'Pucara', N'2107', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210709', N'Santa Lucia', N'2107', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210710', N'Vilavila', N'2107', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210801', N'Ayaviri', N'2108', N'21')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210802', N'Antauta', N'2108', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210803', N'Cupi', N'2108', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210804', N'Llalli', N'2108', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210805', N'Macari', N'2108', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210806', N'Nuñoa', N'2108', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210807', N'Orurillo', N'2108', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210808', N'Santa Rosa', N'2108', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210809', N'Umachiri', N'2108', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210901', N'Moho', N'2109', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210902', N'Conima', N'2109', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210903', N'Huayrapata', N'2109', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'210904', N'Tilali', N'2109', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211001', N'Putina', N'2110', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211002', N'Ananea', N'2110', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211003', N'Pedro Vilca Apaza', N'2110', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211004', N'Quilcapuncu', N'2110', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211005', N'Sina', N'2110', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211101', N'Juliaca', N'2111', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211102', N'Cabana', N'2111', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211103', N'Cabanillas', N'2111', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211104', N'Caracoto', N'2111', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211105', N'San Miguel', N'2111', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211201', N'Sandia', N'2112', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211202', N'Cuyocuyo', N'2112', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211203', N'Limbani', N'2112', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211204', N'Patambuco', N'2112', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211205', N'Phara', N'2112', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211206', N'Quiaca', N'2112', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211207', N'San Juan del Oro', N'2112', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211208', N'Yanahuaya', N'2112', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211209', N'Alto Inambari', N'2112', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211210', N'San Pedro de Putina Punco', N'2112', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211301', N'Yunguyo', N'2113', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211302', N'Anapia', N'2113', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211303', N'Copani', N'2113', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211304', N'Cuturapi', N'2113', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211305', N'Ollaraya', N'2113', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211306', N'Tinicachi', N'2113', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'211307', N'Unicachi', N'2113', N'21')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220101', N'Moyobamba', N'2201', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220102', N'Calzada', N'2201', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220103', N'Habana', N'2201', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220104', N'Jepelacio', N'2201', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220105', N'Soritor', N'2201', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220106', N'Yantalo', N'2201', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220201', N'Bellavista', N'2202', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220202', N'Alto Biavo', N'2202', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220203', N'Bajo Biavo', N'2202', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220204', N'Huallaga', N'2202', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220205', N'San Pablo', N'2202', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220206', N'San Rafael', N'2202', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220301', N'San José de Sisa', N'2203', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220302', N'Agua Blanca', N'2203', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220303', N'San Martín', N'2203', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220304', N'Santa Rosa', N'2203', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220305', N'Shatoja', N'2203', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220401', N'Saposoa', N'2204', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220402', N'Alto Saposoa', N'2204', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220403', N'El Eslabón', N'2204', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220404', N'Piscoyacu', N'2204', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220405', N'Sacanche', N'2204', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220406', N'Tingo de Saposoa', N'2204', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220501', N'Lamas', N'2205', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220502', N'Alonso de Alvarado', N'2205', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220503', N'Barranquita', N'2205', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220504', N'Caynarachi', N'2205', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220505', N'Cuñumbuqui', N'2205', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220506', N'Pinto Recodo', N'2205', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220507', N'Rumisapa', N'2205', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220508', N'San Roque de Cumbaza', N'2205', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220509', N'Shanao', N'2205', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220510', N'Tabalosos', N'2205', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220511', N'Zapatero', N'2205', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220601', N'Juanjuí', N'2206', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220602', N'Campanilla', N'2206', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220603', N'Huicungo', N'2206', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220604', N'Pachiza', N'2206', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220605', N'Pajarillo', N'2206', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220701', N'Picota', N'2207', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220702', N'Buenos Aires', N'2207', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220703', N'Caspisapa', N'2207', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220704', N'Pilluana', N'2207', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220705', N'Pucacaca', N'2207', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220706', N'San Cristóbal', N'2207', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220707', N'San Hilarión', N'2207', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220708', N'Shamboyacu', N'2207', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220709', N'Tingo de Ponasa', N'2207', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220710', N'Tres Unidos', N'2207', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220801', N'Rioja', N'2208', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220802', N'Awajun', N'2208', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220803', N'Elías Soplin Vargas', N'2208', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220804', N'Nueva Cajamarca', N'2208', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220805', N'Pardo Miguel', N'2208', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220806', N'Posic', N'2208', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220807', N'San Fernando', N'2208', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220808', N'Yorongos', N'2208', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220809', N'Yuracyacu', N'2208', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220901', N'Tarapoto', N'2209', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220902', N'Alberto Leveau', N'2209', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220903', N'Cacatachi', N'2209', N'22')
GO
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220904', N'Chazuta', N'2209', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220905', N'Chipurana', N'2209', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220906', N'El Porvenir', N'2209', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220907', N'Huimbayoc', N'2209', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220908', N'Juan Guerra', N'2209', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220909', N'La Banda de Shilcayo', N'2209', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220910', N'Morales', N'2209', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220911', N'Papaplaya', N'2209', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220912', N'San Antonio', N'2209', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220913', N'Sauce', N'2209', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'220914', N'Shapaja', N'2209', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'221001', N'Tocache', N'2210', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'221002', N'Nuevo Progreso', N'2210', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'221003', N'Polvora', N'2210', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'221004', N'Shunte', N'2210', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'221005', N'Uchiza', N'2210', N'22')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230101', N'Tacna', N'2301', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230102', N'Alto de la Alianza', N'2301', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230103', N'Calana', N'2301', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230104', N'Ciudad Nueva', N'2301', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230105', N'Inclan', N'2301', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230106', N'Pachia', N'2301', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230107', N'Palca', N'2301', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230108', N'Pocollay', N'2301', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230109', N'Sama', N'2301', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230110', N'Coronel Gregorio Albarracín Lanchipa', N'2301', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230111', N'La Yarada los Palos', N'2301', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230201', N'Candarave', N'2302', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230202', N'Cairani', N'2302', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230203', N'Camilaca', N'2302', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230204', N'Curibaya', N'2302', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230205', N'Huanuara', N'2302', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230206', N'Quilahuani', N'2302', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230301', N'Locumba', N'2303', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230302', N'Ilabaya', N'2303', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230303', N'Ite', N'2303', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230401', N'Tarata', N'2304', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230402', N'Héroes Albarracín', N'2304', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230403', N'Estique', N'2304', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230404', N'Estique-Pampa', N'2304', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230405', N'Sitajara', N'2304', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230406', N'Susapaya', N'2304', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230407', N'Tarucachi', N'2304', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'230408', N'Ticaco', N'2304', N'23')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'240101', N'Tumbes', N'2401', N'24')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'240102', N'Corrales', N'2401', N'24')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'240103', N'La Cruz', N'2401', N'24')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'240104', N'Pampas de Hospital', N'2401', N'24')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'240105', N'San Jacinto', N'2401', N'24')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'240106', N'San Juan de la Virgen', N'2401', N'24')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'240201', N'Zorritos', N'2402', N'24')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'240202', N'Casitas', N'2402', N'24')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'240203', N'Canoas de Punta Sal', N'2402', N'24')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'240301', N'Zarumilla', N'2403', N'24')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'240302', N'Aguas Verdes', N'2403', N'24')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'240303', N'Matapalo', N'2403', N'24')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'240304', N'Papayal', N'2403', N'24')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250101', N'Calleria', N'2501', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250102', N'Campoverde', N'2501', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250103', N'Iparia', N'2501', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250104', N'Masisea', N'2501', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250105', N'Yarinacocha', N'2501', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250106', N'Nueva Requena', N'2501', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250107', N'Manantay', N'2501', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250201', N'Raymondi', N'2502', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250202', N'Sepahua', N'2502', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250203', N'Tahuania', N'2502', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250204', N'Yurua', N'2502', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250301', N'Padre Abad', N'2503', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250302', N'Irazola', N'2503', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250303', N'Curimana', N'2503', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250304', N'Neshuya', N'2503', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250305', N'Alexander Von Humboldt', N'2503', N'25')
INSERT [usuario].[ubigeoPeruDistricts] ([id], [name], [provinceId], [departmentId]) VALUES (N'250401', N'Purus', N'2504', N'25')
GO
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0101', N'Chachapoyas', N'01')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0102', N'Bagua', N'01')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0103', N'Bongará', N'01')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0104', N'Condorcanqui', N'01')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0105', N'Luya', N'01')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0106', N'Rodríguez de Mendoza', N'01')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0107', N'Utcubamba', N'01')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0201', N'Huaraz', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0202', N'Aija', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0203', N'Antonio Raymondi', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0204', N'Asunción', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0205', N'Bolognesi', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0206', N'Carhuaz', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0207', N'Carlos Fermín Fitzcarrald', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0208', N'Casma', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0209', N'Corongo', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0210', N'Huari', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0211', N'Huarmey', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0212', N'Huaylas', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0213', N'Mariscal Luzuriaga', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0214', N'Ocros', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0215', N'Pallasca', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0216', N'Pomabamba', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0217', N'Recuay', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0218', N'Santa', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0219', N'Sihuas', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0220', N'Yungay', N'02')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0301', N'Abancay', N'03')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0302', N'Andahuaylas', N'03')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0303', N'Antabamba', N'03')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0304', N'Aymaraes', N'03')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0305', N'Cotabambas', N'03')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0306', N'Chincheros', N'03')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0307', N'Grau', N'03')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0401', N'Arequipa', N'04')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0402', N'Camaná', N'04')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0403', N'Caravelí', N'04')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0404', N'Castilla', N'04')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0405', N'Caylloma', N'04')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0406', N'Condesuyos', N'04')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0407', N'Islay', N'04')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0408', N'La Uniòn', N'04')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0501', N'Huamanga', N'05')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0502', N'Cangallo', N'05')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0503', N'Huanca Sancos', N'05')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0504', N'Huanta', N'05')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0505', N'La Mar', N'05')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0506', N'Lucanas', N'05')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0507', N'Parinacochas', N'05')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0508', N'Pàucar del Sara Sara', N'05')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0509', N'Sucre', N'05')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0510', N'Víctor Fajardo', N'05')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0511', N'Vilcas Huamán', N'05')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0601', N'Cajamarca', N'06')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0602', N'Cajabamba', N'06')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0603', N'Celendín', N'06')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0604', N'Chota', N'06')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0605', N'Contumazá', N'06')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0606', N'Cutervo', N'06')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0607', N'Hualgayoc', N'06')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0608', N'Jaén', N'06')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0609', N'San Ignacio', N'06')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0610', N'San Marcos', N'06')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0611', N'San Miguel', N'06')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0612', N'San Pablo', N'06')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0613', N'Santa Cruz', N'06')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0701', N'Prov. Const. del Callao', N'07')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0801', N'Cusco', N'08')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0802', N'Acomayo', N'08')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0803', N'Anta', N'08')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0804', N'Calca', N'08')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0805', N'Canas', N'08')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0806', N'Canchis', N'08')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0807', N'Chumbivilcas', N'08')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0808', N'Espinar', N'08')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0809', N'La Convención', N'08')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0810', N'Paruro', N'08')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0811', N'Paucartambo', N'08')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0812', N'Quispicanchi', N'08')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0813', N'Urubamba', N'08')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0901', N'Huancavelica', N'09')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0902', N'Acobamba', N'09')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0903', N'Angaraes', N'09')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0904', N'Castrovirreyna', N'09')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0905', N'Churcampa', N'09')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0906', N'Huaytará', N'09')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'0907', N'Tayacaja', N'09')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1001', N'Huánuco', N'10')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1002', N'Ambo', N'10')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1003', N'Dos de Mayo', N'10')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1004', N'Huacaybamba', N'10')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1005', N'Huamalíes', N'10')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1006', N'Leoncio Prado', N'10')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1007', N'Marañón', N'10')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1008', N'Pachitea', N'10')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1009', N'Puerto Inca', N'10')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1010', N'Lauricocha ', N'10')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1011', N'Yarowilca ', N'10')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1101', N'Ica ', N'11')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1102', N'Chincha ', N'11')
GO
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1103', N'Nasca ', N'11')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1104', N'Palpa ', N'11')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1105', N'Pisco ', N'11')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1201', N'Huancayo ', N'12')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1202', N'Concepción ', N'12')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1203', N'Chanchamayo ', N'12')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1204', N'Jauja ', N'12')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1205', N'Junín ', N'12')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1206', N'Satipo ', N'12')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1207', N'Tarma ', N'12')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1208', N'Yauli ', N'12')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1209', N'Chupaca ', N'12')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1301', N'Trujillo ', N'13')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1302', N'Ascope ', N'13')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1303', N'Bolívar ', N'13')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1304', N'Chepén ', N'13')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1305', N'Julcán ', N'13')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1306', N'Otuzco ', N'13')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1307', N'Pacasmayo ', N'13')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1308', N'Pataz ', N'13')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1309', N'Sánchez Carrión ', N'13')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1310', N'Santiago de Chuco ', N'13')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1311', N'Gran Chimú ', N'13')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1312', N'Virú ', N'13')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1401', N'Chiclayo ', N'14')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1402', N'Ferreñafe ', N'14')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1403', N'Lambayeque ', N'14')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1501', N'Lima ', N'15')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1502', N'Barranca ', N'15')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1503', N'Cajatambo ', N'15')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1504', N'Canta ', N'15')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1505', N'Cañete ', N'15')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1506', N'Huaral ', N'15')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1507', N'Huarochirí ', N'15')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1508', N'Huaura ', N'15')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1509', N'Oyón ', N'15')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1510', N'Yauyos ', N'15')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1601', N'Maynas ', N'16')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1602', N'Alto Amazonas ', N'16')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1603', N'Loreto ', N'16')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1604', N'Mariscal Ramón Castilla ', N'16')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1605', N'Requena ', N'16')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1606', N'Ucayali ', N'16')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1607', N'Datem del Marañón ', N'16')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1608', N'Putumayo', N'16')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1701', N'Tambopata ', N'17')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1702', N'Manu ', N'17')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1703', N'Tahuamanu ', N'17')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1801', N'Mariscal Nieto ', N'18')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1802', N'General Sánchez Cerro ', N'18')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1803', N'Ilo ', N'18')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1901', N'Pasco ', N'19')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1902', N'Daniel Alcides Carrión ', N'19')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'1903', N'Oxapampa ', N'19')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2001', N'Piura ', N'20')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2002', N'Ayabaca ', N'20')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2003', N'Huancabamba ', N'20')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2004', N'Morropón ', N'20')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2005', N'Paita ', N'20')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2006', N'Sullana ', N'20')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2007', N'Talara ', N'20')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2008', N'Sechura ', N'20')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2101', N'Puno ', N'21')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2102', N'Azángaro ', N'21')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2103', N'Carabaya ', N'21')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2104', N'Chucuito ', N'21')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2105', N'El Collao ', N'21')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2106', N'Huancané ', N'21')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2107', N'Lampa ', N'21')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2108', N'Melgar ', N'21')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2109', N'Moho ', N'21')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2110', N'San Antonio de Putina ', N'21')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2111', N'San Román ', N'21')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2112', N'Sandia ', N'21')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2113', N'Yunguyo ', N'21')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2201', N'Moyobamba ', N'22')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2202', N'Bellavista ', N'22')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2203', N'El Dorado ', N'22')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2204', N'Huallaga ', N'22')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2205', N'Lamas ', N'22')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2206', N'Mariscal Cáceres ', N'22')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2207', N'Picota ', N'22')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2208', N'Rioja ', N'22')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2209', N'San Martín ', N'22')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2210', N'Tocache ', N'22')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2301', N'Tacna ', N'23')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2302', N'Candarave ', N'23')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2303', N'Jorge Basadre ', N'23')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2304', N'Tarata ', N'23')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2401', N'Tumbes ', N'24')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2402', N'Contralmirante Villar ', N'24')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2403', N'Zarumilla ', N'24')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2501', N'Coronel Portillo ', N'25')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2502', N'Atalaya ', N'25')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2503', N'Padre Abad ', N'25')
INSERT [usuario].[ubigeoPeruProvinces] ([id], [name], [departmentId]) VALUES (N'2504', N'Purús', N'25')
GO
SET IDENTITY_INSERT [usuario].[Usuario] ON 

INSERT [usuario].[Usuario] ([idUsuario], [nombreUsuario], [nombres], [apellidos], [dni], [fechaNacimiento], [idTipoDocumento], [email], [direccion], [idPais], [idDepartamento], [idProvincia], [idDistrito], [codigoPostal], [contrasena], [celular], [idTipoUsuario], [activo]) VALUES (1, N'ronny', N'ronny', N'chomba', N'44699394', CAST(N'1987-11-18' AS Date), 1, N'crey15@hotmail.com', N'dir1', 173, N'6', N'1', N'1', N'060101', N'12341321', N'976359272', 1, 1)
INSERT [usuario].[Usuario] ([idUsuario], [nombreUsuario], [nombres], [apellidos], [dni], [fechaNacimiento], [idTipoDocumento], [email], [direccion], [idPais], [idDepartamento], [idProvincia], [idDistrito], [codigoPostal], [contrasena], [celular], [idTipoUsuario], [activo]) VALUES (2, N'nico', N'nico', N'de chomba', N'44699395', CAST(N'1987-11-18' AS Date), 1, N'crey153@hotmail.com', N'dir4', 173, N'6', N'1', N'1', N'060101', N'888888', N'976359288', 1, 1)
INSERT [usuario].[Usuario] ([idUsuario], [nombreUsuario], [nombres], [apellidos], [dni], [fechaNacimiento], [idTipoDocumento], [email], [direccion], [idPais], [idDepartamento], [idProvincia], [idDistrito], [codigoPostal], [contrasena], [celular], [idTipoUsuario], [activo]) VALUES (3, N'alex', N'alex', N'horna de chomba', N'44699396', CAST(N'1987-11-18' AS Date), 1, N'crey1533@hotmail.com', N'dir4', 173, N'6', N'1', N'1', N'060101', N'123123', N'976359280', 2, 1)
INSERT [usuario].[Usuario] ([idUsuario], [nombreUsuario], [nombres], [apellidos], [dni], [fechaNacimiento], [idTipoDocumento], [email], [direccion], [idPais], [idDepartamento], [idProvincia], [idDistrito], [codigoPostal], [contrasena], [celular], [idTipoUsuario], [activo]) VALUES (4, N'jimmy', N'jimmy', N'linares de chomba', N'44699397', CAST(N'1987-11-18' AS Date), 1, N'crey18@hotmail.com', N'dir4', 173, N'6', N'1', N'1', N'060101', N'22222', N'976359546', 3, 0)
INSERT [usuario].[Usuario] ([idUsuario], [nombreUsuario], [nombres], [apellidos], [dni], [fechaNacimiento], [idTipoDocumento], [email], [direccion], [idPais], [idDepartamento], [idProvincia], [idDistrito], [codigoPostal], [contrasena], [celular], [idTipoUsuario], [activo]) VALUES (5, N'LucaMod', N'Luca', N'Modrick', N'88888888', CAST(N'1986-02-23' AS Date), 1, N'modrick@gmail.com', N'Calle de Pedro 321', 4, N'06', N'0601', N'060108', N'06002', N'1234qwez', N'914589653', 1, 0)
INSERT [usuario].[Usuario] ([idUsuario], [nombreUsuario], [nombres], [apellidos], [dni], [fechaNacimiento], [idTipoDocumento], [email], [direccion], [idPais], [idDepartamento], [idProvincia], [idDistrito], [codigoPostal], [contrasena], [celular], [idTipoUsuario], [activo]) VALUES (7, N'CristianoRonaldo1986', N'Cristiano', N'Ronaldo', N'44444441', CAST(N'1986-10-24' AS Date), 1, N'cristiano@gmail.com', N'Calle de cristiano 123', 176, N'06', N'0601', N'060101', N'06001', N'1234qwer', N'923167611', 1, 1)
INSERT [usuario].[Usuario] ([idUsuario], [nombreUsuario], [nombres], [apellidos], [dni], [fechaNacimiento], [idTipoDocumento], [email], [direccion], [idPais], [idDepartamento], [idProvincia], [idDistrito], [codigoPostal], [contrasena], [celular], [idTipoUsuario], [activo]) VALUES (8, N'Rafael Valqui', N'Rafael', N'Valqui', N'44444444', CAST(N'1986-10-23' AS Date), 1, N'rafael@gmail.com', N'Calle de Luis 123', 176, N'06', N'0601', N'060101', N'06002', N'$2a$12$saQQZDiTzvi.MogOb2KQ/OHz/IY8C3mNNBLz9kGsXoReTV6uQTaUa', N'923167600', 1, 1)
INSERT [usuario].[Usuario] ([idUsuario], [nombreUsuario], [nombres], [apellidos], [dni], [fechaNacimiento], [idTipoDocumento], [email], [direccion], [idPais], [idDepartamento], [idProvincia], [idDistrito], [codigoPostal], [contrasena], [celular], [idTipoUsuario], [activo]) VALUES (9, N'NardaOliva', N'Narda', N'Oliva', N'44444443', CAST(N'1986-10-23' AS Date), 1, N'narda1@gmail.com', N'Calle de Luis 123', 176, N'06', N'0601', N'060101', N'06002', N'$2a$12$ZFoisgmJtIcVVXVI34RQ1.kabp43kbA4CbiBxVMli9L5OXMMNlF5m', N'923167601', 1, 1)
INSERT [usuario].[Usuario] ([idUsuario], [nombreUsuario], [nombres], [apellidos], [dni], [fechaNacimiento], [idTipoDocumento], [email], [direccion], [idPais], [idDepartamento], [idProvincia], [idDistrito], [codigoPostal], [contrasena], [celular], [idTipoUsuario], [activo]) VALUES (12, N'Nicoescal', N'Nico', N'escal', N'45544411', CAST(N'1986-10-23' AS Date), 1, N'nicoescal@gmail.com', N'Calle de Luis 123', 176, N'06', N'0601', N'060101', N'06002', N'$2a$12$31QarPtN6BdyFW4koalld.9zJNjk4Y1Tde8KV6lFkF8RuJBZtcaIe', N'923167601', 1, 1)
INSERT [usuario].[Usuario] ([idUsuario], [nombreUsuario], [nombres], [apellidos], [dni], [fechaNacimiento], [idTipoDocumento], [email], [direccion], [idPais], [idDepartamento], [idProvincia], [idDistrito], [codigoPostal], [contrasena], [celular], [idTipoUsuario], [activo]) VALUES (1012, N'NicholasEscaOl', N'Nicholas Steve', N'Escalante Oliva', N'44094668', CAST(N'1986-10-23' AS Date), 1, N'escalante.nico@gmail.com', N'Calle de Luis 123', 176, N'06', N'0601', N'060101', N'06002', N'$2a$12$D/FpCDaE1dOFIiv7j1g6MO0T/Lr2u0H1PuRbRC15LCUM6mzIhABma', N'923167601', 1, 1)
INSERT [usuario].[Usuario] ([idUsuario], [nombreUsuario], [nombres], [apellidos], [dni], [fechaNacimiento], [idTipoDocumento], [email], [direccion], [idPais], [idDepartamento], [idProvincia], [idDistrito], [codigoPostal], [contrasena], [celular], [idTipoUsuario], [activo]) VALUES (1013, N'RonnyLoquita', N'Ronny', N'Chomba', N'44699391', CAST(N'1987-11-23' AS Date), 1, N'ronny_ch@gmail.com', N'Calle de Ronny 123', 176, N'06', N'0601', N'060101', N'06002', N'$2a$12$3kjmEsUI32tIm9rXPRktUu5OLUevC6hfLQoM5mODljWWsLDNRQ5eC', N'923167601', 1, 1)
INSERT [usuario].[Usuario] ([idUsuario], [nombreUsuario], [nombres], [apellidos], [dni], [fechaNacimiento], [idTipoDocumento], [email], [direccion], [idPais], [idDepartamento], [idProvincia], [idDistrito], [codigoPostal], [contrasena], [celular], [idTipoUsuario], [activo]) VALUES (1014, N'NicholasEscaOlivaS', N'Nicholas Steve', N'Escalante Oliva', N'00112233', CAST(N'1986-10-23' AS Date), 1, N'escalante.nicolas@gmail.com', N'Calle de Luis 123', 176, N'06', N'0601', N'060101', N'06002', N'$2a$12$tqabSJx236kHcT0IdLVeJOVPvW2.4/qqg2Zu..v4vG69HnOxH4NX2', N'923167601', 1, 1)
SET IDENTITY_INSERT [usuario].[Usuario] OFF
GO
ALTER TABLE [usuario].[paises] ADD  DEFAULT (NULL) FOR [code]
GO
ALTER TABLE [usuario].[paises] ADD  DEFAULT (NULL) FOR [nombre]
GO
ALTER TABLE [usuario].[ubigeoPeruDistricts] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [usuario].[ubigeoPeruDistricts] ADD  DEFAULT (NULL) FOR [provinceId]
GO
ALTER TABLE [usuario].[ubigeoPeruDistricts] ADD  DEFAULT (NULL) FOR [departmentId]
GO
ALTER TABLE [juego].[pack]  WITH CHECK ADD  CONSTRAINT [FK_juego] FOREIGN KEY([IdJuego])
REFERENCES [juego].[Juego] ([idJuego])
GO
ALTER TABLE [juego].[pack] CHECK CONSTRAINT [FK_juego]
GO
ALTER TABLE [juego].[pack]  WITH CHECK ADD  CONSTRAINT [FK_sorteo] FOREIGN KEY([IdSorteo])
REFERENCES [juego].[Sorteo] ([idSorteo])
GO
ALTER TABLE [juego].[pack] CHECK CONSTRAINT [FK_sorteo]
GO
ALTER TABLE [juego].[Sorteo]  WITH CHECK ADD  CONSTRAINT [FK_Sorteo_Juego] FOREIGN KEY([idJuego])
REFERENCES [juego].[Juego] ([idJuego])
GO
ALTER TABLE [juego].[Sorteo] CHECK CONSTRAINT [FK_Sorteo_Juego]
GO
ALTER TABLE [juego].[ticketSorteo]  WITH CHECK ADD  CONSTRAINT [FK_tipoResultado] FOREIGN KEY([idTipoResultado])
REFERENCES [juego].[tipoResultado] ([idTipoResultado])
GO
ALTER TABLE [juego].[ticketSorteo] CHECK CONSTRAINT [FK_tipoResultado]
GO
ALTER TABLE [pago].[compraSorteo]  WITH CHECK ADD  CONSTRAINT [FK_codigoPromocional] FOREIGN KEY([idCodigoPromocional])
REFERENCES [juego].[codigoPromocional] ([idCodigoPromocional])
GO
ALTER TABLE [pago].[compraSorteo] CHECK CONSTRAINT [FK_codigoPromocional]
GO
ALTER TABLE [pago].[compraSorteo]  WITH CHECK ADD  CONSTRAINT [FK_metodoPago] FOREIGN KEY([idMetodoPago])
REFERENCES [pago].[metodoPago] ([idMetodoPago])
GO
ALTER TABLE [pago].[compraSorteo] CHECK CONSTRAINT [FK_metodoPago]
GO
ALTER TABLE [pago].[compraSorteo]  WITH CHECK ADD  CONSTRAINT [FK_pack] FOREIGN KEY([idPack])
REFERENCES [juego].[pack] ([idPack])
GO
ALTER TABLE [pago].[compraSorteo] CHECK CONSTRAINT [FK_pack]
GO
ALTER TABLE [pago].[compraSorteo]  WITH CHECK ADD  CONSTRAINT [FK_sorteo] FOREIGN KEY([idSorteo])
REFERENCES [juego].[Sorteo] ([idSorteo])
GO
ALTER TABLE [pago].[compraSorteo] CHECK CONSTRAINT [FK_sorteo]
GO
ALTER TABLE [pago].[compraSorteo]  WITH CHECK ADD  CONSTRAINT [FK_tipoDocumento] FOREIGN KEY([idTipoDocumento])
REFERENCES [usuario].[tipoDocumento] ([idTipoDocumento])
GO
ALTER TABLE [pago].[compraSorteo] CHECK CONSTRAINT [FK_tipoDocumento]
GO
ALTER TABLE [pago].[compraSorteo]  WITH CHECK ADD  CONSTRAINT [FK_tipoPago] FOREIGN KEY([idEstadoPago])
REFERENCES [pago].[estadoPago] ([idEstadoPago])
GO
ALTER TABLE [pago].[compraSorteo] CHECK CONSTRAINT [FK_tipoPago]
GO
ALTER TABLE [pago].[compraSorteo]  WITH CHECK ADD  CONSTRAINT [FK_tipoResultado] FOREIGN KEY([idTipoResultado])
REFERENCES [juego].[tipoResultado] ([idTipoResultado])
GO
ALTER TABLE [pago].[compraSorteo] CHECK CONSTRAINT [FK_tipoResultado]
GO
ALTER TABLE [pago].[compraSorteo]  WITH CHECK ADD  CONSTRAINT [FK_tipoTicket] FOREIGN KEY([idTipoTicket])
REFERENCES [juego].[tipoTicket] ([idTipoTicket])
GO
ALTER TABLE [pago].[compraSorteo] CHECK CONSTRAINT [FK_tipoTicket]
GO
ALTER TABLE [pago].[compraSorteo]  WITH CHECK ADD  CONSTRAINT [FK_tipoUsuario] FOREIGN KEY([idTipoUsuario])
REFERENCES [usuario].[tipoUsuario] ([idTipoUsuario])
GO
ALTER TABLE [pago].[compraSorteo] CHECK CONSTRAINT [FK_tipoUsuario]
GO
ALTER TABLE [pago].[compraSorteo]  WITH CHECK ADD  CONSTRAINT [FK_usuario] FOREIGN KEY([idUsuario])
REFERENCES [usuario].[Usuario] ([idUsuario])
GO
ALTER TABLE [pago].[compraSorteo] CHECK CONSTRAINT [FK_usuario]
GO
ALTER TABLE [usuario].[ubigeoPeruDistricts]  WITH CHECK ADD  CONSTRAINT [FK_DepartamentoDistrito] FOREIGN KEY([departmentId])
REFERENCES [usuario].[ubigeoPeruDepartments] ([id])
GO
ALTER TABLE [usuario].[ubigeoPeruDistricts] CHECK CONSTRAINT [FK_DepartamentoDistrito]
GO
ALTER TABLE [usuario].[ubigeoPeruDistricts]  WITH CHECK ADD  CONSTRAINT [FK_ProvinciaDistrito] FOREIGN KEY([provinceId])
REFERENCES [usuario].[ubigeoPeruProvinces] ([id])
GO
ALTER TABLE [usuario].[ubigeoPeruDistricts] CHECK CONSTRAINT [FK_ProvinciaDistrito]
GO
ALTER TABLE [usuario].[ubigeoPeruProvinces]  WITH CHECK ADD  CONSTRAINT [FK_Departamento] FOREIGN KEY([departmentId])
REFERENCES [usuario].[ubigeoPeruDepartments] ([id])
GO
ALTER TABLE [usuario].[ubigeoPeruProvinces] CHECK CONSTRAINT [FK_Departamento]
GO
ALTER TABLE [usuario].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Pais] FOREIGN KEY([idPais])
REFERENCES [usuario].[paises] ([id])
GO
ALTER TABLE [usuario].[Usuario] CHECK CONSTRAINT [FK_Pais]
GO
ALTER TABLE [usuario].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_tipoDocumento] FOREIGN KEY([idTipoDocumento])
REFERENCES [usuario].[tipoDocumento] ([idTipoDocumento])
GO
ALTER TABLE [usuario].[Usuario] CHECK CONSTRAINT [FK_Usuario_tipoDocumento]
GO
ALTER TABLE [usuario].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_tipoUsuario] FOREIGN KEY([idTipoUsuario])
REFERENCES [usuario].[tipoUsuario] ([idTipoUsuario])
GO
ALTER TABLE [usuario].[Usuario] CHECK CONSTRAINT [FK_Usuario_tipoUsuario]
GO
ALTER TABLE [usuario].[Usuario]  WITH NOCHECK ADD  CONSTRAINT [FK_Usuario_ubigeoPeruDepartments] FOREIGN KEY([idDepartamento])
REFERENCES [usuario].[ubigeoPeruDepartments] ([id])
GO
ALTER TABLE [usuario].[Usuario] NOCHECK CONSTRAINT [FK_Usuario_ubigeoPeruDepartments]
GO
ALTER TABLE [usuario].[Usuario]  WITH NOCHECK ADD  CONSTRAINT [FK_Usuario_ubigeoPeruDistricts] FOREIGN KEY([idDistrito])
REFERENCES [usuario].[ubigeoPeruDistricts] ([id])
GO
ALTER TABLE [usuario].[Usuario] NOCHECK CONSTRAINT [FK_Usuario_ubigeoPeruDistricts]
GO
ALTER TABLE [usuario].[Usuario]  WITH NOCHECK ADD  CONSTRAINT [FK_Usuario_ubigeoPeruProvinces] FOREIGN KEY([idProvincia])
REFERENCES [usuario].[ubigeoPeruProvinces] ([id])
GO
ALTER TABLE [usuario].[Usuario] NOCHECK CONSTRAINT [FK_Usuario_ubigeoPeruProvinces]
GO
/****** Object:  StoredProcedure [autenticacion].[spListarUsuarioPorEmail]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [autenticacion].[spListarUsuarioPorEmail] @email varchar(150)
AS
BEGIN
	
	SET NOCOUNT ON;

    
	SELECT * from usuario.Usuario where email = @email and activo=1
END
GO
/****** Object:  StoredProcedure [juego].[spActualizarCodigoPromocional]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create PROCEDURE [juego].[spActualizarCodigoPromocional] (@idCodigoPromocional int,@idInfluencer int, @codigo varchar(50),@multiplicador int)
AS
BEGIN
	
	update juego.codigoPromocional
	set
	idInfluencer = @idInfluencer,
	codigo = @codigo,
	multiplicador = @multiplicador
	where idCodigoPromocional = @idCodigoPromocional
	
END
GO
/****** Object:  StoredProcedure [juego].[spActualizarInfluencer]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [juego].[spActualizarInfluencer] @idInfluencer int,@descripcion varchar(350)

AS
BEGIN

	update juego.influencer
	set
	descripcion = @descripcion
	where idInfluencer = @idInfluencer
	
END
GO
/****** Object:  StoredProcedure [juego].[spActualizarJuego]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [juego].[spActualizarJuego](@idJuego int,@nombre varchar(100), @descripcion varchar(250),@precio decimal(10,2))

AS
BEGIN
	
	update juego.Juego
	set
	nombre=@nombre,
	descripcion=@descripcion,
	precio=@precio
	where idJuego=@idJuego
	

    
END
GO
/****** Object:  StoredProcedure [juego].[spActualizarPack]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [juego].[spActualizarPack] (@idPack int,@idJuego int,@idSorteo int,@descripcion varchar(150),@multiplicador decimal(10,2), @monto decimal(10,2))


AS
BEGIN
	
	update juego.pack
	set
	idJuego = @idJuego,
	idSorteo = @idSorteo,
	descripcion = @descripcion,
	multiplicador = @multiplicador,
	monto = @monto
	where idPack = @idPack
    
END
GO
/****** Object:  StoredProcedure [juego].[spActualizarSorteo]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [juego].[spActualizarSorteo](@idSorteo int, @fechaSorteo date,@limiteInferiorOnline int)

AS
BEGIN
	
	update juego.Sorteo set fechaSorteo = @fechaSorteo, limiteInferiorOnline = @limiteInferiorOnline where idSorteo = @idSorteo
    
END
GO
/****** Object:  StoredProcedure [juego].[spActualizarTipoTicket]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [juego].[spActualizarTipoTicket] @idTipoTicket int, @descripcion varchar(50)

AS
BEGIN
	
	update juego.tipoTicket
	set
	descripcion = @descripcion
	where idTipoTicket= @idTipoTicket
	    
END
GO
/****** Object:  StoredProcedure [juego].[spCrearIndicadorInfluencer]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [juego].[spCrearIndicadorInfluencer] @idCodigoPromocional int

AS
BEGIN
	
	insert into juego.indicadorInfluencer(idCodigoPromocional,fecha) values (@idCodigoPromocional,getdate())
	    
END
GO
/****** Object:  StoredProcedure [juego].[spCrearJuegoNuevo]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [juego].[spCrearJuegoNuevo](@nombre varchar(100), @descripcion varchar(250),@precio decimal(10,2))

AS
BEGIN
	
	insert into juego.Juego(nombre,descripcion,precio,activo) 
	values(@nombre,@descripcion,@precio,1)
	

    
END
GO
/****** Object:  StoredProcedure [juego].[spCrearNuevoCodigoPromocional]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [juego].[spCrearNuevoCodigoPromocional] @idInfluencer int, @codigo varchar(50),@multiplicador int
AS
BEGIN
	
	insert into juego.codigoPromocional (idInfluencer,codigo,multiplicador,activo) 
	values (@idInfluencer,@codigo,@multiplicador,1)
	
END
GO
/****** Object:  StoredProcedure [juego].[spCrearNuevoInfluencer]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [juego].[spCrearNuevoInfluencer] @descripcion varchar(350)

AS
BEGIN

	insert into juego.influencer (descripcion,activo) values (@descripcion,1)
	
END
GO
/****** Object:  StoredProcedure [juego].[spCrearNuevoPack]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [juego].[spCrearNuevoPack] (@idJuego int, @idSorteo int,@descripcion varchar(150),@multiplicador decimal(10,2), @monto decimal(10,2))


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into juego.pack (idJuego, idSorteo, descripcion,multiplicador,monto,activo)
    values (@idJuego,@idSorteo,@descripcion,@multiplicador,@monto,1)
    
END
GO
/****** Object:  StoredProcedure [juego].[spCrearNuevoTicketSorteoFisico]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [juego].[spCrearNuevoTicketSorteoFisico](@numeroTicketInicial int, @cantidadTickets int,@idCompraSorteo int) 
AS


	SET NOCOUNT ON;

Declare @contador int;
set @contador=0;
	
while @contador < @cantidadTickets
BEGIN

	insert into juego.ticketSorteo (idCompraSorteo,numeroTicket,fecha,idTipoResultado,activo)
	values (@idCompraSorteo,@numeroTicketInicial,GETDATE(),3,1)
	set @contador = @contador + 1;
	set @numeroTicketInicial = @numeroTicketInicial + 1;
END
GO
/****** Object:  StoredProcedure [juego].[spCrearNuevoTicketSorteoVirtual]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [juego].[spCrearNuevoTicketSorteoVirtual] 
	@ticketInicial INT,
    @cantidadTickets INT,
    @idCompraSorteo INT
AS
BEGIN
    SET NOCOUNT ON;

	Declare @contador int;
	set @contador=0;

    WHILE @contador < @cantidadTickets
    BEGIN
        INSERT INTO juego.ticketSorteo (idCompraSorteo, numeroTicket, fecha, activo, idTipoResultado)
        VALUES (@idCompraSorteo, @ticketInicial, GETDATE(), 1, 3);

        SET @contador = @contador + 1;
        SET @ticketInicial = @ticketInicial + 1;
    END
END
GO
/****** Object:  StoredProcedure [juego].[spCrearSorteo]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [juego].[spCrearSorteo](@idJuego int, @fechaSorteo date,@limiteInferiorOnline int)

AS
BEGIN
	
	insert into juego.Sorteo(idJuego,fechaSorteo,limiteInferiorOnline,activo)
	values
	(@idJuego,@fechaSorteo,@limiteInferiorOnline,1)
	

    
END
GO
/****** Object:  StoredProcedure [juego].[spCrearTipoTicket]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [juego].[spCrearTipoTicket] @descripcion varchar(50)

AS
BEGIN
	
	insert into juego.tipoTicket (descripcion) values (@descripcion)
	    
END
GO
/****** Object:  StoredProcedure [juego].[spDesactivarCodigoPromocional]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [juego].[spDesactivarCodigoPromocional] @idCodigoPromocional int
AS
BEGIN
	
	update juego.codigoPromocional
	set
	activo=0
	where idCodigoPromocional = @idCodigoPromocional
	
END
GO
/****** Object:  StoredProcedure [juego].[spDesactivarInfluencer]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [juego].[spDesactivarInfluencer] @idInfluencer int

AS
BEGIN

	update juego.influencer
	set
	activo = 0
	where idInfluencer = @idInfluencer
	
END
GO
/****** Object:  StoredProcedure [juego].[spDesactivarJuego]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [juego].[spDesactivarJuego](@idJuego int)

AS
BEGIN
	
	update juego.Juego
	set
	activo=0
	where idJuego=@idJuego
	

    
END
GO
/****** Object:  StoredProcedure [juego].[spDesactivarPack]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [juego].[spDesactivarPack] @idPack int


AS
BEGIN
	
	update juego.pack
	set
	activo = 0
	where idPack = @idPack
    
END
GO
/****** Object:  StoredProcedure [juego].[spDesactivarSorteo]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [juego].[spDesactivarSorteo](@idSorteo int)

AS
BEGIN
	
	update juego.Sorteo set activo = 0 where idSorteo = @idSorteo
    
END
GO
/****** Object:  StoredProcedure [juego].[spIngresarTicketGanadorSorteo]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [juego].[spIngresarTicketGanadorSorteo](@idSorteo int, @ticketGanador varchar(50))

AS
BEGIN
	
	update juego.Sorteo
	set
	ticketGanador=@ticketGanador,
	activo=0
	where idSorteo=@idSorteo

    
END
GO
/****** Object:  StoredProcedure [juego].[spListarCodigoPromocional]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [juego].[spListarCodigoPromocional] 
AS
BEGIN
	
	select * from juego.codigoPromocional where activo=1
	
END
GO
/****** Object:  StoredProcedure [juego].[spListarCodigoPromocionalPorId]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create PROCEDURE [juego].[spListarCodigoPromocionalPorId] @idCodigoPromocional int
AS
BEGIN
	
	select * from juego.codigoPromocional where idCodigoPromocional = @idCodigoPromocional and activo=1
	
END
GO
/****** Object:  StoredProcedure [juego].[spListarCodigoPromocionalPorInfluencer]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create PROCEDURE [juego].[spListarCodigoPromocionalPorInfluencer] @idInfluencer int
AS
BEGIN
	
	select * from juego.codigoPromocional where idInfluencer = @idInfluencer and activo=1
	
END
GO
/****** Object:  StoredProcedure [juego].[spListarIndicadorInfluencer]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [juego].[spListarIndicadorInfluencer] 

AS
BEGIN
	
	select * from juego.indicadorInfluencer
	    
END
GO
/****** Object:  StoredProcedure [juego].[spListarIndicadorInfluencerPorCodigoPromocional]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [juego].[spListarIndicadorInfluencerPorCodigoPromocional] @idCodigoPromocional int

AS
BEGIN
	
	select * from juego.indicadorInfluencer where idCodigoPromocional = @idCodigoPromocional
	    
END
GO
/****** Object:  StoredProcedure [juego].[spListarInfluencer]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [juego].[spListarInfluencer] 

AS
BEGIN

	select * from juego.influencer where activo=1
	
END
GO
/****** Object:  StoredProcedure [juego].[spListarInfluencerPorId]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [juego].[spListarInfluencerPorId] @idInfluencer int

AS
BEGIN

	select * from juego.influencer where idInfluencer = @idInfluencer and activo=1
	
END
GO
/****** Object:  StoredProcedure [juego].[spListarJuego]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [juego].[spListarJuego]

AS
BEGIN
	
	select * from juego.Juego where activo=1
	

    
END
GO
/****** Object:  StoredProcedure [juego].[spListarJuegoPorId]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [juego].[spListarJuegoPorId] @idJuego int

AS
BEGIN
	
	select * from juego.Juego where idJuego = @idJuego and activo=1
	

    
END
GO
/****** Object:  StoredProcedure [juego].[spListarPack]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [juego].[spListarPack] 


AS
BEGIN
	
	select * from juego.pack where activo=1
    
END
GO
/****** Object:  StoredProcedure [juego].[spListarPackPorId]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [juego].[spListarPackPorId] @idPack int 


AS
BEGIN
	
	select * from juego.pack where idPack = @idPack and activo=1
    
END
GO
/****** Object:  StoredProcedure [juego].[spListarPackPorJuego]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [juego].[spListarPackPorJuego] @idJuego int 


AS
BEGIN
	
	select * from juego.pack where idJuego = @idJuego and activo=1
    
END
GO
/****** Object:  StoredProcedure [juego].[spListarPackPorSorteo]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [juego].[spListarPackPorSorteo] @idSorteo int 


AS
BEGIN
	
	select * from juego.pack where idSorteo = @idSorteo and activo=1
    
END
GO
/****** Object:  StoredProcedure [juego].[spListarSorteoPorId]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [juego].[spListarSorteoPorId](@idSorteo int)

AS
BEGIN
	
	select * from juego.Sorteo where idSorteo=@idSorteo and activo=1

    
END
GO
/****** Object:  StoredProcedure [juego].[spListarSorteoPorJuego]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [juego].[spListarSorteoPorJuego](@idJuego int)

AS
BEGIN
	
	select * from juego.Sorteo where idJuego=@idJuego and activo=1

    
END
GO
/****** Object:  StoredProcedure [juego].[spListarSorteos]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [juego].[spListarSorteos]

AS
BEGIN
	
	select * from juego.Sorteo

    
END
GO
/****** Object:  StoredProcedure [juego].[spListarTicketSorteoPorCompraSorteo]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [juego].[spListarTicketSorteoPorCompraSorteo] @idCompraSorteo as int

AS
BEGIN
	
	select ts.idTicketSorteo, ts.numeroTicket, ts.fecha, ts.idTipoResultado, tr.descripcion from juego.ticketSorteo ts
	inner join juego.tipoResultado tr on tr.idTipoResultado = ts.idTipoResultado
	where idCompraSorteo = @idCompraSorteo

    
END
GO
/****** Object:  StoredProcedure [juego].[spListarTipoTicket]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [juego].[spListarTipoTicket] 

AS
BEGIN
	
	select * from juego.tipoTicket
	    
END
GO
/****** Object:  StoredProcedure [juego].[spListarTipoTicketPorId]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [juego].[spListarTipoTicketPorId] @idTipoTicket as int

AS
BEGIN
	
	select * from juego.tipoTicket where idTipoTicket = @idTipoTicket
	    
END
GO
/****** Object:  StoredProcedure [pago].[spActualizarEstadoPagoEnCompraSorteo]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [pago].[spActualizarEstadoPagoEnCompraSorteo] @idCompraSorteo int


AS
BEGIN
	
	update pago.compraSorteo
	set
	idEstadoPago = 2
	where idCompraSorteo = @idCompraSorteo
    
END
GO
/****** Object:  StoredProcedure [pago].[spActualizarMetodoPago]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [pago].[spActualizarMetodoPago] @idMetodoPago int,@descripcion varchar(50)


AS
BEGIN
	
	update pago.metodoPago
	set
	descripcion = @descripcion
	where idMetodoPago = @idMetodoPago
    
END
GO
/****** Object:  StoredProcedure [pago].[spCrearNuevaCompraSorteo]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [pago].[spCrearNuevaCompraSorteo] (@idSorteo int,@idUsuario int,@idTipoUsuario int,
	@cantidadInicial int,@cantidadFinal int,@idTipoTicket int,@primerTicketFisico int,@monto decimal(10,2),
	@idMetodoPago int, @idPack int, @idCodigoPromocional int,@idTipoDocumento int,
	@dni varchar(20),@telefono varchar(20),@email varchar(250))

AS
BEGIN

    -- Realiza la inserción
    insert into pago.compraSorteo(idSorteo,idUsuario,idTipoUsuario,fecha,cantidadInicial,cantidadFinal,
	idTipoTicket,primerTicketFisico,monto,idMetodoPago,idPack,idCodigoPromocional,idTipoDocumento,dni,telefono,email,idTipoResultado,idEstadoPago,activo)
	values(@idSorteo,@idUsuario,@idTipoUsuario,GETDATE(),@cantidadInicial,@cantidadFinal,@idTipoTicket,@primerTicketFisico,
	@monto,@idMetodoPago,@idPack,@idCodigoPromocional,@idTipoDocumento,@dni,@telefono,@email,3,1,1);

    -- Devuelve el ID de la última inserción
    SELECT SCOPE_IDENTITY() AS idCompraSorteo;


END

GO
/****** Object:  StoredProcedure [pago].[spCrearNuevoMetodoPago]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [pago].[spCrearNuevoMetodoPago] @descripcion varchar(50)


AS
BEGIN
	
	insert into pago.metodopago (descripcion,activo) values (@descripcion,1)
    
END
GO
/****** Object:  StoredProcedure [pago].[spDesactivarCompraSorteo]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [pago].[spDesactivarCompraSorteo] @idCompraSorteo int

AS
BEGIN
	SET NOCOUNT ON;
	
	update pago.compraSorteo
	set
	activo=0
	where idCompraSorteo=@idCompraSorteo

END
GO
/****** Object:  StoredProcedure [pago].[spDesactivarMetodoPago]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [pago].[spDesactivarMetodoPago] @idMetodoPago int

AS
BEGIN
	
	update pago.metodoPago
	set
	activo = 0
	where idMetodoPago = @idMetodoPago
    
END
GO
/****** Object:  StoredProcedure [pago].[spListarCompraSorteoPorSorteo]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [pago].[spListarCompraSorteoPorSorteo] @idSorteo as int

AS
BEGIN
	
	select cs.idSorteo as idSorteo,cs.idCompraSorteo as idCompraSorteo,j.nombre as juego,s.fechaSorteo as fechaSorteo, cs.fecha as fechaCompra, cs.cantidadFinal as cantidadTickets,ep.descripcion as estadoPago, tr.descripcion as premio, cs.monto as monto
	from pago.compraSorteo cs 
	inner join juego.Sorteo s on cs.idSorteo = s.idSorteo
	inner join juego.Juego j on j.idJuego = s.idJuego
	inner join juego.tipoResultado tr on tr.idTipoResultado = cs.idTipoResultado
	inner join pago.estadoPago ep on ep.idEstadoPago = cs.idEstadoPago
	where cs.idSorteo = @idSorteo

    
END
GO
/****** Object:  StoredProcedure [pago].[spListarCompraSorteoPorUsuario]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [pago].[spListarCompraSorteoPorUsuario] @idUsuario as int

AS
BEGIN
	
	select cs.idSorteo as idSorteo, cs.idCompraSorteo as idCompraSorteo,j.nombre as juego,s.fechaSorteo as fechaSorteo, cs.fecha as fechaCompra, cs.cantidadFinal as cantidadTickets,ep.descripcion as estadoPago, tr.descripcion as premio, cs.monto as monto
	from pago.compraSorteo cs 
	inner join juego.Sorteo s on cs.idSorteo = s.idSorteo
	inner join juego.Juego j on j.idJuego = s.idJuego
	inner join juego.tipoResultado tr on tr.idTipoResultado = cs.idTipoResultado
	inner join pago.estadoPago ep on ep.idEstadoPago = cs.idEstadoPago
	where cs.idUsuario = @idUsuario

    
END
GO
/****** Object:  StoredProcedure [pago].[spListarEstadoPago]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [pago].[spListarEstadoPago] 

AS
BEGIN
	
	select * from pago.estadoPago 
    
END
GO
/****** Object:  StoredProcedure [pago].[spListarEstadoPagoPorId]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [pago].[spListarEstadoPagoPorId] @idEstadoPago as int

AS
BEGIN
	
	select * from pago.estadoPago where idEstadoPago = @idEstadoPago
    
END
GO
/****** Object:  StoredProcedure [pago].[spListarMetodoPago]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [pago].[spListarMetodoPago] 

AS
BEGIN
	
	select * from pago.metodoPago where activo=1
    
END
GO
/****** Object:  StoredProcedure [pago].[spListarMetodoPagoPorId]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [pago].[spListarMetodoPagoPorId] @idMetodoPago as int

AS
BEGIN
	
	select * from pago.metodoPago where idMetodoPago = @idMetodoPago and activo=1
    
END
GO
/****** Object:  StoredProcedure [pago].[spObtenerLimiteInferior]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [pago].[spObtenerLimiteInferior]
    @idSorteo INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
		limiteInferiorOnline
    FROM juego.Sorteo 
    WHERE idSorteo = @idSorteo

END
GO
/****** Object:  StoredProcedure [pago].[spObtenerUltimoTicketSorteoVirtual]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [pago].[spObtenerUltimoTicketSorteoVirtual] 
    @idSorteo INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
		ISNULL(MAX(a.numeroTicket),0)
    FROM juego.ticketSorteo a
    INNER JOIN pago.compraSorteo b ON a.idCompraSorteo = b.idCompraSorteo
    WHERE b.idSorteo = @idSorteo AND b.idTipoTicket = 2;

END
GO
/****** Object:  StoredProcedure [usuario].[spActualizarTipoDocumento]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [usuario].[spActualizarTipoDocumento] @idTipoDocumento int, @descripcion varchar(50)

AS
BEGIN
	
	
	SET NOCOUNT ON;

	update usuario.tipoDocumento
	set
	descripcion=@descripcion
	where idTipoDocumento = @idTipoDocumento
    
	
	
END
GO
/****** Object:  StoredProcedure [usuario].[spActualizarTipoUsuario]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [usuario].[spActualizarTipoUsuario] @idTipoUsuario int,@descripcion varchar(200)

AS
BEGIN
	
	
	SET NOCOUNT ON;

	update usuario.tipoUsuario
	set
	descripcion = @descripcion
	where idTipoUsuario= @idTipoUsuario
    
	
	
END
GO
/****** Object:  StoredProcedure [usuario].[spActualizarUsuario]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [usuario].[spActualizarUsuario](
     @dni VARCHAR(20),
     @direccion VARCHAR(150),
     @idPais int,
     @idDepartamento varchar(2),
     @idProvincia varchar(4),
     @idDistrito varchar(6),
     @codigoPostal VARCHAR(50),
     @celular VARCHAR(50)
)
as
BEGIN
    
		
        -- Insertar el nuevo usuario
       
       update usuario.Usuario
       set
       direccion=@direccion,
       idPais = @idPais,
       idDepartamento=@idDepartamento,
       idProvincia=@idProvincia,
       idDistrito=@idDistrito,
       codigoPostal=@codigoPostal,
       celular=@celular
       where dni=@dni
       
       
END 
GO
/****** Object:  StoredProcedure [usuario].[spCrearTipoDocumento]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [usuario].[spCrearTipoDocumento] @descripcion varchar(50)

AS
BEGIN
	
	

	insert into usuario.tipoDocumento (descripcion,activo) values (@descripcion,1)
    
	
	
END
GO
/****** Object:  StoredProcedure [usuario].[spCrearTipoUsuario]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [usuario].[spCrearTipoUsuario] @descripcion varchar(200)

AS
BEGIN
	
	
	SET NOCOUNT ON;

	insert into usuario.tipoUsuario (descripcion) values (@descripcion)
    
	
	
END
GO
/****** Object:  StoredProcedure [usuario].[spCrearUsuarioNuevo]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [usuario].[spCrearUsuarioNuevo](
     @nombreUsuario varchar(150),
     @nombres VARCHAR(100),
     @apellidos VARCHAR(100),
     @dni VARCHAR(20),
	 @fechaNacimiento datetime,
     @idTipoDocumento int,
     @email VARCHAR(150),
     @direccion VARCHAR(150),
     @idPais int,
     @idDepartamento varchar(2),
     @idProvincia varchar(4),
     @idDistrito varchar(6),
     @codigoPostal VARCHAR(50),
     @contrasena VARCHAR(350),
     @celular VARCHAR(50),
     @idTipoUsuario int
)
as
BEGIN
    
		
        -- Insertar el nuevo usuario
          
        INSERT INTO usuario.usuario with(rowlock)(nombreUsuario, nombres,apellidos,dni,fechaNacimiento,idTipoDocumento,email,
        direccion,idPais,idDepartamento,idProvincia,idDistrito,codigoPostal,contrasena,celular,idTipoUsuario,activo)  
        VALUES (@nombreUsuario,@nombres,@apellidos,@dni,@fechaNacimiento,@idTipoDocumento,@email,
        @direccion,@idPais,@idDepartamento,@idProvincia,@idDistrito,@codigoPostal,@contrasena,@celular,@idTipoUsuario,1);
        
    
END 
GO
/****** Object:  StoredProcedure [usuario].[spCrearUsuarioNuevoUSER]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [usuario].[spCrearUsuarioNuevoUSER](
     @nombreUsuario varchar(150),
     @nombres VARCHAR(100),
     @apellidos VARCHAR(100),
     @dni VARCHAR(20),
	 @fechaNacimiento datetime,
     @idTipoDocumento int,
     @email VARCHAR(150),
     @direccion VARCHAR(150),
     @idPais int,
     @idDepartamento varchar(2),
     @idProvincia varchar(4),
     @idDistrito varchar(6),
     @codigoPostal VARCHAR(50),
     @contrasena VARCHAR(350),
     @celular VARCHAR(50)
)
as
BEGIN
    
		
        -- Insertar el nuevo usuario
          
        INSERT INTO usuario.usuario with(rowlock)(nombreUsuario, nombres,apellidos,dni,fechaNacimiento,idTipoDocumento,email,
        direccion,idPais,idDepartamento,idProvincia,idDistrito,codigoPostal,contrasena,celular,idTipoUsuario,activo)  
        VALUES (@nombreUsuario,@nombres,@apellidos,@dni,@fechaNacimiento,@idTipoDocumento,@email,
        @direccion,@idPais,@idDepartamento,@idProvincia,@idDistrito,@codigoPostal,@contrasena,@celular,1,1);
        
    
END 
GO
/****** Object:  StoredProcedure [usuario].[spDesactivarTipoDocumento]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [usuario].[spDesactivarTipoDocumento] @idTipoDocumento int

AS
BEGIN
	
	
	SET NOCOUNT ON;

	update usuario.tipoDocumento
	set
	activo=0
	where idTipoDocumento = @idTipoDocumento
    
	
	
END
GO
/****** Object:  StoredProcedure [usuario].[spDesactivarUsuario]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [usuario].[spDesactivarUsuario] @dni varchar(10)
AS
BEGIN
	
	SET NOCOUNT ON;


	update usuario.Usuario
	set 
	activo=0
	where dni= @dni

END
GO
/****** Object:  StoredProcedure [usuario].[spListarDepartamentos]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [usuario].[spListarDepartamentos]
AS
BEGIN

	SET NOCOUNT ON;

	select * from usuario.ubigeoPeruDepartments
END
GO
/****** Object:  StoredProcedure [usuario].[spListarDistritoPorProvinciayDepartamento]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [usuario].[spListarDistritoPorProvinciayDepartamento] 
		@idDepartamento varchar(2),
		@idProvincia varchar(4)

AS
BEGIN
	
	SET NOCOUNT ON;

    select * 
    from usuario.ubigeoPeruDistricts 
    where departmentId = @idDepartamento and provinceId = @idProvincia
END
GO
/****** Object:  StoredProcedure [usuario].[spListarPaises]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [usuario].[spListarPaises]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from usuario.paises
END
GO
/****** Object:  StoredProcedure [usuario].[spListarProvinciasPorDepartamento]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [usuario].[spListarProvinciasPorDepartamento] 
		@idDepartamento varchar(2)

AS
BEGIN
	
	SET NOCOUNT ON;

    select * from usuario.ubigeoPeruProvinces where departmentId = @idDepartamento;
END
GO
/****** Object:  StoredProcedure [usuario].[spListarTipoDocumento]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [usuario].[spListarTipoDocumento]
AS
BEGIN
	
	
	SET NOCOUNT ON;

    select * from usuario.tipoDocumento where activo=1
    
END
GO
/****** Object:  StoredProcedure [usuario].[spListarTipoDocumentoPorId]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [usuario].[spListarTipoDocumentoPorId] @id as integer
AS
BEGIN
	
	
	SET NOCOUNT ON;

    select * from usuario.tipoDocumento where idTipoDocumento = @id
    
END

GO
/****** Object:  StoredProcedure [usuario].[spListarTipoUsuario]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [usuario].[spListarTipoUsuario] 
as
BEGIN
    
    select * from usuario.tipoUsuario
    
END 
GO
/****** Object:  StoredProcedure [usuario].[spListarTipoUsuarioPorId]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [usuario].[spListarTipoUsuarioPorId] @id as integer
as
BEGIN
    
    select * from usuario.tipoUsuario where idTipoUsuario = @id
    
END 
GO
/****** Object:  StoredProcedure [usuario].[spListarUsuario]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [usuario].[spListarUsuario] 
AS
BEGIN
	
	SET NOCOUNT ON;

    
	SELECT * from usuario.Usuario where activo=1
END
GO
/****** Object:  StoredProcedure [usuario].[spListarUsuarioPorDni]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [usuario].[spListarUsuarioPorDni] @dni as varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from usuario.Usuario where dni = @dni and activo = 1
END
GO
/****** Object:  StoredProcedure [usuario].[spListarUsuarioPorId]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [usuario].[spListarUsuarioPorId] @idUsuario as int
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT u.idUsuario, u.nombreUsuario, u.nombres, u.apellidos, u.dni,u.fechaNacimiento,u.idTipoDocumento,td.descripcion,u.email,u.direccion,u.idPais,p.nombre,u.idDepartamento,ud.name,
		u.idProvincia, up.name,u.idDistrito,udi.name,u.codigoPostal,u.celular,u.idTipoUsuario,tu.descripcion
	from usuario.Usuario u 
	inner join usuario.tipoDocumento td on td.idTipoDocumento = u.idTipoDocumento 
	inner join usuario.tipoUsuario tu on tu.idTipoUsuario = u.idTipoUsuario
	inner join usuario.paises p on p.id = u.idPais
	inner join usuario.ubigeoPeruDepartments ud on ud.id = u.idDepartamento
	inner join usuario.ubigeoPeruProvinces up on up.id = u.idProvincia
	inner join usuario.ubigeoPeruDistricts udi on udi.id = u.idDistrito
	where u.idUsuario = @idUsuario and u.activo = 1
END
GO
/****** Object:  StoredProcedure [usuario].[spVerificarExistenciaDni]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [usuario].[spVerificarExistenciaDni](
     @dni VARCHAR(20)     
)
as
BEGIN
    
        select COUNT(*) 
        from usuario.Usuario 
        where dni = @dni
        
    
END 
GO
/****** Object:  StoredProcedure [usuario].[spVerificarExistenciaEmail]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [usuario].[spVerificarExistenciaEmail](
     @email VARCHAR(150)     
)
as
BEGIN
    
        select COUNT(*) 
        from usuario.Usuario 
        where email= @email
        
    
END 
GO
/****** Object:  StoredProcedure [usuario].[spVerificarExistenciaNombreUsuario]    Script Date: 30/10/2024 11:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [usuario].[spVerificarExistenciaNombreUsuario]( 
			@nombreUsuario varchar(150)
)

AS
BEGIN

	SET NOCOUNT ON;


	select COUNT(*) 
        from usuario.Usuario 
        where nombreUsuario= @nombreUsuario
        
END
GO
USE [master]
GO
ALTER DATABASE [bdLoteria] SET  READ_WRITE 
GO
