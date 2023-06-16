-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2023 a las 22:20:29
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `valyoodb`
--
create database valyoodb;
use valyoodb;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personarol`
--

CREATE TABLE `personarol` (
  `PRID` int(11) NOT NULL,
  `PRPersona` int(11) NOT NULL,
  `PRRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personarol`
--

INSERT INTO `personarol` (`PRID`, `PRPersona`, `PRRol`) VALUES
(3, 1001204736, 3),
(5, 123456789, 2),
(6, 12345678, 1),
(7, 12345678, 2),
(8, 12345678, 3),
(9, 1234567, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcuentacredito`
--

CREATE TABLE `tblcuentacredito` (
  `CuNumero` int(11) NOT NULL,
  `CuFechaRegistro` date NOT NULL,
  `CuEstado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `CuPersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblcuentacredito`
--

INSERT INTO `tblcuentacredito` (`CuNumero`, `CuFechaRegistro`, `CuEstado`, `CuPersona`) VALUES
(1, '2001-03-04', 'Inactivo', 1001204736),
(2, '2022-03-12', 'Activo', 1234567);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldocumento`
--

CREATE TABLE `tbldocumento` (
  `DocID` int(11) NOT NULL,
  `DocNombre` varchar(60) NOT NULL,
  `DocURL` varchar(60) NOT NULL,
  `DocPersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbldocumento`
--

INSERT INTO `tbldocumento` (`DocID`, `DocNombre`, `DocURL`, `DocPersona`) VALUES
(1, 'Cedula 150', 'sdasdadsa', 1001204736),
(2, 'prueba', 'dsasd', 1001204736),
(3, 'mimamamma', 'asdfdfafasds', 12345678),
(4, 'pruebas', 'sdasdadsa', 1001204736);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpago`
--

CREATE TABLE `tblpago` (
  `PagoID` int(11) NOT NULL,
  `PagDescripcion` varchar(30) NOT NULL,
  `PagValor` double NOT NULL,
  `PagPrestamo` int(11) NOT NULL,
  `PagFecha` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblpago`
--

INSERT INTO `tblpago` (`PagoID`, `PagDescripcion`, `PagValor`, `PagPrestamo`, `PagFecha`) VALUES
(4, 'Cuota 1 ', 12, 2, '2023-03-23 23:04:10.000000'),
(5, 'Cuota 2', 12, 3, '2023-03-23 23:04:10.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpersona`
--

CREATE TABLE `tblpersona` (
  `PerDocumento` int(11) NOT NULL,
  `PerTipoDocumento` varchar(45) NOT NULL,
  `PerNombre` varchar(30) NOT NULL,
  `PerApellido` varchar(30) NOT NULL,
  `PerCorreo` varchar(50) NOT NULL,
  `PerTelefono` varchar(25) NOT NULL,
  `PerDireccion` varchar(50) NOT NULL,
  `PerClave` varchar(100) NOT NULL,
  `PerSede` int(11) DEFAULT NULL,
  `PerEstado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblpersona`
--

INSERT INTO `tblpersona` (`PerDocumento`, `PerTipoDocumento`, `PerNombre`, `PerApellido`, `PerCorreo`, `PerTelefono`, `PerDireccion`, `PerClave`, `PerSede`, `PerEstado`) VALUES
(1234567, 'CC', 'Mateo', 'Alvarez', 'a', '3123545124', 'Calle 01', '123', 1, 'Activo'),
(12345678, 'CC', 'Jean', 'Garcia', 'b', '3122231233', 'Calle 45', '123', 1, 'Activo'),
(123456789, 'CC', 'Miguel', 'Gil', 'c', '3112222222', 'Calle 23', '123', 1, 'Activo'),
(1001204736, 'Cedula de Ciudadania', 'Juan David', 'Ducuara Molina', 'd', '3116053435', 'Calle 65 sur 102-51', '123', 1, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblprestamo`
--

CREATE TABLE `tblprestamo` (
  `PreID` int(11) NOT NULL,
  `PreFechaInicio` date NOT NULL,
  `PreFechaFin` date NOT NULL,
  `PreCuotas` int(11) NOT NULL,
  `PreMonto` double NOT NULL,
  `PreInteres` double NOT NULL,
  `PreCuenta` int(11) NOT NULL,
  `PreEstado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblprestamo`
--

INSERT INTO `tblprestamo` (`PreID`, `PreFechaInicio`, `PreFechaFin`, `PreCuotas`, `PreMonto`, `PreInteres`, `PreCuenta`, `PreEstado`) VALUES
(2, '2023-03-23', '2023-03-23', 12, 10000, 1, 1, 'Inactivo'),
(3, '2023-03-23', '2023-03-23', 12, 100000, 1.5, 2, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblrol`
--

CREATE TABLE `tblrol` (
  `rolID` int(11) NOT NULL,
  `rolNombre` varchar(30) NOT NULL,
  `rolEstado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblrol`
--

INSERT INTO `tblrol` (`rolID`, `rolNombre`, `rolEstado`) VALUES
(1, 'Administrador', 'Activo'),
(2, 'Supervisor', 'Activo'),
(3, 'Secretario', 'Activo'),
(4, 'Deudor', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblsede`
--

CREATE TABLE `tblsede` (
  `sedeID` int(11) NOT NULL,
  `sedeNombre` varchar(30) NOT NULL,
  `sedeDireccion` varchar(50) NOT NULL,
  `sedeTelefono` varchar(25) NOT NULL,
  `sedeEstado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblsede`
--

INSERT INTO `tblsede` (`sedeID`, `sedeNombre`, `sedeDireccion`, `sedeTelefono`, `sedeEstado`) VALUES
(1, 'Acacias', 'calle 23', '123123123', 'Activo'),
(2, 'Yopal Casanana', 'jfdsjffdsjdfsmj', '12345677', 'Activo'),
(3, 'YOYOYOYOY', 'jfdsjffdsjdfsmj', '12345677', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblsolicitud`
--

CREATE TABLE `tblsolicitud` (
  `SolID` int(11) NOT NULL,
  `SolMonto` double NOT NULL,
  `SolCuotas` double NOT NULL,
  `SolEstado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `SolPersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblsolicitud`
--

INSERT INTO `tblsolicitud` (`SolID`, `SolMonto`, `SolCuotas`, `SolEstado`, `SolPersona`) VALUES
(1, 1000, 12, 'Inactivo', 1001204736),
(2, 100000, 12, 'Activo', 1234567);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `personarol`
--
ALTER TABLE `personarol`
  ADD PRIMARY KEY (`PRID`),
  ADD KEY `fk_PRPersona` (`PRPersona`),
  ADD KEY `fk_PRRol` (`PRRol`);

--
-- Indices de la tabla `tblcuentacredito`
--
ALTER TABLE `tblcuentacredito`
  ADD PRIMARY KEY (`CuNumero`),
  ADD UNIQUE KEY `CuPersona` (`CuPersona`);

--
-- Indices de la tabla `tbldocumento`
--
ALTER TABLE `tbldocumento`
  ADD PRIMARY KEY (`DocID`),
  ADD KEY `fk_DocPersona` (`DocPersona`);

--
-- Indices de la tabla `tblpago`
--
ALTER TABLE `tblpago`
  ADD PRIMARY KEY (`PagoID`),
  ADD KEY `fk_PagPrestamo` (`PagPrestamo`);

--
-- Indices de la tabla `tblpersona`
--
ALTER TABLE `tblpersona`
  ADD PRIMARY KEY (`PerDocumento`),
  ADD UNIQUE KEY `PerCorreo` (`PerCorreo`),
  ADD KEY `fk_Sede` (`PerSede`);

--
-- Indices de la tabla `tblprestamo`
--
ALTER TABLE `tblprestamo`
  ADD PRIMARY KEY (`PreID`),
  ADD KEY `PreCuenta` (`PreCuenta`);

--
-- Indices de la tabla `tblrol`
--
ALTER TABLE `tblrol`
  ADD PRIMARY KEY (`rolID`),
  ADD UNIQUE KEY `rolNombre` (`rolNombre`),
  ADD UNIQUE KEY `rolNombre_2` (`rolNombre`);

--
-- Indices de la tabla `tblsede`
--
ALTER TABLE `tblsede`
  ADD PRIMARY KEY (`sedeID`),
  ADD UNIQUE KEY `sedeNombre` (`sedeNombre`);

--
-- Indices de la tabla `tblsolicitud`
--
ALTER TABLE `tblsolicitud`
  ADD PRIMARY KEY (`SolID`),
  ADD KEY `fk_SolPersona` (`SolPersona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personarol`
--
ALTER TABLE `personarol`
  MODIFY `PRID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tblcuentacredito`
--
ALTER TABLE `tblcuentacredito`
  MODIFY `CuNumero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbldocumento`
--
ALTER TABLE `tbldocumento`
  MODIFY `DocID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tblpago`
--
ALTER TABLE `tblpago`
  MODIFY `PagoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tblprestamo`
--
ALTER TABLE `tblprestamo`
  MODIFY `PreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tblrol`
--
ALTER TABLE `tblrol`
  MODIFY `rolID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tblsede`
--
ALTER TABLE `tblsede`
  MODIFY `sedeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tblsolicitud`
--
ALTER TABLE `tblsolicitud`
  MODIFY `SolID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `personarol`
--
ALTER TABLE `personarol`
  ADD CONSTRAINT `fk_PRPersona` FOREIGN KEY (`PRPersona`) REFERENCES `tblpersona` (`PerDocumento`),
  ADD CONSTRAINT `fk_PRRol` FOREIGN KEY (`PRRol`) REFERENCES `tblrol` (`rolID`);

--
-- Filtros para la tabla `tblcuentacredito`
--
ALTER TABLE `tblcuentacredito`
  ADD CONSTRAINT `Fk_CuPersona` FOREIGN KEY (`CuPersona`) REFERENCES `tblpersona` (`PerDocumento`);

--
-- Filtros para la tabla `tbldocumento`
--
ALTER TABLE `tbldocumento`
  ADD CONSTRAINT `fk_DocPersona` FOREIGN KEY (`DocPersona`) REFERENCES `tblpersona` (`PerDocumento`);

--
-- Filtros para la tabla `tblpago`
--
ALTER TABLE `tblpago`
  ADD CONSTRAINT `fk_PagPrestamo` FOREIGN KEY (`PagPrestamo`) REFERENCES `tblprestamo` (`PreID`);

--
-- Filtros para la tabla `tblpersona`
--
ALTER TABLE `tblpersona`
  ADD CONSTRAINT `fk_Sede` FOREIGN KEY (`PerSede`) REFERENCES `tblsede` (`sedeID`);

--
-- Filtros para la tabla `tblprestamo`
--
ALTER TABLE `tblprestamo`
  ADD CONSTRAINT `tblprestamo_ibfk_1` FOREIGN KEY (`PreCuenta`) REFERENCES `tblcuentacredito` (`CuNumero`);

--
-- Filtros para la tabla `tblsolicitud`
--
ALTER TABLE `tblsolicitud`
  ADD CONSTRAINT `fk_SolPersona` FOREIGN KEY (`SolPersona`) REFERENCES `tblpersona` (`PerDocumento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


create view listarPersonaRolView as
select personarol.`PRID` 
AS personarol_PRID, concat(PerNombre,' ',PerApellido) 
AS nombreUsuario, tblrol.`rolNombre` 
AS nombreRol 
FROM `tblpersona` tblpersona 
INNER JOIN `personarol` personarol 
ON tblpersona.`PerDocumento` = personarol.`PRPersona`
INNER JOIN `tblrol` tblrol ON personarol.`PRRol` = tblrol.`rolID`;

Select * from listarPersonaRolView;

create view listarCuentasView as
select CuNumero, CuFechaRegistro, CuEstado, concat(PerNombre, ' ', PerApellido) 'Titular'
from tblcuentacredito cu 
inner join tblpersona per
on cu.CuPersona = per.PerDocumento;

select * from listarCuentasView;

create view listarDocumentosView as
select tbldocumento.`DocID` 
AS tbldocumento_DocID, tbldocumento.`DocNombre` 
AS tbldocumento_DocNombre, tbldocumento.`DocURL` 
AS tbldocumento_DocURL, concat(PerNombre,' ',PerApellido) 
AS tblpersona_PerNombre
from `tblpersona` tblpersona 
inner join `tbldocumento` tbldocumento on tblpersona.`PerDocumento` = tbldocumento.`DocPersona`;

select * from listarDocumentosView;

create view listarPagosView as
select PagoID, PagDescripcion, PagValor, concat(PerNombre, ' ', PerApellido) 'Deudor', PagFecha
from((tblpago pag 
inner join tblprestamo pres
on pag.PagPrestamo = pres.PreID)
inner join tblcuentacredito cu
on pres.PreCuenta = cu.CuNumero)
inner join tblpersona per
on cu.CuPersona = per.PerDocumento;

select * from listarPagosView;

create view listarPrestamosView as
select PreID, PreFechaInicio,PreFechaFin, PreCuotas, PreMonto, PreInteres, concat(PerNombre, ' ', PerApellido) 'Deudor', PreEstado
from(tblprestamo pres
inner join tblcuentacredito cu
on pres.PreCuenta = cu.CuNumero)
inner join tblpersona per
on cu.CuPersona = per.PerDocumento;

select * from listarPrestamosView;

create view listarSolicitudesView as
select tblsolicitud.`SolID` AS tblsolicitud_SolID,
tblsolicitud.`SolMonto` AS tblsolicitud_SolMonto,
tblsolicitud.`SolCuotas` AS tblsolicitud_SolCuotas,
tblsolicitud.`SolEstado` AS tblsolicitud_SolEstado,
concat(PerNombre,' ',PerApellido) AS nombreUsuario
FROM `tblpersona` tblpersona INNER JOIN `tblsolicitud` tblsolicitud ON tblpersona.`PerDocumento` = tblsolicitud.`SolPersona`;

select * from listarSolicitudesView;

create view cuentasactivasview as
select CuNumero, CuFechaRegistro, CuEstado, concat(PerNombre, ' ', PerApellido) 'Titular'
from tblcuentacredito cu 
inner join tblpersona per
on cu.CuPersona = per.PerDocumento
where CuEstado = 'Activo';

select * from cuentasactivasview;

create view prestamosactivosview as
select PreID, PreFechaInicio,PreFechaFin, PreCuotas, PreMonto, PreInteres, concat(PerNombre, ' ', PerApellido) 'Deudor', PreEstado
from(tblprestamo pres
inner join tblcuentacredito cu
on pres.PreCuenta = cu.CuNumero)
inner join tblpersona per
on cu.CuPersona = per.PerDocumento
where PreEstado = 'Activo';

select * from prestamosactivosview;