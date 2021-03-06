USE [CatalogDb]
GO
/****** Object:  StoredProcedure [dbo].[GetTracks]    Script Date: 4/29/2017 9:13:00 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTracks]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetTracks]
GO
/****** Object:  StoredProcedure [dbo].[GetTracks]    Script Date: 4/29/2017 9:13:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTracks]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetTracks] AS' 
END
GO

/******
Notes: 
ID is varchar in database
TOTAL_ROWS int
SORT_TBY varchar 50
are extra fields to add to imported tables

exec GetTracks
@fMEDIA_TITLE = '{}',
@fMEDIUM = '{}',
@fMEDIACAT = '{}',
@fCOMPANY = '{}',
@fREC_MONTH = '{}',
@fREC_DAY = '{}',
@fREC_YEAR = '{}',
@fTITLE='{}', 
@fCOMP_LYR ='{}',
@fARRANGER  ='{}',
@fPERFORMER = 'arm',
@fPUBLISHER  ='{}',
@fTITLEYEAR  ='{}',
@fARRANGYEAR  ='{}',
@fARRANGTYPE  ='{}',
@fPRODTYPE ='{}',
@fPRODTITLE  ='{}',
@fNOTES  ='{}',
@fPICTURE  ='{}',
@fSEARCHBOX = '{}',
@fROW_START = '1',
@fSORT_BY = 'TITLE'


********/
ALTER PROC [dbo].[GetTracks] 
(
@fMEDIA_TITLE VARCHAR(100) ,
@fMEDIUM VARCHAR(100) ,
@fMEDIACAT VARCHAR(100) ,
@fCOMPANY VARCHAR(100) ,
@fREC_MONTH VARCHAR(100) ,
@fREC_DAY VARCHAR(100) ,
@fREC_YEAR VARCHAR(100) ,
@fTITLE VARCHAR(100) , 
@fCOMP_LYR  VARCHAR(100) ,
@fARRANGER   VARCHAR(100) ,
@fPERFORMER VARCHAR(100) ,
@fPUBLISHER   VARCHAR(100) ,
@fTITLEYEAR   VARCHAR(100) ,
@fARRANGYEAR   VARCHAR(100) ,
@fARRANGTYPE   VARCHAR(100) ,
@fPRODTYPE  VARCHAR(100) ,
@fPRODTITLE   VARCHAR(100) ,
@fNOTES   VARCHAR(100) ,
@fPICTURE   VARCHAR(100) ,
@fSEARCHBOX VARCHAR(100) ,
@fROW_START VARCHAR(10) ,
@fSORT_BY VARCHAR(50) 
)
AS

DECLARE @WHERECLAUSE NVARCHAR(4000)

