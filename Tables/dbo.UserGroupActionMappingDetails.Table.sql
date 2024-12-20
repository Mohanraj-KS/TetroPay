USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[UserGroupActionMappingDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroupActionMappingDetails](
	[UserGroupActionMappingId] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupId] [tinyint] NOT NULL,
	[ModuleActionId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_UserGroupActionMappingDetails_UserGroupActionMappingId] PRIMARY KEY CLUSTERED 
(
	[UserGroupActionMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserGroupActionMappingDetails] ADD  CONSTRAINT [DF_UserGroupActionMappingDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserGroupActionMappingDetails] ADD  CONSTRAINT [DF_UserGroupActionMappingDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserGroupActionMappingDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserGroupActionMappingDetails_ModuleActionDetail_ModuleActionId] FOREIGN KEY([ModuleActionId])
REFERENCES [dbo].[ModuleActionDetails] ([ModuleActionId])
GO
ALTER TABLE [dbo].[UserGroupActionMappingDetails] CHECK CONSTRAINT [FK_UserGroupActionMappingDetails_ModuleActionDetail_ModuleActionId]
GO
ALTER TABLE [dbo].[UserGroupActionMappingDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserGroupActionMappingDetails_UserGroupDetail_UserGroupId] FOREIGN KEY([UserGroupId])
REFERENCES [dbo].[UserGroupDetails] ([UserGroupId])
GO
ALTER TABLE [dbo].[UserGroupActionMappingDetails] CHECK CONSTRAINT [FK_UserGroupActionMappingDetails_UserGroupDetail_UserGroupId]
GO
