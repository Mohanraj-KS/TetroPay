USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[PaySlipDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaySlipDetails](
	[PaySlipId] [int] IDENTITY(1,1) NOT NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[EffectiveWorkDays] [numeric](4, 2) NOT NULL,
	[LOP] [numeric](4, 2) NOT NULL,
	[BasicPay] [numeric](11, 2) NOT NULL,
	[HRA] [numeric](11, 2) NOT NULL,
	[OtherAllowance] [numeric](11, 2) NOT NULL,
	[Claim] [numeric](11, 2) NULL,
	[Bonus] [numeric](11, 2) NULL,
	[TotalEarning] [numeric](11, 2) NOT NULL,
	[PF] [numeric](11, 2) NULL,
	[ESI] [numeric](11, 2) NULL,
	[IncomeTax] [numeric](11, 2) NOT NULL,
	[LeaveDeduction] [numeric](11, 2) NOT NULL,
	[AdvanceAmount] [numeric](11, 2) NULL,
	[LoanDueAmount] [numeric](11, 2) NULL,
	[OtherDeduction] [numeric](11, 2) NULL,
	[TotalDeduction] [numeric](11, 2) NOT NULL,
	[NetPay] [numeric](11, 2) NOT NULL,
	[PaymentMode] [nvarchar](25) NOT NULL,
	[PayslipStatus] [tinyint] NULL,
	[Comments] [nvarchar](4000) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PaySlipDetails_PaySlipId] PRIMARY KEY CLUSTERED 
(
	[PaySlipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PaySlipDetails] ADD  CONSTRAINT [DF_PayslipDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PaySlipDetails] ADD  CONSTRAINT [DF_PayslipDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PaySlipDetails]  WITH CHECK ADD  CONSTRAINT [FK_PaySlipDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[PaySlipDetails] CHECK CONSTRAINT [FK_PaySlipDetails_CompanyDetails_CompanyId]
GO
