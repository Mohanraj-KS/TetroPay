USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[CompensatoryOffDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompensatoryOffDetails](
	[CompensatoryOffId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[CompensatoryOffDate] [date] NOT NULL,
	[IsHalfDay] [bit] NOT NULL,
	[NoOfDays] [numeric](11, 2) NOT NULL,
	[CompensatoryOffDescription] [nvarchar](200) NULL,
	[CompensatoryOffTypeId] [tinyint] NULL,
	[CompensatoryOffStatusId] [tinyint] NOT NULL,
	[Comments] [nvarchar](200) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Updatedby] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_CompensatoryOffDetails_CompensatoryOffId] PRIMARY KEY CLUSTERED 
(
	[CompensatoryOffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompensatoryOffDetails] ADD  CONSTRAINT [DF_CompensatoryOffDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CompensatoryOffDetails] ADD  CONSTRAINT [DF_CompensatoryOffDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CompensatoryOffDetails]  WITH CHECK ADD  CONSTRAINT [FK_CompensatoryOffDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[CompensatoryOffDetails] CHECK CONSTRAINT [FK_CompensatoryOffDetails_CompanyDetails_CompanyId]
GO
ALTER TABLE [dbo].[CompensatoryOffDetails]  WITH CHECK ADD  CONSTRAINT [FK_CompensatoryOffDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[CompensatoryOffDetails] CHECK CONSTRAINT [FK_CompensatoryOffDetails_EmployeeDetails_EmployeeId]
GO
ALTER TABLE [dbo].[CompensatoryOffDetails]  WITH CHECK ADD  CONSTRAINT [FK_CompensatoryOffDetails_LeaveStatusDetails_LeaveStatusId] FOREIGN KEY([CompensatoryOffStatusId])
REFERENCES [dbo].[LeavestatusDetails] ([LeaveStatusId])
GO
ALTER TABLE [dbo].[CompensatoryOffDetails] CHECK CONSTRAINT [FK_CompensatoryOffDetails_LeaveStatusDetails_LeaveStatusId]
GO
ALTER TABLE [dbo].[CompensatoryOffDetails]  WITH CHECK ADD  CONSTRAINT [FK_CompensatoryOffDetails_LeaveTypeDetails_LeaveTypeId] FOREIGN KEY([CompensatoryOffTypeId])
REFERENCES [dbo].[LeaveTypeDetails] ([LeaveTypeId])
GO
ALTER TABLE [dbo].[CompensatoryOffDetails] CHECK CONSTRAINT [FK_CompensatoryOffDetails_LeaveTypeDetails_LeaveTypeId]
GO
