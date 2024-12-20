USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[MaritalStatusDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaritalStatusDetails](
	[MaritalStatusId] [tinyint] IDENTITY(1,1) NOT NULL,
	[MaritalStatusName] [nvarchar](50) NOT NULL,
	[MaritalStatusDescription] [nvarchar](200) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_MaritalStatusDetails_MaritalStatusId] PRIMARY KEY CLUSTERED 
(
	[MaritalStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_MaritalStatusDetails_MaritalStatusName] UNIQUE NONCLUSTERED 
(
	[MaritalStatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MaritalStatusDetails] ADD  CONSTRAINT [DF_MaritalStatusDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MaritalStatusDetails] ADD  CONSTRAINT [DF_MaritalStatusDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[MaritalStatusDetails]  WITH CHECK ADD  CONSTRAINT [FK_MaritalStatusDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[MaritalStatusDetails] CHECK CONSTRAINT [FK_MaritalStatusDetails_CompanyDetails_CompanyId]
GO
