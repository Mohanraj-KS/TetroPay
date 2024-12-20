USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[ModuleActionDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleActionDetails](
	[ModuleActionId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleId] [tinyint] NOT NULL,
	[ModuleActionName] [nvarchar](200) NOT NULL,
	[ModuleActionDescription] [nvarchar](200) NULL,
	[IsParent] [bit] NULL,
	[ParentModuleId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpDatedBy] [int] NULL,
	[UpDatedDate] [datetime] NULL,
 CONSTRAINT [PK_ModuleActionDetails_ModuleActionId] PRIMARY KEY CLUSTERED 
(
	[ModuleActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModuleActionDetails] ADD  CONSTRAINT [DF_ModuleActionDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ModuleActionDetails] ADD  CONSTRAINT [DF_ModuleActionDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
