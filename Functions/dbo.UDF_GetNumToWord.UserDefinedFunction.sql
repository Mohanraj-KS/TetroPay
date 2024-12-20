USE [TetroPAY_198]
GO
/****** Object:  UserDefinedFunction [dbo].[UDF_GetNumToWord]    Script Date: 13-12-2024 21:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------USERDEFINEDFUNCTIONS--------------------------

--UDF_GetNumToWord
CREATE   FUNCTION [dbo].[UDF_GetNumToWord]
(
  @M_AMOUNT AS NUMERIC(18,2)
) RETURNS VARCHAR(MAX)
BEGIN
	DECLARE @M_RS AS NUMERIC(18,0)
	DECLARE @M_PAISA AS NUMERIC(18,0)
	DECLARE @M_CURRENT AS NUMERIC(18,0)
	DECLARE @M_RETSTR AS VARCHAR(MAX)
	DECLARE @M_POSTFIX AS VARCHAR(20)    
	DECLARE @M_DIGIWORD AS VARCHAR(100)

	SET @M_AMOUNT = ISNULL(@M_AMOUNT,0)
	SET @M_RS = LEFT(@M_AMOUNT,LEN(@M_AMOUNT)-3)
	SET @M_PAISA = RIGHT(@M_AMOUNT,2)
	SET @M_RETSTR = ''

	IF @M_RS = 0 AND @M_PAISA = 0 
	BEGIN
		SET @M_RETSTR = 'Zero'
	END
	ELSE
	BEGIN
		IF @M_RS = 0
		BEGIN
			SET @M_RETSTR = 'Zero'
		END
		ELSE
		BEGIN
			WHILE @M_RS > 0
			BEGIN
				SELECT @M_CURRENT = 
				CASE  WHEN LEN(@M_RS) = 3  THEN LEFT(@M_RS,1)
					  WHEN LEN(@M_RS) <= 2 THEN LEFT(@M_RS,2)
					  ELSE 
					  CASE    WHEN (LEN(@M_RS)-2) % 2 = 0 THEN LEFT(@M_RS,1) 
							  ELSE LEFT(@M_RS,2) 
							  END
				END
        
				SELECT @M_DIGIWORD = [dbo].[UDF_GetDigit2Word] (@M_CURRENT)

				SELECT @M_POSTFIX = CASE WHEN LEN(@M_RS) = 8 OR LEN(@M_RS) = 9 THEN 'Crore' 
											WHEN LEN(@M_RS) = 6 OR LEN(@M_RS) = 7 THEN 'Lakh' 
											WHEN LEN(@M_RS) = 4 OR LEN(@M_RS) = 5 THEN  'Thousand'
											WHEN LEN(@M_RS) = 3 THEN 'Hundred'
											ELSE '' 
									END
        
				SELECT @M_RS = CASE WHEN LEN(@M_RS) > 2 THEN RIGHT(@M_RS,LEN(@M_RS)-LEN(@M_CURRENT)) ELSE 0 END

				SET @M_RETSTR = @M_RETSTR + ' ' + @M_DIGIWORD + ' ' + @M_POSTFIX
			END
		END

		IF @M_PAISA = 0 
		BEGIN
			SET @M_RETSTR = @M_RETSTR + 'Rupees'
		END
		ELSE
		BEGIN
			SELECT @M_DIGIWORD = [dbo].[UDF_GetDigit2Word] (@M_PAISA)
			SET @M_RETSTR = @M_RETSTR + ' Rupees And ' + @M_DIGIWORD + ' Paisa'
		END
	END
    
  RETURN RTRIM(LTRIM(@M_RETSTR))
END
GO
