USE [master]
GO
/****** Object:  Database [TenderManger]    Script Date: 2018/3/31 20:20:53 ******/
CREATE DATABASE [TenderManger]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TenderManger', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TenderManger.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TenderManger_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TenderManger_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TenderManger] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TenderManger].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TenderManger] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TenderManger] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TenderManger] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TenderManger] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TenderManger] SET ARITHABORT OFF 
GO
ALTER DATABASE [TenderManger] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TenderManger] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TenderManger] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TenderManger] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TenderManger] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TenderManger] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TenderManger] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TenderManger] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TenderManger] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TenderManger] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TenderManger] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TenderManger] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TenderManger] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TenderManger] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TenderManger] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TenderManger] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TenderManger] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TenderManger] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TenderManger] SET RECOVERY FULL 
GO
ALTER DATABASE [TenderManger] SET  MULTI_USER 
GO
ALTER DATABASE [TenderManger] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TenderManger] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TenderManger] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TenderManger] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TenderManger', N'ON'
GO
USE [TenderManger]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2018/3/31 20:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([Id], [Account], [Password], [Name], [Status], [CreateTime]) VALUES (1, N'admin', N'ed8aa90944ebd651bf32bd0b7e429fd4', N'管理员', 1, CAST(0x0000A8B4012C2CB9 AS DateTime))
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_User_Account]  DEFAULT ('') FOR [Account]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_User_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
USE [master]
GO
ALTER DATABASE [TenderManger] SET  READ_WRITE 
GO
