--CREACIÓN DE TABLAS--
CREATE TABLE Sede (
	idSede SERIAL PRIMARY KEY NOT NULL,
	nombreSede VARCHAR(300) NOT NULL,
	nivelCategoriaSede1 VARCHAR(300) NULL,
	nivelCategoriaSede2 VARCHAR(300) NULL,
	nivelCategoriaSede3 VARCHAR(300) NULL,
	estado VARCHAR(20) CHECK (estado IN ('Activa', 'Inactiva')),
	departamento VARCHAR(300) NOT NULL,
	municipio VARCHAR(300) NOT NULL,
	direccion VARCHAR(300) NOT NULL,
	telefono BIGINT NOT NULL,
	correoElectronico VARCHAR(300) NOT NULL,
	tipoSede VARCHAR(300) NOT NULL,
	observaciones VARCHAR(300) NOT NULL,
	perfilPersonalizado BOOLEAN NOT NULL DEFAULT FALSE,
	opcionalUnoSede VARCHAR(300) NULL,
	opcionalDosSede VARCHAR(300) NULL,
	opcionalTresSede VARCHAR(300) NULL
);

INSERT INTO Sede (nombreSede,nivelCategoriaSede1,nivelCategoriaSede2,nivelCategoriaSede3,estado,departamento,municipio,direccion,telefono,correoElectronico,tipoSede,observaciones,perfilPersonalizado,opcionalUnoSede,opcionalDosSede,opcionalTresSede) 
	VALUES ('Sede Central','Categoría A','Nivel 1',NULL,'Activa','Antioquia','Medellín','Calle 123 #45-67',3004567890,'contacto@sede-central.com','Administrativa','Sin observaciones',FALSE,NULL,NULL,NULL);

SELECT * FROM Sede
	
CREATE TABLE Trabajador (
	idTrabajador SERIAL PRIMARY KEY NOT NULL,
	primerNombre VARCHAR(300) NOT NULL,
	segundoNombre VARCHAR(300) NULL,
	primerApellido VARCHAR(300) NOT NULL,
	segundoApellido VARCHAR(300) NULL,
	tipoIdentificacion VARCHAR(20) CHECK (tipoIdentificacion IN ('Cédula de ciudadanía', 'Cedula de extranjeria', 'Tarjeta de identidad', 'Pasaporte')),
	numeroIdentificacion VARCHAR(300) NOT NULL,
	fechaNacimiento DATE NOT NULL,
	sexo VARCHAR(300) NOT NULL,
	estadoCivil VARCHAR(300) NULL,
	nivelEscolaridad VARCHAR(300) NULL,
	discapacidad VARCHAR(300) NOT NULL,
	grupoSanguineo VARCHAR(300) NULL,
	tipoVinculacion VARCHAR(300) NOT NULL,
	area VARCHAR(300) NOT NULL,
	cargo VARCHAR(300) NOT NULL,
	correoElectronicoCorporativo VARCHAR(300) NOT NULL,
	departamento VARCHAR(300) NOT NULL,
	municipio VARCHAR(300) NOT NULL,
	direccionResidencia VARCHAR(300) NULL,
	estrato VARCHAR(300) NULL,
	correoElectronicoPersonal VARCHAR(300) NOT NULL,
	telefonoResidencia BIGINT NULL,
	telefonoMovil BIGINT NOT NULL,
	contactoEmergencia VARCHAR(300) NOT NULL,
	telefonoEmergencia BIGINT NOT NULL,
	fechaIngresoEmpresa DATE NOT NULL,
	fechaRetiroEmpresa DATE NULL,
	entidadSalud VARCHAR(300) NOT NULL,
	adminPension VARCHAR(300) NOT NULL,
	turno VARCHAR(300) NOT NULL,
	salario BIGINT NOT NULL,
	dotacion VARCHAR(300) NOT NULL,
	perfilPersonalizado BOOLEAN NOT NULL DEFAULT FALSE,
	opcionalUnoTrabajador VARCHAR(300) NULL,
	opcionalDosTrabajador VARCHAR(300) NULL,
	opcionalTresTrabajador VARCHAR(300) NULL
);

