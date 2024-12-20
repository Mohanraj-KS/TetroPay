USE [TetroPAY_198]
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_OverTimeDetails]    Script Date: 13-12-2024 21:45:33 ******/
CREATE TYPE [dbo].[TVP_OverTimeDetails] AS TABLE(
	[OverTimeId] [int] NULL,
	[EmployeeId] [int] NULL,
	[Date] [date] NULL,
	[IsForeNoon] [bit] NULL,
	[StartTime] [nvarchar](50) NULL,
	[EndTime] [nvarchar](50) NULL,
	[TotalHours] [nvarchar](50) NULL,
	[OverTimeStatusId] [tinyint] NULL,
	[Comments] [nvarchar](2000) NULL
)
GO
