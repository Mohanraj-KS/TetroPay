USE [TetroPAY_198]
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_NotificationPersonMappingDetails]    Script Date: 13-12-2024 21:45:33 ******/
CREATE TYPE [dbo].[TVP_NotificationPersonMappingDetails] AS TABLE(
	[NotificationPersonMappingId] [int] NULL,
	[NotificationId] [int] NULL,
	[PersonId] [int] NULL
)
GO