INSERT INTO Trabajador (primerNombre,segundoNombre,primerApellido,segundoApellido,tipoIdentificacion,numeroIdentificacion,fechaNacimiento,sexo,estadoCivil,nivelEscolaridad,discapacidad,grupoSanguineo,tipoVinculacion,area,cargo,correoElectronicoCorporativo,departamento,municipio,direccionResidencia,estrato,correoElectronicoPersonal,telefonoResidencia,telefonoMovil,contactoEmergencia,telefonoEmergencia,fechaIngresoEmpresa,fechaRetiroEmpresa,entidadSalud,adminPension,turno,salario,dotacion,perfilPersonalizado,opcionalUnoTrabajador,opcionalDosTrabajador,opcionalTresTrabajador) 
	VALUES ('Juan','Carlos','Pérez','Gómez','Cédula de ciudadanía','123456789','1985-05-20','Masculino','Soltero','Universitario','Ninguna','O+','Contrato a término indefinido','Finanzas','Analista Financiero','juan.perez@empresa.com','Cundinamarca','Bogotá','Carrera 7 #123-45','3','juan.perez@gmail.com',3123456789,3209876543,'María Pérez',3151234567,'2015-06-15',NULL,'EPS Salud','AFP Fondo de Pensiones','Diurno',3500000,'Uniforme',FALSE,NULL,NULL,NULL);

SELECT * FROM Trabajador
	
CREATE TABLE CampoModificableModulo2 (
	idCampoModificableModulo2 SERIAL PRIMARY KEY NOT NULL,
	nombreCampo VARCHAR(300) NOT NULL,
	estadoCampo VARCHAR(20) CHECK (estadoCampo IN ('Activo', 'Inactivo')),
	tipoCampo VARCHAR(20) CHECK (tipoCampo IN ('VARCHAR', 'INTEGER', 'BIGINT'))
);

INSERT INTO CampoModificableModulo2 (nombreCampo,estadoCampo,tipoCampo) 
	VALUES ('nombreEjemplo','Activo','VARCHAR');

SELECT * FROM CampoModificableModulo2

CREATE TABLE IndicadorModulo2 (
	idIndicadorModulo2 SERIAL PRIMARY KEY NOT NULL,
	nombreIndicador VARCHAR(300) NOT NULL,
	formulaIndicador VARCHAR(300) NOT NULL,
	unidadMedida VARCHAR(300) NOT NULL
);

INSERT INTO IndicadorModulo2 (nombreIndicador,formulaIndicador,unidadMedida) 
	VALUES ('Indicador de Productividad','(Producción Total / Horas Trabajadas) * 100','Porcentaje');

SELECT * FROM IndicadorModulo2

CREATE TABLE ReporteModulo2 (
	idReporteModulo2 SERIAL PRIMARY KEY NOT NULL,
	nombreReporte VARCHAR(300) NOT NULL,
	tipoReporte VARCHAR(300) NOT NULL,
	fechaReporte DATE NOT NULL,
	rangoFechaDesde DATE NOT NULL,
	rangoFechaHasta DATE NOT NULL,
	tipoFormato VARCHAR(20) CHECK (tipoFormato IN ('Excel', 'PDF')) NOT NULL
);

INSERT INTO ReporteModulo2 (nombreReporte,tipoReporte,fechaReporte,rangoFechaDesde,rangoFechaHasta,tipoFormato) 
	VALUES ('Reporte de Ventas','Ventas Mensuales','2024-06-01','2024-05-01','2024-05-31','PDF');

SELECT * FROM ReporteModulo2

CREATE TABLE Sede_Trabajador (
    idSede INTEGER,
    idTrabajador INTEGER,
    CONSTRAINT fk_sede_trabajador FOREIGN KEY (idSede) REFERENCES Sede(idSede),
    CONSTRAINT fk_trabajador_sede FOREIGN KEY (idTrabajador) REFERENCES Trabajador(idTrabajador),
    CONSTRAINT pk_sede_trabajador PRIMARY KEY (idSede, idTrabajador)
);

INSERT INTO Sede_Trabajador (idSede, idTrabajador) VALUES (1, 1);

SELECT * FROM Sede_Trabajador

CREATE TABLE Sede_CampoModificableModulo2 (
    idSede INTEGER,
    idCampoModificableModulo2 INTEGER,
    CONSTRAINT fk_sede_campoModificableModulo2 FOREIGN KEY (idSede) REFERENCES Sede(idSede),
    CONSTRAINT fk_campoModificableModulo2_sede FOREIGN KEY (idCampoModificableModulo2) REFERENCES CampoModificableModulo2(idCampoModificableModulo2),
    CONSTRAINT pk_sede_campoModificableModulo2 PRIMARY KEY (idSede, idCampoModificableModulo2)
);

INSERT INTO Sede_CampoModificableModulo2 (idSede, idCampoModificableModulo2) VALUES (1, 1);

SELECT * FROM Sede_CampoModificableModulo2

