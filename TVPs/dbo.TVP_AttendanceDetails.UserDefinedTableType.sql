USE [TetroPAY_198]
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_AttendanceDetails]    Script Date: 13-12-2024 21:45:33 ******/
CREATE TYPE [dbo].[TVP_AttendanceDetails] AS TABLE(
	[EmployeeId] [int] NULL,
	[PunchIn] [datetime] NULL,
	[PunchOut] [datetime] NULL
)
GO
