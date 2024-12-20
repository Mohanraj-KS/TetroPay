USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[SalaryStructureDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryStructureDetails](
	[SalaryStructureId] [int] IDENTITY(1,1) NOT NULL,
	[SalaryStructureName] [nvarchar](100) NOT NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_SalaryStructureDetails_SalaryStructureId] PRIMARY KEY CLUSTERED 
(
	[SalaryStructureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SalaryStructureDetails] ADD  CONSTRAINT [DF_SalaryStructureDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SalaryStructureDetails] ADD  CONSTRAINT [DF_SalaryStructureDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SalaryStructureDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmpAttendanceMachineMappingDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[SalaryStructureDetails] CHECK CONSTRAINT [FK_EmpAttendanceMachineMappingDetails_CompanyDetails_CompanyId]
GO
