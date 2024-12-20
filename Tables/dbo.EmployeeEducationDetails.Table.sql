USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[EmployeeEducationDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeEducationDetails](
	[EducationId] [tinyint] IDENTITY(1,1) NOT NULL,
	[InstituteName] [nvarchar](100) NOT NULL,
	[PeriodFrom] [datetime] NOT NULL,
	[PeriodTo] [datetime] NOT NULL,
	[Degree] [nvarchar](100) NOT NULL,
	[Course] [nvarchar](100) NOT NULL,
	[Grade] [nvarchar](10) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_EmployeeEducationDetails_EducationId] PRIMARY KEY CLUSTERED 
(
	[EducationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeEducationDetails] ADD  CONSTRAINT [DF_EmployeeEducationDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmployeeEducationDetails] ADD  CONSTRAINT [DF_EmployeeEducationDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeEducationDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeEducationDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeeEducationDetails] CHECK CONSTRAINT [FK_EmployeeEducationDetails_EmployeeDetails_EmployeeId]
GO
