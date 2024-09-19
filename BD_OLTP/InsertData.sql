--Selection of Database
USE learning_platform

INSERT INTO dbo.USERS (Name, Email, Password, Role, DateJoined) VALUES
('Alice Johnson', 'alice.johnson@example.com', 'hashedpw123', 'Student', GETDATE()),
('Bob Lee', 'bob.lee@example.com', 'hashedpw456', 'Instructor', GETDATE()),
('Catherine Nguyen', 'catherine.nguyen@example.com', 'hashedpw789', 'Admin', GETDATE()),
('David Kim', 'david.kim@example.com', 'hashedpw101', 'Student', GETDATE()),
('Eva Martinez', 'eva.martinez@example.com', 'hashedpw112', 'Instructor', GETDATE());

INSERT INTO dbo.LearningPaths (Title, Description) VALUES
('Data Science Path', 'A comprehensive path covering data science topics.'),
('Web Development Path', 'Learn how to build modern web applications.'),
('AI and Machine Learning Path', 'Dive into the world of AI and machine learning.'),
('Cloud Computing Path', 'Understand cloud services and deployment strategies.'),
('Cybersecurity Path', 'Learn how to protect systems and networks.');

INSERT INTO dbo.Courses (Title, Description, PathID) VALUES
('Introduction to Python', 'Learn the basics of Python programming.', 1),
('Advanced Python for Data Science', 'Deep dive into data science with Python.', 1),
('HTML & CSS Basics', 'Learn how to build static web pages.', 2),
('JavaScript Essentials', 'Master the fundamentals of JavaScript.', 2),
('Machine Learning Basics', 'Introduction to machine learning concepts.', 3);

INSERT INTO dbo.PathParts (PathID, Title, Description, PartOrder) VALUES
(1, 'Getting Started with Python', 'Introduction to Python and its applications.', 1),
(2, 'Frontend Basics', 'Learn the basics of HTML and CSS.', 1),
(3, 'Backend Development', 'Introduction to server-side programming.', 2),
(3, 'Advanced Machine Learning', 'Explore advanced machine learning topics.', 3),
(4, 'Cloud Basics', 'Introduction to cloud computing concepts.', 1);

INSERT INTO dbo.PartTopics (PartID, Title, Content) VALUES
(1, 'Python Syntax and Semantics', 'Learn about Python syntax and basic programming concepts.'),
(2, 'HTML Basics', 'Introduction to HTML and building basic web pages.'),
(3, 'CSS Styling', 'Learn how to style web pages using CSS.'),
(4, 'Supervised Learning', 'Understand supervised learning algorithms and their applications.'),
(5, 'Cloud Services', 'Introduction to cloud service providers and their offerings.');

INSERT INTO dbo.Lessons (TopicID, Title, Content, LessonOrder) VALUES
(1, 'Introduction to Python', 'Overview of Python programming language.', 1),
(2, 'Creating Your First Web Page', 'Build your first webpage using HTML.', 1),
(3, 'CSS Selectors', 'Learn how to use CSS selectors for styling.', 1),
(4, 'Linear Regression', 'Introduction to linear regression and its implementation.', 1),
(5, 'Cloud Deployment Models', 'Understand different cloud deployment models.', 1);

INSERT INTO dbo.GuidedProjects (CourseID, Title, Description, DatasetLink) VALUES
(1, 'Python Data Analysis Project', 'Analyze a dataset using Python.', 'https://example.com/datasets/python_data.csv'),
(2, 'Web Page Design Project', 'Create a responsive webpage.', 'https://example.com/datasets/web_design.zip'),
(3, 'Machine Learning Model', 'Build a machine learning model using a dataset.', 'https://example.com/datasets/ml_data.csv'),
(4, 'Cloud Service Deployment', 'Deploy an application using cloud services.', 'https://example.com/datasets/cloud_deploy.zip'),
(5, 'Cybersecurity Attack Simulation', 'Simulate and defend against a cybersecurity attack.', 'https://example.com/datasets/cyber_attack.zip');

