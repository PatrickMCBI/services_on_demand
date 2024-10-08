USE [ServicesProvider]
GO
/****** Object:  Schema [admin]    Script Date: 07/09/2024 10:41:51 pm ******/
CREATE SCHEMA [admin]
GO
/****** Object:  Schema [agencies]    Script Date: 07/09/2024 10:41:51 pm ******/
CREATE SCHEMA [agencies]
GO
/****** Object:  Schema [household]    Script Date: 07/09/2024 10:41:51 pm ******/
CREATE SCHEMA [household]
GO
/****** Object:  Schema [master]    Script Date: 07/09/2024 10:41:51 pm ******/
CREATE SCHEMA [master]
GO
/****** Object:  Schema [professional]    Script Date: 07/09/2024 10:41:51 pm ******/
CREATE SCHEMA [professional]
GO
/****** Object:  Schema [transaction]    Script Date: 07/09/2024 10:41:51 pm ******/
CREATE SCHEMA [transaction]
GO
/****** Object:  Schema [users]    Script Date: 07/09/2024 10:41:51 pm ******/
CREATE SCHEMA [users]
GO
/****** Object:  Table [admin].[notifications]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [admin].[notifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NULL,
	[FromUser] [int] NULL,
	[ToUser] [int] NULL,
	[IsActive] [bit] NULL,
	[IsRead] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_notifications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [agencies].[Agencies]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [agencies].[Agencies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServicesID] [int] NULL,
	[AgencyName] [varchar](100) NULL,
	[Description] [varchar](100) NULL,
	[ContactNumber] [varchar](12) NULL,
	[Email] [varchar](50) NULL,
	[Web] [varbinary](50) NULL,
	[IsActive] [bit] NULL,
	[DateCreated] [date] NULL,
	[DateUpdated] [date] NULL,
 CONSTRAINT [PK_Agencies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [agencies].[AgenciesMaster]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [agencies].[AgenciesMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServicesID] [int] NULL,
	[AgencyID] [int] NULL,
	[UserID] [int] NULL,
	[IsActive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_AgenciesMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[driver]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[driver](
	[driver_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[license_number] [varchar](15) NULL,
	[date_created] [date] NULL,
	[date_updated] [date] NULL,
 CONSTRAINT [PK_driver] PRIMARY KEY CLUSTERED 
(
	[driver_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicles]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicles](
	[vehicle_id] [int] IDENTITY(1,1) NOT NULL,
	[driver_id] [int] NULL,
	[model] [varchar](10) NULL,
	[year] [varchar](8) NULL,
	[color] [varchar](15) NULL,
	[plate_number] [varchar](20) NULL,
	[date_created] [date] NULL,
	[date_updated] [date] NULL,
 CONSTRAINT [PK_vehicles] PRIMARY KEY CLUSTERED 
(
	[vehicle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [master].[category]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [master].[category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
	[Img] [text] NULL,
	[Description] [varchar](255) NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [master].[services]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [master].[services](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[ServiceName] [varchar](50) NULL,
	[Img] [text] NULL,
	[Description] [varchar](255) NULL,
	[Url] [varchar](150) NULL,
	[IsActive] [bit] NULL,
	[DateCreated] [date] NULL,
	[DateUpdated] [date] NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [master].[status]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [master].[status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](15) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [master].[userType]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [master].[userType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](10) NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [transaction].[babySitting]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [transaction].[babySitting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NULL,
	[ChildAge] [int] NULL,
	[NumberOfChild] [int] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_babySitting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [transaction].[booking]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [transaction].[booking](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[WServicesID] [int] NULL,
	[BookingStartDate] [datetime] NULL,
	[BookingEndDate] [datetime] NULL,
	[StartHour] [time](7) NULL,
	[EndHour] [time](7) NULL,
	[BookingAddress] [varchar](150) NULL,
	[BookingMessage] [varchar](max) NULL,
	[BookingStatus] [int] NULL,
	[TotalPrice] [decimal](10, 2) NULL,
	[DateCreated] [date] NULL,
	[DateUpdated] [date] NULL,
 CONSTRAINT [PK_booking] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [transaction].[payments]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [transaction].[payments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NULL,
	[Amount] [decimal](10, 2) NULL,
	[PaymentMethod] [varchar](10) NULL,
	[PaymentStatus] [int] NULL,
	[DateCreated] [date] NULL,
	[DateUpdated] [date] NULL,
 CONSTRAINT [PK_payments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [users].[account]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [users].[account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[VerificationToken] [varchar](max) NULL,
	[IsVerified] [bit] NULL,
	[DateCreated] [date] NULL,
	[DateUpdated] [date] NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [users].[Availability]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [users].[Availability](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[DayOfWeek] [varchar](15) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[IsActive] [bit] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_Availability] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [users].[Rating]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [users].[Rating](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WokerID] [int] NULL,
	[UserID] [int] NULL,
	[Rating] [int] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [users].[servicesWorker]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [users].[servicesWorker](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ServicesID] [int] NULL,
	[IsActive] [bit] NULL,
	[DateCreated] [date] NULL,
	[DateUpdated] [date] NULL,
 CONSTRAINT [PK_ServicesWorker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [users].[users]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [users].[users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[PhoneNumber] [varchar](12) NULL,
	[Birthdate] [date] NULL,
	[Address] [text] NULL,
	[Description] [text] NULL,
	[Profile] [text] NULL,
	[UserTypeID] [int] NULL,
	[IsActive] [bit] NULL,
	[DateCreated] [date] NULL,
	[DateUpdated] [date] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [admin].[notifications] ON 

INSERT [admin].[notifications] ([ID], [BookingID], [FromUser], [ToUser], [IsActive], [IsRead], [DateCreated], [DateUpdated]) VALUES (1, 4, NULL, NULL, 1, 0, CAST(N'2024-07-21T20:57:27.540' AS DateTime), NULL)
INSERT [admin].[notifications] ([ID], [BookingID], [FromUser], [ToUser], [IsActive], [IsRead], [DateCreated], [DateUpdated]) VALUES (2, 5, NULL, NULL, 1, 0, CAST(N'2024-07-22T10:45:59.420' AS DateTime), NULL)
INSERT [admin].[notifications] ([ID], [BookingID], [FromUser], [ToUser], [IsActive], [IsRead], [DateCreated], [DateUpdated]) VALUES (3, 6, NULL, NULL, 1, 0, CAST(N'2024-07-22T10:46:53.390' AS DateTime), NULL)
INSERT [admin].[notifications] ([ID], [BookingID], [FromUser], [ToUser], [IsActive], [IsRead], [DateCreated], [DateUpdated]) VALUES (4, 7, NULL, NULL, 1, 0, CAST(N'2024-07-22T10:47:00.480' AS DateTime), NULL)
INSERT [admin].[notifications] ([ID], [BookingID], [FromUser], [ToUser], [IsActive], [IsRead], [DateCreated], [DateUpdated]) VALUES (5, 8, NULL, NULL, 1, 0, CAST(N'2024-07-30T22:05:23.690' AS DateTime), NULL)
INSERT [admin].[notifications] ([ID], [BookingID], [FromUser], [ToUser], [IsActive], [IsRead], [DateCreated], [DateUpdated]) VALUES (6, 9, 2, 3, 1, 0, CAST(N'2024-08-10T12:45:53.213' AS DateTime), NULL)
INSERT [admin].[notifications] ([ID], [BookingID], [FromUser], [ToUser], [IsActive], [IsRead], [DateCreated], [DateUpdated]) VALUES (7, 10, 2, 3, 1, 0, CAST(N'2024-08-10T13:35:55.000' AS DateTime), NULL)
INSERT [admin].[notifications] ([ID], [BookingID], [FromUser], [ToUser], [IsActive], [IsRead], [DateCreated], [DateUpdated]) VALUES (8, 11, NULL, NULL, 1, 0, CAST(N'2024-08-19T20:36:22.303' AS DateTime), NULL)
INSERT [admin].[notifications] ([ID], [BookingID], [FromUser], [ToUser], [IsActive], [IsRead], [DateCreated], [DateUpdated]) VALUES (9, 12, NULL, 3, 1, 0, CAST(N'2024-08-19T20:39:32.960' AS DateTime), NULL)
INSERT [admin].[notifications] ([ID], [BookingID], [FromUser], [ToUser], [IsActive], [IsRead], [DateCreated], [DateUpdated]) VALUES (10, 13, 2, 3, 1, 0, CAST(N'2024-08-20T21:09:19.670' AS DateTime), NULL)
INSERT [admin].[notifications] ([ID], [BookingID], [FromUser], [ToUser], [IsActive], [IsRead], [DateCreated], [DateUpdated]) VALUES (11, 14, 2, 16, 1, 0, CAST(N'2024-09-05T20:47:21.297' AS DateTime), NULL)
SET IDENTITY_INSERT [admin].[notifications] OFF
GO
SET IDENTITY_INSERT [agencies].[Agencies] ON 

INSERT [agencies].[Agencies] ([ID], [ServicesID], [AgencyName], [Description], [ContactNumber], [Email], [Web], [IsActive], [DateCreated], [DateUpdated]) VALUES (1, 1, N'Agency One', N'We Provide cleaning maid', NULL, NULL, NULL, 1, CAST(N'2024-07-21' AS Date), NULL)
SET IDENTITY_INSERT [agencies].[Agencies] OFF
GO
SET IDENTITY_INSERT [agencies].[AgenciesMaster] ON 

INSERT [agencies].[AgenciesMaster] ([ID], [ServicesID], [AgencyID], [UserID], [IsActive], [DateCreated], [DateUpdated]) VALUES (1, 1, 1, 6, 1, CAST(N'2024-07-24T18:26:37.407' AS DateTime), NULL)
SET IDENTITY_INSERT [agencies].[AgenciesMaster] OFF
GO
SET IDENTITY_INSERT [master].[category] ON 

INSERT [master].[category] ([ID], [CategoryName], [Img], [Description], [DateCreated]) VALUES (1, N'House Hold', N'icon_house_hold.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', CAST(N'2024-07-20' AS Date))
INSERT [master].[category] ([ID], [CategoryName], [Img], [Description], [DateCreated]) VALUES (2, N'Health and Wellness', N'icon_wellness.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', CAST(N'2024-07-20' AS Date))
INSERT [master].[category] ([ID], [CategoryName], [Img], [Description], [DateCreated]) VALUES (3, N'Maintenance and Repair', N'icon_repair.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', CAST(N'2024-07-20' AS Date))
SET IDENTITY_INSERT [master].[category] OFF
GO
SET IDENTITY_INSERT [master].[services] ON 

INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (1, 1, N'Cleaning', N'icon_cleaning.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', N's/cleaning_r', 1, CAST(N'2024-07-20' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (2, 1, N'Gardening/Landscaping', N'icon_lawn.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', N's/landscapping_r', 1, CAST(N'2024-07-20' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (3, 2, N'Massage Therapy', N'icon_massage.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-07-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (4, 3, N'Electrical ', N'icon_electrical.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-07-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (5, 3, N'Plumbing', N'icon_plumbing.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-07-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (6, 1, N'Cooking', N'icon_cooking.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (7, 1, N'Babysitting/Nanny', N'icon_babysitting.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', N'babysitting_r', 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (8, 1, N'Home Organization', N'icon_homeorganizer.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (9, 2, N'Fitness', N'icon_fitness.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (10, 2, N'Medical', N'icon_medical.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (11, 2, N'Manicures and pedicures', N'icon_mani_pedi.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (12, 2, N'Hairstyling', N'icon_hairstyle.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (13, 2, N'Counseling/therapy', N'icon_counseling.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (14, 2, N'Life coaching', N'icon_life.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (15, 2, N'Meditation sessions', N'icon_meditation.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (16, 2, N'Nutritional counseling', N'icon_nutrition.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (17, 3, N'Carpentry', N'icon_carpenter.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (18, 3, N'Roofing', N'icon_roof.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (19, 3, N'Appliance Repair', N'icon_repair_tools.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (20, 3, N'Automotive', N'icon_automotive.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (21, 3, N'Pest Control', N'icon_sanitizer.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (22, 3, N'Painting', N'icon_paint.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (23, 3, N'Furniture assembly', N'icon_furniture.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
INSERT [master].[services] ([ID], [CategoryID], [ServiceName], [Img], [Description], [Url], [IsActive], [DateCreated], [DateUpdated]) VALUES (24, 3, N'Home security installation', N'icon_cctv.png', N'when looking at its layout. The point of using services is that it has a more-or-less normal', NULL, 1, CAST(N'2024-08-31' AS Date), NULL)
SET IDENTITY_INSERT [master].[services] OFF
GO
SET IDENTITY_INSERT [master].[status] ON 

INSERT [master].[status] ([ID], [StatusName]) VALUES (1, N'Pending')
INSERT [master].[status] ([ID], [StatusName]) VALUES (2, N'In Progress')
INSERT [master].[status] ([ID], [StatusName]) VALUES (3, N'Completed')
INSERT [master].[status] ([ID], [StatusName]) VALUES (4, N'Cancelled')
INSERT [master].[status] ([ID], [StatusName]) VALUES (5, N'Failed')
SET IDENTITY_INSERT [master].[status] OFF
GO
SET IDENTITY_INSERT [master].[userType] ON 

INSERT [master].[userType] ([ID], [TypeName]) VALUES (1, N'Admin')
INSERT [master].[userType] ([ID], [TypeName]) VALUES (2, N'Moderator')
INSERT [master].[userType] ([ID], [TypeName]) VALUES (3, N'Guest')
INSERT [master].[userType] ([ID], [TypeName]) VALUES (4, N'Consumer')
INSERT [master].[userType] ([ID], [TypeName]) VALUES (5, N'Worker')
SET IDENTITY_INSERT [master].[userType] OFF
GO
SET IDENTITY_INSERT [transaction].[booking] ON 

INSERT [transaction].[booking] ([ID], [AccountID], [WServicesID], [BookingStartDate], [BookingEndDate], [StartHour], [EndHour], [BookingAddress], [BookingMessage], [BookingStatus], [TotalPrice], [DateCreated], [DateUpdated]) VALUES (1, 0, 1, CAST(N'2024-07-21T00:00:00.000' AS DateTime), CAST(N'2024-07-23T00:00:00.000' AS DateTime), NULL, NULL, N'This is sample address', N'this is sample message', 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-07-21' AS Date), NULL)
INSERT [transaction].[booking] ([ID], [AccountID], [WServicesID], [BookingStartDate], [BookingEndDate], [StartHour], [EndHour], [BookingAddress], [BookingMessage], [BookingStatus], [TotalPrice], [DateCreated], [DateUpdated]) VALUES (2, 1, 1, CAST(N'2024-07-21T00:00:00.000' AS DateTime), CAST(N'2024-07-23T00:00:00.000' AS DateTime), NULL, NULL, N'This is a sample address', N'This is a sample message', 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-07-21' AS Date), NULL)
INSERT [transaction].[booking] ([ID], [AccountID], [WServicesID], [BookingStartDate], [BookingEndDate], [StartHour], [EndHour], [BookingAddress], [BookingMessage], [BookingStatus], [TotalPrice], [DateCreated], [DateUpdated]) VALUES (3, 2, 1, CAST(N'2024-07-21T00:00:00.000' AS DateTime), CAST(N'2024-07-23T00:00:00.000' AS DateTime), NULL, NULL, N'This is a sample address', N'This is a sample message', 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-07-21' AS Date), NULL)
INSERT [transaction].[booking] ([ID], [AccountID], [WServicesID], [BookingStartDate], [BookingEndDate], [StartHour], [EndHour], [BookingAddress], [BookingMessage], [BookingStatus], [TotalPrice], [DateCreated], [DateUpdated]) VALUES (4, 3, 1, CAST(N'2024-07-21T00:00:00.000' AS DateTime), CAST(N'2024-07-22T00:00:00.000' AS DateTime), NULL, NULL, N'ASDd', N'asdasfadf', 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-07-21' AS Date), NULL)
INSERT [transaction].[booking] ([ID], [AccountID], [WServicesID], [BookingStartDate], [BookingEndDate], [StartHour], [EndHour], [BookingAddress], [BookingMessage], [BookingStatus], [TotalPrice], [DateCreated], [DateUpdated]) VALUES (5, 4, 1, CAST(N'2024-07-21T00:00:00.000' AS DateTime), CAST(N'2024-07-22T00:00:00.000' AS DateTime), NULL, NULL, N'ASDd', N'asdasfadf', 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-07-22' AS Date), NULL)
INSERT [transaction].[booking] ([ID], [AccountID], [WServicesID], [BookingStartDate], [BookingEndDate], [StartHour], [EndHour], [BookingAddress], [BookingMessage], [BookingStatus], [TotalPrice], [DateCreated], [DateUpdated]) VALUES (6, 5, 1, CAST(N'2024-07-21T00:00:00.000' AS DateTime), CAST(N'2024-07-22T00:00:00.000' AS DateTime), NULL, NULL, N'ASDd', N'asdasfadf', 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-07-22' AS Date), NULL)
INSERT [transaction].[booking] ([ID], [AccountID], [WServicesID], [BookingStartDate], [BookingEndDate], [StartHour], [EndHour], [BookingAddress], [BookingMessage], [BookingStatus], [TotalPrice], [DateCreated], [DateUpdated]) VALUES (7, 6, 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, N'', N'', 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-07-22' AS Date), NULL)
INSERT [transaction].[booking] ([ID], [AccountID], [WServicesID], [BookingStartDate], [BookingEndDate], [StartHour], [EndHour], [BookingAddress], [BookingMessage], [BookingStatus], [TotalPrice], [DateCreated], [DateUpdated]) VALUES (8, 7, 1, CAST(N'2024-07-30T00:00:00.000' AS DateTime), CAST(N'2024-07-30T00:00:00.000' AS DateTime), NULL, NULL, N'Cebu', N'this is smaple', 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2024-07-30' AS Date), NULL)
INSERT [transaction].[booking] ([ID], [AccountID], [WServicesID], [BookingStartDate], [BookingEndDate], [StartHour], [EndHour], [BookingAddress], [BookingMessage], [BookingStatus], [TotalPrice], [DateCreated], [DateUpdated]) VALUES (9, 2, 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), NULL, NULL, N'sample address', N'sample message', 4, CAST(100.02 AS Decimal(10, 2)), CAST(N'2024-08-10' AS Date), NULL)
INSERT [transaction].[booking] ([ID], [AccountID], [WServicesID], [BookingStartDate], [BookingEndDate], [StartHour], [EndHour], [BookingAddress], [BookingMessage], [BookingStatus], [TotalPrice], [DateCreated], [DateUpdated]) VALUES (10, 2, 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), NULL, NULL, N'sampls', N'sample message', 3, CAST(99.99 AS Decimal(10, 2)), CAST(N'2024-08-10' AS Date), NULL)
INSERT [transaction].[booking] ([ID], [AccountID], [WServicesID], [BookingStartDate], [BookingEndDate], [StartHour], [EndHour], [BookingAddress], [BookingMessage], [BookingStatus], [TotalPrice], [DateCreated], [DateUpdated]) VALUES (11, NULL, NULL, CAST(N'2024-08-19T00:00:00.000' AS DateTime), CAST(N'2024-08-20T00:00:00.000' AS DateTime), NULL, NULL, N'this is a sample image', N'sample message', 1, CAST(150.00 AS Decimal(10, 2)), CAST(N'2024-08-19' AS Date), NULL)
INSERT [transaction].[booking] ([ID], [AccountID], [WServicesID], [BookingStartDate], [BookingEndDate], [StartHour], [EndHour], [BookingAddress], [BookingMessage], [BookingStatus], [TotalPrice], [DateCreated], [DateUpdated]) VALUES (12, NULL, 1, CAST(N'2024-08-19T00:00:00.000' AS DateTime), CAST(N'2024-08-19T00:00:00.000' AS DateTime), NULL, NULL, N'adasdsad', N'asdsadsadsad', 3, CAST(120.00 AS Decimal(10, 2)), CAST(N'2024-08-19' AS Date), NULL)
INSERT [transaction].[booking] ([ID], [AccountID], [WServicesID], [BookingStartDate], [BookingEndDate], [StartHour], [EndHour], [BookingAddress], [BookingMessage], [BookingStatus], [TotalPrice], [DateCreated], [DateUpdated]) VALUES (13, 2, 1, CAST(N'2024-08-20T00:00:00.000' AS DateTime), CAST(N'2024-08-21T00:00:00.000' AS DateTime), NULL, NULL, N'mactan, cebu', N'this a message', 1, CAST(300.00 AS Decimal(10, 2)), CAST(N'2024-08-20' AS Date), NULL)
INSERT [transaction].[booking] ([ID], [AccountID], [WServicesID], [BookingStartDate], [BookingEndDate], [StartHour], [EndHour], [BookingAddress], [BookingMessage], [BookingStatus], [TotalPrice], [DateCreated], [DateUpdated]) VALUES (14, 2, 9, CAST(N'2024-09-05T00:00:00.000' AS DateTime), CAST(N'2024-09-06T00:00:00.000' AS DateTime), NULL, NULL, N'dsada', N'asdasdwqewqe', 3, CAST(1600.00 AS Decimal(10, 2)), CAST(N'2024-09-05' AS Date), NULL)
SET IDENTITY_INSERT [transaction].[booking] OFF
GO
SET IDENTITY_INSERT [transaction].[payments] ON 

INSERT [transaction].[payments] ([ID], [BookingID], [Amount], [PaymentMethod], [PaymentStatus], [DateCreated], [DateUpdated]) VALUES (1, 9, CAST(100.02 AS Decimal(10, 2)), N'paypal', NULL, CAST(N'2024-08-10' AS Date), NULL)
INSERT [transaction].[payments] ([ID], [BookingID], [Amount], [PaymentMethod], [PaymentStatus], [DateCreated], [DateUpdated]) VALUES (2, 10, CAST(99.99 AS Decimal(10, 2)), N'maya', NULL, CAST(N'2024-08-10' AS Date), NULL)
INSERT [transaction].[payments] ([ID], [BookingID], [Amount], [PaymentMethod], [PaymentStatus], [DateCreated], [DateUpdated]) VALUES (3, 11, CAST(150.00 AS Decimal(10, 2)), N'paypal', NULL, CAST(N'2024-08-19' AS Date), NULL)
INSERT [transaction].[payments] ([ID], [BookingID], [Amount], [PaymentMethod], [PaymentStatus], [DateCreated], [DateUpdated]) VALUES (4, 12, CAST(120.00 AS Decimal(10, 2)), N'paypal', NULL, CAST(N'2024-08-19' AS Date), NULL)
INSERT [transaction].[payments] ([ID], [BookingID], [Amount], [PaymentMethod], [PaymentStatus], [DateCreated], [DateUpdated]) VALUES (5, 13, CAST(300.00 AS Decimal(10, 2)), N'paypal', NULL, CAST(N'2024-08-20' AS Date), NULL)
INSERT [transaction].[payments] ([ID], [BookingID], [Amount], [PaymentMethod], [PaymentStatus], [DateCreated], [DateUpdated]) VALUES (6, 14, CAST(1600.00 AS Decimal(10, 2)), N'paypal', NULL, CAST(N'2024-09-05' AS Date), NULL)
SET IDENTITY_INSERT [transaction].[payments] OFF
GO
SET IDENTITY_INSERT [users].[account] ON 

INSERT [users].[account] ([ID], [UserID], [Username], [Password], [IsActive], [VerificationToken], [IsVerified], [DateCreated], [DateUpdated]) VALUES (1, 8, N'sample@gmail.com', N'1234567', 1, NULL, 1, CAST(N'2024-08-04' AS Date), NULL)
INSERT [users].[account] ([ID], [UserID], [Username], [Password], [IsActive], [VerificationToken], [IsVerified], [DateCreated], [DateUpdated]) VALUES (2, 9, N'sample1@gmail.com', N'123456', 1, NULL, 1, CAST(N'2024-08-04' AS Date), NULL)
INSERT [users].[account] ([ID], [UserID], [Username], [Password], [IsActive], [VerificationToken], [IsVerified], [DateCreated], [DateUpdated]) VALUES (3, 10, N'sample2@gmail.com', N'0000', 1, NULL, 1, CAST(N'2024-08-07' AS Date), NULL)
INSERT [users].[account] ([ID], [UserID], [Username], [Password], [IsActive], [VerificationToken], [IsVerified], [DateCreated], [DateUpdated]) VALUES (4, 3, N'w_one@gmail.com', N'0000', 1, NULL, 1, CAST(N'2024-08-10' AS Date), NULL)
INSERT [users].[account] ([ID], [UserID], [Username], [Password], [IsActive], [VerificationToken], [IsVerified], [DateCreated], [DateUpdated]) VALUES (5, 1, N'admin@admin.com', N'0000', 1, NULL, 1, CAST(N'2024-08-16' AS Date), NULL)
INSERT [users].[account] ([ID], [UserID], [Username], [Password], [IsActive], [VerificationToken], [IsVerified], [DateCreated], [DateUpdated]) VALUES (6, 11, N'jorge', N'0000', 1, NULL, 1, CAST(N'2024-08-20' AS Date), NULL)
INSERT [users].[account] ([ID], [UserID], [Username], [Password], [IsActive], [VerificationToken], [IsVerified], [DateCreated], [DateUpdated]) VALUES (7, 12, N'zulip@gmail.com', N'0000', 1, NULL, 1, CAST(N'2024-08-20' AS Date), NULL)
INSERT [users].[account] ([ID], [UserID], [Username], [Password], [IsActive], [VerificationToken], [IsVerified], [DateCreated], [DateUpdated]) VALUES (11, 16, N'codechiqmember@gmail.com', N'0000', 1, N'2574efed-a5a9-4a60-b2f5-e3f894b0276b', 1, CAST(N'2024-08-27' AS Date), NULL)
INSERT [users].[account] ([ID], [UserID], [Username], [Password], [IsActive], [VerificationToken], [IsVerified], [DateCreated], [DateUpdated]) VALUES (12, 17, N'mcbibuilders@gmail.com', N'0000', 1, N'9fecbc10-b73c-4db4-954c-54811e448370', 1, CAST(N'2024-08-30' AS Date), NULL)
SET IDENTITY_INSERT [users].[account] OFF
GO
SET IDENTITY_INSERT [users].[servicesWorker] ON 

INSERT [users].[servicesWorker] ([ID], [UserID], [ServicesID], [IsActive], [DateCreated], [DateUpdated]) VALUES (1, 3, 1, 1, CAST(N'2024-07-31' AS Date), NULL)
INSERT [users].[servicesWorker] ([ID], [UserID], [ServicesID], [IsActive], [DateCreated], [DateUpdated]) VALUES (2, 4, 1, 1, CAST(N'2024-07-31' AS Date), NULL)
INSERT [users].[servicesWorker] ([ID], [UserID], [ServicesID], [IsActive], [DateCreated], [DateUpdated]) VALUES (3, 5, 3, 1, CAST(N'2024-07-31' AS Date), NULL)
INSERT [users].[servicesWorker] ([ID], [UserID], [ServicesID], [IsActive], [DateCreated], [DateUpdated]) VALUES (4, 6, 4, 1, CAST(N'2024-07-31' AS Date), NULL)
INSERT [users].[servicesWorker] ([ID], [UserID], [ServicesID], [IsActive], [DateCreated], [DateUpdated]) VALUES (5, 7, 5, 1, CAST(N'2024-07-31' AS Date), NULL)
INSERT [users].[servicesWorker] ([ID], [UserID], [ServicesID], [IsActive], [DateCreated], [DateUpdated]) VALUES (6, 3, 2, 1, CAST(N'2024-07-31' AS Date), NULL)
INSERT [users].[servicesWorker] ([ID], [UserID], [ServicesID], [IsActive], [DateCreated], [DateUpdated]) VALUES (7, 4, 2, 1, CAST(N'2024-07-31' AS Date), NULL)
INSERT [users].[servicesWorker] ([ID], [UserID], [ServicesID], [IsActive], [DateCreated], [DateUpdated]) VALUES (8, 5, 4, 1, CAST(N'2024-07-31' AS Date), NULL)
INSERT [users].[servicesWorker] ([ID], [UserID], [ServicesID], [IsActive], [DateCreated], [DateUpdated]) VALUES (9, 16, 7, 1, CAST(N'2024-09-05' AS Date), NULL)
SET IDENTITY_INSERT [users].[servicesWorker] OFF
GO
SET IDENTITY_INSERT [users].[users] ON 

INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (1, N'Super', N'Admin', NULL, N'000000000', NULL, N'Lapu-Lapu Airport Rd, Lapu-Lapu City, 6016 Cebu', N'Managing household services efficiently is essential for maintaining a well-organized and comfortable living environment. Regular tasks such as cleaning, lawn care, and home maintenance are crucial for ensuring the smooth operation of everyday life. For instance, scheduling routine cleaning services can help keep your home spotless and reduce the burden of chores, while regular lawn care ensures your outdoor spaces remain inviting and well-kept. Additionally, timely home maintenance services, such as plumbing and electrical repairs, prevent potential issues from escalating, saving time and money in the long run. By prioritizing these services, homeowners can enjoy a stress-free and enjoyable living experience.', N'icon_profile_default.png', 1, 1, CAST(N'2024-07-21' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (2, N'User', N'One', NULL, N'09475401801', NULL, N'Lapu-Lapu Airport Rd, Lapu-Lapu City, 6016 Cebu', N'Managing household services efficiently is essential for maintaining a well-organized and comfortable living environment. Regular tasks such as cleaning, lawn care, and home maintenance are crucial for ensuring the smooth operation of everyday life. For instance, scheduling routine cleaning services can help keep your home spotless and reduce the burden of chores, while regular lawn care ensures your outdoor spaces remain inviting and well-kept. Additionally, timely home maintenance services, such as plumbing and electrical repairs, prevent potential issues from escalating, saving time and money in the long run. By prioritizing these services, homeowners can enjoy a stress-free and enjoyable living experience.', N'icon_profile_default.png', 4, 1, CAST(N'2024-07-21' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (3, N'Worker', N'One', N'w_one@gmail.com', N'09475401802', NULL, N'Lapu-Lapu Airport Rd, Lapu-Lapu City, 6016 Cebu', N'Managing household services efficiently is essential for maintaining a well-organized and comfortable living environment. Regular tasks such as cleaning, lawn care, and home maintenance are crucial for ensuring the smooth operation of everyday life. For instance, scheduling routine cleaning services can help keep your home spotless and reduce the burden of chores, while regular lawn care ensures your outdoor spaces remain inviting and well-kept. Additionally, timely home maintenance services, such as plumbing and electrical repairs, prevent potential issues from escalating, saving time and money in the long run. By prioritizing these services, homeowners can enjoy a stress-free and enjoyable living experience.', N'icon_profile_default.png', 5, 1, CAST(N'2024-07-21' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (4, N'Worker', N'Two', NULL, N'09475401803', NULL, N'Lapu-Lapu Airport Rd, Lapu-Lapu City, 6016 Cebu', N'Managing household services efficiently is essential for maintaining a well-organized and comfortable living environment. Regular tasks such as cleaning, lawn care, and home maintenance are crucial for ensuring the smooth operation of everyday life. For instance, scheduling routine cleaning services can help keep your home spotless and reduce the burden of chores, while regular lawn care ensures your outdoor spaces remain inviting and well-kept. Additionally, timely home maintenance services, such as plumbing and electrical repairs, prevent potential issues from escalating, saving time and money in the long run. By prioritizing these services, homeowners can enjoy a stress-free and enjoyable living experience.', N'icon_profile_default.png', 5, 1, CAST(N'2024-07-22' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (5, N'Worker', N'Three', NULL, N'09475401804', NULL, N'Lapu-Lapu Airport Rd, Lapu-Lapu City, 6016 Cebu', N'Managing household services efficiently is essential for maintaining a well-organized and comfortable living environment. Regular tasks such as cleaning, lawn care, and home maintenance are crucial for ensuring the smooth operation of everyday life. For instance, scheduling routine cleaning services can help keep your home spotless and reduce the burden of chores, while regular lawn care ensures your outdoor spaces remain inviting and well-kept. Additionally, timely home maintenance services, such as plumbing and electrical repairs, prevent potential issues from escalating, saving time and money in the long run. By prioritizing these services, homeowners can enjoy a stress-free and enjoyable living experience.', N'icon_profile_default.png', 5, 1, CAST(N'2024-07-22' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (6, N'Worker', N'Four', NULL, N'09475401805', NULL, N'Lapu-Lapu Airport Rd, Lapu-Lapu City, 6016 Cebu', N'Managing household services efficiently is essential for maintaining a well-organized and comfortable living environment. Regular tasks such as cleaning, lawn care, and home maintenance are crucial for ensuring the smooth operation of everyday life. For instance, scheduling routine cleaning services can help keep your home spotless and reduce the burden of chores, while regular lawn care ensures your outdoor spaces remain inviting and well-kept. Additionally, timely home maintenance services, such as plumbing and electrical repairs, prevent potential issues from escalating, saving time and money in the long run. By prioritizing these services, homeowners can enjoy a stress-free and enjoyable living experience.', N'icon_profile_default.png', 5, 1, CAST(N'2024-07-22' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (7, N'Worker', N'Five', NULL, N'09475401808', NULL, N'Lapu-Lapu Airport Rd, Lapu-Lapu City, 6016 Cebu', N'Managing household services efficiently is essential for maintaining a well-organized and comfortable living environment. Regular tasks such as cleaning, lawn care, and home maintenance are crucial for ensuring the smooth operation of everyday life. For instance, scheduling routine cleaning services can help keep your home spotless and reduce the burden of chores, while regular lawn care ensures your outdoor spaces remain inviting and well-kept. Additionally, timely home maintenance services, such as plumbing and electrical repairs, prevent potential issues from escalating, saving time and money in the long run. By prioritizing these services, homeowners can enjoy a stress-free and enjoyable living experience.', N'icon_profile_default.png', 5, 1, CAST(N'2024-07-30' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (8, N'sample ', N'sample ', NULL, NULL, CAST(N'2024-08-04' AS Date), NULL, NULL, N'icon_profile_default.png', 5, 1, CAST(N'2024-08-04' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (9, N'User', N'Demo', NULL, NULL, CAST(N'2024-07-30' AS Date), NULL, NULL, N'icon_profile_default.png', 4, 1, CAST(N'2024-08-04' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (10, N'sample 2', N'demo', N'sample2@gmail.com', N'09120862213', CAST(N'2024-08-07' AS Date), NULL, NULL, N'icon_profile_default.png', 4, 1, CAST(N'2024-08-07' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (11, N'Jorge', N'Patrick', N'jorge', N'0912086223', CAST(N'2009-01-20' AS Date), NULL, NULL, N'icon_profile_default.png', 4, 1, CAST(N'2024-08-20' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (12, N'Zulip', N'Zu', N'zulip@gmail.com', N'09120862213', CAST(N'2012-01-20' AS Date), NULL, NULL, N'icon_profile_default.png', 5, 1, CAST(N'2024-08-20' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (13, N'code', N'chiq', N'codechiqmember@gmail.com', N'09120862213', CAST(N'2024-08-27' AS Date), NULL, NULL, N'icon_profile_default.png', 5, 1, CAST(N'2024-08-27' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (14, N'Worker', N'Demo', N'codechiqmember@gmail.com', N'09120862213', CAST(N'2024-08-27' AS Date), NULL, NULL, N'icon_profile_default.png', 5, 1, CAST(N'2024-08-27' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (15, N'asd', N'asd', N'codechiqmember@gmail.com', N'09120862213', CAST(N'2024-08-27' AS Date), NULL, NULL, N'icon_profile_default.png', 5, 1, CAST(N'2024-08-27' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (16, N'codey', N'chiq', N'codechiqmember@gmail.com', N'09120862213', CAST(N'2024-08-27' AS Date), N'Cebu', N'Managing household services efficiently is essential for maintaining a well-organized and comfortable living environment. Regular tasks such as cleaning, lawn care, and home maintenance are crucial for ensuring the smooth operation of everyday life. For instance, scheduling routine cleaning services can help keep your home spotless and reduce the burden of chores, while regular lawn care ensures your outdoor spaces remain inviting and well-kept. Additionally, timely home maintenance services, such as plumbing and electrical repairs, prevent potential issues from escalating, saving time and money in the long run. By prioritizing these services, homeowners can enjoy a stress-free and enjoyable living experience.', N'icon_profile_default.png', 5, 1, CAST(N'2024-08-27' AS Date), NULL)
INSERT [users].[users] ([ID], [FirstName], [LastName], [Email], [PhoneNumber], [Birthdate], [Address], [Description], [Profile], [UserTypeID], [IsActive], [DateCreated], [DateUpdated]) VALUES (17, N'User', N'New', N'mcbibuilders@gmail.com', N'09120862213', CAST(N'2024-08-01' AS Date), NULL, NULL, N'icon_profile_default.png', 4, 1, CAST(N'2024-08-30' AS Date), NULL)
SET IDENTITY_INSERT [users].[users] OFF
GO
ALTER TABLE [admin].[notifications] ADD  CONSTRAINT [DF_notifications_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [admin].[notifications] ADD  CONSTRAINT [DF_notifications_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [admin].[notifications] ADD  CONSTRAINT [DF_notifications_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [agencies].[Agencies] ADD  CONSTRAINT [DF_Agencies_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [agencies].[Agencies] ADD  CONSTRAINT [DF_Agencies_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [agencies].[AgenciesMaster] ADD  CONSTRAINT [DF_AgenciesMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [agencies].[AgenciesMaster] ADD  CONSTRAINT [DF_AgenciesMaster_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[driver] ADD  CONSTRAINT [DF_driver_date_created]  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[vehicles] ADD  CONSTRAINT [DF_vehicles_date_created]  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [master].[category] ADD  CONSTRAINT [DF_category_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [master].[services] ADD  CONSTRAINT [DF_Services_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [master].[services] ADD  CONSTRAINT [DF_services_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [transaction].[babySitting] ADD  CONSTRAINT [DF_babySitting_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [transaction].[booking] ADD  CONSTRAINT [DF_booking_BookingStatus]  DEFAULT ((1)) FOR [BookingStatus]
GO
ALTER TABLE [transaction].[booking] ADD  CONSTRAINT [DF_booking_date_created]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [transaction].[payments] ADD  CONSTRAINT [DF_payments_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [users].[account] ADD  CONSTRAINT [DF_account_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [users].[account] ADD  CONSTRAINT [DF_account_IsVerified]  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [users].[account] ADD  CONSTRAINT [DF_account_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [users].[Availability] ADD  CONSTRAINT [DF_Availability_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [users].[Availability] ADD  CONSTRAINT [DF_Availability_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [users].[Rating] ADD  CONSTRAINT [DF_Rating_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [users].[servicesWorker] ADD  CONSTRAINT [DF_ServicesWorker_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [users].[servicesWorker] ADD  CONSTRAINT [DF_ServicesWorker_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [users].[users] ADD  CONSTRAINT [DF_users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [users].[users] ADD  CONSTRAINT [DF_users_date_created]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  StoredProcedure [admin].[GetCountNotification]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [admin].[GetCountNotification]
    @AgenServicesID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT COUNT(*) AS CountNotifications
        FROM [admin].notifications a
        INNER JOIN [transaction].booking b ON b.ID = a.BookingID
        WHERE b.AgenServicesID = @AgenServicesID AND a.IsRead = 0;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [admin].[GetWorkerCountNotification]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [admin].[GetWorkerCountNotification]
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT COUNT(*) AS CountNotifications
        FROM [admin].notifications a
        INNER JOIN [transaction].booking b ON b.ID = a.BookingID
        WHERE a.ToUser = @UserID AND a.IsRead = 0;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
--EXEC [admin].[GetWorkerCountNotification] 3
GO
/****** Object:  StoredProcedure [agencies].[GetAgencyEmployee]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [agencies].[GetAgencyEmployee]
 @agency_id INT
    
AS
BEGIN
     SELECT 
		a.ID,
		c.FirstName,
		c.LastName,
		c.Email,
		c.[Password],
		c.PhoneNumber,
		c.Profile,
		c.UserTypeID,
		c.IsActive,
		e.TypeName,
		d.ServiceName,
		c.DateCreated,
		c.DateUpdated
	 FROM [agencies].[AgenciesMaster] a
	 LEFT JOIN [agencies].[Agencies] b ON b.ID = a.AgencyID
	 LEFT JOIN [users].[users] c ON c.ID = a.UserID
	 LEFT JOIN [master].[services] d ON d.ID = a.ServicesID
	 LEFT JOIN [master].[userType] e ON e.ID = c.UserTypeID
	 WHERE a.AgencyID = @agency_id
END;

--EXEC [agencies].[GetAgencyEmployee] 1
GO
/****** Object:  StoredProcedure [agencies].[GetAgencyServicesByID]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [agencies].[GetAgencyServicesByID]
 @services_id INT
    
AS
BEGIN
     SELECT * FROM [agencies].[Agencies] where ServicesID = @services_id;

END;

--EXEC [master].[GetAgencyServicesByID] 1
GO
/****** Object:  StoredProcedure [master].[GetMasterCategory]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [master].[GetMasterCategory]
    
AS
BEGIN
     SELECT * FROM [master].category;

END;

--EXEC GetMasterCategory
GO
/****** Object:  StoredProcedure [master].[GetMasterServicesByID]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [master].[GetMasterServicesByID]
 @category_id INT
    
AS
BEGIN
     SELECT * FROM [master].[services] where CategoryID = @category_id;

END;

--EXEC [master].[GetMasterServicesByID] 1
GO
/****** Object:  StoredProcedure [transaction].[GetTransBookingByID]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [transaction].[GetTransBookingByID]
 @UserID INT
    
AS
BEGIN
    SELECT 

		a.ID,
		CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
		a.BookingStartDate,
		a.BookingEndDate,
		a.BookingAddress,
		a.BookingMessage,
		a.TotalPrice,
		d.StatusName

	FROM [transaction].booking a
	LEFT JOIN [users].account b ON b.ID = a.AccountID
	LEFT JOIN [users].users c ON c.ID = b.UserID
	INNER JOIN [master].status d ON d.ID = a.BookingStatus
	LEFT JOIN [admin].notifications e ON e.BookingID = a.ID
	WHERE e.ToUser = @UserID

END;

--EXEC [transaction].[GetTransBookingByID] 3
GO
/****** Object:  StoredProcedure [transaction].[GetTransBookingUserByID]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [transaction].[GetTransBookingUserByID]
 @AccountID INT
AS
BEGIN
    -- Pending
    SELECT 
        a.ID AS BookingID,
        a.BookingStartDate,
        a.BookingEndDate,
        a.TotalPrice,
        CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
        c.PhoneNumber,
        c.[Profile],
        d.ServiceName,
        e.ID AS StatusID,
        e.StatusName
    FROM [transaction].[booking] a
    LEFT JOIN [users].[servicesWorker] b ON b.ID = a.WServicesID
    LEFT JOIN [users].[users] c ON c.ID = b.UserID
    LEFT JOIN [master].[services] d ON d.ID = b.ServicesID
    LEFT JOIN [master].[status] e ON e.ID = a.BookingStatus
    WHERE AccountID = @AccountID AND e.ID = 1
    
    UNION ALL
    
    -- In Progress
    SELECT 
        a.ID AS BookingID,
        a.BookingStartDate,
        a.BookingEndDate,
        a.TotalPrice,
        CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
        c.PhoneNumber,
        c.[Profile],
        d.ServiceName,
        e.ID AS StatusID,
        e.StatusName
    FROM [transaction].[booking] a
    LEFT JOIN [users].[servicesWorker] b ON b.ID = a.WServicesID
    LEFT JOIN [users].[users] c ON c.ID = b.UserID
    LEFT JOIN [master].[services] d ON d.ID = b.ServicesID
    LEFT JOIN [master].[status] e ON e.ID = a.BookingStatus
    WHERE AccountID = @AccountID AND e.ID = 2
    
    UNION ALL
    
    -- Completed
    SELECT 
        a.ID AS BookingID,
        a.BookingStartDate,
        a.BookingEndDate,
        a.TotalPrice,
        CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
        c.PhoneNumber,
        c.[Profile],
        d.ServiceName,
        e.ID AS StatusID,
        e.StatusName
    FROM [transaction].[booking] a
    LEFT JOIN [users].[servicesWorker] b ON b.ID = a.WServicesID
    LEFT JOIN [users].[users] c ON c.ID = b.UserID
    LEFT JOIN [master].[services] d ON d.ID = b.ServicesID
    LEFT JOIN [master].[status] e ON e.ID = a.BookingStatus
    WHERE AccountID = @AccountID AND e.ID = 3
    
    UNION ALL
    
    -- Cancelled
    SELECT 
        a.ID AS BookingID,
        a.BookingStartDate,
        a.BookingEndDate,
        a.TotalPrice,
        CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
        c.PhoneNumber,
        c.[Profile],
        d.ServiceName,
        e.ID AS StatusID,
        e.StatusName
    FROM [transaction].[booking] a
    LEFT JOIN [users].[servicesWorker] b ON b.ID = a.WServicesID
    LEFT JOIN [users].[users] c ON c.ID = b.UserID
    LEFT JOIN [master].[services] d ON d.ID = b.ServicesID
    LEFT JOIN [master].[status] e ON e.ID = a.BookingStatus
    WHERE AccountID = @AccountID AND e.ID = 4
END;
GO
/****** Object:  StoredProcedure [transaction].[PostBookingData]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [transaction].[PostBookingData] 
    @AccountID INT,
	@UserID INT,
    @WServicesID INT,
    @BookingStartDate DATE,
    @BookingEndDate DATE,
    @BookingAddress VARCHAR(150),
    @BookingMessage VARCHAR(MAX),
    @TotalPrice DECIMAL(18, 2),
	@PaymentMethod VARCHAR(10)
    
AS
BEGIN

	DECLARE @BookingID INT;

    INSERT INTO [transaction].[booking] (
        AccountID, 
        WServicesID, 
        BookingStartDate, 
        BookingEndDate, 
        BookingAddress, 
        BookingMessage,
        TotalPrice
    )
    VALUES (
        @AccountID, 
        @WServicesID, 
        @BookingStartDate, 
        @BookingEndDate, 
        @BookingAddress, 
        @BookingMessage, 
        @TotalPrice
    );

	SET @BookingID = SCOPE_IDENTITY();
	INSERT INTO [transaction].[payments] (BookingID, Amount, PaymentMethod)
	VALUES(@BookingID, @TotalPrice, @PaymentMethod)

	INSERT INTO [admin].[notifications](BookingID, FromUser, ToUser)
	VALUES(@BookingID, @AccountID, @UserID)

	
END
GO
/****** Object:  StoredProcedure [transaction].[UpdateBookingData]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [transaction].[UpdateBookingData] 
    @BookingID INT,
	@StatusID INT
    
AS
BEGIN

	UPDATE [transaction].booking
		SET BookingStatus = @StatusID
	WHERE ID = @BookingID;
	
END
GO
/****** Object:  StoredProcedure [users].[AuthUserData]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [users].[AuthUserData] 
    @UserName VARCHAR(50),
    @Password VARCHAR(50)
AS
BEGIN
    -- Check if user exists with the given username and password
	DECLARE @AccountID INT;
	DECLARE @UserTypeID INT;
	DECLARE @UserID INT;
	DECLARE @FullName VARCHAR(50);
	DECLARE @ProfileImage VARCHAR(255);

    IF EXISTS (
        SELECT 1 
        FROM [users].account 
        WHERE UserName = @UserName 
        AND Password = @Password
		AND IsVerified = 1
    )
    BEGIN
		SET @AccountID = (SELECT ID FROM [users].account WHERE UserName = @UserName AND Password = @Password);
		SET @UserTypeID = (SELECT UserTypeID FROM [users].account a
							LEFT JOIN [users].[users] b ON b.ID = a.UserID
							WHERE a.UserName = @UserName AND a.Password = @Password)
		SET @UserID = (SELECT UserID FROM [users].account WHERE UserName = @UserName AND Password = @Password);
		SET @FullName = (SELECT CONCAT(b.FirstName, ' ', b.LastName) AS FullName
							FROM [users].account a
							LEFT JOIN [users].users b ON a.UserID = b.ID
							WHERE UserName = @UserName AND Password = @Password);
		SET @ProfileImage = (SELECT b.[Profile] AS ProfileImage
							FROM [users].account a
							LEFT JOIN [users].users b ON a.UserID = b.ID
							WHERE UserName = @UserName AND Password = @Password);
		

        SELECT @AccountID, @UserTypeID, @UserID, @FullName, @ProfileImage, StatusCode = 1; -- Status code for success
    END
    ELSE
    BEGIN
        SELECT AccountID = 0, UserTypeID = 0, UserID = 0, FullName = '', ProfileImage = '', StatusCode = 2; -- Status code for failed
    END
END
GO
/****** Object:  StoredProcedure [users].[GetFreelanceWorkers]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [users].[GetFreelanceWorkers] 
    @service_workerID INT = NULL
    
AS
BEGIN

   SELECT 

	a.ID,
	a.UserID,
	CONCAT(b.FirstName, ' ', b.LastName) AS FullName,
	b.[Address],
	b.[Description],
	b.[Profile],
	c.[Url]

   FROM [users].[servicesWorker] a 
   LEFT JOIN [users].users b ON b.ID = a.UserID
   LEFT JOIN [master].[services] c ON c.ID = a.ServicesID
   WHERE a.ID = @service_workerID
END

-- exec [users].[GetFreelanceWorkers] 2
GO
/****** Object:  StoredProcedure [users].[GetServiceWorkers]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [users].[GetServiceWorkers] 
    @ServicesID INT = NULL
    
AS
BEGIN

   SELECT 
    a.ID,
	CONCAT(b.FirstName,' ',b.LastName) as FullName,
	b.Email,
	b.PhoneNumber,
	b.[Profile],
	c.ServiceName

   FROM [users].[servicesWorker] a 
   LEFT JOIN [users].users b ON b.ID = a.UserID
   LEFT JOIN [master].[services] c ON c.ID = a.ServicesID
   WHERE a.ServicesID = @ServicesID AND a.IsActive = 1
END

-- exec [users].[GetServiceWorkers] 1
GO
/****** Object:  StoredProcedure [users].[GetUserProfile]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [users].[GetUserProfile] 
  @AccountID INT
    
AS
BEGIN

    SELECT 
		a.ID AS AccountID,
		b.ID AS UserID,
		a.Username,
		a.[Password],
		b.FirstName,
		b.LastName,
		b.Email,
		b.PhoneNumber,
		b.Birthdate,
		b.[Address],
		b.[Description],
		b.[Profile]
	FROM [users].account a
	LEFT JOIN [users].users b ON b.ID = a.UserID
	WHERE a.ID = @AccountID;

END
GO
/****** Object:  StoredProcedure [users].[PostNewUserData]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [users].[PostNewUserData] 
 
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @UserName VARCHAR(50),
    @Password VARCHAR(50),
	@Email VARCHAR(50),
	@PhoneNumber VARCHAR(12),
	@BirthDate DATE,
    @Profile TEXT,
    @UserTypeID INT,
	@VerificationToken VARCHAR(MAX)
    
AS
BEGIN

    DECLARE @UserID INT;

    INSERT INTO [users].users(
        FirstName, 
        LastName,
		Email,
		PhoneNumber,
		Birthdate,
        [Profile],
        UserTypeID
    )
    VALUES (
        @FirstName, 
        @LastName,
		@Email,
		@PhoneNumber,
        @BirthDate,
		@Profile,
        @UserTypeID
    );

	SET @UserID = SCOPE_IDENTITY();

	INSERT INTO [users].account(UserID,Username, [Password], VerificationToken)
	VALUES(@UserID, @UserName, @Password, @VerificationToken)
END
GO
/****** Object:  StoredProcedure [users].[VerifyUserEmail]    Script Date: 07/09/2024 10:41:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [users].[VerifyUserEmail] 
 
	@Token VARCHAR(MAX)
    
AS
BEGIN


	UPDATE [users].account
	SET IsVerified = 1
	WHERE VerificationToken = @Token
END
GO
