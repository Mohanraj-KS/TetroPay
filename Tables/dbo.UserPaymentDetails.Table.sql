USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[UserPaymentDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPaymentDetails](
	[UserPaymentId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [nvarchar](50) NULL,
	[PaymentPlan] [nvarchar](50) NULL,
	[PaymentAmount] [numeric](11, 2) NULL,
	[CompanyId] [tinyint] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_UserPaymentDetails_UserPaymentId] PRIMARY KEY CLUSTERED 
(
	[UserPaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserPaymentDetails] ADD  CONSTRAINT [DF_UserPaymentDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserPaymentDetails] ADD  CONSTRAINT [DF_UserPaymentDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserPaymentDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserPaymentDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[UserPaymentDetails] CHECK CONSTRAINT [FK_UserPaymentDetails_CompanyDetails_CompanyId]
GO
