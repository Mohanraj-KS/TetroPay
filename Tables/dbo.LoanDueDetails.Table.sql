USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[LoanDueDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanDueDetails](
	[LoanDueId] [int] IDENTITY(1,1) NOT NULL,
	[LoanDueDate] [datetime] NOT NULL,
	[LoanDueAmount] [numeric](11, 2) NOT NULL,
	[Isclosed] [bit] NOT NULL,
	[LoanId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_LoanDueDetails_LoanDueId] PRIMARY KEY CLUSTERED 
(
	[LoanDueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LoanDueDetails] ADD  CONSTRAINT [DF_LoanDueDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[LoanDueDetails] ADD  CONSTRAINT [DF_LoanDueDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[LoanDueDetails]  WITH CHECK ADD  CONSTRAINT [FK_LoanDueDetails_LoanDetails_LoanId] FOREIGN KEY([LoanId])
REFERENCES [dbo].[LoanDetails] ([LoanId])
GO
ALTER TABLE [dbo].[LoanDueDetails] CHECK CONSTRAINT [FK_LoanDueDetails_LoanDetails_LoanId]
GO
