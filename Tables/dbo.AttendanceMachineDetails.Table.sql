USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[AttendanceMachineDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceMachineDetails](
	[AttendanceMachineId] [tinyint] IDENTITY(1,1) NOT NULL,
	[AttendanceMachineName] [nvarchar](50) NOT NULL,
	[MachineDescription] [nvarchar](200) NULL,
	[SerialNo] [nvarchar](100) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_AttendanceMachineDetails_AttendanceMachineId] PRIMARY KEY CLUSTERED 
(
	[AttendanceMachineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_AttendanceMachineDetails_AttendanceMachineName] UNIQUE NONCLUSTERED 
(
	[AttendanceMachineName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttendanceMachineDetails] ADD  CONSTRAINT [DF_AttendanceMachineDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AttendanceMachineDetails] ADD  CONSTRAINT [DF_AttendanceMachineDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AttendanceMachineDetails]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceMachineDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[AttendanceMachineDetails] CHECK CONSTRAINT [FK_AttendanceMachineDetails_CompanyDetails_CompanyId]
GO
