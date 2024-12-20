USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[EmployeeExperienceDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeExperienceDetails](
	[EmployeeExperienceId] [tinyint] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[Location] [nvarchar](100) NOT NULL,
	[Designation] [nvarchar](100) NOT NULL,
	[PeriodFrom] [date] NOT NULL,
	[PeriodTo] [date] NULL,
	[IsPresent] [bit] NULL,
	[EmployeeId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_EmployeeExperienceDetails_EmployeeExperienceId] PRIMARY KEY CLUSTERED 
(
	[EmployeeExperienceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_EmployeeExperienceDetails_CompanyName_EmployeeId] UNIQUE NONCLUSTERED 
(
	[CompanyName] ASC,
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeExperienceDetails] ADD  CONSTRAINT [DF_EmployeeExperienceDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmployeeExperienceDetails] ADD  CONSTRAINT [DF_EmployeeExperienceDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeExperienceDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeExperienceDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeeExperienceDetails] CHECK CONSTRAINT [FK_EmployeeExperienceDetails_EmployeeDetails_EmployeeId]
GO
