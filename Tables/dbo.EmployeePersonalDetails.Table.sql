USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[EmployeePersonalDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeePersonalDetails](
	[EmployeePersonalId] [int] IDENTITY(1,1) NOT NULL,
	[GenderId] [tinyint] NULL,
	[DateOfBirth] [datetime] NULL,
	[ReligionId] [tinyint] NULL,
	[MaritalStatusId] [tinyint] NULL,
	[Nationality] [nvarchar](50) NULL,
	[PersonalEmail] [nvarchar](100) NULL,
	[AadharNo] [nvarchar](100) NULL,
	[PANNo] [nvarchar](100) NULL,
	[PassportNo] [nvarchar](100) NULL,
	[PassportExpDate] [datetime] NULL,
	[EmployeeId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_EmployeePersonalDetails_EmployeePersonalId] PRIMARY KEY CLUSTERED 
(
	[EmployeePersonalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeePersonalDetails] ADD  CONSTRAINT [DF_EmployeePersonalDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmployeePersonalDetails] ADD  CONSTRAINT [DF_EmployeePersonalDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeePersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePersonalDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeePersonalDetails] CHECK CONSTRAINT [FK_EmployeePersonalDetails_EmployeeDetails_EmployeeId]
GO
ALTER TABLE [dbo].[EmployeePersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePersonalDetails_GenderDetails_GenderId] FOREIGN KEY([GenderId])
REFERENCES [dbo].[GenderDetails] ([GenderId])
GO
ALTER TABLE [dbo].[EmployeePersonalDetails] CHECK CONSTRAINT [FK_EmployeePersonalDetails_GenderDetails_GenderId]
GO
ALTER TABLE [dbo].[EmployeePersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePersonalDetails_MaritalStatusDetails_MaritalStatusId] FOREIGN KEY([MaritalStatusId])
REFERENCES [dbo].[MaritalStatusDetails] ([MaritalStatusId])
GO
ALTER TABLE [dbo].[EmployeePersonalDetails] CHECK CONSTRAINT [FK_EmployeePersonalDetails_MaritalStatusDetails_MaritalStatusId]
GO
ALTER TABLE [dbo].[EmployeePersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePersonalDetails_ReligionDetails_ReligionId] FOREIGN KEY([ReligionId])
REFERENCES [dbo].[ReligionDetails] ([ReligionId])
GO
ALTER TABLE [dbo].[EmployeePersonalDetails] CHECK CONSTRAINT [FK_EmployeePersonalDetails_ReligionDetails_ReligionId]
GO
