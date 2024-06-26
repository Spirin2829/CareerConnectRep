USE [master]
GO
/****** Object:  Database [dbCareerConnect]    Script Date: 07.05.2024 15:12:28 ******/
CREATE DATABASE [dbCareerConnect]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbCareerConnect', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbCareerConnect.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbCareerConnect_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbCareerConnect_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbCareerConnect] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbCareerConnect].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbCareerConnect] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbCareerConnect] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbCareerConnect] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbCareerConnect] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbCareerConnect] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbCareerConnect] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbCareerConnect] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbCareerConnect] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbCareerConnect] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbCareerConnect] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbCareerConnect] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbCareerConnect] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbCareerConnect] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbCareerConnect] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbCareerConnect] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbCareerConnect] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbCareerConnect] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbCareerConnect] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbCareerConnect] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbCareerConnect] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbCareerConnect] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbCareerConnect] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbCareerConnect] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbCareerConnect] SET  MULTI_USER 
GO
ALTER DATABASE [dbCareerConnect] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbCareerConnect] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbCareerConnect] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbCareerConnect] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbCareerConnect] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbCareerConnect] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbCareerConnect] SET QUERY_STORE = OFF
GO
USE [dbCareerConnect]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 07.05.2024 15:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[IDAdmin] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](10) NOT NULL,
	[Full_name] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[IDRole] [int] NOT NULL,
 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
(
	[IDAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applicant]    Script Date: 07.05.2024 15:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applicant](
	[IDApplicant] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Full_Name] [varchar](50) NOT NULL,
	[Phone_Number] [varchar](50) NOT NULL,
	[Date_of_Birth] [date] NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[IDRole] [int] NOT NULL,
 CONSTRAINT [PK_Applicant] PRIMARY KEY CLUSTERED 
(
	[IDApplicant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationRez]    Script Date: 07.05.2024 15:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationRez](
	[IDNotificationRez] [int] IDENTITY(1,1) NOT NULL,
	[Full_name] [varchar](50) NOT NULL,
	[Speciality] [varchar](50) NOT NULL,
	[Applicantid] [int] NOT NULL,
	[Recruiterid] [int] NOT NULL,
 CONSTRAINT [PK_NotificationRez] PRIMARY KEY CLUSTERED 
(
	[IDNotificationRez] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationVac]    Script Date: 07.05.2024 15:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationVac](
	[IDNotificationVac] [int] IDENTITY(1,1) NOT NULL,
	[Job_title] [varchar](50) NOT NULL,
	[Company_Name] [varchar](100) NOT NULL,
	[RecruiterID] [int] NOT NULL,
	[IDAplicantID] [int] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[IDNotificationVac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruiter]    Script Date: 07.05.2024 15:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiter](
	[IDRecruiter] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](10) NOT NULL,
	[Full_name] [varchar](50) NOT NULL,
	[Phone_number] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[IDRole] [int] NOT NULL,
	[Company_name] [varchar](50) NULL,
 CONSTRAINT [PK_Recruiter] PRIMARY KEY CLUSTERED 
(
	[IDRecruiter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resume]    Script Date: 07.05.2024 15:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resume](
	[IDResume] [int] IDENTITY(1,1) NOT NULL,
	[Full_name] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Date_of_birth] [date] NOT NULL,
	[Education] [varchar](50) NULL,
	[Speciality] [varchar](50) NOT NULL,
	[Work_experience] [varchar](50) NOT NULL,
	[Phone_number] [varchar](50) NOT NULL,
	[Soft_skills] [varchar](50) NOT NULL,
	[Hard_skills] [varchar](50) NOT NULL,
	[IDApplicant] [int] NOT NULL,
 CONSTRAINT [PK_Summary] PRIMARY KEY CLUSTERED 
(
	[IDResume] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role1]    Script Date: 07.05.2024 15:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role1](
	[IDRole] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role1] PRIMARY KEY CLUSTERED 
