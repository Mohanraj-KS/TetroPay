USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[LoanDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanDetails](
	[LoanId] [int] IDENTITY(1,1) NOT NULL,
	[LoanDate] [datetime] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[LoanAmount] [numeric](11, 2) NOT NULL,
	[NoOfDues] [tinyint] NOT NULL,
	[DueAmount] [numeric](11, 2) NOT NULL,
	[CompletedDue] [int] NULL,
	[PendingDues] [tinyint] NULL,
	[PendingAmount] [numeric](11, 2) NULL,
	[LoanStatusId] [tinyint] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Comments] [nvarchar](200) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_LoanDetails_LoanId] PRIMARY KEY CLUSTERED 
(
	[LoanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LoanDetails] ADD  CONSTRAINT [DF_LoanDetails_IsActive]  DEFAULT ('1') FOR [IsActive]
GO
ALTER TABLE [dbo].[LoanDetails] ADD  CONSTRAINT [DF_LoanDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[LoanDetails]  WITH CHECK ADD  CONSTRAINT [FK_LoanDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[LoanDetails] CHECK CONSTRAINT [FK_LoanDetails_CompanyDetails_CompanyId]
GO
ALTER TABLE [dbo].[LoanDetails]  WITH CHECK ADD  CONSTRAINT [FK_LoanDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[LoanDetails] CHECK CONSTRAINT [FK_LoanDetails_EmployeeDetails_EmployeeId]
GO
ALTER TABLE [dbo].[LoanDetails]  WITH CHECK ADD  CONSTRAINT [FK_LoanDetails_LeaveStatusDetails_LeaveStatusId] FOREIGN KEY([LoanStatusId])
REFERENCES [dbo].[LeavestatusDetails] ([LeaveStatusId])
GO
ALTER TABLE [dbo].[LoanDetails] CHECK CONSTRAINT [FK_LoanDetails_LeaveStatusDetails_LeaveStatusId]
GO
