USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[EmployeeShiftMappingDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeShiftMappingDetails](
	[EmployeeShiftMappingId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [tinyint] NULL,
	[EmployeeId] [int] NULL,
	[ShiftId] [tinyint] NULL,
	[IsWeekly] [bit] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Description] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_EmployeeShiftMappingDetails_EmployeeShiftMappingId] PRIMARY KEY CLUSTERED 
(
	[EmployeeShiftMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeShiftMappingDetails] ADD  CONSTRAINT [DF_EmployeeShiftMappingDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmployeeShiftMappingDetails] ADD  CONSTRAINT [DF_EmployeeShiftMappingDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeShiftMappingDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeShiftMappingDetails_DepartmentDetails_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DepartmentDetails] ([DepartmentId])
GO
ALTER TABLE [dbo].[EmployeeShiftMappingDetails] CHECK CONSTRAINT [FK_EmployeeShiftMappingDetails_DepartmentDetails_DepartmentId]
GO
ALTER TABLE [dbo].[EmployeeShiftMappingDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeShiftMappingDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeeShiftMappingDetails] CHECK CONSTRAINT [FK_EmployeeShiftMappingDetails_EmployeeDetails_EmployeeId]
GO
ALTER TABLE [dbo].[EmployeeShiftMappingDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeShiftMappingDetails_ShiftDetails_ShiftId] FOREIGN KEY([ShiftId])
REFERENCES [dbo].[ShiftDetails] ([ShiftId])
GO
ALTER TABLE [dbo].[EmployeeShiftMappingDetails] CHECK CONSTRAINT [FK_EmployeeShiftMappingDetails_ShiftDetails_ShiftId]
GO
