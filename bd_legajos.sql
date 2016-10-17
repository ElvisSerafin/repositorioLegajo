CREATE TABLE Persona (
  idPersona INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Nombres VARCHAR(50) NULL,
  Apellidos VARCHAR(50) NULL,
  clave VARCHAR(40) NULL,
  Direccion VARCHAR(100) NULL,
  Celular VARCHAR(9) NULL,
  FechaNac DATE NULL,
  Lugar VARCHAR(100) NULL,
  EstadoCivil VARCHAR(20) NULL,
  Nacionalidad VARCHAR(100) NULL,
  Documento VARCHAR(20) NULL,
  Foto VARCHAR(200) NULL,
  Partida_naci VARCHAR(200) NULL,
  Docum_identoCarne VARCHAR(200) NULL,
  CertificadoSalud VARCHAR(200) NULL,
  CertAntecedentes VARCHAR(200) NULL,
  ColegiaturaDoc VARCHAR(200) NULL,
  PRIMARY KEY(idPersona)
);

CREATE TABLE Privilegio (
  idPrivilegio INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  NOMBRE VARCHAR(20) NULL,
  ESTADO CHAR(1) NULL,
  PRIMARY KEY(idPrivilegio)
);

CREATE TABLE Rol (
  idRol INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  NOMBRE VARCHAR(20) NULL,
  ESTADO CHAR(1) NULL,
  PRIMARY KEY(idRol)
);

CREATE TABLE LINK (
  idLINK INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  LINK VARCHAR(250) NULL,
  ICON VARCHAR(25) NULL,
  ORDEN INTEGER UNSIGNED NULL,
  ESTADO CHAR(1) NULL,
  PRIMARY KEY(idLINK)
);

