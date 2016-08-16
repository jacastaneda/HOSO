-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-08-2016 a las 20:14:22
-- Versión del servidor: 5.7.13-0ubuntu0.16.04.2
-- Versión de PHP: 7.0.8-0ubuntu0.16.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hosouees`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Administrador', '1', 1470816368),
('Estudiante', '2', 1470881064);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('Administrador', 1, 'Administrador', NULL, NULL, 1470816328, 1470953365),
('Coordinador', 1, 'Coordinador de proyectos de horas sociales', NULL, NULL, 1470880648, 1470880855),
('CrearFacultades', 2, 'Permite acceder al mantenimiento de facultades en el sistema', NULL, NULL, 1470953345, 1470953345),
('CrearProyectos', 2, 'Registrar proyectos de horas sociales disponibles', NULL, NULL, 1470880828, 1470880828),
('Estudiante', 1, 'Estudiante de la UEES', NULL, NULL, 1470880684, 1470880684),
('Supervisor', 1, 'Supervisor de proyectos de horas sociales', NULL, NULL, 1470880665, 1470880665);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('Administrador', 'CrearFacultades'),
('Administrador', 'CrearProyectos'),
('Coordinador', 'CrearProyectos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `IdCarrera` int(11) NOT NULL COMMENT 'Codigo identificador de la carrera',
  `Nombre` varchar(100) NOT NULL COMMENT 'nombre de la carrera',
  `NombreCorto` varchar(100) DEFAULT NULL COMMENT 'nombre corto de la carrera',
  `IdFacultad` int(11) DEFAULT NULL COMMENT 'Codigo identificador de la facultad',
  `EstadoRegistro` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunicacion`
--

