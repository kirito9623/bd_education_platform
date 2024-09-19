USE learning_platform;
GO

-- Creación de la vista para poblar la dimension tiempo

CREATE VIEW VW_DIMENSION_TIEMPO AS
SELECT 
    DAY(EnrollmentDate) AS dia,
    MONTH(EnrollmentDate) AS mes,
    DATEPART(QUARTER, EnrollmentDate) AS trimestre,
    YEAR(EnrollmentDate) AS año
FROM Enrollments;


SELECT * FROM VW_DIMENSION_TIEMPO;
SELECT COUNT(*) AS TotalFilas FROM Enrollments;



-- Consulta para poblar la dimensión estudiante
CREATE VIEW VW_DIMENSION_ESTUDIANTE AS
SELECT DISTINCT
    UserID AS EstudianteID,
    CAST(Name AS NVARCHAR(255)) AS Nombre,
    CAST(Email AS NVARCHAR(255)) AS Mail,
    CAST(Role AS NVARCHAR(255)) AS Rol
FROM USERS;


SELECT * FROM VW_DIMENSION_ESTUDIANTE;

DROP VIEW VW_DIMENSION_ESTUDIANTE



CREATE VIEW VW_DIMENSION_CURSO AS
SELECT DISTINCT
    CourseID AS CursoID,
    Title AS Nombre,
    Description AS Descripcion
FROM Courses;

DROP VIEW VW_DIMENSION_CURSO

SELECT * FROM VW_DIMENSION_CURSO;




CREATE VIEW VW_DIMENSION_ACTIVIDAD AS
SELECT DISTINCT
    1 AS ActivityID,
    CAST('Lección Completada' AS NVARCHAR(255)) AS NombreActividad
FROM Lessons
UNION ALL
SELECT DISTINCT
    2 AS ActivityID,
    CAST('Proyecto Guiado Completado' AS NVARCHAR(255)) AS NombreActividad
FROM GuidedProjects
UNION ALL
SELECT DISTINCT
    3 AS ActivityID,
    CAST('Certificado Emitido' AS NVARCHAR(255)) AS NombreActividad
FROM Certificates
UNION ALL
SELECT DISTINCT
    4 AS ActivityID,
    CAST('Progreso en Lección' AS NVARCHAR(255)) AS NombreActividad
FROM Progress;

SELECT * FROM VW_DIMENSION_ACTIVIDAD;
DROP VIEW VW_DIMENSION_ACTIVIDAD;





--TABLA HECHOS DE ACTIVIDAD

CREATE VIEW VW_TABLA_DE_HECHOS_DE_ACTIVIDAD AS
SELECT 
    CAST(E.EnrollmentDate AS int) AS Fecha,
    E.UserID AS EstudianteID,
    C.CourseID AS CursoID,
    1 AS TipoActividad,  -- Lección Completada
    DATEDIFF(minute, P.LastAccessed, GETDATE()) AS Duración,
    1 AS NumeroActividades,
    NULL AS Puntuación,
    0 AS Progresoantes,
    100 AS Progresodespues
FROM Progress P
JOIN Enrollments E ON P.UserID = E.UserID
JOIN Courses C ON E.CourseID = C.CourseID
WHERE P.Status = 'completado'

UNION ALL

SELECT 
    NULL AS Fecha,  -- Fecha no disponible para GuidedProjects
    E.UserID AS EstudianteID,
    C.CourseID AS CursoID,
    2 AS TipoActividad,  -- Proyecto Guiado Completado
    NULL AS Duración,
    1 AS NumeroActividades,
    NULL AS Puntuación,
    NULL AS Progresoantes,
    NULL AS Progresodespues
FROM GuidedProjects G
JOIN Enrollments E ON G.CourseID = E.CourseID
JOIN Courses C ON G.CourseID = C.CourseID

UNION ALL

SELECT 
    CAST(Cert.IssueDate AS datetime) AS Fecha,
    Cert.UserID AS EstudianteID,
    Cert.CourseID AS CursoID,
    3 AS TipoActividad,  -- Certificado Emitido
    NULL AS Duración,
    1 AS NumeroActividades,
    NULL AS Puntuación,
    NULL AS Progresoantes,
    NULL AS Progresodespues
FROM Certificates Cert;


SELECT * FROM VW_TABLA_DE_HECHOS_DE_ACTIVIDAD;


DROP VIEW  VW_TABLA_DE_HECHOS_DE_ACTIVIDAD;

SELECT @@VERSION;
