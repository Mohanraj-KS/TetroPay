USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[EmpAttendanceMachineMappingDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpAttendanceMachineMappingDetails](
	[EmpAttendanceMachineMappingId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NULL,
	[AttendanceMachineId] [tinyint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_EmpAttendanceMachineMappingDetails_EmpAttendanceMachineMappingId] PRIMARY KEY CLUSTERED 
(
	[EmpAttendanceMachineMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmpAttendanceMachineMappingDetails] ADD  CONSTRAINT [DF_EmpAttendanceMachineMappingDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmpAttendanceMachineMappingDetails] ADD  CONSTRAINT [DF_EmpAttendanceMachineMappingDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmpAttendanceMachineMappingDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmpAttendanceMachineMappingDetails_AttendanceMachineDetails_AttendanceMachineId] FOREIGN KEY([AttendanceMachineId])
REFERENCES [dbo].[AttendanceMachineDetails] ([AttendanceMachineId])
GO
ALTER TABLE [dbo].[EmpAttendanceMachineMappingDetails] CHECK CONSTRAINT [FK_EmpAttendanceMachineMappingDetails_AttendanceMachineDetails_AttendanceMachineId]
GO
ALTER TABLE [dbo].[EmpAttendanceMachineMappingDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmpAttendanceMachineMappingDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmpAttendanceMachineMappingDetails] CHECK CONSTRAINT [FK_EmpAttendanceMachineMappingDetails_EmployeeDetails_EmployeeId]
GO
