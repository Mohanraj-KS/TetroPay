USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[PFDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PFDetails](
	[EmployeePFId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeePFNumber] [nvarchar](50) NULL,
	[DeductionCycle] [nvarchar](50) NULL,
	[EmployeeContributionRateId] [int] NULL,
	[EmployeeContributionRate] [nvarchar](100) NULL,
	[EmployerContributionRateId] [int] NULL,
	[EmployerContributionRate] [nvarchar](100) NULL,
	[VoluntaryProvidentFund] [bit] NULL,
	[CompanyId] [tinyint] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PFDetails_EmployeePFId] PRIMARY KEY CLUSTERED 
(
	[EmployeePFId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PFDetails] ADD  CONSTRAINT [DF_PFDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PFDetails] ADD  CONSTRAINT [DF_PFDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PFDetails]  WITH CHECK ADD  CONSTRAINT [FK_PFDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[PFDetails] CHECK CONSTRAINT [FK_PFDetails_CompanyDetails_CompanyId]
GO
