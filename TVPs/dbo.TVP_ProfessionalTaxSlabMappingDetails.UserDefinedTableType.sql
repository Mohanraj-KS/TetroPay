USE [TetroPAY_198]
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_ProfessionalTaxSlabMappingDetails]    Script Date: 13-12-2024 21:45:33 ******/
CREATE TYPE [dbo].[TVP_ProfessionalTaxSlabMappingDetails] AS TABLE(
	[ProfessionalTaxSlabMappingId] [int] NULL,
	[StartRange] [numeric](11, 2) NULL,
	[EndRange] [numeric](11, 2) NULL,
	[HalfYearlyTaxAmount] [numeric](11, 2) NULL,
	[ProfessionalTaxId] [int] NULL
)
GO