INSERT INTO dbo.PortfolioProjects (UserID, Title, Description, DatasetLink, SubmissionLink, Feedback) VALUES
(1, 'Python Data Cleaning', 'Clean and preprocess data using Python.', 'https://example.com/datasets/data_cleaning.csv', 'https://example.com/submit/project1', 'Great job on data cleaning!'),
(2, 'Personal Portfolio Website', 'Create a personal portfolio using HTML and CSS.', 'https://example.com/datasets/portfolio.zip', 'https://example.com/submit/project2', 'Well-designed website.'),
(1, 'Machine Learning Classifier', 'Build a classifier using scikit-learn.', 'https://example.com/datasets/classifier.csv', 'https://example.com/submit/project3', 'Good implementation of the classifier.'),
(3, 'Cloud Storage Setup', 'Set up and manage cloud storage for a web application.', 'https://example.com/datasets/cloud_storage.zip', 'https://example.com/submit/project4', 'Excellent cloud setup.'),
(4, 'Network Security Simulation', 'Simulate network security scenarios.', 'https://example.com/datasets/security_sim.zip', 'https://example.com/submit/project5', 'Effective security measures.'),
(1, 'Python Web Scraper', 'Build a web scraper using Python.', 'https://example.com/datasets/web_scraper.csv', 'https://example.com/submit/project6', 'Efficient web scraper.'),
(2, 'JavaScript Calculator', 'Create a simple calculator using JavaScript.', 'https://example.com/datasets/calculator.zip', 'https://example.com/submit/project7', 'Interactive calculator.'),
(5, 'AI Chatbot', 'Develop an AI chatbot using Python.', 'https://example.com/datasets/chatbot.zip', 'https://example.com/submit/project8', 'Innovative chatbot.'),
(4, 'Database Design', 'Design a relational database for an e-commerce site.', 'https://example.com/datasets/database_design.zip', 'https://example.com/submit/project9', 'Well-structured database.'),
(3, 'Cloud Computing Project', 'Deploy a cloud-based application.', 'https://example.com/datasets/cloud_computing.zip', 'https://example.com/submit/project10', 'Successful cloud deployment.');

INSERT INTO dbo.LearningPathEnrollments (UserID, PathID, EnrollmentDate) VALUES
(1, 1, GETDATE()),
(2, 2, GETDATE()),
(3, 3, GETDATE()),
(4, 4, GETDATE()),
(5, 5, GETDATE()),
(1, 3, GETDATE()),
(2, 4, GETDATE()),
(3, 1, GETDATE()),
(4, 2, GETDATE()),
(5, 3, GETDATE());

INSERT INTO dbo.Enrollments (UserID, CourseID, EnrollmentDate) VALUES
(1, 1, DATEADD(DAY, -10, GETDATE())),  -- Hace 10 d�as
(2, 2, DATEADD(DAY, -9, GETDATE())),   -- Hace 9 d�as
(3, 3, DATEADD(DAY, -8, GETDATE())),   -- Hace 8 d�as
(4, 4, DATEADD(DAY, -7, GETDATE())),   -- Hace 7 d�as
(5, 5, DATEADD(DAY, -6, GETDATE())),   -- Hace 6 d�as
(1, 2, DATEADD(DAY, -5, GETDATE())),   -- Hace 5 d�as
(2, 3, DATEADD(DAY, -4, GETDATE())),   -- Hace 4 d�as
(3, 4, DATEADD(DAY, -3, GETDATE())),   -- Hace 3 d�as
(4, 5, DATEADD(DAY, -2, GETDATE())),   -- Hace 2 d�as
(5, 1, DATEADD(DAY, -1, GETDATE()));   -- Ayer

INSERT INTO dbo.Progress (UserID, LessonID, Status, LastAccessed) VALUES
(1, 1, 'en progreso', GETDATE()),
(2, 2, 'completado', GETDATE()),
(3, 3, 'en progreso', GETDATE()),
(4, 4, 'completado', GETDATE()),
(5, 5, 'en progreso', GETDATE()),
(1, 2, 'completado', GETDATE()),
(2, 3, 'en progreso', GETDATE()),
(3, 4, 'completado', GETDATE()),
(4, 5, 'en progreso', GETDATE()),
(5, 1, 'completado', GETDATE());

INSERT INTO dbo.Certificates (UserID, CourseID, IssueDate, CertificateLink) VALUES
(1, 1, GETDATE(), 'https://example.com/certificates/certificate1.pdf'),
(2, 2, GETDATE(), 'https://example.com/certificates/certificate2.pdf'),
(3, 3, GETDATE(), 'https://example.com/certificates/certificate3.pdf'),
(4, 4, GETDATE(), 'https://example.com/certificates/certificate4.pdf'),
(5, 5, GETDATE(), 'https://example.com/certificates/certificate5.pdf'),
(1, 2, GETDATE(), 'https://example.com/certificates/certificate6.pdf'),
(2, 3, GETDATE(), 'https://example.com/certificates/certificate7.pdf'),
(3, 4, GETDATE(), 'https://example.com/certificates/certificate8.pdf'),
(4, 5, GETDATE(), 'https://example.com/certificates/certificate9.pdf'),
(5, 1, GETDATE(), 'https://example.com/certificates/certificate10.pdf');


-- Insertar en la tabla intermedia PathCourses

INSERT INTO dbo.PathCourses (PathID, CourseID) VALUES 
(1, 1), 
(1, 2), 
(2, 3),
(2, 4), 
(3, 5),
(1, 3), 
(2, 5), 
(3, 1), 
(4, 4), 
(5, 5); 

SELECT * FROM Certificates

