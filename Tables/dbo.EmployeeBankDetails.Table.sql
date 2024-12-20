USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[EmployeeBankDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeBankDetails](
	[EmployeeBankId] [tinyint] IDENTITY(1,1) NOT NULL,
	[EmployeeBankName] [nvarchar](100) NOT NULL,
	[AccountTypeId] [tinyint] NOT NULL,
	[AccountName] [nvarchar](100) NOT NULL,
	[AccountNumber] [nvarchar](100) NOT NULL,
	[IFSCCode] [nvarchar](100) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_EmployeeBankDetails_EmployeeBankId] PRIMARY KEY CLUSTERED 
(
	[EmployeeBankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_EmployeeBankDetails_AccountNumber_EmployeeId] UNIQUE NONCLUSTERED 
(
	[AccountNumber] ASC,
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeBankDetails] ADD  CONSTRAINT [DF_EmployeeBankDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmployeeBankDetails] ADD  CONSTRAINT [DF_EmployeeBankDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeBankDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeBankDetails_AccountTypeDetails_AccountTypeId] FOREIGN KEY([AccountTypeId])
REFERENCES [dbo].[AccountTypeDetails] ([AccountTypeId])
GO
ALTER TABLE [dbo].[EmployeeBankDetails] CHECK CONSTRAINT [FK_EmployeeBankDetails_AccountTypeDetails_AccountTypeId]
GO
ALTER TABLE [dbo].[EmployeeBankDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeBankDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeeBankDetails] CHECK CONSTRAINT [FK_EmployeeBankDetails_EmployeeDetails_EmployeeId]
GO