(
	[IDRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacancies]    Script Date: 07.05.2024 15:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacancies](
	[IDVacancy] [int] IDENTITY(1,1) NOT NULL,
	[Job_title] [varchar](50) NOT NULL,
	[Company_name] [varchar](50) NOT NULL,
	[Vacancy_description] [varchar](100) NOT NULL,
	[Work_address] [varchar](50) NOT NULL,
	[Post] [text] NOT NULL,
	[Categories] [varchar](50) NOT NULL,
	[Work_experience] [varchar](50) NOT NULL,
	[Responsibilities] [varchar](50) NOT NULL,
	[IDRecruiter] [int] NOT NULL,
 CONSTRAINT [PK_Vacancies] PRIMARY KEY CLUSTERED 
(
	[IDVacancy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrator] ON 

INSERT [dbo].[Administrator] ([IDAdmin], [Login], [Full_name], [Password], [IDRole]) VALUES (1, N'AC', N'Anton Sergeevich Grin', N'123', 1)
SET IDENTITY_INSERT [dbo].[Administrator] OFF
GO
SET IDENTITY_INSERT [dbo].[Applicant] ON 

INSERT [dbo].[Applicant] ([IDApplicant], [Login], [Full_Name], [Phone_Number], [Date_of_Birth], [Password], [IDRole]) VALUES (1, N'Party', N'Magomedova Patymat Ysupovna', N'89635698120', CAST(N'2005-12-12' AS Date), N'777', 3)
INSERT [dbo].[Applicant] ([IDApplicant], [Login], [Full_Name], [Phone_Number], [Date_of_Birth], [Password], [IDRole]) VALUES (2, N'lol', N'Jeon Jungkook', N'89631452023', CAST(N'1977-12-12' AS Date), N'lol', 3)
INSERT [dbo].[Applicant] ([IDApplicant], [Login], [Full_Name], [Phone_Number], [Date_of_Birth], [Password], [IDRole]) VALUES (3, N'SV', N'Kulikova Svetlana Ivanovna', N'89285698989', CAST(N'2003-12-12' AS Date), N'sv', 3)
INSERT [dbo].[Applicant] ([IDApplicant], [Login], [Full_Name], [Phone_Number], [Date_of_Birth], [Password], [IDRole]) VALUES (4, N'Timo', N'Timothy Allen', N'89631214157', CAST(N'2000-12-12' AS Date), N'fff', 3)
INSERT [dbo].[Applicant] ([IDApplicant], [Login], [Full_Name], [Phone_Number], [Date_of_Birth], [Password], [IDRole]) VALUES (5, N'brr', N'Brad Clark', N'89281474518', CAST(N'1999-06-23' AS Date), N'cl', 3)
INSERT [dbo].[Applicant] ([IDApplicant], [Login], [Full_Name], [Phone_Number], [Date_of_Birth], [Password], [IDRole]) VALUES (6, N'Di', N'Diana Miller', N'89632560223', CAST(N'1994-08-08' AS Date), N'd4', 3)
INSERT [dbo].[Applicant] ([IDApplicant], [Login], [Full_Name], [Phone_Number], [Date_of_Birth], [Password], [IDRole]) VALUES (7, N'bj', N'Betty Jackson', N'89632514457', CAST(N'1991-01-01' AS Date), N'bj', 3)
INSERT [dbo].[Applicant] ([IDApplicant], [Login], [Full_Name], [Phone_Number], [Date_of_Birth], [Password], [IDRole]) VALUES (8, N'vel', N'Velma Hubbard', N'89631740202', CAST(N'1999-01-01' AS Date), N'rt', 3)
SET IDENTITY_INSERT [dbo].[Applicant] OFF
GO
SET IDENTITY_INSERT [dbo].[NotificationRez] ON 

INSERT [dbo].[NotificationRez] ([IDNotificationRez], [Full_name], [Speciality], [Applicantid], [Recruiterid]) VALUES (1, N'', N'Programmer', 1, 1)
INSERT [dbo].[NotificationRez] ([IDNotificationRez], [Full_name], [Speciality], [Applicantid], [Recruiterid]) VALUES (2, N'Magomedova Patymat Ysupovna', N'89635698120', 1, 1)
INSERT [dbo].[NotificationRez] ([IDNotificationRez], [Full_name], [Speciality], [Applicantid], [Recruiterid]) VALUES (3, N'Kulikova Svetlana Ivanovna', N'89285698989', 3, 1)
INSERT [dbo].[NotificationRez] ([IDNotificationRez], [Full_name], [Speciality], [Applicantid], [Recruiterid]) VALUES (4, N'Timothy Allen', N'89631214157', 4, 1)
INSERT [dbo].[NotificationRez] ([IDNotificationRez], [Full_name], [Speciality], [Applicantid], [Recruiterid]) VALUES (8, N'Kulikova Svetlana Ivanovna', N'89285698989', 3, 2)
INSERT [dbo].[NotificationRez] ([IDNotificationRez], [Full_name], [Speciality], [Applicantid], [Recruiterid]) VALUES (12, N'Magomedova Patymat Ysupovna', N'89635698120', 1, 2)
INSERT [dbo].[NotificationRez] ([IDNotificationRez], [Full_name], [Speciality], [Applicantid], [Recruiterid]) VALUES (13, N'Diana Miller', N'89632560223', 6, 2)
INSERT [dbo].[NotificationRez] ([IDNotificationRez], [Full_name], [Speciality], [Applicantid], [Recruiterid]) VALUES (14, N'Betty Jackson', N'89632514457', 7, 2)
SET IDENTITY_INSERT [dbo].[NotificationRez] OFF
GO
SET IDENTITY_INSERT [dbo].[NotificationVac] ON 

INSERT [dbo].[NotificationVac] ([IDNotificationVac], [Job_title], [Company_Name], [RecruiterID], [IDAplicantID]) VALUES (1, N'Apple', N'89635652120', 2, 2)
INSERT [dbo].[NotificationVac] ([IDNotificationVac], [Job_title], [Company_Name], [RecruiterID], [IDAplicantID]) VALUES (2, N'Apple', N'89635652120', 2, 1)
INSERT [dbo].[NotificationVac] ([IDNotificationVac], [Job_title], [Company_Name], [RecruiterID], [IDAplicantID]) VALUES (3, N'Google', N'89663454412', 1, 1)
INSERT [dbo].[NotificationVac] ([IDNotificationVac], [Job_title], [Company_Name], [RecruiterID], [IDAplicantID]) VALUES (4, N'DataDash', N'89284510101', 6, 1)
INSERT [dbo].[NotificationVac] ([IDNotificationVac], [Job_title], [Company_Name], [RecruiterID], [IDAplicantID]) VALUES (5, N'InnoTech', N'89284638947', 8, 1)
SET IDENTITY_INSERT [dbo].[NotificationVac] OFF
GO
SET IDENTITY_INSERT [dbo].[Recruiter] ON 

INSERT [dbo].[Recruiter] ([IDRecruiter], [Login], [Full_name], [Phone_number], [Password], [IDRole], [Company_name]) VALUES (0, N'Jennie', N'Jennie Ruby Jane', N'89635670012', N'999', 2, N'YG')
INSERT [dbo].[Recruiter] ([IDRecruiter], [Login], [Full_name], [Phone_number], [Password], [IDRole], [Company_name]) VALUES (1, N'Kuzya', N'Kuzmin Kolya Sergeevich', N'89663454412', N'1212', 2, N'Google')
INSERT [dbo].[Recruiter] ([IDRecruiter], [Login], [Full_name], [Phone_number], [Password], [IDRole], [Company_name]) VALUES (2, N'Al', N'Shchuplova Alina Konstantinovna ', N'89635652120', N'111', 2, N'Apple')
INSERT [dbo].[Recruiter] ([IDRecruiter], [Login], [Full_name], [Phone_number], [Password], [IDRole], [Company_name]) VALUES (3, N'Dimon', N'Novikov Dmitriy Olegovich', N'89288914778', N'333', 2, N'Yandex')
INSERT [dbo].[Recruiter] ([IDRecruiter], [Login], [Full_name], [Phone_number], [Password], [IDRole], [Company_name]) VALUES (4, N'alec', N'DmitrievAlexandr Matveevich', N'89634567890', N'ooo', 2, N'OA')
INSERT [dbo].[Recruiter] ([IDRecruiter], [Login], [Full_name], [Phone_number], [Password], [IDRole], [Company_name]) VALUES (5, N'sof', N'Nazarova Sofia Makarovna', N'89635612424', N'lll', 2, N'Techmate')
INSERT [dbo].[Recruiter] ([IDRecruiter], [Login], [Full_name], [Phone_number], [Password], [IDRole], [Company_name]) VALUES (6, N'Var', N'Bocharova Veronika Nikitichna', N'89284510101', N'sss', 2, N'DataDash')
INSERT [dbo].[Recruiter] ([IDRecruiter], [Login], [Full_name], [Phone_number], [Password], [IDRole], [Company_name]) VALUES (7, N'MO', N'Ann Moore', N'89634561212', N'vvv', 2, N'CloudLink')
INSERT [dbo].[Recruiter] ([IDRecruiter], [Login], [Full_name], [Phone_number], [Password], [IDRole], [Company_name]) VALUES (8, N'SH', N'Sally Harrison', N'89284638947', N'xoxo', 2, N'InnoTech')
SET IDENTITY_INSERT [dbo].[Recruiter] OFF
GO
SET IDENTITY_INSERT [dbo].[Resume] ON 

INSERT [dbo].[Resume] ([IDResume], [Full_name], [Address], [Date_of_birth], [Education], [Speciality], [Work_experience], [Phone_number], [Soft_skills], [Hard_skills], [IDApplicant]) VALUES (1, N'Mafomedova Patymat Ysupovna', N'Moscow', CAST(N'2005-12-12' AS Date), N'TK34', N'Programmer', N'3', N'89635698120', N'Communication, self-motivation', N'C#, Flutter', 1)
INSERT [dbo].[Resume] ([IDResume], [Full_name], [Address], [Date_of_birth], [Education], [Speciality], [Work_experience], [Phone_number], [Soft_skills], [Hard_skills], [IDApplicant]) VALUES (2, N'Jeon Jungkook', N'Moscow', CAST(N'1977-12-12' AS Date), N'MGU', N'Manager', N'5', N'89631452023', N'Self - confidence, Leadership', N'English,Analytics', 2)
INSERT [dbo].[Resume] ([IDResume], [Full_name], [Address], [Date_of_birth], [Education], [Speciality], [Work_experience], [Phone_number], [Soft_skills], [Hard_skills], [IDApplicant]) VALUES (6, N'Kulikova Svetlana Ivanovna', N'Moscow', CAST(N'1996-12-03' AS Date), N'LK', N'Programmer', N'1', N'89632541010', N'Self-motivated, optimism', N'Java, Unity', 3)
INSERT [dbo].[Resume] ([IDResume], [Full_name], [Address], [Date_of_birth], [Education], [Speciality], [Work_experience], [Phone_number], [Soft_skills], [Hard_skills], [IDApplicant]) VALUES (9, N'Timothy Allen', N'Moscow', CAST(N'2000-12-12' AS Date), N'MGU', N'Adminictrator', N'5', N'89631214157', N'Optimism', N'React Native', 4)
INSERT [dbo].[Resume] ([IDResume], [Full_name], [Address], [Date_of_birth], [Education], [Speciality], [Work_experience], [Phone_number], [Soft_skills], [Hard_skills], [IDApplicant]) VALUES (10, N'Betty Jackson', N'New York', CAST(N'1991-01-01' AS Date), N'TK34', N'Programmer', N'2', N'89632514457', N'Self-confidence', N'Python', 5)
INSERT [dbo].[Resume] ([IDResume], [Full_name], [Address], [Date_of_birth], [Education], [Speciality], [Work_experience], [Phone_number], [Soft_skills], [Hard_skills], [IDApplicant]) VALUES (11, N'Velma Hubbard', N'LA', CAST(N'1999-01-01' AS Date), N'MGU', N'Programmer', N'3', N'89631740202', N'Communication', N'Flutter, C#', 6)
SET IDENTITY_INSERT [dbo].[Resume] OFF
GO
SET IDENTITY_INSERT [dbo].[Role1] ON 

INSERT [dbo].[Role1] ([IDRole], [Login]) VALUES (1, N'Administrator')
INSERT [dbo].[Role1] ([IDRole], [Login]) VALUES (2, N'Recruiter')
INSERT [dbo].[Role1] ([IDRole], [Login]) VALUES (3, N'Applicant')
SET IDENTITY_INSERT [dbo].[Role1] OFF
GO
SET IDENTITY_INSERT [dbo].[Vacancies] ON 

INSERT [dbo].[Vacancies] ([IDVacancy], [Job_title], [Company_name], [Vacancy_description], [Work_address], [Post], [Categories], [Work_experience], [Responsibilities], [IDRecruiter]) VALUES (1, N'Programmer', N'Google', N'NDndfdhfbhdbfhedbfbfudjbcndjc', N'New York', N'Programmer', N'IT', N'3', N'C#, React Native, Java', 1)
INSERT [dbo].[Vacancies] ([IDVacancy], [Job_title], [Company_name], [Vacancy_description], [Work_address], [Post], [Categories], [Work_experience], [Responsibilities], [IDRecruiter]) VALUES (2, N'Manager', N'Apple', N'gfhfght5ryhtrgthbgfdjythjyrsyhb', N'Moscow', N'Manager', N'IT', N'1', N'Unity, C#', 1)
INSERT [dbo].[Vacancies] ([IDVacancy], [Job_title], [Company_name], [Vacancy_description], [Work_address], [Post], [Categories], [Work_experience], [Responsibilities], [IDRecruiter]) VALUES (3, N'Programmer', N'Yandex', N'rgrtyhtrejhtsgvbsddrterwjhyrdjnts', N'LA', N'Programmer', N'IT', N'1', N'Rect Native, Java', 1)
INSERT [dbo].[Vacancies] ([IDVacancy], [Job_title], [Company_name], [Vacancy_description], [Work_address], [Post], [Categories], [Work_experience], [Responsibilities], [IDRecruiter]) VALUES (4, N'Designer', N'OA', N'dfergtergterhtgfhbfdsv', N'Moscow', N'Designer', N'IT', N'5', N'rfgrgfrgd', 1)
INSERT [dbo].[Vacancies] ([IDVacancy], [Job_title], [Company_name], [Vacancy_description], [Work_address], [Post], [Categories], [Work_experience], [Responsibilities], [IDRecruiter]) VALUES (5, N'Programmer', N'Techmate', N'fgetrhtrujtrshgfagergewtrh', N'Moscow', N'Programmer', N'IT', N'1', N'Python', 1)
INSERT [dbo].[Vacancies] ([IDVacancy], [Job_title], [Company_name], [Vacancy_description], [Work_address], [Post], [Categories], [Work_experience], [Responsibilities], [IDRecruiter]) VALUES (8, N'Administrator', N'CloudLink', N'fvbgfdhjytujrythgrdfaagfagerhg', N'Moscow', N'Administrator', N'IT', N'2', N'Java, Flutter', 1)
INSERT [dbo].[Vacancies] ([IDVacancy], [Job_title], [Company_name], [Vacancy_description], [Work_address], [Post], [Categories], [Work_experience], [Responsibilities], [IDRecruiter]) VALUES (9, N'Programmer', N'InnoTech', N'trehgytreuiytjnatregrytrjnfdvbfg', N'New York', N'Programmer', N'IT', N'3', N'Flutter, Java', 1)
SET IDENTITY_INSERT [dbo].[Vacancies] OFF
GO
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD  CONSTRAINT [FK_Administrator_Role1] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role1] ([IDRole])
GO
ALTER TABLE [dbo].[Administrator] CHECK CONSTRAINT [FK_Administrator_Role1]
GO
ALTER TABLE [dbo].[Applicant]  WITH CHECK ADD  CONSTRAINT [FK_Applicant_Role1] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role1] ([IDRole])
GO
ALTER TABLE [dbo].[Applicant] CHECK CONSTRAINT [FK_Applicant_Role1]
GO
ALTER TABLE [dbo].[NotificationRez]  WITH CHECK ADD  CONSTRAINT [FK_NotificationRez_Applicant] FOREIGN KEY([Applicantid])
REFERENCES [dbo].[Applicant] ([IDApplicant])
GO
ALTER TABLE [dbo].[NotificationRez] CHECK CONSTRAINT [FK_NotificationRez_Applicant]
GO
ALTER TABLE [dbo].[NotificationRez]  WITH CHECK ADD  CONSTRAINT [FK_NotificationRez_Recruiter] FOREIGN KEY([Recruiterid])
REFERENCES [dbo].[Recruiter] ([IDRecruiter])
GO
ALTER TABLE [dbo].[NotificationRez] CHECK CONSTRAINT [FK_NotificationRez_Recruiter]
GO
ALTER TABLE [dbo].[NotificationVac]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Applicant] FOREIGN KEY([IDAplicantID])
REFERENCES [dbo].[Applicant] ([IDApplicant])
GO
ALTER TABLE [dbo].[NotificationVac] CHECK CONSTRAINT [FK_Notification_Applicant]
GO
ALTER TABLE [dbo].[NotificationVac]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Recruiter] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiter] ([IDRecruiter])
GO
ALTER TABLE [dbo].[NotificationVac] CHECK CONSTRAINT [FK_Notification_Recruiter]
GO
ALTER TABLE [dbo].[Resume]  WITH CHECK ADD  CONSTRAINT [FK_Resume_Applicant1] FOREIGN KEY([IDApplicant])
REFERENCES [dbo].[Applicant] ([IDApplicant])
GO
ALTER TABLE [dbo].[Resume] CHECK CONSTRAINT [FK_Resume_Applicant1]
GO
ALTER TABLE [dbo].[Vacancies]  WITH CHECK ADD  CONSTRAINT [FK_Vacancies_Recruiter] FOREIGN KEY([IDRecruiter])
REFERENCES [dbo].[Recruiter] ([IDRecruiter])
GO
ALTER TABLE [dbo].[Vacancies] CHECK CONSTRAINT [FK_Vacancies_Recruiter]
GO
USE [master]
GO
ALTER DATABASE [dbCareerConnect] SET  READ_WRITE 
GO
