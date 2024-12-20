USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[ESIDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESIDetails](
	[EmployeeESIId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeESINumber] [nvarchar](50) NULL,
	[DeductionCycle] [nvarchar](50) NULL,
	[EmployeeContribution] [nvarchar](50) NULL,
	[EmployerContribution] [nvarchar](50) NULL,
	[ISEmployerContribution] [bit] NULL,
	[CompanyId] [tinyint] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ESIDetails_EmployeeESIId] PRIMARY KEY CLUSTERED 
(
	[EmployeeESIId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ESIDetails] ADD  CONSTRAINT [DF_ESIDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ESIDetails] ADD  CONSTRAINT [DF_ESIDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ESIDetails]  WITH CHECK ADD  CONSTRAINT [FK_ESIDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[ESIDetails] CHECK CONSTRAINT [FK_ESIDetails_CompanyDetails_CompanyId]
GO
