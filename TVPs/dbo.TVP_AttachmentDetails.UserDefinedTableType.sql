USE [TetroPAY_198]
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_AttachmentDetails]    Script Date: 13-12-2024 21:45:33 ******/
CREATE TYPE [dbo].[TVP_AttachmentDetails] AS TABLE(
	[AttachmentId] [int] NULL,
	[ModuleName] [nvarchar](100) NULL,
	[ModuleRefId] [int] NULL,
	[AttachmentFileName] [nvarchar](4000) NULL,
	[AttachmentFilePath] [nvarchar](4000) NULL
)
GO
