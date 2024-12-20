USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[EmployeeTypeStructureMappingDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeTypeStructureMappingDetails](
	[EmployeeTypeStructureMappingId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeType] [nvarchar](100) NOT NULL,
	[SalaryStructureId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_EmployeeTypeStructureMappingDetails_EmployeeTypeStructureMappingId] PRIMARY KEY CLUSTERED 
(
	[EmployeeTypeStructureMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeTypeStructureMappingDetails] ADD  CONSTRAINT [DF_EmployeeTypeStructureMappingDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmployeeTypeStructureMappingDetails] ADD  CONSTRAINT [DF_EmployeeTypeStructureMappingDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeTypeStructureMappingDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTypeStructureMappingDetails_SalaryStructureDetails_SalaryStructureId] FOREIGN KEY([SalaryStructureId])
REFERENCES [dbo].[SalaryStructureDetails] ([SalaryStructureId])
GO
ALTER TABLE [dbo].[EmployeeTypeStructureMappingDetails] CHECK CONSTRAINT [FK_EmployeeTypeStructureMappingDetails_SalaryStructureDetails_SalaryStructureId]
GO
