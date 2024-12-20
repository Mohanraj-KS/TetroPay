USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[CompanyWorkingDayDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyWorkingDayDetails](
	[CompanyWorkingDayId] [int] IDENTITY(1,1) NOT NULL,
	[Day] [nvarchar](20) NOT NULL,
	[IsWorkingDay] [bit] NOT NULL,
	[WorkingHours] [decimal](9, 2) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [date] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK_CompanyWorkingDayDetails_WorkingDayId] PRIMARY KEY CLUSTERED 
(
	[CompanyWorkingDayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyWorkingDayDetails] ADD  CONSTRAINT [DF_CompanyWorkingDayDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CompanyWorkingDayDetails] ADD  CONSTRAINT [DF_CompanyWorkingDayDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CompanyWorkingDayDetails]  WITH CHECK ADD  CONSTRAINT [FK_CompanyWorkingDayDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[CompanyWorkingDayDetails] CHECK CONSTRAINT [FK_CompanyWorkingDayDetails_CompanyDetails_CompanyId]
GO
