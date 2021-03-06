USE [CatalogDb]
GO
/****** Object:  Index [IX_78_TITLE_PERFORMERS1]    Script Date: 4/29/2017 9:13:00 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[78]') AND name = N'IX_78_TITLE_PERFORMERS1')
DROP INDEX [IX_78_TITLE_PERFORMERS1] ON [dbo].[78]
GO
/****** Object:  Table [dbo].[78]    Script Date: 4/29/2017 9:13:00 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[78]') AND type in (N'U'))
DROP TABLE [dbo].[78]
GO
/****** Object:  Table [dbo].[78]    Script Date: 4/29/2017 9:13:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[78]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[78](
	[TITLE] [nvarchar](110) NULL,
	[CATNUM] [nvarchar](15) NULL,
	[COMPOSERS1] [nvarchar](70) NULL,
	[PUBLISHER] [nvarchar](100) NULL,
	[COMPOSERS2] [nvarchar](70) NULL,
	[COMPOSERS3] [nvarchar](70) NULL,
	[COMPOSERS4] [nvarchar](70) NULL,
	[PRODTYPE] [nvarchar](50) NULL,
	[PRODTITLE] [nvarchar](60) NULL,
	[ARRANGTYPE] [nvarchar](30) NULL,
	[NOTES1] [nvarchar](150) NULL,
	[NOTES2] [nvarchar](150) NULL,
	[id_transfer] [int] NULL,
	[PRINT] [bit] NULL,
	[NewRec] [bit] NULL,
	[PERFORMERS1] [nvarchar](70) NULL,
	[LYRICISTS1] [nvarchar](70) NULL,
	[COMPANY] [nvarchar](100) NULL,
	[PERFORMERS2] [nvarchar](70) NULL,
	[LYRICISTS2] [nvarchar](70) NULL,
	[LYRICISTS3] [nvarchar](70) NULL,
	[LYRICISTS4] [nvarchar](70) NULL,
	[ID_78] [int] NOT NULL,
	[PERFORMERS3] [nvarchar](70) NULL,
	[PERFORMERS4] [nvarchar](70) NULL,
	[DONE] [nvarchar](100) NULL,
	[MATRIX] [nvarchar](50) NULL,
	[MATRIX_NUM] [int] NULL,
	[MATRIX_PREFIX] [nvarchar](50) NULL,
	[MATRIX_SUFFIX] [nvarchar](50) NULL,
	[LOCATION] [nvarchar](100) NULL,
	[PAGE_LINK] [nvarchar](100) NULL,
	[RecDay] [nvarchar](2) NULL,
	[RecMonth] [nvarchar](2) NULL,
	[RecYear] [nvarchar](4) NULL,
	[FLD1] [nvarchar](20) NULL,
	[FLD2] [nvarchar](20) NULL,
	[FLD3] [nvarchar](20) NULL,
	[FLD4] [nvarchar](20) NULL,
	[FLD5] [nvarchar](20) NULL,
	[FLD6] [nvarchar](20) NULL,
	[FLD7] [nvarchar](20) NULL,
	[FLD8] [nvarchar](30) NULL,
	[FLD1_DATA] [nvarchar](250) NULL,
	[FLD2_DATA] [nvarchar](250) NULL,
	[FLD3_DATA] [nvarchar](255) NULL,
	[FLD4_DATA] [nvarchar](255) NULL,
	[FLD5_DATA] [nvarchar](250) NULL,
	[FLD6_DATA] [nvarchar](250) NULL,
	[FLD7_DATA] [nvarchar](250) NULL,
	[FLD8_DATA] [nvarchar](250) NULL,
	[FLD_2_COUNT] [int] NULL,
	[FLD_3_COUNT] [int] NULL,
	[YEAR_SHEETMUS] [nvarchar](4) NULL,
	[UCASE_FLD2_DATA] [nvarchar](250) NULL,
	[PICTURE] [nvarchar](100) NULL,
	[SEARCHBOX] [nvarchar](100) NULL,
	[TOTAL_ROWS] [int] NULL,
	[ROW_NUM] [int] NULL,
	[SORT_BY] [nvarchar](50) NULL,
 CONSTRAINT [PK_ID_780] PRIMARY KEY CLUSTERED 
(
	[ID_78] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_78_TITLE_PERFORMERS1]    Script Date: 4/29/2017 9:13:00 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[78]') AND name = N'IX_78_TITLE_PERFORMERS1')
CREATE NONCLUSTERED INDEX [IX_78_TITLE_PERFORMERS1] ON [dbo].[78]
(
	[TITLE] ASC,
	[PERFORMERS1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
