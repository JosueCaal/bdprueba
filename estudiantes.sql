Go 
use BDEstudiante
go


-- Tabla de Estudiantes
CREATE TABLE Estudiantes (
    EstudianteID INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    FechaNacimiento DATE,
    Direccion VARCHAR(100),
    Telefono VARCHAR(20)
);

-- Tabla de Asignaturas
CREATE TABLE Asignaturas (
    AsignaturaID INT  PRIMARY KEY,
    NombreAsignatura VARCHAR(100) NOT NULL
);

-- Tabla de Notas
CREATE TABLE Notas (
    NotaID INT  PRIMARY KEY,
    EstudianteID INT,
    AsignaturaID INT,
    Calificacion DECIMAL(5, 2) NOT NULL,
    FechaCalificacion DATE,
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (AsignaturaID) REFERENCES Asignaturas(AsignaturaID)
);

-- Tabla de Profesores
CREATE TABLE Profesores (
    ProfesorID INT  PRIMARY KEY,
    NombreProfesor VARCHAR(50) NOT NULL,
    AsignaturaID INT,
    FOREIGN KEY (AsignaturaID) REFERENCES Asignaturas(AsignaturaID)
);

-- Tabla de Cursos
CREATE TABLE Cursos (
    CursoID INT  PRIMARY KEY,
    NombreCurso VARCHAR(100) NOT NULL
);

-- Tabla de Inscripciones
CREATE TABLE Inscripciones (
    InscripcionID INT PRIMARY KEY,
    EstudianteID INT,
    CursoID INT,
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);
-- Insertar datos de estudiantes
INSERT INTO Estudiantes (EstudianteID, Nombre, Apellido, FechaNacimiento, Direccion, Telefono)
VALUES (1,'Juan', 'Pérez', '2002-03-15', '123 Calle Principal', '555-123-4567');

INSERT INTO Estudiantes (EstudianteID, Nombre, Apellido, FechaNacimiento, Direccion, Telefono)
VALUES (2,'María', 'González', '2001-08-21', '456 Avenida Central', '555-987-6543');

INSERT INTO Estudiantes (EstudianteID, Nombre, Apellido, FechaNacimiento, Direccion, Telefono)
VALUES (3,'Luis', 'Martínez', '2003-05-10', '789 Calle Secundaria', '555-456-7890');

select * from Estudiantes

-- Insertar datos de asignaturas
INSERT INTO Asignaturas (AsignaturaID, NombreAsignatura)
VALUES (1, 'Matemáticas');

INSERT INTO Asignaturas (AsignaturaID,NombreAsignatura)
VALUES (2,'Historia');

INSERT INTO Asignaturas (AsignaturaID,NombreAsignatura)
VALUES (3,'Ciencias');

select * from Asignaturas

INSERT INTO Notas (NotaID, EstudianteID, AsignaturaID, Calificacion, FechaCalificacion)
VALUES (1,1, 1, 9.5, '2023-10-15');

INSERT INTO Notas (NotaID,EstudianteID, AsignaturaID, Calificacion, FechaCalificacion)
VALUES (2,2, 1, 8.0, '2023-10-15');

INSERT INTO Notas (NotaID,EstudianteID, AsignaturaID, Calificacion, FechaCalificacion)
VALUES (3,3, 1, 7.5, '2023-10-15');

select * from Estudiantes


SELECT
    Estudiantes.Nombre AS NombreEstudiante,
    Cursos.NombreCurso AS Curso,
    Notas.Calificacion AS NotaObtenida
FROM
    Notas
    INNER JOIN Estudiantes ON Notas.EstudianteID = Estudiantes.EstudianteID
    INNER JOIN Cursos ON Estudiantes.EstudianteID = Cursos.CursoID
WHERE
    Estudiantes.EstudianteID = 1;
