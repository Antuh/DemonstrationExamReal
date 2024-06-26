USE [master]
GO
/****** Object:  Database [RussianCosmetics]    Script Date: 20.02.2024 0:16:41 ******/
CREATE DATABASE [RussianCosmetics]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RussianCosmetics', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\RussianCosmetics.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RussianCosmetics_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\RussianCosmetics_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RussianCosmetics] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RussianCosmetics].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RussianCosmetics] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RussianCosmetics] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RussianCosmetics] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RussianCosmetics] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RussianCosmetics] SET ARITHABORT OFF 
GO
ALTER DATABASE [RussianCosmetics] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RussianCosmetics] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RussianCosmetics] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RussianCosmetics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RussianCosmetics] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RussianCosmetics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RussianCosmetics] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RussianCosmetics] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RussianCosmetics] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RussianCosmetics] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RussianCosmetics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RussianCosmetics] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RussianCosmetics] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RussianCosmetics] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RussianCosmetics] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RussianCosmetics] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RussianCosmetics] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RussianCosmetics] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RussianCosmetics] SET  MULTI_USER 
GO
ALTER DATABASE [RussianCosmetics] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RussianCosmetics] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RussianCosmetics] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RussianCosmetics] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RussianCosmetics] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RussianCosmetics] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RussianCosmetics] SET QUERY_STORE = OFF
GO
USE [RussianCosmetics]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 20.02.2024 0:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ID_Clients] [int] IDENTITY(1,1) NOT NULL,
	[NameCompany] [varchar](50) NULL,
	[Addres] [varchar](50) NULL,
	[INN] [varchar](50) NULL,
	[Payment] [varchar](50) NULL,
	[BIK] [varchar](50) NULL,
	[FIO_Head] [varchar](50) NULL,
	[FIO_Contact] [varchar](50) NULL,
	[PhoneContact] [varchar](50) NULL,
	[EmailPhysical] [varchar](50) NULL,
	[PasswordPhysical] [varchar](50) NULL,
	[FIOPhysical] [varchar](50) NULL,
	[DateBirthPhysical] [date] NULL,
	[SeriaPassportPhysical] [varchar](50) NULL,
	[NumberPassportPhysical] [varchar](50) NULL,
	[PhonePhysicale] [varchar](50) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ID_Clients] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompleteService]    Script Date: 20.02.2024 0:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompleteService](
	[ID_CompleteService] [int] IDENTITY(1,1) NOT NULL,
	[ID_Service] [int] NULL,
	[ID_Personal] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_CompleteService] PRIMARY KEY CLUSTERED 
(
	[ID_CompleteService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 20.02.2024 0:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID_Order] [int] IDENTITY(1,1) NOT NULL,
	[DateCreate] [date] NULL,
	[ID_Service] [int] NULL,
	[StatusOrder] [varchar](50) NULL,
	[StatusService] [varchar](50) NULL,
	[TimeComplete] [varchar](50) NULL,
	[CostOrder] [varchar](50) NULL,
	[ID_Client] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID_Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtherPersonal]    Script Date: 20.02.2024 0:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtherPersonal](
	[ID_OtherPersonal] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[FIO] [varchar](50) NULL,
	[DateTimeEntrance] [datetime] NULL,
 CONSTRAINT [PK_OtherPersonal] PRIMARY KEY CLUSTERED 
(
	[ID_OtherPersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 20.02.2024 0:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[ID_Personal] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[FIO] [varchar](50) NULL,
	[DateTimeEntrance] [datetime] NULL,
	[ID_Service] [int] NULL,
	[ID_CompleteService] [int] NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[ID_Personal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 20.02.2024 0:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID_Service] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Cost] [money] NULL,
	[CodeService] [varchar](50) NULL,
	[Period] [varchar](50) NULL,
	[Deviation] [varchar](50) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID_Service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ID_Clients], [NameCompany], [Addres], [INN], [Payment], [BIK], [FIO_Head], [FIO_Contact], [PhoneContact], [EmailPhysical], [PasswordPhysical], [FIOPhysical], [DateBirthPhysical], [SeriaPassportPhysical], [NumberPassportPhysical], [PhonePhysicale]) VALUES (1, N'Спортик', N'п.Тулинский', N'3242342', N'312312', N'213123', N'Петров Дмитрий Алексеевич', N'Кузьменко Мария Алексеевна', N'8913465789245', N'fdgdfg@mail.ru', N'asdasdas', N'Иванов Иван Иванович', CAST(N'2000-12-01' AS Date), N'5044', N'334563', N'891365739853')
INSERT [dbo].[Clients] ([ID_Clients], [NameCompany], [Addres], [INN], [Payment], [BIK], [FIO_Head], [FIO_Contact], [PhoneContact], [EmailPhysical], [PasswordPhysical], [FIOPhysical], [DateBirthPhysical], [SeriaPassportPhysical], [NumberPassportPhysical], [PhonePhysicale]) VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[CompleteService] ON 

