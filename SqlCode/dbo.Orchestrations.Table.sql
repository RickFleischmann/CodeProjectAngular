USE [CatalogDb]
GO
/****** Object:  Index [IX_TITLE_ARRANGERS1]    Script Date: 4/29/2017 9:13:00 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Orchestrations]') AND name = N'IX_TITLE_ARRANGERS1')
DROP INDEX [IX_TITLE_ARRANGERS1] ON [dbo].[Orchestrations]
GO
/****** Object:  Index [IX_ORCH_TITLE]    Script Date: 4/29/2017 9:13:00 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Orchestrations]') AND name = N'IX_ORCH_TITLE')
DROP INDEX [IX_ORCH_TITLE] ON [dbo].[Orchestrations]
GO
/****** Object:  Table [dbo].[Orchestrations]    Script Date: 4/29/2017 9:13:00 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orchestrations]') AND type in (N'U'))
DROP TABLE [dbo].[Orchestrations]
GO
/****** Object:  Table [dbo].[Orchestrations]    Script Date: 4/29/2017 9:13:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orchestrations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Orchestrations](
	[TITLE] [nvarchar](110) NULL,
	[CATNUM] [nvarchar](6) NULL,
	[ARRANGERS1] [nvarchar](70) NULL,
	[COMPOSERS1] [nvarchar](70) NULL,
	[LYRICISTS1] [nvarchar](70) NULL,
	[PUBLISHER] [nvarchar](100) NULL,
	[COMPOSERS2] [nvarchar](70) NULL,
	[COMPOSERS3] [nvarchar](70) NULL,
	[COMPOSERS4] [nvarchar](70) NULL,
	[ARRANGERS2] [nvarchar](70) NULL,
	[LYRICISTS2] [nvarchar](70) NULL,
	[LYRICISTS3] [nvarchar](70) NULL,
	[LYRICISTS4] [nvarchar](70) NULL,
	[TITLEYEAR] [nvarchar](4) NULL,
	[ARRANGYEAR] [nvarchar](4) NULL,
	[ARRANGTYPE] [nvarchar](30) NULL,
	[KEY] [nvarchar](15) NULL,
	[PRODTYPE] [nvarchar](50) NULL,
	[PRODTITLE] [nvarchar](60) NULL,
	[NOTES1] [nvarchar](150) NULL,
	[NOTES2] [nvarchar](150) NULL,
	[PLATE_NUMBER] [nvarchar](20) NULL,
	[PRINT] [bit] NULL,
	[ID_JAZZ] [int] NOT NULL,
	[id_transfer] [int] NULL,
	[LARGE] [bit] NULL,
	[NewRec] [bit] NULL,
	[PCN] [nvarchar](20) NULL,
	[ID] [nvarchar](100) NULL,
	[PICTURE] [nvarchar](100) NULL,
	[SEARCHBOX] [nvarchar](100) NULL,
	[TOTAL_ROWS] [int] NULL,
	[ROW_NUM] [int] NULL,
	[SORT_BY] [nvarchar](50) NULL,
 CONSTRAINT [PK_ID_JAZZ0] PRIMARY KEY CLUSTERED 
(
	[ID_JAZZ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ORCH_TITLE]    Script Date: 4/29/2017 9:13:00 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Orchestrations]') AND name = N'IX_ORCH_TITLE')
CREATE NONCLUSTERED INDEX [IX_ORCH_TITLE] ON [dbo].[Orchestrations]
(
	[TITLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TITLE_ARRANGERS1]    Script Date: 4/29/2017 9:13:00 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Orchestrations]') AND name = N'IX_TITLE_ARRANGERS1')
CREATE NONCLUSTERED INDEX [IX_TITLE_ARRANGERS1] ON [dbo].[Orchestrations]
(
	[TITLE] ASC,
	[ARRANGERS1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
