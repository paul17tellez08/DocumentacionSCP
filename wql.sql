USE [master]
GO
/****** Object:  Database [ControlBasculas]    Script Date: 18/11/2020 21:19:30 ******/
CREATE DATABASE [ControlBasculas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ControlBasculas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ControlBasculas.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ControlBasculas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ControlBasculas_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ControlBasculas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ControlBasculas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ControlBasculas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ControlBasculas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ControlBasculas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ControlBasculas] SET ARITHABORT OFF 
GO
ALTER DATABASE [ControlBasculas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ControlBasculas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ControlBasculas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ControlBasculas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ControlBasculas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ControlBasculas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ControlBasculas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ControlBasculas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ControlBasculas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ControlBasculas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ControlBasculas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ControlBasculas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ControlBasculas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ControlBasculas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ControlBasculas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ControlBasculas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ControlBasculas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ControlBasculas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ControlBasculas] SET  MULTI_USER 
GO
ALTER DATABASE [ControlBasculas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ControlBasculas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ControlBasculas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ControlBasculas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ControlBasculas]
GO
/****** Object:  Table [dbo].[Conductor]    Script Date: 18/11/2020 21:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conductor](
	[IdConductor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Conductor] [nvarchar](50) NULL,
	[Numero_Licencia] [nvarchar](50) NULL,
	[Numero_Cedula] [nvarchar](50) NULL,
	[Numero_Pasaporte] [nvarchar](50) NULL,
	[Nacionalidad] [nvarchar](50) NULL,
	[Numero_Categorias] [int] NULL,
 CONSTRAINT [PK_Conductor] PRIMARY KEY CLUSTERED 
(
	[IdConductor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 18/11/2020 21:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[IdDepartamento] [int] NOT NULL,
	[Nombre_Departamento] [nvarchar](50) NULL,
	[Activo] [bit] NULL,
	[IdLocalidad] [int] NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[IdDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Detalle_Registro]    Script Date: 18/11/2020 21:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Registro](
	[IdDetatalleRegistros] [int] IDENTITY(1,1) NOT NULL,
	[IdRegistros] [int] NULL,
	[TipoPesada] [nvarchar](50) NULL,
	[Cantidad_Bultos] [numeric](18, 2) NULL,
	[PesoKg] [numeric](18, 2) NULL,
	[Tara] [numeric](18, 2) NULL,
	[Fecha_Pesada] [smalldatetime] NULL,
 CONSTRAINT [PK_Detalle_Registro] PRIMARY KEY CLUSTERED 
(
	[IdDetatalleRegistros] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmpresaTransporte]    Script Date: 18/11/2020 21:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpresaTransporte](
	[IdEmpresaTransporte] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Empresa] [nvarchar](50) NULL,
	[Direccion_Empresa] [nvarchar](250) NULL,
	[Telefono_Empresa] [nvarchar](50) NULL,
	[Numero_Permiso] [nvarchar](50) NULL,
 CONSTRAINT [PK_EmpresaTransporte] PRIMARY KEY CLUSTERED 
(
	[IdEmpresaTransporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Estado_Documento]    Script Date: 18/11/2020 21:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado_Documento](
	[IdEstadoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Estado_Documento] PRIMARY KEY CLUSTERED 
(
	[IdEstadoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 18/11/2020 21:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[IdLocalidad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Localidad] [nvarchar](50) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
(
	[IdLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 18/11/2020 21:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[IdMunicipio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Municipio] [nvarchar](50) NULL,
	[IdDepartamento] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Municipios] PRIMARY KEY CLUSTERED 
(
	[IdMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Puntos_Control]    Script Date: 18/11/2020 21:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puntos_Control](
	[IdPuntoControl] [int] IDENTITY(1,1) NOT NULL,
	[Ubicacion] [nvarchar](250) NULL,
	[Telefono] [nvarchar](50) NULL,
	[IdPersonalEncargado] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Puntos_Control] PRIMARY KEY CLUSTERED 
(
	[IdPuntoControl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registro_Pesadas]    Script Date: 18/11/2020 21:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro_Pesadas](
	[IdRegistro] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_Registro] [smalldatetime] NULL,
	[IdEmpresaTransporte] [int] NULL,
	[IdConductor] [int] NULL,
	[IdEstadoDocumento] [int] NULL,
	[TipoPesaje] [nvarchar](50) NULL,
	[Observaciones] [nvarchar](250) NULL,
 CONSTRAINT [PK_Registro_Pesadas] PRIMARY KEY CLUSTERED 
(
	[IdRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seguros]    Script Date: 18/11/2020 21:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seguros](
	[IdSeguros] [int] IDENTITY(1,1) NOT NULL,
	[Numero_Poliza] [nvarchar](50) NULL,
	[Fecha_Vence] [smalldatetime] NULL,
	[IdCompañiaSeguros] [int] NULL,
	[TipoSeguro] [nvarchar](50) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Seguros] PRIMARY KEY CLUSTERED 
(
	[IdSeguros] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vehiculos]    Script Date: 18/11/2020 21:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculos](
	[IdVehiculo] [int] NOT NULL,
	[Numero_Chasis] [nvarchar](50) NULL,
	[Numero_Motor] [nvarchar](50) NULL,
	[Numero_Placa] [nvarchar](50) NULL,
	[Numero_Circulacion] [nvarchar](50) NULL,
	[Color] [nvarchar](15) NULL,
	[Marca] [nvarchar](50) NULL,
	[Toneladas_Maximas] [numeric](18, 2) NULL,
	[Numero_Ejes] [numeric](18, 2) NULL,
 CONSTRAINT [PK_Vehiculos] PRIMARY KEY CLUSTERED 
(
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Departamentos] ADD  CONSTRAINT [DF_Departamentos_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Localidad] ADD  CONSTRAINT [DF_Localidad_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Municipios] ADD  CONSTRAINT [DF_Municipios_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Puntos_Control] ADD  CONSTRAINT [DF_Puntos_Control_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Seguros] ADD  CONSTRAINT [DF_Seguros_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Departamentos]  WITH CHECK ADD  CONSTRAINT [FK_Departamentos_Localidad] FOREIGN KEY([IdLocalidad])
REFERENCES [dbo].[Localidad] ([IdLocalidad])
GO
ALTER TABLE [dbo].[Departamentos] CHECK CONSTRAINT [FK_Departamentos_Localidad]
GO
ALTER TABLE [dbo].[Detalle_Registro]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Registro_Registro_Pesadas] FOREIGN KEY([IdRegistros])
REFERENCES [dbo].[Registro_Pesadas] ([IdRegistro])
GO
ALTER TABLE [dbo].[Detalle_Registro] CHECK CONSTRAINT [FK_Detalle_Registro_Registro_Pesadas]
GO
ALTER TABLE [dbo].[Municipios]  WITH CHECK ADD  CONSTRAINT [FK_Municipios_Departamentos] FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamentos] ([IdDepartamento])
GO
ALTER TABLE [dbo].[Municipios] CHECK CONSTRAINT [FK_Municipios_Departamentos]
GO
ALTER TABLE [dbo].[Registro_Pesadas]  WITH CHECK ADD  CONSTRAINT [FK_Registro_Pesadas_Conductor] FOREIGN KEY([IdConductor])
REFERENCES [dbo].[Conductor] ([IdConductor])
GO
ALTER TABLE [dbo].[Registro_Pesadas] CHECK CONSTRAINT [FK_Registro_Pesadas_Conductor]
GO
ALTER TABLE [dbo].[Registro_Pesadas]  WITH CHECK ADD  CONSTRAINT [FK_Registro_Pesadas_EmpresaTransporte] FOREIGN KEY([IdEmpresaTransporte])
REFERENCES [dbo].[EmpresaTransporte] ([IdEmpresaTransporte])
GO
ALTER TABLE [dbo].[Registro_Pesadas] CHECK CONSTRAINT [FK_Registro_Pesadas_EmpresaTransporte]
GO
ALTER TABLE [dbo].[Registro_Pesadas]  WITH CHECK ADD  CONSTRAINT [FK_Registro_Pesadas_Estado_Documento] FOREIGN KEY([IdEmpresaTransporte])
REFERENCES [dbo].[Estado_Documento] ([IdEstadoDocumento])
GO
ALTER TABLE [dbo].[Registro_Pesadas] CHECK CONSTRAINT [FK_Registro_Pesadas_Estado_Documento]
GO
USE [master]
GO
ALTER DATABASE [ControlBasculas] SET  READ_WRITE 
GO
