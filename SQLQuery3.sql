USE [TenderDB]
GO

/****** Object:  Table [dbo].[BidInfo]    Script Date: 04/08/2018 22:37:45 ******/
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
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

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

ALTER TABLE [dbo].[BidInfo] ADD  CONSTRAINT [DF_BidInfo_Id]  DEFAULT (newid()) FOR [Id]
GO

ALTER TABLE [dbo].[BidInfo] ADD  CONSTRAINT [DF_BidInfo_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO


