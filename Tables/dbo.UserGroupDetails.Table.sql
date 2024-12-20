USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[UserGroupDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroupDetails](
	[UserGroupId] [tinyint] IDENTITY(1,1) NOT NULL,
	[UserGroupName] [nvarchar](50) NOT NULL,
	[UserGroupDescription] [nvarchar](200) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_UsergroupDetails_UserGroupId] PRIMARY KEY CLUSTERED 
(
	[UserGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_UsergroupDetails_UserGroupName] UNIQUE NONCLUSTERED 
(
	[UserGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserGroupDetails] ADD  CONSTRAINT [DF_EmployeegroupDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserGroupDetails] ADD  CONSTRAINT [DF_EmployeegroupDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserGroupDetails]  WITH CHECK ADD  CONSTRAINT [FK_UsergroupDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[UserGroupDetails] CHECK CONSTRAINT [FK_UsergroupDetails_CompanyDetails_CompanyId]
GO
