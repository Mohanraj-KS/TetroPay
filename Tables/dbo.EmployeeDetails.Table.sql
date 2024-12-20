USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[EmployeeDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDetails](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCompanyId] [nvarchar](100) NULL,
	[EmployeeImage] [nvarchar](4000) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[OfficialEmail] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
	[Zipcode] [nvarchar](100) NULL,
	[ContactNo] [nvarchar](100) NULL,
	[CurrentOTP] [nvarchar](50) NULL,
	[IsCurrentOTPExpired] [nvarchar](50) NULL,
	[DateOfJoining] [datetime] NULL,
	[BranchId] [tinyint] NULL,
	[DepartmentId] [tinyint] NULL,
	[DesignationId] [tinyint] NULL,
	[ReportingPersonId] [int] NULL,
	[UserGroupId] [tinyint] NOT NULL,
	[IsLoginUser] [bit] NOT NULL,
	[CardNumber] [nvarchar](100) NULL,
	[EmployeeType] [nvarchar](50) NULL,
	[CompanyId] [tinyint] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_EmployeeDetails_EmployeeId] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_EmployeeDetails_ContactNo_CompanyId] UNIQUE NONCLUSTERED 
(
	[ContactNo] ASC,
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeDetails] ADD  CONSTRAINT [DF_EmployeeDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmployeeDetails] ADD  CONSTRAINT [DF_EmployeeDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[EmployeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDetails_BranchDetails_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[BranchDetails] ([BranchId])
GO
ALTER TABLE [dbo].[EmployeeDetails] CHECK CONSTRAINT [FK_EmployeeDetails_BranchDetails_BranchId]
GO
ALTER TABLE [dbo].[EmployeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[EmployeeDetails] CHECK CONSTRAINT [FK_EmployeeDetails_CompanyDetails_CompanyId]
GO
ALTER TABLE [dbo].[EmployeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDetails_DepartmentDetails_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[DepartmentDetails] ([DepartmentId])
GO
ALTER TABLE [dbo].[EmployeeDetails] CHECK CONSTRAINT [FK_EmployeeDetails_DepartmentDetails_DepartmentId]
GO
ALTER TABLE [dbo].[EmployeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDetails_DesignationDetails_DesignationId] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[DesignationDetails] ([DesignationId])
GO
ALTER TABLE [dbo].[EmployeeDetails] CHECK CONSTRAINT [FK_EmployeeDetails_DesignationDetails_DesignationId]
GO
ALTER TABLE [dbo].[EmployeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDetails_UserGroupDetails_UserGroupId] FOREIGN KEY([UserGroupId])
REFERENCES [dbo].[UserGroupDetails] ([UserGroupId])
GO
ALTER TABLE [dbo].[EmployeeDetails] CHECK CONSTRAINT [FK_EmployeeDetails_UserGroupDetails_UserGroupId]
GO