INSERT [dbo].[CompleteService] ([ID_CompleteService], [ID_Service], [ID_Personal], [Date]) VALUES (1, 1, 1, CAST(N'2024-11-19' AS Date))
SET IDENTITY_INSERT [dbo].[CompleteService] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID_Order], [DateCreate], [ID_Service], [StatusOrder], [StatusService], [TimeComplete], [CostOrder], [ID_Client]) VALUES (1, CAST(N'2023-09-13' AS Date), 1, N'Выполнено', N'Выполнено', N'3', N'2500', NULL)
INSERT [dbo].[Order] ([ID_Order], [DateCreate], [ID_Service], [StatusOrder], [StatusService], [TimeComplete], [CostOrder], [ID_Client]) VALUES (2, CAST(N'2024-02-08' AS Date), 1, N'Не выполнен', N'В процессе', N'424', N'2424', NULL)
INSERT [dbo].[Order] ([ID_Order], [DateCreate], [ID_Service], [StatusOrder], [StatusService], [TimeComplete], [CostOrder], [ID_Client]) VALUES (3, CAST(N'2024-02-24' AS Date), 1, N'Отказано', N'Не принят', N'234', N'345', NULL)
INSERT [dbo].[Order] ([ID_Order], [DateCreate], [ID_Service], [StatusOrder], [StatusService], [TimeComplete], [CostOrder], [ID_Client]) VALUES (4, CAST(N'2024-01-31' AS Date), 2, N'Не выполнено', N'Выполнено', N'3232', N'3223', NULL)
INSERT [dbo].[Order] ([ID_Order], [DateCreate], [ID_Service], [StatusOrder], [StatusService], [TimeComplete], [CostOrder], [ID_Client]) VALUES (5, CAST(N'2024-02-08' AS Date), 1, N'34а43', N'а43', N'3434', N'34535', NULL)
INSERT [dbo].[Order] ([ID_Order], [DateCreate], [ID_Service], [StatusOrder], [StatusService], [TimeComplete], [CostOrder], [ID_Client]) VALUES (6, CAST(N'2024-02-10' AS Date), 2, N'каац', N'ацац', N'3255', N'5235', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OtherPersonal] ON 

INSERT [dbo].[OtherPersonal] ([ID_OtherPersonal], [Login], [Password], [FIO], [DateTimeEntrance]) VALUES (1, N'admin', N'admin', N'Петров Даниил Михайлович', CAST(N'2023-02-19T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[OtherPersonal] OFF
GO
SET IDENTITY_INSERT [dbo].[Personal] ON 

INSERT [dbo].[Personal] ([ID_Personal], [Login], [Password], [FIO], [DateTimeEntrance], [ID_Service], [ID_CompleteService]) VALUES (1, N'admin', N'admin', N'Петров Михаил Иванович', CAST(N'2023-02-19T00:00:00.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Personal] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID_Service], [Name], [Cost], [CodeService], [Period], [Deviation]) VALUES (1, N'Наращивание ресниц', 1500.0000, N'SDFSDF', N'1', N'1')
INSERT [dbo].[Service] ([ID_Service], [Name], [Cost], [CodeService], [Period], [Deviation]) VALUES (2, N'Маникюр', 1800.0000, N'GDKJIT', N'1', N'1')
INSERT [dbo].[Service] ([ID_Service], [Name], [Cost], [CodeService], [Period], [Deviation]) VALUES (3, N'Депиляция', 2900.0000, N'JDGEVO', N'1', N'1')
INSERT [dbo].[Service] ([ID_Service], [Name], [Cost], [CodeService], [Period], [Deviation]) VALUES (4, N'Педикюр', 2100.0000, N'KUQYE', N'1', N'1')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
ALTER TABLE [dbo].[CompleteService]  WITH CHECK ADD  CONSTRAINT [FK_CompleteService_Personal] FOREIGN KEY([ID_Personal])
REFERENCES [dbo].[Personal] ([ID_Personal])
GO
ALTER TABLE [dbo].[CompleteService] CHECK CONSTRAINT [FK_CompleteService_Personal]
GO
ALTER TABLE [dbo].[CompleteService]  WITH CHECK ADD  CONSTRAINT [FK_CompleteService_Service] FOREIGN KEY([ID_Service])
REFERENCES [dbo].[Service] ([ID_Service])
GO
ALTER TABLE [dbo].[CompleteService] CHECK CONSTRAINT [FK_CompleteService_Service]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Service] FOREIGN KEY([ID_Service])
REFERENCES [dbo].[Service] ([ID_Service])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Service]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_CompleteService] FOREIGN KEY([ID_CompleteService])
REFERENCES [dbo].[CompleteService] ([ID_CompleteService])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_CompleteService]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Service] FOREIGN KEY([ID_Service])
REFERENCES [dbo].[Service] ([ID_Service])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Service]
GO
USE [master]
GO
ALTER DATABASE [RussianCosmetics] SET  READ_WRITE 
GO
