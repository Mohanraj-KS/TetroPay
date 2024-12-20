USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[AttendanceStatusDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceStatusDetails](
	[AttendanceStatusId] [tinyint] IDENTITY(1,1) NOT NULL,
	[AttendanceStatusName] [nvarchar](50) NOT NULL,
	[AttendanceStatusDescription] [nvarchar](200) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_AttendanceStatusDetails_AttendanceStatusId] PRIMARY KEY CLUSTERED 
(
	[AttendanceStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_AttendanceStatusDetails_AttendanceStatusName] UNIQUE NONCLUSTERED 
(
	[AttendanceStatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttendanceStatusDetails] ADD  CONSTRAINT [DF_AttendanceStatusDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AttendanceStatusDetails] ADD  CONSTRAINT [DF_AttendanceStatusDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AttendanceStatusDetails]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceStatusDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[AttendanceStatusDetails] CHECK CONSTRAINT [FK_AttendanceStatusDetails_CompanyDetails_CompanyId]
GO
