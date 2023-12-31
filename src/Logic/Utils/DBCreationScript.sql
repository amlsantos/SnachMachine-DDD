USE [master]
GO
CREATE DATABASE [DddInPractice]
GO
USE [DddInPractice]
GO
/****** Object:  Table [dbo].[Atm]    Script Date: 1/5/2016 9:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atm](
	[AtmID] [bigint] IDENTITY NOT NULL,
	[MoneyCharged] [decimal](18, 2) NOT NULL,
	[OneCentCount] [int] NOT NULL,
	[TenCentCount] [int] NOT NULL,
	[QuarterCount] [int] NOT NULL,
	[OneDollarCount] [int] NOT NULL,
	[FiveDollarCount] [int] NOT NULL,
	[TwentyDollarCount] [int] NOT NULL,
 CONSTRAINT [PK_Atm] PRIMARY KEY CLUSTERED 
(
	[AtmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HeadOffice]    Script Date: 1/5/2016 9:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeadOffice](
	[HeadOfficeID] [bigint] IDENTITY NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[OneCentCount] [int] NOT NULL,
	[TenCentCount] [int] NOT NULL,
	[QuarterCount] [int] NOT NULL,
	[OneDollarCount] [int] NOT NULL,
	[FiveDollarCount] [int] NOT NULL,
	[TwentyDollarCount] [int] NOT NULL,
 CONSTRAINT [PK_HeadOffice] PRIMARY KEY CLUSTERED 
(
	[HeadOfficeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ids]    Script Date: 1/5/2016 9:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ids](
	[EntityName] [nvarchar](100) NOT NULL,
	[NextHigh] [int] NOT NULL,
 CONSTRAINT [PK_Ids] PRIMARY KEY CLUSTERED 
(
	[EntityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slot]    Script Date: 1/5/2016 9:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[SlotID] [bigint] IDENTITY NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[SnackID] [bigint] NOT NULL,
	[SnackMachineID] [bigint] NOT NULL,
	[Position] [int] NOT NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Snack]    Script Date: 1/5/2016 9:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Snack](
	[SnackID] [bigint] IDENTITY NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Snack] PRIMARY KEY CLUSTERED 
(
	[SnackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SnackMachine]    Script Date: 1/5/2016 9:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SnackMachine](
	[SnackMachineID] [bigint] IDENTITY NOT NULL,
	[OneCentCount] [int] NOT NULL,
	[TenCentCount] [int] NOT NULL,
	[QuarterCount] [int] NOT NULL,
	[OneDollarCount] [int] NOT NULL,
	[FiveDollarCount] [int] NOT NULL,
	[TwentyDollarCount] [int] NOT NULL,
 CONSTRAINT [PK_SnackMachine] PRIMARY KEY CLUSTERED 
(
	[SnackMachineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Ids] ([EntityName], [NextHigh]) VALUES (N'Atm', 1)
GO
INSERT [dbo].[Ids] ([EntityName], [NextHigh]) VALUES (N'HeadOffice', 1)
GO
INSERT [dbo].[Ids] ([EntityName], [NextHigh]) VALUES (N'Slot', 1)
GO
INSERT [dbo].[Ids] ([EntityName], [NextHigh]) VALUES (N'Snack', 1)
GO
INSERT [dbo].[Ids] ([EntityName], [NextHigh]) VALUES (N'SnackMachine', 1)
GO
-- Enable IDENTITY_INSERT for the Snack table
SET IDENTITY_INSERT [dbo].[Snack] ON;
GO
INSERT [dbo].[Snack] ([SnackID], [Name]) VALUES (1, N'None')
GO
INSERT [dbo].[Snack] ([SnackID], [Name]) VALUES (2, N'Chocolate')
GO
INSERT [dbo].[Snack] ([SnackID], [Name]) VALUES (3, N'Soda')
GO
INSERT [dbo].[Snack] ([SnackID], [Name]) VALUES (4, N'Gum')
SET IDENTITY_INSERT [dbo].[Snack] OFF;

SET IDENTITY_INSERT [dbo].[Slot] ON;
GO
INSERT [dbo].[Slot] ([SlotID], [Quantity], [Price], [SnackID], [SnackMachineID], [Position]) VALUES (1, 10, CAST(3.00 AS Decimal(18, 2)), 4, 1, 1)
GO
INSERT [dbo].[Slot] ([SlotID], [Quantity], [Price], [SnackID], [SnackMachineID], [Position]) VALUES (2, 15, CAST(2.00 AS Decimal(18, 2)), 2, 1, 2)
GO
INSERT [dbo].[Slot] ([SlotID], [Quantity], [Price], [SnackID], [SnackMachineID], [Position]) VALUES (3, 20, CAST(1.00 AS Decimal(18, 2)), 3, 1, 3)
SET IDENTITY_INSERT [dbo].[Slot] OFF;

-- Enable IDENTITY_INSERT for the Snack table
SET IDENTITY_INSERT [dbo].[SnackMachine] ON;
GO
INSERT [dbo].[SnackMachine] ([SnackMachineID], [OneCentCount], [TenCentCount], [QuarterCount], [OneDollarCount], [FiveDollarCount], [TwentyDollarCount]) VALUES (1, 10, 10, 10, 10, 10, 10)
GO
SET IDENTITY_INSERT [dbo].[SnackMachine] OFF;
SET IDENTITY_INSERT [dbo].[Atm] ON;
GO
INSERT [dbo].[Atm] ([AtmID], [MoneyCharged], [OneCentCount], [TenCentCount], [QuarterCount], [OneDollarCount], [FiveDollarCount], [TwentyDollarCount]) VALUES (1, CAST(0 AS Decimal(18, 2)), 20, 20, 20, 20,20, 20)
GO
SET IDENTITY_INSERT [dbo].[Atm] OFF;
SET IDENTITY_INSERT [dbo].[HeadOffice] ON;
GO
INSERT [dbo].[HeadOffice] ([HeadOfficeID], [Balance], [OneCentCount], [TenCentCount], [QuarterCount], [OneDollarCount], [FiveDollarCount], [TwentyDollarCount]) VALUES (1, CAST(0 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[HeadOffice] OFF;
GO
ALTER TABLE [dbo].[Slot] ADD  CONSTRAINT [DF_Slot_Position]  DEFAULT ((1)) FOR [Position]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Snack] FOREIGN KEY([SnackID])
REFERENCES [dbo].[Snack] ([SnackID])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_Snack]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_SnackMachine] FOREIGN KEY([SnackMachineID])
REFERENCES [dbo].[SnackMachine] ([SnackMachineID])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_SnackMachine]
GO
USE [master]
GO
ALTER DATABASE [DddInPractice] SET  READ_WRITE 
GO