USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[NotificationPersonMappingDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationPersonMappingDetails](
	[NotificationPersonMappingId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[NotificationId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_NotificationPersonMappingDetails_NotificationPersonMappingId] PRIMARY KEY CLUSTERED 
(
	[NotificationPersonMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NotificationPersonMappingDetails] ADD  CONSTRAINT [DF_NotificationPersonMappingDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[NotificationPersonMappingDetails] ADD  CONSTRAINT [DF_NotificationPersonMappingDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[NotificationPersonMappingDetails]  WITH CHECK ADD  CONSTRAINT [FK_NotificationPersonMappingDetails_NotificationDetails_NotificationId] FOREIGN KEY([NotificationId])
REFERENCES [dbo].[NotificationDetails] ([NotificationId])
GO
ALTER TABLE [dbo].[NotificationPersonMappingDetails] CHECK CONSTRAINT [FK_NotificationPersonMappingDetails_NotificationDetails_NotificationId]
GO
