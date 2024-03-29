USE [master]
GO
/****** Object:  Database [BizsolDb]    Script Date: 5/18/2023 7:55:27 PM ******/
CREATE DATABASE [BizsolDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BizsolDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BizsolDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BizsolDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BizsolDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BizsolDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BizsolDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BizsolDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BizsolDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BizsolDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BizsolDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BizsolDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BizsolDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BizsolDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BizsolDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BizsolDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BizsolDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BizsolDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BizsolDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BizsolDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BizsolDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BizsolDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BizsolDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BizsolDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BizsolDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BizsolDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BizsolDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BizsolDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BizsolDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BizsolDb] SET  MULTI_USER 
GO
ALTER DATABASE [BizsolDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BizsolDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BizsolDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BizsolDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BizsolDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BizsolDb] SET QUERY_STORE = OFF
GO
USE [BizsolDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/18/2023 7:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/18/2023 7:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/18/2023 7:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/18/2023 7:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/18/2023 7:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/18/2023 7:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/18/2023 7:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/18/2023 7:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBizUser]    Script Date: 5/18/2023 7:55:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBizUser](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[DeletedDate] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblBizUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230517053630_InitialMigration', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230517054022_Added_BizUser_table', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230518083922_Added_filename_col_in_user_table', N'6.0.0')
GO
SET IDENTITY_INSERT [dbo].[tblBizUser] ON 

INSERT [dbo].[tblBizUser] ([Id], [UserName], [Email], [Phone], [Address], [CreatedDate], [UpdatedDate], [DeletedDate], [CreatedBy], [IsDeleted], [UpdatedBy], [DeletedBy], [FileName]) VALUES (31, N'info@sunglobal.online', N'test', N'fds', N'sdf', CAST(N'2023-05-18T14:00:46.0385676' AS DateTime2), NULL, CAST(N'2023-05-18T14:15:15.7090447' AS DateTime2), NULL, 1, NULL, NULL, N'Screenshot 2023-03-03 155725.png')
INSERT [dbo].[tblBizUser] ([Id], [UserName], [Email], [Phone], [Address], [CreatedDate], [UpdatedDate], [DeletedDate], [CreatedBy], [IsDeleted], [UpdatedBy], [DeletedBy], [FileName]) VALUES (32, N'test', N'tset', N'fds', N'fefew', CAST(N'2023-05-18T14:15:41.0927600' AS DateTime2), NULL, CAST(N'2023-05-18T14:49:33.7822559' AS DateTime2), NULL, 1, NULL, NULL, N'Screenshot 2023-03-08 020820.png')
INSERT [dbo].[tblBizUser] ([Id], [UserName], [Email], [Phone], [Address], [CreatedDate], [UpdatedDate], [DeletedDate], [CreatedBy], [IsDeleted], [UpdatedBy], [DeletedBy], [FileName]) VALUES (33, N'test2', N'tet', N'jkhjk', N'khkj', CAST(N'2023-05-18T14:18:07.9702831' AS DateTime2), CAST(N'2023-05-18T15:16:49.9047300' AS DateTime2), CAST(N'2023-05-18T15:17:37.1066890' AS DateTime2), NULL, 1, NULL, NULL, N'2023-04-14.png')
INSERT [dbo].[tblBizUser] ([Id], [UserName], [Email], [Phone], [Address], [CreatedDate], [UpdatedDate], [DeletedDate], [CreatedBy], [IsDeleted], [UpdatedBy], [DeletedBy], [FileName]) VALUES (34, N'haha', N'etst', N'twetq', N'kljkl', CAST(N'2023-05-18T14:48:14.8610971' AS DateTime2), NULL, CAST(N'2023-05-18T15:17:35.6430458' AS DateTime2), NULL, 1, NULL, NULL, N'plus2.png')
INSERT [dbo].[tblBizUser] ([Id], [UserName], [Email], [Phone], [Address], [CreatedDate], [UpdatedDate], [DeletedDate], [CreatedBy], [IsDeleted], [UpdatedBy], [DeletedBy], [FileName]) VALUES (35, N'hello user', N'usama@gmail.com', N'test', N'setset', CAST(N'2023-05-18T15:07:36.3211561' AS DateTime2), CAST(N'2023-05-18T15:07:49.0146856' AS DateTime2), CAST(N'2023-05-18T15:17:33.5699034' AS DateTime2), NULL, 1, NULL, NULL, N'Banner.png')
INSERT [dbo].[tblBizUser] ([Id], [UserName], [Email], [Phone], [Address], [CreatedDate], [UpdatedDate], [DeletedDate], [CreatedBy], [IsDeleted], [UpdatedBy], [DeletedBy], [FileName]) VALUES (36, N'info@sunglobal.online', N'usama.tabbassum@gmail.com', N'03318439535', N'Soan Garden, Block H, Street 45, House 8, Islamabad', CAST(N'2023-05-18T15:17:56.5014066' AS DateTime2), CAST(N'2023-05-18T16:27:00.4460869' AS DateTime2), CAST(N'2023-05-18T18:49:40.2106292' AS DateTime2), NULL, 1, NULL, NULL, N'cover.png')
INSERT [dbo].[tblBizUser] ([Id], [UserName], [Email], [Phone], [Address], [CreatedDate], [UpdatedDate], [DeletedDate], [CreatedBy], [IsDeleted], [UpdatedBy], [DeletedBy], [FileName]) VALUES (37, N'tinuravoga', N'cyzoduly@mailinator.com', N'+1 (493) 611-1471', N'Quas anim corporis h', CAST(N'2023-05-18T15:19:07.5033589' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[tblBizUser] ([Id], [UserName], [Email], [Phone], [Address], [CreatedDate], [UpdatedDate], [DeletedDate], [CreatedBy], [IsDeleted], [UpdatedBy], [DeletedBy], [FileName]) VALUES (39, N'sdfsd', N'jhjh', NULL, NULL, CAST(N'2023-05-18T16:26:01.4170169' AS DateTime2), NULL, CAST(N'2023-05-18T16:26:08.5769919' AS DateTime2), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[tblBizUser] ([Id], [UserName], [Email], [Phone], [Address], [CreatedDate], [UpdatedDate], [DeletedDate], [CreatedBy], [IsDeleted], [UpdatedBy], [DeletedBy], [FileName]) VALUES (40, N'Test User', N'Test', N'03318439535', N'Soan Garden, Block H, Street 45, House 8, Islamabad', CAST(N'2023-05-18T19:21:36.9733731' AS DateTime2), CAST(N'2023-05-18T19:24:26.1017750' AS DateTime2), CAST(N'2023-05-18T19:26:46.5477230' AS DateTime2), NULL, 1, NULL, NULL, N'2023-04-14.png')
INSERT [dbo].[tblBizUser] ([Id], [UserName], [Email], [Phone], [Address], [CreatedDate], [UpdatedDate], [DeletedDate], [CreatedBy], [IsDeleted], [UpdatedBy], [DeletedBy], [FileName]) VALUES (41, N'Test 2', N'user@gmail.com', N'+1 (984) 579-9232', N'Omnis reprehenderit', CAST(N'2023-05-18T19:28:51.6714341' AS DateTime2), NULL, CAST(N'2023-05-18T19:29:36.1547716' AS DateTime2), NULL, 1, NULL, NULL, N'2023-02-03.png')
SET IDENTITY_INSERT [dbo].[tblBizUser] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 5/18/2023 7:55:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/18/2023 7:55:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 5/18/2023 7:55:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 5/18/2023 7:55:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 5/18/2023 7:55:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 5/18/2023 7:55:27 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/18/2023 7:55:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [BizsolDb] SET  READ_WRITE 
GO
