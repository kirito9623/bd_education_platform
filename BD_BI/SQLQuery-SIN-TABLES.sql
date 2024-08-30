USE sin_learning_platform_datawarehouse
GO

CREATE TABLE Dimension_Tiempo (
    FechaID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Día int NOT NULL,
    Mes int NOT NULL,
    Trimestre int NOT NULL,
    Año int NOT NULL
);

CREATE TABLE Dimension_Estudiante (
    EstudianteID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Nombre nvarchar(255) NOT NULL,
    Direccion nvarchar(255) NOT NULL,
    Segmento nvarchar(255) NOT NULL
);

CREATE TABLE Dimension_Curso (
    CursoID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Nombre nvarchar(255) NOT NULL,
    Categoria nvarchar(255) NOT NULL,
    Nivel int NOT NULL
);

CREATE TABLE Dimension_Actividad (
    TipoActividad int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    NombreActividad nvarchar(255) NOT NULL
);

CREATE TABLE Tabla_de_Hechos_de_Actividad (
    ActividadID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    FechaID int NOT NULL,
    EstudianteID int NOT NULL,
    CursoID int NOT NULL,
    TipoActividad int NOT NULL,
    Duración int NOT NULL,
    NumeroActividades int NOT NULL,
    Puntuación decimal(18,2) NOT NULL,
    Progresoantes decimal(18,2) NOT NULL,
    Progresodespues decimal(18,2) NOT NULL,
    CONSTRAINT FK_Hechos_Tiempo FOREIGN KEY (FechaID) REFERENCES Dimension_Tiempo(FechaID),
    CONSTRAINT FK_Hechos_Estudiante FOREIGN KEY (EstudianteID) REFERENCES Dimension_Estudiante(EstudianteID),
    CONSTRAINT FK_Hechos_Curso FOREIGN KEY (CursoID) REFERENCES Dimension_Curso(CursoID),
    CONSTRAINT FK_Hechos_Actividad FOREIGN KEY (TipoActividad) REFERENCES Dimension_Actividad(TipoActividad)
);
