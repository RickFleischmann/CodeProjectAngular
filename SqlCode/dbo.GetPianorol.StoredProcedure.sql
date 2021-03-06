USE [CatalogDb]
GO
/****** Object:  StoredProcedure [dbo].[GetPianorol]    Script Date: 4/29/2017 9:13:00 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetPianorol]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetPianorol]
GO
/****** Object:  StoredProcedure [dbo].[GetPianorol]    Script Date: 4/29/2017 9:13:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetPianorol]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetPianorol] AS' 
END
GO

/******
Notes: 
ID is varchar in database
TOTAL_ROWS int
SORT_TBY varchar 50
are extra fields to add to imported tables

exec [GetPianorol] 
@fTITLE='{}', 
@fCOMP_LYR ='{}',
@fPERFORMER  ='{}',
@fMEDIACAT  ='{}',
@fPUBLISHER  ='{}',
@fTITLEYEAR  ='{}',
@fARRANGYEAR  ='{}',
@fARRANGTYPE  ='{}',
@fPRODTYPE ='{}',
@fPRODTITLE  ='{}',
@fNOTES  ='{}',
@fCOMPANY ='{}',
@fPICTURE  ='{}',
@fSEARCHBOX = 'it''s',
@fROW_START = '1',
@fSORT_BY = 'TITLE'


********/
ALTER PROC [dbo].[GetPianorol] 
(
@fTITLE VARCHAR(100), 
@fCOMP_LYR VARCHAR(100), 
@fPERFORMER VARCHAR(100),
@fPUBLISHER VARCHAR(100) ,
@fTITLEYEAR VARCHAR(100) ,
@fARRANGYEAR VARCHAR(100) ,
@fARRANGTYPE VARCHAR(100) ,
@fPRODTYPE VARCHAR(100) ,
@fPRODTITLE VARCHAR(100) ,
@fNOTES VARCHAR(100) ,
@fCOMPANY VARCHAR(100) ,
@fMEDIACAT VARCHAR(100) ,
@fPICTURE  VARCHAR(100),
@fSEARCHBOX VARCHAR(100),
@fROW_START VARCHAR(10),
@fSORT_BY  VARCHAR(50)

)
AS

DECLARE @WHERECLAUSE NVARCHAR(3000)

