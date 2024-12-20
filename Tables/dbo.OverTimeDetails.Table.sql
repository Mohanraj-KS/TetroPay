USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[OverTimeDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OverTimeDetails](
	[OverTimeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[IsForeNoon] [bit] NULL,
	[StartTime] [nvarchar](50) NULL,
	[EndTime] [nvarchar](50) NULL,
	[TotalHours] [nvarchar](50) NULL,
	[OverTimeStatusId] [tinyint] NOT NULL,
	[Comments] [nvarchar](200) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Updatedby] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_OverTimeDetails_OverTimeId] PRIMARY KEY CLUSTERED 
(
	[OverTimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OverTimeDetails] ADD  CONSTRAINT [DF_OverTimeDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[OverTimeDetails] ADD  CONSTRAINT [DF_OverTimeDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[OverTimeDetails]  WITH CHECK ADD  CONSTRAINT [FK_OverTimeDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[OverTimeDetails] CHECK CONSTRAINT [FK_OverTimeDetails_EmployeeDetails_EmployeeId]
GO
ALTER TABLE [dbo].[OverTimeDetails]  WITH CHECK ADD  CONSTRAINT [FK_OverTimeDetails_LeaveStatusDetails_LeaveStatusId] FOREIGN KEY([OverTimeStatusId])
REFERENCES [dbo].[LeavestatusDetails] ([LeaveStatusId])
GO
ALTER TABLE [dbo].[OverTimeDetails] CHECK CONSTRAINT [FK_OverTimeDetails_LeaveStatusDetails_LeaveStatusId]
GO
