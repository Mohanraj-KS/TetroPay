USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[LeavestatusDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeavestatusDetails](
	[LeaveStatusId] [tinyint] IDENTITY(1,1) NOT NULL,
	[LeaveStatusName] [nvarchar](20) NOT NULL,
	[LeaveStatusDescription] [nvarchar](100) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_LeavestatusDetails_LeaveStatusId] PRIMARY KEY CLUSTERED 
(
	[LeaveStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_LeavestatusDetails_LeaveStatusName] UNIQUE NONCLUSTERED 
(
	[LeaveStatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LeavestatusDetails] ADD  CONSTRAINT [DF_LeavestatusDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[LeavestatusDetails] ADD  CONSTRAINT [DF_LeavestatusDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[LeavestatusDetails]  WITH CHECK ADD  CONSTRAINT [FK_LeavestatusDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[LeavestatusDetails] CHECK CONSTRAINT [FK_LeavestatusDetails_CompanyDetails_CompanyId]
GO
