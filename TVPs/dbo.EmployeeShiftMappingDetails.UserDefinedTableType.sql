USE [TetroPAY_198]
GO
/****** Object:  UserDefinedTableType [dbo].[EmployeeShiftMappingDetails]    Script Date: 13-12-2024 21:45:33 ******/
CREATE TYPE [dbo].[EmployeeShiftMappingDetails] AS TABLE(
	[EmployeeId] [int] NULL,
	[IsActive] [bit] NULL
)
GO
