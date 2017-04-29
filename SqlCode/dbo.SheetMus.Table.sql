USE [CatalogDb]
GO
/****** Object:  Table [dbo].[SheetMus]    Script Date: 4/29/2017 9:13:00 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SheetMus]') AND type in (N'U'))
DROP TABLE [dbo].[SheetMus]
GO
/****** Object:  Table [dbo].[SheetMus]    Script Date: 4/29/2017 9:13:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SheetMus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SheetMus](
	[TITLE] [nvarchar](110) NULL,
	[CATNUM] [nvarchar](6) NULL,
	[COMPOSERS1] [nvarchar](70) NULL,
	[LYRICISTS1] [nvarchar](70) NULL,
	[PUBLISHER] [nvarchar](100) NULL,
	[COMPOSERS2] [nvarchar](70) NULL,
	[COMPOSERS3] [nvarchar](70) NULL,
	[COMPOSERS4] [nvarchar](70) NULL,
	[LYRICISTS2] [nvarchar](70) NULL,
	[LYRICISTS3] [nvarchar](70) NULL,
	[LYRICISTS4] [nvarchar](70) NULL,
	[PHOTO1] [nvarchar](100) NULL,
	[PHOTO2] [nvarchar](100) NULL,
	[PHOTO3] [nvarchar](100) NULL,
	[PHOTO4] [nvarchar](100) NULL,
	[TITLEYEAR] [nvarchar](4) NULL,
	[PRODTYPE] [nvarchar](50) NULL,
	[PRODTITLE] [nvarchar](60) NULL,
	[ARRANGTYPE] [nvarchar](30) NULL,
	[NOTES1] [nvarchar](150) NULL,
	[NOTES2] [nvarchar](150) NULL,
	[PLATE_NUMBER] [nvarchar](20) NULL,
	[KEY] [nvarchar](15) NULL,
	[ID_SHEETMUS] [int] NOT NULL,
	[id_transfer] [int] NULL,
	[PRINT] [bit] NULL,
	[LARGE] [bit] NULL,
	[NewRec] [bit] NULL,
	[ARRANGYEAR] [nvarchar](4) NULL,
	[PCN] [nvarchar](20) NULL,
	[PICTURE] [nvarchar](100) NULL,
	[SEARCHBOX] [nvarchar](100) NULL,
	[TOTAL_ROWS] [int] NULL,
	[ROW_NUM] [int] NULL,
	[SORT_BY] [nvarchar](50) NULL,
 CONSTRAINT [PK_ID_SHEETMUS] PRIMARY KEY CLUSTERED 
(
	[ID_SHEETMUS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
