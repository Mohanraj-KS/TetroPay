USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[ESSLCredentialDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESSLCredentialDetails](
	[ESSLCredentialId] [int] IDENTITY(1,1) NOT NULL,
	[ESSLUserName] [nvarchar](100) NULL,
	[ESSLPassword] [nvarchar](50) NULL,
	[WebAddress] [nvarchar](500) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ESSLCredentialDetails_ESSLCredentialId] PRIMARY KEY CLUSTERED 
(
	[ESSLCredentialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ESSLCredentialDetails] ADD  CONSTRAINT [DF_ESSLCredentialDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ESSLCredentialDetails] ADD  CONSTRAINT [DF_ESSLCredentialDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ESSLCredentialDetails]  WITH CHECK ADD  CONSTRAINT [FK_ESSLCredentialDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[ESSLCredentialDetails] CHECK CONSTRAINT [FK_ESSLCredentialDetails_CompanyDetails_CompanyId]
GO
