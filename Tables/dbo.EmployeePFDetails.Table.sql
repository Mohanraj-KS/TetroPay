USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[EmployeePFDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeePFDetails](
	[EmployeePFId] [tinyint] IDENTITY(1,1) NOT NULL,
	[UANNumber] [nvarchar](100) NOT NULL,
	[PFNumber] [nvarchar](100) NOT NULL,
	[EmployeeContribution] [numeric](11, 2) NOT NULL,
	[EmployeerContribution] [numeric](11, 2) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_EmployeePFDetails_EmployeePFId] PRIMARY KEY CLUSTERED 
(
	[EmployeePFId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeePFDetails] ADD  CONSTRAINT [DF_EmployeePFDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmployeePFDetails] ADD  CONSTRAINT [DF_EmployeePFDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeePFDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePFDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeePFDetails] CHECK CONSTRAINT [FK_EmployeePFDetails_EmployeeDetails_EmployeeId]
GO
