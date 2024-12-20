USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[CompanySettingDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanySettingDetails](
	[CompanySettingId] [int] IDENTITY(1,1) NOT NULL,
	[IsEmpIdAutomatic] [bit] NULL,
	[EmpIdPrefix] [nvarchar](50) NULL,
	[EmpIdStartingFrom] [int] NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [date] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK_CompanySettingDetails_CompanySettingId] PRIMARY KEY CLUSTERED 
(
	[CompanySettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanySettingDetails] ADD  CONSTRAINT [DF_CompanySettingDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CompanySettingDetails] ADD  CONSTRAINT [DF_CompanySettingDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CompanySettingDetails]  WITH CHECK ADD  CONSTRAINT [FK_CompanySettingDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[CompanySettingDetails] CHECK CONSTRAINT [FK_CompanySettingDetails_CompanyDetails_CompanyId]
GO
