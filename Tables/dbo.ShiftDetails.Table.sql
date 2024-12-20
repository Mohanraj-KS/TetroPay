USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[ShiftDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftDetails](
	[ShiftId] [tinyint] IDENTITY(1,1) NOT NULL,
	[ShiftName] [nvarchar](50) NOT NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[ShiftDescription] [nvarchar](250) NULL,
	[IsAllowanceApplicable] [bit] NULL,
	[AllowanceAmount] [numeric](11, 2) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ShiftDetails_ShiftId] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_ShiftDetails_ShiftName] UNIQUE NONCLUSTERED 
(
	[ShiftName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ShiftDetails] ADD  CONSTRAINT [DF_ShiftDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ShiftDetails] ADD  CONSTRAINT [DF_ShiftDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ShiftDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShiftDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[ShiftDetails] CHECK CONSTRAINT [FK_ShiftDetails_CompanyDetails_CompanyId]
GO
