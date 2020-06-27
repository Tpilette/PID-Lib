USE [Library]
GO
/****** Object:  User [thibault]    Script Date: 27/06/2020 18:51:19 ******/
CREATE USER [thibault] FOR LOGIN [thibault] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [thibaultP]    Script Date: 27/06/2020 18:51:19 ******/
CREATE USER [thibaultP] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [thibault]
GO
/****** Object:  Table [dbo].[AffiliateLibrary]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AffiliateLibrary](
	[AffiliateLibraryId] [int] IDENTITY(1,1) NOT NULL,
	[ReaderId] [int] NULL,
	[BibliothequeId] [int] NULL,
	[fee] [float] NULL,
	[validityExpiration] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[AffiliateLibraryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit](
	[AuditId] [int] IDENTITY(1,1) NOT NULL,
	[Table] [nvarchar](30) NOT NULL,
	[Field] [nvarchar](50) NOT NULL,
	[OldValue] [nvarchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[Caller] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Pseudo] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthorTheme]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorTheme](
	[AuthorThemeId] [int] NOT NULL,
	[AuthorId] [int] NULL,
	[ThemeId] [int] NOT NULL,
 CONSTRAINT [PK_AuthorTheme] PRIMARY KEY CLUSTERED 
(
	[AuthorThemeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bibliotheque]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bibliotheque](
	[BibliothequeId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](30) NOT NULL,
	[MontantAmende] [decimal](18, 2) NULL,
	[MontantCotisation] [decimal](18, 2) NULL,
	[Manager] [int] NULL,
 CONSTRAINT [PK__Library__A136475F192B9337] PRIMARY KEY CLUSTERED 
(
	[BibliothequeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BiliothequeStock]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BiliothequeStock](
	[BibliothequeStockId] [int] IDENTITY(1,1) NOT NULL,
	[IdBibliotheque] [int] NULL,
	[IdCopy] [int] NULL,
 CONSTRAINT [PK_BiliothequeStockId] PRIMARY KEY CLUSTERED 
(
	[BibliothequeStockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](10, 2) NULL,
	[Edition] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookAuthor]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthor](
	[BookAuthorId] [int] NOT NULL,
	[BookId] [int] NULL,
	[AuthorId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookTheme]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookTheme](
	[BookThemeId] [int] NOT NULL,
	[ThemeId] [int] NULL,
	[BookId] [int] NULL,
 CONSTRAINT [PK_BookTheme] PRIMARY KEY CLUSTERED 
(
	[BookThemeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrowing]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrowing](
	[BorrowingId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NOT NULL,
	[ReaderId] [int] NULL,
	[CopyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BorrowingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] NOT NULL,
	[comment] [nvarchar](max) NOT NULL,
	[ReaderId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[BookId] [int] NOT NULL,
	[score] [float] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Copy]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Copy](
	[CopyId] [int] IDENTITY(1,1) NOT NULL,
	[CopyStateId] [int] NULL,
	[CopyStatusId] [int] NULL,
	[BibliothequeId] [int] NULL,
	[BookId] [int] NULL,
	[IsEbook] [bit] NULL,
 CONSTRAINT [PK_Copy] PRIMARY KEY CLUSTERED 
(
	[CopyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CopyState]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CopyState](
	[CopyStateId] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CopyStateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CopyStatus]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CopyStatus](
	[CopyStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CopyStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fine]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fine](
	[FineId] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [nvarchar](max) NOT NULL,
	[Date] [date] NOT NULL,
	[ReaderId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Librarian]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Librarian](
	[LibrarianId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](30) NOT NULL,
	[RoleId] [int] NULL,
	[ManagedBy] [int] NULL,
	[LibraryId] [int] NULL,
	[Hash] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[LibrarianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Response] [nvarchar](max) NULL,
	[ReaderId] [int] NULL,
	[LibrarianId] [int] NULL,
	[ConversationId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reader]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reader](
	[ReaderId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Hash] [nvarchar](100) NULL,
	[Role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReaderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[ReaderId] [int] NULL,
	[BookId] [int] NULL,
	[DateReservation] [date] NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Theme]    Script Date: 27/06/2020 18:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theme](
	[ThemeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ThemeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AffiliateLibrary] ON 

INSERT [dbo].[AffiliateLibrary] ([AffiliateLibraryId], [ReaderId], [BibliothequeId], [fee], [validityExpiration]) VALUES (1, 1, 1, 15, CAST(N'2021-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[AffiliateLibrary] OFF
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([AuthorId], [Name], [Lastname], [Pseudo]) VALUES (1, N'JRR', N'Tolkien', NULL)
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Bibliotheque] ON 

INSERT [dbo].[Bibliotheque] ([BibliothequeId], [Address], [Email], [Phone], [MontantAmende], [MontantCotisation], [Manager]) VALUES (1, N'Rue de l''école', N'bib@ipam.com', N'065656565', CAST(0.50 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Bibliotheque] ([BibliothequeId], [Address], [Email], [Phone], [MontantAmende], [MontantCotisation], [Manager]) VALUES (2, N'Rue de la paix', N'bib@ipam.com', N'065656565', CAST(0.75 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Bibliotheque] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookId], [Title], [Description], [Price], [Edition]) VALUES (1, N'La Communauté de l''anneau', N'La Fraternité de l''Anneau (The Fellowship of the Ring dans son titre original, La Communauté de l''Anneau dans la première traduction de Francis Ledoux) est la première partie du Seigneur des anneaux, roman en trois volumes de l''écrivain britannique J. R. R. Tolkien, parue le 29 juillet 1954 au Royaume-Uni.', CAST(11.55 AS Decimal(10, 2)), N'Pocket')
INSERT [dbo].[Book] ([BookId], [Title], [Description], [Price], [Edition]) VALUES (25, N'Lord of the rings', N'Heroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy book', NULL, N'Edition collector')
INSERT [dbo].[Book] ([BookId], [Title], [Description], [Price], [Edition]) VALUES (26, N'The Witcher', N'Heroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy book', NULL, N'Galimar')
INSERT [dbo].[Book] ([BookId], [Title], [Description], [Price], [Edition]) VALUES (27, N'Eragon', N'Heroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy bookHeroic fantasy book', NULL, N'Pocket')
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Borrowing] ON 

INSERT [dbo].[Borrowing] ([BorrowingId], [StartDate], [ReaderId], [CopyId]) VALUES (1, CAST(N'2019-12-08' AS Date), 1, 1)
INSERT [dbo].[Borrowing] ([BorrowingId], [StartDate], [ReaderId], [CopyId]) VALUES (2, CAST(N'2020-02-06' AS Date), 1, 1)
INSERT [dbo].[Borrowing] ([BorrowingId], [StartDate], [ReaderId], [CopyId]) VALUES (3, CAST(N'2020-02-06' AS Date), 1, 1)
INSERT [dbo].[Borrowing] ([BorrowingId], [StartDate], [ReaderId], [CopyId]) VALUES (4, CAST(N'2020-02-06' AS Date), 1, 1)
INSERT [dbo].[Borrowing] ([BorrowingId], [StartDate], [ReaderId], [CopyId]) VALUES (5, CAST(N'2020-02-06' AS Date), 1, 2)
INSERT [dbo].[Borrowing] ([BorrowingId], [StartDate], [ReaderId], [CopyId]) VALUES (1002, CAST(N'2020-06-26' AS Date), 1, 1)
INSERT [dbo].[Borrowing] ([BorrowingId], [StartDate], [ReaderId], [CopyId]) VALUES (1003, CAST(N'2020-06-27' AS Date), 1, 1005)
INSERT [dbo].[Borrowing] ([BorrowingId], [StartDate], [ReaderId], [CopyId]) VALUES (1004, CAST(N'2020-06-27' AS Date), 1, 1007)
INSERT [dbo].[Borrowing] ([BorrowingId], [StartDate], [ReaderId], [CopyId]) VALUES (1005, CAST(N'2020-06-27' AS Date), 1, 1007)
INSERT [dbo].[Borrowing] ([BorrowingId], [StartDate], [ReaderId], [CopyId]) VALUES (1006, CAST(N'2020-06-27' AS Date), 1, 1007)
INSERT [dbo].[Borrowing] ([BorrowingId], [StartDate], [ReaderId], [CopyId]) VALUES (1007, CAST(N'2020-06-27' AS Date), 1, 1007)
INSERT [dbo].[Borrowing] ([BorrowingId], [StartDate], [ReaderId], [CopyId]) VALUES (1008, CAST(N'2020-06-27' AS Date), 1, 1007)
SET IDENTITY_INSERT [dbo].[Borrowing] OFF
GO
SET IDENTITY_INSERT [dbo].[Copy] ON 

INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1, 1, 3, 1, 1, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (2, 1, 1, 1, 25, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (3, 1, 1, 1, 26, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1003, 1, 1, 1, 27, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1004, 1, 1, 2, 25, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1005, 1, 3, 1, 1, 0)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1006, 1, 1, 1, 25, 0)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1007, 1, 1, 1, 1, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1008, 1, 1, 1, 25, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1009, 1, 1, 1, 26, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1010, 1, 1, 1, 27, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1011, 1, 1, 2, 25, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1012, 1, 1, 1, 1, 0)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1013, 1, 1, 1, 25, 0)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1014, 1, 1, 1, 1, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1015, 1, 1, 1, 25, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1016, 1, 1, 1, 26, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1017, 1, 1, 1, 27, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1018, 1, 1, 2, 25, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1019, 1, 1, 1, 1, 0)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1020, 1, 1, 1, 25, 0)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1021, 1, 1, 1, 1, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1022, 1, 1, 1, 25, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1023, 1, 1, 1, 26, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1024, 1, 1, 1, 27, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1025, 1, 1, 2, 25, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1026, 1, 1, 1, 1, 0)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1027, 1, 1, 1, 25, 0)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1028, 1, 1, 1, 1, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1029, 1, 1, 1, 25, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1030, 1, 1, 1, 26, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1031, 1, 1, 1, 27, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1032, 1, 1, 2, 25, 1)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1033, 1, 1, 1, 1, 0)
INSERT [dbo].[Copy] ([CopyId], [CopyStateId], [CopyStatusId], [BibliothequeId], [BookId], [IsEbook]) VALUES (1034, 1, 1, 1, 25, 0)
SET IDENTITY_INSERT [dbo].[Copy] OFF
GO
SET IDENTITY_INSERT [dbo].[CopyState] ON 

INSERT [dbo].[CopyState] ([CopyStateId], [Value]) VALUES (1, N'Nouveau')
INSERT [dbo].[CopyState] ([CopyStateId], [Value]) VALUES (2, N'Abimé')
INSERT [dbo].[CopyState] ([CopyStateId], [Value]) VALUES (3, N'Utilisé')
SET IDENTITY_INSERT [dbo].[CopyState] OFF
GO
SET IDENTITY_INSERT [dbo].[CopyStatus] ON 

INSERT [dbo].[CopyStatus] ([CopyStatusId], [Value]) VALUES (1, N'Disponible')
INSERT [dbo].[CopyStatus] ([CopyStatusId], [Value]) VALUES (2, N'Indisponible')
INSERT [dbo].[CopyStatus] ([CopyStatusId], [Value]) VALUES (3, N'Loué')
SET IDENTITY_INSERT [dbo].[CopyStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Librarian] ON 

INSERT [dbo].[Librarian] ([LibrarianId], [Name], [Lastname], [Address], [Phone], [RoleId], [ManagedBy], [LibraryId], [Hash]) VALUES (1, N'Jf', N'pilett', N'rue de la paix 53', N'065656565', 4, 3, 1, NULL)
INSERT [dbo].[Librarian] ([LibrarianId], [Name], [Lastname], [Address], [Phone], [RoleId], [ManagedBy], [LibraryId], [Hash]) VALUES (2, N'Fj', N'pilett', N'rue de la paix 55', N'065656565', 3, NULL, NULL, NULL)
INSERT [dbo].[Librarian] ([LibrarianId], [Name], [Lastname], [Address], [Phone], [RoleId], [ManagedBy], [LibraryId], [Hash]) VALUES (3, N'Toto', N'Tutu', N'rue de la paix 56', N'065656565', 2, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Librarian] OFF
GO
SET IDENTITY_INSERT [dbo].[Reader] ON 

INSERT [dbo].[Reader] ([ReaderId], [Name], [Lastname], [Address], [Phone], [Email], [Hash], [Role]) VALUES (1, N'Thibault', N'Pilette', N'rue louis caty', N'0477611646', N'thibault_pilette@hotmail.com', N'$2a$12$/IQ5aoiog.DjTMfO1pKYQ.3PdnNzeoBeiu1DC.KHdeoV6Dr0RB9OG', 1)
INSERT [dbo].[Reader] ([ReaderId], [Name], [Lastname], [Address], [Phone], [Email], [Hash], [Role]) VALUES (2, N'jessica@hotmail.com', N'Hennaut', N'Rue Louis Caty', N'00361561', NULL, NULL, 1)
INSERT [dbo].[Reader] ([ReaderId], [Name], [Lastname], [Address], [Phone], [Email], [Hash], [Role]) VALUES (3, N'Delphine', N'Eloy', N'Cité du Bocage', N'0479487998', N'delphine@hotmail.com', NULL, 1)
INSERT [dbo].[Reader] ([ReaderId], [Name], [Lastname], [Address], [Phone], [Email], [Hash], [Role]) VALUES (4, N'Marie-Claude', N'Vincq', N'Cité du Bocage', N'0479487998', N'MC@hotmail.com', NULL, 1)
SET IDENTITY_INSERT [dbo].[Reader] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (1, N'Reader')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (2, N'Manager')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (3, N'GeneralManager')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (4, N'Librarian')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Theme] ON 

INSERT [dbo].[Theme] ([ThemeId], [Name]) VALUES (1, N'Héroic-fantasy')
SET IDENTITY_INSERT [dbo].[Theme] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UniqueTitle]    Script Date: 27/06/2020 18:51:19 ******/
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [UniqueTitle] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name_Lastname_Address]    Script Date: 27/06/2020 18:51:19 ******/
ALTER TABLE [dbo].[Reader] ADD  CONSTRAINT [IX_Name_Lastname_Address] UNIQUE NONCLUSTERED 
(
	[Address] ASC,
	[Lastname] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UniqueMail]    Script Date: 27/06/2020 18:51:19 ******/
