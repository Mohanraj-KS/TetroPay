USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[ProfessionalTaxSlabMappingDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessionalTaxSlabMappingDetails](
	[ProfessionalTaxSlabMappingId] [int] IDENTITY(1,1) NOT NULL,
	[StartRange] [numeric](11, 2) NULL,
	[EndRange] [numeric](11, 2) NULL,
	[HalfYearlyTaxAmount] [numeric](11, 2) NULL,
	[ProfessionalTaxId] [int] NULL,
	[CompanyId] [tinyint] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ProfessionalTaxSlabMappingDetails_ProfessionalTaxSlabMappingId] PRIMARY KEY CLUSTERED 
(
	[ProfessionalTaxSlabMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProfessionalTaxSlabMappingDetails] ADD  CONSTRAINT [DF_ProfessionalTaxSlabMappingDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProfessionalTaxSlabMappingDetails] ADD  CONSTRAINT [DF_ProfessionalTaxSlabMappingDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProfessionalTaxSlabMappingDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProfessionalTaxSlabMappingDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[ProfessionalTaxSlabMappingDetails] CHECK CONSTRAINT [FK_ProfessionalTaxSlabMappingDetails_CompanyDetails_CompanyId]
GO
