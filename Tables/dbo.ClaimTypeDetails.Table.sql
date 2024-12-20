USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[ClaimTypeDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimTypeDetails](
	[ClaimTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[ClaimTypeName] [nvarchar](100) NOT NULL,
	[ClaimTypeDescription] [nvarchar](250) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Updatedby] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ClaimTypeDetails_ClaimTypeId] PRIMARY KEY CLUSTERED 
(
	[ClaimTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_ClaimTypeDetails_ClaimTypeName] UNIQUE NONCLUSTERED 
(
	[ClaimTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClaimTypeDetails] ADD  CONSTRAINT [DF_ClaimTypeDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ClaimTypeDetails] ADD  CONSTRAINT [DF_ClaimTypeDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ClaimTypeDetails]  WITH CHECK ADD  CONSTRAINT [FK_ClaimTypeDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[ClaimTypeDetails] CHECK CONSTRAINT [FK_ClaimTypeDetails_CompanyDetails_CompanyId]
GO
