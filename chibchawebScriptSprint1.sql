-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2025 a las 22:00:50
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `chibchaweb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credencialcuenta`
--

CREATE TABLE `credencialcuenta` (
  `IDCUENTA` varchar(15) NOT NULL,
  `IDCREDENCIALCUENTA` varchar(15) NOT NULL,
  `CONTRASENACUENTA` varchar(30) NOT NULL,
  `ACTIVOCUENTA` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credencialempleado`
--

CREATE TABLE `credencialempleado` (
  `IDEMPLEADO` varchar(3) NOT NULL,
  `IDCREDENCIALEMPLEADO` varchar(15) NOT NULL,
  `CONTRASENAEMPLEADO` varchar(30) NOT NULL,
  `ACTIVOEMPLEADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `IDCUENTA` varchar(15) NOT NULL,
  `IDPAIS` decimal(3,0) NOT NULL,
  `IDTIPOCUENTA` decimal(2,0) NOT NULL,
  `IDPLAN` varchar(15) DEFAULT NULL,
  `IDENTIFICACION` varchar(15) NOT NULL,
  `NOMBRECUENTA` varchar(150) NOT NULL,
  `CORREO` varchar(50) NOT NULL,
  `TELEFONO` int(11) NOT NULL,
  `FECHAREGISTRO` date NOT NULL,
  `DIRECCION` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentadominio`
--

CREATE TABLE `cuentadominio` (
  `IDCUENTADOMINIO` varchar(10) NOT NULL,
  `IDCUENTA` varchar(15) NOT NULL,
  `IDDOMINIO` varchar(150) NOT NULL,
  `FECHAADQUISICION` date NOT NULL,
  `FECHAVIGENCIA` date NOT NULL,
  `VIGENTE` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentametodospago`
--

CREATE TABLE `cuentametodospago` (
  `IDCUENTA` varchar(15) NOT NULL,
  `IDMETODOPAGO` decimal(2,0) NOT NULL,
  `IDCUENTAMETODOSPAGO` varchar(3) NOT NULL,
  `IDTARJETA` varchar(15) DEFAULT NULL,
  `ACTIVOCUANTAMETODOPAGO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dominio`
--

CREATE TABLE `dominio` (
  `IDDOMINIO` varchar(150) NOT NULL,
  `NOMBREPAGINA` varchar(150) NOT NULL,
  `PRECIODOMINIO` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `IDEMPLEADO` varchar(3) NOT NULL,
  `IDTIPOEMPLEADO` decimal(2,0) NOT NULL,
  `IDPAIS` decimal(3,0) DEFAULT NULL,
  `NOMBREEMPLEADO` varchar(15) NOT NULL,
  `APELLIDOEMPLEADO` varchar(15) NOT NULL,
  `CORREOEMPLEADO` varchar(30) NOT NULL,
  `TELEFONOEMPLEADO` decimal(10,0) NOT NULL,
  `IDENTIFICACIONEMPLEADO` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `IDFACTURA` int(11) NOT NULL,
  `IDCUENTA` varchar(15) DEFAULT NULL,
  `IDMETODOPAGO` decimal(2,0) DEFAULT NULL,
  `IDCUENTAMETODOSPAGO` varchar(3) DEFAULT NULL,
  `FECHAPAGO` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturadominio`
--

CREATE TABLE `facturadominio` (
  `IDFACTURA` int(11) NOT NULL,
  `IDDOMINIO` varchar(150) NOT NULL,
  `IDFACTURADOMINIO` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturapaquete`
--

CREATE TABLE `facturapaquete` (
  `IDPAQUETEHOSTING` varchar(3) NOT NULL,
  `IDFACTURA` int(11) NOT NULL,
  `IDFACTURAPAQUETE` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodopago`
--

CREATE TABLE `metodopago` (
  `IDMETODOPAGO` decimal(2,0) NOT NULL,
  `NOMBREMETODOPAGO` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodopago`
--

INSERT INTO `metodopago` (`IDMETODOPAGO`, `NOMBREMETODOPAGO`) VALUES
(1, 'TARJETA'),
(2, 'PSE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `IDPAIS` decimal(3,0) NOT NULL,
  `NOMBREPAIS` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`IDPAIS`, `NOMBREPAIS`) VALUES
(76, 'BRASIL'),
(170, 'COLOMBIA'),
(218, 'ECUADOR'),
(604, 'PERÚ'),
(862, 'VENEZUELA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetehosting`
--

CREATE TABLE `paquetehosting` (
  `IDPAQUETEHOSTING` varchar(3) NOT NULL,
  `CANTIDADSITIOS` decimal(4,0) NOT NULL,
  `NOMBREPAQUETEHOSTING` varchar(20) NOT NULL,
  `BD` decimal(4,0) NOT NULL,
  `GBENSSD` decimal(4,0) NOT NULL,
  `CORREOS` decimal(3,0) NOT NULL,
  `CERTIFICADOSSSLHTTPS` decimal(3,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paquetehosting`
--

INSERT INTO `paquetehosting` (`IDPAQUETEHOSTING`, `CANTIDADSITIOS`, `NOMBREPAQUETEHOSTING`, `BD`, `GBENSSD`, `CORREOS`, `CERTIFICADOSSSLHTTPS`) VALUES
('1', 1, 'PLATA', 2, 10, 10, 1),
('2', 2, 'PLATINO', 20, 20, 20, 2),
('3', 5, 'ORO', 0, 60, 60, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodicidadpago`
--

CREATE TABLE `periodicidadpago` (
  `IDPERIODICIDADPAGO` decimal(2,0) NOT NULL,
  `NOMBREPERIODICIDAD` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `periodicidadpago`
--

INSERT INTO `periodicidadpago` (`IDPERIODICIDADPAGO`, `NOMBREPERIODICIDAD`) VALUES
(1, 'MENSUAL'),
(2, 'SEMESTRAL'),
(3, 'ANUAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodicidadpreciopaquete`
--

CREATE TABLE `periodicidadpreciopaquete` (
  `IDPERIODICIDADPAGO` decimal(2,0) NOT NULL,
  `IDPAQUETEHOSTING` varchar(3) NOT NULL,
  `IDPERIODICIDADPRECIOPAQUETE` varchar(10) NOT NULL,
  `PRECIO` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `periodicidadpreciopaquete`
--

INSERT INTO `periodicidadpreciopaquete` (`IDPERIODICIDADPAGO`, `IDPAQUETEHOSTING`, `IDPERIODICIDADPRECIOPAQUETE`, `PRECIO`) VALUES
(1, '1', '1', 3.00),
(1, '2', '4', 5.00),
(1, '3', '7', 11.00),
(2, '1', '2', 15.00),
(2, '2', '5', 25.00),
(2, '3', '8', 55.00),
(3, '1', '3', 30.00),
(3, '2', '6', 50.00),
(3, '3', '9', 110.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

CREATE TABLE `plan` (
  `IDPLAN` varchar(15) NOT NULL,
  `NOMBREPLAN` varchar(15) NOT NULL,
  `Comision` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plan`
--

INSERT INTO `plan` (`IDPLAN`, `NOMBREPLAN`, `Comision`) VALUES
('0', 'Sin plan', 0),
('1', 'Básico', 10),
('2', 'Premium', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicituddominio`
--

CREATE TABLE `solicituddominio` (
  `IDSOLICITUD` varchar(5) NOT NULL,
  `IDSOLICITUDESTADO` varchar(10) NOT NULL,
  `IDDOMINIO` varchar(150) NOT NULL,
  `FECHASOLICITUD` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudestado`
--

CREATE TABLE `solicitudestado` (
  `IDSOLICITUDESTADO` varchar(10) NOT NULL,
  `IDTIPOESTADO` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `IDTARJETA` varchar(15) NOT NULL,
  `IDTIPOTARJETA` decimal(2,0) NOT NULL,
  `NUMEROTARJETA` decimal(15,0) NOT NULL,
  `CCV` decimal(3,0) NOT NULL,
  `FECHAVTO` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocuenta`
--

CREATE TABLE `tipocuenta` (
  `IDTIPOCUENTA` decimal(2,0) NOT NULL,
  `NOMBRETIPO` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipocuenta`
--

INSERT INTO `tipocuenta` (`IDTIPOCUENTA`, `NOMBRETIPO`) VALUES
(1, 'CLIENTE'),
(2, 'DISTRIBUIDOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoempleado`
--

CREATE TABLE `tipoempleado` (
  `IDTIPOEMPLEADO` decimal(2,0) NOT NULL,
  `NOMBRETIPOEMPLEADO` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipoempleado`
--

INSERT INTO `tipoempleado` (`IDTIPOEMPLEADO`, `NOMBRETIPOEMPLEADO`) VALUES
(1, 'ADMIN'),
(2, 'SOPORTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoestadossolicitud`
--

CREATE TABLE `tipoestadossolicitud` (
  `IDTIPOESTADO` varchar(3) NOT NULL,
  `NOMBREESTADO` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipotarjeta`
--

CREATE TABLE `tipotarjeta` (
  `IDTIPOTARJETA` decimal(2,0) NOT NULL,
  `NOMBRETIPOTARJETA` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipotarjeta`
--

INSERT INTO `tipotarjeta` (`IDTIPOTARJETA`, `NOMBRETIPOTARJETA`) VALUES
(1, 'VISA'),
(2, 'MASTERCARD'),
(3, 'DINERS');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `credencialcuenta`
--
ALTER TABLE `credencialcuenta`
  ADD PRIMARY KEY (`IDCUENTA`,`IDCREDENCIALCUENTA`);

--
-- Indices de la tabla `credencialempleado`
--
ALTER TABLE `credencialempleado`
  ADD PRIMARY KEY (`IDEMPLEADO`,`IDCREDENCIALEMPLEADO`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`IDCUENTA`),
  ADD UNIQUE KEY `CORREO` (`CORREO`),
  ADD UNIQUE KEY `IDENTIFICACION` (`IDENTIFICACION`),
  ADD KEY `IDPAIS` (`IDPAIS`),
  ADD KEY `IDPLAN` (`IDPLAN`),
  ADD KEY `IDTIPOCUENTA` (`IDTIPOCUENTA`);

--
-- Indices de la tabla `cuentadominio`
--
ALTER TABLE `cuentadominio`
  ADD PRIMARY KEY (`IDCUENTADOMINIO`),
  ADD KEY `IDCUENTA` (`IDCUENTA`),
  ADD KEY `IDDOMINIO` (`IDDOMINIO`);

--
-- Indices de la tabla `cuentametodospago`
--
ALTER TABLE `cuentametodospago`
  ADD PRIMARY KEY (`IDCUENTA`,`IDMETODOPAGO`,`IDCUENTAMETODOSPAGO`),
  ADD KEY `IDMETODOPAGO` (`IDMETODOPAGO`),
  ADD KEY `IDTARJETA` (`IDTARJETA`);

--
-- Indices de la tabla `dominio`
--
ALTER TABLE `dominio`
  ADD PRIMARY KEY (`IDDOMINIO`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`IDEMPLEADO`),
  ADD UNIQUE KEY `DNIEMPLADO` (`IDENTIFICACIONEMPLEADO`),
  ADD UNIQUE KEY `CORREOEMPLEADO` (`CORREOEMPLEADO`),
  ADD KEY `IDPAIS` (`IDPAIS`),
  ADD KEY `IDTIPOEMPLEADO` (`IDTIPOEMPLEADO`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`IDFACTURA`),
  ADD KEY `IDCUENTA` (`IDCUENTA`,`IDMETODOPAGO`,`IDCUENTAMETODOSPAGO`);

--
-- Indices de la tabla `facturadominio`
--
ALTER TABLE `facturadominio`
  ADD PRIMARY KEY (`IDFACTURA`,`IDDOMINIO`,`IDFACTURADOMINIO`),
  ADD KEY `IDDOMINIO` (`IDDOMINIO`);

--
-- Indices de la tabla `facturapaquete`
--
ALTER TABLE `facturapaquete`
  ADD PRIMARY KEY (`IDPAQUETEHOSTING`,`IDFACTURA`,`IDFACTURAPAQUETE`),
  ADD KEY `IDFACTURA` (`IDFACTURA`);

--
-- Indices de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  ADD PRIMARY KEY (`IDMETODOPAGO`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`IDPAIS`);

--
-- Indices de la tabla `paquetehosting`
--
ALTER TABLE `paquetehosting`
  ADD PRIMARY KEY (`IDPAQUETEHOSTING`);

--
-- Indices de la tabla `periodicidadpago`
--
ALTER TABLE `periodicidadpago`
  ADD PRIMARY KEY (`IDPERIODICIDADPAGO`);

--
-- Indices de la tabla `periodicidadpreciopaquete`
--
ALTER TABLE `periodicidadpreciopaquete`
  ADD PRIMARY KEY (`IDPERIODICIDADPAGO`,`IDPAQUETEHOSTING`,`IDPERIODICIDADPRECIOPAQUETE`),
  ADD KEY `IDPAQUETEHOSTING` (`IDPAQUETEHOSTING`);

--
-- Indices de la tabla `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`IDPLAN`);

--
-- Indices de la tabla `solicituddominio`
--
ALTER TABLE `solicituddominio`
  ADD PRIMARY KEY (`IDSOLICITUD`),
  ADD KEY `IDDOMINIO` (`IDDOMINIO`),
  ADD KEY `IDSOLICITUDESTADO` (`IDSOLICITUDESTADO`);

--
-- Indices de la tabla `solicitudestado`
--
ALTER TABLE `solicitudestado`
  ADD PRIMARY KEY (`IDSOLICITUDESTADO`),
  ADD KEY `IDTIPOESTADO` (`IDTIPOESTADO`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`IDTARJETA`),
  ADD KEY `IDTIPOTARJETA` (`IDTIPOTARJETA`);

--
-- Indices de la tabla `tipocuenta`
--
ALTER TABLE `tipocuenta`
  ADD PRIMARY KEY (`IDTIPOCUENTA`);

--
-- Indices de la tabla `tipoempleado`
--
ALTER TABLE `tipoempleado`
  ADD PRIMARY KEY (`IDTIPOEMPLEADO`);

--
-- Indices de la tabla `tipoestadossolicitud`
--
ALTER TABLE `tipoestadossolicitud`
  ADD PRIMARY KEY (`IDTIPOESTADO`);

--
-- Indices de la tabla `tipotarjeta`
--
ALTER TABLE `tipotarjeta`
  ADD PRIMARY KEY (`IDTIPOTARJETA`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `credencialcuenta`
--
ALTER TABLE `credencialcuenta`
  ADD CONSTRAINT `credencialcuenta_ibfk_1` FOREIGN KEY (`IDCUENTA`) REFERENCES `cuenta` (`IDCUENTA`);

--
-- Filtros para la tabla `credencialempleado`
--
ALTER TABLE `credencialempleado`
  ADD CONSTRAINT `credencialempleado_ibfk_1` FOREIGN KEY (`IDEMPLEADO`) REFERENCES `empleado` (`IDEMPLEADO`);

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`IDPAIS`) REFERENCES `pais` (`IDPAIS`),
  ADD CONSTRAINT `cuenta_ibfk_2` FOREIGN KEY (`IDPLAN`) REFERENCES `plan` (`IDPLAN`),
  ADD CONSTRAINT `cuenta_ibfk_3` FOREIGN KEY (`IDTIPOCUENTA`) REFERENCES `tipocuenta` (`IDTIPOCUENTA`);

--
-- Filtros para la tabla `cuentadominio`
--
ALTER TABLE `cuentadominio`
  ADD CONSTRAINT `cuentadominio_ibfk_1` FOREIGN KEY (`IDCUENTA`) REFERENCES `cuenta` (`IDCUENTA`),
  ADD CONSTRAINT `cuentadominio_ibfk_2` FOREIGN KEY (`IDDOMINIO`) REFERENCES `dominio` (`IDDOMINIO`);

--
-- Filtros para la tabla `cuentametodospago`
--
ALTER TABLE `cuentametodospago`
  ADD CONSTRAINT `cuentametodospago_ibfk_1` FOREIGN KEY (`IDCUENTA`) REFERENCES `cuenta` (`IDCUENTA`),
  ADD CONSTRAINT `cuentametodospago_ibfk_2` FOREIGN KEY (`IDMETODOPAGO`) REFERENCES `metodopago` (`IDMETODOPAGO`),
  ADD CONSTRAINT `cuentametodospago_ibfk_3` FOREIGN KEY (`IDTARJETA`) REFERENCES `tarjeta` (`IDTARJETA`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`IDPAIS`) REFERENCES `pais` (`IDPAIS`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`IDTIPOEMPLEADO`) REFERENCES `tipoempleado` (`IDTIPOEMPLEADO`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`IDCUENTA`,`IDMETODOPAGO`,`IDCUENTAMETODOSPAGO`) REFERENCES `cuentametodospago` (`IDCUENTA`, `IDMETODOPAGO`, `IDCUENTAMETODOSPAGO`);

--
-- Filtros para la tabla `facturadominio`
--
ALTER TABLE `facturadominio`
  ADD CONSTRAINT `facturadominio_ibfk_1` FOREIGN KEY (`IDDOMINIO`) REFERENCES `dominio` (`IDDOMINIO`),
  ADD CONSTRAINT `facturadominio_ibfk_2` FOREIGN KEY (`IDFACTURA`) REFERENCES `factura` (`IDFACTURA`);

--
-- Filtros para la tabla `facturapaquete`
--
ALTER TABLE `facturapaquete`
  ADD CONSTRAINT `facturapaquete_ibfk_1` FOREIGN KEY (`IDFACTURA`) REFERENCES `factura` (`IDFACTURA`),
  ADD CONSTRAINT `facturapaquete_ibfk_2` FOREIGN KEY (`IDPAQUETEHOSTING`) REFERENCES `paquetehosting` (`IDPAQUETEHOSTING`);

--
-- Filtros para la tabla `periodicidadpreciopaquete`
--
ALTER TABLE `periodicidadpreciopaquete`
  ADD CONSTRAINT `periodicidadpreciopaquete_ibfk_1` FOREIGN KEY (`IDPAQUETEHOSTING`) REFERENCES `paquetehosting` (`IDPAQUETEHOSTING`),
  ADD CONSTRAINT `periodicidadpreciopaquete_ibfk_2` FOREIGN KEY (`IDPERIODICIDADPAGO`) REFERENCES `periodicidadpago` (`IDPERIODICIDADPAGO`);

--
-- Filtros para la tabla `solicituddominio`
--
ALTER TABLE `solicituddominio`
  ADD CONSTRAINT `solicituddominio_ibfk_1` FOREIGN KEY (`IDDOMINIO`) REFERENCES `dominio` (`IDDOMINIO`),
  ADD CONSTRAINT `solicituddominio_ibfk_2` FOREIGN KEY (`IDSOLICITUDESTADO`) REFERENCES `solicitudestado` (`IDSOLICITUDESTADO`);

--
-- Filtros para la tabla `solicitudestado`
--
ALTER TABLE `solicitudestado`
  ADD CONSTRAINT `solicitudestado_ibfk_1` FOREIGN KEY (`IDTIPOESTADO`) REFERENCES `tipoestadossolicitud` (`IDTIPOESTADO`);

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `tarjeta_ibfk_1` FOREIGN KEY (`IDTIPOTARJETA`) REFERENCES `tipotarjeta` (`IDTIPOTARJETA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
