USE [TetroPAY_198]
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_SalaryStructureComponentMappingDetails]    Script Date: 13-12-2024 21:45:33 ******/
CREATE TYPE [dbo].[TVP_SalaryStructureComponentMappingDetails] AS TABLE(
	[SalaryStructureComponentMappingId] [int] NULL,
	[SalaryStructureId] [int] NULL,
	[SalaryComponentsId] [int] NULL,
	[IsActive] [bit] NULL
)
GO