CREATE TABLE Investigacion (
  idInvestigacion INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Anho DATE NULL,
  Titulo VARCHAR(50) NULL,
  Nresolucion VARCHAR(50) NULL,
  PRIMARY KEY(idInvestigacion),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE PremiosRec (
  idPremiosRec INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Fecha DATE NULL,
  Institucion VARCHAR(50) NULL,
  Reconocimiento VARCHAR(60) NULL,
  Lugar VARCHAR(60) NULL,
  PRIMARY KEY(idPremiosRec),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE Programas (
  idProgramas INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Anho DATE NULL,
  Titulo VARCHAR(60) NULL,
  Beneficiarios INTEGER UNSIGNED NULL,
  Nparticipante INTEGER UNSIGNED NULL,
  Lugar VARCHAR(60) NULL,
  PRIMARY KEY(idProgramas),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona) 
);

CREATE TABLE TIC (
  idTIC INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Curso VARCHAR(50) NULL,
  Dominio VARCHAR(50) NULL,
  Modalidad VARCHAR(30) NULL,
  Institucion VARCHAR(40) NULL,
  Certificado VARCHAR(200) NULL,
  PRIMARY KEY(idTIC),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE Usuario (
  idUsuario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Persona_idPersona INTEGER UNSIGNED NOT NULL,
  Usuario VARCHAR(40) NULL,
  Clave VARCHAR(40) NULL,
  tipoUsuario VARCHAR(50) NULL,
  PRIMARY KEY(idUsuario, Persona_idPersona),
  INDEX Usuario_FKIndex1(Persona_idPersona),
  FOREIGN KEY(Persona_idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE PublicLibros (
  idPublicLibros INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Nlibros INTEGER UNSIGNED NULL,
  Titulo VARCHAR(50) NULL,
  TipoLibro VARCHAR(50) NULL,
  Comentario VARCHAR(200) NULL,
  Anho DATE NULL,
  PRIMARY KEY(idPublicLibros),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE ProySocialExtension (
  idProySocialExtension INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Anho DATE NULL,
  TituloActividad VARCHAR(100) NULL,
  Poblacion INTEGER UNSIGNED NULL,
  Lugar VARCHAR(50) NULL,
  TipoActiv VARCHAR(60) NULL,
  PRIMARY KEY(idProySocialExtension),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE PublicaArt (
  idPublicaArt INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Anho DATE NULL,
  TipoPublica VARCHAR(50) NULL,
  Titulo VARCHAR(60) NULL,
  NombreMedio VARCHAR(50) NULL,
  Editorial VARCHAR(50) NULL,
  ISBN_ISNN VARCHAR(50) NULL,
  Npaginas INTEGER UNSIGNED NULL,
  Lugar VARCHAR(50) NULL,
  PRIMARY KEY(idPublicaArt),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE CapacitacionFormalDocencia (
  idCapacitacionFormal INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Anho DATE NULL,
  Tipo VARCHAR(50) NULL,
  Titulo VARCHAR(50) NULL,
  Institucion VARCHAR(50) NULL,
  FechaIni DATE NULL,
  FechaFin DATE NULL,
  Horas INTEGER UNSIGNED NULL,
  Lugar VARCHAR(60) NULL,
  PRIMARY KEY(idCapacitacionFormal),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE AsesoriaInvest (
  idAsesoriaInvest INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Anho DATE NULL,
  Nivel VARCHAR(50) NULL,
  Titulo VARCHAR(50) NULL,
  Autor VARCHAR(100) NULL,
  Especialidad VARCHAR(100) NULL,
  Resolucion VARCHAR(100) NULL,
  PRIMARY KEY(idAsesoriaInvest),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE CursosEventos (
  idCursosEventos INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Anho VARCHAR(40) NULL,
  Evento VARCHAR(50) NULL,
  TipoEvento VARCHAR(50) NULL,
  EntidadOrganiza VARCHAR(100) NULL,
  Horas_Creditos VARCHAR(50) NULL,
  Lugar VARCHAR(50) NULL,
  PRIMARY KEY(idCursosEventos),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE Categoria_docente (
  idCategoria_docente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Institucion VARCHAR(50) NULL,
  Categoria VARCHAR(50) NULL,
  Fecha_ini DATE NULL,
  fecha_fin DATE NULL,
  Total_Tiempo VARCHAR(20) NULL,
  Lugar VARCHAR(40) NULL,
  PRIMARY KEY(idCategoria_docente),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE Docencia_Univers (
  idDocencia_Univers INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Institucion  VARCHAR(50) NULL,
  Categoria VARCHAR(20) NULL,
  FECHA_INI DATE NULL,
  FECHA_FIN DATE NULL,
  TotalTiempo VARCHAR(40) NULL,
  Lugar VARCHAR(50) NULL,
  PRIMARY KEY(idDocencia_Univers),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE FormacionAcadeProfe (
  idFormacionAcadeProfe INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Institucion VARCHAR(50) NULL,
  Grado VARCHAR(50) NULL,
  Especialidad VARCHAR(50) NULL,
  FechaInicio DATE NULL,
  FchaFin DATE NULL,
  Estado VARCHAR(20) NULL,
  Documentacion VARCHAR(200) NULL,
  PRIMARY KEY(idFormacionAcadeProfe),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE Idioma (
  idIdiomas INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Idioma VARCHAR(50) NULL,
  Nivel  VARCHAR(50) NULL,
  Dominio VARCHAR(50) NULL,
  Insititucion VARCHAR(50) NULL,
  Anho INTEGER UNSIGNED NULL,
  Cerificado VARCHAR(200) NULL,
  PRIMARY KEY(idIdiomas),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE Exp_administrativa (
  idExp_administrativa INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Institucion VARCHAR(50) NULL,
  Cargo VARCHAR(50) NULL,
  Regimen VARCHAR(40) NULL,
  Fechaini DATE NULL,
  Fechafin DATE NULL,
  Resolucion VARCHAR(50)NULL,
  Lugar VARCHAR(60) NULL,
  DocumentAdjunt VARCHAR(200) NULL,
  PRIMARY KEY(idExp_administrativa),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE Exp_Profesional (
  idExp_Profesional INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPersona INTEGER UNSIGNED NOT NULL,
  Institucion VARCHAR(100) NULL,
  Cargo VARCHAR(100) NULL,
  Tipo VARCHAR(50) NULL,
  Fecha_INIC DATE NULL,
  Fecha_fin DATE NULL,
  Total_Tiempo VARCHAR(20) NULL,
  Lugar VARCHAR(50) NULL,
  Documentacion VARCHAR(200) NULL,
  PRIMARY KEY(idExp_Profesional),
  FOREIGN KEY(idPersona)
    REFERENCES Persona(idPersona)
);

CREATE TABLE DET_ROL (
  idDET_ROL INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idRol INTEGER UNSIGNED NOT NULL,
  Persona_idPersona INTEGER UNSIGNED NOT NULL,
  idUsuario INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idDET_ROL),
  FOREIGN KEY(idUsuario, Persona_idPersona)
    REFERENCES Usuario(idUsuario, Persona_idPersona),
  FOREIGN KEY(idRol)
    REFERENCES Rol(idRol)
);

CREATE TABLE DET_PRIVILEGIO (
  idPrivilegio INTEGER UNSIGNED NOT NULL,
  idRol INTEGER UNSIGNED NOT NULL,
  FOREIGN KEY(idRol)
    REFERENCES Rol(idRol),
  FOREIGN KEY(idPrivilegio)
    REFERENCES Privilegio(idPrivilegio)
);

CREATE TABLE DET_LINK (
  idDET_LINK INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPrivilegio INTEGER UNSIGNED NOT NULL,
  idLINK INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idDET_LINK),
  FOREIGN KEY(idLINK)
    REFERENCES LINK(idLINK),
  FOREIGN KEY(idPrivilegio)
    REFERENCES Privilegio(idPrivilegio)
);