CREATE TABLE `comunicacion` (
  `IdComunicacion` int(11) NOT NULL,
  `IdPersonaRemitente` int(11) NOT NULL COMMENT 'ID de la taba de personas, del emisor del mensaje',
  `Comentarios` varchar(500) NOT NULL COMMENT 'Cuerpo del mensaje',
  `FechaHora` varchar(45) DEFAULT NULL COMMENT 'FEcha y hora del registro en la BD',
  `RutaAdjunto1` varchar(150) DEFAULT NULL COMMENT 'Ruta en el sistema de archivos del archivo adjunto 1',
  `RutaAdjunto2` varchar(150) DEFAULT NULL,
  `IdProyecto` int(11) NOT NULL,
  `EstadoRegistro` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Para establecer los datos de comunicacion entre los asesores y participantes de los proyectos';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosProyecto`
--

CREATE TABLE `estadosProyecto` (
  `IdEstadoProyecto` int(11) NOT NULL,
  `EstadoProyecto` varchar(45) DEFAULT NULL,
  `EstadoRegistro` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalogo de estados de los proyectos';

--
-- Volcado de datos para la tabla `estadosProyecto`
--

INSERT INTO `estadosProyecto` (`IdEstadoProyecto`, `EstadoProyecto`, `EstadoRegistro`) VALUES
(1, 'Abierto', '1'),
(2, 'En proceso', '1'),
(3, 'Suspendido', '1'),
(4, 'Cancelado', '1'),
(5, 'Finalizado', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `IdFacultad` int(11) NOT NULL COMMENT 'Codigo identificador de la facultad',
  `Nombre` varchar(100) NOT NULL COMMENT 'Nombre de la facultad',
  `Descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripcion de la facultad',
  `NombreCorto` varchar(10) NOT NULL COMMENT 'Nombre corto o acronimo de la facultad',
  `IdUniversidad` int(11) DEFAULT NULL COMMENT 'Codigo identificador de la institucion',
  `EstadoRegistro` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`IdFacultad`, `Nombre`, `Descripcion`, `NombreCorto`, `IdUniversidad`, `EstadoRegistro`) VALUES
(4, 'Facultad de Ingeniería y Arquitectura', '', 'FIYA', 1, '1'),
(5, 'Medicina', 'Facuktad de medicina', 'FACMED', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horas`
--

CREATE TABLE `horas` (
  `IdPersona` int(11) NOT NULL COMMENT 'Codigo Identificador de la persona o estudiante',
  `IdProyecto` int(11) NOT NULL COMMENT 'Codigo de identificacion del proyecto',
  `HorasRealizadas` int(11) NOT NULL DEFAULT '0' COMMENT 'Detalle de horas realizadas',
  `HorasRestantes` int(11) NOT NULL DEFAULT '0' COMMENT 'Detalle de horas faltantes',
  `ProyectosRealizados` varchar(150) DEFAULT NULL COMMENT 'Nombre de los proyectos realizados',
  `PersonaActiva` char(1) NOT NULL DEFAULT '0' COMMENT '1-> Indica que la asignacion de la paersona al grupo de trabajo es activo (utiliza un cupo), 0-> Inactiva',
  `EstadoRegistro` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion`
--

CREATE TABLE `institucion` (
  `IdInstitucion` int(11) NOT NULL COMMENT 'Codigo identificador de la institucion',
  `Nombre` varchar(50) NOT NULL COMMENT 'Nombre institucion',
  `Siglas` varchar(15) DEFAULT NULL COMMENT 'Siglas de la institucion',
  `SitioWeb` varchar(45) DEFAULT NULL COMMENT 'Sitio web de la institucion',
  `EstadoRegistro` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `institucion`
--

INSERT INTO `institucion` (`IdInstitucion`, `Nombre`, `Siglas`, `SitioWeb`, `EstadoRegistro`) VALUES
(1, 'Ministerio de Educacion', 'MINED', 'mined.com', '1'),
(2, 'Ministerio de Salud', 'MINSAL', 'minsal.gob.sv', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `IdMenu` int(11) NOT NULL COMMENT 'Codigo de identificacion del menu',
  `Titulo` varchar(50) NOT NULL COMMENT 'Titulo del menu',
  `Descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripcion del menu',
  `IdPadre` varchar(11) NOT NULL COMMENT 'Codigo identificador del padre',
  `Url` varchar(250) NOT NULL COMMENT 'Url del menu',
  `EstadoRegistro` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1470595889),
('m140506_102106_rbac_init', 1470814793),
('m140608_173539_create_user_table', 1470595909),
('m140611_133903_init_rbac', 1470595911),
('m140808_073114_create_auth_item_group_table', 1470595913),
('m140809_072112_insert_superadmin_to_user', 1470595914),
('m140809_073114_insert_common_permisison_to_auth_item', 1470595914),
('m141023_141535_create_user_visit_log', 1470595915),
('m141116_115804_add_bind_to_ip_and_registration_ip_to_user', 1470595916),
('m141121_194858_split_browser_and_os_column', 1470595917),
('m141201_220516_add_email_and_email_confirmed_to_user', 1470595919),
('m141207_001649_create_basic_user_permissions', 1470595920),
('m150703_191015_init', 1470815060);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametro`
--

CREATE TABLE `parametro` (
  `IdParametro` int(11) NOT NULL COMMENT 'Codigo identificador del parametro',
  `Valor` varchar(1000) DEFAULT NULL COMMENT 'Valor del parametro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `IdPerfil` int(11) NOT NULL COMMENT 'Codigo de identificacion del perfil',
  `Descripcion` varchar(45) DEFAULT NULL COMMENT 'Descripcion del perfil',
  `EstadoRegistro` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfildetalle`
--

CREATE TABLE `perfildetalle` (
  `IdPerfil` int(11) NOT NULL COMMENT 'Codigo de identificacion del perfil',
  `IdMenu` int(11) NOT NULL COMMENT 'Codigo identificador del menu',
  `Seleccionar` bit(1) DEFAULT NULL COMMENT 'Seleccion del perfil',
  `Insertar` bit(1) DEFAULT NULL COMMENT 'Opcion del perfil insertar',
  `Actualizar` bit(1) DEFAULT NULL COMMENT 'Opcion del perfil actualizar',
  `Eliminar` bit(1) DEFAULT NULL COMMENT 'Opcion del perfil eliminar',
  `Imprimir` bit(1) DEFAULT NULL COMMENT 'Opcion del perfil imprimir',
  `Activo` bit(1) DEFAULT NULL COMMENT 'Estado del perfil',
  `EstadoRegistro` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `IdPersona` int(11) NOT NULL COMMENT 'Codigo de identificacion de la persona o estudiante',
  `Nombres` varchar(100) NOT NULL COMMENT 'Nombre de la persona o estudiante',
  `Apellidos` varchar(100) NOT NULL COMMENT 'apellidos de la persona o estudiante',
  `CarnetEstudiante` varchar(100) DEFAULT NULL COMMENT 'Carnet del estudiante',
  `CarnetEmpleado` varchar(100) DEFAULT NULL COMMENT 'Carnet del empleado',
  `DUI` varchar(10) DEFAULT NULL COMMENT 'DUI de la persona o estudiante',
  `NIT` varchar(17) DEFAULT NULL COMMENT 'NIT de la persona o estudiante',
  `Direccion` varchar(10) DEFAULT NULL COMMENT 'Direccion de la persona u estudiante',
  `Telefono` varchar(8) DEFAULT NULL COMMENT 'Telefono de la persona u estudiante',
  `Sexo` char(1) NOT NULL COMMENT 'Sexo de la persona o estudiante',
  `Cargo` varchar(25) DEFAULT NULL COMMENT 'Codigo identificador del cargo',
  `UserId` int(11) NOT NULL,
  `EstadoRegistro` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `IdProyecto` int(11) NOT NULL COMMENT 'Codigo de identificacion del proyecto',
  `NombreProyecto` varchar(150) NOT NULL COMMENT 'Nombre del Proyecto',
  `HorasSolicitadas` int(11) DEFAULT NULL COMMENT 'Horas a realizar',
  `Ubicacion` varchar(150) NOT NULL COMMENT 'Ubicacion del proyecto',
  `FechaIni` date DEFAULT NULL COMMENT 'Fecha de inicio del proyecto',
  `FechaFin` date DEFAULT NULL COMMENT 'Fecha de finalizacion del proyecto',
  `IdInstitucion` int(11) NOT NULL,
  `IdEstadoProyecto` int(11) NOT NULL,
  `IdPersonaAsesor` int(11) DEFAULT NULL COMMENT 'ID de la tabla personas, del asesor del proyecto',
  `NumeroPersonas` int(11) NOT NULL COMMENT 'Numero de personas requeridas simultaneamente para realizar el proyecto',
  `EstadoRegistro` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `universidad`
--

CREATE TABLE `universidad` (
  `IdUniversidad` int(11) NOT NULL COMMENT 'Codigo Identificador de la universidad',
  `Nombre` varchar(100) NOT NULL COMMENT 'Nombre de la universidad',
  `NombreCorto` varchar(10) NOT NULL COMMENT 'Nombre corto de la universidad',
  `Mision` varchar(1000) DEFAULT NULL COMMENT 'Mision de la universidad',
  `Vision` varchar(1000) DEFAULT NULL COMMENT 'Vision de la universidad',
  `CorreoElectronico` varchar(45) DEFAULT NULL COMMENT 'Correo electronico de la universidad',
  `Telefono` varchar(10) DEFAULT NULL COMMENT 'Telefono de la universidad',
  `Direccion` varchar(500) DEFAULT NULL COMMENT 'Direccion de la universidad',
  `Url` varchar(250) DEFAULT NULL COMMENT 'URL de la universidad',
  `Logo` varchar(250) DEFAULT NULL COMMENT 'Logo de la universidad',
  `EstadoRegistro` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `universidad`
--

INSERT INTO `universidad` (`IdUniversidad`, `Nombre`, `NombreCorto`, `Mision`, `Vision`, `CorreoElectronico`, `Telefono`, `Direccion`, `Url`, `Logo`, `EstadoRegistro`) VALUES
(1, 'Universidad Evangelica de El Salvador', 'UEES', 'mision', 'vision', 'uees@uees.com', '22009988', 'direccion', 'uees.com', 'logo', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `auth_key` varchar(255) NOT NULL DEFAULT '123123',
  `administrator` int(11) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `creator_ip` varchar(40) DEFAULT NULL,
  `confirm_token` varchar(255) DEFAULT NULL,
  `recovery_token` varchar(255) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `login`, `username`, `password_hash`, `auth_key`, `administrator`, `creator`, `creator_ip`, `confirm_token`, `recovery_token`, `blocked_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES
(1, 'jcastanedaalarcon@gmail.com', 'jcastaneda', '$2y$13$cyTaKC4kw99trKRHt1/JoegESCLcCLY1Uwlya5q0VLSQhKM4YST2W', '123123', 1, -2, 'Local', NULL, NULL, NULL, 1470815537, 1470815537, 1470816036),
(2, 'mail@mail.com', 'CA201010', '$2y$13$V8EvMsI/OUrPVRMSitK6Du9Yu4HCDqH14nLmrbVeY979VL0/jl3z.', '123123', 0, 1, '127.0.0.1', NULL, NULL, NULL, 1470881021, 1470881021, -1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IdUsuario` int(11) NOT NULL COMMENT 'Codigo de identificacion del usuario',
  `InicioSesion` varchar(50) NOT NULL COMMENT 'Inicio de sesion a la aplicacion',
  `Nombres` varchar(100) DEFAULT NULL COMMENT 'Nombre del usuario',
  `Apellidos` varchar(100) DEFAULT NULL COMMENT 'Apellidos del usuario',
  `Activos` char(1) DEFAULT '1' COMMENT 'Identificador del estado activo',
  `Clave` varchar(100) NOT NULL COMMENT 'clave o password de ingreso',
  `IdPerfil` int(11) NOT NULL,
  `EstadoRegistro` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indices de la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indices de la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indices de la tabla `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`IdCarrera`),
  ADD KEY `IdFacultad_idx` (`IdFacultad`);

--
-- Indices de la tabla `comunicacion`
--
ALTER TABLE `comunicacion`
  ADD PRIMARY KEY (`IdComunicacion`),
  ADD KEY `fk_comunicacion_proyecto1_idx` (`IdProyecto`);

--
-- Indices de la tabla `estadosProyecto`
--
ALTER TABLE `estadosProyecto`
  ADD PRIMARY KEY (`IdEstadoProyecto`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`IdFacultad`),
  ADD KEY `IdInstitucion_idx` (`IdUniversidad`);

--
-- Indices de la tabla `horas`
--
ALTER TABLE `horas`
  ADD PRIMARY KEY (`IdPersona`,`IdProyecto`),
  ADD KEY `fk_horas_proyecto1_idx` (`IdProyecto`);

--
-- Indices de la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`IdInstitucion`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`IdMenu`,`IdPadre`);

--
-- Indices de la tabla `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `parametro`
--
ALTER TABLE `parametro`
  ADD PRIMARY KEY (`IdParametro`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`IdPerfil`);

--
-- Indices de la tabla `perfildetalle`
--
ALTER TABLE `perfildetalle`
  ADD PRIMARY KEY (`IdPerfil`,`IdMenu`),
  ADD KEY `IdMenu_idx` (`IdMenu`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`IdPersona`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`IdProyecto`),
  ADD KEY `fk_proyecto_institucion1_idx` (`IdInstitucion`),
  ADD KEY `fk_proyecto_estadosProyecto1_idx` (`IdEstadoProyecto`);

--
-- Indices de la tabla `universidad`
--
ALTER TABLE `universidad`
  ADD PRIMARY KEY (`IdUniversidad`);

--
-- Indices de la tabla `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_unique_login` (`login`),
  ADD UNIQUE KEY `user_unique_username` (`username`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IdUsuario`),
  ADD KEY `fk_usuario_perfil1_idx` (`IdPerfil`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `IdCarrera` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo identificador de la carrera';
--
-- AUTO_INCREMENT de la tabla `comunicacion`
--
ALTER TABLE `comunicacion`
  MODIFY `IdComunicacion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estadosProyecto`
--
ALTER TABLE `estadosProyecto`
  MODIFY `IdEstadoProyecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `facultad`
--
ALTER TABLE `facultad`
  MODIFY `IdFacultad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo identificador de la facultad', AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `institucion`
--
ALTER TABLE `institucion`
  MODIFY `IdInstitucion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo identificador de la institucion', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `IdMenu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de identificacion del menu';
--
-- AUTO_INCREMENT de la tabla `parametro`
--
ALTER TABLE `parametro`
  MODIFY `IdParametro` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo identificador del parametro';
--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `IdPerfil` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de identificacion del perfil';
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `IdPersona` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de identificacion de la persona o estudiante';
--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `IdProyecto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de identificacion del proyecto';
--
-- AUTO_INCREMENT de la tabla `universidad`
--
ALTER TABLE `universidad`
  MODIFY `IdUniversidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo Identificador de la universidad', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de identificacion del usuario';
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD CONSTRAINT `IdFacultad` FOREIGN KEY (`IdFacultad`) REFERENCES `facultad` (`IdFacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comunicacion`
--
ALTER TABLE `comunicacion`
  ADD CONSTRAINT `fk_comunicacion_proyecto1` FOREIGN KEY (`IdProyecto`) REFERENCES `proyecto` (`IdProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD CONSTRAINT `IdInstitucion` FOREIGN KEY (`IdUniversidad`) REFERENCES `universidad` (`IdUniversidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `horas`
--
ALTER TABLE `horas`
  ADD CONSTRAINT `IdPersona` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_horas_proyecto1` FOREIGN KEY (`IdProyecto`) REFERENCES `proyecto` (`IdProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `perfildetalle`
--
ALTER TABLE `perfildetalle`
  ADD CONSTRAINT `IdMenu` FOREIGN KEY (`IdMenu`) REFERENCES `menu` (`IdMenu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_perfildetalle_perfil1` FOREIGN KEY (`IdPerfil`) REFERENCES `perfil` (`IdPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `fk_proyecto_estadosProyecto1` FOREIGN KEY (`IdEstadoProyecto`) REFERENCES `estadosProyecto` (`IdEstadoProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_institucion1` FOREIGN KEY (`IdInstitucion`) REFERENCES `institucion` (`IdInstitucion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_perfil1` FOREIGN KEY (`IdPerfil`) REFERENCES `perfil` (`IdPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
