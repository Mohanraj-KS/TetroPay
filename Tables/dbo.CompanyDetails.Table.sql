USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[CompanyDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyDetails](
	[CompanyId] [tinyint] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[CompanyLogo] [nvarchar](500) NULL,
	[CompanyAddress] [nvarchar](200) NULL,
	[CompanyCity] [nvarchar](50) NULL,
	[CompanyState] [nvarchar](50) NULL,
	[CompanyCountry] [nvarchar](50) NULL,
	[CompanyZipcode] [nvarchar](50) NULL,
	[CompanyContactNumber] [nvarchar](100) NULL,
	[CompanyEmail] [nvarchar](100) NULL,
	[CompanyWebsite] [nvarchar](200) NULL,
	[GSTNumber] [nvarchar](100) NULL,
	[BankName] [nvarchar](100) NULL,
	[AccountType] [nvarchar](100) NULL,
	[AccountName] [nvarchar](100) NULL,
	[AccountNumber] [nvarchar](100) NULL,
	[IFSCCode] [nvarchar](100) NULL,
	[MasterClientId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_CompanyDetails_CompanyId] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_CompanyDetails_CompanyName] UNIQUE NONCLUSTERED 
(
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyDetails] ADD  CONSTRAINT [DF_CompanyDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CompanyDetails] ADD  CONSTRAINT [DF_CompanyDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
