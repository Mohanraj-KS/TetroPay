USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[CompanyBankDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyBankDetails](
	[CompanyBankId] [int] IDENTITY(1,1) NOT NULL,
	[BankName] [nvarchar](100) NULL,
	[AccountType] [nvarchar](50) NULL,
	[AccountName] [nvarchar](100) NULL,
	[AccountNumber] [nvarchar](100) NULL,
	[IFSCCode] [nvarchar](100) NULL,
	[CompanyId] [tinyint] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_CompanyBankDetails_CompanyBankId] PRIMARY KEY CLUSTERED 
(
	[CompanyBankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_CompanyBankDetails_AccountNumber] UNIQUE NONCLUSTERED 
(
	[AccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyBankDetails] ADD  CONSTRAINT [DF_CompanyBankDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CompanyBankDetails] ADD  CONSTRAINT [DF_CompanyBankDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CompanyBankDetails]  WITH CHECK ADD  CONSTRAINT [FK_CompanyBankDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[CompanyBankDetails] CHECK CONSTRAINT [FK_CompanyBankDetails_CompanyDetails_CompanyId]
GO
