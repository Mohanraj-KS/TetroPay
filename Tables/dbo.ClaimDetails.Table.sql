USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[ClaimDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimDetails](
	[ClaimId] [int] IDENTITY(1,1) NOT NULL,
	[ClaimDate] [datetime] NOT NULL,
	[ClaimTypeId] [tinyint] NOT NULL,
	[ClaimAmount] [numeric](11, 2) NOT NULL,
	[ClaimDescription] [nvarchar](2000) NULL,
	[RequestedBy] [int] NOT NULL,
	[ApprovedBy] [int] NULL,
	[ApprovedAmount] [numeric](11, 2) NULL,
	[ApproverComments] [nvarchar](2000) NULL,
	[ClaimStatusId] [tinyint] NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ClaimDetails_ClaimId] PRIMARY KEY CLUSTERED 
(
	[ClaimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClaimDetails] ADD  CONSTRAINT [DF_ClaimDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ClaimDetails] ADD  CONSTRAINT [DF_ClaimDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ClaimDetails]  WITH CHECK ADD  CONSTRAINT [FK_ClaimDetails_ClaimTypeDetails_ClaimTypeId] FOREIGN KEY([ClaimTypeId])
REFERENCES [dbo].[ClaimTypeDetails] ([ClaimTypeId])
GO
ALTER TABLE [dbo].[ClaimDetails] CHECK CONSTRAINT [FK_ClaimDetails_ClaimTypeDetails_ClaimTypeId]
GO
ALTER TABLE [dbo].[ClaimDetails]  WITH CHECK ADD  CONSTRAINT [FK_ClaimDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[ClaimDetails] CHECK CONSTRAINT [FK_ClaimDetails_CompanyDetails_CompanyId]
GO
ALTER TABLE [dbo].[ClaimDetails]  WITH CHECK ADD  CONSTRAINT [FK_ClaimDetails_LeaveStatusDetails_LeaveStatusId] FOREIGN KEY([ClaimStatusId])
REFERENCES [dbo].[LeavestatusDetails] ([LeaveStatusId])
GO
ALTER TABLE [dbo].[ClaimDetails] CHECK CONSTRAINT [FK_ClaimDetails_LeaveStatusDetails_LeaveStatusId]
GO
