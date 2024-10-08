USE [master]
GO
/****** Object:  Database [learning_platform]    Script Date: 27/08/2024 22:32:31 ******/
CREATE DATABASE [learning_platform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'learning_platform', FILENAME = N'C:\SQLData\learning_platform.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'learning_platform_log', FILENAME = N'C:\SQLData\learning_platform_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [learning_platform] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [learning_platform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [learning_platform] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [learning_platform] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [learning_platform] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [learning_platform] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [learning_platform] SET ARITHABORT OFF 
GO
ALTER DATABASE [learning_platform] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [learning_platform] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [learning_platform] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [learning_platform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [learning_platform] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [learning_platform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [learning_platform] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [learning_platform] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [learning_platform] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [learning_platform] SET  ENABLE_BROKER 
GO
ALTER DATABASE [learning_platform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [learning_platform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [learning_platform] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [learning_platform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [learning_platform] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [learning_platform] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [learning_platform] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [learning_platform] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [learning_platform] SET  MULTI_USER 
GO
ALTER DATABASE [learning_platform] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [learning_platform] SET DB_CHAINING OFF 
GO
ALTER DATABASE [learning_platform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [learning_platform] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [learning_platform] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [learning_platform] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [learning_platform] SET QUERY_STORE = ON
GO
ALTER DATABASE [learning_platform] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [learning_platform]
GO
/****** Object:  Table [dbo].[Certificates]    Script Date: 27/08/2024 22:32:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificates](
	[CertificateID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[IssueDate] [datetime] NOT NULL,
	[CertificateLink] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CertificateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 27/08/2024 22:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[PathID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 27/08/2024 22:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollments](
	[EnrollmentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[EnrollmentDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuidedProjects]    Script Date: 27/08/2024 22:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuidedProjects](
	[GuidedProjectID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[DatasetLink] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GuidedProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LearningPathEnrollments]    Script Date: 27/08/2024 22:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LearningPathEnrollments](
	[EnrollmentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PathID] [int] NOT NULL,
	[EnrollmentDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LearningPaths]    Script Date: 27/08/2024 22:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LearningPaths](
	[PathID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 27/08/2024 22:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Content] [nvarchar](255) NOT NULL,
	[LessonOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartTopics]    Script Date: 27/08/2024 22:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartTopics](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[PartID] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Content] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PathParts]    Script Date: 27/08/2024 22:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PathParts](
	[PartID] [int] IDENTITY(1,1) NOT NULL,
	[PathID] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PartOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PortfolioProjects]    Script Date: 27/08/2024 22:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortfolioProjects](
	[PortfolioProjectID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[DatasetLink] [nvarchar](255) NOT NULL,
	[SubmissionLink] [nvarchar](255) NOT NULL,
	[Feedback] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PortfolioProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Progress]    Script Date: 27/08/2024 22:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Progress](
	[ProgressID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LessonID] [int] NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[LastAccessed] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 27/08/2024 22:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Role] [varchar](255) NOT NULL,
	[DateJoined] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Certificates] ON 

INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (1, 1, 1, CAST(N'2024-08-27T22:06:22.443' AS DateTime), N'https://example.com/certificates/certificate1.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (2, 2, 2, CAST(N'2024-08-27T22:06:22.443' AS DateTime), N'https://example.com/certificates/certificate2.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (3, 3, 3, CAST(N'2024-08-27T22:06:22.443' AS DateTime), N'https://example.com/certificates/certificate3.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (4, 4, 4, CAST(N'2024-08-27T22:06:22.443' AS DateTime), N'https://example.com/certificates/certificate4.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (5, 5, 5, CAST(N'2024-08-27T22:06:22.443' AS DateTime), N'https://example.com/certificates/certificate5.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (6, 1, 2, CAST(N'2024-08-27T22:06:22.443' AS DateTime), N'https://example.com/certificates/certificate6.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (7, 2, 3, CAST(N'2024-08-27T22:06:22.443' AS DateTime), N'https://example.com/certificates/certificate7.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (8, 3, 4, CAST(N'2024-08-27T22:06:22.443' AS DateTime), N'https://example.com/certificates/certificate8.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (9, 4, 5, CAST(N'2024-08-27T22:06:22.443' AS DateTime), N'https://example.com/certificates/certificate9.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (10, 5, 1, CAST(N'2024-08-27T22:06:22.443' AS DateTime), N'https://example.com/certificates/certificate10.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (11, 1, 1, CAST(N'2024-08-27T22:10:32.690' AS DateTime), N'https://example.com/certificates/certificate1.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (12, 2, 2, CAST(N'2024-08-27T22:10:32.690' AS DateTime), N'https://example.com/certificates/certificate2.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (13, 3, 3, CAST(N'2024-08-27T22:10:32.690' AS DateTime), N'https://example.com/certificates/certificate3.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (14, 4, 4, CAST(N'2024-08-27T22:10:32.690' AS DateTime), N'https://example.com/certificates/certificate4.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (15, 5, 5, CAST(N'2024-08-27T22:10:32.690' AS DateTime), N'https://example.com/certificates/certificate5.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (16, 1, 2, CAST(N'2024-08-27T22:10:32.690' AS DateTime), N'https://example.com/certificates/certificate6.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (17, 2, 3, CAST(N'2024-08-27T22:10:32.690' AS DateTime), N'https://example.com/certificates/certificate7.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (18, 3, 4, CAST(N'2024-08-27T22:10:32.690' AS DateTime), N'https://example.com/certificates/certificate8.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (19, 4, 5, CAST(N'2024-08-27T22:10:32.690' AS DateTime), N'https://example.com/certificates/certificate9.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (20, 5, 1, CAST(N'2024-08-27T22:10:32.690' AS DateTime), N'https://example.com/certificates/certificate10.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (21, 1, 1, CAST(N'2024-08-27T22:15:20.780' AS DateTime), N'https://example.com/certificates/certificate1.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (22, 2, 2, CAST(N'2024-08-27T22:15:20.780' AS DateTime), N'https://example.com/certificates/certificate2.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (23, 3, 3, CAST(N'2024-08-27T22:15:20.780' AS DateTime), N'https://example.com/certificates/certificate3.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (24, 4, 4, CAST(N'2024-08-27T22:15:20.780' AS DateTime), N'https://example.com/certificates/certificate4.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (25, 5, 5, CAST(N'2024-08-27T22:15:20.780' AS DateTime), N'https://example.com/certificates/certificate5.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (26, 1, 2, CAST(N'2024-08-27T22:15:20.780' AS DateTime), N'https://example.com/certificates/certificate6.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (27, 2, 3, CAST(N'2024-08-27T22:15:20.780' AS DateTime), N'https://example.com/certificates/certificate7.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (28, 3, 4, CAST(N'2024-08-27T22:15:20.780' AS DateTime), N'https://example.com/certificates/certificate8.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (29, 4, 5, CAST(N'2024-08-27T22:15:20.780' AS DateTime), N'https://example.com/certificates/certificate9.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (30, 5, 1, CAST(N'2024-08-27T22:15:20.780' AS DateTime), N'https://example.com/certificates/certificate10.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (31, 1, 1, CAST(N'2024-08-27T22:30:20.120' AS DateTime), N'https://example.com/certificates/certificate1.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (32, 2, 2, CAST(N'2024-08-27T22:30:20.120' AS DateTime), N'https://example.com/certificates/certificate2.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (33, 3, 3, CAST(N'2024-08-27T22:30:20.120' AS DateTime), N'https://example.com/certificates/certificate3.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (34, 4, 4, CAST(N'2024-08-27T22:30:20.120' AS DateTime), N'https://example.com/certificates/certificate4.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (35, 5, 5, CAST(N'2024-08-27T22:30:20.120' AS DateTime), N'https://example.com/certificates/certificate5.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (36, 1, 2, CAST(N'2024-08-27T22:30:20.120' AS DateTime), N'https://example.com/certificates/certificate6.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (37, 2, 3, CAST(N'2024-08-27T22:30:20.120' AS DateTime), N'https://example.com/certificates/certificate7.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (38, 3, 4, CAST(N'2024-08-27T22:30:20.120' AS DateTime), N'https://example.com/certificates/certificate8.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (39, 4, 5, CAST(N'2024-08-27T22:30:20.120' AS DateTime), N'https://example.com/certificates/certificate9.pdf')
INSERT [dbo].[Certificates] ([CertificateID], [UserID], [CourseID], [IssueDate], [CertificateLink]) VALUES (40, 5, 1, CAST(N'2024-08-27T22:30:20.120' AS DateTime), N'https://example.com/certificates/certificate10.pdf')
SET IDENTITY_INSERT [dbo].[Certificates] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (1, N'Introduction to Python', N'Learn the basics of Python programming.', 1)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (2, N'Advanced Python for Data Science', N'Deep dive into data science with Python.', 1)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (3, N'HTML & CSS Basics', N'Learn how to build static web pages.', 2)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (4, N'JavaScript Essentials', N'Master the fundamentals of JavaScript.', 2)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (5, N'Machine Learning Basics', N'Introduction to machine learning concepts.', 3)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (6, N'Introduction to Python', N'Learn the basics of Python programming.', 1)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (7, N'Advanced Python for Data Science', N'Deep dive into data science with Python.', 1)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (8, N'HTML & CSS Basics', N'Learn how to build static web pages.', 2)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (9, N'JavaScript Essentials', N'Master the fundamentals of JavaScript.', 2)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (10, N'Machine Learning Basics', N'Introduction to machine learning concepts.', 3)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (11, N'Introduction to Python', N'Learn the basics of Python programming.', 1)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (12, N'Advanced Python for Data Science', N'Deep dive into data science with Python.', 1)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (13, N'HTML & CSS Basics', N'Learn how to build static web pages.', 2)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (14, N'JavaScript Essentials', N'Master the fundamentals of JavaScript.', 2)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (15, N'Machine Learning Basics', N'Introduction to machine learning concepts.', 3)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (16, N'Introduction to Python', N'Learn the basics of Python programming.', 1)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (17, N'Advanced Python for Data Science', N'Deep dive into data science with Python.', 1)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (18, N'HTML & CSS Basics', N'Learn how to build static web pages.', 2)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (19, N'JavaScript Essentials', N'Master the fundamentals of JavaScript.', 2)
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [PathID]) VALUES (20, N'Machine Learning Basics', N'Introduction to machine learning concepts.', 3)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Enrollments] ON 

INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (1, 1, 1, CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (2, 2, 2, CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (3, 3, 3, CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (4, 4, 4, CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (5, 5, 5, CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (6, 1, 2, CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (7, 2, 3, CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (8, 3, 4, CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (9, 4, 5, CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (10, 5, 1, CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (11, 1, 1, CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (12, 2, 2, CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (13, 3, 3, CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (14, 4, 4, CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (15, 5, 5, CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (16, 1, 2, CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (17, 2, 3, CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (18, 3, 4, CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (19, 4, 5, CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (20, 5, 1, CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (21, 1, 1, CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (22, 2, 2, CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (23, 3, 3, CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (24, 4, 4, CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (25, 5, 5, CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (26, 1, 2, CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (27, 2, 3, CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (28, 3, 4, CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (29, 4, 5, CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (30, 5, 1, CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (31, 1, 1, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (32, 2, 2, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (33, 3, 3, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (34, 4, 4, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (35, 5, 5, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (36, 1, 2, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (37, 2, 3, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (38, 3, 4, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (39, 4, 5, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Enrollments] ([EnrollmentID], [UserID], [CourseID], [EnrollmentDate]) VALUES (40, 5, 1, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
SET IDENTITY_INSERT [dbo].[Enrollments] OFF
GO
SET IDENTITY_INSERT [dbo].[GuidedProjects] ON 

INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (1, 1, N'Python Data Analysis Project', N'Analyze a dataset using Python.', N'https://example.com/datasets/python_data.csv')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (2, 2, N'Web Page Design Project', N'Create a responsive webpage.', N'https://example.com/datasets/web_design.zip')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (3, 3, N'Machine Learning Model', N'Build a machine learning model using a dataset.', N'https://example.com/datasets/ml_data.csv')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (4, 4, N'Cloud Service Deployment', N'Deploy an application using cloud services.', N'https://example.com/datasets/cloud_deploy.zip')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (5, 5, N'Cybersecurity Attack Simulation', N'Simulate and defend against a cybersecurity attack.', N'https://example.com/datasets/cyber_attack.zip')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (6, 1, N'Python Data Analysis Project', N'Analyze a dataset using Python.', N'https://example.com/datasets/python_data.csv')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (7, 2, N'Web Page Design Project', N'Create a responsive webpage.', N'https://example.com/datasets/web_design.zip')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (8, 3, N'Machine Learning Model', N'Build a machine learning model using a dataset.', N'https://example.com/datasets/ml_data.csv')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (9, 4, N'Cloud Service Deployment', N'Deploy an application using cloud services.', N'https://example.com/datasets/cloud_deploy.zip')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (10, 5, N'Cybersecurity Attack Simulation', N'Simulate and defend against a cybersecurity attack.', N'https://example.com/datasets/cyber_attack.zip')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (11, 1, N'Python Data Analysis Project', N'Analyze a dataset using Python.', N'https://example.com/datasets/python_data.csv')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (12, 2, N'Web Page Design Project', N'Create a responsive webpage.', N'https://example.com/datasets/web_design.zip')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (13, 3, N'Machine Learning Model', N'Build a machine learning model using a dataset.', N'https://example.com/datasets/ml_data.csv')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (14, 4, N'Cloud Service Deployment', N'Deploy an application using cloud services.', N'https://example.com/datasets/cloud_deploy.zip')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (15, 5, N'Cybersecurity Attack Simulation', N'Simulate and defend against a cybersecurity attack.', N'https://example.com/datasets/cyber_attack.zip')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (16, 1, N'Python Data Analysis Project', N'Analyze a dataset using Python.', N'https://example.com/datasets/python_data.csv')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (17, 2, N'Web Page Design Project', N'Create a responsive webpage.', N'https://example.com/datasets/web_design.zip')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (18, 3, N'Machine Learning Model', N'Build a machine learning model using a dataset.', N'https://example.com/datasets/ml_data.csv')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (19, 4, N'Cloud Service Deployment', N'Deploy an application using cloud services.', N'https://example.com/datasets/cloud_deploy.zip')
INSERT [dbo].[GuidedProjects] ([GuidedProjectID], [CourseID], [Title], [Description], [DatasetLink]) VALUES (20, 5, N'Cybersecurity Attack Simulation', N'Simulate and defend against a cybersecurity attack.', N'https://example.com/datasets/cyber_attack.zip')
SET IDENTITY_INSERT [dbo].[GuidedProjects] OFF
GO
SET IDENTITY_INSERT [dbo].[LearningPathEnrollments] ON 

INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (1, 1, 1, CAST(N'2024-08-27T22:06:22.440' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (2, 2, 2, CAST(N'2024-08-27T22:06:22.440' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (3, 3, 3, CAST(N'2024-08-27T22:06:22.440' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (4, 4, 4, CAST(N'2024-08-27T22:06:22.440' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (5, 5, 5, CAST(N'2024-08-27T22:06:22.440' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (6, 1, 3, CAST(N'2024-08-27T22:06:22.440' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (7, 2, 4, CAST(N'2024-08-27T22:06:22.440' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (8, 3, 1, CAST(N'2024-08-27T22:06:22.440' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (9, 4, 2, CAST(N'2024-08-27T22:06:22.440' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (10, 5, 3, CAST(N'2024-08-27T22:06:22.440' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (11, 1, 1, CAST(N'2024-08-27T22:10:32.687' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (12, 2, 2, CAST(N'2024-08-27T22:10:32.687' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (13, 3, 3, CAST(N'2024-08-27T22:10:32.687' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (14, 4, 4, CAST(N'2024-08-27T22:10:32.687' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (15, 5, 5, CAST(N'2024-08-27T22:10:32.687' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (16, 1, 3, CAST(N'2024-08-27T22:10:32.687' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (17, 2, 4, CAST(N'2024-08-27T22:10:32.687' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (18, 3, 1, CAST(N'2024-08-27T22:10:32.687' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (19, 4, 2, CAST(N'2024-08-27T22:10:32.687' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (20, 5, 3, CAST(N'2024-08-27T22:10:32.687' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (21, 1, 1, CAST(N'2024-08-27T22:15:20.777' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (22, 2, 2, CAST(N'2024-08-27T22:15:20.777' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (23, 3, 3, CAST(N'2024-08-27T22:15:20.777' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (24, 4, 4, CAST(N'2024-08-27T22:15:20.777' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (25, 5, 5, CAST(N'2024-08-27T22:15:20.777' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (26, 1, 3, CAST(N'2024-08-27T22:15:20.777' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (27, 2, 4, CAST(N'2024-08-27T22:15:20.777' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (28, 3, 1, CAST(N'2024-08-27T22:15:20.777' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (29, 4, 2, CAST(N'2024-08-27T22:15:20.777' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (30, 5, 3, CAST(N'2024-08-27T22:15:20.777' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (31, 1, 1, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (32, 2, 2, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (33, 3, 3, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (34, 4, 4, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (35, 5, 5, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (36, 1, 3, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (37, 2, 4, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (38, 3, 1, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (39, 4, 2, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[LearningPathEnrollments] ([EnrollmentID], [UserID], [PathID], [EnrollmentDate]) VALUES (40, 5, 3, CAST(N'2024-08-27T22:30:20.120' AS DateTime))
SET IDENTITY_INSERT [dbo].[LearningPathEnrollments] OFF
GO
SET IDENTITY_INSERT [dbo].[LearningPaths] ON 

INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (1, N'Data Science Path', N'A comprehensive path covering data science topics.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (2, N'Web Development Path', N'Learn how to build modern web applications.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (3, N'AI and Machine Learning Path', N'Dive into the world of AI and machine learning.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (4, N'Cloud Computing Path', N'Understand cloud services and deployment strategies.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (5, N'Cybersecurity Path', N'Learn how to protect systems and networks.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (6, N'Data Science Path', N'A comprehensive path covering data science topics.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (7, N'Web Development Path', N'Learn how to build modern web applications.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (8, N'AI and Machine Learning Path', N'Dive into the world of AI and machine learning.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (9, N'Cloud Computing Path', N'Understand cloud services and deployment strategies.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (10, N'Cybersecurity Path', N'Learn how to protect systems and networks.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (11, N'Data Science Path', N'A comprehensive path covering data science topics.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (12, N'Web Development Path', N'Learn how to build modern web applications.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (13, N'AI and Machine Learning Path', N'Dive into the world of AI and machine learning.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (14, N'Cloud Computing Path', N'Understand cloud services and deployment strategies.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (15, N'Cybersecurity Path', N'Learn how to protect systems and networks.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (16, N'Data Science Path', N'A comprehensive path covering data science topics.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (17, N'Web Development Path', N'Learn how to build modern web applications.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (18, N'AI and Machine Learning Path', N'Dive into the world of AI and machine learning.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (19, N'Cloud Computing Path', N'Understand cloud services and deployment strategies.')
INSERT [dbo].[LearningPaths] ([PathID], [Title], [Description]) VALUES (20, N'Cybersecurity Path', N'Learn how to protect systems and networks.')
SET IDENTITY_INSERT [dbo].[LearningPaths] OFF
GO
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (1, 1, N'Introduction to Python', N'Overview of Python programming language.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (2, 2, N'Creating Your First Web Page', N'Build your first webpage using HTML.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (3, 3, N'CSS Selectors', N'Learn how to use CSS selectors for styling.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (4, 4, N'Linear Regression', N'Introduction to linear regression and its implementation.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (5, 5, N'Cloud Deployment Models', N'Understand different cloud deployment models.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (6, 1, N'Introduction to Python', N'Overview of Python programming language.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (7, 2, N'Creating Your First Web Page', N'Build your first webpage using HTML.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (8, 3, N'CSS Selectors', N'Learn how to use CSS selectors for styling.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (9, 4, N'Linear Regression', N'Introduction to linear regression and its implementation.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (10, 5, N'Cloud Deployment Models', N'Understand different cloud deployment models.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (11, 1, N'Introduction to Python', N'Overview of Python programming language.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (12, 2, N'Creating Your First Web Page', N'Build your first webpage using HTML.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (13, 3, N'CSS Selectors', N'Learn how to use CSS selectors for styling.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (14, 4, N'Linear Regression', N'Introduction to linear regression and its implementation.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (15, 5, N'Cloud Deployment Models', N'Understand different cloud deployment models.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (16, 1, N'Introduction to Python', N'Overview of Python programming language.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (17, 2, N'Creating Your First Web Page', N'Build your first webpage using HTML.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (18, 3, N'CSS Selectors', N'Learn how to use CSS selectors for styling.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (19, 4, N'Linear Regression', N'Introduction to linear regression and its implementation.', 1)
INSERT [dbo].[Lessons] ([LessonID], [TopicID], [Title], [Content], [LessonOrder]) VALUES (20, 5, N'Cloud Deployment Models', N'Understand different cloud deployment models.', 1)
SET IDENTITY_INSERT [dbo].[Lessons] OFF
GO
SET IDENTITY_INSERT [dbo].[PartTopics] ON 

INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (1, 1, N'Python Syntax and Semantics', N'Learn about Python syntax and basic programming concepts.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (2, 2, N'HTML Basics', N'Introduction to HTML and building basic web pages.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (3, 3, N'CSS Styling', N'Learn how to style web pages using CSS.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (4, 4, N'Supervised Learning', N'Understand supervised learning algorithms and their applications.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (5, 5, N'Cloud Services', N'Introduction to cloud service providers and their offerings.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (6, 1, N'Python Syntax and Semantics', N'Learn about Python syntax and basic programming concepts.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (7, 2, N'HTML Basics', N'Introduction to HTML and building basic web pages.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (8, 3, N'CSS Styling', N'Learn how to style web pages using CSS.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (9, 4, N'Supervised Learning', N'Understand supervised learning algorithms and their applications.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (10, 5, N'Cloud Services', N'Introduction to cloud service providers and their offerings.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (11, 1, N'Python Syntax and Semantics', N'Learn about Python syntax and basic programming concepts.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (12, 2, N'HTML Basics', N'Introduction to HTML and building basic web pages.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (13, 3, N'CSS Styling', N'Learn how to style web pages using CSS.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (14, 4, N'Supervised Learning', N'Understand supervised learning algorithms and their applications.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (15, 5, N'Cloud Services', N'Introduction to cloud service providers and their offerings.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (16, 1, N'Python Syntax and Semantics', N'Learn about Python syntax and basic programming concepts.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (17, 2, N'HTML Basics', N'Introduction to HTML and building basic web pages.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (18, 3, N'CSS Styling', N'Learn how to style web pages using CSS.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (19, 4, N'Supervised Learning', N'Understand supervised learning algorithms and their applications.')
INSERT [dbo].[PartTopics] ([TopicID], [PartID], [Title], [Content]) VALUES (20, 5, N'Cloud Services', N'Introduction to cloud service providers and their offerings.')
SET IDENTITY_INSERT [dbo].[PartTopics] OFF
GO
SET IDENTITY_INSERT [dbo].[PathParts] ON 

INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (1, 1, N'Getting Started with Python', N'Introduction to Python and its applications.', 1)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (2, 2, N'Frontend Basics', N'Learn the basics of HTML and CSS.', 1)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (3, 3, N'Backend Development', N'Introduction to server-side programming.', 2)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (4, 3, N'Advanced Machine Learning', N'Explore advanced machine learning topics.', 3)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (5, 4, N'Cloud Basics', N'Introduction to cloud computing concepts.', 1)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (6, 1, N'Getting Started with Python', N'Introduction to Python and its applications.', 1)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (7, 2, N'Frontend Basics', N'Learn the basics of HTML and CSS.', 1)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (8, 3, N'Backend Development', N'Introduction to server-side programming.', 2)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (9, 3, N'Advanced Machine Learning', N'Explore advanced machine learning topics.', 3)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (10, 4, N'Cloud Basics', N'Introduction to cloud computing concepts.', 1)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (11, 1, N'Getting Started with Python', N'Introduction to Python and its applications.', 1)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (12, 2, N'Frontend Basics', N'Learn the basics of HTML and CSS.', 1)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (13, 3, N'Backend Development', N'Introduction to server-side programming.', 2)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (14, 3, N'Advanced Machine Learning', N'Explore advanced machine learning topics.', 3)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (15, 4, N'Cloud Basics', N'Introduction to cloud computing concepts.', 1)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (16, 1, N'Getting Started with Python', N'Introduction to Python and its applications.', 1)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (17, 2, N'Frontend Basics', N'Learn the basics of HTML and CSS.', 1)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (18, 3, N'Backend Development', N'Introduction to server-side programming.', 2)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (19, 3, N'Advanced Machine Learning', N'Explore advanced machine learning topics.', 3)
INSERT [dbo].[PathParts] ([PartID], [PathID], [Title], [Description], [PartOrder]) VALUES (20, 4, N'Cloud Basics', N'Introduction to cloud computing concepts.', 1)
SET IDENTITY_INSERT [dbo].[PathParts] OFF
GO
SET IDENTITY_INSERT [dbo].[PortfolioProjects] ON 

INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (1, 1, N'Python Data Cleaning', N'Clean and preprocess data using Python.', N'https://example.com/datasets/data_cleaning.csv', N'https://example.com/submit/project1', N'Great job on data cleaning!')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (2, 2, N'Personal Portfolio Website', N'Create a personal portfolio using HTML and CSS.', N'https://example.com/datasets/portfolio.zip', N'https://example.com/submit/project2', N'Well-designed website.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (3, 1, N'Machine Learning Classifier', N'Build a classifier using scikit-learn.', N'https://example.com/datasets/classifier.csv', N'https://example.com/submit/project3', N'Good implementation of the classifier.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (4, 3, N'Cloud Storage Setup', N'Set up and manage cloud storage for a web application.', N'https://example.com/datasets/cloud_storage.zip', N'https://example.com/submit/project4', N'Excellent cloud setup.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (5, 4, N'Network Security Simulation', N'Simulate network security scenarios.', N'https://example.com/datasets/security_sim.zip', N'https://example.com/submit/project5', N'Effective security measures.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (6, 1, N'Python Web Scraper', N'Build a web scraper using Python.', N'https://example.com/datasets/web_scraper.csv', N'https://example.com/submit/project6', N'Efficient web scraper.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (7, 2, N'JavaScript Calculator', N'Create a simple calculator using JavaScript.', N'https://example.com/datasets/calculator.zip', N'https://example.com/submit/project7', N'Interactive calculator.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (8, 5, N'AI Chatbot', N'Develop an AI chatbot using Python.', N'https://example.com/datasets/chatbot.zip', N'https://example.com/submit/project8', N'Innovative chatbot.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (9, 4, N'Database Design', N'Design a relational database for an e-commerce site.', N'https://example.com/datasets/database_design.zip', N'https://example.com/submit/project9', N'Well-structured database.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (10, 3, N'Cloud Computing Project', N'Deploy a cloud-based application.', N'https://example.com/datasets/cloud_computing.zip', N'https://example.com/submit/project10', N'Successful cloud deployment.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (11, 1, N'Python Data Cleaning', N'Clean and preprocess data using Python.', N'https://example.com/datasets/data_cleaning.csv', N'https://example.com/submit/project1', N'Great job on data cleaning!')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (12, 2, N'Personal Portfolio Website', N'Create a personal portfolio using HTML and CSS.', N'https://example.com/datasets/portfolio.zip', N'https://example.com/submit/project2', N'Well-designed website.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (13, 1, N'Machine Learning Classifier', N'Build a classifier using scikit-learn.', N'https://example.com/datasets/classifier.csv', N'https://example.com/submit/project3', N'Good implementation of the classifier.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (14, 3, N'Cloud Storage Setup', N'Set up and manage cloud storage for a web application.', N'https://example.com/datasets/cloud_storage.zip', N'https://example.com/submit/project4', N'Excellent cloud setup.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (15, 4, N'Network Security Simulation', N'Simulate network security scenarios.', N'https://example.com/datasets/security_sim.zip', N'https://example.com/submit/project5', N'Effective security measures.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (16, 1, N'Python Web Scraper', N'Build a web scraper using Python.', N'https://example.com/datasets/web_scraper.csv', N'https://example.com/submit/project6', N'Efficient web scraper.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (17, 2, N'JavaScript Calculator', N'Create a simple calculator using JavaScript.', N'https://example.com/datasets/calculator.zip', N'https://example.com/submit/project7', N'Interactive calculator.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (18, 5, N'AI Chatbot', N'Develop an AI chatbot using Python.', N'https://example.com/datasets/chatbot.zip', N'https://example.com/submit/project8', N'Innovative chatbot.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (19, 4, N'Database Design', N'Design a relational database for an e-commerce site.', N'https://example.com/datasets/database_design.zip', N'https://example.com/submit/project9', N'Well-structured database.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (20, 3, N'Cloud Computing Project', N'Deploy a cloud-based application.', N'https://example.com/datasets/cloud_computing.zip', N'https://example.com/submit/project10', N'Successful cloud deployment.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (21, 1, N'Python Data Cleaning', N'Clean and preprocess data using Python.', N'https://example.com/datasets/data_cleaning.csv', N'https://example.com/submit/project1', N'Great job on data cleaning!')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (22, 2, N'Personal Portfolio Website', N'Create a personal portfolio using HTML and CSS.', N'https://example.com/datasets/portfolio.zip', N'https://example.com/submit/project2', N'Well-designed website.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (23, 1, N'Machine Learning Classifier', N'Build a classifier using scikit-learn.', N'https://example.com/datasets/classifier.csv', N'https://example.com/submit/project3', N'Good implementation of the classifier.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (24, 3, N'Cloud Storage Setup', N'Set up and manage cloud storage for a web application.', N'https://example.com/datasets/cloud_storage.zip', N'https://example.com/submit/project4', N'Excellent cloud setup.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (25, 4, N'Network Security Simulation', N'Simulate network security scenarios.', N'https://example.com/datasets/security_sim.zip', N'https://example.com/submit/project5', N'Effective security measures.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (26, 1, N'Python Web Scraper', N'Build a web scraper using Python.', N'https://example.com/datasets/web_scraper.csv', N'https://example.com/submit/project6', N'Efficient web scraper.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (27, 2, N'JavaScript Calculator', N'Create a simple calculator using JavaScript.', N'https://example.com/datasets/calculator.zip', N'https://example.com/submit/project7', N'Interactive calculator.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (28, 5, N'AI Chatbot', N'Develop an AI chatbot using Python.', N'https://example.com/datasets/chatbot.zip', N'https://example.com/submit/project8', N'Innovative chatbot.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (29, 4, N'Database Design', N'Design a relational database for an e-commerce site.', N'https://example.com/datasets/database_design.zip', N'https://example.com/submit/project9', N'Well-structured database.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (30, 3, N'Cloud Computing Project', N'Deploy a cloud-based application.', N'https://example.com/datasets/cloud_computing.zip', N'https://example.com/submit/project10', N'Successful cloud deployment.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (31, 1, N'Python Data Cleaning', N'Clean and preprocess data using Python.', N'https://example.com/datasets/data_cleaning.csv', N'https://example.com/submit/project1', N'Great job on data cleaning!')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (32, 2, N'Personal Portfolio Website', N'Create a personal portfolio using HTML and CSS.', N'https://example.com/datasets/portfolio.zip', N'https://example.com/submit/project2', N'Well-designed website.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (33, 1, N'Machine Learning Classifier', N'Build a classifier using scikit-learn.', N'https://example.com/datasets/classifier.csv', N'https://example.com/submit/project3', N'Good implementation of the classifier.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (34, 3, N'Cloud Storage Setup', N'Set up and manage cloud storage for a web application.', N'https://example.com/datasets/cloud_storage.zip', N'https://example.com/submit/project4', N'Excellent cloud setup.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (35, 4, N'Network Security Simulation', N'Simulate network security scenarios.', N'https://example.com/datasets/security_sim.zip', N'https://example.com/submit/project5', N'Effective security measures.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (36, 1, N'Python Web Scraper', N'Build a web scraper using Python.', N'https://example.com/datasets/web_scraper.csv', N'https://example.com/submit/project6', N'Efficient web scraper.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (37, 2, N'JavaScript Calculator', N'Create a simple calculator using JavaScript.', N'https://example.com/datasets/calculator.zip', N'https://example.com/submit/project7', N'Interactive calculator.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (38, 5, N'AI Chatbot', N'Develop an AI chatbot using Python.', N'https://example.com/datasets/chatbot.zip', N'https://example.com/submit/project8', N'Innovative chatbot.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (39, 4, N'Database Design', N'Design a relational database for an e-commerce site.', N'https://example.com/datasets/database_design.zip', N'https://example.com/submit/project9', N'Well-structured database.')
INSERT [dbo].[PortfolioProjects] ([PortfolioProjectID], [UserID], [Title], [Description], [DatasetLink], [SubmissionLink], [Feedback]) VALUES (40, 3, N'Cloud Computing Project', N'Deploy a cloud-based application.', N'https://example.com/datasets/cloud_computing.zip', N'https://example.com/submit/project10', N'Successful cloud deployment.')
SET IDENTITY_INSERT [dbo].[PortfolioProjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Progress] ON 

INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (1, 1, 1, N'en progreso', CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (2, 2, 2, N'completado', CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (3, 3, 3, N'en progreso', CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (4, 4, 4, N'completado', CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (5, 5, 5, N'en progreso', CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (6, 1, 2, N'completado', CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (7, 2, 3, N'en progreso', CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (8, 3, 4, N'completado', CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (9, 4, 5, N'en progreso', CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (10, 5, 1, N'completado', CAST(N'2024-08-27T22:06:22.443' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (11, 1, 1, N'en progreso', CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (12, 2, 2, N'completado', CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (13, 3, 3, N'en progreso', CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (14, 4, 4, N'completado', CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (15, 5, 5, N'en progreso', CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (16, 1, 2, N'completado', CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (17, 2, 3, N'en progreso', CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (18, 3, 4, N'completado', CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (19, 4, 5, N'en progreso', CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (20, 5, 1, N'completado', CAST(N'2024-08-27T22:10:32.690' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (21, 1, 1, N'en progreso', CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (22, 2, 2, N'completado', CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (23, 3, 3, N'en progreso', CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (24, 4, 4, N'completado', CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (25, 5, 5, N'en progreso', CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (26, 1, 2, N'completado', CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (27, 2, 3, N'en progreso', CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (28, 3, 4, N'completado', CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (29, 4, 5, N'en progreso', CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (30, 5, 1, N'completado', CAST(N'2024-08-27T22:15:20.780' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (31, 1, 1, N'en progreso', CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (32, 2, 2, N'completado', CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (33, 3, 3, N'en progreso', CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (34, 4, 4, N'completado', CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (35, 5, 5, N'en progreso', CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (36, 1, 2, N'completado', CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (37, 2, 3, N'en progreso', CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (38, 3, 4, N'completado', CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (39, 4, 5, N'en progreso', CAST(N'2024-08-27T22:30:20.120' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [LessonID], [Status], [LastAccessed]) VALUES (40, 5, 1, N'completado', CAST(N'2024-08-27T22:30:20.120' AS DateTime))
SET IDENTITY_INSERT [dbo].[Progress] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 

INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (1, N'John Doe', N'johndoe@example.com', N'hashedpassword123', N'Student', CAST(N'2024-08-27T22:00:56.607' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (2, N'Jane Smith', N'janesmith@example.com', N'hashedpassword456', N'Instructor', CAST(N'2024-08-27T22:00:56.607' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (3, N'Carlos García', N'cgarcia@example.com', N'hashedpassword789', N'Admin', CAST(N'2024-08-27T22:00:56.607' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (4, N'Maria Rodriguez', N'mrodriguez@example.com', N'hashedpassword101', N'Student', CAST(N'2024-08-27T22:00:56.607' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (5, N'Liam Brown', N'liambrown@example.com', N'hashedpassword112', N'Instructor', CAST(N'2024-08-27T22:00:56.607' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (6, N'John Doe', N'johndoe@example.com', N'hashedpassword123', N'Student', CAST(N'2024-08-27T22:06:22.430' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (7, N'Jane Smith', N'janesmith@example.com', N'hashedpassword456', N'Instructor', CAST(N'2024-08-27T22:06:22.430' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (8, N'Carlos García', N'cgarcia@example.com', N'hashedpassword789', N'Admin', CAST(N'2024-08-27T22:06:22.430' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (9, N'Maria Rodriguez', N'mrodriguez@example.com', N'hashedpassword101', N'Student', CAST(N'2024-08-27T22:06:22.430' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (10, N'Liam Brown', N'liambrown@example.com', N'hashedpassword112', N'Instructor', CAST(N'2024-08-27T22:06:22.430' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (11, N'John Doe', N'johndoe@example.com', N'hashedpassword123', N'Student', CAST(N'2024-08-27T22:10:32.680' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (12, N'Jane Smith', N'janesmith@example.com', N'hashedpassword456', N'Instructor', CAST(N'2024-08-27T22:10:32.680' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (13, N'Carlos García', N'cgarcia@example.com', N'hashedpassword789', N'Admin', CAST(N'2024-08-27T22:10:32.680' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (14, N'Maria Rodriguez', N'mrodriguez@example.com', N'hashedpassword101', N'Student', CAST(N'2024-08-27T22:10:32.680' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (15, N'Liam Brown', N'liambrown@example.com', N'hashedpassword112', N'Instructor', CAST(N'2024-08-27T22:10:32.680' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (16, N'John Doe', N'johndoe@example.com', N'hashedpassword123', N'Student', CAST(N'2024-08-27T22:15:20.773' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (17, N'Jane Smith', N'janesmith@example.com', N'hashedpassword456', N'Instructor', CAST(N'2024-08-27T22:15:20.773' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (18, N'Carlos García', N'cgarcia@example.com', N'hashedpassword789', N'Admin', CAST(N'2024-08-27T22:15:20.773' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (19, N'Maria Rodriguez', N'mrodriguez@example.com', N'hashedpassword101', N'Student', CAST(N'2024-08-27T22:15:20.773' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (20, N'Liam Brown', N'liambrown@example.com', N'hashedpassword112', N'Instructor', CAST(N'2024-08-27T22:15:20.773' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (21, N'Alice Johnson', N'alice.johnson@example.com', N'hashedpw123', N'Student', CAST(N'2024-08-27T22:30:20.110' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (22, N'Bob Lee', N'bob.lee@example.com', N'hashedpw456', N'Instructor', CAST(N'2024-08-27T22:30:20.110' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (23, N'Catherine Nguyen', N'catherine.nguyen@example.com', N'hashedpw789', N'Admin', CAST(N'2024-08-27T22:30:20.110' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (24, N'David Kim', N'david.kim@example.com', N'hashedpw101', N'Student', CAST(N'2024-08-27T22:30:20.110' AS DateTime))
INSERT [dbo].[USERS] ([UserID], [Name], [Email], [Password], [Role], [DateJoined]) VALUES (25, N'Eva Martinez', N'eva.martinez@example.com', N'hashedpw112', N'Instructor', CAST(N'2024-08-27T22:30:20.110' AS DateTime))
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
ALTER TABLE [dbo].[Certificates]  WITH CHECK ADD  CONSTRAINT [FK_Certificates_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Certificates] CHECK CONSTRAINT [FK_Certificates_Courses]
GO
ALTER TABLE [dbo].[Certificates]  WITH CHECK ADD  CONSTRAINT [FK_Certificates_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[USERS] ([UserID])
GO
ALTER TABLE [dbo].[Certificates] CHECK CONSTRAINT [FK_Certificates_Users]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_LearningPaths] FOREIGN KEY([PathID])
REFERENCES [dbo].[LearningPaths] ([PathID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_LearningPaths]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Courses]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[USERS] ([UserID])
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Users]
GO
ALTER TABLE [dbo].[GuidedProjects]  WITH CHECK ADD  CONSTRAINT [FK_GuidedProjects_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[GuidedProjects] CHECK CONSTRAINT [FK_GuidedProjects_Courses]
GO
ALTER TABLE [dbo].[LearningPathEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_LearningPathEnrollments_LearningPaths] FOREIGN KEY([PathID])
REFERENCES [dbo].[LearningPaths] ([PathID])
GO
ALTER TABLE [dbo].[LearningPathEnrollments] CHECK CONSTRAINT [FK_LearningPathEnrollments_LearningPaths]
GO
ALTER TABLE [dbo].[LearningPathEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_LearningPathEnrollments_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[USERS] ([UserID])
GO
ALTER TABLE [dbo].[LearningPathEnrollments] CHECK CONSTRAINT [FK_LearningPathEnrollments_Users]
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_PartTopics] FOREIGN KEY([TopicID])
REFERENCES [dbo].[PartTopics] ([TopicID])
GO
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_PartTopics]
GO
ALTER TABLE [dbo].[PartTopics]  WITH CHECK ADD  CONSTRAINT [FK_PartTopics_PathParts] FOREIGN KEY([PartID])
REFERENCES [dbo].[PathParts] ([PartID])
GO
ALTER TABLE [dbo].[PartTopics] CHECK CONSTRAINT [FK_PartTopics_PathParts]
GO
ALTER TABLE [dbo].[PathParts]  WITH CHECK ADD  CONSTRAINT [FK_PathParts_LearningPaths] FOREIGN KEY([PathID])
REFERENCES [dbo].[LearningPaths] ([PathID])
GO
ALTER TABLE [dbo].[PathParts] CHECK CONSTRAINT [FK_PathParts_LearningPaths]
GO
ALTER TABLE [dbo].[PortfolioProjects]  WITH CHECK ADD  CONSTRAINT [FK_PortfolioProjects_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[USERS] ([UserID])
GO
ALTER TABLE [dbo].[PortfolioProjects] CHECK CONSTRAINT [FK_PortfolioProjects_Users]
GO
ALTER TABLE [dbo].[Progress]  WITH CHECK ADD  CONSTRAINT [FK_Progress_Lessons] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lessons] ([LessonID])
GO
ALTER TABLE [dbo].[Progress] CHECK CONSTRAINT [FK_Progress_Lessons]
GO
ALTER TABLE [dbo].[Progress]  WITH CHECK ADD  CONSTRAINT [FK_Progress_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[USERS] ([UserID])
GO
ALTER TABLE [dbo].[Progress] CHECK CONSTRAINT [FK_Progress_Users]
GO
ALTER TABLE [dbo].[Progress]  WITH CHECK ADD CHECK  (([Status]='en progreso' OR [Status]='completado'))
GO
USE [master]
GO
ALTER DATABASE [learning_platform] SET  READ_WRITE 
GO
