USE [TetroPAY_198]
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_CompanyWorkingDayDetails]    Script Date: 13-12-2024 21:45:33 ******/
CREATE TYPE [dbo].[TVP_CompanyWorkingDayDetails] AS TABLE(
	[CompanyWorkingDayId] [tinyint] NULL,
	[Day] [nvarchar](20) NULL,
	[IsWorkingDay] [bit] NULL,
	[CompanyId] [tinyint] NULL
)
GO
