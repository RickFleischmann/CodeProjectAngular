USE [CatalogDb]
GO
/****** Object:  StoredProcedure [dbo].[Get78]    Script Date: 4/29/2017 9:13:00 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Get78]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Get78]
GO
/****** Object:  StoredProcedure [dbo].[Get78]    Script Date: 4/29/2017 9:13:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Get78]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Get78] AS' 
END
GO

/******
Notes: 
TOTAL_ROWS int
SORT_TBY varchar 50
are extra fields to add to imported tables

exec Get78
@fTITLE = '{}',
@fCATNUM = '{}',
@fCOMP_LYR = '{}',
@fPERFORMER = '{}',
@fPUBLISHER = '{}',
@fPRODTYPE = '{}',
@fPRODTITLE = '{}',
@fARRANGTYPE = '{}',
@fNOTES = '{}',
@fCOMPANY = '{}',
@fRECDAY = '{}',
@fRECMONTH = '{}',
@fRECYEAR = '{}',
@fLOCATION = '{}',
@fPICTURE = '{}',
@fSEARCHBOX = '{}',
@fROW_START = '1',
@fSORT_BY = 'TITLE'


********/
ALTER PROC [dbo].[Get78] 
(
@fTITLE VARCHAR(100),
@fCATNUM VARCHAR(100),
@fCOMP_LYR VARCHAR(100),
@fPERFORMER VARCHAR(100),
@fPUBLISHER VARCHAR(100),
@fPRODTYPE VARCHAR(100),
@fPRODTITLE VARCHAR(100),
@fARRANGTYPE VARCHAR(100),
@fNOTES VARCHAR(100),
@fCOMPANY VARCHAR(100),
@fRECDAY VARCHAR(100),
@fRECMONTH VARCHAR(100),
@fRECYEAR VARCHAR(100),
@fLOCATION VARCHAR(100),
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
SET @fPERFORMER = REPLACE(@fPERFORMER,'''','''''')
SET @fPUBLISHER = REPLACE(@fPUBLISHER,'''','''''')
SET @fPRODTYPE = REPLACE(@fPRODTYPE,'''','''''')
SET @fPRODTITLE = REPLACE(@fPRODTITLE,'''','''''')
SET @fARRANGTYPE = REPLACE(@fARRANGTYPE,'''','''''')
SET @fNOTES = REPLACE(@fNOTES,'''','''''')
SET @fCOMPANY = REPLACE(@fCOMPANY,'''','''''')
SET @fRECDAY = REPLACE(@fRECDAY,'''','''''')
SET @fRECMONTH = REPLACE(@fRECMONTH,'''','''''')
SET @fRECYEAR = REPLACE(@fRECYEAR,'''','''''')
SET @fLOCATION = REPLACE(@fLOCATION,'''','''''')
SET @fPICTURE = REPLACE(@fPICTURE,'''','''''')


BEGIN
	SET @WHERECLAUSE = 
		IIF(@fTITLE <> '{}', 'TITLE LIKE ''%' + @fTITLE + '%'' AND ','') + 
		IIF(@fCOMP_LYR <> '{}', '(COMPOSERS1 LIKE ''%' + @fCOMP_LYR + '%'' OR  COMPOSERS2 LIKE ''%' + @fCOMP_LYR + '%'' OR  COMPOSERS3 LIKE ''%' + @fCOMP_LYR + '%'' OR  COMPOSERS4 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS1 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS2 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS3 LIKE ''%' + @fCOMP_LYR + '%'' OR  LYRICISTS4 LIKE ''%' + @fCOMP_LYR + '%'') AND ','') + 
		IIF(@fPERFORMER <> '{}', '(PERFORMERS1 LIKE ''%' + @fPERFORMER + '%'' OR  PERFORMERS2 LIKE ''%' + @fPERFORMER + '%'' OR  PERFORMERS3 LIKE ''%' + @fPERFORMER + '%'' OR  PERFORMERS4 LIKE ''%' + @fPERFORMER + '%'') AND ','') + 
		IIF(@fCATNUM <> '{}', 'CATNUM LIKE ''%' + @fCATNUM + '%'' AND ','') + 
		IIF(@fPUBLISHER <> '{}', 'PUBLISHER LIKE ''%' + @fPUBLISHER + '%'' AND ','') + 
		IIF(@fPRODTYPE <> '{}', 'PRODTYPE LIKE ''%' + @fPRODTYPE + '%'' AND ','') + 
		IIF(@fPRODTITLE <> '{}', 'PRODTITLE LIKE ''%' + @fPRODTITLE + '%'' AND ','') + 
		IIF(@fARRANGTYPE <> '{}', 'ARRANGTYPE LIKE ''%' + @fARRANGTYPE + '%'' AND ','') + 
		IIF(@fNOTES <> '{}', '(NOTES1 LIKE ''%' + @fNOTES + '%'' OR  NOTES2 LIKE ''%' + @fNOTES + '%'') AND ','') + 
		IIF(@fCOMPANY <> '{}', 'COMPANY LIKE ''%' + @fCOMPANY + '%'' AND ','') + 
		IIF(@fRECDAY <> '{}', 'RECDAY LIKE ''%' + @fRECDAY + '%'' AND ','') + 		
		IIF(@fRECMONTH <> '{}', 'RECMONTH LIKE ''%' + @fRECMONTH + '%'' AND ','') + 		
		IIF(@fRECYEAR <> '{}', 'RECYEAR LIKE ''%' + @fRECYEAR + '%'' AND ','') + 						
		IIF(@fLOCATION <> '{}', 'LOCATION LIKE ''%' + @fLOCATION + '%'' AND ','') + 
		IIF(@fPICTURE <> '{}', 'PICTURE LIKE ''%' + @fPICTURE + '%'' AND ','') 

		SET @WHERECLAUSE = IIF(LEN(@WHERECLAUSE)>0,LEFT(@WHERECLAUSE,LEN(@WHERECLAUSE)-4),'')
END



DECLARE @SQL NVARCHAR(3000)
DECLARE @ROW_COUNT INT

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='#temp78' AND xtype='U')
    CREATE TABLE #temp78 (
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
	[ID_78] [int] NULL,
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
	SEARCHBOX nvarchar(100) NULL,
	ROW_NUM INT NULL,
	TOTAL_ROWS INT NULL,
	SORT_BY VARCHAR(50)
)

TRUNCATE TABLE #temp78

SET @SQL = '
INSERT INTO #temp78
(		

	[TITLE]
      ,[CATNUM]
      ,[COMPOSERS1]
      ,[PUBLISHER]
      ,[COMPOSERS2]
      ,[COMPOSERS3]
      ,[COMPOSERS4]
      ,[PRODTYPE]
      ,[PRODTITLE]
      ,[ARRANGTYPE]
      
	  ,[NOTES1]
      ,[NOTES2]
	  ,[id_transfer]
      ,[PRINT]
      ,[NewRec]
      ,[PERFORMERS1]
      ,[LYRICISTS1]
      ,[COMPANY]
      ,[PERFORMERS2]
      ,[LYRICISTS2]

      ,[LYRICISTS3]
      ,[LYRICISTS4]
      ,[ID_78]
      ,[PERFORMERS3]
      ,[PERFORMERS4]
      ,[DONE]
      ,[MATRIX]
      ,[MATRIX_NUM]
      ,[MATRIX_PREFIX]
      ,[MATRIX_SUFFIX]

      ,[LOCATION]
      ,[PAGE_LINK]
      ,[RecDay]
      ,[RecMonth]
      ,[RecYear]
      ,[FLD1]
      ,[FLD2]
      ,[FLD3]
      ,[FLD4]
      ,[FLD5]

      ,[FLD6]
      ,[FLD7]
      ,[FLD8]
      ,[FLD1_DATA]
      ,[FLD2_DATA]
      ,[FLD3_DATA]
      ,[FLD4_DATA]
      ,[FLD5_DATA]
      ,[FLD6_DATA]
      ,[FLD7_DATA]

      ,[FLD8_DATA]
      ,[FLD_2_COUNT]
      ,[FLD_3_COUNT]
      ,[YEAR_SHEETMUS]
      ,[UCASE_FLD2_DATA]
      ,[PICTURE]
	  ,SEARCHBOX
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
      ,[PRODTYPE]
      ,[PRODTITLE]
      ,[ARRANGTYPE]
      
	  ,[NOTES1]
      ,[NOTES2]
	  ,[id_transfer]
      ,[PRINT]
      ,[NewRec]
      ,[PERFORMERS1]
      ,[LYRICISTS1]
      ,[COMPANY]
      ,[PERFORMERS2]
      ,[LYRICISTS2]

      ,[LYRICISTS3]
      ,[LYRICISTS4]
      ,[ID_78]
      ,[PERFORMERS3]
      ,[PERFORMERS4]
      ,[DONE]
      ,[MATRIX]
      ,[MATRIX_NUM]
      ,[MATRIX_PREFIX]
      ,[MATRIX_SUFFIX]

      ,[LOCATION]
      ,[PAGE_LINK]
      ,[RecDay]
      ,[RecMonth]
      ,[RecYear]
      ,[FLD1]
      ,[FLD2]
      ,[FLD3]
      ,[FLD4]
      ,[FLD5]

      ,[FLD6]
      ,[FLD7]
      ,[FLD8]
      ,[FLD1_DATA]
      ,[FLD2_DATA]
      ,[FLD3_DATA]
      ,[FLD4_DATA]
      ,[FLD5_DATA]
      ,[FLD6_DATA]
      ,[FLD7_DATA]

      ,[FLD8_DATA]
      ,[FLD_2_COUNT]
      ,[FLD_3_COUNT]
      ,[YEAR_SHEETMUS]
      ,[UCASE_FLD2_DATA]
      ,[PICTURE]
	  ,SEARCHBOX
	,ROW_NUMBER() OVER (ORDER BY ' + 
	CASE 
		WHEN @fSORT_BY = 'TITLE' THEN  'TITLE, PERFORMERS1'
		ELSE @fSORT_BY
	END
	 + ') AS ROW_NUM
	,0 as TOTAL_ROWS
	,SORT_BY
FROM CatalogDb.dbo.[78] ' +
IIF(LEN(@WHERECLAUSE) > 0, ' WHERE ' + @WHERECLAUSE,'') 

PRINT @SQL 

EXECUTE sp_executesql @sql

DECLARE @RETVAL INT
DECLARE @ROWCOUNT INT

SELECT
@ROWCOUNT = COUNT(ID_78) 
FROM #temp78

UPDATE T
SET TOTAL_ROWS = @ROWCOUNT
FROM #temp78 T

IF @fSEARCHBOX <> '{}'
BEGIN
-- Find first occurence of search string
SET @SQL = '
SELECT @retvalOUT = MIN(ROW_NUM) FROM #temp78 WHERE LTRIM([' + @fSORT_BY + ']) LIKE + ''' + @fSEARCHBOX + '%'''

PRINT @SQL 


DECLARE @ParmDefinition nvarchar(500);
SET @ParmDefinition = N'@retvalOUT int OUTPUT';

EXEC sp_executesql @SQL, @ParmDefinition, @retvalOUT=@retval OUTPUT;

END

--SELECT @RETVAL

--SELECT MIN(ROW_NUM) FROM #tempSolos WHERE LTRIM(CATNUM) LIKE '10%'

DECLARE @ACTUAL_ROW_START INT = IIF(@fROW_START > 1,0,ISNULL(@RETVAL,0)) + IIF(@fROW_START = 1,0,@fROW_START)

SELECT
*
FROM #temp78 o
WHERE o.ROW_NUM >= @ACTUAL_ROW_START AND o.ROW_NUM < @ACTUAL_ROW_START + 20
GO
