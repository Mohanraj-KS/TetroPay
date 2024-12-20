USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[RegularizationDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegularizationDetails](
	[RegularizationId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[PunchType] [nvarchar](50) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[Reason] [nvarchar](500) NULL,
	[RegularizationStatusId] [tinyint] NULL,
	[Comments] [nvarchar](2000) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Updatedby] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_RegularizationDetails_RegularizationId] PRIMARY KEY CLUSTERED 
(
	[RegularizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RegularizationDetails] ADD  CONSTRAINT [DF_RegularizationDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RegularizationDetails] ADD  CONSTRAINT [DF_RegularizationDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[RegularizationDetails]  WITH CHECK ADD  CONSTRAINT [FK_RegularizationDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[RegularizationDetails] CHECK CONSTRAINT [FK_RegularizationDetails_CompanyDetails_CompanyId]
GO
ALTER TABLE [dbo].[RegularizationDetails]  WITH CHECK ADD  CONSTRAINT [FK_RegularizationDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[RegularizationDetails] CHECK CONSTRAINT [FK_RegularizationDetails_EmployeeDetails_EmployeeId]
GO
ALTER TABLE [dbo].[RegularizationDetails]  WITH CHECK ADD  CONSTRAINT [FK_RegularizationDetails_LeaveStatusDetails_LeaveStatusId] FOREIGN KEY([RegularizationStatusId])
REFERENCES [dbo].[LeavestatusDetails] ([LeaveStatusId])
GO
ALTER TABLE [dbo].[RegularizationDetails] CHECK CONSTRAINT [FK_RegularizationDetails_LeaveStatusDetails_LeaveStatusId]
GO
