USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[PermissionDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionDetails](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[PermissionDate] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[NoOfHours] [numeric](4, 2) NOT NULL,
	[PermissionTypeId] [tinyint] NULL,
	[PermissionStatusId] [tinyint] NOT NULL,
	[PermissionDescription] [nvarchar](400) NULL,
	[Comments] [nvarchar](200) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Updatedby] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PermissionDetails_PermissionId] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PermissionDetails] ADD  CONSTRAINT [DF_PermissionDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PermissionDetails] ADD  CONSTRAINT [DF_PermissionDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PermissionDetails]  WITH CHECK ADD  CONSTRAINT [FK_PermissionDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[PermissionDetails] CHECK CONSTRAINT [FK_PermissionDetails_CompanyDetails_CompanyId]
GO
ALTER TABLE [dbo].[PermissionDetails]  WITH CHECK ADD  CONSTRAINT [FK_PermissionDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[PermissionDetails] CHECK CONSTRAINT [FK_PermissionDetails_EmployeeDetails_EmployeeId]
GO
ALTER TABLE [dbo].[PermissionDetails]  WITH CHECK ADD  CONSTRAINT [FK_PermissionDetails_LeaveStatusDetails_LeaveStatusId] FOREIGN KEY([PermissionStatusId])
REFERENCES [dbo].[LeavestatusDetails] ([LeaveStatusId])
GO
ALTER TABLE [dbo].[PermissionDetails] CHECK CONSTRAINT [FK_PermissionDetails_LeaveStatusDetails_LeaveStatusId]
GO
ALTER TABLE [dbo].[PermissionDetails]  WITH CHECK ADD  CONSTRAINT [FK_PermissionDetails_LeaveTypeDetails_LeaveTypeId] FOREIGN KEY([PermissionTypeId])
REFERENCES [dbo].[LeaveTypeDetails] ([LeaveTypeId])
GO
ALTER TABLE [dbo].[PermissionDetails] CHECK CONSTRAINT [FK_PermissionDetails_LeaveTypeDetails_LeaveTypeId]
GO
