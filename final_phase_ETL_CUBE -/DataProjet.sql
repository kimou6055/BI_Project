USE [master]
GO
/****** Object:  Database [DataProjet]    Script Date: 22/10/2022 00:26:58 ******/
CREATE DATABASE [DataProjet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataProjet', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DataProjet.mdf' , SIZE = 48128KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DataProjet_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DataProjet_log.ldf' , SIZE = 164672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DataProjet] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataProjet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DataProjet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DataProjet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DataProjet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DataProjet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DataProjet] SET ARITHABORT OFF 
GO
ALTER DATABASE [DataProjet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DataProjet] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DataProjet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DataProjet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DataProjet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DataProjet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DataProjet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DataProjet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DataProjet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DataProjet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DataProjet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DataProjet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DataProjet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DataProjet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DataProjet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DataProjet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DataProjet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DataProjet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DataProjet] SET RECOVERY FULL 
GO
ALTER DATABASE [DataProjet] SET  MULTI_USER 
GO
ALTER DATABASE [DataProjet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DataProjet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DataProjet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DataProjet] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DataProjet]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22/10/2022 00:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[Row ID] [float] NULL,
	[Order ID] [varchar](255) NULL,
	[Order Date] [date] NULL,
	[Ship Date] [date] NULL,
	[Ship Mode] [varchar](255) NULL,
	[Customer ID] [varchar](255) NULL,
	[Segment] [varchar](255) NULL,
	[Postal Code] [int] NULL,
	[City] [varchar](255) NULL,
	[Country] [varchar](255) NULL,
	[Region] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Market] [varchar](255) NULL,
	[Product ID] [varchar](255) NULL,
	[Category] [varchar](255) NULL,
	[Sub-Category] [varchar](255) NULL,
	[Product Name] [varchar](255) NULL,
	[Sales] [float] NULL,
	[Quantity] [float] NULL,
	[Discount] [float] NULL,
	[Profit] [float] NULL,
	[Shipping Cost] [float] NULL,
	[Order Priority] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PC]    Script Date: 22/10/2022 00:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PC](
	[City] [varchar](255) NULL,
	[ State] [varchar](255) NULL,
	[Country] [varchar](255) NULL,
	[PC] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[People]    Script Date: 22/10/2022 00:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Person] [nvarchar](255) NULL,
	[Region] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Returns]    Script Date: 22/10/2022 00:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Returns](
	[Region] [nvarchar](255) NULL,
	[Returned] [nvarchar](255) NULL,
	[Order ID] [nvarchar](255) NULL
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [DataProjet] SET  READ_WRITE 
GO
