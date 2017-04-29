USE [CatalogDb]
GO
/****** Object:  StoredProcedure [dbo].[GetSolos]    Script Date: 4/29/2017 9:13:00 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSolos]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSolos]
GO
/****** Object:  StoredProcedure [dbo].[GetSolos]    Script Date: 4/29/2017 9:13:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSolos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetSolos] AS' 
END
GO

/******
Notes: 
ID is varchar in database
TOTAL_ROWS int
SORT_TBY varchar 50
are extra fields to add to imported tables

exec GetSolos 
@fTITLE = 'bob',
@fCATNUM = '{}',
@fCOMP_LYR = '{}',
@fPUBLISHER = '{}',
@fPHOTO = '{}',
@fINSTRUMENT = '{}',
@fTITLEYEAR = '{}',
@fPRODTYPE = '{}',
@fPRODTITLE = '{}',
@fARRANGTYPE = '{}',
@fNOTES = '{}',
@fPLATE_NUMBER = '{}',
@fKEY = '{}',
@fLARGE = '{}',
@fARRANGYEAR = '{}',
@fPCN = '{}',
@fPICTURE = 'among',
@fSEARCHBOX = '{}',
@fROW_START = '1',
@fSORT_BY = 'TITLE'


********/
ALTER PROC [dbo].[GetSolos] 
(
@fTITLE VARCHAR(100),
@fCATNUM VARCHAR(100),
@fCOMP_LYR VARCHAR(100),
@fPUBLISHER VARCHAR(100),
@fPHOTO VARCHAR(100),
@fINSTRUMENT VARCHAR(100),
@fTITLEYEAR VARCHAR(100),
@fPRODTYPE VARCHAR(100),
@fPRODTITLE VARCHAR(100),
@fARRANGTYPE VARCHAR(100),
@fNOTES VARCHAR(100),
@fPLATE_NUMBER VARCHAR(100),
@fKEY VARCHAR(100),
@fLARGE VARCHAR(100),
@fARRANGYEAR VARCHAR(100),
@fPCN VARCHAR(100),
@fPICTURE VARCHAR(100),
@fSEARCHBOX VARCHAR(100),
@fROW_START VARCHAR(10),
@fSORT_BY  VARCHAR(50)


)
AS

DECLARE @WHERECLAUSE NVARCHAR(3000)


