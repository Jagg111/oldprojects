/****** Object:  ForeignKey [FK_Addon_Game]    Script Date: 05/01/2012 00:01:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Addon_Game]') AND parent_object_id = OBJECT_ID(N'[dbo].[Addon]'))
ALTER TABLE [dbo].[Addon] DROP CONSTRAINT [FK_Addon_Game]
GO
/****** Object:  View [dbo].[vw_Addons]    Script Date: 05/01/2012 00:01:31 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Addons]'))
DROP VIEW [dbo].[vw_Addons]
GO
/****** Object:  View [dbo].[vw_GameWithAddons]    Script Date: 05/01/2012 00:01:31 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_GameWithAddons]'))
DROP VIEW [dbo].[vw_GameWithAddons]
GO
/****** Object:  Table [dbo].[Addon]    Script Date: 05/01/2012 00:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Addon]') AND type in (N'U'))
DROP TABLE [dbo].[Addon]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 05/01/2012 00:01:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Game]') AND type in (N'U'))
DROP TABLE [dbo].[Game]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 05/01/2012 00:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Game]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Game](
	[IDNumber] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Slug] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Cover] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[IDNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Game] ON
INSERT [dbo].[Game] ([IDNumber], [Title], [Description], [Slug], [Cover]) VALUES (1, N'World Of Warcraft', N'MMO', N'wow', N'/Content/userUploads/634522349997327499.png')
INSERT [dbo].[Game] ([IDNumber], [Title], [Description], [Slug], [Cover]) VALUES (2, N'Terreria', N'Adventure', N'terraria', N'/Content/userUploads/634477923444525302.png')
INSERT [dbo].[Game] ([IDNumber], [Title], [Description], [Slug], [Cover]) VALUES (3, N'Skyrim', N'RPG', N'skyrim', N'/Content/userUploads/634565287532288041.png')
INSERT [dbo].[Game] ([IDNumber], [Title], [Description], [Slug], [Cover]) VALUES (4, N'Warhammer Online', N'MMO', N'war', N'/Content/userUploads/634522311127511413.png')
INSERT [dbo].[Game] ([IDNumber], [Title], [Description], [Slug], [Cover]) VALUES (19, N'Rift', N'MMORPG', N'rift', N'/Content/userUploads/634522316429517400.png')
INSERT [dbo].[Game] ([IDNumber], [Title], [Description], [Slug], [Cover]) VALUES (23, N'Minecraft', N'Adventure', N'minecraft', N'/Content/userUploads/minecraft.png')
SET IDENTITY_INSERT [dbo].[Game] OFF
/****** Object:  Table [dbo].[Addon]    Script Date: 05/01/2012 00:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Addon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Addon](
	[IDNumber] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[GameID] [int] NOT NULL,
	[Avatar] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Addon] PRIMARY KEY CLUSTERED 
(
	[IDNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Addon] ON
INSERT [dbo].[Addon] ([IDNumber], [Name], [Description], [GameID], [Avatar]) VALUES (1, N'Recount', N'Damage Meter', 1, NULL)
INSERT [dbo].[Addon] ([IDNumber], [Name], [Description], [GameID], [Avatar]) VALUES (3, N'Deadly Boss Mod', N'Combat and Boss Encounter', 1, NULL)
INSERT [dbo].[Addon] ([IDNumber], [Name], [Description], [GameID], [Avatar]) VALUES (4, N'Lockpick Pro', N'User Interface', 3, NULL)
INSERT [dbo].[Addon] ([IDNumber], [Name], [Description], [GameID], [Avatar]) VALUES (5, N'Weightless Items', N'Alchemy Ingredients, Potions, and Items', 3, NULL)
INSERT [dbo].[Addon] ([IDNumber], [Name], [Description], [GameID], [Avatar]) VALUES (6, N'Dovahkiin Hideout', N'Exploration, Landscapes, Locations, Quests, and Dungeons', 3, NULL)
INSERT [dbo].[Addon] ([IDNumber], [Name], [Description], [GameID], [Avatar]) VALUES (7, N'The Forgotten Ice Temple - Secret Behind the Gates', N'Dungeons, Multiplayer, Puzzles, Survival, and Adventures', 2, NULL)
INSERT [dbo].[Addon] ([IDNumber], [Name], [Description], [GameID], [Avatar]) VALUES (8, N'Adventure! - An Adventure Map Inspired by Zelda', N'Parkour, Survival, Multiplayer, and Adventures', 2, NULL)
INSERT [dbo].[Addon] ([IDNumber], [Name], [Description], [GameID], [Avatar]) VALUES (9, N'Wanted', N'Puzzles, Survival, and Adventures', 2, NULL)
INSERT [dbo].[Addon] ([IDNumber], [Name], [Description], [GameID], [Avatar]) VALUES (10, N'Enemy', N'Buffs & Debuffs, Unit Frames, Combat, and PvP', 4, NULL)
INSERT [dbo].[Addon] ([IDNumber], [Name], [Description], [GameID], [Avatar]) VALUES (11, N'Squared', N'Unit Frames', 4, NULL)
INSERT [dbo].[Addon] ([IDNumber], [Name], [Description], [GameID], [Avatar]) VALUES (12, N'PotionBar', N'Action Bars and Bags & Inventory', 4, NULL)
SET IDENTITY_INSERT [dbo].[Addon] OFF
/****** Object:  View [dbo].[vw_GameWithAddons]    Script Date: 05/01/2012 00:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_GameWithAddons]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_GameWithAddons]
AS
SELECT        IDNumber, Title, Description, Slug, Cover,
                             (SELECT        COUNT(*) AS Expr1
                               FROM            dbo.Addon
                               WHERE        (GameID = dbo.Game.IDNumber)) AS ''NumAddons''
FROM            dbo.Game
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vw_GameWithAddons', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[31] 4[22] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Game"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2430
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GameWithAddons'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vw_GameWithAddons', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GameWithAddons'
GO
/****** Object:  View [dbo].[vw_Addons]    Script Date: 05/01/2012 00:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Addons]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_Addons]
AS
SELECT        dbo.Addon.IDNumber AS AddonID, dbo.Addon.Name AS AddonName, dbo.Addon.Description AS AddonDescription, dbo.Game.IDNumber AS GameID, 
                         dbo.Game.Title AS GameTitle, dbo.Game.Description AS GameDescription, dbo.Game.Slug AS GameSlug, dbo.Addon.Avatar, dbo.Game.Cover
FROM            dbo.Addon INNER JOIN
                         dbo.Game ON dbo.Addon.GameID = dbo.Game.IDNumber
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vw_Addons', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Addon"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Game"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2205
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Addons'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vw_Addons', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Addons'
GO
/****** Object:  ForeignKey [FK_Addon_Game]    Script Date: 05/01/2012 00:01:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Addon_Game]') AND parent_object_id = OBJECT_ID(N'[dbo].[Addon]'))
ALTER TABLE [dbo].[Addon]  WITH CHECK ADD  CONSTRAINT [FK_Addon_Game] FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([IDNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Addon_Game]') AND parent_object_id = OBJECT_ID(N'[dbo].[Addon]'))
ALTER TABLE [dbo].[Addon] CHECK CONSTRAINT [FK_Addon_Game]
GO
