USE [CatalogDb]
GO
/****** Object:  Table [dbo].[Tracks]    Script Date: 4/29/2017 9:13:00 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tracks]') AND type in (N'U'))
DROP TABLE [dbo].[Tracks]
GO
/****** Object:  Table [dbo].[Tracks]    Script Date: 4/29/2017 9:13:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tracks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tracks](
	[TITLE] [nvarchar](110) NULL,
	[MEDIA_TITLE] [nvarchar](110) NULL,
	[MEDIACAT] [nvarchar](25) NULL,
	[MEDIUM] [nvarchar](20) NULL,
	[PRINT] [bit] NULL,
	[CATNUM] [nvarchar](6) NULL,
	[TITLEYEAR] [nvarchar](4) NULL,
	[COMPOSERS1] [nvarchar](70) NULL,
	[COMPOSERS2] [nvarchar](70) NULL,
	[COMPOSERS3] [nvarchar](70) NULL,
	[COMPOSERS4] [nvarchar](70) NULL,
	[PERFORMERS1] [nvarchar](70) NULL,
	[PERFORMERS2] [nvarchar](70) NULL,
	[PERFORMERS3] [nvarchar](70) NULL,
	[PERFORMERS4] [nvarchar](70) NULL,
	[PUBLISHER] [nvarchar](100) NULL,
	[ARRANGERS1] [nvarchar](70) NULL,
	[ARRANGERS2] [nvarchar](70) NULL,
	[LYRICISTS1] [nvarchar](70) NULL,
	[LYRICISTS2] [nvarchar](70) NULL,
	[LYRICISTS3] [nvarchar](70) NULL,
	[LYRICISTS4] [nvarchar](30) NULL,
	[NewRec] [bit] NULL,
	[NOTES1] [nvarchar](150) NULL,
	[NOTES2] [nvarchar](150) NULL,
	[sourcetable] [nvarchar](30) NULL,
	[sourcetableid] [int] NULL,
	[bLinkedToSourceTable] [bit] NULL,
	[ARRANGYEAR] [nvarchar](4) NULL,
	[ARRANGTYPE] [nvarchar](30) NULL,
	[COMPANY] [nvarchar](50) NULL,
	[RECORD_DAY] [int] NULL,
	[RECORD_MONTH] [int] NULL,
	[RECORD_YEAR] [int] NULL,
	[PRODTYPE] [nvarchar](50) NULL,
	[PRODTITLE] [nvarchar](60) NULL,
	[SOURCE_COMPANY] [nvarchar](50) NULL,
	[ID_TRACKS] [int] NOT NULL,
	[ID_MEDIA] [int] NULL,
	[PICTURE] [nvarchar](100) NULL,
	[SEARCHBOX] [nvarchar](100) NULL,
	[TOTAL_ROWS] [int] NULL,
	[ROW_NUM] [int] NULL,
	[SORT_BY] [nvarchar](50) NULL,
 CONSTRAINT [PK_ID_TRACKS] PRIMARY KEY CLUSTERED 
(
	[ID_TRACKS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