SET @FSEARCHBOX = REPLACE(@FSEARCHBOX,'''','''''')
SET @fMEDIA_TITLE = REPLACE(@fMEDIA_TITLE,'''','''''')
SET @fMEDIUM = REPLACE(@fMEDIUM,'''','''''')
SET @fCOMPANY = REPLACE(@fCOMPANY,'''','''''')
SET @fREC_MONTH = REPLACE(@fREC_MONTH,'''','''''')
SET @fREC_DAY = REPLACE(@fREC_DAY,'''','''''')
SET @fREC_YEAR = REPLACE(@fREC_YEAR,'''','''''')
SET @fTITLE = REPLACE(@fTITLE,'''','''''')
SET @fCOMP_LYR = REPLACE(@fCOMP_LYR,'''','''''')
SET @fARRANGER = REPLACE(@fARRANGER,'''','''''')
SET @fPERFORMER = REPLACE(@fPERFORMER,'''','''''')
SET @fPUBLISHER = REPLACE(@fPUBLISHER,'''','''''')
SET @fTITLEYEAR = REPLACE(@fTITLEYEAR,'''','''''')
SET @fARRANGYEAR = REPLACE(@fARRANGYEAR,'''','''''')
SET @fARRANGTYPE = REPLACE(@fARRANGTYPE,'''','''''')
SET @fPRODTYPE = REPLACE(@fPRODTYPE,'''','''''')
SET @fPRODTITLE = REPLACE(@fPRODTITLE,'''','''''')
SET @fNOTES = REPLACE(@fNOTES,'''','''''')
SET @fPICTURE = REPLACE(@fPICTURE,'''','''''')

BEGIN
	SET @WHERECLAUSE = 

		IIF(@fMEDIA_TITLE <> '{}', 'MEDIA_TITLE LIKE ''%' + @fMEDIA_TITLE + '%'' AND ','') + 
		IIF(@fMEDIUM <> '{}', 'MEDIUM LIKE ''' + @fMEDIUM + '%'' AND ','') + 
		IIF(@fMEDIACAT <> '{}', 'MEDIACAT LIKE ''%' + @fMEDIACAT + '%'' AND ','') + 
		IIF(@fCOMPANY <> '{}', 'COMPANY LIKE ''%' + @fCOMPANY + '%'' AND ','') + 
		IIF(@fREC_MONTH <> '{}', 'REC_MONTH LIKE ''%' + @fREC_MONTH + '%'' AND ','') + 
		IIF(@fREC_DAY <> '{}', 'REC_DAY LIKE ''%' + @fREC_DAY + '%'' AND ','') + 
		IIF(@fREC_YEAR <> '{}', 'REC_YEAR LIKE ''%' + @fREC_YEAR + '%'' AND ','') + 
		IIF(@fTITLE <> '{}', 'TITLE LIKE ''' + @fTITLE + '%'' AND ','') + 
		IIF(@fCOMP_LYR <> '{}', '(COMPOSERS1 LIKE ''%' + @fCOMP_LYR + '%'' OR  COMPOSERS2 LIKE ''%' + @fCOMP_LYR + '%'' OR  COMPOSERS3 LIKE ''%' + @fCOMP_LYR + '%'' OR  COMPOSERS4 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS1 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS2 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS3 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS4 LIKE ''%' + @fCOMP_LYR + '%'') AND ','') + 
		IIF(@fARRANGER <> '{}', '(ARRANGERS1 LIKE ''%' + @fARRANGER + '%'' OR  ARRANGERS2 LIKE ''%' + @fARRANGER + '%'') AND ','') + 
		IIF(@fPERFORMER <> '{}', '(PERFORMERS1 LIKE ''%' + @fPERFORMER + '%'' OR  PERFORMERS2 LIKE ''%' + @fPERFORMER + '%'' OR  PERFORMERS3 LIKE ''%' + @fPERFORMER + '%'' OR  PERFORMERS4 LIKE ''%' + @fPERFORMER + '%'') AND ','') + 
		IIF(@fPUBLISHER <> '{}', 'PUBLISHER LIKE ''%' + @fPUBLISHER + '%'' AND ','') + 
		IIF(@fTITLEYEAR <> '{}', 'TITLEYEAR LIKE ''%' + @fTITLEYEAR + '%'' AND ','') + 
		IIF(@fARRANGYEAR <> '{}', 'ARRANGYEAR LIKE ''%' + @fARRANGYEAR + '%'' AND ','') + 
		IIF(@fARRANGTYPE <> '{}', 'ARRANGTYPE LIKE ''%' + @fARRANGTYPE + '%'' AND ','') + 
		IIF(@fPRODTYPE <> '{}', 'PRODTYPE LIKE ''%' + @fPRODTYPE + '%'' AND ','') + 
		IIF(@fPRODTITLE <> '{}', 'PRODTITLE LIKE ''%' + @fPRODTITLE + '%'' AND ','') + 
		IIF(@fNOTES <> '{}', '(NOTES1 LIKE ''%' + @fNOTES + '%'' OR  NOTES2 LIKE ''%' + @fNOTES + '%'') AND ','') + 
		IIF(@fPICTURE <> '{}', 'PICTURE LIKE ''%' + @fPICTURE + '%'' AND ','')  

		SET @WHERECLAUSE = IIF(LEN(@WHERECLAUSE)>0,LEFT(@WHERECLAUSE,LEN(@WHERECLAUSE)-4),'')
END

PRINT @WHERECLAUSE

DECLARE @SQL NVARCHAR(4000)
DECLARE @ROW_COUNT INT

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='#tempTracks' AND xtype='U')
    CREATE TABLE #tempTracks (
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
	[ID_TRACKS] [int]  NULL,
	[ID_MEDIA] [int] NULL,
	[PICTURE] [nvarchar](100) NULL,
	[SEARCHBOX] [nvarchar](100) NULL,
	[TOTAL_ROWS] [int] NULL,
	[ROW_NUM] [int] NULL,
	[SORT_BY] [nvarchar](50) NULL
)

TRUNCATE TABLE #tempTracks

