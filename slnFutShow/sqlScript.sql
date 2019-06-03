USE [master]
GO
/****** Object:  Database [dbFutshow]    Script Date: 02/06/2019 1:57:47 ******/
CREATE DATABASE [dbFutshow]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbFutshow', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbFutshow.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbFutshow_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbFutshow_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbFutshow] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbFutshow].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbFutshow] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbFutshow] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbFutshow] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbFutshow] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbFutshow] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbFutshow] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbFutshow] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbFutshow] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbFutshow] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbFutshow] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbFutshow] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbFutshow] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbFutshow] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbFutshow] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbFutshow] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbFutshow] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbFutshow] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbFutshow] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbFutshow] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbFutshow] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbFutshow] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbFutshow] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbFutshow] SET RECOVERY FULL 
GO
ALTER DATABASE [dbFutshow] SET  MULTI_USER 
GO
ALTER DATABASE [dbFutshow] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbFutshow] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbFutshow] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbFutshow] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbFutshow] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbFutshow', N'ON'
GO
ALTER DATABASE [dbFutshow] SET QUERY_STORE = OFF
GO
USE [dbFutshow]
GO
/****** Object:  Table [dbo].[tbladmin_cancha]    Script Date: 02/06/2019 1:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbladmin_cancha](
	[Idadmin] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[telefonoCancha] [varchar](30) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[descripcion] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Idadmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblamigo]    Script Date: 02/06/2019 1:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblamigo](
	[Idamigo] [int] NOT NULL,
	[Idjugador] [int] NOT NULL,
	[estado] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Idamigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblcanchas]    Script Date: 02/06/2019 1:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcanchas](
	[Idcanchas] [int] IDENTITY(1,1) NOT NULL,
	[contecho] [bit] NOT NULL,
	[marcador] [bit] NOT NULL,
	[iluminacion] [bit] NOT NULL,
	[Idadmin] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Idcanchas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblequipo]    Script Date: 02/06/2019 1:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblequipo](
	[Idequipo] [int] IDENTITY(1,1) NOT NULL,
	[equipo_completo] [bit] NOT NULL,
	[tipo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Idequipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblequipoxpartido]    Script Date: 02/06/2019 1:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblequipoxpartido](
	[Idequipo] [int] NOT NULL,
	[Idpartido] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblhorario]    Script Date: 02/06/2019 1:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblhorario](
	[Idadmin] [int] NOT NULL,
	[Idhorario] [int] IDENTITY(1,1) NOT NULL,
	[dia] [varchar](30) NOT NULL,
	[horainicio] [time](7) NOT NULL,
	[horacierre] [time](7) NOT NULL,
	[precio] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Idhorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblinvitaciones]    Script Date: 02/06/2019 1:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblinvitaciones](
	[Idamigo] [int] NOT NULL,
	[Idjugador] [int] NOT NULL,
	[Idpartido] [int] NOT NULL,
	[estado] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbljugador]    Script Date: 02/06/2019 1:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbljugador](
	[Idjugador] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Telefono] [varchar](30) NOT NULL,
	[fecha_nac] [date] NOT NULL,
	[Cedula] [varchar](50) NOT NULL,
	[Contraseña] [varchar](30) NOT NULL,
	[Usuario] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Idjugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbljugadorxequipo]    Script Date: 02/06/2019 1:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbljugadorxequipo](
	[Idjugador] [int] NOT NULL,
	[Idequipo] [int] NOT NULL,
	[Confirmado] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblmensajes]    Script Date: 02/06/2019 1:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblmensajes](
	[Idjugador] [int] NOT NULL,
	[Idamigo] [int] NOT NULL,
	[horadiaenvio] [datetime] NOT NULL,
	[mensaje] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblpartido]    Script Date: 02/06/2019 1:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblpartido](
	[Idpartido] [int] IDENTITY(1,1) NOT NULL,
	[completo] [bit] NOT NULL,
	[fecha_hora] [datetime] NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[dia] [varchar](30) NOT NULL,
	[Idcancha] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Idpartido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblperfil]    Script Date: 02/06/2019 1:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblperfil](
	[Idjugador] [int] NOT NULL,
	[PieDominante] [varchar](50) NOT NULL,
	[Posicion] [varchar](50) NOT NULL,
	[Sexo] [varchar](30) NOT NULL,
	[Fecha_regis] [date] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblamigo]  WITH CHECK ADD FOREIGN KEY([Idjugador])
REFERENCES [dbo].[tbljugador] ([Idjugador])
GO
ALTER TABLE [dbo].[tblcanchas]  WITH CHECK ADD FOREIGN KEY([Idadmin])
REFERENCES [dbo].[tbladmin_cancha] ([Idadmin])
GO
ALTER TABLE [dbo].[tblequipoxpartido]  WITH CHECK ADD FOREIGN KEY([Idequipo])
REFERENCES [dbo].[tblequipo] ([Idequipo])
GO
ALTER TABLE [dbo].[tblequipoxpartido]  WITH CHECK ADD FOREIGN KEY([Idpartido])
REFERENCES [dbo].[tblpartido] ([Idpartido])
GO
ALTER TABLE [dbo].[tblhorario]  WITH CHECK ADD FOREIGN KEY([Idadmin])
REFERENCES [dbo].[tbladmin_cancha] ([Idadmin])
GO
ALTER TABLE [dbo].[tblinvitaciones]  WITH CHECK ADD FOREIGN KEY([Idamigo])
REFERENCES [dbo].[tblamigo] ([Idamigo])
GO
ALTER TABLE [dbo].[tblinvitaciones]  WITH CHECK ADD FOREIGN KEY([Idjugador])
REFERENCES [dbo].[tbljugador] ([Idjugador])
GO
ALTER TABLE [dbo].[tblinvitaciones]  WITH CHECK ADD FOREIGN KEY([Idpartido])
REFERENCES [dbo].[tblpartido] ([Idpartido])
GO
ALTER TABLE [dbo].[tbljugadorxequipo]  WITH CHECK ADD FOREIGN KEY([Idequipo])
REFERENCES [dbo].[tblequipo] ([Idequipo])
GO
ALTER TABLE [dbo].[tbljugadorxequipo]  WITH CHECK ADD FOREIGN KEY([Idjugador])
REFERENCES [dbo].[tbljugador] ([Idjugador])
GO
ALTER TABLE [dbo].[tblmensajes]  WITH CHECK ADD FOREIGN KEY([Idamigo])
REFERENCES [dbo].[tblamigo] ([Idamigo])
GO
ALTER TABLE [dbo].[tblmensajes]  WITH CHECK ADD FOREIGN KEY([Idjugador])
REFERENCES [dbo].[tbljugador] ([Idjugador])
GO
ALTER TABLE [dbo].[tblpartido]  WITH CHECK ADD FOREIGN KEY([Idcancha])
REFERENCES [dbo].[tblcanchas] ([Idcanchas])
GO
ALTER TABLE [dbo].[tblperfil]  WITH CHECK ADD FOREIGN KEY([Idjugador])
REFERENCES [dbo].[tbljugador] ([Idjugador])
GO
USE [master]
GO
ALTER DATABASE [dbFutshow] SET  READ_WRITE 
GO
