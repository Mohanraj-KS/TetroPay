USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[PayrollsettingDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayrollsettingDetails](
	[PayrollsettingId] [tinyint] IDENTITY(1,1) NOT NULL,
	[IsPayrollManual] [bit] NOT NULL,
	[ProcessingMonth] [nvarchar](50) NULL,
	[PayrollDate] [tinyint] NULL,
	[SalaryPaymentMode] [nvarchar](25) NULL,
	[PayslipModel] [nvarchar](25) NULL,
	[CurrencyId] [int] NULL,
	[AdvanceLimit] [nvarchar](50) NULL,
	[AdvanceMaxAmount] [numeric](11, 2) NULL,
	[LoanLimit] [nvarchar](50) NULL,
	[LoanMaxAmount] [numeric](11, 2) NULL,
	[PaymentTypeId] [tinyint] NULL,
	[PayTypeId] [tinyint] NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PayrollsettingDetails_PayrollsettingId] PRIMARY KEY CLUSTERED 
(
	[PayrollsettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PayrollsettingDetails] ADD  CONSTRAINT [DF_PayrollsettingDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PayrollsettingDetails] ADD  CONSTRAINT [DF_PayrollsettingDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PayrollsettingDetails]  WITH CHECK ADD  CONSTRAINT [FK_PayrollsettingDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[PayrollsettingDetails] CHECK CONSTRAINT [FK_PayrollsettingDetails_CompanyDetails_CompanyId]
GO
