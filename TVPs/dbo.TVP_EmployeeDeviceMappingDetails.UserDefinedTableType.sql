USE [TetroPAY_198]
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_EmployeeDeviceMappingDetails]    Script Date: 13-12-2024 21:45:33 ******/
CREATE TYPE [dbo].[TVP_EmployeeDeviceMappingDetails] AS TABLE(
	[EmployeeDeviceMappingId] [int] NULL,
	[EmployeeId] [int] NULL,
	[AttendanceMachineId] [int] NULL,
	[Status] [bit] NULL,
	[IsBlock] [bit] NULL
)
GO