SET @SQL = '
INSERT INTO #tempTracks
(		[TITLE]
      ,[MEDIA_TITLE]
      ,[MEDIACAT]
      ,[MEDIUM]
      ,[PRINT]
      ,[CATNUM]
      ,[TITLEYEAR]
      ,[COMPOSERS1]
      ,[COMPOSERS2]
      ,[COMPOSERS3]
      ,[COMPOSERS4]
      ,[PERFORMERS1]
      ,[PERFORMERS2]
      ,[PERFORMERS3]
      ,[PERFORMERS4]
      ,[PUBLISHER]
      ,[ARRANGERS1]
      ,[ARRANGERS2]
      ,[LYRICISTS1]
      ,[LYRICISTS2]
      ,[LYRICISTS3]
      ,[LYRICISTS4]
      ,[NewRec]
      ,[NOTES1]
      ,[NOTES2]
      ,[sourcetable]
      ,[sourcetableid]
      ,[bLinkedToSourceTable]
      ,[ARRANGYEAR]
      ,[ARRANGTYPE]
      ,[COMPANY]
      ,[RECORD_DAY]
      ,[RECORD_MONTH]
      ,[RECORD_YEAR]
      ,[PRODTYPE]
      ,[PRODTITLE]
      ,[SOURCE_COMPANY]
      ,[ID_TRACKS]
      ,[ID_MEDIA]
      ,[PICTURE]
      ,[SEARCHBOX]
      ,[ROW_NUM]
	  ,[TOTAL_ROWS]
      ,[SORT_BY]
	  )
	  SELECT 
	  [TITLE]
      ,[MEDIA_TITLE]
      ,[MEDIACAT]
      ,[MEDIUM]
      ,[PRINT]
      ,[CATNUM]
      ,[TITLEYEAR]
      ,[COMPOSERS1]
      ,[COMPOSERS2]
      ,[COMPOSERS3]
      ,[COMPOSERS4]
      ,[PERFORMERS1]
      ,[PERFORMERS2]
      ,[PERFORMERS3]
      ,[PERFORMERS4]
      ,[PUBLISHER]
      ,[ARRANGERS1]
      ,[ARRANGERS2]
      ,[LYRICISTS1]
      ,[LYRICISTS2]
      ,[LYRICISTS3]
      ,[LYRICISTS4]
      ,[NewRec]
      ,[NOTES1]
      ,[NOTES2]
      ,[sourcetable]
      ,[sourcetableid]
      ,[bLinkedToSourceTable]
      ,[ARRANGYEAR]
      ,[ARRANGTYPE]
      ,[COMPANY]
      ,[RECORD_DAY]
      ,[RECORD_MONTH]
      ,[RECORD_YEAR]
      ,[PRODTYPE]
      ,[PRODTITLE]
      ,[SOURCE_COMPANY]
      ,[ID_TRACKS]
      ,[ID_MEDIA]
      ,[PICTURE]
      ,[SEARCHBOX]
	,ROW_NUMBER() OVER (ORDER BY ' + 
	CASE 
		WHEN @fSORT_BY = 'TITLE' THEN  'TITLE, ARRANGERS1'
		WHEN @fSORT_BY = 'KEY' THEN '[KEY]'
		ELSE @fSORT_BY
	END
	 + ') AS ROW_NUM
	,COUNT(*) OVER () as TOTAL_ROWS
	,SORT_BY
FROM CatalogDb.dbo.Tracks ' +
IIF(LEN(@WHERECLAUSE) > 0, ' WHERE ' + @WHERECLAUSE,'') 

PRINT @SQL 

EXECUTE sp_executesql @sql

-- Find first occurence of search string
SET @SQL = '
SELECT @retvalOUT = MIN(ROW_NUM) FROM #tempTracks WHERE LTRIM([' + @fSORT_BY + ']) LIKE + ''' + @fSEARCHBOX + '%'''
PRINT @SQL 

DECLARE @RETVAL INT
DECLARE @ParmDefinition nvarchar(500);
SET @ParmDefinition = N'@retvalOUT int OUTPUT';

EXEC sp_executesql @SQL, @ParmDefinition, @retvalOUT=@retval OUTPUT;

--SELECT @RETVAL

--SELECT MIN(ROW_NUM) FROM #tempTracks WHERE LTRIM(CATNUM) LIKE '10%'

DECLARE @ACTUAL_ROW_START INT = IIF(@fROW_START > 1,0,ISNULL(@RETVAL,0)) + IIF(@fROW_START = 1,0,@fROW_START)

SELECT
*
FROM #tempTracks o
WHERE o.ROW_NUM >= @ACTUAL_ROW_START AND o.ROW_NUM < @ACTUAL_ROW_START + 20

RETURN

exec GetTracks
@fMEDIA_TITLE = 'lou',
@fMEDIUM = '{}',
@fMEDIACAT = 'me',
@fCOMPANY = '{}',
@fREC_MONTH = '{}',
@fREC_DAY = '{}',
@fREC_YEAR = '{}',
@fTITLE='{}', 
@fCOMP_LYR ='{}',
@fARRANGER  ='{}',
@fPERFORMER = '{}',
@fPUBLISHER  ='{}',
@fTITLEYEAR  ='{}',
@fARRANGYEAR  ='{}',
@fARRANGTYPE  ='{}',
@fPRODTYPE ='{}',
@fPRODTITLE  ='{}',
@fNOTES  ='{}',
@fPICTURE  ='{}',
@fSEARCHBOX = '{}',
@fROW_START = '1',
@fSORT_BY = 'TITLE'


GO
