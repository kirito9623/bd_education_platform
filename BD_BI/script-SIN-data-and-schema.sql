USE [master]
GO
/****** Object:  Database [sin_learning_platform_datawarehouse]    Script Date: 29/08/2024 19:17:28 ******/
CREATE DATABASE [sin_learning_platform_datawarehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sin_learning_platform_datawarehouse', FILENAME = N'C:\SQLData\sin_learning_platform_datawarehouse.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sin_learning_platform_datawarehouse_log', FILENAME = N'C:\SQLData\sin_learning_platform_datawarehouse_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sin_learning_platform_datawarehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET  MULTI_USER 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET QUERY_STORE = ON
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [sin_learning_platform_datawarehouse]
GO
/****** Object:  Table [dbo].[Dimension_Actividad]    Script Date: 29/08/2024 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension_Actividad](
	[TipoActividad] [int] IDENTITY(1,1) NOT NULL,
	[NombreActividad] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TipoActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dimension_Curso]    Script Date: 29/08/2024 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension_Curso](
	[CursoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](255) NOT NULL,
	[Categoria] [nvarchar](255) NOT NULL,
	[Nivel] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CursoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dimension_Estudiante]    Script Date: 29/08/2024 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension_Estudiante](
	[EstudianteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](255) NOT NULL,
	[Direccion] [nvarchar](255) NOT NULL,
	[Segmento] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EstudianteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dimension_Tiempo]    Script Date: 29/08/2024 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension_Tiempo](
	[FechaID] [int] IDENTITY(1,1) NOT NULL,
	[Día] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[Trimestre] [int] NOT NULL,
	[Año] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FechaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tabla_de_Hechos_de_Actividad]    Script Date: 29/08/2024 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tabla_de_Hechos_de_Actividad](
	[ActividadID] [int] IDENTITY(1,1) NOT NULL,
	[FechaID] [int] NOT NULL,
	[EstudianteID] [int] NOT NULL,
	[CursoID] [int] NOT NULL,
	[TipoActividad] [int] NOT NULL,
	[Duración] [int] NOT NULL,
	[NumeroActividades] [int] NOT NULL,
	[Puntuación] [decimal](18, 2) NOT NULL,
	[Progresoantes] [decimal](18, 2) NOT NULL,
	[Progresodespues] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActividadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tabla_de_Hechos_de_Actividad]  WITH CHECK ADD  CONSTRAINT [FK_Hechos_Actividad] FOREIGN KEY([TipoActividad])
REFERENCES [dbo].[Dimension_Actividad] ([TipoActividad])
GO
ALTER TABLE [dbo].[Tabla_de_Hechos_de_Actividad] CHECK CONSTRAINT [FK_Hechos_Actividad]
GO
ALTER TABLE [dbo].[Tabla_de_Hechos_de_Actividad]  WITH CHECK ADD  CONSTRAINT [FK_Hechos_Curso] FOREIGN KEY([CursoID])
REFERENCES [dbo].[Dimension_Curso] ([CursoID])
GO
ALTER TABLE [dbo].[Tabla_de_Hechos_de_Actividad] CHECK CONSTRAINT [FK_Hechos_Curso]
GO
ALTER TABLE [dbo].[Tabla_de_Hechos_de_Actividad]  WITH CHECK ADD  CONSTRAINT [FK_Hechos_Estudiante] FOREIGN KEY([EstudianteID])
REFERENCES [dbo].[Dimension_Estudiante] ([EstudianteID])
GO
ALTER TABLE [dbo].[Tabla_de_Hechos_de_Actividad] CHECK CONSTRAINT [FK_Hechos_Estudiante]
GO
ALTER TABLE [dbo].[Tabla_de_Hechos_de_Actividad]  WITH CHECK ADD  CONSTRAINT [FK_Hechos_Tiempo] FOREIGN KEY([FechaID])
REFERENCES [dbo].[Dimension_Tiempo] ([FechaID])
GO
ALTER TABLE [dbo].[Tabla_de_Hechos_de_Actividad] CHECK CONSTRAINT [FK_Hechos_Tiempo]
GO
USE [master]
GO
ALTER DATABASE [sin_learning_platform_datawarehouse] SET  READ_WRITE 
GO
