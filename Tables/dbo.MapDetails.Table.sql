USE [TetroPAY_198]
GO
/****** Object:  Table [dbo].[MapDetails]    Script Date: 13-12-2024 21:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MapDetails](
	[MapId] [int] IDENTITY(1,1) NOT NULL,
	[MapNumber] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](800) NULL,
	[CompanyCode] [nvarchar](50) NULL,
	[CompanyId] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_MapDetails_MapId] PRIMARY KEY CLUSTERED 
(
	[MapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MapDetails] ADD  CONSTRAINT [DF_MapDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MapDetails] ADD  CONSTRAINT [DF_MapDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[MapDetails]  WITH CHECK ADD  CONSTRAINT [FK_MapDetails_CompanyDetails_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyDetails] ([CompanyId])
GO
ALTER TABLE [dbo].[MapDetails] CHECK CONSTRAINT [FK_MapDetails_CompanyDetails_CompanyId]
GO
