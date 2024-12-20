USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[ContactUs_Website]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs_Website](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[Country] [nvarchar](50) NOT NULL,
	[MobileNo] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[Comments] [nvarchar](1000) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ContactUs_Website_ContactId] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContactUs_Website] ADD  CONSTRAINT [DF_ContactUs_Website_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ContactUs_Website] ADD  CONSTRAINT [DF_ContactUs_Website_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