SET @FSEARCHBOX = REPLACE(@FSEARCHBOX,'''','''''')
SET @fTITLE = REPLACE(@fTITLE,'''','''''')
SET @fCATNUM = REPLACE(@fCATNUM,'''','''''')
SET @fCOMP_LYR = REPLACE(@fCOMP_LYR,'''','''''')
SET @fPUBLISHER = REPLACE(@fPUBLISHER,'''','''''')
SET @fPHOTO = REPLACE(@fPHOTO,'''','''''')
SET @fINSTRUMENT = REPLACE(@fINSTRUMENT,'''','''''')
SET @fTITLEYEAR = REPLACE(@fTITLEYEAR,'''','''''')
SET @fPRODTYPE = REPLACE(@fPRODTYPE,'''','''''')
SET @fPRODTITLE = REPLACE(@fPRODTITLE,'''','''''')
SET @fARRANGYEAR = REPLACE(@fARRANGYEAR,'''','''''')
SET @fARRANGTYPE = REPLACE(@fARRANGTYPE,'''','''''')
SET @fKEY = REPLACE(@fKEY,'''','''''')
SET @fNOTES = REPLACE(@fNOTES,'''','''''')
SET @fPLATE_NUMBER = REPLACE(@fPLATE_NUMBER,'''','''''')
SET @fPCN = REPLACE(@fPCN,'''','''''')
SET @fPICTURE = REPLACE(@fPICTURE,'''','''''')

BEGIN
	SET @WHERECLAUSE = 
		IIF(@fTITLE <> '{}', 'TITLE LIKE ''%' + @fTITLE + '%'' AND ','') + 
		IIF(@fCOMP_LYR <> '{}', '(COMPOSERS1 LIKE ''%' + @fCOMP_LYR + '%'' OR  COMPOSERS2 LIKE ''%' + @fCOMP_LYR + '%'' OR  COMPOSERS3 LIKE ''%' + @fCOMP_LYR + '%'' OR  COMPOSERS4 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS1 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS2 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS3 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS4 LIKE ''%' + @fCOMP_LYR + '%'') AND ','') + 
		IIF(@fPHOTO <> '{}', '(PHOTO1 LIKE ''%' + @fPHOTO + '%'' OR  PHOTO2 LIKE ''%' + @fPHOTO + '%'' OR  PHOTO3 LIKE ''%' + @fPHOTO + '%'' OR  PHOTO4 LIKE ''%' + @fPHOTO + '%'') AND ','') + 
		IIF(@fCATNUM <> '{}', 'CATNUM LIKE ''%' + @fCATNUM + '%'' AND ','') + 
		IIF(@fINSTRUMENT <> '{}', 'INSTRUMENT LIKE ''%' + @fINSTRUMENT + '%'' AND ','') + 
		IIF(@fPUBLISHER <> '{}', 'PUBLISHER LIKE ''%' + @fPUBLISHER + '%'' AND ','') + 
		IIF(@fTITLEYEAR <> '{}', 'TITLEYEAR LIKE ''%' + @fTITLEYEAR + '%'' AND ','') + 
		IIF(@fARRANGYEAR <> '{}', 'ARRANGYEAR LIKE ''%' + @fARRANGYEAR + '%'' AND ','') + 
		IIF(@fARRANGTYPE <> '{}', 'ARRANGTYPE LIKE ''%' + @fARRANGTYPE + '%'' AND ','') + 
		IIF(@fKEY <> '{}', '[KEY] = ''' + @fKEY + ''' AND ','') + 
		IIF(@fPRODTYPE <> '{}', 'PRODTYPE LIKE ''%' + @fPRODTYPE + '%'' AND ','') + 
		IIF(@fPRODTITLE <> '{}', 'PRODTITLE LIKE ''%' + @fPRODTITLE + '%'' AND ','') + 
		IIF(@fNOTES <> '{}', '(NOTES1 LIKE ''%' + @fNOTES + '%'' OR  NOTES2 LIKE ''%' + @fNOTES + '%'') AND ','') + 
		IIF(@fPLATE_NUMBER <> '{}', 'PLATE_NUMBER LIKE ''%' + @fPLATE_NUMBER + '%'' AND ','') + 
		IIF(@fPCN <> '{}', 'PCN LIKE ''%' + @fPCN + '%'' AND ','') + 
		IIF(@fPICTURE <> '{}', 'PICTURE LIKE ''%' + @fPICTURE + '%'' AND ','') + 
		IIF(@fLARGE = 'YES', 'LARGE = 1 AND ','') +
		IIF(@fLARGE = 'NO', 'LARGE = 0 AND ','') 

		SET @WHERECLAUSE = IIF(LEN(@WHERECLAUSE)>0,LEFT(@WHERECLAUSE,LEN(@WHERECLAUSE)-4),'')
END


DECLARE @SQL NVARCHAR(2000)
DECLARE @ROW_COUNT INT

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='#tempSolos' AND xtype='U')
    CREATE TABLE #tempSolos (
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
	[id_transfer] [int] NULL,
	[PRINT] [bit] NULL,
	[LARGE] [bit] NULL,
	[NewRec] [bit] NULL,
	[ARRANGYEAR] [nvarchar](4) NULL,
	[PCN] [nvarchar](20) NULL,
	[INSTRUMENT] [nvarchar](50) NULL,
	[PERFORMERS1] [nvarchar](70) NULL,
	[PERFORMERS2] [nvarchar](70) NULL,
	[ID_SOLOS] [int] NULL,
	PICTURE NVARCHAR(100),
	SEARCHBOX nvarchar(100) NULL,
	ROW_NUM INT NULL,
	TOTAL_ROWS INT NULL,
	SORT_BY VARCHAR(50)
)

TRUNCATE TABLE #tempSolos

SET @SQL = '
INSERT INTO #tempSolos
(		

TITLE
      ,CATNUM
      ,COMPOSERS1
      ,LYRICISTS1
      ,PUBLISHER
      ,COMPOSERS2
      ,COMPOSERS3
      ,COMPOSERS4
      ,LYRICISTS2
      ,LYRICISTS3
      ,LYRICISTS4
      ,PHOTO1
      ,PHOTO2
      ,PHOTO3
      ,PHOTO4
      ,TITLEYEAR
      ,PRODTYPE
      ,PRODTITLE
      ,ARRANGTYPE
      ,NOTES1
      ,NOTES2
      ,PLATE_NUMBER
      ,[KEY]
      ,id_transfer
      ,[PRINT]
      ,LARGE
      ,NewRec
      ,ARRANGYEAR
      ,PCN
      ,INSTRUMENT
      ,PERFORMERS1
      ,PERFORMERS2
      ,ID_SOLOS
	  ,PICTURE
	  ,SEARCHBOX
	  ,ROW_NUM
	  ,TOTAL_ROWS
	  ,SORT_BY
	  )
	  SELECT 
TITLE
      ,CATNUM
      ,COMPOSERS1
      ,LYRICISTS1
      ,PUBLISHER
      ,COMPOSERS2
      ,COMPOSERS3
      ,COMPOSERS4
      ,LYRICISTS2
      ,LYRICISTS3
      ,LYRICISTS4
      ,PHOTO1
      ,PHOTO2
      ,PHOTO3
      ,PHOTO4
      ,TITLEYEAR
      ,PRODTYPE
      ,PRODTITLE
      ,ARRANGTYPE
      ,NOTES1
      ,NOTES2
      ,PLATE_NUMBER
      ,[KEY]
      ,id_transfer
      ,[PRINT]
      ,LARGE
      ,NewRec
      ,ARRANGYEAR
      ,PCN
      ,INSTRUMENT
      ,PERFORMERS1
      ,PERFORMERS2
      ,ID_SOLOS
	  ,PICTURE
	  ,SEARCHBOX
	,ROW_NUMBER() OVER (ORDER BY ' + 
	CASE 
		WHEN @fSORT_BY = 'TITLE' THEN  'TITLE, INSTRUMENT'
		WHEN @fSORT_BY = 'KEY' THEN '[KEY]'
		ELSE @fSORT_BY
	END
	 + ') AS ROW_NUM
	,COUNT(*) OVER () as TOTAL_ROWS
	,SORT_BY
FROM CatalogDb.dbo.Solos ' +
IIF(LEN(@WHERECLAUSE) > 0, ' WHERE ' + @WHERECLAUSE,'') 


PRINT @SQL 

EXECUTE sp_executesql @sql

-- Find first occurence of search string
SET @SQL = '
SELECT @retvalOUT = MIN(ROW_NUM) FROM #tempSolos WHERE LTRIM([' + @fSORT_BY + ']) LIKE + ''' + @fSEARCHBOX + '%'''
PRINT @SQL 

DECLARE @RETVAL INT
DECLARE @ParmDefinition nvarchar(500);
SET @ParmDefinition = N'@retvalOUT int OUTPUT';

EXEC sp_executesql @SQL, @ParmDefinition, @retvalOUT=@retval OUTPUT;

--SELECT @RETVAL

--SELECT MIN(ROW_NUM) FROM #tempSolos WHERE LTRIM(CATNUM) LIKE '10%'

DECLARE @ACTUAL_ROW_START INT = IIF(@fROW_START > 1,0,ISNULL(@RETVAL,0)) + IIF(@fROW_START = 1,0,@fROW_START)

SELECT
*
FROM #tempSolos o
WHERE o.ROW_NUM >= @ACTUAL_ROW_START AND o.ROW_NUM < @ACTUAL_ROW_START + 20
GO