SET @FSEARCHBOX = REPLACE(@FSEARCHBOX,'''','''''')
SET @fTITLE = REPLACE(@fTITLE,'''','''''')
SET @fCOMP_LYR = REPLACE(@fCOMP_LYR,'''','''''')
SET @fPERFORMER = REPLACE(@fPERFORMER,'''','''''')
SET @fMEDIACAT = REPLACE(@fMEDIACAT,'''','''''')
SET @fPUBLISHER = REPLACE(@fPUBLISHER,'''','''''')
SET @fTITLEYEAR = REPLACE(@fTITLEYEAR,'''','''''')
SET @fARRANGYEAR = REPLACE(@fARRANGYEAR,'''','''''')
SET @fARRANGTYPE = REPLACE(@fARRANGTYPE,'''','''''')
SET @fCOMPANY = REPLACE(@fCOMPANY,'''','''''')
SET @fPRODTYPE = REPLACE(@fPRODTYPE,'''','''''')
SET @fPRODTITLE = REPLACE(@fPRODTITLE,'''','''''')
SET @fNOTES = REPLACE(@fNOTES,'''','''''')
SET @fPICTURE = REPLACE(@fPICTURE,'''','''''')


BEGIN
	SET @WHERECLAUSE = 
		IIF(@fTITLE <> '{}', 'TITLE LIKE ''%' + @fTITLE + '%'' AND ','') + 
		IIF(@fCOMP_LYR <> '{}', '(COMPOSERS1 LIKE ''%' + @fCOMP_LYR + '%'' OR  COMPOSERS2 LIKE ''%' + @fCOMP_LYR + '%'' OR  COMPOSERS3 LIKE ''%' + @fCOMP_LYR + '%'' OR  COMPOSERS4 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS1 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS2 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS3 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS4 LIKE ''%' + @fCOMP_LYR + '%'') AND ','') + 
		IIF(@fPERFORMER <> '{}', '(PERFORMERS1 LIKE ''%' + @fPERFORMER + '%'' OR  PERFORMERS2 LIKE ''%' + @fPERFORMER + '%'') AND ','') + 
		IIF(@fMEDIACAT <> '{}', 'MEDIACAT LIKE ''%' + @fMEDIACAT + '%'' AND ','') + 
		IIF(@fPUBLISHER <> '{}', 'PUBLISHER LIKE ''%' + @fPUBLISHER + '%'' AND ','') + 
		IIF(@fTITLEYEAR <> '{}', 'TITLEYEAR LIKE ''%' + @fTITLEYEAR + '%'' AND ','') + 
		IIF(@fARRANGYEAR <> '{}', 'ARRANGYEAR LIKE ''%' + @fARRANGYEAR + '%'' AND ','') + 
		IIF(@fARRANGTYPE <> '{}', 'ARRANGTYPE LIKE ''%' + @fARRANGTYPE + '%'' AND ','') + 
		IIF(@fCOMPANY <> '{}', '[COMPANY] LIKE ''%' + @fCOMPANY + '%'' AND ','') + 
		IIF(@fPRODTYPE <> '{}', 'PRODTYPE LIKE ''%' + @fPRODTYPE + '%'' AND ','') + 
		IIF(@fPRODTITLE <> '{}', 'PRODTITLE LIKE ''%' + @fPRODTITLE + '%'' AND ','') + 
		IIF(@fNOTES <> '{}', '(NOTES1 LIKE ''%' + @fNOTES + '%'' OR  NOTES2 LIKE ''%' + @fNOTES + '%'') AND ','') + 
		IIF(@fPICTURE <> '{}', 'PICTURE LIKE ''%' + @fPICTURE + '%'' AND ','') 

		SET @WHERECLAUSE = IIF(LEN(@WHERECLAUSE)>0,LEFT(@WHERECLAUSE,LEN(@WHERECLAUSE)-4),'')
END


DECLARE @SQL NVARCHAR(2000)
DECLARE @ROW_COUNT INT

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='#tempPianorol' AND xtype='U')
    CREATE TABLE #tempPianorol (
	[TITLE] [nvarchar](110) NULL,
	[CATNUM] [nvarchar](6) NULL,
	[COMPOSERS1] [nvarchar](70) NULL,
	[PUBLISHER] [nvarchar](100) NULL,
	[COMPOSERS2] [nvarchar](70) NULL,
	[COMPOSERS3] [nvarchar](70) NULL,
	[COMPOSERS4] [nvarchar](70) NULL,
	[TITLEYEAR] [nvarchar](4) NULL,
	[PRODTYPE] [nvarchar](50) NULL,
	[PRODTITLE] [nvarchar](60) NULL,
	[ARRANGTYPE] [nvarchar](30) NULL,
	[NOTES1] [nvarchar](150) NULL,
	[NOTES2] [nvarchar](150) NULL,
	[id_transfer] [int] NULL,
	[PRINT] [bit] NULL,
	[NewRec] [bit] NULL,
	[ARRANGYEAR] [nvarchar](4) NULL,
	[MEDIACAT] [nvarchar](15) NULL,
	[PERFORMERS1] [nvarchar](70) NULL,
	[LYRICISTS1] [nvarchar](70) NULL,
	[COMPANY] [nvarchar](50) NULL,
	[PERFORMERS2] [nvarchar](70) NULL,
	[LYRICISTS2] [nvarchar](70) NULL,
	[LYRICISTS3] [nvarchar](70) NULL,
	[LYRICISTS4] [nvarchar](70) NULL,
	[ID_PIANOROL] [int]  NULL,
	[PICTURE] [nvarchar](100) NULL,
	[SEARCHBOX] [nvarchar](100) NULL,
	[TOTAL_ROWS] [int] NULL,
	[ROW_NUM] [int] NULL,
	[SORT_BY] [nvarchar](50) NULL
)

TRUNCATE TABLE #tempPianorol

SET @SQL = '
INSERT INTO #tempPianorol
(		
[TITLE]
      ,[CATNUM]
      ,[COMPOSERS1]
      ,[PUBLISHER]
      ,[COMPOSERS2]
      ,[COMPOSERS3]
      ,[COMPOSERS4]
      ,[TITLEYEAR]
      ,[PRODTYPE]
      ,[PRODTITLE]
      ,[ARRANGTYPE]
      ,[NOTES1]
      ,[NOTES2]
      ,[id_transfer]
      ,[PRINT]
      ,[NewRec]
      ,[ARRANGYEAR]
      ,[MEDIACAT]
      ,[PERFORMERS1]
      ,[LYRICISTS1]
      ,[COMPANY]
      ,[PERFORMERS2]
      ,[LYRICISTS2]
      ,[LYRICISTS3]
      ,[LYRICISTS4]
      ,[ID_PIANOROL]
      ,[PICTURE]
      ,[SEARCHBOX]
      ,[ROW_NUM]
      ,[TOTAL_ROWS]
      ,[SORT_BY]

	  )
	  SELECT 
[TITLE]
      ,[CATNUM]
      ,[COMPOSERS1]
      ,[PUBLISHER]
      ,[COMPOSERS2]
      ,[COMPOSERS3]
      ,[COMPOSERS4]
      ,[TITLEYEAR]
      ,[PRODTYPE]
      ,[PRODTITLE]
      ,[ARRANGTYPE]
      ,[NOTES1]
      ,[NOTES2]
      ,[id_transfer]
      ,[PRINT]
      ,[NewRec]
      ,[ARRANGYEAR]
      ,[MEDIACAT]
      ,[PERFORMERS1]
      ,[LYRICISTS1]
      ,[COMPANY]
      ,[PERFORMERS2]
      ,[LYRICISTS2]
      ,[LYRICISTS3]
      ,[LYRICISTS4]
      ,[ID_PIANOROL]
      ,[PICTURE]
      ,[SEARCHBOX]
 	,ROW_NUMBER() OVER (ORDER BY ' + 
	CASE 
		WHEN @fSORT_BY = 'TITLE' THEN  'TITLE, PERFORMERS1'
		ELSE @fSORT_BY
	END
	 + ') AS ROW_NUM
	,COUNT(*) OVER () as TOTAL_ROWS
	,SORT_BY
FROM CatalogDb.dbo.Pianorol ' +
IIF(LEN(@WHERECLAUSE) > 0, ' WHERE ' + @WHERECLAUSE,'') 

PRINT @SQL 

EXECUTE sp_executesql @sql

-- Find first occurence of search string
SET @SQL = '
SELECT @retvalOUT = MIN(ROW_NUM) FROM #tempPianorol WHERE LTRIM([' + @fSORT_BY + ']) LIKE + ''' + @fSEARCHBOX + '%'''
PRINT @SQL 

DECLARE @RETVAL INT
DECLARE @ParmDefinition nvarchar(500);
SET @ParmDefinition = N'@retvalOUT int OUTPUT';

EXEC sp_executesql @SQL, @ParmDefinition, @retvalOUT=@retval OUTPUT;

--SELECT @RETVAL

--SELECT MIN(ROW_NUM) FROM #tempOrch WHERE LTRIM(CATNUM) LIKE '10%'

DECLARE @ACTUAL_ROW_START INT = IIF(@fROW_START > 1,0,ISNULL(@RETVAL,0)) + IIF(@fROW_START = 1,0,@fROW_START)

SELECT
*
FROM #tempPianorol o
WHERE o.ROW_NUM >= @ACTUAL_ROW_START AND o.ROW_NUM < @ACTUAL_ROW_START + 20
ORDER BY o.ROW_NUM

RETURN



GO
