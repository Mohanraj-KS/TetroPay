USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[EmployeeSalaryDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSalaryDetails](
	[EmployeeSalaryId] [int] IDENTITY(1,1) NOT NULL,
	[PayTypeId] [tinyint] NULL,
	[PaymentTypeId] [tinyint] NULL,
	[CTC] [numeric](11, 2) NULL,
	[MonthlySalary] [numeric](11, 2) NULL,
	[BasicPay] [numeric](11, 2) NULL,
	[HRA] [numeric](11, 2) NULL,
	[OtherAllowence] [numeric](11, 2) NULL,
	[IncomeTax] [numeric](11, 2) NULL,
	[EmployeeId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_EmployeeSalaryDetails_EmployeeSalaryId] PRIMARY KEY CLUSTERED 
(
	[EmployeeSalaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeSalaryDetails] ADD  CONSTRAINT [DF_EmployeeSalaryDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmployeeSalaryDetails] ADD  CONSTRAINT [DF_EmployeeSalaryDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeSalaryDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSalaryDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeeSalaryDetails] CHECK CONSTRAINT [FK_EmployeeSalaryDetails_EmployeeDetails_EmployeeId]
GO
ALTER TABLE [dbo].[EmployeeSalaryDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSalaryDetails_PaymentTypeDetails_PaymentTypeId] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentTypeDetails] ([PaymentTypeId])
GO
ALTER TABLE [dbo].[EmployeeSalaryDetails] CHECK CONSTRAINT [FK_EmployeeSalaryDetails_PaymentTypeDetails_PaymentTypeId]
GO
ALTER TABLE [dbo].[EmployeeSalaryDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSalaryDetails_PayTypeDetails_PayTypeId] FOREIGN KEY([PayTypeId])
REFERENCES [dbo].[PayTypeDetails] ([PayTypeId])
GO
ALTER TABLE [dbo].[EmployeeSalaryDetails] CHECK CONSTRAINT [FK_EmployeeSalaryDetails_PayTypeDetails_PayTypeId]
GO
