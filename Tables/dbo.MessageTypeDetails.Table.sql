USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[MessageTypeDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageTypeDetails](
	[MessageTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[MessageTypeName] [nvarchar](50) NOT NULL,
	[MessageTypeDescription] [nvarchar](100) NOT NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_MessageTypeDetails_MessageTypeId] PRIMARY KEY CLUSTERED 
(
	[MessageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_MessageTypeDetails_MessageTypeName_CompanyId] UNIQUE NONCLUSTERED 
(
	[MessageTypeName] ASC,
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MessageTypeDetails] ADD  CONSTRAINT [DF_MessageTypeDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MessageTypeDetails] ADD  CONSTRAINT [DF_MessageTypeDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[MessageTypeDetails]  WITH CHECK ADD  CONSTRAINT [FK_MessageTypeDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[MessageTypeDetails] CHECK CONSTRAINT [FK_MessageTypeDetails_CompanyDetails_CompanyId]
GO
