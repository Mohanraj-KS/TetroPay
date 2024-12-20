USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[SalaryComponentsDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryComponentsDetails](
	[SalaryComponentsId] [int] IDENTITY(1,1) NOT NULL,
	[ComponentName] [nvarchar](50) NULL,
	[SalaryComponentTypeId] [int] NULL,
	[CalculationTypeId] [int] NULL,
	[EarningAmount] [numeric](11, 2) NULL,
	[EarningType] [nvarchar](100) NULL,
	[StatusActive] [bit] NULL,
	[Description] [nvarchar](1000) NULL,
	[CompanyId] [tinyint] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_SalaryComponentsDetails_SalaryComponentsId] PRIMARY KEY CLUSTERED 
(
	[SalaryComponentsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SalaryComponentsDetails] ADD  CONSTRAINT [DF_SalaryComponentsDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SalaryComponentsDetails] ADD  CONSTRAINT [DF_SalaryComponentsDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SalaryComponentsDetails]  WITH CHECK ADD  CONSTRAINT [FK_SalaryComponentsDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[SalaryComponentsDetails] CHECK CONSTRAINT [FK_SalaryComponentsDetails_CompanyDetails_CompanyId]
GO
