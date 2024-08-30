--Database Creation
CREATE DATABASE learning_platform;
Go
--Selection of Database
USE learning_platform

-- Table: USERS
CREATE TABLE USERS (
    UserID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Name varchar(100) NOT NULL,
    Email varchar(100) NOT NULL,
    Password varchar(255) NOT NULL,  -- This field stores hashed passwords
    Role varchar(255) NOT NULL,
    DateJoined datetime NOT NULL DEFAULT GETDATE()  -- Establecer fecha y hora actual por defecto
);

-- Table: PortfolioProjects
CREATE TABLE PortfolioProjects (
    PortfolioProjectID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    UserID int NOT NULL,
    Title nvarchar(255) NOT NULL,
    Description nvarchar(255) NOT NULL,
    DatasetLink nvarchar(255) NOT NULL,
    SubmissionLink nvarchar(255) NOT NULL,
    Feedback nvarchar(255) NOT NULL,
    CONSTRAINT FK_PortfolioProjects_Users FOREIGN KEY (UserID) REFERENCES USERS(UserID)
);

-- Table: LearningPaths
CREATE TABLE LearningPaths (
    PathID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Title nvarchar(255) NOT NULL,
    Description nvarchar(255) NOT NULL
);

-- Table: LearningPathEnrollments
CREATE TABLE LearningPathEnrollments (
    EnrollmentID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    UserID int NOT NULL,
    PathID int NOT NULL,
    EnrollmentDate datetime NOT NULL,
    CONSTRAINT FK_LearningPathEnrollments_Users FOREIGN KEY (UserID) REFERENCES USERS(UserID),
    CONSTRAINT FK_LearningPathEnrollments_LearningPaths FOREIGN KEY (PathID) REFERENCES LearningPaths(PathID)
);

-- Table: Courses
CREATE TABLE Courses (
    CourseID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Title nvarchar(255) NOT NULL,
    Description nvarchar(255) NOT NULL,
    PathID int NOT NULL,
    CONSTRAINT FK_Courses_LearningPaths FOREIGN KEY (PathID) REFERENCES LearningPaths(PathID)
);

-- Table: PathParts
CREATE TABLE PathParts (
    PartID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    PathID int NOT NULL,
    Title nvarchar(255) NOT NULL,
    Description nvarchar(max) NOT NULL,
    PartOrder int NOT NULL,
    CONSTRAINT FK_PathParts_LearningPaths FOREIGN KEY (PathID) REFERENCES LearningPaths(PathID)
);

-- Table: PartTopics
CREATE TABLE PartTopics (
    TopicID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    PartID int NOT NULL,
    Title nvarchar(255) NOT NULL,
    Content nvarchar(255) NOT NULL,
    CONSTRAINT FK_PartTopics_PathParts FOREIGN KEY (PartID) REFERENCES PathParts(PartID)
);

-- Table: Lessons
CREATE TABLE Lessons (
    LessonID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    TopicID int NOT NULL,
    Title nvarchar(255) NOT NULL,
    Content nvarchar(255) NOT NULL,
    LessonOrder int NOT NULL,
    CONSTRAINT FK_Lessons_PartTopics FOREIGN KEY (TopicID) REFERENCES PartTopics(TopicID)
);

-- Table: Certificates
CREATE TABLE Certificates (
    CertificateID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    UserID int NOT NULL,
    CourseID int NOT NULL,
    IssueDate datetime NOT NULL,
    CertificateLink nvarchar(255) NOT NULL,
    CONSTRAINT FK_Certificates_Users FOREIGN KEY (UserID) REFERENCES USERS(UserID),
    CONSTRAINT FK_Certificates_Courses FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Table: GuidedProjects
CREATE TABLE GuidedProjects (
    GuidedProjectID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CourseID int NOT NULL,
    Title nvarchar(255) NOT NULL,
    Description nvarchar(255) NOT NULL,
    DatasetLink nvarchar(255) NOT NULL,
    CONSTRAINT FK_GuidedProjects_Courses FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Table: Enrollments
CREATE TABLE Enrollments (
    EnrollmentID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    UserID int NOT NULL,
    CourseID int NOT NULL,
    EnrollmentDate datetime NOT NULL,
    CONSTRAINT FK_Enrollments_Users FOREIGN KEY (UserID) REFERENCES USERS(UserID),
    CONSTRAINT FK_Enrollments_Courses FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Table: Progress
CREATE TABLE Progress (
    ProgressID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    UserID int NOT NULL,
    LessonID int NOT NULL,
    Status varchar(20) NOT NULL CHECK (Status IN ('completado', 'en progreso')),  -- Simulación de ENUM
    LastAccessed datetime NOT NULL,
    CONSTRAINT FK_Progress_Users FOREIGN KEY (UserID) REFERENCES USERS(UserID),
    CONSTRAINT FK_Progress_Lessons FOREIGN KEY (LessonID) REFERENCES Lessons(LessonID)
);