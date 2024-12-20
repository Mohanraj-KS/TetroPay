USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[LeaveDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveDetails](
	[LeaveId] [int] IDENTITY(1,1) NOT NULL,
	[FromDate] [date] NOT NULL,
	[ToDate] [date] NOT NULL,
	[IsHalfDay] [bit] NOT NULL,
	[IsFirstHalf] [bit] NULL,
	[NoOfDays] [numeric](4, 2) NOT NULL,
	[LeaveDescription] [nvarchar](200) NULL,
	[LeaveTypeId] [tinyint] NULL,
	[LeaveStatusId] [tinyint] NOT NULL,
	[Comments] [nvarchar](200) NULL,
	[EmployeeId] [int] NOT NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Updatedby] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_LeaveDetails_LeaveId] PRIMARY KEY CLUSTERED 
(
	[LeaveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LeaveDetails] ADD  CONSTRAINT [DF_LeaveDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[LeaveDetails] ADD  CONSTRAINT [DF_LeaveDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[LeaveDetails]  WITH CHECK ADD  CONSTRAINT [FK_LeaveDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[LeaveDetails] CHECK CONSTRAINT [FK_LeaveDetails_CompanyDetails_CompanyId]
GO
ALTER TABLE [dbo].[LeaveDetails]  WITH CHECK ADD  CONSTRAINT [FK_LeaveDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[LeaveDetails] CHECK CONSTRAINT [FK_LeaveDetails_EmployeeDetails_EmployeeId]
GO
ALTER TABLE [dbo].[LeaveDetails]  WITH CHECK ADD  CONSTRAINT [FK_LeaveDetails_LeaveStatusDetails_LeaveStatusId] FOREIGN KEY([LeaveStatusId])
REFERENCES [dbo].[LeavestatusDetails] ([LeaveStatusId])
GO
ALTER TABLE [dbo].[LeaveDetails] CHECK CONSTRAINT [FK_LeaveDetails_LeaveStatusDetails_LeaveStatusId]
GO
ALTER TABLE [dbo].[LeaveDetails]  WITH CHECK ADD  CONSTRAINT [FK_LeaveDetails_LeaveTypeDetails_LeaveTypeId] FOREIGN KEY([LeaveTypeId])
REFERENCES [dbo].[LeaveTypeDetails] ([LeaveTypeId])
GO
ALTER TABLE [dbo].[LeaveDetails] CHECK CONSTRAINT [FK_LeaveDetails_LeaveTypeDetails_LeaveTypeId]
GO
