USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[LeaveTypeDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveTypeDetails](
	[LeaveTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[LeaveTypeName] [nvarchar](50) NOT NULL,
	[LeaveTypeDescription] [nvarchar](200) NULL,
	[LeaveCount] [numeric](3, 1) NULL,
	[LeavePeriod] [nvarchar](50) NOT NULL,
	[IsCarryForward] [bit] NULL,
	[MaxCarryForward] [numeric](11, 2) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[PermissionCount] [nvarchar](50) NULL,
 CONSTRAINT [PK_LeaveTypeDetails_LeaveTypeId] PRIMARY KEY CLUSTERED 
(
	[LeaveTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_LeaveTypeDetails_LeaveTypeName] UNIQUE NONCLUSTERED 
(
	[LeaveTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LeaveTypeDetails] ADD  CONSTRAINT [DF_LeaveTypeDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[LeaveTypeDetails] ADD  CONSTRAINT [DF_LeaveTypeDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[LeaveTypeDetails]  WITH CHECK ADD  CONSTRAINT [FK_LeaveTypeDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[LeaveTypeDetails] CHECK CONSTRAINT [FK_LeaveTypeDetails_CompanyDetails_CompanyId]
GO
