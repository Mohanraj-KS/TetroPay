USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[EmployeeFamilyMemberDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeFamilyMemberDetails](
	[EmployeeFamilyMemberId] [tinyint] IDENTITY(1,1) NOT NULL,
	[PersonName] [nvarchar](100) NOT NULL,
	[RelationId] [tinyint] NULL,
	[ContactNumber] [nvarchar](50) NULL,
	[IsPrimaryContact] [bit] NULL,
	[EmployeeId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_EmployeeFamilyMemberDetails_EmployeeFamilyMemberId] PRIMARY KEY CLUSTERED 
(
	[EmployeeFamilyMemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeFamilyMemberDetails] ADD  CONSTRAINT [DF_EmployeeFamilyMemberDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmployeeFamilyMemberDetails] ADD  CONSTRAINT [DF_EmployeeFamilyMemberDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeFamilyMemberDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeFamilyMemberDetails_EmployeeDetails_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[EmployeeDetails] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeeFamilyMemberDetails] CHECK CONSTRAINT [FK_EmployeeFamilyMemberDetails_EmployeeDetails_EmployeeId]
GO
ALTER TABLE [dbo].[EmployeeFamilyMemberDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeFamilyMemberDetails_RelationDetails_RelationId] FOREIGN KEY([RelationId])
REFERENCES [dbo].[RelationDetails] ([RelationId])
GO
ALTER TABLE [dbo].[EmployeeFamilyMemberDetails] CHECK CONSTRAINT [FK_EmployeeFamilyMemberDetails_RelationDetails_RelationId]
GO
