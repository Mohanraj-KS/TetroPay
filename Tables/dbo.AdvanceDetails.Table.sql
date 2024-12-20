USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[AdvanceDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvanceDetails](
	[AdvanceId] [int] IDENTITY(1,1) NOT NULL,
	[AdvanceDate] [datetime] NOT NULL,
	[EmployeeId] [int] NULL,
	[AdvanceAmount] [numeric](11, 2) NOT NULL,
	[DueAmount] [numeric](11, 2) NULL,
	[AdvanceStatusId] [tinyint] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Comments] [nvarchar](200) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_AdvanceDetails_AdvanceId] PRIMARY KEY CLUSTERED 
(
	[AdvanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdvanceDetails] ADD  CONSTRAINT [DF_AdvanceDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AdvanceDetails] ADD  CONSTRAINT [DF_AdvanceDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AdvanceDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdvanceDetails_AdvanceStatusDetails_AdvanceStatusId] FOREIGN KEY([AdvanceStatusId])
REFERENCES [dbo].[LeavestatusDetails] ([LeaveStatusId])
GO
ALTER TABLE [dbo].[AdvanceDetails] CHECK CONSTRAINT [FK_AdvanceDetails_AdvanceStatusDetails_AdvanceStatusId]
GO
ALTER TABLE [dbo].[AdvanceDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdvanceDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[AdvanceDetails] CHECK CONSTRAINT [FK_AdvanceDetails_CompanyDetails_CompanyId]
GO
ALTER TABLE [dbo].[AdvanceDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdvanceDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[AdvanceDetails] CHECK CONSTRAINT [FK_AdvanceDetails_EmployeeDetails_EmployeeId]
GO
