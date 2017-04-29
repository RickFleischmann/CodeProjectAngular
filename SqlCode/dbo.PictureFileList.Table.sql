USE [CatalogDb]
GO
/****** Object:  Table [dbo].[PictureFileList]    Script Date: 4/29/2017 9:13:00 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PictureFileList]') AND type in (N'U'))
DROP TABLE [dbo].[PictureFileList]
GO
/****** Object:  Table [dbo].[PictureFileList]    Script Date: 4/29/2017 9:13:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PictureFileList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PictureFileList](
	[PICTURE] [nvarchar](100) NULL,
	[DEPTH] [int] NULL,
	[FILE] [int] NULL
) ON [PRIMARY]
END
GO
