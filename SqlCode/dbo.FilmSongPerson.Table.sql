USE [CatalogDb]
GO
/****** Object:  Table [dbo].[FilmSongPerson]    Script Date: 4/29/2017 9:13:00 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FilmSongPerson]') AND type in (N'U'))
DROP TABLE [dbo].[FilmSongPerson]
GO
/****** Object:  Table [dbo].[FilmSongPerson]    Script Date: 4/29/2017 9:13:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FilmSongPerson]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FilmSongPerson](
	[FilmTitle] [nvarchar](200) NULL,
	[FilmYear] [int] NULL,
	[SongTitle] [nvarchar](200) NULL,
	[Person] [nvarchar](120) NULL,
	[Role] [nvarchar](50) NULL,
	[ID_FILMSONGPERSON] [int] IDENTITY(1,1) NOT NULL,
	[PICTURE] [nvarchar](100) NULL,
	[SEARCHBOX] [nvarchar](100) NULL,
	[TOTAL_ROWS] [int] NULL,
	[ROW_NUM] [int] NULL,
	[SORT_BY] [nvarchar](50) NULL,
 CONSTRAINT [PK_ID_FILMSONGPERSON] PRIMARY KEY CLUSTERED 
(
	[ID_FILMSONGPERSON] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