CREATE TABLE Trabajador_CampoModificableModulo2 (
    idTrabajador INTEGER,
    idCampoModificableModulo2 INTEGER,
    CONSTRAINT fk_trabajador_campoModificableModulo2 FOREIGN KEY (idTrabajador) REFERENCES Trabajador(idTrabajador),
    CONSTRAINT fk_campoModificableModulo2_trabajador FOREIGN KEY (idCampoModificableModulo2) REFERENCES CampoModificableModulo2(idCampoModificableModulo2),
    CONSTRAINT pk_trabajador_campoModificableModulo2 PRIMARY KEY (idTrabajador, idCampoModificableModulo2)
);

INSERT INTO Trabajador_CampoModificableModulo2(idTrabajador, idCampoModificableModulo2) VALUES (1, 1);

SELECT * FROM Trabajador_CampoModificableModulo2

CREATE TABLE Trabajador_IndicadorModulo2 (
    idTrabajador INTEGER,
    idIndicadorModulo2 INTEGER,
    CONSTRAINT fk_trabajador_indicadorModulo2 FOREIGN KEY (idTrabajador) REFERENCES Trabajador(idTrabajador),
    CONSTRAINT fk_indicadorModulo2_trabajador FOREIGN KEY (idIndicadorModulo2) REFERENCES IndicadorModulo2(idIndicadorModulo2),
    CONSTRAINT pk_trabajador_indicadorModulo2 PRIMARY KEY (idTrabajador, idIndicadorModulo2)
);

INSERT INTO Trabajador_IndicadorModulo2(idTrabajador, idIndicadorModulo2) VALUES (1, 1);

SELECT * FROM Trabajador_IndicadorModulo2

CREATE TABLE ReporteModulo2_IndicadorModulo2 (
    idReporteModulo2 INTEGER,
    idIndicadorModulo2 INTEGER,
    CONSTRAINT fk_reporteModulo2_indicadorModulo2 FOREIGN KEY (idReporteModulo2) REFERENCES ReporteModulo2(idReporteModulo2),
    CONSTRAINT fk_indicadorModulo2_reporteModulo2 FOREIGN KEY (idIndicadorModulo2) REFERENCES IndicadorModulo2(idIndicadorModulo2),
    CONSTRAINT pk_reporteModulo2_indicadorModulo2 PRIMARY KEY (idReporteModulo2, idIndicadorModulo2)
);

INSERT INTO ReporteModulo2_IndicadorModulo2(idReporteModulo2, idIndicadorModulo2) VALUES (1, 1);

SELECT * FROM ReporteModulo2_IndicadorModulo2

CREATE TABLE GrupoSegmentado (
    idGrupoSegmentadoModulo2 SERIAL PRIMARY KEY NOT NULL,
    nombreGrupo VARCHAR(300) NOT NULL,
    rol_id INT
);

INSERT INTO GrupoSegmentado (nombreGrupo, rol_id) VALUES ('Grupo de Prueba', 1);

SELECT * FROM GrupoSegmentado

CREATE TABLE UsuarioModulo2 (
    idUsuarioModulo2 SERIAL PRIMARY KEY NOT NULL,
    nombreUsuario VARCHAR(300) NOT NULL,
	contrasena VARCHAR(300) NOT NULL,
	primerNombre VARCHAR(300) NOT NULL,
	segundoNombre VARCHAR(300) NULL,
	primerApellido VARCHAR(300) NOT NULL,
	segundoApellido VARCHAR(300) NULL,
	tipoIdentificacion VARCHAR(20) CHECK (tipoIdentificacion IN ('Cédula de ciudadanía', 'Cedula de extranjeria', 'Tarjeta de identidad', 'Pasaporte')),
	numeroIdentificacion VARCHAR(300) NOT NULL,
    correoElectronico VARCHAR(300) NOT NULL,
	numeroTelefono BIGINT NOT NULL,
	estado VARCHAR(20) CHECK (estado IN ('Activo', 'Inactivo')),
	perfilPersonalizado BOOLEAN NOT NULL DEFAULT FALSE,
	opcionalUnoUsuarioModulo2 VARCHAR(300) NULL,
	opcionalDosUsuarioModulo2 VARCHAR(300) NULL,
	opcionalTresUsuarioModulo2 VARCHAR(300) NULL,
	rol_id INT,
	empresa_id INT
);

INSERT INTO UsuarioModulo2 (nombreUsuario, contrasena, primerNombre, segundoNombre, primerApellido, segundoApellido, tipoIdentificacion, numeroIdentificacion, correoElectronico, numeroTelefono, estado, perfilPersonalizado, opcionalUnoUsuarioModulo2, opcionalDosUsuarioModulo2, opcionalTresUsuarioModulo2, rol_id, empresa_id) 
	VALUES ('tannia.vega','tannia123','Tannia','Marcela','Vega','Buitrago','Cédula de ciudadanía','1234567890','tannia.vega@gmail.com', 3001234567,'Activo',FALSE,NULL,NULL,NULL,1,23);

