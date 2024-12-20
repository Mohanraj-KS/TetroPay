USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[ReportCategoryDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportCategoryDetails](
	[ReportCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ReportCategoryName] [nvarchar](50) NOT NULL,
	[ReportCategoryDescription] [nvarchar](400) NULL,
	[ReportName] [nvarchar](50) NOT NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ReportCategoryDetails_ReportCategoryId] PRIMARY KEY CLUSTERED 
(
	[ReportCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportCategoryDetails] ADD  CONSTRAINT [DF_ReportCategoryDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ReportCategoryDetails] ADD  CONSTRAINT [DF_ReportCategoryDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ReportCategoryDetails]  WITH CHECK ADD  CONSTRAINT [FK_ReportCategoryDetails_CompanyDetail_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[ReportCategoryDetails] CHECK CONSTRAINT [FK_ReportCategoryDetails_CompanyDetail_CompanyId]
GO