ALTER TABLE [dbo].[Reader] ADD  CONSTRAINT [UniqueMail] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AffiliateLibrary]  WITH CHECK ADD  CONSTRAINT [FK__Affiliate__Libra__4BAC3F29] FOREIGN KEY([BibliothequeId])
REFERENCES [dbo].[Bibliotheque] ([BibliothequeId])
GO
ALTER TABLE [dbo].[AffiliateLibrary] CHECK CONSTRAINT [FK__Affiliate__Libra__4BAC3F29]
GO
ALTER TABLE [dbo].[AffiliateLibrary]  WITH CHECK ADD FOREIGN KEY([ReaderId])
REFERENCES [dbo].[Reader] ([ReaderId])
GO
ALTER TABLE [dbo].[AuthorTheme]  WITH CHECK ADD  CONSTRAINT [FK_AuthorTheme_Author] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([AuthorId])
GO
ALTER TABLE [dbo].[AuthorTheme] CHECK CONSTRAINT [FK_AuthorTheme_Author]
GO
ALTER TABLE [dbo].[AuthorTheme]  WITH CHECK ADD  CONSTRAINT [FK_AuthorTheme_Theme] FOREIGN KEY([ThemeId])
REFERENCES [dbo].[Theme] ([ThemeId])
GO
ALTER TABLE [dbo].[AuthorTheme] CHECK CONSTRAINT [FK_AuthorTheme_Theme]
GO
ALTER TABLE [dbo].[BiliothequeStock]  WITH CHECK ADD  CONSTRAINT [FK_BiliothequeStock_Bibliotheque] FOREIGN KEY([BibliothequeStockId])
REFERENCES [dbo].[Bibliotheque] ([BibliothequeId])
GO
ALTER TABLE [dbo].[BiliothequeStock] CHECK CONSTRAINT [FK_BiliothequeStock_Bibliotheque]
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Author] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([AuthorId])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_BookAuthor_Author]
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_BookAuthor_Book]
GO
ALTER TABLE [dbo].[BookTheme]  WITH CHECK ADD  CONSTRAINT [FK_BookTheme_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[BookTheme] CHECK CONSTRAINT [FK_BookTheme_Book]
GO
ALTER TABLE [dbo].[BookTheme]  WITH CHECK ADD  CONSTRAINT [FK_BookTheme_Theme] FOREIGN KEY([ThemeId])
REFERENCES [dbo].[Theme] ([ThemeId])
GO
ALTER TABLE [dbo].[BookTheme] CHECK CONSTRAINT [FK_BookTheme_Theme]
GO
ALTER TABLE [dbo].[Borrowing]  WITH CHECK ADD  CONSTRAINT [FK__Borrowing__Reader] FOREIGN KEY([ReaderId])
REFERENCES [dbo].[Reader] ([ReaderId])
GO
ALTER TABLE [dbo].[Borrowing] CHECK CONSTRAINT [FK__Borrowing__Reader]
GO
ALTER TABLE [dbo].[Borrowing]  WITH CHECK ADD  CONSTRAINT [FK_Borrowing_Copy] FOREIGN KEY([CopyId])
REFERENCES [dbo].[Copy] ([CopyId])
GO
ALTER TABLE [dbo].[Borrowing] CHECK CONSTRAINT [FK_Borrowing_Copy]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Book]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Reader] FOREIGN KEY([ReaderId])
REFERENCES [dbo].[Reader] ([ReaderId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Reader]
GO
ALTER TABLE [dbo].[Copy]  WITH CHECK ADD  CONSTRAINT [FK__Copy__CopyStateId] FOREIGN KEY([CopyStateId])
REFERENCES [dbo].[CopyState] ([CopyStateId])
GO
ALTER TABLE [dbo].[Copy] CHECK CONSTRAINT [FK__Copy__CopyStateId]
GO
ALTER TABLE [dbo].[Copy]  WITH CHECK ADD  CONSTRAINT [FK__Copy__CopyStatusId] FOREIGN KEY([CopyStatusId])
REFERENCES [dbo].[CopyStatus] ([CopyStatusId])
GO
ALTER TABLE [dbo].[Copy] CHECK CONSTRAINT [FK__Copy__CopyStatusId]
GO
ALTER TABLE [dbo].[Copy]  WITH CHECK ADD  CONSTRAINT [FK_Copy_Bibliotheque] FOREIGN KEY([BibliothequeId])
REFERENCES [dbo].[Bibliotheque] ([BibliothequeId])
GO
ALTER TABLE [dbo].[Copy] CHECK CONSTRAINT [FK_Copy_Bibliotheque]
GO
ALTER TABLE [dbo].[Fine]  WITH CHECK ADD FOREIGN KEY([ReaderId])
REFERENCES [dbo].[Reader] ([ReaderId])
GO
ALTER TABLE [dbo].[Librarian]  WITH CHECK ADD  CONSTRAINT [FK__Librarian__Libra__3F466844] FOREIGN KEY([LibraryId])
REFERENCES [dbo].[Bibliotheque] ([BibliothequeId])
GO
ALTER TABLE [dbo].[Librarian] CHECK CONSTRAINT [FK__Librarian__Libra__3F466844]
GO
ALTER TABLE [dbo].[Librarian]  WITH CHECK ADD FOREIGN KEY([ManagedBy])
REFERENCES [dbo].[Librarian] ([LibrarianId])
GO
ALTER TABLE [dbo].[Librarian]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([LibrarianId])
REFERENCES [dbo].[Librarian] ([LibrarianId])
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([ReaderId])
REFERENCES [dbo].[Reader] ([ReaderId])
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Book]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Reader] FOREIGN KEY([ReaderId])
REFERENCES [dbo].[Reader] ([ReaderId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Reader]
GO