SELECT * FROM UsuarioModulo2
	
CREATE TABLE UsuarioModulo2_IndicadorModulo2 (
    idUsuarioModulo2 INTEGER,
    idIndicadorModulo2 INTEGER,
    CONSTRAINT fk_usuarioModulo2_indicadorModulo2 FOREIGN KEY (idUsuarioModulo2) REFERENCES UsuarioModulo2(idUsuarioModulo2),
    CONSTRAINT fk_indicadorModulo2_usuarioModulo2 FOREIGN KEY (idIndicadorModulo2) REFERENCES IndicadorModulo2(idIndicadorModulo2),
    CONSTRAINT pk_usuarioModulo2_indicadorModulo2 PRIMARY KEY (idUsuarioModulo2, idIndicadorModulo2)
);

INSERT INTO UsuarioModulo2_IndicadorModulo2(idUsuarioModulo2, idIndicadorModulo2) VALUES (2, 1);

SELECT * FROM UsuarioModulo2_IndicadorModulo2

CREATE TABLE UsuarioModulo2_CampoModificableModulo2 (
    idUsuarioModulo2 INTEGER,
    idCampoModificableModulo2 INTEGER,
    CONSTRAINT fk_usuarioModulo2_campoModificableModulo2 FOREIGN KEY (idUsuarioModulo2) REFERENCES UsuarioModulo2(idUsuarioModulo2),
    CONSTRAINT fk_campoModificableModulo2_usuarioModulo2 FOREIGN KEY (idCampoModificableModulo2) REFERENCES CampoModificableModulo2(idCampoModificableModulo2),
    CONSTRAINT pk_usuarioModulo2_campoModificableModulo2 PRIMARY KEY (idUsuarioModulo2, idCampoModificableModulo2)
);

INSERT INTO UsuarioModulo2_CampoModificableModulo2(idUsuarioModulo2, idCampoModificableModulo2) VALUES (2, 1);

SELECT * FROM UsuarioModulo2_CampoModificableModulo2

CREATE TABLE NotificacionModulo2 (
    idNotificacionModulo2 SERIAL PRIMARY KEY NOT NULL,
	tituloNotificacion VARCHAR(300) NOT NULL,
	cuerpoNotificacion VARCHAR(300) NOT NULL,
	categoriaNotificacion_id INT,
	idGrupoSegmentadoModulo2 INTEGER,
  	CONSTRAINT fk_notificacion_grupoSegmentado FOREIGN KEY (idGrupoSegmentadoModulo2) REFERENCES GrupoSegmentado(idGrupoSegmentadoModulo2)
);  

INSERT INTO NotificacionModulo2 (tituloNotificacion, cuerpoNotificacion, categoriaNotificacion_id, idGrupoSegmentadoModulo2) 
	VALUES ('Envío de cartas masivas','La presente tiene como objetivo que todos los miembros que reciban esta notificación hagan llegar al área de Talento Humano la carta correspondiente',7,1);

SELECT * FROM NotificacionModulo2
	
CREATE TABLE RegistroEventoModulo2 (
    idRegistroEventoModulo2 SERIAL PRIMARY KEY NOT NULL,
	fechaEvento DATE NOT NULL,
	mensajeEvento VARCHAR(300) NOT NULL,
	modulo_id INT,
	idUsuarioModulo2 INTEGER,
  	CONSTRAINT fk_registroEvento_usuarioModulo2 FOREIGN KEY (idUsuarioModulo2) REFERENCES UsuarioModulo2(idUsuarioModulo2),
	idNotificacionModulo2 INTEGER,
  	CONSTRAINT fk_registroEvento_NotificacionModulo2 FOREIGN KEY (idNotificacionModulo2) REFERENCES NotificacionModulo2(idNotificacionModulo2)
);  

INSERT INTO RegistroEventoModulo2 (fechaEvento,mensajeEvento,modulo_id,idUsuarioModulo2,idNotificacionModulo2) 
	VALUES (CURRENT_DATE,'Evento de prueba',1,2,1);

SELECT * FROM RegistroEventoModulo2

--FUNCIONES--

CREATE OR REPLACE FUNCTION validar_rol(idRol INT) RETURNS BOOLEAN AS $$
DECLARE
    rol_existe BOOLEAN;
