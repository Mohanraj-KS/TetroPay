USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[AttendanceLogDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceLogDetails](
	[AttendanceLogId] [int] IDENTITY(1,1) NOT NULL,
	[AttendanceMachineId] [tinyint] NULL,
	[PunchDate] [date] NOT NULL,
	[PunchTime] [datetime] NOT NULL,
	[Status] [bit] NULL,
	[IsManual] [tinyint] NULL,
	[Description] [nvarchar](400) NULL,
	[AttendanceStatusId] [tinyint] NULL,
	[EmployeeId] [int] NOT NULL,
	[Location] [nvarchar](100) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_AttendanceLogDetails_AttendanceLogId] PRIMARY KEY CLUSTERED 
(
	[AttendanceLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttendanceLogDetails] ADD  CONSTRAINT [DF_AttendanceLogDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AttendanceLogDetails] ADD  CONSTRAINT [DF_AttendanceLogDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AttendanceLogDetails]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceLogDetails_AttendanceMachineDetails_AttendanceMachineId] FOREIGN KEY([AttendanceMachineId])
REFERENCES [dbo].[AttendanceMachineDetails] ([AttendanceMachineId])
GO
ALTER TABLE [dbo].[AttendanceLogDetails] CHECK CONSTRAINT [FK_AttendanceLogDetails_AttendanceMachineDetails_AttendanceMachineId]
GO
ALTER TABLE [dbo].[AttendanceLogDetails]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceLogDetails_AttendanceStatusDetails_AttendanceStatusId] FOREIGN KEY([AttendanceStatusId])
REFERENCES [dbo].[AttendanceStatusDetails] ([AttendanceStatusId])
GO
ALTER TABLE [dbo].[AttendanceLogDetails] CHECK CONSTRAINT [FK_AttendanceLogDetails_AttendanceStatusDetails_AttendanceStatusId]
GO
ALTER TABLE [dbo].[AttendanceLogDetails]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceLogDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[AttendanceLogDetails] CHECK CONSTRAINT [FK_AttendanceLogDetails_CompanyDetails_CompanyId]
GO
ALTER TABLE [dbo].[AttendanceLogDetails]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceLogDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[AttendanceLogDetails] CHECK CONSTRAINT [FK_AttendanceLogDetails_EmployeeDetails_EmployeeId]
GO
