USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[PayTypeDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayTypeDetails](
	[PayTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[PayTypeName] [nvarchar](100) NOT NULL,
	[PayTypeDescription] [nvarchar](200) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PayTypeDetails_PayTypeId] PRIMARY KEY CLUSTERED 
(
	[PayTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_PayTypeDetails_PayTypeName_CompanyId] UNIQUE NONCLUSTERED 
(
	[PayTypeName] ASC,
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PayTypeDetails] ADD  CONSTRAINT [DF_PayTypeDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PayTypeDetails] ADD  CONSTRAINT [DF_PayTypeDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PayTypeDetails]  WITH CHECK ADD  CONSTRAINT [FK_PayTypeDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[PayTypeDetails] CHECK CONSTRAINT [FK_PayTypeDetails_CompanyDetails_CompanyId]
GO