BEGIN
    PERFORM dblink_connect('dbname=BD_MOD1_GPP-SOFTWARE host=gpp-software-database.cfm2e6s6mcqr.us-east-2.rds.amazonaws.com user=postgres password=ADS2024ess*');

    SELECT EXISTS(SELECT 1 FROM dblink('SELECT 1 FROM Rol WHERE idRol = ' || idRol) AS t(exists boolean)) INTO rol_existe;

    PERFORM dblink_disconnect();

    RETURN rol_existe;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION check_rol_existe() RETURNS TRIGGER AS $$
BEGIN
    IF NOT validar_rol(NEW.rol_id) THEN
        RAISE EXCEPTION 'El rol con id % no existe en la otra base de datos', NEW.rol_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION validar_empresa(idEmpresa INT) RETURNS BOOLEAN AS $$
DECLARE
    empresa_existe BOOLEAN;
BEGIN
    PERFORM dblink_connect('dbname=BD_MOD1_GPP-SOFTWARE host=gpp-software-database.cfm2e6s6mcqr.us-east-2.rds.amazonaws.com user=postgres password=ADS2024ess*');

    SELECT EXISTS(SELECT 1 FROM dblink('SELECT 1 FROM Empresa WHERE idEmpresa = ' || idEmpresa) AS t(exists boolean)) INTO empresa_existe;

    PERFORM dblink_disconnect();

    RETURN empresa_existe;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION check_empresa_existe() RETURNS TRIGGER AS $$
BEGIN
    IF NOT validar_empresa(NEW.empresa_id) THEN
        RAISE EXCEPTION 'La empresa con id % no existe en la otra base de datos', NEW.empresa_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION validar_categoriaNotificacion(idCategoriaNotificacion INT) RETURNS BOOLEAN AS $$
DECLARE
    categoriaNotificacion_existe BOOLEAN;
BEGIN
    PERFORM dblink_connect('dbname=BD_MOD1_GPP-SOFTWARE host=gpp-software-database.cfm2e6s6mcqr.us-east-2.rds.amazonaws.com user=postgres password=ADS2024ess*');

    SELECT EXISTS(SELECT 1 FROM dblink('SELECT 1 FROM CategoriaNotificacion WHERE idcategorianotificacion = ' || idcategorianotificacion) AS t(exists boolean)) INTO categoriaNotificacion_existe;

    PERFORM dblink_disconnect();

    RETURN categoriaNotificacion_existe;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION check_categoriaNotificacion_existe() RETURNS TRIGGER AS $$
BEGIN
    IF NOT validar_categoriaNotificacion(NEW.categoriaNotificacion_id) THEN
        RAISE EXCEPTION 'La categoria de notificación con id % no existe en la otra base de datos', NEW.categoriaNotificacion_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION validar_modulo(idModulo INT) RETURNS BOOLEAN AS $$
DECLARE
    modulo_existe BOOLEAN;
BEGIN
    PERFORM dblink_connect('dbname=BD_MOD1_GPP-SOFTWARE host=gpp-software-database.cfm2e6s6mcqr.us-east-2.rds.amazonaws.com user=postgres password=ADS2024ess*');

    SELECT EXISTS(SELECT 1 FROM dblink('SELECT 1 FROM Modulo WHERE idModulo = ' || idModulo) AS t(exists boolean)) INTO modulo_existe;

    PERFORM dblink_disconnect();

    RETURN modulo_existe;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION check_modulo_existe() RETURNS TRIGGER AS $$
BEGIN
    IF NOT validar_modulo(NEW.modulo_id) THEN
        RAISE EXCEPTION 'El modulo con id % no existe en la otra base de datos', NEW.modulo_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--TRIGGERS--

CREATE TRIGGER trg_check_rol_existe
BEFORE INSERT OR UPDATE ON GrupoSegmentado
FOR EACH ROW
EXECUTE FUNCTION check_rol_existe();

CREATE TRIGGER trg_check_rol_existe_usuario
BEFORE INSERT OR UPDATE ON UsuarioModulo2
FOR EACH ROW
EXECUTE FUNCTION check_rol_existe();

CREATE TRIGGER trg_check_empresa_existe
BEFORE INSERT OR UPDATE ON UsuarioModulo2
FOR EACH ROW
EXECUTE FUNCTION check_empresa_existe();

CREATE TRIGGER trg_check_categoriaNotificacion_existe
BEFORE INSERT OR UPDATE ON NotificacionModulo2
FOR EACH ROW
EXECUTE FUNCTION check_categoriaNotificacion_existe();

CREATE TRIGGER trg_check_modulo_existe
BEFORE INSERT OR UPDATE ON RegistroEventoModulo2
FOR EACH ROW
EXECUTE FUNCTION check_modulo_existe();

CREATE EXTENSION dblink;