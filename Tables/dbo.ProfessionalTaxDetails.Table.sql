USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[ProfessionalTaxDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessionalTaxDetails](
	[ProfessionalTaxId] [int] IDENTITY(1,1) NOT NULL,
	[WorkLocationId] [int] NULL,
	[ProfessionalTaxNumber] [nvarchar](50) NULL,
	[DeductionCycle] [nvarchar](50) NULL,
	[CompanyId] [tinyint] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ProfessionalTaxDetails_ProfessionalTaxId] PRIMARY KEY CLUSTERED 
(
	[ProfessionalTaxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProfessionalTaxDetails] ADD  CONSTRAINT [DF_ProfessionalTaxDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProfessionalTaxDetails] ADD  CONSTRAINT [DF_ProfessionalTaxDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProfessionalTaxDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProfessionalTaxDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[ProfessionalTaxDetails] CHECK CONSTRAINT [FK_ProfessionalTaxDetails_CompanyDetails_CompanyId]
GO
