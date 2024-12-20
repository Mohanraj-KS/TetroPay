USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[SalaryStructureComponentMappingDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryStructureComponentMappingDetails](
	[SalaryStructureComponentMappingId] [int] IDENTITY(1,1) NOT NULL,
	[SalaryStructureId] [numeric](11, 2) NULL,
	[SalaryComponentsId] [numeric](11, 2) NULL,
	[CompanyId] [tinyint] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_SalaryStructureComponentMappingDetails_SalaryStructureComponentMappingId] PRIMARY KEY CLUSTERED 
(
	[SalaryStructureComponentMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SalaryStructureComponentMappingDetails] ADD  CONSTRAINT [DF_SalaryStructureComponentMappingDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SalaryStructureComponentMappingDetails] ADD  CONSTRAINT [DF_SalaryStructureComponentMappingDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SalaryStructureComponentMappingDetails]  WITH CHECK ADD  CONSTRAINT [FK_SalaryStructureComponentMappingDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[SalaryStructureComponentMappingDetails] CHECK CONSTRAINT [FK_SalaryStructureComponentMappingDetails_CompanyDetails_CompanyId]
GO
