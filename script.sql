USE [master]
GO
/****** Object:  Database [TenderDB]    Script Date: 2018/4/12 18:13:25 ******/
CREATE DATABASE [TenderDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TenderDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TenderDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TenderDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TenderDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TenderDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TenderDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TenderDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TenderDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TenderDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TenderDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TenderDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TenderDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TenderDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TenderDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TenderDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TenderDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TenderDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TenderDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TenderDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TenderDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TenderDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TenderDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TenderDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TenderDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TenderDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TenderDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TenderDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TenderDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TenderDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TenderDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TenderDB] SET  MULTI_USER 
GO
ALTER DATABASE [TenderDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TenderDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TenderDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TenderDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TenderDB', N'ON'
GO
USE [TenderDB]
GO
/****** Object:  Table [dbo].[BidInfo]    Script Date: 2018/4/12 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[TenderId] [uniqueidentifier] NOT NULL,
	[TenderTitle] [nvarchar](500) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[TenderPrice] [decimal](18, 2) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[State] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 2018/4/12 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [uniqueidentifier] NOT NULL,
	[CascadeId] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[SortNo] [int] NOT NULL,
	[RootKey] [varchar](100) NOT NULL,
	[RootName] [varchar](200) NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DicDetail]    Script Date: 2018/4/12 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DicDetail](
	[Id] [uniqueidentifier] NOT NULL,
	[Value] [varchar](100) NOT NULL,
	[Text] [nvarchar](100) NOT NULL,
	[SortNo] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[DicId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DicDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DicIndex]    Script Date: 2018/4/12 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DicIndex](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Key] [varchar](100) NOT NULL,
	[SortNo] [int] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[CategoryId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_DicIndex] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Enclosure]    Script Date: 2018/4/12 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enclosure](
	[Id] [uniqueidentifier] NOT NULL,
	[RelationId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](500) NOT NULL,
	[type] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogDetails]    Script Date: 2018/4/12 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogDetails](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[LogDate] [datetime] NOT NULL,
	[LogThread] [nvarchar](100) NOT NULL,
	[LogLevel] [nvarchar](200) NOT NULL,
	[LogLogger] [nvarchar](500) NOT NULL,
	[LogMessage] [nvarchar](3000) NOT NULL,
	[LogActionClick] [nvarchar](4000) NULL,
	[UserName] [nvarchar](30) NULL,
	[UserIP] [varchar](20) NULL,
 CONSTRAINT [PK_LogDetails] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Module]    Script Date: 2018/4/12 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Module](
	[Id] [uniqueidentifier] NOT NULL,
	[CascadeId] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Url] [varchar](255) NOT NULL,
	[HotKey] [varchar](255) NOT NULL,
	[IsLeaf] [bit] NOT NULL,
	[IsAutoExpand] [bit] NOT NULL,
	[IconName] [varchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[ParentName] [varchar](255) NOT NULL,
	[Vector] [varchar](255) NOT NULL,
	[SortNo] [int] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ModuleElement]    Script Date: 2018/4/12 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ModuleElement](
	[Id] [uniqueidentifier] NOT NULL,
	[DomId] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Attr] [varchar](500) NOT NULL,
	[Script] [varchar](500) NOT NULL,
	[Icon] [varchar](255) NOT NULL,
	[Class] [varchar](255) NOT NULL,
	[Remark] [varchar](200) NOT NULL,
	[Sort] [int] NOT NULL,
	[ModuleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ModuleElement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Org]    Script Date: 2018/4/12 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Org](
	[Id] [uniqueidentifier] NOT NULL,
	[CascadeId] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[HotKey] [varchar](255) NOT NULL,
	[ParentName] [varchar](255) NOT NULL,
	[IsLeaf] [bit] NOT NULL,
	[IsAutoExpand] [bit] NOT NULL,
	[IconName] [varchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[BizCode] [varchar](255) NOT NULL,
	[CustomCode] [varchar](4000) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateId] [int] NOT NULL,
	[SortNo] [int] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Org] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Relevance]    Script Date: 2018/4/12 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Relevance](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Key] [varchar](100) NOT NULL,
	[Status] [int] NOT NULL,
	[OperateTime] [datetime] NOT NULL,
	[OperatorId] [int] NOT NULL,
	[FirstId] [uniqueidentifier] NOT NULL,
	[SecondId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Relevance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 2018/4/12 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resource](
	[Id] [uniqueidentifier] NOT NULL,
	[CascadeId] [varchar](255) NOT NULL,
	[Key] [varchar](200) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[SortNo] [int] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[CategoryId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2018/4/12 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateId] [varchar](64) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TenderInfo]    Script Date: 2018/4/12 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TenderInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [text] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Cycle] [nvarchar](50) NOT NULL,
	[State] [int] NOT NULL,
	[FirstUser] [nvarchar](100) NOT NULL,
	[SecondUser] [nvarchar](100) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](100) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TenderUser]    Script Date: 2018/4/12 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TenderUser](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Company] [nvarchar](255) NOT NULL,
	[ContactPerson] [nvarchar](100) NOT NULL,
	[ContactNum] [nvarchar](100) NOT NULL,
	[BusinessLicense] [nvarchar](500) NOT NULL,
	[CashDeposit] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TanderUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2018/4/12 18:13:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Account] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Sex] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[BizCode] [varchar](255) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CrateId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[BidInfo] ([Id], [TenderId], [TenderTitle], [UserId], [UserName], [TenderPrice], [CreateDate], [EndTime], [State]) VALUES (N'4bed6fc4-d5da-4973-b3ec-26e7f75e2f69', N'e4582a9e-80ee-4b07-b06e-6217c0ed2c9c', N'第一条标书', N'72eeb055-2501-4f22-b858-3912c91c90d9', N'22', CAST(10000.00 AS Decimal(18, 2)), CAST(0x0000A8BD0109A873 AS DateTime), CAST(0x0000A8BD0134D084 AS DateTime), 2)
INSERT [dbo].[BidInfo] ([Id], [TenderId], [TenderTitle], [UserId], [UserName], [TenderPrice], [CreateDate], [EndTime], [State]) VALUES (N'08daf86e-1902-4ed1-a801-79adfbd9df79', N'86ab981c-bb6c-47f5-ac09-e0e21de2fabd', N'第二条', N'a3a0b75b-c154-49cd-bb37-e9328e5f015c', N'客户', CAST(10000.00 AS Decimal(18, 2)), CAST(0x0000A8BD012A2B8E AS DateTime), CAST(0x0000A8BE0134D084 AS DateTime), 0)
INSERT [dbo].[BidInfo] ([Id], [TenderId], [TenderTitle], [UserId], [UserName], [TenderPrice], [CreateDate], [EndTime], [State]) VALUES (N'e8d2c9c0-91cf-4da3-b8b1-69e114e79ef7', N'e4582a9e-80ee-4b07-b06e-6217c0ed2c9c', N'第一条标书', N'a3a0b75b-c154-49cd-bb37-e9328e5f015c', N'客户', CAST(20000.00 AS Decimal(18, 2)), CAST(0x0000A8BE00BB6883 AS DateTime), CAST(0x0000A8BD0134D084 AS DateTime), 1)
INSERT [dbo].[Category] ([Id], [CascadeId], [Name], [Status], [SortNo], [RootKey], [RootName], [ParentId]) VALUES (N'fa37b322-508b-47ce-b29f-b1dacb82637a', N'0.3.', N'机密资源', 0, 0, N'STOCK', N'进出库管理', NULL)
INSERT [dbo].[Category] ([Id], [CascadeId], [Name], [Status], [SortNo], [RootKey], [RootName], [ParentId]) VALUES (N'8fe31cfe-b117-4875-a29a-cc16f33ae11d', N'0.4.', N'角色类型', 0, 0, N'', N'', NULL)
INSERT [dbo].[Enclosure] ([Id], [RelationId], [Path], [type]) VALUES (N'6cfba237-5fb6-44b7-bcda-1e38b0a30802', N'e4582a9e-80ee-4b07-b06e-6217c0ed2c9c', N'/uploadfile/20180407/b6e0233196cd42ba9e66b2e94ea7a1c5.jpg', 0)
INSERT [dbo].[Enclosure] ([Id], [RelationId], [Path], [type]) VALUES (N'0f5d8fce-7572-4929-8b6e-5fb9ce90d355', N'86ab981c-bb6c-47f5-ac09-e0e21de2fabd', N'/uploadfile/20180409/2f67b2597b5e4d369dcd50402eb6d125.jpg', 0)
INSERT [dbo].[Enclosure] ([Id], [RelationId], [Path], [type]) VALUES (N'4e4fc821-54de-4509-b680-51c2a3770f3b', N'86ab981c-bb6c-47f5-ac09-e0e21de2fabd', N'/uploadfile/20180409/800b46e9637c40a080235ed73ac5937b.png', 0)
SET IDENTITY_INSERT [dbo].[LogDetails] ON 

INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (1, CAST(0x0000A8BF00E633A5 AS DateTime), N'16', N'INFO', N'log4net', N'', N'', N'', N'')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (2, CAST(0x0000A8BF00E63927 AS DateTime), N'18', N'INFO', N'log4net', N'登陆成功', N'登陆系统', N'111111', N'127.0.0.1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (3, CAST(0x0000A8BF00ECA01C AS DateTime), N'1', N'INFO', N'log4net', N'', N'', N'', N'')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (4, CAST(0x0000A8BF00EE47E5 AS DateTime), N'24', N'INFO', N'log4net', N'', N'', N'', N'')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (5, CAST(0x0000A8BF00EE4F28 AS DateTime), N'16', N'INFO', N'log4net', N'homeindex', N'homeindex', N'', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (6, CAST(0x0000A8BF00EE50ED AS DateTime), N'16', N'INFO', N'log4net', N'homenavbar', N'homenavbar', N'', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (7, CAST(0x0000A8BF00EE5130 AS DateTime), N'7', N'INFO', N'log4net', N'homegit', N'homegit', N'', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (8, CAST(0x0000A8BF00EEA214 AS DateTime), N'24', N'INFO', N'log4net', N'', N'', N'', N'')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (9, CAST(0x0000A8BF00EEA871 AS DateTime), N'7', N'INFO', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (10, CAST(0x0000A8BF00EEAA16 AS DateTime), N'7', N'INFO', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (11, CAST(0x0000A8BF00EEAA66 AS DateTime), N'13', N'INFO', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (12, CAST(0x0000A8BF00EEAD61 AS DateTime), N'7', N'INFO', N'log4net', N'/RoleManager/Index', N'角色管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (13, CAST(0x0000A8BF00EEAE0F AS DateTime), N'7', N'INFO', N'log4net', N'/RoleManager/Index', N'角色管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (14, CAST(0x0000A8BF00EEAE18 AS DateTime), N'7', N'INFO', N'log4net', N'/RoleManager/Index', N'角色管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (15, CAST(0x0000A8BF00EEAE4F AS DateTime), N'18', N'INFO', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (16, CAST(0x0000A8BF00EEAE68 AS DateTime), N'12', N'INFO', N'log4net', N'/RoleManager/Index', N'角色管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (17, CAST(0x0000A8BF00EEB136 AS DateTime), N'13', N'INFO', N'log4net', N'/RoleManager/Index', N'角色管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (18, CAST(0x0000A8BF00F06D59 AS DateTime), N'32', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (19, CAST(0x0000A8BF00F06ED9 AS DateTime), N'33', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (20, CAST(0x0000A8BF00F06F0F AS DateTime), N'33', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (21, CAST(0x0000A8BF00F0786E AS DateTime), N'31', N'DEBUG', N'log4net', N'/Statistics/Index', N'数据统计', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (22, CAST(0x0000A8BF00F0793C AS DateTime), N'33', N'DEBUG', N'log4net', N'/Statistics/Index', N'数据统计', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (23, CAST(0x0000A8BF00F07942 AS DateTime), N'7', N'DEBUG', N'log4net', N'/Statistics/Index', N'数据统计', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (24, CAST(0x0000A8BF00F07983 AS DateTime), N'32', N'DEBUG', N'log4net', N'/Statistics/Index', N'数据统计', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (25, CAST(0x0000A8BF00F13B73 AS DateTime), N'38', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (26, CAST(0x0000A8BF00F13B8A AS DateTime), N'41', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (27, CAST(0x0000A8BF00F13C03 AS DateTime), N'43', N'DEBUG', N'log4net', N'homegit', N'homegit', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (28, CAST(0x0000A8BF00F140A7 AS DateTime), N'44', N'DEBUG', N'log4net', N'statisticsindex', N'statisticsindex', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (29, CAST(0x0000A8BF00F140B7 AS DateTime), N'41', N'DEBUG', N'log4net', N'statisticsmenuheader', N'statisticsmenuheader', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (30, CAST(0x0000A8BF00F1C37E AS DateTime), N'43', N'DEBUG', N'log4net', N'statisticsindex', N'statisticsindex', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (31, CAST(0x0000A8BF00F1C3A3 AS DateTime), N'41', N'DEBUG', N'log4net', N'statisticsmenuheader', N'statisticsmenuheader', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (32, CAST(0x0000A8BF00F2C5FD AS DateTime), N'46', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (33, CAST(0x0000A8BF00F2C68F AS DateTime), N'54', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (34, CAST(0x0000A8BF00F2C80C AS DateTime), N'50', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (35, CAST(0x0000A8BF00F2C80C AS DateTime), N'52', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (36, CAST(0x0000A8BF00F2C88E AS DateTime), N'56', N'DEBUG', N'log4net', N'homegit', N'homegit', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (37, CAST(0x0000A8BF00F2E00C AS DateTime), N'40', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (38, CAST(0x0000A8BF00F2E020 AS DateTime), N'54', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (39, CAST(0x0000A8BF00F2E074 AS DateTime), N'54', N'DEBUG', N'log4net', N'homegit', N'homegit', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (40, CAST(0x0000A8BF00F2E48E AS DateTime), N'40', N'DEBUG', N'log4net', N'/TenderInfoManager/index', N'投标单管理', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (41, CAST(0x0000A8BF00F2E586 AS DateTime), N'54', N'DEBUG', N'log4net', N'/TenderInfoManager/index', N'投标单管理', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (42, CAST(0x0000A8BF00F2E5A1 AS DateTime), N'40', N'DEBUG', N'log4net', N'/TenderInfoManager/index', N'投标单管理', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (43, CAST(0x0000A8BF00F2E60E AS DateTime), N'40', N'DEBUG', N'log4net', N'/TenderInfoManager/index', N'投标单管理', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (44, CAST(0x0000A8BF00F2E79A AS DateTime), N'40', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (45, CAST(0x0000A8BF00F2E850 AS DateTime), N'57', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (46, CAST(0x0000A8BF00F2E85D AS DateTime), N'54', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (47, CAST(0x0000A8BF00F2E8C4 AS DateTime), N'54', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (48, CAST(0x0000A8BF00F2E8D0 AS DateTime), N'40', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (49, CAST(0x0000A8BF00F2E8F6 AS DateTime), N'40', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (50, CAST(0x0000A8BF00F2E942 AS DateTime), N'57', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'测试2', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (51, CAST(0x0000A8BF00F5D853 AS DateTime), N'13', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (52, CAST(0x0000A8BF00F5D85A AS DateTime), N'18', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (53, CAST(0x0000A8BF00F5D893 AS DateTime), N'13', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (54, CAST(0x0000A8BF00F5DAE8 AS DateTime), N'7', N'DEBUG', N'log4net', N'/RoleManager/Index', N'角色管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (55, CAST(0x0000A8BF00F5DBC2 AS DateTime), N'13', N'DEBUG', N'log4net', N'/RoleManager/Index', N'角色管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (56, CAST(0x0000A8BF00F5DBC6 AS DateTime), N'30', N'DEBUG', N'log4net', N'/RoleManager/Index', N'角色管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (57, CAST(0x0000A8BF00F5DBF8 AS DateTime), N'13', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (58, CAST(0x0000A8BF00F5DC07 AS DateTime), N'7', N'DEBUG', N'log4net', N'/RoleManager/Index', N'角色管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (59, CAST(0x0000A8BF00F6390C AS DateTime), N'16', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (60, CAST(0x0000A8BF00F63911 AS DateTime), N'13', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (61, CAST(0x0000A8BF00F63916 AS DateTime), N'58', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (62, CAST(0x0000A8BF00F63960 AS DateTime), N'30', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (63, CAST(0x0000A8BF00F6396B AS DateTime), N'9', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (64, CAST(0x0000A8BF00F63978 AS DateTime), N'7', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (65, CAST(0x0000A8BF00F63991 AS DateTime), N'9', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (66, CAST(0x0000A8BF00F6C20A AS DateTime), N'65', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (67, CAST(0x0000A8BF00F6C2DD AS DateTime), N'64', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (68, CAST(0x0000A8BF00F6C2E1 AS DateTime), N'16', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (69, CAST(0x0000A8BF00F6C32C AS DateTime), N'58', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (70, CAST(0x0000A8BF00F6C34F AS DateTime), N'9', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (71, CAST(0x0000A8BF00F6C828 AS DateTime), N'63', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (72, CAST(0x0000A8BF00F6CBB3 AS DateTime), N'58', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (73, CAST(0x0000A8BF00F6D6D7 AS DateTime), N'16', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (74, CAST(0x0000A8BF00F6D7AB AS DateTime), N'64', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (75, CAST(0x0000A8BF00F6D7AE AS DateTime), N'16', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (76, CAST(0x0000A8BF00F6D7F4 AS DateTime), N'64', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (77, CAST(0x0000A8BF00F6D7FE AS DateTime), N'65', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (78, CAST(0x0000A8BF00F755E5 AS DateTime), N'21', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (79, CAST(0x0000A8BF00F755EA AS DateTime), N'20', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (80, CAST(0x0000A8BF00F755EE AS DateTime), N'21', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (81, CAST(0x0000A8BF00F75641 AS DateTime), N'21', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (82, CAST(0x0000A8BF00F7564D AS DateTime), N'21', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (83, CAST(0x0000A8BF00F8C0AD AS DateTime), N'7', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (84, CAST(0x0000A8BF00F8C181 AS DateTime), N'20', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (85, CAST(0x0000A8BF00F8C185 AS DateTime), N'7', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (86, CAST(0x0000A8BF00F8C1DD AS DateTime), N'7', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (87, CAST(0x0000A8BF00F8C229 AS DateTime), N'33', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (88, CAST(0x0000A8BF00F8C410 AS DateTime), N'33', N'DEBUG', N'log4net', N'/UserManager/Index', N'用户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (89, CAST(0x0000A8BF00F8C560 AS DateTime), N'32', N'DEBUG', N'log4net', N'/UserManager/Index', N'用户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (90, CAST(0x0000A8BF00F8C564 AS DateTime), N'33', N'DEBUG', N'log4net', N'/UserManager/Index', N'用户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (91, CAST(0x0000A8BF00F8C5A0 AS DateTime), N'7', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (92, CAST(0x0000A8BF00F8C5CF AS DateTime), N'20', N'DEBUG', N'log4net', N'/UserManager/Index', N'用户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (93, CAST(0x0000A8BF00FD1D15 AS DateTime), N'100', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (94, CAST(0x0000A8BF00FD1D1B AS DateTime), N'99', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (95, CAST(0x0000A8BF00FD1D64 AS DateTime), N'99', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (96, CAST(0x0000A8BF00FD208A AS DateTime), N'96', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (97, CAST(0x0000A8BF00FD2090 AS DateTime), N'99', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (98, CAST(0x0000A8BF00FD2095 AS DateTime), N'90', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (99, CAST(0x0000A8BF00FD20C7 AS DateTime), N'96', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
GO
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (100, CAST(0x0000A8BF00FD20D5 AS DateTime), N'96', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (101, CAST(0x0000A8BF00FD2326 AS DateTime), N'96', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (102, CAST(0x0000A8BF00FD2420 AS DateTime), N'90', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (103, CAST(0x0000A8BF00FF6D52 AS DateTime), N'99', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (104, CAST(0x0000A8BF00FF6D72 AS DateTime), N'103', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (105, CAST(0x0000A8BF00FF6DAD AS DateTime), N'97', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (106, CAST(0x0000A8BF00FF7091 AS DateTime), N'97', N'DEBUG', N'log4net', N'/TenderInfoManager/index', N'投标单管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (107, CAST(0x0000A8BF00FF70A5 AS DateTime), N'90', N'DEBUG', N'log4net', N'/TenderInfoManager/index', N'投标单管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (108, CAST(0x0000A8BF00FF70B8 AS DateTime), N'97', N'DEBUG', N'log4net', N'/TenderInfoManager/index', N'投标单管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (109, CAST(0x0000A8BF00FF70FA AS DateTime), N'90', N'DEBUG', N'log4net', N'/TenderInfoManager/index', N'投标单管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (110, CAST(0x0000A8BF010414B2 AS DateTime), N'90', N'INFO', N'log4net', N'登录成功', N'登录系统', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (111, CAST(0x0000A8BF0104179C AS DateTime), N'74', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (112, CAST(0x0000A8BF0104195F AS DateTime), N'78', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (113, CAST(0x0000A8BF010419B2 AS DateTime), N'78', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (114, CAST(0x0000A8BF01041CBC AS DateTime), N'74', N'DEBUG', N'log4net', N'/RoleManager/Index', N'角色管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (115, CAST(0x0000A8BF01041D8B AS DateTime), N'76', N'DEBUG', N'log4net', N'/RoleManager/Index', N'角色管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (116, CAST(0x0000A8BF01041D92 AS DateTime), N'74', N'DEBUG', N'log4net', N'/RoleManager/Index', N'角色管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (117, CAST(0x0000A8BF01041DCA AS DateTime), N'74', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (118, CAST(0x0000A8BF01041DE7 AS DateTime), N'74', N'DEBUG', N'log4net', N'/RoleManager/Index', N'角色管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (119, CAST(0x0000A8BF010420AA AS DateTime), N'74', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (120, CAST(0x0000A8BF01042164 AS DateTime), N'78', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (121, CAST(0x0000A8BF01042168 AS DateTime), N'74', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (122, CAST(0x0000A8BF0104219B AS DateTime), N'90', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (123, CAST(0x0000A8BF010421A9 AS DateTime), N'90', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (124, CAST(0x0000A8BF010424CC AS DateTime), N'90', N'DEBUG', N'log4net', N'/UserManager/Index', N'用户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (125, CAST(0x0000A8BF0104263E AS DateTime), N'74', N'DEBUG', N'log4net', N'/UserManager/Index', N'用户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (126, CAST(0x0000A8BF01042642 AS DateTime), N'78', N'DEBUG', N'log4net', N'/UserManager/Index', N'用户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (127, CAST(0x0000A8BF0104267E AS DateTime), N'78', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (128, CAST(0x0000A8BF01042688 AS DateTime), N'78', N'DEBUG', N'log4net', N'/UserManager/Index', N'用户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (129, CAST(0x0000A8BF01042AC0 AS DateTime), N'78', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (130, CAST(0x0000A8BF01042B7D AS DateTime), N'74', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (131, CAST(0x0000A8BF01042B81 AS DateTime), N'78', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (132, CAST(0x0000A8BF01042BBE AS DateTime), N'78', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (133, CAST(0x0000A8BF01042BC8 AS DateTime), N'76', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (134, CAST(0x0000A8BF01042F66 AS DateTime), N'79', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (135, CAST(0x0000A8BF0104301C AS DateTime), N'76', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (136, CAST(0x0000A8BF01043020 AS DateTime), N'78', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (137, CAST(0x0000A8BF01043056 AS DateTime), N'76', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (138, CAST(0x0000A8BF01043066 AS DateTime), N'79', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (139, CAST(0x0000A8BF0104319C AS DateTime), N'80', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (140, CAST(0x0000A8BF01043262 AS DateTime), N'76', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (141, CAST(0x0000A8BF01043268 AS DateTime), N'78', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (142, CAST(0x0000A8BF010432A0 AS DateTime), N'76', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (143, CAST(0x0000A8BF010432B0 AS DateTime), N'90', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (144, CAST(0x0000A8BF0104370C AS DateTime), N'80', N'DEBUG', N'log4net', N'/TenderInfoManager/index', N'投标单管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (145, CAST(0x0000A8BF01043A18 AS DateTime), N'78', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (146, CAST(0x0000A8BF01043F04 AS DateTime), N'80', N'DEBUG', N'log4net', N'/TenderInfoManager/index', N'投标单管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (147, CAST(0x0000A8BF0104A8C8 AS DateTime), N'84', N'INFO', N'log4net', N'登录成功', N'登录系统', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (148, CAST(0x0000A8BF0104ABB4 AS DateTime), N'90', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (149, CAST(0x0000A8BF0104AD74 AS DateTime), N'80', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (150, CAST(0x0000A8BF0104ADB4 AS DateTime), N'91', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (151, CAST(0x0000A8BF0104B16E AS DateTime), N'79', N'DEBUG', N'log4net', N'/TenderInfoManager/index', N'投标单管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (152, CAST(0x0000A8BF0104B283 AS DateTime), N'78', N'DEBUG', N'log4net', N'/TenderInfoManager/index', N'投标单管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (153, CAST(0x0000A8BF0104B296 AS DateTime), N'91', N'DEBUG', N'log4net', N'/TenderInfoManager/index', N'投标单管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (154, CAST(0x0000A8BF0104B2DC AS DateTime), N'74', N'DEBUG', N'log4net', N'/TenderInfoManager/index', N'投标单管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (155, CAST(0x0000A8BF0104B5E9 AS DateTime), N'83', N'DEBUG', N'log4net', N'/TenderUserManager/index', N'投标客户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (156, CAST(0x0000A8BF0104B69F AS DateTime), N'80', N'DEBUG', N'log4net', N'/TenderUserManager/index', N'投标客户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (157, CAST(0x0000A8BF0104B6A4 AS DateTime), N'79', N'DEBUG', N'log4net', N'/TenderUserManager/index', N'投标客户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (158, CAST(0x0000A8BF0104B6E5 AS DateTime), N'83', N'DEBUG', N'log4net', N'/TenderUserManager/index', N'投标客户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (159, CAST(0x0000A8BF0104B8C1 AS DateTime), N'88', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (160, CAST(0x0000A8BF0104B97E AS DateTime), N'80', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (161, CAST(0x0000A8BF0104B983 AS DateTime), N'79', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (162, CAST(0x0000A8BF0104B9B8 AS DateTime), N'88', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (163, CAST(0x0000A8BF0104B9C5 AS DateTime), N'83', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (164, CAST(0x0000A8BF0104B9D8 AS DateTime), N'84', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (165, CAST(0x0000A8BF0104B9F3 AS DateTime), N'74', N'DEBUG', N'log4net', N'/BidInfoManager/Index', N'查看投标', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (166, CAST(0x0000A8BF0104C142 AS DateTime), N'84', N'DEBUG', N'log4net', N'/Statistics/Index', N'数据统计', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (167, CAST(0x0000A8BF0104C218 AS DateTime), N'83', N'DEBUG', N'log4net', N'/Statistics/Index', N'数据统计', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (168, CAST(0x0000A8BF0104C21B AS DateTime), N'80', N'DEBUG', N'log4net', N'/Statistics/Index', N'数据统计', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (169, CAST(0x0000A8BF0104C255 AS DateTime), N'79', N'DEBUG', N'log4net', N'/Statistics/Index', N'数据统计', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (170, CAST(0x0000A8BF0104D5F2 AS DateTime), N'80', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (171, CAST(0x0000A8BF0104D6E7 AS DateTime), N'91', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (172, CAST(0x0000A8BF0104D6EC AS DateTime), N'83', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (173, CAST(0x0000A8BF0104D739 AS DateTime), N'74', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (174, CAST(0x0000A8BF0104D748 AS DateTime), N'78', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (175, CAST(0x0000A8BF0104D8BD AS DateTime), N'80', N'DEBUG', N'log4net', N'/UserManager/Index', N'用户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (176, CAST(0x0000A8BF0104DA26 AS DateTime), N'79', N'DEBUG', N'log4net', N'/UserManager/Index', N'用户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (177, CAST(0x0000A8BF0104DA2A AS DateTime), N'83', N'DEBUG', N'log4net', N'/UserManager/Index', N'用户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (178, CAST(0x0000A8BF0104DA60 AS DateTime), N'91', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (179, CAST(0x0000A8BF0104DA6E AS DateTime), N'88', N'DEBUG', N'log4net', N'/UserManager/Index', N'用户管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (180, CAST(0x0000A8BF0104DEE7 AS DateTime), N'80', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (181, CAST(0x0000A8BF0104DFC2 AS DateTime), N'91', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (182, CAST(0x0000A8BF0104DFD0 AS DateTime), N'78', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (183, CAST(0x0000A8BF0104E236 AS DateTime), N'80', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (184, CAST(0x0000A8BF0104E249 AS DateTime), N'88', N'DEBUG', N'log4net', N'/CategoryManager/Index', N'分类管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (185, CAST(0x0000A8BF0104E256 AS DateTime), N'84', N'DEBUG', N'log4net', N'/ResourceManager/Index', N'资源管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (186, CAST(0x0000A8BF0104E4FD AS DateTime), N'78', N'DEBUG', N'log4net', N'/RoleManager/Index', N'角色管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (187, CAST(0x0000A8BF0104E5F4 AS DateTime), N'83', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (188, CAST(0x0000A8BF0104E601 AS DateTime), N'74', N'DEBUG', N'log4net', N'/RoleManager/Index', N'角色管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (189, CAST(0x0000A8BF0104E901 AS DateTime), N'74', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (190, CAST(0x0000A8BF0104E90D AS DateTime), N'83', N'INFO', N'log4net', N'"ea25646b-964b-4d41-ab03-d8964e1494fb/UserModule"', N'为用户或角色分配模块', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (191, CAST(0x0000A8BF0104EE89 AS DateTime), N'90', N'DEBUG', N'log4net', N'relevancemanagerunassign', N'relevancemanagerunassign', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (192, CAST(0x0000A8BF0104EEC7 AS DateTime), N'74', N'INFO', N'log4net', N'{"type":"UserModule","firstId":"ea25646b-964b-4d41-ab03-d8964e1494fb","secIds":["069475e3-c997-487a-9f29-e6a864c5c1d4"]}', N'取消权限模块/菜单/资源', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (193, CAST(0x0000A8BF0104F16A AS DateTime), N'80', N'DEBUG', N'log4net', N'moduleelementmanagerassignmoduleelement', N'moduleelementmanagerassignmoduleelement', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (194, CAST(0x0000A8BF0104F26B AS DateTime), N'88', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (195, CAST(0x0000A8BF0104F275 AS DateTime), N'78', N'DEBUG', N'log4net', N'moduleelementmanagerloadwithaccess', N'moduleelementmanagerloadwithaccess', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (196, CAST(0x0000A8BF0104F547 AS DateTime), N'84', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (197, CAST(0x0000A8BF0104F54B AS DateTime), N'79', N'INFO', N'log4net', N'"ea25646b-964b-4d41-ab03-d8964e1494fb/UserModule"', N'为用户或角色分配模块', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (198, CAST(0x0000A8BF010D9377 AS DateTime), N'6', N'INFO', N'log4net', N'登录成功', N'登录系统', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (199, CAST(0x0000A8BF010D948B AS DateTime), N'6', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
GO
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (200, CAST(0x0000A8BF010D967F AS DateTime), N'7', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (201, CAST(0x0000A8BF010D96DD AS DateTime), N'7', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (202, CAST(0x0000A8BF010D9BAC AS DateTime), N'8', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (203, CAST(0x0000A8BF010D9CA0 AS DateTime), N'6', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (204, CAST(0x0000A8BF010D9CA8 AS DateTime), N'8', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (205, CAST(0x0000A8BF010D9CFB AS DateTime), N'8', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (206, CAST(0x0000A8BF010D9D10 AS DateTime), N'7', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (207, CAST(0x0000A8BF010DA13F AS DateTime), N'10', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (208, CAST(0x0000A8BF010E0068 AS DateTime), N'6', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (209, CAST(0x0000A8BF010E0541 AS DateTime), N'10', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (210, CAST(0x0000A8BF010E054A AS DateTime), N'8', N'INFO', N'log4net', N'{"CascadeId":"","Name":"日志查询","Url":"/Log/Index","HotKey":"","ParentId":"069475e3-c997-487a-9f29-e6a864c5c1d4","IsLeaf":false,"IsAutoExpand":false,"IconName":"","Status":0,"ParentName":"系统管理","Vector":"","SortNo":0,"Id":"00000000-0000-0000-0000-000000000000"}', N'添加或修改模块', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (211, CAST(0x0000A8BF010E0554 AS DateTime), N'7', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (212, CAST(0x0000A8BF010E0555 AS DateTime), N'8', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (213, CAST(0x0000A8BF010E0961 AS DateTime), N'6', N'DEBUG', N'log4net', N'/ModuleManager/Index', N'模块管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (214, CAST(0x0000A8BF010E0B19 AS DateTime), N'6', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (215, CAST(0x0000A8BF010E0B22 AS DateTime), N'10', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (216, CAST(0x0000A8BF010E0B6E AS DateTime), N'10', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (217, CAST(0x0000A8BF010E0C2A AS DateTime), N'10', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (218, CAST(0x0000A8BF010E0C33 AS DateTime), N'7', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (219, CAST(0x0000A8BF010E0C69 AS DateTime), N'7', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (220, CAST(0x0000A8BF01141005 AS DateTime), N'50', N'INFO', N'log4net', N'登录成功', N'登录系统', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (221, CAST(0x0000A8BF0114133A AS DateTime), N'46', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (222, CAST(0x0000A8BF011414EB AS DateTime), N'44', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (223, CAST(0x0000A8BF01141531 AS DateTime), N'50', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (224, CAST(0x0000A8BF01141929 AS DateTime), N'44', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (225, CAST(0x0000A8BF011419E6 AS DateTime), N'45', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (226, CAST(0x0000A8BF011419EE AS DateTime), N'44', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (227, CAST(0x0000A8BF01145274 AS DateTime), N'46', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (228, CAST(0x0000A8BF01145358 AS DateTime), N'37', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (229, CAST(0x0000A8BF0114535D AS DateTime), N'44', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (230, CAST(0x0000A8BF0114546A AS DateTime), N'46', N'DEBUG', N'log4net', N'/Statistics/Index', N'数据统计', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (231, CAST(0x0000A8BF01145FB9 AS DateTime), N'50', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (232, CAST(0x0000A8BF0114609C AS DateTime), N'40', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (233, CAST(0x0000A8BF011460A2 AS DateTime), N'50', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (234, CAST(0x0000A8BF01146198 AS DateTime), N'37', N'DEBUG', N'log4net', N'/Statistics/Index', N'数据统计', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (235, CAST(0x0000A8BF0114FCDB AS DateTime), N'38', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (236, CAST(0x0000A8BF0114FCE0 AS DateTime), N'49', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (237, CAST(0x0000A8BF0114FCE6 AS DateTime), N'45', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (238, CAST(0x0000A8BF01150CD8 AS DateTime), N'41', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (239, CAST(0x0000A8BF01150CDF AS DateTime), N'48', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (240, CAST(0x0000A8BF01150CE3 AS DateTime), N'41', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (241, CAST(0x0000A8BF01150DCE AS DateTime), N'48', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (242, CAST(0x0000A8BF01171535 AS DateTime), N'37', N'INFO', N'log4net', N'登录成功', N'登录系统', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (243, CAST(0x0000A8BF01171661 AS DateTime), N'41', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (244, CAST(0x0000A8BF0117181A AS DateTime), N'26', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (245, CAST(0x0000A8BF0117189B AS DateTime), N'26', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (246, CAST(0x0000A8BF01173D7D AS DateTime), N'22', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (247, CAST(0x0000A8BF01173E74 AS DateTime), N'41', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (248, CAST(0x0000A8BF01173E7B AS DateTime), N'37', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (249, CAST(0x0000A8BF01173F5A AS DateTime), N'23', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (250, CAST(0x0000A8BF0117E19C AS DateTime), N'21', N'INFO', N'log4net', N'登录成功', N'登录系统', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (251, CAST(0x0000A8BF0117E49B AS DateTime), N'44', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (252, CAST(0x0000A8BF0117E679 AS DateTime), N'23', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (253, CAST(0x0000A8BF0117E720 AS DateTime), N'37', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (254, CAST(0x0000A8BF0118009E AS DateTime), N'23', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (255, CAST(0x0000A8BF01180186 AS DateTime), N'44', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (256, CAST(0x0000A8BF01180191 AS DateTime), N'23', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (257, CAST(0x0000A8BF01180279 AS DateTime), N'20', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (258, CAST(0x0000A8BF01181128 AS DateTime), N'20', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (259, CAST(0x0000A8BF0118112D AS DateTime), N'37', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (260, CAST(0x0000A8BF01181131 AS DateTime), N'44', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (261, CAST(0x0000A8BF011811C3 AS DateTime), N'44', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (262, CAST(0x0000A8BF01182CEE AS DateTime), N'44', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (263, CAST(0x0000A8BF0118318D AS DateTime), N'20', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (264, CAST(0x0000A8BF0118327C AS DateTime), N'44', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (265, CAST(0x0000A8BF011838D3 AS DateTime), N'37', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (266, CAST(0x0000A8BF011889E6 AS DateTime), N'44', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (267, CAST(0x0000A8BF01188C26 AS DateTime), N'23', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (268, CAST(0x0000A8BF01188C2C AS DateTime), N'44', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (269, CAST(0x0000A8BF01188CDA AS DateTime), N'21', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (270, CAST(0x0000A8BF01193113 AS DateTime), N'22', N'INFO', N'log4net', N'登录成功', N'登录系统', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (271, CAST(0x0000A8BF0119340A AS DateTime), N'22', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (272, CAST(0x0000A8BF0119363F AS DateTime), N'21', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (273, CAST(0x0000A8BF011936AE AS DateTime), N'21', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (274, CAST(0x0000A8BF0119396D AS DateTime), N'21', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (275, CAST(0x0000A8BF01193A33 AS DateTime), N'37', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (276, CAST(0x0000A8BF01193A3B AS DateTime), N'21', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (277, CAST(0x0000A8BF01193AC5 AS DateTime), N'37', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (278, CAST(0x0000A8BF01194F8D AS DateTime), N'20', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (279, CAST(0x0000A8BF011950A9 AS DateTime), N'20', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (280, CAST(0x0000A8BF01195231 AS DateTime), N'37', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (281, CAST(0x0000A8BF011952D6 AS DateTime), N'20', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (282, CAST(0x0000A8BF011A748F AS DateTime), N'41', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (283, CAST(0x0000A8BF011A7494 AS DateTime), N'21', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (284, CAST(0x0000A8BF011A749A AS DateTime), N'20', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (285, CAST(0x0000A8BF011A7563 AS DateTime), N'41', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (286, CAST(0x0000A8BF011A7D4A AS DateTime), N'20', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (287, CAST(0x0000A8BF011A7DB7 AS DateTime), N'20', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (288, CAST(0x0000A8BF011A7E91 AS DateTime), N'20', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (289, CAST(0x0000A8BF011ABE28 AS DateTime), N'41', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (290, CAST(0x0000A8BF011ABE2D AS DateTime), N'37', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (291, CAST(0x0000A8BF011ABE33 AS DateTime), N'21', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (292, CAST(0x0000A8BF011ABF04 AS DateTime), N'37', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (293, CAST(0x0000A8BF011C7F07 AS DateTime), N'34', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (294, CAST(0x0000A8BF011C7F0C AS DateTime), N'16', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (295, CAST(0x0000A8BF011C7F10 AS DateTime), N'35', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (296, CAST(0x0000A8BF011C7FCB AS DateTime), N'6', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (297, CAST(0x0000A8BF011C834A AS DateTime), N'16', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (298, CAST(0x0000A8BF011CD227 AS DateTime), N'9', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (299, CAST(0x0000A8BF011CD22C AS DateTime), N'16', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
GO
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (300, CAST(0x0000A8BF011CD230 AS DateTime), N'9', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (301, CAST(0x0000A8BF011CD2E7 AS DateTime), N'26', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (302, CAST(0x0000A8BF011DA199 AS DateTime), N'18', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (303, CAST(0x0000A8BF011DA19E AS DateTime), N'32', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (304, CAST(0x0000A8BF011DA1A4 AS DateTime), N'25', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (305, CAST(0x0000A8BF011DA282 AS DateTime), N'26', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (306, CAST(0x0000A8BF011DA6C6 AS DateTime), N'26', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (307, CAST(0x0000A8BF011DA6CC AS DateTime), N'36', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (308, CAST(0x0000A8BF011DA6D0 AS DateTime), N'26', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (309, CAST(0x0000A8BF011DA74E AS DateTime), N'36', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (310, CAST(0x0000A8BF011E24E7 AS DateTime), N'19', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (311, CAST(0x0000A8BF011F2FF0 AS DateTime), N'19', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (312, CAST(0x0000A8BF011F2FF6 AS DateTime), N'39', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (313, CAST(0x0000A8BF011F2FFB AS DateTime), N'38', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (314, CAST(0x0000A8BF011F30BF AS DateTime), N'45', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (315, CAST(0x0000A8BF011F5718 AS DateTime), N'13', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (316, CAST(0x0000A8BF0120D1E5 AS DateTime), N'54', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (317, CAST(0x0000A8BF0121A3EB AS DateTime), N'58', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (318, CAST(0x0000A8BF01229398 AS DateTime), N'70', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (319, CAST(0x0000A8BF012297B9 AS DateTime), N'62', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (320, CAST(0x0000A8BF0122ABB3 AS DateTime), N'68', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (321, CAST(0x0000A8BF0122B8B7 AS DateTime), N'68', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (322, CAST(0x0000A8BF0122BD21 AS DateTime), N'75', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (323, CAST(0x0000A8BF0122C66A AS DateTime), N'63', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (324, CAST(0x0000A8BF0122CC94 AS DateTime), N'71', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (325, CAST(0x0000A8BF0122CC9B AS DateTime), N'68', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (326, CAST(0x0000A8BF0122CCA5 AS DateTime), N'63', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (327, CAST(0x0000A8BF0122CDAE AS DateTime), N'75', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (328, CAST(0x0000A8BF0122D2F4 AS DateTime), N'73', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (329, CAST(0x0000A8BF0122D836 AS DateTime), N'71', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (330, CAST(0x0000A8BF0122E019 AS DateTime), N'71', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (331, CAST(0x0000A8BF01237210 AS DateTime), N'72', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (332, CAST(0x0000A8BF01238156 AS DateTime), N'71', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (333, CAST(0x0000A8BF0123CF17 AS DateTime), N'57', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (334, CAST(0x0000A8BF0123D414 AS DateTime), N'71', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (335, CAST(0x0000A8BF0125B55C AS DateTime), N'71', N'INFO', N'log4net', N'登录成功', N'登录系统', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (336, CAST(0x0000A8BF0125B65B AS DateTime), N'65', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (337, CAST(0x0000A8BF0125B837 AS DateTime), N'51', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (338, CAST(0x0000A8BF0125B8E6 AS DateTime), N'57', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (339, CAST(0x0000A8BF0125BBD8 AS DateTime), N'65', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (340, CAST(0x0000A8BF0125BC96 AS DateTime), N'60', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (341, CAST(0x0000A8BF0125BC9D AS DateTime), N'57', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (342, CAST(0x0000A8BF0125BD4E AS DateTime), N'59', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (343, CAST(0x0000A8BF0125E0F6 AS DateTime), N'66', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (344, CAST(0x0000A8BF0125E81C AS DateTime), N'66', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (345, CAST(0x0000A8BF0125E822 AS DateTime), N'58', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (346, CAST(0x0000A8BF0125E8EC AS DateTime), N'58', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (347, CAST(0x0000A8BF0126A164 AS DateTime), N'64', N'INFO', N'log4net', N'登录成功', N'登录系统', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (348, CAST(0x0000A8BF0126A495 AS DateTime), N'49', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (349, CAST(0x0000A8BF0126A696 AS DateTime), N'65', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (350, CAST(0x0000A8BF0126A74D AS DateTime), N'65', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (351, CAST(0x0000A8BF0126ABA0 AS DateTime), N'65', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (352, CAST(0x0000A8BF0126AC8A AS DateTime), N'70', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (353, CAST(0x0000A8BF0126AC94 AS DateTime), N'72', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (354, CAST(0x0000A8BF0126AD29 AS DateTime), N'70', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (355, CAST(0x0000A8BF01285A00 AS DateTime), N'68', N'INFO', N'log4net', N'登录成功', N'登录系统', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (356, CAST(0x0000A8BF01285CF0 AS DateTime), N'69', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (357, CAST(0x0000A8BF01285EC0 AS DateTime), N'73', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (358, CAST(0x0000A8BF01285F77 AS DateTime), N'70', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (359, CAST(0x0000A8BF01286175 AS DateTime), N'68', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (360, CAST(0x0000A8BF0128623C AS DateTime), N'70', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (361, CAST(0x0000A8BF01286249 AS DateTime), N'46', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (362, CAST(0x0000A8BF012862F7 AS DateTime), N'65', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (363, CAST(0x0000A8BF0128C0FC AS DateTime), N'68', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (364, CAST(0x0000A8BF0128CA78 AS DateTime), N'63', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (365, CAST(0x0000A8BF012943F1 AS DateTime), N'49', N'INFO', N'log4net', N'登录成功', N'登录系统', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (366, CAST(0x0000A8BF01294711 AS DateTime), N'70', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (367, CAST(0x0000A8BF0129493B AS DateTime), N'63', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (368, CAST(0x0000A8BF01294A37 AS DateTime), N'68', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (369, CAST(0x0000A8BF01294C50 AS DateTime), N'63', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (370, CAST(0x0000A8BF01294D09 AS DateTime), N'49', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (371, CAST(0x0000A8BF01294D11 AS DateTime), N'68', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (372, CAST(0x0000A8BF01294DA0 AS DateTime), N'63', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (373, CAST(0x0000A8BF0129E6B6 AS DateTime), N'67', N'INFO', N'log4net', N'登录成功', N'登录系统', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (374, CAST(0x0000A8BF0129E984 AS DateTime), N'62', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (375, CAST(0x0000A8BF0129EB5F AS DateTime), N'62', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (376, CAST(0x0000A8BF0129EBB2 AS DateTime), N'63', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (377, CAST(0x0000A8BF0129EDEA AS DateTime), N'62', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (378, CAST(0x0000A8BF0129EEA8 AS DateTime), N'65', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (379, CAST(0x0000A8BF0129EEAF AS DateTime), N'63', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (380, CAST(0x0000A8BF0129EEF2 AS DateTime), N'73', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (381, CAST(0x0000A8BF0129F3A5 AS DateTime), N'65', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (382, CAST(0x0000A8BF0129F6C0 AS DateTime), N'73', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (383, CAST(0x0000A8BF012A2E1E AS DateTime), N'70', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (384, CAST(0x0000A8BF012A2E22 AS DateTime), N'73', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (385, CAST(0x0000A8BF012A2E28 AS DateTime), N'67', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (386, CAST(0x0000A8BF012A2F10 AS DateTime), N'62', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (387, CAST(0x0000A8BF012A434A AS DateTime), N'49', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (388, CAST(0x0000A8BF012A434F AS DateTime), N'63', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (389, CAST(0x0000A8BF012A4353 AS DateTime), N'62', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (390, CAST(0x0000A8BF012A4421 AS DateTime), N'73', N'DEBUG', N'log4net', N'/Log/Index', N'日志查询', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (391, CAST(0x0000A8BF012B5946 AS DateTime), N'51', N'INFO', N'log4net', N'登录成功', N'登录系统', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (392, CAST(0x0000A8BF012B5A0C AS DateTime), N'57', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (393, CAST(0x0000A8BF012B5BD7 AS DateTime), N'68', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (394, CAST(0x0000A8BF012B5C3D AS DateTime), N'56', N'DEBUG', N'log4net', N'homegit', N'homegit', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (395, CAST(0x0000A8BF012C7E77 AS DateTime), N'52', N'INFO', N'log4net', N'登录成功', N'登录系统', N'System', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (396, CAST(0x0000A8BF012C8144 AS DateTime), N'55', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (397, CAST(0x0000A8BF012C82DB AS DateTime), N'60', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (398, CAST(0x0000A8BF012EA471 AS DateTime), N'35', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (399, CAST(0x0000A8BF012EA550 AS DateTime), N'22', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
GO
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (400, CAST(0x0000A8BF012EA614 AS DateTime), N'13', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (401, CAST(0x0000A8BF012EA691 AS DateTime), N'22', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (402, CAST(0x0000A8BF012EA6C8 AS DateTime), N'39', N'DEBUG', N'log4net', N'/OrgManager/Index', N'部门管理', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (403, CAST(0x0000A8BF012FEDB8 AS DateTime), N'23', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (404, CAST(0x0000A8BF012FEEA4 AS DateTime), N'7', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (405, CAST(0x0000A8BF01305153 AS DateTime), N'38', N'DEBUG', N'log4net', N'homeindex', N'homeindex', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (406, CAST(0x0000A8BF0130523E AS DateTime), N'22', N'DEBUG', N'log4net', N'homenavbar', N'homenavbar', N'System管理员', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (407, CAST(0x0000A8C000F49791 AS DateTime), N'11', N'INFO', N'log4net', N'登陆失败', N'登录系统', N'(null)', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (408, CAST(0x0000A8C000F4C701 AS DateTime), N'11', N'INFO', N'log4net', N'登陆失败', N'登录系统', N'(null)', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (409, CAST(0x0000A8C000F4EAB8 AS DateTime), N'11', N'INFO', N'log4net', N'登陆失败', N'登录系统', N'(null)', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (410, CAST(0x0000A8C000F511FA AS DateTime), N'11', N'INFO', N'log4net', N'登录成功', N'登录系统', N'admin', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (411, CAST(0x0000A8C000F5A891 AS DateTime), N'9', N'INFO', N'log4net', N'登录成功', N'登录系统', N'admin', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (412, CAST(0x0000A8C000F6495A AS DateTime), N'11', N'INFO', N'log4net', N'登录成功', N'登录系统', N'admin', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (413, CAST(0x0000A8C000F86A04 AS DateTime), N'23', N'INFO', N'log4net', N'登录成功', N'登录系统', N'admin', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (414, CAST(0x0000A8C000F8ABEF AS DateTime), N'25', N'INFO', N'log4net', N'登陆失败', N'登录系统', N'admin', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (415, CAST(0x0000A8C000F8BA24 AS DateTime), N'24', N'INFO', N'log4net', N'登录成功', N'登录系统', N'admin', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (416, CAST(0x0000A8C000F8FFCB AS DateTime), N'24', N'INFO', N'log4net', N'登录成功', N'登录系统', N'admin', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (417, CAST(0x0000A8C000F93FD7 AS DateTime), N'26', N'INFO', N'log4net', N'登录成功', N'登录系统', N'admin', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (418, CAST(0x0000A8C000F98203 AS DateTime), N'27', N'INFO', N'log4net', N'登录成功', N'登录系统', N'admin', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (419, CAST(0x0000A8C000FC360D AS DateTime), N'30', N'INFO', N'log4net', N'登陆失败', N'登录系统', N'(null)', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (420, CAST(0x0000A8C000FE8DC3 AS DateTime), N'32', N'INFO', N'log4net', N'登录成功', N'登录系统', N'admin', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (421, CAST(0x0000A8C00127D9D9 AS DateTime), N'16', N'INFO', N'log4net', N'登录成功', N'登录系统', N'admin', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (422, CAST(0x0000A8C00129EB86 AS DateTime), N'17', N'INFO', N'log4net', N'登录成功', N'登录系统', N'admin', N'::1')
INSERT [dbo].[LogDetails] ([LogID], [LogDate], [LogThread], [LogLevel], [LogLogger], [LogMessage], [LogActionClick], [UserName], [UserIP]) VALUES (423, CAST(0x0000A8C0012B5FCB AS DateTime), N'13', N'INFO', N'log4net', N'登录成功', N'登录系统', N'admin', N'192.168.1.165')
SET IDENTITY_INSERT [dbo].[LogDetails] OFF
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'bedb41a2-f310-4775-af99-01be08adda93', N'.0.1.1.', N'角色管理', N'/RoleManager/Index', N'', 1, 0, N'fa-users', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'f2ead331-be3e-4049-9679-5cd32cfcfa3d', N'.0.3.10.', N'投标单管理', N'/TenderInfoManager/index', N'', 0, 0, N'', 0, N'投标管理', N'', 0, N'a22ca612-f402-4e46-8ac5-a79f65e9b5a8')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91', N'.0.1.3.', N'资源管理', N'/ResourceManager/Index', N'', 0, 0, N'fa-calculator', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', N'.0.1.4.', N'用户管理', N'/UserManager/Index', N'', 0, 0, N'fa-user', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'41a67a81-2288-4449-b94a-882ad61ae709', N'.0.3.13.', N'数据统计', N'/Statistics/Index', N'', 0, 0, N'', 0, N'投标管理', N'', 4, N'a22ca612-f402-4e46-8ac5-a79f65e9b5a8')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'7580672f-a390-4bb6-982d-9a4570cb5199', N'.0.1.', N'基础配置', N' ', N' ', 1, 0, N'fa-cog', 1, N'根节点', N' ', 0, NULL)
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'a22ca612-f402-4e46-8ac5-a79f65e9b5a8', N'.0.3.', N'投标管理', N'', N'', 0, 0, N'fa-cog', 0, N'根节点', N'', 0, NULL)
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'bc80478d-0547-4437-9cff-be4b40144bdf', N'.0.1.6.', N'模块管理', N'/ModuleManager/Index', N' ', 1, 0, N'fa-file-code-o', 0, N'基础配置', N' ', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'58040353-4599-4bf5-80c0-e329491e6454', N'.0.3.12.', N'投标客户管理', N'/TenderUserManager/index', N'', 0, 0, N'', 0, N'投标管理', N'', 0, N'a22ca612-f402-4e46-8ac5-a79f65e9b5a8')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'069475e3-c997-487a-9f29-e6a864c5c1d4', N'.0.4.', N'系统管理', N'/', N'', 0, 0, N'fa-bars', 0, N'根节点', N'', 0, NULL)
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'a94d5648-c2a9-405e-ba6f-f1602ec9b807', N'.0.1.7.', N'分类管理', N'/CategoryManager/Index', N'', 0, 0, N'fa-archive', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'064acef9-0998-4f06-9051-f372468bc0fd', N'.0.3.11.', N'查看投标', N'/BidInfoManager/Index', N'', 0, 0, N'', 0, N'投标管理', N'', 1, N'a22ca612-f402-4e46-8ac5-a79f65e9b5a8')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'6a9e1346-0c01-44d2-8eb1-f929fdab542a', N'.0.1.8.', N'部门管理', N'/OrgManager/Index', N'', 0, 0, N'fa-plus-square-o', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'24f91df4-0af8-4003-bd4e-fa72652ad7ef', N'.0.4.1.', N'日志查询', N'/Log/Index', N'', 0, 0, N'', 0, N'系统管理', N'', 0, N'069475e3-c997-487a-9f29-e6a864c5c1d4')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'38109ca0-32ec-44bd-a243-017e591b532b', N'btnEditStock', N'编辑', N'button', N' ', N'edit()', N'pencil', N'btn-pink', N'编辑进出库', 0, N'89c3bfbe-246f-4112-8eb1-b6789da54202')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'18cc3217-28a6-49b2-9a20-080230065984', N'btnEdit', N'编辑', N'', N'', N'edit()', N'plus', N'btn-pink', N'', 1, N'0031262c-689c-4b96-bae2-2c9d67076ade')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'8966b04f-8e26-4046-8b03-0c64f9f833dd', N'btnDel', N'删除', N'', N'', N'del()', N'trash', N'btn-danger', N'', 3, N'92b00259-2d15-43e7-9321-adffb29e8bf2')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'15a4f88c-4fae-4cab-ba2f-0cbd2cca8736', N'btnAssignRes', N'为角色分配资源', N'button', N'', N'openRoleReourceAccess(this)', N'pencil', N'btn-success', N'为角色分配资源', 3, N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'0d25438e-1436-48e0-aedf-0f1690693282', N'btnAccessModule', N'为角色分配模块', N'button', N'', N'assignRoleModule(this)', N'pencil', N'btn-success', N'为角色分配模块', 4, N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'0c847b1e-cb7a-4f7d-861e-130b3e16d7e5', N'btnPublish', N'发布', N'', N'', N'publish()', N'bank', N'btn-danger', N'发布标书', 3, N'f2ead331-be3e-4049-9679-5cd32cfcfa3d')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'3dc0ec4d-bf86-4bae-9ec0-1d6c2403fb99', N'btnAdd', N'添加', N'', N'', N'add()', N'plus', N'btn-success', N'', 1, N'92b00259-2d15-43e7-9321-adffb29e8bf2')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'2feefce1-e3d8-42ac-b811-2352679628da', N'btnDel', N'删除', N'button', N'', N'del()', N'trash', N'btn-danger', N'刪除用戶', 2, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'38cdbe51-aaad-497a-91cc-23f2b10cfc12', N'btnEdit', N'编辑', N'', N'', N'edit()', N'pencil', N'btn-success', N'', 1, N'58040353-4599-4bf5-80c0-e329491e6454')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'0d7a86dd-4ff2-4c39-9356-2658b0da44f6', N'btnpublishbid', N'发布中标', N'', N'', N'publishbid()', N'key', N'btn-success', N'发布中标', 1, N'064acef9-0998-4f06-9051-f372468bc0fd')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'81c63a9b-c5b6-4259-813c-28cd59cb1755', N'btnEdit', N'编辑', N'', N'', N'edit()', N'pencil', N'btn-success', N'编辑', 2, N'f2ead331-be3e-4049-9679-5cd32cfcfa3d')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'17ae4fd4-ab4e-439e-ba1d-2a53b46d112b', N'btnDel', N'删除', N'', N'', N'del()', N'trash', N'btn-danger', N'', 2, N'0031262c-689c-4b96-bae2-2c9d67076ade')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'816b12b3-e916-446d-a2fa-329cfd13c831', N'btnDetail', N'进度详情', N'button', N'', N'detail()', N'bar', N'btn-success', N'', 4, N'9486ff22-b696-4d7f-8093-8a3e53c45453')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'68484265-7802-4f06-b024-33e8b2f2edcf', N'btnAdd', N'新的申请', N'button', N'', N'add()', N'plus', N'btn-success', N'申请物品', 0, N'9486ff22-b696-4d7f-8093-8a3e53c45453')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'f4903ce2-ade1-45a2-8df1-41ef11a98400', N'btnAdd', N'添加', N'', N'', N'add()', N'plus', N'btn-success', N'添加', 1, N'f2ead331-be3e-4049-9679-5cd32cfcfa3d')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'68fc793f-069f-43e1-a012-42ac2d7c585c', N'btnDel', N'删除', N'button', N'', N'del()', N'trash', N'btn-danger', N'删除角色', 2, N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'd1ba6a72-ba14-44c0-baba-46d0ad96fe8a', N'btnRefresh', N'刷新', N'button', N'', N'refresh()', N'refresh', N'btn-success', N'刷新用户', 3, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'50c9df24-b233-42cb-9a0d-4ce158c75f86', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn-success', N'添加用戶', 0, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'6839a297-350b-4215-b680-4e5dfdae5615', N'btnAssignReource', N'为用户分配资源', N'button', N'', N'openUserReourceAccess(this)', N'pencil', N'btn-success', N'为用户分配资源', 4, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'7f071c63-1620-4486-9264-5806b2e63218', N'btnAccessRole', N'为用户分配角色', N'button', N'', N'openUserRoleAccess(this)', N'pencil', N'btn-success', N'为用户分配角色', 5, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'daddf3b9-71b5-45ac-b85d-5a11c522f2f4', N'btnDel', N'删除', N'button', N' ', N'del()', N'pencil', N'btn-danger', N'删除模块', 0, N'bc80478d-0547-4437-9cff-be4b40144bdf')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'682eae43-08ac-40e3-a037-5a2f6061cd02', N'btnDel', N'删除', N'', N'', N'del()', N'trash', N'btn-pink', N'删除', 3, N'f2ead331-be3e-4049-9679-5cd32cfcfa3d')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'34730f5a-d307-457b-9041-5f7de30abfa9', N'btnEdit', N'编辑', N'button', N'', N'edit()', N'pencil', N'btn-pink', N'编辑用户', 1, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'645b40ac-4223-44a7-aab4-66eb56cf9864', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn-success', N'添加角色', 0, N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'1c9acc3e-a40d-4d07-b495-6e60eb9b71b9', N'btnEdit', N'编辑', N'button', N'', N'edit()', N'pencil', N'btn-pink', N'编辑角色', 1, N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'd59cd48f-7e08-4095-9843-6f18f495e395', N'btnDel', N'删除', N'', N'', N'del()', N'trash', N'btn-pink', N'', 1, N'58040353-4599-4bf5-80c0-e329491e6454')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'f8dde22a-2a37-47c4-8e67-70fb3af5303e', N'btnRefresh', N'刷新', N'button', N'', N'refresh()', N'refresh', N'btn-success', N'刷新部门', 0, N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'79ccd3eb-3aaf-4e08-83c9-713d8ff446fe', N'btnVerification', N'处理', N'', N'', N'verificationForm()', N'bar', N'btn-danger', N'', 5, N'9486ff22-b696-4d7f-8093-8a3e53c45453')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'584c7a3b-d28a-47b4-8648-7797d05d83d1', N'btnDel', N'删除', N'button', N'', N'del()', N'trash', N'btn-danger', N'', 3, N'9486ff22-b696-4d7f-8093-8a3e53c45453')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'84694ea5-d6e1-4a65-8a59-7b5b779688d4', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn btn-green ', N'添加模块', 0, N'bc80478d-0547-4437-9cff-be4b40144bdf')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'44075557-496e-4dde-bb75-7b69f51ab4fe', N'btnEdit', N'编辑', N'button', N'', N'edit()', N'pencil', N'btn-pink', N'编辑模块', 0, N'bc80478d-0547-4437-9cff-be4b40144bdf')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'ef42721f-d223-4a00-a1d9-80b81121f21a', N'btnEdit', N'编辑', N'button', N' ', N'edit()', N'pencil', N'btn-pink', N'编辑部门', 0, N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'1a473afd-cbd4-41e9-9471-81f9435aaabe', N'btnEdit', N'编辑', N'button', N' ', N'edit()', N'pencil', N'btn-success', N'编辑分类', 0, N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'6db928fe-93df-460f-9472-8bb0b6cae52c', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn-success', N'添加进出库', 0, N'89c3bfbe-246f-4112-8eb1-b6789da54202')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'cf7388be-2677-427c-ad78-8f00f1062b96', N'btnAssignElement', N'为用户分配菜单', N'button', N'', N'openAssignUserElement(this)', N'pencil', N'btn-success', N'为用户分配菜单', 7, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'7b2b1ffb-398b-4f7b-83da-8f484e1bcea0', N'btnDel', N'删除', N'button', N'', N'del()', N'del', N'btn-danger', N'删除部门', 0, N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'd352c8ee-3dff-4d28-a0de-903ae68f2533', N'btnPreview', N'预览', N'', N'', N'preview()', N'pencil', N'btn-primary', N'', 1, N'0031262c-689c-4b96-bae2-2c9d67076ade')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'84e38920-f6e5-499c-bf52-a3c6f8499ff7', N'btnDelStock', N'删除', N'button', N' ', N'del()', N'trash', N'btn-danger', N'删除分类', 0, N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'c3d7b478-21e9-4c1e-b866-a3c80be7909b', N'btnRefresh', N'刷新', N'button', N'', N'refresh()', N'refresh', N'btn-success', N'刷新分类', 0, N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'f168aa73-e530-4975-9b96-a5f8d8978cb0', N'editFile', N'附件管理', N'', N'', N'editFile()', N'pencil', N'btn-success', N'附件管理', 3, N'f2ead331-be3e-4049-9679-5cd32cfcfa3d')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'1c870438-4260-43a5-8996-a6e1dc8bbf6a', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn-success', N'添加部门', 0, N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'5ed1681c-13d2-4c87-8675-a8d95c0b40ae', N'btnAssign', N'为模块分配按钮', N'button', N'', N'assignButton()', N'bar', N'btn-danger', N'为模块分配按钮', 0, N'bc80478d-0547-4437-9cff-be4b40144bdf')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'4f2737db-633f-4946-8a71-b08b9885f151', N'btnEdit', N'编辑', N'', N'', N'edit()', N'pencil', N'btn-primary', N'', 2, N'92b00259-2d15-43e7-9321-adffb29e8bf2')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'c7d7daf0-3669-4a22-8bed-b092617deb9c', N'btnDel', N'删除', N'button', N'', N'del()', N'trash', N'btn-danger', N'删除资源', 3, N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'6c814946-db5c-48bd-84dd-b1c38196ad74', N'btnAdd', N'添加模版', N'', N'', N'add()', N'plus', N'btn-success', N'', 0, N'0031262c-689c-4b96-bae2-2c9d67076ade')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'2d595a2a-5de5-479e-a331-b53c799a6b10', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn-success', N'添加分类', 0, N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'4bfa8ea0-6b0d-426f-8687-b654575ca780', N'btnEdit', N'编辑', N'button', N'', N'edit()', N'pencil', N'btn-pink', N'编辑资源', 2, N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'362d1eda-c85e-4b14-a80a-b923291e08de', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn-pink', N'添加', 0, N'f0f06b8f-0a86-487c-8b0e-0a12573ccd46')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'9e2c6754-f258-4b14-96a0-b9d981196a65', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn-success', N'添加资源', 0, N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'c7123d75-dd86-4cf3-ac71-c11676cd3909', N'btnAddInstance', N'发起流程', N'', N'', N'addInstance()', N'plus', N'btn-pink', N'', 3, N'0031262c-689c-4b96-bae2-2c9d67076ade')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'beadbc9e-b156-42ce-acf4-c18bfd6b4a17', N'btnAdd', N'添加', N'', N'', N'add()', N'plus', N'btn-success', N'', 0, N'58040353-4599-4bf5-80c0-e329491e6454')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'fa816af1-a28d-47b5-9b8b-c46e18f902e9', N'btnAccessModule', N'为用户分配模块', N'button', N'', N'openUserModuleAccess(this)', N'pencil', N'btn-success', N'为用户分配模块', 6, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'c0d8505c-061a-467d-862a-c94f27caa208', N'btnAssignElement', N'为角色分配菜单', N'button', N'', N'assignRoleElement(this)', N'bar', N'btn-success', N'为角色分配菜单', 5, N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'c4c1acbb-9cbf-4b1e-9cc0-ccf5ff544ec2', N'btnDel', N'删除', N'button', N'', N'del()', N'trash', N'btn-danger', N'删除进出库', 0, N'89c3bfbe-246f-4112-8eb1-b6789da54202')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'9c96e485-84a6-45f0-b6a7-f01dab94b0c6', N'btnPreview', N'预览', N'', N'', N'preview()', N'bar', N'btn-pink', N'', 4, N'92b00259-2d15-43e7-9321-adffb29e8bf2')
INSERT [dbo].[Org] ([Id], [CascadeId], [Name], [HotKey], [ParentName], [IsLeaf], [IsAutoExpand], [IconName], [Status], [Type], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [ParentId]) VALUES (N'28861245-7fcb-4cb5-89b0-558280e2427f', N'.0.1.1.', N'部门一', N'', N'公司总部', 0, 0, N'', 0, 0, N'', N'', CAST(0x0000A8B800B5D603 AS DateTime), 0, 0, N'4fe12558-ca66-4dc2-9690-f6be6e7fb968')
INSERT [dbo].[Org] ([Id], [CascadeId], [Name], [HotKey], [ParentName], [IsLeaf], [IsAutoExpand], [IconName], [Status], [Type], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [ParentId]) VALUES (N'bdc3b4ff-8b64-4906-bf5b-c68252bc3ae9', N'.0.1.2.', N'部门二', N'', N'公司总部', 0, 0, N'', 0, 0, N'', N'', CAST(0x0000A8B800B5E40C AS DateTime), 0, 0, N'4fe12558-ca66-4dc2-9690-f6be6e7fb968')
INSERT [dbo].[Org] ([Id], [CascadeId], [Name], [HotKey], [ParentName], [IsLeaf], [IsAutoExpand], [IconName], [Status], [Type], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [ParentId]) VALUES (N'e3016789-2690-4247-816a-d20d5aed526d', N'.0.1.3.', N'用户部门', N'', N'公司总部', 0, 0, N'', 0, 0, N'', N'', CAST(0x0000A8B80143ED33 AS DateTime), 0, 0, N'4fe12558-ca66-4dc2-9690-f6be6e7fb968')
INSERT [dbo].[Org] ([Id], [CascadeId], [Name], [HotKey], [ParentName], [IsLeaf], [IsAutoExpand], [IconName], [Status], [Type], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [ParentId]) VALUES (N'4fe12558-ca66-4dc2-9690-f6be6e7fb968', N'.0.1.', N'公司总部', N'', N'根节点', 0, 0, N'', 0, 0, N'', N'', CAST(0x0000A8B800B5C5A9 AS DateTime), 0, 0, NULL)
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'120d7a5d-203c-4261-95f5-0125757fb386', N'', N'UserElement', 0, CAST(0x0000A6A501186DFD AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'7f071c63-1620-4486-9264-5806b2e63218')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'cefbf818-4317-4f96-bebb-020e830d6aaa', N'', N'RoleElement', 0, CAST(0x0000A8B800EFF448 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'6839a297-350b-4215-b680-4e5dfdae5615')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'e6e7c1b1-9469-4554-8ba1-02a85a043acf', N'', N'RoleElement', 0, CAST(0x0000A8B800EFF524 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'7f071c63-1620-4486-9264-5806b2e63218')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2f75cde4-1766-4e17-a674-035cb6bf83de', N'', N'RoleElement', 0, CAST(0x0000A8B800EFFB40 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'4f2737db-633f-4946-8a71-b08b9885f151')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'68912e65-256e-45b6-b48e-036382598d32', N'', N'RoleOrg', 0, CAST(0x0000A6A200A5D841 AS DateTime), 0, N'2eb423d6-6ad9-4efe-b423-872478a2a434', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'da9e39c5-930f-4d33-9945-03a630ef891a', N'', N'RoleElement', 0, CAST(0x0000A8B800F0064E AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'ef42721f-d223-4a00-a1d9-80b81121f21a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1cf19b35-e2c2-436f-99b9-03ac2b232cc6', N'', N'RoleElement', 0, CAST(0x0000A6770180D0ED AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'44075557-496e-4dde-bb75-7b69f51ab4fe')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a4fee336-e56f-42a1-88a6-051655f6d9b4', N'', N'RoleElement', 0, CAST(0x0000A8B800B695B9 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'd1ba6a72-ba14-44c0-baba-46d0ad96fe8a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'dfd5430b-3422-465a-be79-05a1e06deed2', N'', N'RoleElement', 0, CAST(0x0000A6770180C45D AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'c7d7daf0-3669-4a22-8bed-b092617deb9c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'34c9a43a-860b-4e5c-9d43-0610d434611b', N'', N'RoleElement', 0, CAST(0x0000A8B800B6A50D AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'7b2b1ffb-398b-4f7b-83da-8f484e1bcea0')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'45a4b10c-7e18-459a-9ee6-06a2e362f78b', N'', N'RoleElement', 0, CAST(0x0000A8B800EFE247 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'15a4f88c-4fae-4cab-ba2f-0cbd2cca8736')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'e96d04a1-538e-4f1f-8ce3-08f3d7e430b3', N'', N'UserElement', 0, CAST(0x0000A8BE013E75AE AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'81c63a9b-c5b6-4259-813c-28cd59cb1755')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'd87b172c-ace3-485c-bb33-090ef40bdf8e', N'', N'RoleOrg', 0, CAST(0x0000A8B800B63E8C AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'4fe12558-ca66-4dc2-9690-f6be6e7fb968')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'13612a4c-b20c-4bd0-a2cd-0ae47576364d', N'', N'UserElement', 0, CAST(0x0000A6A5011110C7 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'c7d7daf0-3669-4a22-8bed-b092617deb9c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'6db5666b-6f8c-4e83-bada-0b45054bd9a4', N'', N'RoleElement', 0, CAST(0x0000A6770180B649 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'0d25438e-1436-48e0-aedf-0f1690693282')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'cdfd4dd0-5807-478e-8dbb-0b8d6279ca74', N'', N'RoleModule', 0, CAST(0x0000A85C0126F874 AS DateTime), 0, N'eee075fa-f468-42cf-8e30-42980f5a7a3b', N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'0ab48dd5-e107-4344-97d4-0bd0dd600298', N'', N'RoleElement', 0, CAST(0x0000A8B800B69844 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'9c96e485-84a6-45f0-b6a7-f01dab94b0c6')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1f31a9d1-63c4-4ddb-9e3d-0d7af6cf2844', N'', N'UserElement', 0, CAST(0x0000A8B800A9629C AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'50c9df24-b233-42cb-9a0d-4ce158c75f86')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1de03d57-2381-4bd8-b2ed-0dbcb8137468', N'', N'RoleElement', 0, CAST(0x0000A8B800B6AF0C AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'816b12b3-e916-446d-a2fa-329cfd13c831')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1285b77b-0b4d-4a2c-b997-0e1e001a49a7', N'', N'RoleElement', 0, CAST(0x0000A8B800EFF79C AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'fa816af1-a28d-47b5-9b8b-c46e18f902e9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'3bcaab20-e096-480e-a9bb-0fdb70686714', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4E AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'cf7388be-2677-427c-ad78-8f00f1062b96')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a051aa08-38da-4b6d-8d90-10b3c2485e4b', N'', N'RoleOrg', 0, CAST(0x0000A6780000006A AS DateTime), 0, N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'543a9fcf-4770-4fd9-865f-030e562be238')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'dcfe6a02-a7b9-4a84-b782-1180085f74f1', N'', N'RoleModule', 0, CAST(0x0000A8B800B67104 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'359d8109-ced8-4c2d-8d27-1277502b36c1', N'', N'RoleElement', 0, CAST(0x0000A8B800B686A7 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'15a4f88c-4fae-4cab-ba2f-0cbd2cca8736')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5725ff79-43c6-4778-bbff-131cf364dab6', N'', N'UserElement', 0, CAST(0x0000A6A501186E92 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'cf7388be-2677-427c-ad78-8f00f1062b96')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'242e9543-3343-41d4-8816-15ffeeaef551', N'', N'UserElement', 0, CAST(0x0000A67A00FFC7A6 AS DateTime), 0, N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'584c7a3b-d28a-47b4-8648-7797d05d83d1')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f042d0e2-7cb3-4aad-a327-17a976bc4d43', N'', N'RoleElement', 0, CAST(0x0000A8B800B68BD7 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'18cc3217-28a6-49b2-9a20-080230065984')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4d8e9977-c294-4da0-ae75-17dcd70b405b', N'', N'RoleElement', 0, CAST(0x0000A8B800B689AD AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'c0d8505c-061a-467d-862a-c94f27caa208')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9fc1517e-eff7-4f7d-8303-18ed404fe261', N'', N'UserOrg', 0, CAST(0x0000A8B800F09322 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'bdc3b4ff-8b64-4906-bf5b-c68252bc3ae9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a8123b37-ba70-4aab-aef6-1938733b5210', N'', N'RoleElement', 0, CAST(0x0000A6770180B64A AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'c0d8505c-061a-467d-862a-c94f27caa208')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'da6c0645-0bf9-4ade-9dd3-1b09e91e504c', N'', N'RoleElement', 0, CAST(0x0000A678009A6357 AS DateTime), 0, N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'816b12b3-e916-446d-a2fa-329cfd13c831')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9a5211af-b318-4d2b-8255-1ba190346456', N'', N'RoleElement', 0, CAST(0x0000A8B800B6A455 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'ef42721f-d223-4a00-a1d9-80b81121f21a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'00d35468-fe9d-4015-888b-1c155dfdef6b', N'', N'RoleElement', 0, CAST(0x0000A8B800B69975 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'4f2737db-633f-4946-8a71-b08b9885f151')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c9310900-58e6-4d7d-845a-1c1d212b6476', N'', N'RoleElement', 0, CAST(0x0000A8B800B6AEBF AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'584c7a3b-d28a-47b4-8648-7797d05d83d1')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2d0fcc88-a7c0-4d33-8a08-1d688e9dde83', N'', N'RoleModule', 0, CAST(0x0000A6750119279A AS DateTime), 0, N'211e12c7-e466-496e-8d26-0660a38e24cc', N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4ba3982b-f0ae-4f9a-980e-1eaedc3b5f2e', N'', N'UserElement', 0, CAST(0x0000A67A01257D69 AS DateTime), 0, N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', N'584c7a3b-d28a-47b4-8648-7797d05d83d1')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'af263192-daa8-4f29-99b9-1efb96e31627', N'', N'RoleElement', 0, CAST(0x0000A6770180B64A AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'645b40ac-4223-44a7-aab4-66eb56cf9864')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b5745389-0068-41f2-aab1-1f0eafbdc7c8', N'', N'RoleModule', 0, CAST(0x0000A8B800B67706 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'9a360757-bbd8-4404-95ae-9c5e338ed5cc')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1ed87876-16dc-4a77-8468-1f88b3d8590b', N'', N'UserModule', 0, CAST(0x0000A8B800A93F0E AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'bc80478d-0547-4437-9cff-be4b40144bdf')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'06c3e0a0-a808-4c6d-92d6-1fc557ec5111', N'', N'RoleElement', 0, CAST(0x0000A8B800B68747 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'0d25438e-1436-48e0-aedf-0f1690693282')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'832f4a8f-7791-4aa6-bcd2-20dcb6f5ef37', N'', N'UserElement', 0, CAST(0x0000A67500F54A2F AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'15a4f88c-4fae-4cab-ba2f-0cbd2cca8736')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'151443f8-ca8a-4ea6-826a-214cbc97fd76', N'', N'RoleModule', 0, CAST(0x0000A8B800B67287 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'92b00259-2d15-43e7-9321-adffb29e8bf2')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'75285caa-97c6-47e0-9a61-2170cfe3d26d', N'', N'RoleElement', 0, CAST(0x0000A8B800B694E4 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'7f071c63-1620-4486-9264-5806b2e63218')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9e46a946-6e81-4f61-bcba-21e4f7fac3df', N'', N'RoleModule', 0, CAST(0x0000A67501192799 AS DateTime), 0, N'211e12c7-e466-496e-8d26-0660a38e24cc', N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'df2d90b3-4e2e-40e9-b406-220009726460', N'', N'RoleModule', 0, CAST(0x0000A6770180AD2A AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'24ac789b-ba7b-4ef7-be32-22740aef20ac', N'', N'RoleElement', 0, CAST(0x0000A8B800F002F4 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'84e38920-f6e5-499c-bf52-a3c6f8499ff7')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'3439897c-a412-4bae-b6f3-22ab63115d7a', N'', N'RoleElement', 0, CAST(0x0000A8B800EFF2C9 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'd1ba6a72-ba14-44c0-baba-46d0ad96fe8a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'211cabca-cad1-45e2-90b3-235fd6385fb8', N'', N'UserOrg', 0, CAST(0x0000A8B800F09322 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'28861245-7fcb-4cb5-89b0-558280e2427f')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'8fce4487-fa69-4616-bffe-267045718763', N'', N'UserModule', 0, CAST(0x0000A8B800A944EA AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'9a360757-bbd8-4404-95ae-9c5e338ed5cc')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b913b4fc-3151-4a13-857e-2790fd09bd79', N'', N'UserElement', 0, CAST(0x0000A8B800B43C8D AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'ef42721f-d223-4a00-a1d9-80b81121f21a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'08ff97f7-17fc-4072-b29a-287135898ece', N'', N'RoleResource', 0, CAST(0x0000A67701809F05 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'fdf3aac3-4507-40ad-aa2f-d7f0459de252')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'bcda60f1-df3a-4e65-8b2f-287667123d44', N'', N'RoleModule', 0, CAST(0x0000A8B800B6720E AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4fde1dc6-9d73-4c7c-9238-28981858c5a6', N'', N'RoleModule', 0, CAST(0x0000A678009A5780 AS DateTime), 0, N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'89c3bfbe-246f-4112-8eb1-b6789da54202')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'09acad4e-54cf-4093-90ac-291f936bb205', N'', N'RoleModule', 0, CAST(0x0000A8B800B6783E AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'069475e3-c997-487a-9f29-e6a864c5c1d4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1d77af73-d689-46c4-81eb-293ea041a47b', N'', N'UserModule', 0, CAST(0x0000A8BD012EF27C AS DateTime), 0, N'72eeb055-2501-4f22-b858-3912c91c90d9', N'f2ead331-be3e-4049-9679-5cd32cfcfa3d')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5513924c-544f-4a0d-a596-297d13154574', N'', N'UserModule', 0, CAST(0x0000A8B800A93E71 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c96ab4ab-ed06-450e-8df0-2a1d7af47cf2', N'', N'RoleModule', 0, CAST(0x0000A8B800B65E51 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'bc80478d-0547-4437-9cff-be4b40144bdf')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'29898085-d8a2-4e8a-9d83-2a453f85ff7e', N'', N'UserModule', 0, CAST(0x0000A8B800A943A5 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'a22ca612-f402-4e46-8ac5-a79f65e9b5a8')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'fbfaaadc-8ab7-4d39-8c59-2ad4d2099547', N'', N'RoleElement', 0, CAST(0x0000A8B800B68CC4 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'17ae4fd4-ab4e-439e-ba1d-2a53b46d112b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1873ed85-a88a-4236-bd40-2c416aa2576c', N'', N'RoleModule', 0, CAST(0x0000A67501192770 AS DateTime), 0, N'211e12c7-e466-496e-8d26-0660a38e24cc', N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c9099371-8d4e-4f5b-9686-2c60a2c1c641', N'', N'ProcessUser', 0, CAST(0x0000A67B0114EBF4 AS DateTime), 0, N'10cc09fb-d469-41e5-ae3f-fdd805a4bd4c', N'3a95e392-07d4-4af3-b30d-140ca93340f5')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2ebff9a4-b2d5-4a35-a7dd-2cfa2f5b0522', N'', N'ProcessUser', 0, CAST(0x0000A67A01216463 AS DateTime), 0, N'52cc7933-a045-4dcc-8c17-1b618bfa772b', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ea9a1c1c-0376-49c4-bc40-2d48e506fb81', N'', N'RoleElement', 0, CAST(0x0000A8B800B6A0E7 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'c3d7b478-21e9-4c1e-b866-a3c80be7909b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c1c34446-90f2-4eab-8ca3-2f066e8adfe9', N'', N'RoleElement', 0, CAST(0x0000A8B800EFEF2D AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'4bfa8ea0-6b0d-426f-8687-b654575ca780')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'e54827cc-d2ed-470f-a063-2f4687a211a2', N'', N'RoleElement', 0, CAST(0x0000A8B800B68F43 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'c7d7daf0-3669-4a22-8bed-b092617deb9c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1c3ebe4b-bc6d-492b-b022-2f67185fadd7', N'', N'RoleElement', 0, CAST(0x0000A8B800F005CD AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'f8dde22a-2a37-47c4-8e67-70fb3af5303e')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'65e7e56c-fd17-49ba-b0ea-3101f9faaf56', N'', N'UserElement', 0, CAST(0x0000A8BE013E78D4 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'f168aa73-e530-4975-9b96-a5f8d8978cb0')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'376cf0ff-f981-452d-bc16-31dc3f4484db', N'', N'UserElement', 0, CAST(0x0000A8B70143EFE4 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'84694ea5-d6e1-4a65-8a59-7b5b779688d4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2d15e438-cc3a-41e9-9b13-325bfd5c804a', N'', N'RoleElement', 0, CAST(0x0000A6770180D68A AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'84e38920-f6e5-499c-bf52-a3c6f8499ff7')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'715d017a-68b6-468d-aa3f-32ca4cfd4b9e', N'', N'RoleModule', 0, CAST(0x0000A6770180AD28 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a083c809-b711-477e-9d2a-353f251ebdfd', N'', N'UserOrg', 0, CAST(0x0000A8B8014404D9 AS DateTime), 0, N'a3a0b75b-c154-49cd-bb37-e9328e5f015c', N'e3016789-2690-4247-816a-d20d5aed526d')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2a76857a-79f3-4066-a082-35e3e8e4e7cd', N'', N'RoleElement', 0, CAST(0x0000A8B800F00181 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'1a473afd-cbd4-41e9-9471-81f9435aaabe')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'7438018d-39da-40f9-b13a-36118ae3aba3', N'', N'RoleElement', 0, CAST(0x0000A8B800B69B17 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'daddf3b9-71b5-45ac-b85d-5a11c522f2f4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9ad706e3-8e6b-4bc7-a502-371b298ef062', N'', N'RoleElement', 0, CAST(0x0000A6770180DB22 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'ef42721f-d223-4a00-a1d9-80b81121f21a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a78da33a-9fc6-46fe-93ee-379c4e216ef1', N'', N'UserElement', 0, CAST(0x0000A8B701467861 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'44075557-496e-4dde-bb75-7b69f51ab4fe')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'015a860b-a534-4ca4-bc1a-37b5833fec4d', N'', N'UserModule', 0, CAST(0x0000A8BD0113BFDF AS DateTime), 0, N'1f121781-82de-45cc-94b7-78ae0c160df3', N'064acef9-0998-4f06-9051-f372468bc0fd')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'bd7370ef-14fd-4773-8cf6-3880f017ce93', N'', N'RoleElement', 0, CAST(0x0000A8B800B68D3B AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'c7123d75-dd86-4cf3-ac71-c11676cd3909')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'e6e689ce-6357-4571-83cb-39eedd3f5ff8', N'', N'RoleModule', 0, CAST(0x0000A8B800B65C8F AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'77bd93da-2c2b-4ba8-bf05-3a1382811a6a', N'', N'RoleModule', 0, CAST(0x0000A67501192799 AS DateTime), 0, N'211e12c7-e466-496e-8d26-0660a38e24cc', N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'51d39342-a91c-44f9-ba23-3a42ce70402f', N'', N'RoleModule', 0, CAST(0x0000A8B800B65DCB AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'aeb297df-8fe0-4a85-8e41-3c7adaf402a7', N'', N'UserResource', 0, CAST(0x0000A8BD012F21ED AS DateTime), 0, N'72eeb055-2501-4f22-b858-3912c91c90d9', N'8d57935a-f142-4e87-8e30-1b27da6f2532')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'84a52091-08a0-4a46-b661-3cd206771c29', N'', N'RoleModule', 0, CAST(0x0000A6770180AD28 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'0031262c-689c-4b96-bae2-2c9d67076ade')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'93bcac7a-0ff1-488c-8d1c-3da7e44cbefc', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4C AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'd1ba6a72-ba14-44c0-baba-46d0ad96fe8a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'8b95932c-f926-4a32-a147-3dae9d371b49', N'', N'UserElement', 0, CAST(0x0000A8B70143EEFD AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'daddf3b9-71b5-45ac-b85d-5a11c522f2f4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'82f76a84-d2d5-4e66-86f4-3db3399e5d4a', N'', N'RoleElement', 0, CAST(0x0000A8B800EFFEB4 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'44075557-496e-4dde-bb75-7b69f51ab4fe')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'965f010b-2fd6-4b34-ba23-3e44c1af2877', N'', N'RoleOrg', 0, CAST(0x0000A67B010CF904 AS DateTime), 0, N'36094f5d-07e7-40d5-91dc-ff60f98b496a', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ab2771bf-a2f3-45cd-9af3-3ecca589bec8', N'', N'RoleElement', 0, CAST(0x0000A8B800B6E8E9 AS DateTime), 0, N'c5bd908e-b126-41f1-aae0-c8249dfbb714', N'c4c1acbb-9cbf-4b1e-9cc0-ccf5ff544ec2')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c7b28a28-aade-49d6-a360-3eea8c0bbf1f', N'', N'RoleModule', 0, CAST(0x0000A8B800B6D0E7 AS DateTime), 0, N'6a579dcc-3e51-400a-814f-ffc5f5988b65', N'f2ead331-be3e-4049-9679-5cd32cfcfa3d')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'596845ca-dc9f-457c-a760-4009ac2c9991', N'', N'RoleModule', 0, CAST(0x0000A8B800B67503 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5a66c051-e709-460d-8d55-432e03d8f711', N'', N'UserModule', 0, CAST(0x0000A8BD01112FF1 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'064acef9-0998-4f06-9051-f372468bc0fd')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b1ae8ac0-5ce2-4199-b57f-4358dcacfe4e', N'', N'RoleElement', 0, CAST(0x0000A8B800B697C5 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'8966b04f-8e26-4046-8b03-0c64f9f833dd')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'0823a36b-605d-4c5e-ae45-43605f8a438a', N'', N'RoleElement', 0, CAST(0x0000A8B800EFFD9A AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'daddf3b9-71b5-45ac-b85d-5a11c522f2f4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'acc51898-5335-4903-83b9-4701a782bc4d', N'', N'UserElement', 0, CAST(0x0000A6A501186F28 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'fa816af1-a28d-47b5-9b8b-c46e18f902e9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ab84b111-fb5d-4ddd-99d5-479954d9d521', N'', N'RoleOrg', 0, CAST(0x0000A67B010CF908 AS DateTime), 0, N'36094f5d-07e7-40d5-91dc-ff60f98b496a', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b2edfee4-f980-4aa5-b547-492d677e0674', N'', N'RoleModule', 0, CAST(0x0000A6770180AD29 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4b10190b-9a4c-43a1-81a3-4a6bdf5362f8', N'', N'RoleElement', 0, CAST(0x0000A8B800B68DA7 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'd352c8ee-3dff-4d28-a0de-903ae68f2533')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'8bb79090-8333-4939-8945-4b568574536a', N'', N'RoleModule', 0, CAST(0x0000A8B800B6E080 AS DateTime), 0, N'c5bd908e-b126-41f1-aae0-c8249dfbb714', N'89c3bfbe-246f-4112-8eb1-b6789da54202')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'df8f3820-17b7-4f8d-aae8-4c749af81fa4', N'', N'UserElement', 0, CAST(0x0000A8B7014420FC AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'8966b04f-8e26-4046-8b03-0c64f9f833dd')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c6650484-7efe-4d40-b284-4dd8b31fc8ca', N'', N'UserRole', 0, CAST(0x0000A8B800F69EF5 AS DateTime), 0, N'1f121781-82de-45cc-94b7-78ae0c160df3', N'6a579dcc-3e51-400a-814f-ffc5f5988b65')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'04b258ee-c25b-4a2f-b9aa-5037d82276fe', N'', N'RoleElement', 0, CAST(0x0000A8B800B6AE3D AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'68484265-7802-4f06-b024-33e8b2f2edcf')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'16f84d72-5847-4651-a120-5095e30fed6a', N'', N'RoleElement', 0, CAST(0x0000A8B800B6AF7F AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'79ccd3eb-3aaf-4e08-83c9-713d8ff446fe')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'06f4c4a2-faa8-4bad-9184-50ceb517f30b', N'', N'ProcessUser', 0, CAST(0x0000A67B0114EBF5 AS DateTime), 0, N'10cc09fb-d469-41e5-ae3f-fdd805a4bd4c', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'0fa340a8-ff83-440e-ac9d-51dfd40eb0b6', N'', N'UserElement', 0, CAST(0x0000A8B800A961D9 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'd1ba6a72-ba14-44c0-baba-46d0ad96fe8a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'fc36152f-085c-4721-9b5e-52f267a8e4b5', N'', N'RoleElement', 0, CAST(0x0000A8B800B692BC AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'6839a297-350b-4215-b680-4e5dfdae5615')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'16154fc4-d18e-44a3-bcf2-5539b168aba7', N'', N'RoleElement', 0, CAST(0x0000A6A9011F1678 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'18cc3217-28a6-49b2-9a20-080230065984')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2014027e-0cff-41cf-974b-56126d6eaa9a', N'', N'RoleElement', 0, CAST(0x0000A678009A68AE AS DateTime), 0, N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'c4c1acbb-9cbf-4b1e-9cc0-ccf5ff544ec2')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'92f0b297-96c1-47d4-84dd-571374431bc0', N'', N'RoleElement', 0, CAST(0x0000A6770180D0EC AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'84694ea5-d6e1-4a65-8a59-7b5b779688d4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f5a48124-af1b-4579-b9b9-58a038a740cd', N'', N'UserElement', 0, CAST(0x0000A8BE013E77E2 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'682eae43-08ac-40e3-a037-5a2f6061cd02')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'08d97727-f142-447b-a659-59aa61d9ce17', N'', N'UserElement', 0, CAST(0x0000A8B800B43DD5 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'7b2b1ffb-398b-4f7b-83da-8f484e1bcea0')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'e3baa04d-1094-45c1-8577-5c199d997fa2', N'', N'RoleElement', 0, CAST(0x0000A8B800EFF23D AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'2feefce1-e3d8-42ac-b811-2352679628da')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'80310629-5e52-482c-9a0f-5c5bdfabcd9e', N'', N'RoleOrg', 0, CAST(0x0000A6780000006F AS DateTime), 0, N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1954964c-dced-4bb9-8356-5d040125f340', N'', N'RoleModule', 0, CAST(0x0000A8B800B6603E AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'f2ead331-be3e-4049-9679-5cd32cfcfa3d')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'da8c8fcb-924b-4078-b35e-5d143586e6ab', N'', N'RoleModule', 0, CAST(0x0000A8B800B67941 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'9486ff22-b696-4d7f-8093-8a3e53c45453')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'64e4f5aa-28ef-4690-9b20-5f0b543964f6', N'', N'UserElement', 0, CAST(0x0000A67A00FF85A6 AS DateTime), 0, N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', N'816b12b3-e916-446d-a2fa-329cfd13c831')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'dc50e158-fb3e-4397-b4aa-5f2f14d824d6', N'', N'RoleElement', 0, CAST(0x0000A8B800B693A6 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'fa816af1-a28d-47b5-9b8b-c46e18f902e9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5b469fca-cdfa-4194-9893-5fc40a383df9', N'', N'UserModule', 0, CAST(0x0000A8B800A9393C AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'cc2f87ac-08c6-4e6b-8907-6025954e63c0', N'', N'RoleElement', 0, CAST(0x0000A8B800EFFDEF AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'84694ea5-d6e1-4a65-8a59-7b5b779688d4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9edc7b81-2b51-4193-8805-6062e596ccdc', N'', N'UserOrg', 0, CAST(0x0000A67500E6096F AS DateTime), 0, N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5f147295-60b3-489d-97ac-607d83de8ebf', N'', N'RoleModule', 0, CAST(0x0000A8B800B65AA2 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ac184827-9899-4b40-8939-61fe9d2b187c', N'', N'UserElement', 0, CAST(0x0000A67A01258FB9 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'584c7a3b-d28a-47b4-8648-7797d05d83d1')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f6367ca1-0486-46a4-b9c6-65c00936a516', N'', N'RoleElement', 0, CAST(0x0000A6770180C462 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'9e2c6754-f258-4b14-96a0-b9d981196a65')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f9b03af0-06ce-4d7e-955e-6727a2422bd2', N'', N'RoleElement', 0, CAST(0x0000A8B800B698C4 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'3dc0ec4d-bf86-4bae-9ec0-1d6c2403fb99')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9d96893a-01de-4305-aca1-677ff5ca4502', N'', N'UserElement', 0, CAST(0x0000A8B800B43B2E AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'f8dde22a-2a37-47c4-8e67-70fb3af5303e')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'25351533-ba13-4ec8-a10b-68c7e0d114ad', N'', N'RoleElement', 0, CAST(0x0000A8B800EFF969 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'8966b04f-8e26-4046-8b03-0c64f9f833dd')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a8094b46-de5a-40ea-a8ee-69ea905480ef', N'', N'RoleModule', 0, CAST(0x0000A678009A5734 AS DateTime), 0, N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'069475e3-c997-487a-9f29-e6a864c5c1d4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'33a1d2ef-bbd8-435e-ac20-6bddf2abe5e7', N'', N'RoleElement', 0, CAST(0x0000A8B800B687C6 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'1c9acc3e-a40d-4d07-b495-6e60eb9b71b9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2f4ef0d9-1a30-414c-a095-6c560ae80a03', N'', N'RoleModule', 0, CAST(0x0000A8B800B65D65 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'0031262c-689c-4b96-bae2-2c9d67076ade')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9590e4c2-08c3-4797-9828-6cefe11345c9', N'', N'RoleElement', 0, CAST(0x0000A8B800B6948A AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'cf7388be-2677-427c-ad78-8f00f1062b96')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'361feb63-bde2-49c7-86ec-6df3ec6f0fe3', N'', N'RoleElement', 0, CAST(0x0000A6770180DB23 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'1c870438-4260-43a5-8996-a6e1dc8bbf6a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5167dbcd-3a32-4ae8-827e-6f381cc58fa2', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4E AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'fa816af1-a28d-47b5-9b8b-c46e18f902e9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4e613188-0387-4d17-a60d-703b4a606d75', N'', N'RoleModule', 0, CAST(0x0000A6770180AD29 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'bc80478d-0547-4437-9cff-be4b40144bdf')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'6d8858d2-657e-4ca6-ba87-70de0cdca6f2', N'', N'RoleElement', 0, CAST(0x0000A8B800B69328 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'34730f5a-d307-457b-9041-5f7de30abfa9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4c4e1d0d-569a-46c0-9de0-711c29b84af3', N'', N'RoleOrg', 0, CAST(0x0000A8B800B62DCA AS DateTime), 0, N'c5bd908e-b126-41f1-aae0-c8249dfbb714', N'bdc3b4ff-8b64-4906-bf5b-c68252bc3ae9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'72bf4729-af60-42f5-b0d7-717362ffad7f', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4C AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'2feefce1-e3d8-42ac-b811-2352679628da')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f579a427-a9ed-4ebe-8411-72e8e6abd01d', N'', N'UserElement', 0, CAST(0x0000A678010EA882 AS DateTime), 0, N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'816b12b3-e916-446d-a2fa-329cfd13c831')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'14c5edc6-b683-4186-ba3a-73739f3f2732', N'', N'RoleElement', 0, CAST(0x0000A8B800B68C3E AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'6c814946-db5c-48bd-84dd-b1c38196ad74')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'69f21c3d-e0e9-4c5b-b4ad-7463c4a50cf8', N'', N'RoleModule', 0, CAST(0x0000A8B800B67392 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'3de0359b-6331-4dc7-a00e-751f71dbadb5', N'', N'ProcessUser', 0, CAST(0x0000A68F009AC523 AS DateTime), 0, N'68295d2a-4dfd-4c5e-81e3-9c787e2603bc', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'af0b760a-798d-4a47-bae3-759c7984539b', N'', N'RoleElement', 0, CAST(0x0000A8B800B69F77 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'1a473afd-cbd4-41e9-9471-81f9435aaabe')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2a36a2b7-41aa-4190-b88c-75d44a56ad6e', N'', N'UserModule', 0, CAST(0x0000A7120003EDBE AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'92b00259-2d15-43e7-9321-adffb29e8bf2')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'190bf15f-c16c-4f66-a863-75ee339665ce', N'', N'RoleElement', 0, CAST(0x0000A8B800EFFA45 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'3dc0ec4d-bf86-4bae-9ec0-1d6c2403fb99')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'332a373c-f485-4f85-9af9-7792f7462bf1', N'', N'RoleModule', 0, CAST(0x0000A6750119308C AS DateTime), 0, N'648b04c4-4ac2-4d69-bef6-07081ef27871', N'89c3bfbe-246f-4112-8eb1-b6789da54202')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'6f25c189-0e01-4adc-89f4-77ba444e0dc6', N'', N'RoleModule', 0, CAST(0x0000A8B800B67695 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'f2ead331-be3e-4049-9679-5cd32cfcfa3d')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'47a85f85-f7b5-4184-90c4-7834918506a7', N'', N'RoleElement', 0, CAST(0x0000A8B800EFF5E6 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'cf7388be-2677-427c-ad78-8f00f1062b96')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c209264a-67e8-43e0-b1ce-7998fc930b4a', N'', N'RoleElement', 0, CAST(0x0000A8B800B6AC4F AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'c4c1acbb-9cbf-4b1e-9cc0-ccf5ff544ec2')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'539f4a5a-fae4-4af9-ad4d-7aacbb96c5ad', N'', N'RoleElement', 0, CAST(0x0000A8B800B6953C AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'50c9df24-b233-42cb-9a0d-4ce158c75f86')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5a20d59c-6ee6-4fe2-98fe-7b35b11026ae', N'', N'UserElement', 0, CAST(0x0000A67A00FF85A7 AS DateTime), 0, N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', N'68484265-7802-4f06-b024-33e8b2f2edcf')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'e28c0dcd-168a-4b60-a514-7b6eb8026709', N'', N'RoleOrg', 0, CAST(0x0000A6A200A5C1D7 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ec3b8ee8-008c-446b-b293-7bb505a72378', N'', N'RoleElement', 0, CAST(0x0000A8B800B6AB87 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'38109ca0-32ec-44bd-a243-017e591b532b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'7fd7f976-f10e-44aa-a7ba-7ca40d2e8f90', N'', N'RoleOrg', 0, CAST(0x0000A6A200A5C1D7 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f28a6f49-1939-4a90-b110-7d743e68cd46', N'', N'UserModule', 0, CAST(0x0000A8B800A93C07 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'7cbf5e6d-b12d-456a-a62e-7f1b5ae4c50e', N'', N'TenderUser', 0, CAST(0x0000A8BD0117808E AS DateTime), 0, N'86ab981c-bb6c-47f5-ac09-e0e21de2fabd', N'72eeb055-2501-4f22-b858-3912c91c90d9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'53b734e7-0236-4e28-947a-7f2e83aa6fe2', N'', N'RoleElement', 0, CAST(0x0000A8B800EFEFB4 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'9e2c6754-f258-4b14-96a0-b9d981196a65')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'd124f919-37c0-4730-b3e8-7f84ea89da02', N'', N'RoleElement', 0, CAST(0x0000A8B800F001E6 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'2d595a2a-5de5-479e-a331-b53c799a6b10')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'e84f6b9c-716d-4e94-a1aa-7fd0d1a2e23e', N'', N'RoleModule', 0, CAST(0x0000A6750119308B AS DateTime), 0, N'648b04c4-4ac2-4d69-bef6-07081ef27871', N'069475e3-c997-487a-9f29-e6a864c5c1d4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'7475b0c3-f204-4f95-a22f-80591fe76bc7', N'', N'ProcessUser', 0, CAST(0x0000A6B000C3BC6D AS DateTime), 0, N'b8bcdf59-1e29-4d97-a364-12ac8e8c5c61', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ad267296-5eba-4d59-b821-8148d8cfb3c6', N'', N'RoleModule', 0, CAST(0x0000A6770180AD28 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ec9c80ce-dbdf-4ba5-9091-82f75392c3b0', N'', N'UserElement', 0, CAST(0x0000A67A00FFA0E8 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'68484265-7802-4f06-b024-33e8b2f2edcf')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ae77f014-9da1-40b5-9b73-8317a07881f8', N'', N'RoleElement', 0, CAST(0x0000A8B800B68877 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'645b40ac-4223-44a7-aab4-66eb56cf9864')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'27c4d50c-32da-4dbc-88a1-84b343cdd649', N'', N'UserElement', 0, CAST(0x0000A6A501186D3A AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'6839a297-350b-4215-b680-4e5dfdae5615')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b059d798-9c6c-4a2d-863d-8524f4f3a7e0', N'', N'RoleElement', 0, CAST(0x0000A8B800B6E5A1 AS DateTime), 0, N'c5bd908e-b126-41f1-aae0-c8249dfbb714', N'68484265-7802-4f06-b024-33e8b2f2edcf')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'10e4e38a-df49-46f7-9929-852eafdf7da1', N'', N'RoleModule', 0, CAST(0x0000A85C0126B775 AS DateTime), 0, N'eee075fa-f468-42cf-8e30-42980f5a7a3b', N'f2ead331-be3e-4049-9679-5cd32cfcfa3d')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1acec4c4-0136-4e2b-a839-8676dbd6594a', N'', N'ProcessUser', 0, CAST(0x0000A68100BFD09D AS DateTime), 0, N'6c6afe3c-349c-4198-8710-cf19c90f3afd', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b8b6308d-8a10-41ca-99b1-86f52577cd04', N'', N'RoleModule', 0, CAST(0x0000A8B800B678A5 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'89c3bfbe-246f-4112-8eb1-b6789da54202')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c796fe1b-6747-487a-8c76-88c06a3ed787', N'', N'RoleElement', 0, CAST(0x0000A8B800B6E5EC AS DateTime), 0, N'c5bd908e-b126-41f1-aae0-c8249dfbb714', N'79ccd3eb-3aaf-4e08-83c9-713d8ff446fe')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'6431a464-6f1f-4ffc-8157-89212b70f09a', N'', N'RoleOrg', 0, CAST(0x0000A6780000006F AS DateTime), 0, N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'41aa570e-ebd9-4623-91a9-8927f991e28b', N'', N'RoleModule', 0, CAST(0x0000A8B800B6749A AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'bc80478d-0547-4437-9cff-be4b40144bdf')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ac0b0ce3-ff38-4a7c-a575-8a651482b110', N'', N'RoleModule', 0, CAST(0x0000A8B800B6742D AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'639454cd-b3f4-4371-b4ea-8ab3ad35b739', N'', N'RoleElement', 0, CAST(0x0000A8B800EFF6EC AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'34730f5a-d307-457b-9041-5f7de30abfa9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'620b368a-7b56-4c74-ab85-8bc91d08ddc9', N'', N'RoleElement', 0, CAST(0x0000A6770180B64A AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'1c9acc3e-a40d-4d07-b495-6e60eb9b71b9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5ebd0320-73df-4cad-87da-8f9ccd3dfaa9', N'', N'RoleElement', 0, CAST(0x0000A8B800EFF9C9 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'9c96e485-84a6-45f0-b6a7-f01dab94b0c6')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'340c60fe-8b95-474c-aa04-9197903998d2', N'', N'RoleModule', 0, CAST(0x0000A6770180AD27 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'6474a95d-aabb-4454-8e2b-921e74092367', N'', N'RoleElement', 0, CAST(0x0000A8B800B6E7E3 AS DateTime), 0, N'c5bd908e-b126-41f1-aae0-c8249dfbb714', N'6db928fe-93df-460f-9472-8bb0b6cae52c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'd36779be-58b9-494d-a2f6-936e7a39b8a6', N'', N'RoleElement', 0, CAST(0x0000A8B800B68FC8 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'4bfa8ea0-6b0d-426f-8687-b654575ca780')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'28921a94-a010-46c5-a6df-9384e041bfdc', N'', N'RoleModule', 0, CAST(0x0000A8B800B6D13B AS DateTime), 0, N'6a579dcc-3e51-400a-814f-ffc5f5988b65', N'9a360757-bbd8-4404-95ae-9c5e338ed5cc')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'bee6572d-8fb8-4e0e-af15-93aafc989717', N'', N'RoleElement', 0, CAST(0x0000A6770180B649 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'68fc793f-069f-43e1-a012-42ac2d7c585c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f4ba636a-9002-43e6-93eb-95132a3e68c5', N'', N'ProcessUser', 0, CAST(0x0000A68F009AC522 AS DateTime), 0, N'68295d2a-4dfd-4c5e-81e3-9c787e2603bc', N'3a95e392-07d4-4af3-b30d-140ca93340f5')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'0fd5b371-b010-4846-8833-95cc1e813a32', N'', N'UserElement', 0, CAST(0x0000A67A00FFC7A6 AS DateTime), 0, N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'68484265-7802-4f06-b024-33e8b2f2edcf')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c8d6e292-c120-4cf4-827f-97e6ccfeb021', N'', N'UserElement', 0, CAST(0x0000A8B800B43BA1 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'1c870438-4260-43a5-8996-a6e1dc8bbf6a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'd1701146-6e6c-4589-90d3-97fe6afd589f', N'', N'RoleModule', 0, CAST(0x0000A8B800B66349 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'9486ff22-b696-4d7f-8093-8a3e53c45453')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'd30f901c-049a-4e49-a302-984d1c3356a2', N'', N'RoleElement', 0, CAST(0x0000A8B800B69F2D AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'2d595a2a-5de5-479e-a331-b53c799a6b10')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2928ca1f-0185-4697-8f18-98a09c1965e6', N'', N'RoleModule', 0, CAST(0x0000A8B800B6E022 AS DateTime), 0, N'c5bd908e-b126-41f1-aae0-c8249dfbb714', N'069475e3-c997-487a-9f29-e6a864c5c1d4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'54b2e9b6-1f7c-4a39-92c9-98f58429c1fc', N'', N'RoleModule', 0, CAST(0x0000A6750119279A AS DateTime), 0, N'211e12c7-e466-496e-8d26-0660a38e24cc', N'bc80478d-0547-4437-9cff-be4b40144bdf')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'7e0a3c9b-70f0-4cf3-a2a9-992ba7a9ccb0', N'', N'RoleElement', 0, CAST(0x0000A8B800B69BF6 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'84694ea5-d6e1-4a65-8a59-7b5b779688d4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'854e0658-ab8a-4869-b157-9941955acdc6', N'', N'RoleElement', 0, CAST(0x0000A6770180D689 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'1a473afd-cbd4-41e9-9471-81f9435aaabe')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1b411470-c2ba-4ff3-8159-994de42ca04b', N'', N'UserModule', 0, CAST(0x0000A8BD012F0442 AS DateTime), 0, N'72eeb055-2501-4f22-b858-3912c91c90d9', N'a22ca612-f402-4e46-8ac5-a79f65e9b5a8')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'74fae7d2-121c-4e34-aec2-99c1e0f88c61', N'', N'RoleElement', 0, CAST(0x0000A8B800B69059 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'9e2c6754-f258-4b14-96a0-b9d981196a65')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'acb4d37f-8b45-4a99-b364-99f3881dfcda', N'', N'RoleElement', 0, CAST(0x0000A6770180DB1A AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'f8dde22a-2a37-47c4-8e67-70fb3af5303e')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'bb8fde8e-82cc-4dc9-ab44-9b6310c5d06f', N'', N'RoleOrg', 0, CAST(0x0000A8B800B5F5B3 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'4fe12558-ca66-4dc2-9690-f6be6e7fb968')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f4fd8395-f447-4637-83bd-9cb3f1a66ff7', N'', N'UserElement', 0, CAST(0x0000A8B70142B595 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'4f2737db-633f-4946-8a71-b08b9885f151')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9fa50449-5d87-4579-9f1f-9cdcd876976b', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4D AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'6839a297-350b-4215-b680-4e5dfdae5615')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'10e58d75-dec1-4b85-882f-9dac79ad1210', N'', N'RoleResource', 0, CAST(0x0000A6A6012AE37E AS DateTime), 0, N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'ec99f670-0eca-465c-9f64-d4d5dc510b83')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'cc765af2-d918-4b14-a7d5-9f63a2f46f1e', N'', N'RoleElement', 0, CAST(0x0000A8B800B69B72 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'5ed1681c-13d2-4c87-8675-a8d95c0b40ae')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'734436fe-c51e-4e5f-a01f-a085bfb31206', N'', N'RoleElement', 0, CAST(0x0000A8B800EFE754 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'68fc793f-069f-43e1-a012-42ac2d7c585c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c3050d65-d26b-4e46-bece-a212b0cc00ec', N'', N'RoleElement', 0, CAST(0x0000A6770180B648 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'15a4f88c-4fae-4cab-ba2f-0cbd2cca8736')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'dfc680a9-117b-42bd-a109-a2594285dfcf', N'', N'RoleModule', 0, CAST(0x0000A8B800B6E0D3 AS DateTime), 0, N'c5bd908e-b126-41f1-aae0-c8249dfbb714', N'9486ff22-b696-4d7f-8093-8a3e53c45453')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'66e25fc5-093d-42ab-85dc-a38f6600889b', N'', N'UserOrg', 0, CAST(0x0000A67500E6096F AS DateTime), 0, N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'c36e43df-3a99-45da-80d9-3ac5d24f4014')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f87972df-6402-44c8-ad84-a557c77ab171', N'', N'RoleElement', 0, CAST(0x0000A8B800EFEE47 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'c7d7daf0-3669-4a22-8bed-b092617deb9c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c4771ac5-3375-4de9-adb8-a603398f0d62', N'', N'RoleElement', 0, CAST(0x0000A6770180D68B AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'2d595a2a-5de5-479e-a331-b53c799a6b10')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'3db61cee-3e5f-473d-ac6d-a93b0cde6274', N'', N'RoleElement', 0, CAST(0x0000A8B800F0056D AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'1c870438-4260-43a5-8996-a6e1dc8bbf6a')
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a324fd8d-cbb3-4299-9137-aac58f72071b', N'', N'UserElement', 0, CAST(0x0000A8BE013E73CD AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'0c847b1e-cb7a-4f7d-861e-130b3e16d7e5')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c3bae465-d567-4679-b07f-ad1de7827022', N'', N'RoleElement', 0, CAST(0x0000A8B800B6925C AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'2feefce1-e3d8-42ac-b811-2352679628da')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a9821db0-49bd-49be-a554-afa811c99760', N'', N'RoleResource', 0, CAST(0x0000A67701809F05 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'ec99f670-0eca-465c-9f64-d4d5dc510b83')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9d568d6d-d78d-47d6-8fb6-b1327cdbe83a', N'', N'RoleModule', 0, CAST(0x0000A6770180AD29 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'03be9b5e-38b0-4525-8431-b26d35ce6ce3', N'', N'UserElement', 0, CAST(0x0000A67A00FFA0E8 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'816b12b3-e916-446d-a2fa-329cfd13c831')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f70eb4f3-7816-4493-a3b3-b289825214f4', N'', N'UserElement', 0, CAST(0x0000A8BD0113F8D8 AS DateTime), 0, N'1f121781-82de-45cc-94b7-78ae0c160df3', N'f168aa73-e530-4975-9b96-a5f8d8978cb0')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'653824c1-cb55-4978-9abb-b3135ffaa58c', N'', N'RoleElement', 0, CAST(0x0000A8B800EFE2C5 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'0d25438e-1436-48e0-aedf-0f1690693282')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'eead7ad1-75b5-4494-bcf3-b98dd2f49ede', N'', N'UserModule', 0, CAST(0x0000A8BD012F3111 AS DateTime), 0, N'72eeb055-2501-4f22-b858-3912c91c90d9', N'064acef9-0998-4f06-9051-f372468bc0fd')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'75340ad3-fb80-4646-b1de-ba801688ddc2', N'', N'RoleElement', 0, CAST(0x0000A6770180D0ED AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'5ed1681c-13d2-4c87-8675-a8d95c0b40ae')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4d688aa9-9540-4ec5-8fab-bb33ade63dad', N'', N'UserElement', 0, CAST(0x0000A8BD0113F384 AS DateTime), 0, N'1f121781-82de-45cc-94b7-78ae0c160df3', N'f4903ce2-ade1-45a2-8df1-41ef11a98400')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'aa051096-a23a-431d-9053-bb954f9453a7', N'', N'RoleElement', 0, CAST(0x0000A6770180C45E AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'4bfa8ea0-6b0d-426f-8687-b654575ca780')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'6cf31fe2-9829-4391-8599-bd9e12076f23', N'', N'RoleElement', 0, CAST(0x0000A8B800EFF37A AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'50c9df24-b233-42cb-9a0d-4ce158c75f86')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'bb409667-cb88-4fc8-b123-bea2f84d8c30', N'', N'RoleModule', 0, CAST(0x0000A8B800B660B7 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'9a360757-bbd8-4404-95ae-9c5e338ed5cc')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ec72f6ae-09ee-4db9-99a1-bf15c8e35dda', N'', N'ProcessUser', 0, CAST(0x0000A68100BFD097 AS DateTime), 0, N'6c6afe3c-349c-4198-8710-cf19c90f3afd', N'3a95e392-07d4-4af3-b30d-140ca93340f5')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2ca288a6-d222-4328-951e-c01c3e77a0c7', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4D AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'7f071c63-1620-4486-9264-5806b2e63218')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'91d0bf92-81b3-40de-84e3-c0616e7dc5c1', N'', N'UserElement', 0, CAST(0x0000A8B70142B476 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'3dc0ec4d-bf86-4bae-9ec0-1d6c2403fb99')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f36e988c-c95f-4e62-a3a1-c0b2c97e4d19', N'', N'RoleOrg', 0, CAST(0x0000A8B800B6165C AS DateTime), 0, N'6a579dcc-3e51-400a-814f-ffc5f5988b65', N'28861245-7fcb-4cb5-89b0-558280e2427f')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c11721e7-541e-4e77-a3a9-c291895e3974', N'', N'RoleElement', 0, CAST(0x0000A8B800B6A3C1 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'1c870438-4260-43a5-8996-a6e1dc8bbf6a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'8b633f3c-965b-4e35-8496-c364890d7760', N'', N'RoleElement', 0, CAST(0x0000A6770180D68A AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'c3d7b478-21e9-4c1e-b866-a3c80be7909b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'16c90406-db1d-4966-a1bb-c396282b738f', N'', N'UserElement', 0, CAST(0x0000A8B7015318ED AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'2feefce1-e3d8-42ac-b811-2352679628da')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'7f25286f-246b-4143-98eb-c3e574fe7455', N'', N'ProcessUser', 0, CAST(0x0000A67A01216457 AS DateTime), 0, N'52cc7933-a045-4dcc-8c17-1b618bfa772b', N'3a95e392-07d4-4af3-b30d-140ca93340f5')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'178e9c94-8da6-467a-9808-c4b5ff73e81a', N'', N'UserModule', 0, CAST(0x0000A8BD01113179 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'58040353-4599-4bf5-80c0-e329491e6454')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'cc17c2d9-d817-470d-a3a2-c4e09018afc2', N'', N'RoleModule', 0, CAST(0x0000A8B800B662DF AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'89c3bfbe-246f-4112-8eb1-b6789da54202')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'997efe65-ed03-49f1-b223-c534e4d6384f', N'', N'RoleElement', 0, CAST(0x0000A8B800B6A009 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'84e38920-f6e5-499c-bf52-a3c6f8499ff7')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'10affd9c-377c-42af-9950-c6e0d9c31265', N'', N'UserRole', 0, CAST(0x0000A8B800A8F5B1 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'4980a85b-e3db-4607-bc2c-0baf0140d7df')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ad5bc7a6-e307-4fa8-a4ef-ce9e09f7e21b', N'', N'RoleModule', 0, CAST(0x0000A678009A577F AS DateTime), 0, N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'9486ff22-b696-4d7f-8093-8a3e53c45453')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5645fd19-5ff9-4f55-8e78-cf2281a43e71', N'', N'UserOrg', 0, CAST(0x0000A8B900BEB80C AS DateTime), 0, N'72eeb055-2501-4f22-b858-3912c91c90d9', N'e3016789-2690-4247-816a-d20d5aed526d')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c98b3d02-a76b-4ecc-94a5-cfeffd5e29fb', N'', N'RoleModule', 0, CAST(0x0000A67501192798 AS DateTime), 0, N'211e12c7-e466-496e-8d26-0660a38e24cc', N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1f90e2c4-e994-4182-878f-d02f74def511', N'', N'UserModule', 0, CAST(0x0000A8B800A93DDD AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'0031262c-689c-4b96-bae2-2c9d67076ade')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ee6b4902-aa29-4184-a365-d03601271c2d', N'', N'RoleElement', 0, CAST(0x0000A8B800B6A354 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'f8dde22a-2a37-47c4-8e67-70fb3af5303e')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'55bbb00e-7974-4edb-a9b2-d10f5a996101', N'', N'RoleModule', 0, CAST(0x0000A8B800B6761D AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'a22ca612-f402-4e46-8ac5-a79f65e9b5a8')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'549b4f66-9a5f-49d9-b419-d1182c6bdf11', N'', N'RoleModule', 0, CAST(0x0000A8B800B6D084 AS DateTime), 0, N'6a579dcc-3e51-400a-814f-ffc5f5988b65', N'a22ca612-f402-4e46-8ac5-a79f65e9b5a8')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'649d669c-b927-46eb-9fdc-d11e83a1d919', N'', N'RoleModule', 0, CAST(0x0000A8B800B65B3A AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4fa15ae0-ef9c-4ec8-a1a7-d52126d3b830', N'', N'RoleElement', 0, CAST(0x0000A8B800EFE342 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'1c9acc3e-a40d-4d07-b495-6e60eb9b71b9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'944080a1-f9de-4f44-be4a-d5d1f8bfff76', N'', N'RoleElement', 0, CAST(0x0000A8B800B68917 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'68fc793f-069f-43e1-a012-42ac2d7c585c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ee4f39fd-4fbf-4f68-9a70-d6c7d7db9723', N'', N'ProcessUser', 0, CAST(0x0000A6B000C3BC6C AS DateTime), 0, N'b8bcdf59-1e29-4d97-a364-12ac8e8c5c61', N'3a95e392-07d4-4af3-b30d-140ca93340f5')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5116c76b-d327-421c-93ef-d7c7f628b6d6', N'', N'RoleElement', 0, CAST(0x0000A8B800F006C3 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'7b2b1ffb-398b-4f7b-83da-8f484e1bcea0')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c2d3b7d6-b47d-4bd8-9dc6-d9134d86713f', N'', N'RoleOrg', 0, CAST(0x0000A6A200A5C1D7 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'86449128-d5ac-44bf-b999-f7735b7458fd')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9dec61e4-9dae-41e6-8c2c-da7b70ac51f4', N'', N'TenderUser', 0, CAST(0x0000A8BD01178090 AS DateTime), 0, N'86ab981c-bb6c-47f5-ac09-e0e21de2fabd', N'a3a0b75b-c154-49cd-bb37-e9328e5f015c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'90df8372-15c3-4e88-b95a-dc7949a3fa31', N'', N'RoleElement', 0, CAST(0x0000A8B800F00376 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'c3d7b478-21e9-4c1e-b866-a3c80be7909b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'95203537-af86-482e-9eb1-dd6f4c4e9490', N'', N'UserOrg', 0, CAST(0x0000A8B800F09322 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'4fe12558-ca66-4dc2-9690-f6be6e7fb968')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9a477264-0f4d-4564-b61f-dee13c4cfa9f', N'', N'RoleModule', 0, CAST(0x0000A8B800B65C2F AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'92b00259-2d15-43e7-9321-adffb29e8bf2')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'8531aee8-78df-4eef-83c5-e33ef3d03925', N'', N'RoleElement', 0, CAST(0x0000A8B800B6E886 AS DateTime), 0, N'c5bd908e-b126-41f1-aae0-c8249dfbb714', N'38109ca0-32ec-44bd-a243-017e591b532b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a06fe8c6-3f5e-4085-9bbf-e366571a356c', N'', N'RoleElement', 0, CAST(0x0000A6770180D0EB AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'daddf3b9-71b5-45ac-b85d-5a11c522f2f4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c58cb482-6ab7-49eb-b5b0-e45424b6e502', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4E AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'34730f5a-d307-457b-9041-5f7de30abfa9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'30c82d18-7892-4e5f-9aee-e4f483a858c2', N'', N'UserModule', 0, CAST(0x0000A678010E8402 AS DateTime), 0, N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'9486ff22-b696-4d7f-8093-8a3e53c45453')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'09c55815-0113-4478-9595-e56e3d0284c4', N'', N'UserElement', 0, CAST(0x0000A8BE013E76B3 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'f4903ce2-ade1-45a2-8df1-41ef11a98400')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c50fae2a-b36f-486f-9d53-e58406590101', N'', N'ProcessUser', 0, CAST(0x0000A6AC0114D121 AS DateTime), 0, N'054ff054-d8ae-4911-a596-8fb1f66b348f', N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'59dee201-423c-4bb9-9ccb-e73610d55327', N'', N'RoleModule', 0, CAST(0x0000A8B800B65EBF AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'55b10ecc-3fb3-4127-b69e-e7a3467d7a1a', N'', N'RoleElement', 0, CAST(0x0000A678009A68AE AS DateTime), 0, N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'6db928fe-93df-460f-9472-8bb0b6cae52c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'83317496-d365-464b-9726-e805a9369248', N'', N'UserElement', 0, CAST(0x0000A8BD0113F4DF AS DateTime), 0, N'1f121781-82de-45cc-94b7-78ae0c160df3', N'81c63a9b-c5b6-4259-813c-28cd59cb1755')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1d533d1e-fee4-4894-9aca-e81afdb71266', N'', N'RoleElement', 0, CAST(0x0000A8B800EFE3E6 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'645b40ac-4223-44a7-aab4-66eb56cf9864')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'87d4de3a-d324-43fb-966a-e90f2072739e', N'', N'RoleElement', 0, CAST(0x0000A8B800B69CF9 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'44075557-496e-4dde-bb75-7b69f51ab4fe')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'56158ce1-3add-44b2-bdc4-eb1979e7c3a9', N'', N'RoleModule', 0, CAST(0x0000A8B800B65BA4 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ab924ba7-8a74-4804-82b0-ecbbedf4c13e', N'', N'RoleElement', 0, CAST(0x0000A678009A68AD AS DateTime), 0, N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'38109ca0-32ec-44bd-a243-017e591b532b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a0904102-e26a-4bc5-9c95-ed5ef977586b', N'', N'RoleModule', 0, CAST(0x0000A6750119279A AS DateTime), 0, N'211e12c7-e466-496e-8d26-0660a38e24cc', N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'6b9c4789-042c-4f6f-a749-ee68ee87462d', N'', N'ProcessUser', 0, CAST(0x0000A6AC0114D121 AS DateTime), 0, N'054ff054-d8ae-4911-a596-8fb1f66b348f', N'3a95e392-07d4-4af3-b30d-140ca93340f5')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'8548dd9a-5177-42a0-abbe-ef3bb58aada3', N'', N'RoleModule', 0, CAST(0x0000A85C0126B62D AS DateTime), 0, N'eee075fa-f468-42cf-8e30-42980f5a7a3b', N'a22ca612-f402-4e46-8ac5-a79f65e9b5a8')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'96a7a4fb-96b7-4b1b-974b-f0293dccb3f2', N'', N'RoleModule', 0, CAST(0x0000A8B800B66268 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'069475e3-c997-487a-9f29-e6a864c5c1d4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9819fee3-42cc-409c-82df-f07d8e5ef161', N'', N'RoleModule', 0, CAST(0x0000A8B800B671A1 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'48b80b2c-10ce-4f16-833c-f0c1a440db16', N'', N'RoleModule', 0, CAST(0x0000A85C012711DC AS DateTime), 0, N'eee075fa-f468-42cf-8e30-42980f5a7a3b', N'92b00259-2d15-43e7-9321-adffb29e8bf2')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9d3d443c-2610-45ad-85b9-f2489f625046', N'', N'RoleElement', 0, CAST(0x0000A8B800EFFF30 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'5ed1681c-13d2-4c87-8675-a8d95c0b40ae')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c162f21a-16b8-41af-8458-f2be7599436a', N'', N'UserModule', 0, CAST(0x0000A8B800A939FC AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'dba6582a-c2f3-415c-a814-f3624299d2ef', N'', N'UserModule', 0, CAST(0x0000A8B800A93AD9 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'e12b77de-b7ce-4f38-b7a3-f3b2d285f33b', N'', N'RoleOrg', 0, CAST(0x0000A6A200A5D841 AS DateTime), 0, N'2eb423d6-6ad9-4efe-b423-872478a2a434', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'd5fd619c-18d0-4683-8d33-f5c7c90903d1', N'', N'RoleModule', 0, CAST(0x0000A8B800B65FD8 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'a22ca612-f402-4e46-8ac5-a79f65e9b5a8')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'cac20cbb-8e5e-4c51-9927-f609ab4d2214', N'', N'UserOrg', 0, CAST(0x0000A8B800F48655 AS DateTime), 0, N'1f121781-82de-45cc-94b7-78ae0c160df3', N'bdc3b4ff-8b64-4906-bf5b-c68252bc3ae9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ad29467e-eeee-494c-ab82-f6be5d2619d5', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4D AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'50c9df24-b233-42cb-9a0d-4ce158c75f86')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9a179125-f86c-454e-b9b5-f71bb5b31a16', N'', N'RoleElement', 0, CAST(0x0000A8B800B6ABF7 AS DateTime), 0, N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'6db928fe-93df-460f-9472-8bb0b6cae52c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'3d72150b-29d4-4c36-ace2-f7fa42fe0503', N'', N'UserModule', 0, CAST(0x0000A8B800A93FF2 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'297d60fc-dd84-42bf-aecc-fab3ddb78b8b', N'', N'RoleOrg', 0, CAST(0x0000A85C01244032 AS DateTime), 0, N'eee075fa-f468-42cf-8e30-42980f5a7a3b', N'01fe576c-1d78-4073-a6a4-551ffc9b5b25')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'31993e67-37fc-448b-b7a1-fb9abfd15334', N'', N'RoleElement', 0, CAST(0x0000A8B800B6E544 AS DateTime), 0, N'c5bd908e-b126-41f1-aae0-c8249dfbb714', N'816b12b3-e916-446d-a2fa-329cfd13c831')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c3c44b7f-3aa1-43bf-a97a-fd338fff7821', N'', N'RoleElement', 0, CAST(0x0000A8B800B6E6AD AS DateTime), 0, N'c5bd908e-b126-41f1-aae0-c8249dfbb714', N'584c7a3b-d28a-47b4-8648-7797d05d83d1')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'65dee789-f965-42f2-9771-fe116d2eee3e', N'', N'UserModule', 0, CAST(0x0000A8B800A9443A AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'f2ead331-be3e-4049-9679-5cd32cfcfa3d')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c6419533-920c-4803-9f97-fe7768aa7a6c', N'', N'RoleModule', 0, CAST(0x0000A8B800B67563 AS DateTime), 0, N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'0031262c-689c-4b96-bae2-2c9d67076ade')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'88a4c966-d042-4a2e-b133-ff7eded1c5de', N'', N'RoleElement', 0, CAST(0x0000A6770180DB23 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'7b2b1ffb-398b-4f7b-83da-8f484e1bcea0')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2d06e2e5-9451-4e01-9d32-ffe880869a10', N'', N'UserElement', 0, CAST(0x0000A8B7014220E0 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'34730f5a-d307-457b-9041-5f7de30abfa9')
INSERT [dbo].[Resource] ([Id], [CascadeId], [Key], [Name], [Status], [SortNo], [Description], [ParentId], [CategoryId]) VALUES (N'8d57935a-f142-4e87-8e30-1b27da6f2532', N'', N'LOOK', N'查看所有标书', 0, 0, N'', NULL, N'8fe31cfe-b117-4875-a29a-cc16f33ae11d')
INSERT [dbo].[Resource] ([Id], [CascadeId], [Key], [Name], [Status], [SortNo], [Description], [ParentId], [CategoryId]) VALUES (N'ec99f670-0eca-465c-9f64-d4d5dc510b83', N'', N'DEV', N'开发可见', 0, 0, N'仅开发维护可见的内容', NULL, N'fa37b322-508b-47ce-b29f-b1dacb82637a')
INSERT [dbo].[Resource] ([Id], [CascadeId], [Key], [Name], [Status], [SortNo], [Description], [ParentId], [CategoryId]) VALUES (N'fdf3aac3-4507-40ad-aa2f-d7f0459de252', N'', N'ADMIN', N'管理层可见', 0, 0, N'仅管理层可见的内容', NULL, N'fa37b322-508b-47ce-b29f-b1dacb82637a')
INSERT [dbo].[Role] ([Id], [Name], [Status], [Type], [CreateTime], [CreateId]) VALUES (N'2f83875d-66db-4610-8ce8-1a62e2bedfad', N'董事长', 0, 0, CAST(0x0000A8B800B63E87 AS DateTime), N'')
INSERT [dbo].[Role] ([Id], [Name], [Status], [Type], [CreateTime], [CreateId]) VALUES (N'e520aff2-ac08-43f6-a57b-4bf8392bbad0', N'管理员', 0, 0, CAST(0x0000A8B800B5F5A5 AS DateTime), N'')
INSERT [dbo].[Role] ([Id], [Name], [Status], [Type], [CreateTime], [CreateId]) VALUES (N'c5bd908e-b126-41f1-aae0-c8249dfbb714', N'普通员工二', 0, 0, CAST(0x0000A8B800B62DC6 AS DateTime), N'')
INSERT [dbo].[Role] ([Id], [Name], [Status], [Type], [CreateTime], [CreateId]) VALUES (N'6a579dcc-3e51-400a-814f-ffc5f5988b65', N'普通员工', 0, 0, CAST(0x0000A8B800B61659 AS DateTime), N'')
INSERT [dbo].[TenderInfo] ([Id], [Description], [StartTime], [EndTime], [Cycle], [State], [FirstUser], [SecondUser], [CreateDate], [CreateUser], [Title]) VALUES (N'e4582a9e-80ee-4b07-b06e-6217c0ed2c9c', N'而我却二无QQ', CAST(0x0000A8BA0171A038 AS DateTime), CAST(0x0000A8BD0171A164 AS DateTime), N'1', 2, N'', N'', CAST(0x0000A8BA0172A7E4 AS DateTime), N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'第一条标书')
INSERT [dbo].[TenderInfo] ([Id], [Description], [StartTime], [EndTime], [Cycle], [State], [FirstUser], [SecondUser], [CreateDate], [CreateUser], [Title]) VALUES (N'86ab981c-bb6c-47f5-ac09-e0e21de2fabd', N'test2发布的一条标书', CAST(0x0000A8BF0114336C AS DateTime), CAST(0x0000A8C201143A74 AS DateTime), N'1', 1, N'', N'', CAST(0x0000A8BD011464A4 AS DateTime), N'1f121781-82de-45cc-94b7-78ae0c160df3', N'test2的标书啊啊')
INSERT [dbo].[TenderUser] ([Id], [Name], [Company], [ContactPerson], [ContactNum], [BusinessLicense], [CashDeposit]) VALUES (N'72eeb055-2501-4f22-b858-3912c91c90d9', N'22', N'2', N'2', N'2', N'/uploadfile/20180410/7721f9882e8c4f96b956eeb4d4e712b0.jpg', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[TenderUser] ([Id], [Name], [Company], [ContactPerson], [ContactNum], [BusinessLicense], [CashDeposit]) VALUES (N'a3a0b75b-c154-49cd-bb37-e9328e5f015c', N'1', N'1', N'1', N'1', N'2018_04_05/b21a5214c440480189af4594a413649a.jpg', CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[User] ([Id], [Account], [Password], [Name], [Sex], [Status], [Type], [BizCode], [CreateTime], [CrateId]) VALUES (N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'admin', N'E1ADC3949BA59ABBE56E057F2F883E', N'admin', 0, 0, 0, N'', CAST(0x0000A67500E5CD17 AS DateTime), NULL)
INSERT [dbo].[User] ([Id], [Account], [Password], [Name], [Sex], [Status], [Type], [BizCode], [CreateTime], [CrateId]) VALUES (N'72eeb055-2501-4f22-b858-3912c91c90d9', N'用户二', N'E1ADC3949BA59ABBE56E057F2F883E', N'用户二', 0, 0, 0, N'', CAST(0x0000A8B900BEB796 AS DateTime), NULL)
INSERT [dbo].[User] ([Id], [Account], [Password], [Name], [Sex], [Status], [Type], [BizCode], [CreateTime], [CrateId]) VALUES (N'1f121781-82de-45cc-94b7-78ae0c160df3', N'test2', N'E1ADC3949BA59ABBE56E057F2F883E', N'测试2', 0, 0, 0, N'', CAST(0x0000A8B800F481DC AS DateTime), NULL)
INSERT [dbo].[User] ([Id], [Account], [Password], [Name], [Sex], [Status], [Type], [BizCode], [CreateTime], [CrateId]) VALUES (N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'testno', N'E1ADC3949BA59ABBE56E057F2F883E', N'testno(无任何权限)', 0, 0, 0, N'', CAST(0x0000A67500E6096C AS DateTime), NULL)
INSERT [dbo].[User] ([Id], [Account], [Password], [Name], [Sex], [Status], [Type], [BizCode], [CreateTime], [CrateId]) VALUES (N'a3a0b75b-c154-49cd-bb37-e9328e5f015c', N'Customer1', N'E1ADC3949BA59ABBE56E057F2F883E', N'用户一', 0, 0, 0, N'', CAST(0x0000A8B80143BFB5 AS DateTime), NULL)
ALTER TABLE [dbo].[BidInfo] ADD  CONSTRAINT [DF_BidInfo_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[BidInfo] ADD  CONSTRAINT [DF_BidInfo_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BidInfo] ADD  CONSTRAINT [DF_BidInfo_EndTime]  DEFAULT (getdate()) FOR [EndTime]
GO
ALTER TABLE [dbo].[BidInfo] ADD  CONSTRAINT [DF_BidInfo_State]  DEFAULT ((0)) FOR [State]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF__Category__Cascad__34D3C6C9]  DEFAULT (' ') FOR [CascadeId]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF__Category__Name__35C7EB02]  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF__Category__Status__37B03374]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF__Category__SortNo__38A457AD]  DEFAULT ((0)) FOR [SortNo]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF__Category__RootKe__39987BE6]  DEFAULT (' ') FOR [RootKey]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF__Category__RootNa__3A8CA01F]  DEFAULT (' ') FOR [RootName]
GO
ALTER TABLE [dbo].[DicDetail] ADD  CONSTRAINT [DF_DicDetail_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[DicDetail] ADD  CONSTRAINT [DF__DicDetail__Value__3B80C458]  DEFAULT (' ') FOR [Value]
GO
ALTER TABLE [dbo].[DicDetail] ADD  CONSTRAINT [DF__DicDetail__Text__3C74E891]  DEFAULT ('0') FOR [Text]
GO
ALTER TABLE [dbo].[DicDetail] ADD  CONSTRAINT [DF__DicDetail__SortN__3E5D3103]  DEFAULT ((0)) FOR [SortNo]
GO
ALTER TABLE [dbo].[DicDetail] ADD  CONSTRAINT [DF__DicDetail__Statu__3F51553C]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[DicDetail] ADD  CONSTRAINT [DF__DicDetail__Descr__40457975]  DEFAULT (' ') FOR [Description]
GO
ALTER TABLE [dbo].[DicIndex] ADD  CONSTRAINT [DF_DicIndex_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[DicIndex] ADD  CONSTRAINT [DF__DicIndex__Name__41399DAE]  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[DicIndex] ADD  CONSTRAINT [DF__DicIndex__Key__422DC1E7]  DEFAULT (' ') FOR [Key]
GO
ALTER TABLE [dbo].[DicIndex] ADD  CONSTRAINT [DF__DicIndex__SortNo__4321E620]  DEFAULT ((0)) FOR [SortNo]
GO
ALTER TABLE [dbo].[DicIndex] ADD  CONSTRAINT [DF__DicIndex__Descri__450A2E92]  DEFAULT ('0') FOR [Description]
GO
ALTER TABLE [dbo].[Enclosure] ADD  CONSTRAINT [DF_Enclosure_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF_Module_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__CascadeI__45FE52CB]  DEFAULT (' ') FOR [CascadeId]
GO
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__Name__46F27704]  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__Url__47E69B3D]  DEFAULT (' ') FOR [Url]
GO
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__HotKey__48DABF76]  DEFAULT (' ') FOR [HotKey]
GO
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__IsLeaf__4AC307E8]  DEFAULT ((1)) FOR [IsLeaf]
GO
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__IsAutoEx__4BB72C21]  DEFAULT ((0)) FOR [IsAutoExpand]
GO
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__IconName__4CAB505A]  DEFAULT (' ') FOR [IconName]
GO
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__Status__4D9F7493]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__ParentNa__4E9398CC]  DEFAULT (' ') FOR [ParentName]
GO
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__Vector__4F87BD05]  DEFAULT (' ') FOR [Vector]
GO
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__SortNo__507BE13E]  DEFAULT ((0)) FOR [SortNo]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF_ModuleElement_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleEle__DomId__51700577]  DEFAULT (' ') FOR [DomId]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleElem__Name__526429B0]  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleElem__Type__53584DE9]  DEFAULT (' ') FOR [Type]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleElem__Attr__5540965B]  DEFAULT (' ') FOR [Attr]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleEle__Scrip__5634BA94]  DEFAULT (' ') FOR [Script]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleElem__Icon__5728DECD]  DEFAULT (' ') FOR [Icon]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleEle__Class__581D0306]  DEFAULT (' ') FOR [Class]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleEle__Remar__5911273F]  DEFAULT (' ') FOR [Remark]
GO
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleElem__Sort__5A054B78]  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF_Org_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__CascadeId__5AF96FB1]  DEFAULT (' ') FOR [CascadeId]
GO
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__Name__5BED93EA]  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__HotKey__5CE1B823]  DEFAULT (' ') FOR [HotKey]
GO
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__ParentName__5ECA0095]  DEFAULT (' ') FOR [ParentName]
GO
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__IsLeaf__5FBE24CE]  DEFAULT ((1)) FOR [IsLeaf]
GO
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__IsAutoExpan__60B24907]  DEFAULT ((0)) FOR [IsAutoExpand]
GO
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__IconName__61A66D40]  DEFAULT (' ') FOR [IconName]
GO
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__Status__629A9179]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__Type__638EB5B2]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__BizCode__6482D9EB]  DEFAULT (' ') FOR [BizCode]
GO
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__CustomCode__6576FE24]  DEFAULT (' ') FOR [CustomCode]
GO
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__CreateTime__666B225D]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__CreateId__675F4696]  DEFAULT ((0)) FOR [CreateId]
GO
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__SortNo__68536ACF]  DEFAULT ((0)) FOR [SortNo]
GO
ALTER TABLE [dbo].[Relevance] ADD  CONSTRAINT [DF_Relevance_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Relevance] ADD  CONSTRAINT [DF__Relevance__Descr__70E8B0D0]  DEFAULT (' ') FOR [Description]
GO
ALTER TABLE [dbo].[Relevance] ADD  CONSTRAINT [DF__Relevance__Key__71DCD509]  DEFAULT (' ') FOR [Key]
GO
ALTER TABLE [dbo].[Relevance] ADD  CONSTRAINT [DF__Relevance__Statu__72D0F942]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Relevance] ADD  CONSTRAINT [DF__Relevance__Opera__73C51D7B]  DEFAULT (getdate()) FOR [OperateTime]
GO
ALTER TABLE [dbo].[Relevance] ADD  CONSTRAINT [DF__Relevance__Opera__74B941B4]  DEFAULT ((0)) FOR [OperatorId]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF_Resource_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF__Resource__Cascad__75AD65ED]  DEFAULT (' ') FOR [CascadeId]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF__Resource__Key__76A18A26]  DEFAULT (' ') FOR [Key]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF__Resource__Name__7795AE5F]  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF__Resource__Status__797DF6D1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF__Resource__SortNo__7A721B0A]  DEFAULT ((0)) FOR [SortNo]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF__Resource__Descri__7C5A637C]  DEFAULT (' ') FOR [Description]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF__Role__Name__7D4E87B5]  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF__Role__Status__7E42ABEE]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF__Role__Type__7F36D027]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF__Role__CreateTime__002AF460]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF__Role__CreateId__011F1899]  DEFAULT (' ') FOR [CreateId]
GO
ALTER TABLE [dbo].[TenderInfo] ADD  CONSTRAINT [DF_TenderInfo_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[TenderInfo] ADD  CONSTRAINT [DF_TenderInfo_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[TenderInfo] ADD  CONSTRAINT [DF_TenderInfo_StartTime]  DEFAULT (getdate()) FOR [StartTime]
GO
ALTER TABLE [dbo].[TenderInfo] ADD  CONSTRAINT [DF_TenderInfo_EndTime]  DEFAULT (getdate()) FOR [EndTime]
GO
ALTER TABLE [dbo].[TenderInfo] ADD  CONSTRAINT [DF_TenderInfo_Cycle]  DEFAULT ('') FOR [Cycle]
GO
ALTER TABLE [dbo].[TenderInfo] ADD  CONSTRAINT [DF_TenderInfo_State]  DEFAULT ((0)) FOR [State]
GO
ALTER TABLE [dbo].[TenderInfo] ADD  CONSTRAINT [DF_TenderInfo_FirstUser]  DEFAULT ('') FOR [FirstUser]
GO
ALTER TABLE [dbo].[TenderInfo] ADD  CONSTRAINT [DF_TenderInfo_SecondUser]  DEFAULT ('') FOR [SecondUser]
GO
ALTER TABLE [dbo].[TenderInfo] ADD  CONSTRAINT [DF_TenderInfo_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[TenderInfo] ADD  CONSTRAINT [DF_TenderInfo_CreateUser]  DEFAULT (newid()) FOR [CreateUser]
GO
ALTER TABLE [dbo].[TenderInfo] ADD  CONSTRAINT [DF_TenderInfo_Title]  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[TenderUser] ADD  CONSTRAINT [DF_Table_1_TanderUser]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[TenderUser] ADD  CONSTRAINT [DF_TanderUser_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[TenderUser] ADD  CONSTRAINT [DF_TanderUser_ContactPerson]  DEFAULT ('') FOR [ContactPerson]
GO
ALTER TABLE [dbo].[TenderUser] ADD  CONSTRAINT [DF_TanderUser_ContactNum]  DEFAULT (N'’‘') FOR [ContactNum]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__Account__0B9CA70C]  DEFAULT (' ') FOR [Account]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__Password__0C90CB45]  DEFAULT (' ') FOR [Password]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__Name__0D84EF7E]  DEFAULT (' ') FOR [Name]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__Sex__0E7913B7]  DEFAULT ((0)) FOR [Sex]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__Status__0F6D37F0]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__Type__10615C29]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__BizCode__11558062]  DEFAULT (' ') FOR [BizCode]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__CreateTime__1249A49B]  DEFAULT (getdate()) FOR [CreateTime]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标书id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BidInfo', @level2type=N'COLUMN',@level2name=N'TenderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标书标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BidInfo', @level2type=N'COLUMN',@level2name=N'TenderTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投标人id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BidInfo', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投标人名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BidInfo', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投标金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BidInfo', @level2type=N'COLUMN',@level2name=N'TenderPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投标时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BidInfo', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投标状态，0竞标中，1中标，2未中标，3作废' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BidInfo', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点语义ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'CascadeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类所属科目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'RootKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类所属科目名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'RootName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文本描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail', @level2type=N'COLUMN',@level2name=N'Text'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属字典ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail', @level2type=N'COLUMN',@level2name=N'DicId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据字典详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据字典ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicIndex', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicIndex', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicIndex', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicIndex', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicIndex', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据字典' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Enclosure', @level2type=N'COLUMN',@level2name=N'RelationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Enclosure', @level2type=N'COLUMN',@level2name=N'Path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件类型0图片，1视频' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Enclosure', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能模块流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点语义ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'CascadeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能模块名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主页面URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'热键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'HotKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否叶子节点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'IsLeaf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否自动展开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'IsAutoExpand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点图标文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'IconName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'矢量图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Vector'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能模块表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DOM ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'DomId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素附加属性' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Attr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素调用脚本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Script'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素样式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块元素表(需要权限控制的按钮)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点语义ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CascadeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'热键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'HotKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否叶子节点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'IsLeaf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否自动展开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'IsAutoExpand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点图标文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'IconName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务对照码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'BizCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自定义扩展码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CustomCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CreateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'OperateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'OperatorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第一个表主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'FirstId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第二个表主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'SecondId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多对多关系集中映射' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点语义ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'CascadeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderInfo', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderInfo', @level2type=N'COLUMN',@level2name=N'StartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderInfo', @level2type=N'COLUMN',@level2name=N'EndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提货周期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderInfo', @level2type=N'COLUMN',@level2name=N'Cycle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0未开标，1已开标，2已结束，3已作废' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderInfo', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第一开标人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderInfo', @level2type=N'COLUMN',@level2name=N'FirstUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第二开标人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderInfo', @level2type=N'COLUMN',@level2name=N'SecondUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderInfo', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderInfo', @level2type=N'COLUMN',@level2name=N'CreateUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键id，关联user表id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderUser', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderUser', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司名称，发票抬头' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderUser', @level2type=N'COLUMN',@level2name=N'Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderUser', @level2type=N'COLUMN',@level2name=N'ContactPerson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderUser', @level2type=N'COLUMN',@level2name=N'ContactNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'营业执照' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderUser', @level2type=N'COLUMN',@level2name=N'BusinessLicense'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保证金' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TenderUser', @level2type=N'COLUMN',@level2name=N'CashDeposit'
GO
USE [master]
GO
ALTER DATABASE [TenderDB] SET  READ_WRITE 
GO
