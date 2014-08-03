-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-05-2014 a las 17:31:06
-- Versión del servidor: 5.5.35
-- Versión de PHP: 5.4.25-1+sury.org~precise+2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `admin_m3code.com`
--
-- CREATE DATABASE `admin_m3code.com` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `admin_goodlyweb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armas`
--

CREATE TABLE IF NOT EXISTS `armas` (
  `id` int(11) NOT NULL,
  `arma` varchar(45) DEFAULT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `licenciarenar` varchar(45) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `propietario` enum('propia','tercero') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armaslegajos`
--

CREATE TABLE IF NOT EXISTS `armaslegajos` (
  `id` int(11) NOT NULL,
  `armas_id` int(11) NOT NULL,
  `legajos_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `estado` enum('entregada','deposito') DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `fecha_devolucion` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_armaslegajos_armas1_idx` (`armas_id`),
  KEY `fk_armaslegajos_legajos1_idx` (`legajos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE IF NOT EXISTS `articulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articulo` varchar(125) DEFAULT NULL,
  `rubros_id` int(11) NOT NULL,
  `proveedors_id` int(11) NOT NULL,
  `precio_base` decimal(10,2) DEFAULT NULL,
  `utilidad` decimal(10,2) DEFAULT NULL,
  `precio_publico` decimal(10,2) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_articulos_proveedores1_idx` (`proveedors_id`),
  KEY `fk_articulos_rubro1_idx` (`rubros_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `articulo`, `rubros_id`, `proveedors_id`, `precio_base`, `utilidad`, `precio_publico`, `iva`, `created_at`, `updated_at`) VALUES
(2, 'Servicio de Seguridad', 6, 1, 12400.00, 0.00, 15004.00, 21.00, '2014-03-12 16:32:19', '2014-03-12 16:32:19'),
(3, 'Servicio de Vigilancia', 6, 1, 45.00, 0.00, 54.45, 21.00, '2014-03-12 16:33:26', '2014-03-12 18:44:24'),
(4, 'Serv. Seguridad Estac. Paso de los Libres', 6, 1, 45.12, 0.00, 54.60, 21.00, '2014-03-12 17:38:03', '2014-03-12 17:39:03'),
(5, 'Serv. Seguridad Estac. Monte Caceros', 6, 1, 45.12, 0.00, 54.60, 21.00, '2014-03-12 17:38:49', '2014-03-12 17:38:49'),
(6, 'Serv. Extra, Adicional y/o Preventivos', 6, 1, 350.82, 0.00, 424.49, 21.00, '2014-03-12 17:40:09', '2014-03-12 17:40:09'),
(7, 'Serv. maniobra Inter. Paso de Los Libres', 6, 1, 15280.80, 0.00, 18489.77, 21.00, '2014-03-12 17:41:05', '2014-03-12 17:41:05'),
(9, 'Apoyo maniobra Inter. Paso de Los Libres', 6, 1, 600.00, 0.00, 726.00, 21.00, '2014-03-12 17:41:55', '2014-03-12 17:41:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulosdepositos`
--

CREATE TABLE IF NOT EXISTS `articulosdepositos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depositos_id` int(11) NOT NULL,
  `articulos_id` int(11) NOT NULL,
  `stock_actual` int(11) DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_articulos_depositos_depositos1_idx` (`depositos_id`),
  KEY `fk_articulos_depositos_articulos1_idx` (`articulos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centrocostos`
--

CREATE TABLE IF NOT EXISTS `centrocostos` (
  `id` int(11) NOT NULL,
  `centrocosto` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `centrocostos`
--

INSERT INTO `centrocostos` (`id`, `centrocosto`, `created_at`, `updated_at`) VALUES
(1, 'Sin centro de costo', '2014-03-12 01:56:21', '2014-03-12 01:56:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centroscostoscomprasmovimientos`
--

CREATE TABLE IF NOT EXISTS `centroscostoscomprasmovimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `centrocostos_id` int(11) NOT NULL,
  `comprasmovimientos_id` int(11) NOT NULL,
  `importe` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_centroscostoscomprasmovimientos_centrocostos1_idx` (`centrocostos_id`),
  KEY `fk_centroscostoscomprasmovimientos_comprasmovimientos1_idx` (`comprasmovimientos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudads`
--

CREATE TABLE IF NOT EXISTS `ciudads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(125) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provincias_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ciudads_provincias1_idx` (`provincias_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `ciudads`
--

INSERT INTO `ciudads` (`id`, `ciudad`, `created_at`, `updated_at`, `provincias_id`) VALUES
(1, 'Virasoro', '2014-03-12 16:23:52', '2014-03-12 16:23:52', 1),
(2, 'Santo Tome', '2014-03-12 16:24:05', '2014-03-12 16:24:05', 1),
(3, 'San Jose', '2014-03-12 16:40:54', '2014-03-12 16:40:54', 2),
(4, 'Capital Federal', '2014-03-12 16:46:09', '2014-03-12 16:46:09', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(125) DEFAULT NULL,
  `direccion` varchar(125) DEFAULT NULL,
  `cuit` varchar(11) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contacto` varchar(45) DEFAULT NULL,
  `responsabilidadesivas_id` int(11) NOT NULL,
  `ciudads_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `centrocostos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clientes_responsabilidadesivas1_idx` (`responsabilidadesivas_id`),
  KEY `fk_clientes_ciudads1_idx` (`ciudads_id`),
  KEY `fk_clientes_centrocostos1_idx` (`centrocostos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `cliente`, `direccion`, `cuit`, `telefono`, `email`, `contacto`, `responsabilidadesivas_id`, `ciudads_id`, `created_at`, `updated_at`, `centrocostos_id`) VALUES
(2, 'Gerula S.A.', 'Lote Agricola 38 A 0', '30570189359', '', NULL, '', 7, 3, '2014-03-12 12:41:23', '2014-03-12 12:41:23', 1),
(3, 'Gonar Automotores S.A.', 'Ruta Nacional 14', '30567839377', '', NULL, 'Islas', 7, 1, '2014-03-12 12:42:50', '2014-03-12 12:42:50', 1),
(5, 'Belgrano Cargas y Logística S.A.', 'Mujica Carlos, Padre 426', '30714101443', '', NULL, '', 7, 4, '2014-03-12 12:47:41', '2014-03-12 12:47:41', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprasmovimientos`
--

CREATE TABLE IF NOT EXISTS `comprasmovimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `tiposdocumentos_id` int(11) NOT NULL,
  `numero_comprobante` varchar(12) DEFAULT NULL,
  `tipo_movimiento` enum('debe','haber') DEFAULT NULL,
  `importe_total` decimal(10,2) DEFAULT NULL,
  `saldo_movimiento` decimal(10,2) DEFAULT NULL,
  `condicionesventas_id` int(11) NOT NULL,
  `importe_gravado` decimal(10,2) DEFAULT NULL,
  `importe_no_gravado` decimal(10,2) DEFAULT NULL,
  `importe_iva` decimal(10,2) DEFAULT NULL,
  `importe_otros_impuestos` decimal(10,2) DEFAULT NULL,
  `porcentaje_bonificacion` decimal(10,2) DEFAULT NULL,
  `importe_bonificacion` decimal(10,2) DEFAULT NULL,
  `estado` enum('abierto','cerrada','pendiente','cancelada') DEFAULT NULL,
  `observaciones` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `proveedors_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venta_movimientos_tipos_documentos_idx` (`tiposdocumentos_id`),
  KEY `fk_venta_movimiento_condiciones_ventas1_idx` (`condicionesventas_id`),
  KEY `fk_venta_movimientos_users1_idx` (`users_id`),
  KEY `fk_comprasmovimientos_proveedors1_idx` (`proveedors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicionesventas`
--

CREATE TABLE IF NOT EXISTS `condicionesventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condicionesventa` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `condicionesventas`
--

INSERT INTO `condicionesventas` (`id`, `condicionesventa`, `created_at`, `updated_at`) VALUES
(3, 'Contado', '2014-03-12 05:58:01', '2014-03-12 05:58:01'),
(4, 'Cta. Cte.', '2014-03-12 16:24:25', '2014-03-12 16:24:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configs`
--

CREATE TABLE IF NOT EXISTS `configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `texto` text,
  `fecha` datetime DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `entero` int(11) DEFAULT NULL,
  `decimal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositos`
--

CREATE TABLE IF NOT EXISTS `depositos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deposito` varchar(125) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleoscategorias`
--

CREATE TABLE IF NOT EXISTS `empleoscategorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleoscategoria` varchar(125) DEFAULT NULL,
  `valor_jornal` decimal(10,2) DEFAULT NULL,
  `sindicatos_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empleoscategorias_sindicatos1_idx` (`sindicatos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `legajos`
--

CREATE TABLE IF NOT EXISTS `legajos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `legajo` varchar(45) DEFAULT NULL,
  `apellidoynombre` varchar(125) DEFAULT NULL,
  `direccion` varchar(125) DEFAULT NULL,
  `ciudads_id` int(11) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `numero_documento` varchar(45) DEFAULT NULL,
  `numero_cuil` varchar(45) DEFAULT NULL,
  `tipo_contrato` enum('permanente','contratado') DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `fecha_egreso` date DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT NULL,
  `empleoscategorias_id` int(11) NOT NULL,
  `obrassocials_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_legajos_ciudads1_idx` (`ciudads_id`),
  KEY `fk_legajos_empleoscategorias1_idx` (`empleoscategorias_id`),
  KEY `fk_legajos_obrassocials1_idx` (`obrassocials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `legajoslicencias`
--

CREATE TABLE IF NOT EXISTS `legajoslicencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `legajos_id` int(11) NOT NULL,
  `licencias_id` int(11) NOT NULL,
  `numero_licencia` varchar(45) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_table1_legajos1_idx` (`legajos_id`),
  KEY `fk_legajoslicencias_licencias1_idx` (`licencias_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias`
--

CREATE TABLE IF NOT EXISTS `licencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `licencia` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obrassocials`
--

CREATE TABLE IF NOT EXISTS `obrassocials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `obrassocial` varchar(125) DEFAULT NULL,
  `codigo` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partesdiarios`
--

CREATE TABLE IF NOT EXISTS `partesdiarios` (
  `id` int(11) NOT NULL,
  `centrocostos_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `observaciones` text,
  `estado` enum('abierto','cerrado') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_partesdiarios_centrocostos1_idx` (`centrocostos_id`),
  KEY `fk_partesdiarios_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partesdiarioscuerpos`
--

CREATE TABLE IF NOT EXISTS `partesdiarioscuerpos` (
  `id` int(11) NOT NULL,
  `partesdiarios_id` int(11) NOT NULL,
  `legajos_id` int(11) NOT NULL,
  `fecha_entrada` datetime DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `partesdiariosnovedads_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_partesdiarioscuerpos_partesdiarios1_idx` (`partesdiarios_id`),
  KEY `fk_partesdiarioscuerpos_legajos1_idx` (`legajos_id`),
  KEY `fk_partesdiarioscuerpos_partesdiariosnovedads1_idx` (`partesdiariosnovedads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partesdiariosnovedads`
--

CREATE TABLE IF NOT EXISTS `partesdiariosnovedads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partesdiariosnovedad` varchar(125) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedors`
--

CREATE TABLE IF NOT EXISTS `proveedors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(125) DEFAULT NULL,
  `cuit` varchar(12) DEFAULT NULL,
  `direccion` varchar(125) DEFAULT NULL,
  `telefono` varchar(125) DEFAULT NULL,
  `contacto` varchar(125) DEFAULT NULL,
  `responsabilidadesivas_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ciudads_id` int(11) NOT NULL,
  `centrocostos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proveedores_responsabilidad_iva1_idx` (`responsabilidadesivas_id`),
  KEY `fk_proveedors_ciudads1_idx` (`ciudads_id`),
  KEY `fk_proveedors_centrocostos1_idx` (`centrocostos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`id`, `proveedor`, `cuit`, `direccion`, `telefono`, `contacto`, `responsabilidadesivas_id`, `created_at`, `updated_at`, `ciudads_id`, `centrocostos_id`) VALUES
(1, 'Red de Seguridad SRL', '30714076708', '', '', 'Diego Lovera', 7, '2014-03-12 16:30:11', '2014-03-12 16:30:11', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE IF NOT EXISTS `provincias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id`, `provincia`, `created_at`, `updated_at`) VALUES
(1, 'Corrientes', '2014-03-12 16:22:43', '2014-03-12 16:22:43'),
(2, 'Misiones', '2014-03-12 16:23:09', '2014-03-12 16:23:09'),
(3, 'Entre Rios', '2014-03-12 16:23:19', '2014-03-12 16:23:19'),
(4, 'Buenos Aires', '2014-03-12 16:45:46', '2014-03-12 16:45:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsabilidadesivas`
--

CREATE TABLE IF NOT EXISTS `responsabilidadesivas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `responsabilidadesiva` varchar(125) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `venta_tiposdocumentos_id` int(11) DEFAULT NULL,
  `recibo_tiposdocumentos_id` int(11) DEFAULT NULL,
  `nc_tiposdocumentos_id` int(11) DEFAULT NULL,
  `nd_tiposdocumentos_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `responsabilidadesivas`
--

INSERT INTO `responsabilidadesivas` (`id`, `responsabilidadesiva`, `updated_at`, `venta_tiposdocumentos_id`, `recibo_tiposdocumentos_id`, `nc_tiposdocumentos_id`, `nd_tiposdocumentos_id`, `created_at`) VALUES
(7, 'Responsable Inscripto', '2014-03-12 16:27:17', 1, 5, 6, 7, '2014-03-12 06:02:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubros`
--

CREATE TABLE IF NOT EXISTS `rubros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rubro` varchar(125) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `rubros`
--

INSERT INTO `rubros` (`id`, `rubro`, `created_at`, `updated_at`) VALUES
(6, 'Servicios', '2014-03-12 06:07:55', '2014-03-12 06:07:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sindicatos`
--

CREATE TABLE IF NOT EXISTS `sindicatos` (
  `id` int(11) NOT NULL,
  `sindicato` varchar(125) DEFAULT NULL,
  `descripcion` text,
  `valor_alicuota` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdocumentos`
--

CREATE TABLE IF NOT EXISTS `tiposdocumentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tiposdocumento` varchar(75) DEFAULT NULL,
  `numero_documento` int(11) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `tiposdocumentos`
--

INSERT INTO `tiposdocumentos` (`id`, `tiposdocumento`, `numero_documento`, `tipo`, `created_at`, `updated_at`) VALUES
(1, 'Factura A', 200000075, NULL, '2014-03-12 05:58:21', '2014-03-22 03:16:27'),
(2, 'Factura B', NULL, NULL, '2014-03-12 05:58:32', '2014-03-12 05:58:32'),
(3, 'Factura C', NULL, NULL, '2014-03-12 05:59:28', '2014-03-12 05:59:28'),
(4, 'Factura M', NULL, NULL, '2014-03-12 05:59:36', '2014-03-12 05:59:36'),
(5, 'Recibo', 10, NULL, '2014-03-12 06:00:05', '2014-03-19 18:21:53'),
(6, 'Nota de Credito A', NULL, NULL, '2014-03-12 06:00:31', '2014-03-12 06:00:31'),
(7, 'Nota de Debito A', NULL, NULL, '2014-03-12 06:00:43', '2014-03-12 06:00:43'),
(8, 'Remito', NULL, NULL, '2014-03-12 06:00:55', '2014-03-12 06:00:55'),
(9, 'Nota de Credito B', NULL, NULL, '2014-03-12 06:01:17', '2014-03-12 06:01:17'),
(10, 'Nota de Debito B', NULL, NULL, '2014-03-12 06:01:30', '2014-03-12 06:01:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(75) DEFAULT NULL,
  `email` varchar(125) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(3, 'keloxers', 'keloxers@gmail.com', '$2y$08$RuUbbtiQ2exDanpehxgRPekyjnfRLYmaZYFNEhvyPX5lQEu4GFCLi', '2014-03-12 05:56:40', '2014-03-12 05:56:40'),
(4, 'diego', 'diego', '$2y$08$/NlbRKvuh4wRpXcWOQHaNednBqRt2cGjm3DA4c73TCBpUQGu6CvDm', '2014-03-12 16:21:24', '2014-03-12 16:21:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE IF NOT EXISTS `vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehiculo` varchar(45) DEFAULT NULL,
  `patente` varchar(6) DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT NULL,
  `tipo` enum('propio','tercero') DEFAULT NULL,
  `centrocostos_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vehiculos_centrocostos1_idx` (`centrocostos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculoslicencias`
--

CREATE TABLE IF NOT EXISTS `vehiculoslicencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehiculos_id` int(11) NOT NULL,
  `vehiculoslicenciastipos_id` int(11) NOT NULL,
  `fecha_alta` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `numero_licencia` varchar(45) DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vehiculoslicencias_vehiculos1_idx` (`vehiculos_id`),
  KEY `fk_vehiculoslicencias_vehiculoslicenciastipos1_idx` (`vehiculoslicenciastipos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculoslicenciastipos`
--

CREATE TABLE IF NOT EXISTS `vehiculoslicenciastipos` (
  `id` int(11) NOT NULL,
  `vehiculoslicenciastipo` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventasmovimientos`
--

CREATE TABLE IF NOT EXISTS `ventasmovimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `tiposdocumentos_id` int(11) NOT NULL,
  `numero_comprobante` varchar(12) DEFAULT NULL,
  `tipo_movimiento` enum('debe','haber') DEFAULT NULL,
  `importe_total` decimal(10,2) DEFAULT NULL,
  `saldo_movimiento` decimal(10,2) DEFAULT NULL,
  `condicionesventas_id` int(11) NOT NULL,
  `importe_gravado` decimal(10,2) DEFAULT NULL,
  `importe_no_gravado` decimal(10,2) DEFAULT NULL,
  `importe_iva` decimal(10,2) DEFAULT NULL,
  `importe_otros_impuestos` decimal(10,2) DEFAULT NULL,
  `porcentaje_bonificacion` decimal(10,2) DEFAULT NULL,
  `importe_bonificacion` decimal(10,2) DEFAULT NULL,
  `estado` enum('abierto','cerrada','pendiente','cancelada') DEFAULT NULL,
  `observaciones` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `clientes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venta_movimientos_tipos_documentos_idx` (`tiposdocumentos_id`),
  KEY `fk_venta_movimiento_condiciones_ventas1_idx` (`condicionesventas_id`),
  KEY `fk_venta_movimientos_users1_idx` (`users_id`),
  KEY `fk_ventasmovimientos_clientes1_idx` (`clientes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Volcado de datos para la tabla `ventasmovimientos`
--

INSERT INTO `ventasmovimientos` (`id`, `fecha`, `fecha_vencimiento`, `tiposdocumentos_id`, `numero_comprobante`, `tipo_movimiento`, `importe_total`, `saldo_movimiento`, `condicionesventas_id`, `importe_gravado`, `importe_no_gravado`, `importe_iva`, `importe_otros_impuestos`, `porcentaje_bonificacion`, `importe_bonificacion`, `estado`, `observaciones`, `created_at`, `updated_at`, `users_id`, `clientes_id`) VALUES
(1, '2014-01-01', '2014-01-01', 1, '400000381', 'debe', 1016.40, 0.00, 3, 840.00, 0.00, 176.40, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 13:20:31', '2014-03-19 13:56:27', 4, 3),
(2, '2014-01-09', '2014-01-09', 1, '400000382', 'debe', 847.00, 0.00, 3, 700.00, 0.00, 147.00, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 13:23:33', '2014-03-19 13:56:27', 4, 3),
(3, '2014-01-09', '2014-01-09', 1, '400000383', 'debe', 1016.40, 0.00, 3, 840.00, 0.00, 176.40, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 13:25:08', '2014-03-19 13:56:27', 4, 3),
(4, '2014-01-09', '2014-01-09', 1, '400000384', 'debe', 1058.75, 0.00, 3, 875.00, 0.00, 183.75, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 13:26:18', '2014-03-19 13:56:27', 4, 3),
(5, '2014-01-09', '2014-01-09', 1, '400000385', 'debe', 550.55, 0.00, 3, 455.00, 0.00, 95.55, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 13:26:59', '2014-03-19 13:56:27', 4, 3),
(6, '2014-01-09', '2014-01-09', 1, '400000386', 'debe', 1016.40, 0.00, 3, 840.00, 0.00, 176.40, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 13:27:50', '2014-03-19 13:56:27', 4, 3),
(7, '2014-01-09', '2014-01-09', 1, '400000387', 'debe', 847.00, 0.00, 3, 700.00, 0.00, 147.00, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 13:28:34', '2014-03-19 13:56:27', 4, 3),
(8, '2014-01-09', '2014-01-09', 1, '400000388', 'debe', 719.95, 0.00, 3, 595.00, 0.00, 124.95, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 13:29:24', '2014-03-19 13:56:27', 4, 3),
(9, '2014-02-04', '2014-02-04', 1, '400000389', 'debe', 15004.00, 15004.00, 4, 12400.00, 0.00, 2604.00, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 13:31:15', '2014-03-12 13:31:42', 4, 2),
(10, '2014-01-15', '2014-01-15', 1, '200000035', 'debe', 275145.80, 275145.80, 4, 227393.22, 0.00, 47752.58, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 13:36:06', '2014-03-12 13:48:20', 4, 5),
(11, '2014-01-15', '2014-01-15', 1, '200000036', 'debe', 847.00, 0.00, 3, 700.00, 0.00, 147.00, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 13:49:38', '2014-03-19 14:01:20', 4, 3),
(12, '2014-01-15', '2014-01-15', 1, '200000037', 'debe', 804.65, 0.00, 3, 665.00, 0.00, 139.65, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 13:50:20', '2014-03-19 14:01:20', 4, 3),
(13, '2014-01-15', '2014-01-15', 1, '200000038', 'debe', 1058.75, 0.00, 3, 875.00, 0.00, 183.75, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 13:51:58', '2014-03-19 14:01:20', 4, 3),
(14, '2014-01-15', '2014-01-15', 1, '200000039', 'debe', 847.00, 0.00, 4, 700.00, 0.00, 147.00, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 13:52:53', '2014-03-19 14:02:40', 4, 3),
(15, '2014-01-15', '2014-01-15', 1, '200000040', 'debe', 1016.40, 0.00, 4, 840.00, 0.00, 176.40, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 13:53:46', '2014-03-19 14:02:40', 4, 3),
(16, '2014-01-15', '2014-01-15', 1, '200000041', 'debe', 289920.79, 289920.79, 4, 239603.96, 0.00, 50316.83, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 13:54:25', '2014-03-12 13:59:44', 4, 5),
(17, '2014-01-28', '2014-01-28', 1, '200000042', 'debe', 1016.40, 0.00, 4, 840.00, 0.00, 176.40, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:00:11', '2014-03-19 14:02:40', 4, 3),
(18, '2014-01-28', '2014-01-28', 1, '200000043', 'debe', 847.00, 0.00, 4, 700.00, 0.00, 147.00, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:00:57', '2014-03-19 14:04:32', 4, 3),
(19, '2014-01-28', '2014-01-28', 1, '200000044', 'debe', 1016.40, 0.00, 4, 840.00, 0.00, 176.40, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:01:36', '2014-03-19 14:04:32', 4, 3),
(20, '2014-01-28', '2014-01-28', 1, '200000045', 'debe', 847.00, 0.00, 4, 700.00, 0.00, 147.00, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:02:10', '2014-03-19 14:04:32', 4, 3),
(21, '2014-02-04', '2014-02-04', 1, '200000046', 'debe', 1101.10, 0.00, 4, 910.00, 0.00, 191.10, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:02:56', '2014-03-19 14:06:42', 4, 3),
(22, '2014-02-04', '2014-02-04', 1, '200000047', 'debe', 1016.40, 0.00, 4, 840.00, 0.00, 176.40, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:05:28', '2014-03-19 14:06:42', 4, 3),
(23, '2014-02-04', '2014-02-04', 1, '200000048', 'debe', 1397.55, 0.00, 4, 1155.00, 0.00, 242.55, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:06:14', '2014-03-19 14:06:42', 4, 3),
(24, '2014-02-04', '2014-02-04', 1, '200000049', 'debe', 316082.59, 316082.59, 4, 261225.28, 0.00, 54857.31, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:07:36', '2014-03-12 14:13:08', 4, 5),
(25, '2014-02-11', '2014-02-11', 1, '200000050', 'debe', 889.35, 0.00, 4, 735.00, 0.00, 154.35, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:13:34', '2014-03-19 14:06:42', 4, 3),
(26, '2014-02-11', '2014-02-11', 1, '200000051', 'debe', 1058.75, 0.00, 4, 875.00, 0.00, 183.75, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:14:57', '2014-03-19 14:07:50', 4, 3),
(27, '2014-02-17', '2014-02-17', 1, '200000052', 'debe', 1016.40, 0.00, 4, 840.00, 0.00, 176.40, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:17:49', '2014-03-19 14:07:50', 4, 3),
(28, '2014-02-17', '2014-02-17', 1, '200000053', 'debe', 847.00, 0.00, 4, 700.00, 0.00, 147.00, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:19:10', '2014-03-19 14:07:50', 4, 3),
(29, '2014-03-05', '2014-03-05', 1, '200000054', 'debe', 550.55, 0.00, 4, 455.00, 0.00, 95.55, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:20:08', '2014-03-19 14:07:50', 4, 3),
(30, '2014-03-05', '2014-03-05', 1, '200000055', 'debe', 550.55, 0.00, 4, 455.00, 0.00, 95.55, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:24:45', '2014-03-19 14:11:51', 4, 3),
(31, '2014-03-05', '2014-03-05', 1, '200000056', 'debe', 1101.10, 0.00, 4, 910.00, 0.00, 191.10, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:25:38', '2014-03-19 14:11:51', 4, 3),
(32, '2014-03-05', '2014-03-05', 1, '200000057', 'debe', 550.55, 0.00, 4, 455.00, 0.00, 95.55, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:26:17', '2014-03-19 14:11:51', 4, 3),
(33, '2014-03-05', '2014-03-05', 1, '200000058', 'debe', 1016.40, 0.00, 4, 840.00, 0.00, 176.40, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:26:43', '2014-03-19 14:21:53', 4, 3),
(34, '2014-03-05', '2014-03-05', 1, '200000059', 'debe', 1016.40, 0.00, 4, 840.00, 0.00, 176.40, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:27:10', '2014-03-19 14:21:53', 4, 3),
(35, '2014-03-05', '2014-03-05', 1, '200000060', 'debe', 1016.40, 1016.40, 4, 840.00, 0.00, 176.40, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:27:34', '2014-03-12 14:27:47', 4, 3),
(36, '2014-03-05', '2014-03-05', 1, '200000061', 'debe', 847.00, 847.00, 4, 700.00, 0.00, 147.00, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:28:00', '2014-03-12 14:28:14', 4, 3),
(37, '2014-03-05', '2014-03-05', 1, '200000062', 'debe', 1101.10, 1101.10, 4, 910.00, 0.00, 191.10, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:28:28', '2014-03-12 14:28:48', 4, 3),
(38, '2014-03-05', '2014-03-05', 1, '200000063', 'debe', 211.75, 211.75, 4, 175.00, 0.00, 36.75, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:30:06', '2014-03-12 14:30:19', 4, 3),
(39, '2014-03-06', '2014-03-06', 1, '200000064', 'debe', 114031.90, 114031.90, 4, 94241.24, 0.00, 19790.66, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:31:22', '2014-03-12 14:33:35', 4, 5),
(40, '2014-03-10', '2014-03-10', 1, '200000065', 'debe', 1524.60, 1524.60, 4, 1260.00, 0.00, 264.60, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:34:04', '2014-03-12 14:37:29', 4, 3),
(41, '2014-03-10', '2014-03-10', 1, '200000066', 'debe', 1306.80, 1306.80, 4, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:43:40', '2014-03-12 14:44:49', 4, 3),
(42, '2014-03-10', '2014-03-10', 1, '200000067', 'debe', 1306.80, 1306.80, 4, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:45:59', '2014-03-12 14:46:20', 4, 3),
(43, '2014-03-10', '2014-03-10', 1, '200000068', 'debe', 1306.80, 1306.80, 4, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:46:56', '2014-03-12 14:47:16', 4, 3),
(44, '2014-03-10', '2014-03-10', 1, '200000069', 'debe', 1306.80, 1306.80, 4, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:47:40', '2014-03-12 14:47:58', 4, 3),
(45, '2014-03-10', '2014-03-10', 1, '200000070', 'debe', 1089.00, 1089.00, 4, 900.00, 0.00, 189.00, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:48:39', '2014-03-12 14:48:56', 4, 3),
(46, '2014-03-11', '2014-03-11', 1, '200000071', 'debe', 847.00, 847.00, 4, 700.00, 0.00, 147.00, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:50:18', '2014-03-12 14:51:08', 4, 3),
(47, '2014-03-11', '2014-03-11', 1, '200000072', 'debe', 550.55, 550.55, 4, 455.00, 0.00, 95.55, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-12 14:51:37', '2014-03-12 14:52:09', 4, 3),
(48, '2014-03-15', '2014-03-18', 1, '200000073', 'debe', 1306.80, 1306.80, 4, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-19 13:19:54', '2014-03-19 13:22:05', 4, 3),
(49, '2014-03-16', '2014-03-19', 1, '200000074', 'debe', 1089.00, 1089.00, 4, 900.00, 0.00, 189.00, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-19 13:22:56', '2014-03-19 13:23:57', 4, 3),
(61, '2014-03-06', '2014-03-07', 1, '400000390', 'debe', 15004.00, 15004.00, 4, 12400.00, 0.00, 2604.00, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-21 23:16:27', '2014-03-21 23:17:40', 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventasmovimientoscuerpos`
--

CREATE TABLE IF NOT EXISTS `ventasmovimientoscuerpos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ventasmovimientos_id` int(11) NOT NULL,
  `articulos_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT '0',
  `articulo` varchar(125) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT '0.00',
  `importe_gravado` decimal(10,2) DEFAULT '0.00',
  `importe_no_gravado` decimal(10,2) DEFAULT '0.00',
  `importe_iva` decimal(10,2) DEFAULT '0.00',
  `porcentaje_iva` decimal(10,2) DEFAULT '0.00',
  `importes_otros_impuestos` decimal(10,2) DEFAULT '0.00',
  `porcentaje_bonificacion` decimal(10,2) DEFAULT '0.00',
  `bonificacion` decimal(10,2) DEFAULT '0.00',
  `precio_total` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venta_movimiento_cuerpo_venta_movimientos1_idx` (`ventasmovimientos_id`),
  KEY `fk_venta_movimiento_cuerpo_articulos1_idx` (`articulos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

--
-- Volcado de datos para la tabla `ventasmovimientoscuerpos`
--

INSERT INTO `ventasmovimientoscuerpos` (`id`, `ventasmovimientos_id`, `articulos_id`, `cantidad`, `articulo`, `precio_unitario`, `importe_gravado`, `importe_no_gravado`, `importe_iva`, `porcentaje_iva`, `importes_otros_impuestos`, `porcentaje_bonificacion`, `bonificacion`, `precio_total`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 24, 'Servicio de Vigilancia', 42.35, 840.00, 0.00, 176.40, 21.00, 0.00, 0.00, 0.00, 1016.40, '2014-03-12 17:21:16', '2014-03-12 17:21:16'),
(2, 2, 3, 20, 'Servicio de Vigilancia', 42.35, 700.00, 0.00, 147.00, 21.00, 0.00, 0.00, 0.00, 847.00, '2014-03-12 17:24:09', '2014-03-12 17:24:09'),
(3, 3, 3, 24, 'Servicio de Vigilancia', 42.35, 840.00, 0.00, 176.40, 21.00, 0.00, 0.00, 0.00, 1016.40, '2014-03-12 17:25:34', '2014-03-12 17:25:34'),
(4, 4, 3, 25, 'Servicio de Vigilancia', 42.35, 875.00, 0.00, 183.75, 21.00, 0.00, 0.00, 0.00, 1058.75, '2014-03-12 17:26:36', '2014-03-12 17:26:36'),
(5, 5, 3, 13, 'Servicio de Vigilancia', 42.35, 455.00, 0.00, 95.55, 21.00, 0.00, 0.00, 0.00, 550.55, '2014-03-12 17:27:26', '2014-03-12 17:27:26'),
(6, 6, 3, 24, 'Servicio de Vigilancia', 42.35, 840.00, 0.00, 176.40, 21.00, 0.00, 0.00, 0.00, 1016.40, '2014-03-12 17:28:04', '2014-03-12 17:28:04'),
(7, 7, 3, 20, 'Servicio de Vigilancia', 42.35, 700.00, 0.00, 147.00, 21.00, 0.00, 0.00, 0.00, 847.00, '2014-03-12 17:28:50', '2014-03-12 17:28:50'),
(8, 8, 3, 17, 'Servicio de Vigilancia', 42.35, 595.00, 0.00, 124.95, 21.00, 0.00, 0.00, 0.00, 719.95, '2014-03-12 17:29:40', '2014-03-12 17:29:40'),
(9, 9, 2, 1, 'Servicio de Seguridad', 15004.00, 12400.00, 0.00, 2604.00, 21.00, 0.00, 0.00, 0.00, 15004.00, '2014-03-12 17:31:39', '2014-03-12 17:31:39'),
(12, 10, 6, 1, 'Serv. Extra, Adicional y/o Preventivos', 424.49, 350.82, 0.00, 73.67, 21.00, 0.00, 0.00, 0.00, 424.49, '2014-03-12 17:43:47', '2014-03-12 17:43:47'),
(13, 10, 7, 1, 'Serv. maniobra Inter. Paso de Los Libres', 18489.77, 15280.80, 0.00, 3208.97, 21.00, 0.00, 0.00, 0.00, 18489.77, '2014-03-12 17:43:57', '2014-03-12 17:43:57'),
(14, 10, 9, 1, 'Apoyo maniobra Inter. Paso de Los Libres', 726.00, 600.00, 0.00, 126.00, 21.00, 0.00, 0.00, 0.00, 726.00, '2014-03-12 17:44:04', '2014-03-12 17:44:04'),
(15, 10, 4, 2, 'Serv. Seguridad Estac. Paso de los Libres', 54.60, 129945.60, 0.00, 27288.58, 21.00, 0.00, 0.00, 0.00, 157234.18, '2014-03-12 17:46:56', '2014-03-12 17:46:56'),
(16, 10, 5, 1, 'Serv. Seguridad Estac. Monte Caceros', 54.60, 81216.00, 0.00, 17055.36, 21.00, 0.00, 0.00, 0.00, 98271.36, '2014-03-12 17:48:14', '2014-03-12 17:48:14'),
(17, 11, 3, 20, 'Servicio de Vigilancia', 42.35, 700.00, 0.00, 147.00, 21.00, 0.00, 0.00, 0.00, 847.00, '2014-03-12 17:49:54', '2014-03-12 17:49:54'),
(18, 12, 3, 12, 'Servicio de Vigilancia', 42.35, 420.00, 0.00, 88.20, 21.00, 0.00, 0.00, 0.00, 508.20, '2014-03-12 17:51:09', '2014-03-12 17:51:09'),
(19, 12, 3, 7, 'Servicio de Vigilancia', 42.35, 245.00, 0.00, 51.45, 21.00, 0.00, 0.00, 0.00, 296.45, '2014-03-12 17:51:20', '2014-03-12 17:51:20'),
(20, 13, 3, 25, 'Servicio de Vigilancia', 42.35, 875.00, 0.00, 183.75, 21.00, 0.00, 0.00, 0.00, 1058.75, '2014-03-12 17:52:17', '2014-03-12 17:52:17'),
(21, 14, 3, 20, 'Servicio de Vigilancia', 42.35, 700.00, 0.00, 147.00, 21.00, 0.00, 0.00, 0.00, 847.00, '2014-03-12 17:53:10', '2014-03-12 17:53:10'),
(22, 15, 3, 24, 'Servicio de Vigilancia', 42.35, 840.00, 0.00, 176.40, 21.00, 0.00, 0.00, 0.00, 1016.40, '2014-03-12 17:53:58', '2014-03-12 17:53:58'),
(23, 16, 4, 2, 'Serv. Seguridad Estac. Paso de los Libres', 54.60, 134277.12, 0.00, 28198.20, 21.00, 0.00, 0.00, 0.00, 162475.32, '2014-03-12 17:56:07', '2014-03-12 17:56:07'),
(24, 16, 5, 1, 'Serv. Seguridad Estac. Monte Caceros', 54.60, 83923.20, 0.00, 17623.87, 21.00, 0.00, 0.00, 0.00, 101547.07, '2014-03-12 17:57:09', '2014-03-12 17:57:09'),
(26, 16, 6, 1, 'Serv. Extra, Adicional y/o Preventivos', 13112.09, 10836.44, 0.00, 2275.65, 21.00, 0.00, 0.00, 0.00, 13112.09, '2014-03-12 17:58:49', '2014-03-12 17:58:49'),
(27, 16, 7, 1, 'Serv. maniobra Inter. Paso de Los Libres', 12060.31, 9967.20, 0.00, 2093.11, 21.00, 0.00, 0.00, 0.00, 12060.31, '2014-03-12 17:59:14', '2014-03-12 17:59:14'),
(28, 16, 9, 1, 'Apoyo maniobra Inter. Paso de Los Libres', 726.00, 600.00, 0.00, 126.00, 21.00, 0.00, 0.00, 0.00, 726.00, '2014-03-12 17:59:35', '2014-03-12 17:59:35'),
(29, 17, 3, 24, 'Servicio de Vigilancia', 42.35, 840.00, 0.00, 176.40, 21.00, 0.00, 0.00, 0.00, 1016.40, '2014-03-12 18:00:31', '2014-03-12 18:00:31'),
(30, 18, 3, 20, 'Servicio de Vigilancia', 42.35, 700.00, 0.00, 147.00, 21.00, 0.00, 0.00, 0.00, 847.00, '2014-03-12 18:01:14', '2014-03-12 18:01:14'),
(31, 19, 3, 24, 'Servicio de Vigilancia', 42.35, 840.00, 0.00, 176.40, 21.00, 0.00, 0.00, 0.00, 1016.40, '2014-03-12 18:01:51', '2014-03-12 18:01:51'),
(32, 20, 3, 20, 'Servicio de Vigilancia', 42.35, 700.00, 0.00, 147.00, 21.00, 0.00, 0.00, 0.00, 847.00, '2014-03-12 18:02:22', '2014-03-12 18:02:22'),
(33, 21, 3, 13, 'Servicio de Vigilancia', 42.35, 455.00, 0.00, 95.55, 21.00, 0.00, 0.00, 0.00, 550.55, '2014-03-12 18:04:49', '2014-03-12 18:04:49'),
(34, 21, 3, 13, 'Servicio de Vigilancia', 42.35, 455.00, 0.00, 95.55, 21.00, 0.00, 0.00, 0.00, 550.55, '2014-03-12 18:04:57', '2014-03-12 18:04:57'),
(35, 22, 3, 24, 'Servicio de Vigilancia', 42.35, 840.00, 0.00, 176.40, 21.00, 0.00, 0.00, 0.00, 1016.40, '2014-03-12 18:05:41', '2014-03-12 18:05:41'),
(36, 23, 3, 20, 'Servicio de Vigilancia', 42.35, 700.00, 0.00, 147.00, 21.00, 0.00, 0.00, 0.00, 847.00, '2014-03-12 18:06:28', '2014-03-12 18:06:28'),
(37, 23, 3, 13, 'Servicio de Vigilancia', 42.35, 455.00, 0.00, 95.55, 21.00, 0.00, 0.00, 0.00, 550.55, '2014-03-12 18:06:36', '2014-03-12 18:06:36'),
(38, 24, 4, 2, 'Serv. Seguridad Estac. Paso de los Libres', 54.60, 134277.12, 0.00, 28198.20, 21.00, 0.00, 0.00, 0.00, 162475.32, '2014-03-12 18:08:34', '2014-03-12 18:08:34'),
(39, 24, 5, 1, 'Serv. Seguridad Estac. Monte Caceros', 54.60, 83923.20, 0.00, 17623.87, 21.00, 0.00, 0.00, 0.00, 101547.07, '2014-03-12 18:09:05', '2014-03-12 18:09:05'),
(41, 24, 7, 1, 'Serv. maniobra Inter. Paso de Los Libres', 19638.78, 16230.40, 0.00, 3408.38, 21.00, 0.00, 0.00, 0.00, 19638.78, '2014-03-12 18:10:33', '2014-03-12 18:10:33'),
(42, 24, 9, 1, 'Apoyo maniobra Inter. Paso de Los Libres', 726.00, 600.00, 0.00, 126.00, 21.00, 0.00, 0.00, 0.00, 726.00, '2014-03-12 18:11:21', '2014-03-12 18:11:21'),
(43, 24, 6, 1, 'Serv. Extra, Adicional y/o Preventivos', 31695.42, 26194.56, 0.00, 5500.86, 21.00, 0.00, 0.00, 0.00, 31695.42, '2014-03-12 18:12:50', '2014-03-12 18:12:50'),
(44, 25, 3, 13, 'Servicio de Vigilancia', 42.35, 455.00, 0.00, 95.55, 21.00, 0.00, 0.00, 0.00, 550.55, '2014-03-12 18:13:52', '2014-03-12 18:13:52'),
(45, 25, 3, 8, 'Servicio de Vigilancia', 42.35, 280.00, 0.00, 58.80, 21.00, 0.00, 0.00, 0.00, 338.80, '2014-03-12 18:14:00', '2014-03-12 18:14:00'),
(46, 26, 3, 25, 'Servicio de Vigilancia', 42.35, 875.00, 0.00, 183.75, 21.00, 0.00, 0.00, 0.00, 1058.75, '2014-03-12 18:16:47', '2014-03-12 18:16:47'),
(47, 27, 3, 24, 'Servicio de Vigilancia', 42.35, 840.00, 0.00, 176.40, 21.00, 0.00, 0.00, 0.00, 1016.40, '2014-03-12 18:18:06', '2014-03-12 18:18:06'),
(48, 28, 3, 20, 'Servicio de Vigilancia', 42.35, 700.00, 0.00, 147.00, 21.00, 0.00, 0.00, 0.00, 847.00, '2014-03-12 18:19:39', '2014-03-12 18:19:39'),
(49, 29, 3, 13, 'Servicio de Vigilancia', 42.35, 455.00, 0.00, 95.55, 21.00, 0.00, 0.00, 0.00, 550.55, '2014-03-12 18:21:42', '2014-03-12 18:21:42'),
(50, 30, 3, 13, 'Servicio de Vigilancia', 42.35, 455.00, 0.00, 95.55, 21.00, 0.00, 0.00, 0.00, 550.55, '2014-03-12 18:24:57', '2014-03-12 18:24:57'),
(51, 31, 3, 13, 'Servicio de Vigilancia', 42.35, 455.00, 0.00, 95.55, 21.00, 0.00, 0.00, 0.00, 550.55, '2014-03-12 18:25:52', '2014-03-12 18:25:52'),
(52, 31, 3, 13, 'Servicio de Vigilancia', 42.35, 455.00, 0.00, 95.55, 21.00, 0.00, 0.00, 0.00, 550.55, '2014-03-12 18:25:59', '2014-03-12 18:25:59'),
(53, 32, 3, 13, 'Servicio de Vigilancia', 42.35, 455.00, 0.00, 95.55, 21.00, 0.00, 0.00, 0.00, 550.55, '2014-03-12 18:26:26', '2014-03-12 18:26:26'),
(54, 33, 3, 24, 'Servicio de Vigilancia', 42.35, 840.00, 0.00, 176.40, 21.00, 0.00, 0.00, 0.00, 1016.40, '2014-03-12 18:26:54', '2014-03-12 18:26:54'),
(55, 34, 3, 24, 'Servicio de Vigilancia', 42.35, 840.00, 0.00, 176.40, 21.00, 0.00, 0.00, 0.00, 1016.40, '2014-03-12 18:27:21', '2014-03-12 18:27:21'),
(56, 35, 3, 24, 'Servicio de Vigilancia', 42.35, 840.00, 0.00, 176.40, 21.00, 0.00, 0.00, 0.00, 1016.40, '2014-03-12 18:27:44', '2014-03-12 18:27:44'),
(57, 36, 3, 20, 'Servicio de Vigilancia', 42.35, 700.00, 0.00, 147.00, 21.00, 0.00, 0.00, 0.00, 847.00, '2014-03-12 18:28:10', '2014-03-12 18:28:10'),
(58, 37, 3, 13, 'Servicio de Vigilancia', 42.35, 455.00, 0.00, 95.55, 21.00, 0.00, 0.00, 0.00, 550.55, '2014-03-12 18:28:37', '2014-03-12 18:28:37'),
(59, 37, 3, 13, 'Servicio de Vigilancia', 42.35, 455.00, 0.00, 95.55, 21.00, 0.00, 0.00, 0.00, 550.55, '2014-03-12 18:28:44', '2014-03-12 18:28:44'),
(60, 38, 3, 5, 'Servicio de Vigilancia', 42.35, 175.00, 0.00, 36.75, 21.00, 0.00, 0.00, 0.00, 211.75, '2014-03-12 18:30:17', '2014-03-12 18:30:17'),
(61, 39, 7, 1, 'Serv. maniobra Inter. Paso de Los Libres', 69081.80, 57092.40, 0.00, 11989.40, 21.00, 0.00, 0.00, 0.00, 69081.80, '2014-03-12 18:32:17', '2014-03-12 18:32:17'),
(62, 39, 6, 1, 'Serv. Extra, Adicional y/o Preventivos', 43982.10, 36348.84, 0.00, 7633.26, 21.00, 0.00, 0.00, 0.00, 43982.10, '2014-03-12 18:32:50', '2014-03-12 18:32:50'),
(63, 39, 9, 1, 'Apoyo maniobra Inter. Paso de Los Libres', 968.00, 800.00, 0.00, 168.00, 21.00, 0.00, 0.00, 0.00, 968.00, '2014-03-12 18:33:18', '2014-03-12 18:33:18'),
(65, 40, 3, 8, 'Servicio de Vigilancia', 54.45, 360.00, 0.00, 75.60, 21.00, 0.00, 0.00, 0.00, 435.60, '2014-03-12 18:36:55', '2014-03-12 18:36:55'),
(66, 40, 3, 20, 'Servicio de Vigilancia', 54.45, 900.00, 0.00, 189.00, 21.00, 0.00, 0.00, 0.00, 1089.00, '2014-03-12 18:37:23', '2014-03-12 18:37:23'),
(67, 41, 3, 24, 'Servicio de Vigilancia', 54.45, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-03-12 18:44:46', '2014-03-12 18:44:46'),
(68, 42, 3, 24, 'Servicio de Vigilancia', 54.45, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-03-12 18:46:17', '2014-03-12 18:46:17'),
(69, 43, 3, 24, 'Servicio de Vigilancia', 54.45, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-03-12 18:47:13', '2014-03-12 18:47:13'),
(70, 44, 3, 24, 'Servicio de Vigilancia', 54.45, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-03-12 18:47:55', '2014-03-12 18:47:55'),
(71, 45, 3, 20, 'Servicio de Vigilancia', 54.45, 900.00, 0.00, 189.00, 21.00, 0.00, 0.00, 0.00, 1089.00, '2014-03-12 18:48:53', '2014-03-12 18:48:53'),
(72, 46, 3, 20, 'Servicio de Vigilancia', 42.35, 700.00, 0.00, 147.00, 21.00, 0.00, 0.00, 0.00, 847.00, '2014-03-12 18:51:00', '2014-03-12 18:51:00'),
(73, 47, 3, 13, 'Servicio de Vigilancia', 42.35, 455.00, 0.00, 95.55, 21.00, 0.00, 0.00, 0.00, 550.55, '2014-03-12 18:52:00', '2014-03-12 18:52:00'),
(74, 48, 3, 24, 'Servicio de Vigilancia', 45.00, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-03-19 17:22:00', '2014-03-19 17:22:00'),
(75, 49, 3, 20, 'Servicio de Vigilancia', 45.00, 900.00, 0.00, 189.00, 21.00, 0.00, 0.00, 0.00, 1089.00, '2014-03-19 17:23:52', '2014-03-19 17:23:52'),
(77, 61, 2, 1, 'Servicio de Seguridad', 15004.00, 12400.00, 0.00, 2604.00, 21.00, 0.00, 0.00, 0.00, 15004.00, '2014-03-22 03:17:11', '2014-03-22 03:17:11');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `armaslegajos`
--
ALTER TABLE `armaslegajos`
  ADD CONSTRAINT `fk_armaslegajos_armas1` FOREIGN KEY (`armas_id`) REFERENCES `armas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_armaslegajos_legajos1` FOREIGN KEY (`legajos_id`) REFERENCES `legajos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `fk_articulos_proveedores1` FOREIGN KEY (`proveedors_id`) REFERENCES `proveedors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_articulos_rubro1` FOREIGN KEY (`rubros_id`) REFERENCES `rubros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `articulosdepositos`
--
ALTER TABLE `articulosdepositos`
  ADD CONSTRAINT `fk_articulos_depositos_articulos1` FOREIGN KEY (`articulos_id`) REFERENCES `articulos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_articulos_depositos_depositos1` FOREIGN KEY (`depositos_id`) REFERENCES `depositos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `centroscostoscomprasmovimientos`
--
ALTER TABLE `centroscostoscomprasmovimientos`
  ADD CONSTRAINT `fk_centroscostoscomprasmovimientos_centrocostos1` FOREIGN KEY (`centrocostos_id`) REFERENCES `centrocostos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_centroscostoscomprasmovimientos_comprasmovimientos1` FOREIGN KEY (`comprasmovimientos_id`) REFERENCES `comprasmovimientos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ciudads`
--
ALTER TABLE `ciudads`
  ADD CONSTRAINT `fk_ciudads_provincias1` FOREIGN KEY (`provincias_id`) REFERENCES `provincias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_centrocostos1` FOREIGN KEY (`centrocostos_id`) REFERENCES `centrocostos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_clientes_ciudads1` FOREIGN KEY (`ciudads_id`) REFERENCES `ciudads` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_clientes_responsabilidadesivas1` FOREIGN KEY (`responsabilidadesivas_id`) REFERENCES `responsabilidadesivas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comprasmovimientos`
--
ALTER TABLE `comprasmovimientos`
  ADD CONSTRAINT `fk_comprasmovimientos_proveedors1` FOREIGN KEY (`proveedors_id`) REFERENCES `proveedors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_movimientos_tipos_documentos0` FOREIGN KEY (`tiposdocumentos_id`) REFERENCES `tiposdocumentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_movimientos_users10` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_movimiento_condiciones_ventas10` FOREIGN KEY (`condicionesventas_id`) REFERENCES `condicionesventas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleoscategorias`
--
ALTER TABLE `empleoscategorias`
  ADD CONSTRAINT `fk_empleoscategorias_sindicatos1` FOREIGN KEY (`sindicatos_id`) REFERENCES `sindicatos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `legajos`
--
ALTER TABLE `legajos`
  ADD CONSTRAINT `fk_legajos_ciudads1` FOREIGN KEY (`ciudads_id`) REFERENCES `ciudads` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_legajos_empleoscategorias1` FOREIGN KEY (`empleoscategorias_id`) REFERENCES `empleoscategorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_legajos_obrassocials1` FOREIGN KEY (`obrassocials_id`) REFERENCES `obrassocials` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `legajoslicencias`
--
ALTER TABLE `legajoslicencias`
  ADD CONSTRAINT `fk_legajoslicencias_licencias1` FOREIGN KEY (`licencias_id`) REFERENCES `licencias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_legajos1` FOREIGN KEY (`legajos_id`) REFERENCES `legajos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `partesdiarios`
--
ALTER TABLE `partesdiarios`
  ADD CONSTRAINT `fk_partesdiarios_centrocostos1` FOREIGN KEY (`centrocostos_id`) REFERENCES `centrocostos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_partesdiarios_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `partesdiarioscuerpos`
--
ALTER TABLE `partesdiarioscuerpos`
  ADD CONSTRAINT `fk_partesdiarioscuerpos_legajos1` FOREIGN KEY (`legajos_id`) REFERENCES `legajos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_partesdiarioscuerpos_partesdiarios1` FOREIGN KEY (`partesdiarios_id`) REFERENCES `partesdiarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_partesdiarioscuerpos_partesdiariosnovedads1` FOREIGN KEY (`partesdiariosnovedads_id`) REFERENCES `partesdiariosnovedads` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedors`
--
ALTER TABLE `proveedors`
  ADD CONSTRAINT `fk_proveedores_responsabilidad_iva1` FOREIGN KEY (`responsabilidadesivas_id`) REFERENCES `responsabilidadesivas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedors_centrocostos1` FOREIGN KEY (`centrocostos_id`) REFERENCES `centrocostos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedors_ciudads1` FOREIGN KEY (`ciudads_id`) REFERENCES `ciudads` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `fk_vehiculos_centrocostos1` FOREIGN KEY (`centrocostos_id`) REFERENCES `centrocostos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vehiculoslicencias`
--
ALTER TABLE `vehiculoslicencias`
  ADD CONSTRAINT `fk_vehiculoslicencias_vehiculos1` FOREIGN KEY (`vehiculos_id`) REFERENCES `vehiculos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vehiculoslicencias_vehiculoslicenciastipos1` FOREIGN KEY (`vehiculoslicenciastipos_id`) REFERENCES `vehiculoslicenciastipos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventasmovimientos`
--
ALTER TABLE `ventasmovimientos`
  ADD CONSTRAINT `fk_ventasmovimientos_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_movimientos_tipos_documentos` FOREIGN KEY (`tiposdocumentos_id`) REFERENCES `tiposdocumentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_movimientos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_movimiento_condiciones_ventas1` FOREIGN KEY (`condicionesventas_id`) REFERENCES `condicionesventas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventasmovimientoscuerpos`
--
ALTER TABLE `ventasmovimientoscuerpos`
  ADD CONSTRAINT `fk_venta_movimiento_cuerpo_articulos1` FOREIGN KEY (`articulos_id`) REFERENCES `articulos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_movimiento_cuerpo_venta_movimientos1` FOREIGN KEY (`ventasmovimientos_id`) REFERENCES `ventasmovimientos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de datos: `information_schema`
--
CREATE DATABASE `information_schema` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `information_schema`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CHARACTER_SETS`
--

CREATE TEMPORARY TABLE `CHARACTER_SETS` (
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `DEFAULT_COLLATE_NAME` varchar(32) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(60) NOT NULL DEFAULT '',
  `MAXLEN` bigint(3) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CHARACTER_SETS`
--

INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES
('big5', 'big5_chinese_ci', 'Big5 Traditional Chinese', 2),
('dec8', 'dec8_swedish_ci', 'DEC West European', 1),
('cp850', 'cp850_general_ci', 'DOS West European', 1),
('hp8', 'hp8_english_ci', 'HP West European', 1),
('koi8r', 'koi8r_general_ci', 'KOI8-R Relcom Russian', 1),
('latin1', 'latin1_swedish_ci', 'cp1252 West European', 1),
('latin2', 'latin2_general_ci', 'ISO 8859-2 Central European', 1),
('swe7', 'swe7_swedish_ci', '7bit Swedish', 1),
('ascii', 'ascii_general_ci', 'US ASCII', 1),
('ujis', 'ujis_japanese_ci', 'EUC-JP Japanese', 3),
('sjis', 'sjis_japanese_ci', 'Shift-JIS Japanese', 2),
('hebrew', 'hebrew_general_ci', 'ISO 8859-8 Hebrew', 1),
('tis620', 'tis620_thai_ci', 'TIS620 Thai', 1),
('euckr', 'euckr_korean_ci', 'EUC-KR Korean', 2),
('koi8u', 'koi8u_general_ci', 'KOI8-U Ukrainian', 1),
('gb2312', 'gb2312_chinese_ci', 'GB2312 Simplified Chinese', 2),
('greek', 'greek_general_ci', 'ISO 8859-7 Greek', 1),
('cp1250', 'cp1250_general_ci', 'Windows Central European', 1),
('gbk', 'gbk_chinese_ci', 'GBK Simplified Chinese', 2),
('latin5', 'latin5_turkish_ci', 'ISO 8859-9 Turkish', 1),
('armscii8', 'armscii8_general_ci', 'ARMSCII-8 Armenian', 1),
('utf8', 'utf8_general_ci', 'UTF-8 Unicode', 3),
('ucs2', 'ucs2_general_ci', 'UCS-2 Unicode', 2),
('cp866', 'cp866_general_ci', 'DOS Russian', 1),
('keybcs2', 'keybcs2_general_ci', 'DOS Kamenicky Czech-Slovak', 1),
('macce', 'macce_general_ci', 'Mac Central European', 1),
('macroman', 'macroman_general_ci', 'Mac West European', 1),
('cp852', 'cp852_general_ci', 'DOS Central European', 1),
('latin7', 'latin7_general_ci', 'ISO 8859-13 Baltic', 1),
('utf8mb4', 'utf8mb4_general_ci', 'UTF-8 Unicode', 4),
('cp1251', 'cp1251_general_ci', 'Windows Cyrillic', 1),
('utf16', 'utf16_general_ci', 'UTF-16 Unicode', 4),
('cp1256', 'cp1256_general_ci', 'Windows Arabic', 1),
('cp1257', 'cp1257_general_ci', 'Windows Baltic', 1),
('utf32', 'utf32_general_ci', 'UTF-32 Unicode', 4),
('binary', 'binary', 'Binary pseudo charset', 1),
('geostd8', 'geostd8_general_ci', 'GEOSTD8 Georgian', 1),
('cp932', 'cp932_japanese_ci', 'SJIS for Windows Japanese', 2),
('eucjpms', 'eucjpms_japanese_ci', 'UJIS for Windows Japanese', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `COLLATIONS`
--

CREATE TEMPORARY TABLE `COLLATIONS` (
  `COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `ID` bigint(11) NOT NULL DEFAULT '0',
  `IS_DEFAULT` varchar(3) NOT NULL DEFAULT '',
  `IS_COMPILED` varchar(3) NOT NULL DEFAULT '',
  `SORTLEN` bigint(3) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `COLLATIONS`
--

INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES
('big5_chinese_ci', 'big5', 1, 'Yes', 'Yes', 1),
('big5_bin', 'big5', 84, '', 'Yes', 1),
('dec8_swedish_ci', 'dec8', 3, 'Yes', 'Yes', 1),
('dec8_bin', 'dec8', 69, '', 'Yes', 1),
('cp850_general_ci', 'cp850', 4, 'Yes', 'Yes', 1),
('cp850_bin', 'cp850', 80, '', 'Yes', 1),
('hp8_english_ci', 'hp8', 6, 'Yes', 'Yes', 1),
('hp8_bin', 'hp8', 72, '', 'Yes', 1),
('koi8r_general_ci', 'koi8r', 7, 'Yes', 'Yes', 1),
('koi8r_bin', 'koi8r', 74, '', 'Yes', 1),
('latin1_german1_ci', 'latin1', 5, '', 'Yes', 1),
('latin1_swedish_ci', 'latin1', 8, 'Yes', 'Yes', 1),
('latin1_danish_ci', 'latin1', 15, '', 'Yes', 1),
('latin1_german2_ci', 'latin1', 31, '', 'Yes', 2),
('latin1_bin', 'latin1', 47, '', 'Yes', 1),
('latin1_general_ci', 'latin1', 48, '', 'Yes', 1),
('latin1_general_cs', 'latin1', 49, '', 'Yes', 1),
('latin1_spanish_ci', 'latin1', 94, '', 'Yes', 1),
('latin2_czech_cs', 'latin2', 2, '', 'Yes', 4),
('latin2_general_ci', 'latin2', 9, 'Yes', 'Yes', 1),
('latin2_hungarian_ci', 'latin2', 21, '', 'Yes', 1),
('latin2_croatian_ci', 'latin2', 27, '', 'Yes', 1),
('latin2_bin', 'latin2', 77, '', 'Yes', 1),
('swe7_swedish_ci', 'swe7', 10, 'Yes', 'Yes', 1),
('swe7_bin', 'swe7', 82, '', 'Yes', 1),
('ascii_general_ci', 'ascii', 11, 'Yes', 'Yes', 1),
('ascii_bin', 'ascii', 65, '', 'Yes', 1),
('ujis_japanese_ci', 'ujis', 12, 'Yes', 'Yes', 1),
('ujis_bin', 'ujis', 91, '', 'Yes', 1),
('sjis_japanese_ci', 'sjis', 13, 'Yes', 'Yes', 1),
('sjis_bin', 'sjis', 88, '', 'Yes', 1),
('hebrew_general_ci', 'hebrew', 16, 'Yes', 'Yes', 1),
('hebrew_bin', 'hebrew', 71, '', 'Yes', 1),
('tis620_thai_ci', 'tis620', 18, 'Yes', 'Yes', 4),
('tis620_bin', 'tis620', 89, '', 'Yes', 1),
('euckr_korean_ci', 'euckr', 19, 'Yes', 'Yes', 1),
('euckr_bin', 'euckr', 85, '', 'Yes', 1),
('koi8u_general_ci', 'koi8u', 22, 'Yes', 'Yes', 1),
('koi8u_bin', 'koi8u', 75, '', 'Yes', 1),
('gb2312_chinese_ci', 'gb2312', 24, 'Yes', 'Yes', 1),
('gb2312_bin', 'gb2312', 86, '', 'Yes', 1),
('greek_general_ci', 'greek', 25, 'Yes', 'Yes', 1),
('greek_bin', 'greek', 70, '', 'Yes', 1),
('cp1250_general_ci', 'cp1250', 26, 'Yes', 'Yes', 1),
('cp1250_czech_cs', 'cp1250', 34, '', 'Yes', 2),
('cp1250_croatian_ci', 'cp1250', 44, '', 'Yes', 1),
('cp1250_bin', 'cp1250', 66, '', 'Yes', 1),
('cp1250_polish_ci', 'cp1250', 99, '', 'Yes', 1),
('gbk_chinese_ci', 'gbk', 28, 'Yes', 'Yes', 1),
('gbk_bin', 'gbk', 87, '', 'Yes', 1),
('latin5_turkish_ci', 'latin5', 30, 'Yes', 'Yes', 1),
('latin5_bin', 'latin5', 78, '', 'Yes', 1),
('armscii8_general_ci', 'armscii8', 32, 'Yes', 'Yes', 1),
('armscii8_bin', 'armscii8', 64, '', 'Yes', 1),
('utf8_general_ci', 'utf8', 33, 'Yes', 'Yes', 1),
('utf8_bin', 'utf8', 83, '', 'Yes', 1),
('utf8_unicode_ci', 'utf8', 192, '', 'Yes', 8),
('utf8_icelandic_ci', 'utf8', 193, '', 'Yes', 8),
('utf8_latvian_ci', 'utf8', 194, '', 'Yes', 8),
('utf8_romanian_ci', 'utf8', 195, '', 'Yes', 8),
('utf8_slovenian_ci', 'utf8', 196, '', 'Yes', 8),
('utf8_polish_ci', 'utf8', 197, '', 'Yes', 8),
('utf8_estonian_ci', 'utf8', 198, '', 'Yes', 8),
('utf8_spanish_ci', 'utf8', 199, '', 'Yes', 8),
('utf8_swedish_ci', 'utf8', 200, '', 'Yes', 8),
('utf8_turkish_ci', 'utf8', 201, '', 'Yes', 8),
('utf8_czech_ci', 'utf8', 202, '', 'Yes', 8),
('utf8_danish_ci', 'utf8', 203, '', 'Yes', 8),
('utf8_lithuanian_ci', 'utf8', 204, '', 'Yes', 8),
('utf8_slovak_ci', 'utf8', 205, '', 'Yes', 8),
('utf8_spanish2_ci', 'utf8', 206, '', 'Yes', 8),
('utf8_roman_ci', 'utf8', 207, '', 'Yes', 8),
('utf8_persian_ci', 'utf8', 208, '', 'Yes', 8),
('utf8_esperanto_ci', 'utf8', 209, '', 'Yes', 8),
('utf8_hungarian_ci', 'utf8', 210, '', 'Yes', 8),
('utf8_sinhala_ci', 'utf8', 211, '', 'Yes', 8),
('utf8_general_mysql500_ci', 'utf8', 223, '', 'Yes', 1),
('ucs2_general_ci', 'ucs2', 35, 'Yes', 'Yes', 1),
('ucs2_bin', 'ucs2', 90, '', 'Yes', 1),
('ucs2_unicode_ci', 'ucs2', 128, '', 'Yes', 8),
('ucs2_icelandic_ci', 'ucs2', 129, '', 'Yes', 8),
('ucs2_latvian_ci', 'ucs2', 130, '', 'Yes', 8),
('ucs2_romanian_ci', 'ucs2', 131, '', 'Yes', 8),
('ucs2_slovenian_ci', 'ucs2', 132, '', 'Yes', 8),
('ucs2_polish_ci', 'ucs2', 133, '', 'Yes', 8),
('ucs2_estonian_ci', 'ucs2', 134, '', 'Yes', 8),
('ucs2_spanish_ci', 'ucs2', 135, '', 'Yes', 8),
('ucs2_swedish_ci', 'ucs2', 136, '', 'Yes', 8),
('ucs2_turkish_ci', 'ucs2', 137, '', 'Yes', 8),
('ucs2_czech_ci', 'ucs2', 138, '', 'Yes', 8),
('ucs2_danish_ci', 'ucs2', 139, '', 'Yes', 8),
('ucs2_lithuanian_ci', 'ucs2', 140, '', 'Yes', 8),
('ucs2_slovak_ci', 'ucs2', 141, '', 'Yes', 8),
('ucs2_spanish2_ci', 'ucs2', 142, '', 'Yes', 8),
('ucs2_roman_ci', 'ucs2', 143, '', 'Yes', 8),
('ucs2_persian_ci', 'ucs2', 144, '', 'Yes', 8),
('ucs2_esperanto_ci', 'ucs2', 145, '', 'Yes', 8),
('ucs2_hungarian_ci', 'ucs2', 146, '', 'Yes', 8),
('ucs2_sinhala_ci', 'ucs2', 147, '', 'Yes', 8),
('ucs2_general_mysql500_ci', 'ucs2', 159, '', 'Yes', 1),
('cp866_general_ci', 'cp866', 36, 'Yes', 'Yes', 1),
('cp866_bin', 'cp866', 68, '', 'Yes', 1),
('keybcs2_general_ci', 'keybcs2', 37, 'Yes', 'Yes', 1),
('keybcs2_bin', 'keybcs2', 73, '', 'Yes', 1),
('macce_general_ci', 'macce', 38, 'Yes', 'Yes', 1),
('macce_bin', 'macce', 43, '', 'Yes', 1),
('macroman_general_ci', 'macroman', 39, 'Yes', 'Yes', 1),
('macroman_bin', 'macroman', 53, '', 'Yes', 1),
('cp852_general_ci', 'cp852', 40, 'Yes', 'Yes', 1),
('cp852_bin', 'cp852', 81, '', 'Yes', 1),
('latin7_estonian_cs', 'latin7', 20, '', 'Yes', 1),
('latin7_general_ci', 'latin7', 41, 'Yes', 'Yes', 1),
('latin7_general_cs', 'latin7', 42, '', 'Yes', 1),
('latin7_bin', 'latin7', 79, '', 'Yes', 1),
('utf8mb4_general_ci', 'utf8mb4', 45, 'Yes', 'Yes', 1),
('utf8mb4_bin', 'utf8mb4', 46, '', 'Yes', 1),
('utf8mb4_unicode_ci', 'utf8mb4', 224, '', 'Yes', 8),
('utf8mb4_icelandic_ci', 'utf8mb4', 225, '', 'Yes', 8),
('utf8mb4_latvian_ci', 'utf8mb4', 226, '', 'Yes', 8),
('utf8mb4_romanian_ci', 'utf8mb4', 227, '', 'Yes', 8),
('utf8mb4_slovenian_ci', 'utf8mb4', 228, '', 'Yes', 8),
('utf8mb4_polish_ci', 'utf8mb4', 229, '', 'Yes', 8),
('utf8mb4_estonian_ci', 'utf8mb4', 230, '', 'Yes', 8),
('utf8mb4_spanish_ci', 'utf8mb4', 231, '', 'Yes', 8),
('utf8mb4_swedish_ci', 'utf8mb4', 232, '', 'Yes', 8),
('utf8mb4_turkish_ci', 'utf8mb4', 233, '', 'Yes', 8),
('utf8mb4_czech_ci', 'utf8mb4', 234, '', 'Yes', 8),
('utf8mb4_danish_ci', 'utf8mb4', 235, '', 'Yes', 8),
('utf8mb4_lithuanian_ci', 'utf8mb4', 236, '', 'Yes', 8),
('utf8mb4_slovak_ci', 'utf8mb4', 237, '', 'Yes', 8),
('utf8mb4_spanish2_ci', 'utf8mb4', 238, '', 'Yes', 8),
('utf8mb4_roman_ci', 'utf8mb4', 239, '', 'Yes', 8),
('utf8mb4_persian_ci', 'utf8mb4', 240, '', 'Yes', 8),
('utf8mb4_esperanto_ci', 'utf8mb4', 241, '', 'Yes', 8),
('utf8mb4_hungarian_ci', 'utf8mb4', 242, '', 'Yes', 8),
('utf8mb4_sinhala_ci', 'utf8mb4', 243, '', 'Yes', 8),
('cp1251_bulgarian_ci', 'cp1251', 14, '', 'Yes', 1),
('cp1251_ukrainian_ci', 'cp1251', 23, '', 'Yes', 1),
('cp1251_bin', 'cp1251', 50, '', 'Yes', 1),
('cp1251_general_ci', 'cp1251', 51, 'Yes', 'Yes', 1),
('cp1251_general_cs', 'cp1251', 52, '', 'Yes', 1),
('utf16_general_ci', 'utf16', 54, 'Yes', 'Yes', 1),
('utf16_bin', 'utf16', 55, '', 'Yes', 1),
('utf16_unicode_ci', 'utf16', 101, '', 'Yes', 8),
('utf16_icelandic_ci', 'utf16', 102, '', 'Yes', 8),
('utf16_latvian_ci', 'utf16', 103, '', 'Yes', 8),
('utf16_romanian_ci', 'utf16', 104, '', 'Yes', 8),
('utf16_slovenian_ci', 'utf16', 105, '', 'Yes', 8),
('utf16_polish_ci', 'utf16', 106, '', 'Yes', 8),
('utf16_estonian_ci', 'utf16', 107, '', 'Yes', 8),
('utf16_spanish_ci', 'utf16', 108, '', 'Yes', 8),
('utf16_swedish_ci', 'utf16', 109, '', 'Yes', 8),
('utf16_turkish_ci', 'utf16', 110, '', 'Yes', 8),
('utf16_czech_ci', 'utf16', 111, '', 'Yes', 8),
('utf16_danish_ci', 'utf16', 112, '', 'Yes', 8),
('utf16_lithuanian_ci', 'utf16', 113, '', 'Yes', 8),
('utf16_slovak_ci', 'utf16', 114, '', 'Yes', 8),
('utf16_spanish2_ci', 'utf16', 115, '', 'Yes', 8),
('utf16_roman_ci', 'utf16', 116, '', 'Yes', 8),
('utf16_persian_ci', 'utf16', 117, '', 'Yes', 8),
('utf16_esperanto_ci', 'utf16', 118, '', 'Yes', 8),
('utf16_hungarian_ci', 'utf16', 119, '', 'Yes', 8),
('utf16_sinhala_ci', 'utf16', 120, '', 'Yes', 8),
('cp1256_general_ci', 'cp1256', 57, 'Yes', 'Yes', 1),
('cp1256_bin', 'cp1256', 67, '', 'Yes', 1),
('cp1257_lithuanian_ci', 'cp1257', 29, '', 'Yes', 1),
('cp1257_bin', 'cp1257', 58, '', 'Yes', 1),
('cp1257_general_ci', 'cp1257', 59, 'Yes', 'Yes', 1),
('utf32_general_ci', 'utf32', 60, 'Yes', 'Yes', 1),
('utf32_bin', 'utf32', 61, '', 'Yes', 1),
('utf32_unicode_ci', 'utf32', 160, '', 'Yes', 8),
('utf32_icelandic_ci', 'utf32', 161, '', 'Yes', 8),
('utf32_latvian_ci', 'utf32', 162, '', 'Yes', 8),
('utf32_romanian_ci', 'utf32', 163, '', 'Yes', 8),
('utf32_slovenian_ci', 'utf32', 164, '', 'Yes', 8),
('utf32_polish_ci', 'utf32', 165, '', 'Yes', 8),
('utf32_estonian_ci', 'utf32', 166, '', 'Yes', 8),
('utf32_spanish_ci', 'utf32', 167, '', 'Yes', 8),
('utf32_swedish_ci', 'utf32', 168, '', 'Yes', 8),
('utf32_turkish_ci', 'utf32', 169, '', 'Yes', 8),
('utf32_czech_ci', 'utf32', 170, '', 'Yes', 8),
('utf32_danish_ci', 'utf32', 171, '', 'Yes', 8),
('utf32_lithuanian_ci', 'utf32', 172, '', 'Yes', 8),
('utf32_slovak_ci', 'utf32', 173, '', 'Yes', 8),
('utf32_spanish2_ci', 'utf32', 174, '', 'Yes', 8),
('utf32_roman_ci', 'utf32', 175, '', 'Yes', 8),
('utf32_persian_ci', 'utf32', 176, '', 'Yes', 8),
('utf32_esperanto_ci', 'utf32', 177, '', 'Yes', 8),
('utf32_hungarian_ci', 'utf32', 178, '', 'Yes', 8),
('utf32_sinhala_ci', 'utf32', 179, '', 'Yes', 8),
('binary', 'binary', 63, 'Yes', 'Yes', 1),
('geostd8_general_ci', 'geostd8', 92, 'Yes', 'Yes', 1),
('geostd8_bin', 'geostd8', 93, '', 'Yes', 1),
('cp932_japanese_ci', 'cp932', 95, 'Yes', 'Yes', 1),
('cp932_bin', 'cp932', 96, '', 'Yes', 1),
('eucjpms_japanese_ci', 'eucjpms', 97, 'Yes', 'Yes', 1),
('eucjpms_bin', 'eucjpms', 98, '', 'Yes', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `COLLATION_CHARACTER_SET_APPLICABILITY`
--

CREATE TEMPORARY TABLE `COLLATION_CHARACTER_SET_APPLICABILITY` (
  `COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `COLLATION_CHARACTER_SET_APPLICABILITY`
--

INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES
('big5_chinese_ci', 'big5'),
('big5_bin', 'big5'),
('dec8_swedish_ci', 'dec8'),
('dec8_bin', 'dec8'),
('cp850_general_ci', 'cp850'),
('cp850_bin', 'cp850'),
('hp8_english_ci', 'hp8'),
('hp8_bin', 'hp8'),
('koi8r_general_ci', 'koi8r'),
('koi8r_bin', 'koi8r'),
('latin1_german1_ci', 'latin1'),
('latin1_swedish_ci', 'latin1'),
('latin1_danish_ci', 'latin1'),
('latin1_german2_ci', 'latin1'),
('latin1_bin', 'latin1'),
('latin1_general_ci', 'latin1'),
('latin1_general_cs', 'latin1'),
('latin1_spanish_ci', 'latin1'),
('latin2_czech_cs', 'latin2'),
('latin2_general_ci', 'latin2'),
('latin2_hungarian_ci', 'latin2'),
('latin2_croatian_ci', 'latin2'),
('latin2_bin', 'latin2'),
('swe7_swedish_ci', 'swe7'),
('swe7_bin', 'swe7'),
('ascii_general_ci', 'ascii'),
('ascii_bin', 'ascii'),
('ujis_japanese_ci', 'ujis'),
('ujis_bin', 'ujis'),
('sjis_japanese_ci', 'sjis'),
('sjis_bin', 'sjis'),
('hebrew_general_ci', 'hebrew'),
('hebrew_bin', 'hebrew'),
('tis620_thai_ci', 'tis620'),
('tis620_bin', 'tis620'),
('euckr_korean_ci', 'euckr'),
('euckr_bin', 'euckr'),
('koi8u_general_ci', 'koi8u'),
('koi8u_bin', 'koi8u'),
('gb2312_chinese_ci', 'gb2312'),
('gb2312_bin', 'gb2312'),
('greek_general_ci', 'greek'),
('greek_bin', 'greek'),
('cp1250_general_ci', 'cp1250'),
('cp1250_czech_cs', 'cp1250'),
('cp1250_croatian_ci', 'cp1250'),
('cp1250_bin', 'cp1250'),
('cp1250_polish_ci', 'cp1250'),
('gbk_chinese_ci', 'gbk'),
('gbk_bin', 'gbk'),
('latin5_turkish_ci', 'latin5'),
('latin5_bin', 'latin5'),
('armscii8_general_ci', 'armscii8'),
('armscii8_bin', 'armscii8'),
('utf8_general_ci', 'utf8'),
('utf8_bin', 'utf8'),
('utf8_unicode_ci', 'utf8'),
('utf8_icelandic_ci', 'utf8'),
('utf8_latvian_ci', 'utf8'),
('utf8_romanian_ci', 'utf8'),
('utf8_slovenian_ci', 'utf8'),
('utf8_polish_ci', 'utf8'),
('utf8_estonian_ci', 'utf8'),
('utf8_spanish_ci', 'utf8'),
('utf8_swedish_ci', 'utf8'),
('utf8_turkish_ci', 'utf8'),
('utf8_czech_ci', 'utf8'),
('utf8_danish_ci', 'utf8'),
('utf8_lithuanian_ci', 'utf8'),
('utf8_slovak_ci', 'utf8'),
('utf8_spanish2_ci', 'utf8'),
('utf8_roman_ci', 'utf8'),
('utf8_persian_ci', 'utf8'),
('utf8_esperanto_ci', 'utf8'),
('utf8_hungarian_ci', 'utf8'),
('utf8_sinhala_ci', 'utf8'),
('utf8_general_mysql500_ci', 'utf8'),
('ucs2_general_ci', 'ucs2'),
('ucs2_bin', 'ucs2'),
('ucs2_unicode_ci', 'ucs2'),
('ucs2_icelandic_ci', 'ucs2'),
('ucs2_latvian_ci', 'ucs2'),
('ucs2_romanian_ci', 'ucs2'),
('ucs2_slovenian_ci', 'ucs2'),
('ucs2_polish_ci', 'ucs2'),
('ucs2_estonian_ci', 'ucs2'),
('ucs2_spanish_ci', 'ucs2'),
('ucs2_swedish_ci', 'ucs2'),
('ucs2_turkish_ci', 'ucs2'),
('ucs2_czech_ci', 'ucs2'),
('ucs2_danish_ci', 'ucs2'),
('ucs2_lithuanian_ci', 'ucs2'),
('ucs2_slovak_ci', 'ucs2'),
('ucs2_spanish2_ci', 'ucs2'),
('ucs2_roman_ci', 'ucs2'),
('ucs2_persian_ci', 'ucs2'),
('ucs2_esperanto_ci', 'ucs2'),
('ucs2_hungarian_ci', 'ucs2'),
('ucs2_sinhala_ci', 'ucs2'),
('ucs2_general_mysql500_ci', 'ucs2'),
('cp866_general_ci', 'cp866'),
('cp866_bin', 'cp866'),
('keybcs2_general_ci', 'keybcs2'),
('keybcs2_bin', 'keybcs2'),
('macce_general_ci', 'macce'),
('macce_bin', 'macce'),
('macroman_general_ci', 'macroman'),
('macroman_bin', 'macroman'),
('cp852_general_ci', 'cp852'),
('cp852_bin', 'cp852'),
('latin7_estonian_cs', 'latin7'),
('latin7_general_ci', 'latin7'),
('latin7_general_cs', 'latin7'),
('latin7_bin', 'latin7'),
('utf8mb4_general_ci', 'utf8mb4'),
('utf8mb4_bin', 'utf8mb4'),
('utf8mb4_unicode_ci', 'utf8mb4'),
('utf8mb4_icelandic_ci', 'utf8mb4'),
('utf8mb4_latvian_ci', 'utf8mb4'),
('utf8mb4_romanian_ci', 'utf8mb4'),
('utf8mb4_slovenian_ci', 'utf8mb4'),
('utf8mb4_polish_ci', 'utf8mb4'),
('utf8mb4_estonian_ci', 'utf8mb4'),
('utf8mb4_spanish_ci', 'utf8mb4'),
('utf8mb4_swedish_ci', 'utf8mb4'),
('utf8mb4_turkish_ci', 'utf8mb4'),
('utf8mb4_czech_ci', 'utf8mb4'),
('utf8mb4_danish_ci', 'utf8mb4'),
('utf8mb4_lithuanian_ci', 'utf8mb4'),
('utf8mb4_slovak_ci', 'utf8mb4'),
('utf8mb4_spanish2_ci', 'utf8mb4'),
('utf8mb4_roman_ci', 'utf8mb4'),
('utf8mb4_persian_ci', 'utf8mb4'),
('utf8mb4_esperanto_ci', 'utf8mb4'),
('utf8mb4_hungarian_ci', 'utf8mb4'),
('utf8mb4_sinhala_ci', 'utf8mb4'),
('cp1251_bulgarian_ci', 'cp1251'),
('cp1251_ukrainian_ci', 'cp1251'),
('cp1251_bin', 'cp1251'),
('cp1251_general_ci', 'cp1251'),
('cp1251_general_cs', 'cp1251'),
('utf16_general_ci', 'utf16'),
('utf16_bin', 'utf16'),
('utf16_unicode_ci', 'utf16'),
('utf16_icelandic_ci', 'utf16'),
('utf16_latvian_ci', 'utf16'),
('utf16_romanian_ci', 'utf16'),
('utf16_slovenian_ci', 'utf16'),
('utf16_polish_ci', 'utf16'),
('utf16_estonian_ci', 'utf16'),
('utf16_spanish_ci', 'utf16'),
('utf16_swedish_ci', 'utf16'),
('utf16_turkish_ci', 'utf16'),
('utf16_czech_ci', 'utf16'),
('utf16_danish_ci', 'utf16'),
('utf16_lithuanian_ci', 'utf16'),
('utf16_slovak_ci', 'utf16'),
('utf16_spanish2_ci', 'utf16'),
('utf16_roman_ci', 'utf16'),
('utf16_persian_ci', 'utf16'),
('utf16_esperanto_ci', 'utf16'),
('utf16_hungarian_ci', 'utf16'),
('utf16_sinhala_ci', 'utf16'),
('cp1256_general_ci', 'cp1256'),
('cp1256_bin', 'cp1256'),
('cp1257_lithuanian_ci', 'cp1257'),
('cp1257_bin', 'cp1257'),
('cp1257_general_ci', 'cp1257'),
('utf32_general_ci', 'utf32'),
('utf32_bin', 'utf32'),
('utf32_unicode_ci', 'utf32'),
('utf32_icelandic_ci', 'utf32'),
('utf32_latvian_ci', 'utf32'),
('utf32_romanian_ci', 'utf32'),
('utf32_slovenian_ci', 'utf32'),
('utf32_polish_ci', 'utf32'),
('utf32_estonian_ci', 'utf32'),
('utf32_spanish_ci', 'utf32'),
('utf32_swedish_ci', 'utf32'),
('utf32_turkish_ci', 'utf32'),
('utf32_czech_ci', 'utf32'),
('utf32_danish_ci', 'utf32'),
('utf32_lithuanian_ci', 'utf32'),
('utf32_slovak_ci', 'utf32'),
('utf32_spanish2_ci', 'utf32'),
('utf32_roman_ci', 'utf32'),
('utf32_persian_ci', 'utf32'),
('utf32_esperanto_ci', 'utf32'),
('utf32_hungarian_ci', 'utf32'),
('utf32_sinhala_ci', 'utf32'),
('binary', 'binary'),
('geostd8_general_ci', 'geostd8'),
('geostd8_bin', 'geostd8'),
('cp932_japanese_ci', 'cp932'),
('cp932_bin', 'cp932'),
('eucjpms_japanese_ci', 'eucjpms'),
('eucjpms_bin', 'eucjpms');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `COLUMNS`
--

CREATE TEMPORARY TABLE `COLUMNS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COLUMN_DEFAULT` longtext,
  `IS_NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_PRECISION` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_SCALE` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(32) DEFAULT NULL,
  `COLLATION_NAME` varchar(32) DEFAULT NULL,
  `COLUMN_TYPE` longtext NOT NULL,
  `COLUMN_KEY` varchar(3) NOT NULL DEFAULT '',
  `EXTRA` varchar(27) NOT NULL DEFAULT '',
  `PRIVILEGES` varchar(80) NOT NULL DEFAULT '',
  `COLUMN_COMMENT` varchar(1024) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `COLUMNS`
--

INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
('def', 'information_schema', 'CHARACTER_SETS', 'CHARACTER_SET_NAME', 1, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'CHARACTER_SETS', 'DEFAULT_COLLATE_NAME', 2, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'CHARACTER_SETS', 'DESCRIPTION', 3, '', 'NO', 'varchar', 60, 180, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(60)', '', '', 'select', ''),
('def', 'information_schema', 'CHARACTER_SETS', 'MAXLEN', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'ID', 3, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(11)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'IS_DEFAULT', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'IS_COMPILED', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'SORTLEN', 6, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'TABLE_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLUMN_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'ORDINAL_POSITION', 5, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLUMN_DEFAULT', 6, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'IS_NULLABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'DATA_TYPE', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'CHARACTER_MAXIMUM_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'CHARACTER_OCTET_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'NUMERIC_PRECISION', 11, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'NUMERIC_SCALE', 12, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'CHARACTER_SET_NAME', 13, NULL, 'YES', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLLATION_NAME', 14, NULL, 'YES', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLUMN_TYPE', 15, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLUMN_KEY', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'EXTRA', 17, '', 'NO', 'varchar', 27, 81, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(27)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'PRIVILEGES', 18, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLUMN_COMMENT', 19, '', 'NO', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_CATALOG', 2, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'COLUMN_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'PRIVILEGE_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'IS_GRANTABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'ENGINE', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'SUPPORT', 2, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'COMMENT', 3, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'TRANSACTIONS', 4, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'XA', 5, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'SAVEPOINTS', 6, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_CATALOG', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'DEFINER', 4, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'TIME_ZONE', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_BODY', 6, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_DEFINITION', 7, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_TYPE', 8, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EXECUTE_AT', 9, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'INTERVAL_VALUE', 10, NULL, 'YES', 'varchar', 256, 768, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(256)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'INTERVAL_FIELD', 11, NULL, 'YES', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'SQL_MODE', 12, '', 'NO', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'STARTS', 13, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'ENDS', 14, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'STATUS', 15, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'ON_COMPLETION', 16, '', 'NO', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'CREATED', 17, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'LAST_ALTERED', 18, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'LAST_EXECUTED', 19, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_COMMENT', 20, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'ORIGINATOR', 21, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'CHARACTER_SET_CLIENT', 22, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'COLLATION_CONNECTION', 23, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'DATABASE_COLLATION', 24, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'FILE_ID', 1, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'FILE_NAME', 2, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'FILE_TYPE', 3, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TABLESPACE_NAME', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TABLE_CATALOG', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TABLE_SCHEMA', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TABLE_NAME', 7, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'LOGFILE_GROUP_NAME', 8, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'LOGFILE_GROUP_NUMBER', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'ENGINE', 10, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'FULLTEXT_KEYS', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'DELETED_ROWS', 12, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'UPDATE_COUNT', 13, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'FREE_EXTENTS', 14, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TOTAL_EXTENTS', 15, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'EXTENT_SIZE', 16, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'INITIAL_SIZE', 17, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'MAXIMUM_SIZE', 18, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'AUTOEXTEND_SIZE', 19, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'CREATION_TIME', 20, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'LAST_UPDATE_TIME', 21, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'LAST_ACCESS_TIME', 22, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'RECOVER_TIME', 23, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TRANSACTION_COUNTER', 24, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'VERSION', 25, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'ROW_FORMAT', 26, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TABLE_ROWS', 27, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'AVG_ROW_LENGTH', 28, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'DATA_LENGTH', 29, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'MAX_DATA_LENGTH', 30, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'INDEX_LENGTH', 31, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'DATA_FREE', 32, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'CREATE_TIME', 33, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'UPDATE_TIME', 34, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'CHECK_TIME', 35, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'CHECKSUM', 36, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'STATUS', 37, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'EXTRA', 38, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
('def', 'information_schema', 'GLOBAL_STATUS', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'GLOBAL_STATUS', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'GLOBAL_VARIABLES', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'GLOBAL_VARIABLES', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_CATALOG', 4, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'COLUMN_NAME', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'ORDINAL_POSITION', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'POSITION_IN_UNIQUE_CONSTRAINT', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_SCHEMA', 10, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_NAME', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_COLUMN_NAME', 12, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'SPECIFIC_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'SPECIFIC_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'SPECIFIC_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'ORDINAL_POSITION', 4, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'PARAMETER_MODE', 5, NULL, 'YES', 'varchar', 5, 15, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(5)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'PARAMETER_NAME', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'DATA_TYPE', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'CHARACTER_MAXIMUM_LENGTH', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'CHARACTER_OCTET_LENGTH', 9, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'NUMERIC_PRECISION', 10, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'NUMERIC_SCALE', 11, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'CHARACTER_SET_NAME', 12, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'COLLATION_NAME', 13, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'DTD_IDENTIFIER', 14, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'ROUTINE_TYPE', 15, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'TABLE_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_NAME', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'SUBPARTITION_NAME', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_ORDINAL_POSITION', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'SUBPARTITION_ORDINAL_POSITION', 7, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_METHOD', 8, NULL, 'YES', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'SUBPARTITION_METHOD', 9, NULL, 'YES', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_EXPRESSION', 10, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'SUBPARTITION_EXPRESSION', 11, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_DESCRIPTION', 12, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'TABLE_ROWS', 13, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'AVG_ROW_LENGTH', 14, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'DATA_LENGTH', 15, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'MAX_DATA_LENGTH', 16, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'INDEX_LENGTH', 17, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'DATA_FREE', 18, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'CREATE_TIME', 19, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'UPDATE_TIME', 20, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'CHECK_TIME', 21, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'CHECKSUM', 22, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_COMMENT', 23, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'NODEGROUP', 24, '', 'NO', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'TABLESPACE_NAME', 25, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_VERSION', 2, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_STATUS', 3, '', 'NO', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_TYPE', 4, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_TYPE_VERSION', 5, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_LIBRARY', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_LIBRARY_VERSION', 7, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_AUTHOR', 8, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_DESCRIPTION', 9, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_LICENSE', 10, NULL, 'YES', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'LOAD_OPTION', 11, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'ID', 1, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'USER', 2, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'HOST', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'DB', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'COMMAND', 5, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'TIME', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(7)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'STATE', 7, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'INFO', 8, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'QUERY_ID', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'SEQ', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'STATE', 3, '', 'NO', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'DURATION', 4, '0.000000', 'NO', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'CPU_USER', 5, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'CPU_SYSTEM', 6, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'CONTEXT_VOLUNTARY', 7, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'CONTEXT_INVOLUNTARY', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'BLOCK_OPS_IN', 9, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'BLOCK_OPS_OUT', 10, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'MESSAGES_SENT', 11, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'MESSAGES_RECEIVED', 12, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'PAGE_FAULTS_MAJOR', 13, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'PAGE_FAULTS_MINOR', 14, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'SWAPS', 15, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'SOURCE_FUNCTION', 16, NULL, 'YES', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'SOURCE_FILE', 17, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'SOURCE_LINE', 18, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_CATALOG', 4, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_NAME', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'MATCH_OPTION', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UPDATE_RULE', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'DELETE_RULE', 9, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'TABLE_NAME', 10, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'REFERENCED_TABLE_NAME', 11, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'SPECIFIC_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_CATALOG', 2, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_TYPE', 5, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'DATA_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'CHARACTER_MAXIMUM_LENGTH', 7, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'CHARACTER_OCTET_LENGTH', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'NUMERIC_PRECISION', 9, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'NUMERIC_SCALE', 10, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'CHARACTER_SET_NAME', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'COLLATION_NAME', 12, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'DTD_IDENTIFIER', 13, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_BODY', 14, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_DEFINITION', 15, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'EXTERNAL_NAME', 16, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'EXTERNAL_LANGUAGE', 17, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'PARAMETER_STYLE', 18, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'IS_DETERMINISTIC', 19, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'SQL_DATA_ACCESS', 20, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'SQL_PATH', 21, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'SECURITY_TYPE', 22, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'CREATED', 23, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'LAST_ALTERED', 24, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'SQL_MODE', 25, '', 'NO', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_COMMENT', 26, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'DEFINER', 27, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'CHARACTER_SET_CLIENT', 28, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'COLLATION_CONNECTION', 29, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'DATABASE_COLLATION', 30, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMATA', 'CATALOG_NAME', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMATA', 'SCHEMA_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMATA', 'DEFAULT_CHARACTER_SET_NAME', 3, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMATA', 'DEFAULT_COLLATION_NAME', 4, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMATA', 'SQL_PATH', 5, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_CATALOG', 2, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'PRIVILEGE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'IS_GRANTABLE', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'SESSION_STATUS', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'SESSION_STATUS', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'SESSION_VARIABLES', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'SESSION_VARIABLES', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'TABLE_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'NON_UNIQUE', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(1)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'INDEX_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'INDEX_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'SEQ_IN_INDEX', 7, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(2)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'COLUMN_NAME', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'COLLATION', 9, NULL, 'YES', 'varchar', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'CARDINALITY', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'SUB_PART', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'PACKED', 12, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'NULLABLE', 13, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'INDEX_TYPE', 14, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'COMMENT', 15, NULL, 'YES', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'INDEX_COMMENT', 16, '', 'NO', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'ENGINE', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'VERSION', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'ROW_FORMAT', 7, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_ROWS', 8, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'AVG_ROW_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'DATA_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'MAX_DATA_LENGTH', 11, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'INDEX_LENGTH', 12, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'DATA_FREE', 13, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'AUTO_INCREMENT', 14, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'CREATE_TIME', 15, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'UPDATE_TIME', 16, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'CHECK_TIME', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_COLLATION', 18, NULL, 'YES', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'CHECKSUM', 19, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'CREATE_OPTIONS', 20, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_COMMENT', 21, '', 'NO', 'varchar', 2048, 6144, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(2048)', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'TABLESPACE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'ENGINE', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'TABLESPACE_TYPE', 3, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'LOGFILE_GROUP_NAME', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'EXTENT_SIZE', 5, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'AUTOEXTEND_SIZE', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'MAXIMUM_SIZE', 7, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'NODEGROUP_ID', 8, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
('def', 'information_schema', 'TABLESPACES', 'TABLESPACE_COMMENT', 9, NULL, 'YES', 'varchar', 2048, 6144, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(2048)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_SCHEMA', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_CATALOG', 2, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'PRIVILEGE_TYPE', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'IS_GRANTABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'TRIGGER_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'TRIGGER_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'TRIGGER_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'EVENT_MANIPULATION', 4, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_CATALOG', 5, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_SCHEMA', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_TABLE', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_ORDER', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_CONDITION', 9, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_STATEMENT', 10, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_ORIENTATION', 11, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_TIMING', 12, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_TABLE', 13, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_TABLE', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_ROW', 15, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_ROW', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'CREATED', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'SQL_MODE', 18, '', 'NO', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'DEFINER', 19, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'CHARACTER_SET_CLIENT', 20, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'COLLATION_CONNECTION', 21, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'DATABASE_COLLATION', 22, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'USER_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'USER_PRIVILEGES', 'TABLE_CATALOG', 2, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'USER_PRIVILEGES', 'PRIVILEGE_TYPE', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'USER_PRIVILEGES', 'IS_GRANTABLE', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'TABLE_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'VIEW_DEFINITION', 4, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'CHECK_OPTION', 5, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'IS_UPDATABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'DEFINER', 7, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'SECURITY_TYPE', 8, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'CHARACTER_SET_CLIENT', 9, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'COLLATION_CONNECTION', 10, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'POOL_ID', 1, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'BLOCK_ID', 2, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'SPACE', 3, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'PAGE_NUMBER', 4, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'PAGE_TYPE', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'FLUSH_TYPE', 6, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'FIX_COUNT', 7, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'IS_HASHED', 8, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'NEWEST_MODIFICATION', 9, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'OLDEST_MODIFICATION', 10, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'ACCESS_TIME', 11, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'TABLE_NAME', 12, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'INDEX_NAME', 13, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'NUMBER_RECORDS', 14, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'DATA_SIZE', 15, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'COMPRESSED_SIZE', 16, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'PAGE_STATE', 17, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'IO_FIX', 18, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'IS_OLD', 19, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'FREE_PAGE_CLOCK', 20, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_id', 1, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_state', 2, '', 'NO', 'varchar', 13, 39, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(13)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_started', 3, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_requested_lock_id', 4, NULL, 'YES', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_wait_started', 5, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_weight', 6, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_mysql_thread_id', 7, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_query', 8, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_operation_state', 9, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_tables_in_use', 10, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_tables_locked', 11, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_lock_structs', 12, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_lock_memory_bytes', 13, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_rows_locked', 14, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_rows_modified', 15, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_concurrency_tickets', 16, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_isolation_level', 17, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_unique_checks', 18, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(1)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_foreign_key_checks', 19, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(1)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_last_foreign_key_error', 20, NULL, 'YES', 'varchar', 256, 768, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(256)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_adaptive_hash_latched', 21, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(1)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_adaptive_hash_timeout', 22, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'POOL_ID', 1, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'POOL_SIZE', 2, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'FREE_BUFFERS', 3, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'DATABASE_PAGES', 4, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'OLD_DATABASE_PAGES', 5, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'MODIFIED_DATABASE_PAGES', 6, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PENDING_DECOMPRESS', 7, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PENDING_READS', 8, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PENDING_FLUSH_LRU', 9, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PENDING_FLUSH_LIST', 10, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PAGES_MADE_YOUNG', 11, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PAGES_NOT_MADE_YOUNG', 12, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PAGES_MADE_YOUNG_RATE', 13, '0', 'NO', 'double', NULL, NULL, 12, NULL, NULL, NULL, 'double', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PAGES_MADE_NOT_YOUNG_RATE', 14, '0', 'NO', 'double', NULL, NULL, 12, NULL, NULL, NULL, 'double', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'NUMBER_PAGES_READ', 15, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'NUMBER_PAGES_CREATED', 16, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'NUMBER_PAGES_WRITTEN', 17, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PAGES_READ_RATE', 18, '0', 'NO', 'double', NULL, NULL, 12, NULL, NULL, NULL, 'double', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PAGES_CREATE_RATE', 19, '0', 'NO', 'double', NULL, NULL, 12, NULL, NULL, NULL, 'double', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PAGES_WRITTEN_RATE', 20, '0', 'NO', 'double', NULL, NULL, 12, NULL, NULL, NULL, 'double', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'NUMBER_PAGES_GET', 21, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'HIT_RATE', 22, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'YOUNG_MAKE_PER_THOUSAND_GETS', 23, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'NOT_YOUNG_MAKE_PER_THOUSAND_GETS', 24, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'NUMBER_PAGES_READ_AHEAD', 25, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'NUMBER_READ_AHEAD_EVICTED', 26, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'READ_AHEAD_RATE', 27, '0', 'NO', 'double', NULL, NULL, 12, NULL, NULL, NULL, 'double', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'READ_AHEAD_EVICTED_RATE', 28, '0', 'NO', 'double', NULL, NULL, 12, NULL, NULL, NULL, 'double', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'LRU_IO_TOTAL', 29, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'LRU_IO_CURRENT', 30, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'UNCOMPRESS_TOTAL', 31, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'UNCOMPRESS_CURRENT', 32, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCK_WAITS', 'requesting_trx_id', 1, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCK_WAITS', 'requested_lock_id', 2, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCK_WAITS', 'blocking_trx_id', 3, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCK_WAITS', 'blocking_lock_id', 4, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'page_size', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(5)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'buffer_pool_instance', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'pages_used', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'pages_free', 4, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'relocation_ops', 5, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'relocation_time', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'page_size', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(5)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'compress_ops', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'compress_ops_ok', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'compress_time', 4, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'uncompress_ops', 5, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'uncompress_time', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_id', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_trx_id', 2, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_mode', 3, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_type', 4, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_table', 5, '', 'NO', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_index', 6, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_space', 7, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_page', 8, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_rec', 9, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_data', 10, NULL, 'YES', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'page_size', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(5)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'buffer_pool_instance', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'pages_used', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'pages_free', 4, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'relocation_ops', 5, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'relocation_time', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'page_size', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(5)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'compress_ops', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'compress_ops_ok', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'compress_time', 4, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'uncompress_ops', 5, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'uncompress_time', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'POOL_ID', 1, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'LRU_POSITION', 2, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'SPACE', 3, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'PAGE_NUMBER', 4, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'PAGE_TYPE', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'FLUSH_TYPE', 6, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'FIX_COUNT', 7, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'IS_HASHED', 8, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'NEWEST_MODIFICATION', 9, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'OLDEST_MODIFICATION', 10, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'ACCESS_TIME', 11, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'TABLE_NAME', 12, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'INDEX_NAME', 13, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'NUMBER_RECORDS', 14, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'DATA_SIZE', 15, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'COMPRESSED_SIZE', 16, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'COMPRESSED', 17, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'IO_FIX', 18, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'IS_OLD', 19, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'FREE_PAGE_CLOCK', 20, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'admin_m3code.com', 'armas', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'armas', 'arma', 2, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'armas', 'serie', 3, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'armas', 'licenciarenar', 4, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'armas', 'fecha_vencimiento', 5, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'armas', 'propietario', 6, NULL, 'YES', 'enum', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''propia'',''tercero'')', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'armas', 'created_at', 7, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'armas', 'updated_at', 8, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'armaslegajos', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'armaslegajos', 'armas_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'armaslegajos', 'legajos_id', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'armaslegajos', 'created_at', 4, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'armaslegajos', 'estado', 5, NULL, 'YES', 'enum', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''entregada'',''deposito'')', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'armaslegajos', 'fecha_entrega', 6, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'armaslegajos', 'fecha_devolucion', 7, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'armaslegajos', 'updated_at', 8, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulos', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulos', 'articulo', 2, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulos', 'rubros_id', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulos', 'proveedors_id', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulos', 'precio_base', 5, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulos', 'utilidad', 6, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulos', 'precio_publico', 7, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulos', 'iva', 8, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulos', 'created_at', 9, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulos', 'updated_at', 10, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulosdepositos', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulosdepositos', 'depositos_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulosdepositos', 'articulos_id', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulosdepositos', 'stock_actual', 4, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulosdepositos', 'stock_minimo', 5, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulosdepositos', 'created_at', 6, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'articulosdepositos', 'updated_at', 7, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'centrocostos', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'centrocostos', 'centrocosto', 2, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'centrocostos', 'created_at', 3, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'centrocostos', 'updated_at', 4, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 'centrocostos_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 'comprasmovimientos_id', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 'importe', 4, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 'created_at', 5, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 'updated_at', 6, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ciudads', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ciudads', 'ciudad', 2, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ciudads', 'created_at', 3, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ciudads', 'updated_at', 4, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ciudads', 'provincias_id', 5, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'clientes', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'clientes', 'cliente', 2, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'clientes', 'direccion', 3, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'clientes', 'cuit', 4, NULL, 'YES', 'varchar', 11, 33, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(11)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'clientes', 'telefono', 5, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'clientes', 'email', 6, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'clientes', 'contacto', 7, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'clientes', 'responsabilidadesivas_id', 8, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'clientes', 'ciudads_id', 9, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'clientes', 'created_at', 10, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'clientes', 'updated_at', 11, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'clientes', 'centrocostos_id', 12, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'fecha', 2, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'fecha_vencimiento', 3, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'tiposdocumentos_id', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'numero_comprobante', 5, NULL, 'YES', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'tipo_movimiento', 6, NULL, 'YES', 'enum', 5, 15, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''debe'',''haber'')', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'importe_total', 7, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'saldo_movimiento', 8, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'condicionesventas_id', 9, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'importe_gravado', 10, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'importe_no_gravado', 11, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'importe_iva', 12, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'importe_otros_impuestos', 13, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'porcentaje_bonificacion', 14, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'importe_bonificacion', 15, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'estado', 16, NULL, 'YES', 'enum', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''abierto'',''cerrada'',''pendiente'',''cancelada'')', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'observaciones', 17, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'created_at', 18, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'updated_at', 19, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'users_id', 20, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'proveedors_id', 21, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'condicionesventas', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'condicionesventas', 'condicionesventa', 2, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'condicionesventas', 'created_at', 3, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'condicionesventas', 'updated_at', 4, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'configs', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'configs', 'codigo', 2, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'configs', 'texto', 3, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'configs', 'fecha', 4, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'configs', 'estado', 5, NULL, 'YES', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'configs', 'entero', 6, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'configs', 'decimal', 7, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'depositos', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'depositos', 'deposito', 2, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'depositos', 'created_at', 3, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'depositos', 'updated_at', 4, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'empleoscategorias', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'empleoscategorias', 'empleoscategoria', 2, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'empleoscategorias', 'valor_jornal', 3, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'empleoscategorias', 'sindicatos_id', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'empleoscategorias', 'created_at', 5, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'empleoscategorias', 'updated_at', 6, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajos', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
('def', 'admin_m3code.com', 'legajos', 'legajo', 2, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajos', 'apellidoynombre', 3, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajos', 'direccion', 4, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajos', 'ciudads_id', 5, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajos', 'telefono', 6, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajos', 'numero_documento', 7, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajos', 'numero_cuil', 8, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajos', 'tipo_contrato', 9, NULL, 'YES', 'enum', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''permanente'',''contratado'')', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajos', 'fecha_ingreso', 10, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajos', 'fecha_egreso', 11, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajos', 'estado', 12, NULL, 'YES', 'enum', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''activo'',''inactivo'')', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajos', 'empleoscategorias_id', 13, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajos', 'obrassocials_id', 14, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajos', 'created_at', 15, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajos', 'updated_at', 16, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajoslicencias', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajoslicencias', 'legajos_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajoslicencias', 'licencias_id', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajoslicencias', 'numero_licencia', 4, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajoslicencias', 'fecha_vencimiento', 5, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajoslicencias', 'created_at', 6, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'legajoslicencias', 'updated_at', 7, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'licencias', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'licencias', 'licencia', 2, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'licencias', 'created_at', 3, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'licencias', 'updated_at', 4, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'obrassocials', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'obrassocials', 'obrassocial', 2, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'obrassocials', 'codigo', 3, NULL, 'YES', 'varchar', 15, 45, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(15)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'obrassocials', 'created_at', 4, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'obrassocials', 'updated_at', 5, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarios', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarios', 'centrocostos_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarios', 'fecha', 3, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarios', 'users_id', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarios', 'observaciones', 5, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarios', 'estado', 6, NULL, 'YES', 'enum', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''abierto'',''cerrado'')', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarios', 'created_at', 7, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarios', 'updated_at', 8, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarioscuerpos', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarioscuerpos', 'partesdiarios_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarioscuerpos', 'legajos_id', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarioscuerpos', 'fecha_entrada', 4, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarioscuerpos', 'fecha_salida', 5, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarioscuerpos', 'partesdiariosnovedads_id', 6, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarioscuerpos', 'created_at', 7, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiarioscuerpos', 'updated_at', 8, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiariosnovedads', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiariosnovedads', 'partesdiariosnovedad', 2, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiariosnovedads', 'created_at', 3, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'partesdiariosnovedads', 'updated_at', 4, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'proveedors', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'proveedors', 'proveedor', 2, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'proveedors', 'cuit', 3, NULL, 'YES', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'proveedors', 'direccion', 4, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'proveedors', 'telefono', 5, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'proveedors', 'contacto', 6, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'proveedors', 'responsabilidadesivas_id', 7, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'proveedors', 'created_at', 8, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'proveedors', 'updated_at', 9, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'proveedors', 'ciudads_id', 10, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'proveedors', 'centrocostos_id', 11, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'provincias', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'provincias', 'provincia', 2, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'provincias', 'created_at', 3, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'provincias', 'updated_at', 4, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'responsabilidadesivas', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'responsabilidadesivas', 'responsabilidadesiva', 2, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'responsabilidadesivas', 'updated_at', 3, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'responsabilidadesivas', 'venta_tiposdocumentos_id', 4, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'responsabilidadesivas', 'recibo_tiposdocumentos_id', 5, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'responsabilidadesivas', 'nc_tiposdocumentos_id', 6, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'responsabilidadesivas', 'nd_tiposdocumentos_id', 7, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'responsabilidadesivas', 'created_at', 8, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'rubros', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'rubros', 'rubro', 2, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'rubros', 'created_at', 3, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'rubros', 'updated_at', 4, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'sindicatos', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'sindicatos', 'sindicato', 2, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'sindicatos', 'descripcion', 3, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'sindicatos', 'valor_alicuota', 4, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'sindicatos', 'created_at', 5, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'sindicatos', 'updated_at', 6, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'tiposdocumentos', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'tiposdocumentos', 'tiposdocumento', 2, NULL, 'YES', 'varchar', 75, 225, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(75)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'tiposdocumentos', 'numero_documento', 3, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'tiposdocumentos', 'tipo', 4, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'tiposdocumentos', 'created_at', 5, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'tiposdocumentos', 'updated_at', 6, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'users', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'users', 'username', 2, NULL, 'YES', 'varchar', 75, 225, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(75)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'users', 'email', 3, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'users', 'password', 4, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'users', 'created_at', 5, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'users', 'updated_at', 6, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculos', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculos', 'vehiculo', 2, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculos', 'patente', 3, NULL, 'YES', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculos', 'estado', 4, NULL, 'YES', 'enum', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''activo'',''inactivo'')', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculos', 'tipo', 5, NULL, 'YES', 'enum', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''propio'',''tercero'')', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculos', 'centrocostos_id', 6, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculos', 'created_at', 7, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculos', 'updated_at', 8, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculoslicencias', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculoslicencias', 'vehiculos_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculoslicencias', 'vehiculoslicenciastipos_id', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculoslicencias', 'fecha_alta', 4, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculoslicencias', 'fecha_vencimiento', 5, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculoslicencias', 'numero_licencia', 6, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculoslicencias', 'estado', 7, NULL, 'YES', 'enum', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''activo'',''inactivo'')', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculoslicencias', 'created_at', 8, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculoslicencias', 'updated_at', 9, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculoslicenciastipos', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculoslicenciastipos', 'vehiculoslicenciastipo', 2, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculoslicenciastipos', 'created_at', 3, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'vehiculoslicenciastipos', 'updated_at', 4, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'fecha', 2, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'fecha_vencimiento', 3, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'tiposdocumentos_id', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'numero_comprobante', 5, NULL, 'YES', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'tipo_movimiento', 6, NULL, 'YES', 'enum', 5, 15, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''debe'',''haber'')', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'importe_total', 7, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'saldo_movimiento', 8, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'condicionesventas_id', 9, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'importe_gravado', 10, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'importe_no_gravado', 11, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'importe_iva', 12, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'importe_otros_impuestos', 13, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'porcentaje_bonificacion', 14, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'importe_bonificacion', 15, NULL, 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'estado', 16, NULL, 'YES', 'enum', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'enum(''abierto'',''cerrada'',''pendiente'',''cancelada'')', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'observaciones', 17, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'created_at', 18, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'updated_at', 19, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'users_id', 20, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'clientes_id', 21, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'ventasmovimientos_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'articulos_id', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'cantidad', 4, '0', 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'articulo', 5, NULL, 'YES', 'varchar', 125, 375, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(125)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'precio_unitario', 6, '0.00', 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'importe_gravado', 7, '0.00', 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'importe_no_gravado', 8, '0.00', 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'importe_iva', 9, '0.00', 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'porcentaje_iva', 10, '0.00', 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'importes_otros_impuestos', 11, '0.00', 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'porcentaje_bonificacion', 12, '0.00', 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'bonificacion', 13, '0.00', 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'precio_total', 14, '0.00', 'YES', 'decimal', NULL, NULL, 10, 2, NULL, NULL, 'decimal(10,2)', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'created_at', 15, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'updated_at', 16, NULL, 'YES', 'timestamp', NULL, NULL, NULL, NULL, NULL, NULL, 'timestamp', '', '', 'select,insert,update,references', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `COLUMN_PRIVILEGES`
--

CREATE TEMPORARY TABLE `COLUMN_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ENGINES`
--

CREATE TEMPORARY TABLE `ENGINES` (
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `SUPPORT` varchar(8) NOT NULL DEFAULT '',
  `COMMENT` varchar(80) NOT NULL DEFAULT '',
  `TRANSACTIONS` varchar(3) DEFAULT NULL,
  `XA` varchar(3) DEFAULT NULL,
  `SAVEPOINTS` varchar(3) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ENGINES`
--

INSERT INTO `ENGINES` (`ENGINE`, `SUPPORT`, `COMMENT`, `TRANSACTIONS`, `XA`, `SAVEPOINTS`) VALUES
('MyISAM', 'YES', 'MyISAM storage engine', 'NO', 'NO', 'NO'),
('CSV', 'YES', 'CSV storage engine', 'NO', 'NO', 'NO'),
('MRG_MYISAM', 'YES', 'Collection of identical MyISAM tables', 'NO', 'NO', 'NO'),
('BLACKHOLE', 'YES', '/dev/null storage engine (anything you write to it disappears)', 'NO', 'NO', 'NO'),
('MEMORY', 'YES', 'Hash based, stored in memory, useful for temporary tables', 'NO', 'NO', 'NO'),
('FEDERATED', 'NO', 'Federated MySQL storage engine', NULL, NULL, NULL),
('ARCHIVE', 'YES', 'Archive storage engine', 'NO', 'NO', 'NO'),
('PERFORMANCE_SCHEMA', 'YES', 'Performance Schema', 'NO', 'NO', 'NO'),
('InnoDB', 'DEFAULT', 'Supports transactions, row-level locking, and foreign keys', 'YES', 'YES', 'YES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EVENTS`
--

CREATE TEMPORARY TABLE `EVENTS` (
  `EVENT_CATALOG` varchar(64) NOT NULL DEFAULT '',
  `EVENT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `TIME_ZONE` varchar(64) NOT NULL DEFAULT '',
  `EVENT_BODY` varchar(8) NOT NULL DEFAULT '',
  `EVENT_DEFINITION` longtext NOT NULL,
  `EVENT_TYPE` varchar(9) NOT NULL DEFAULT '',
  `EXECUTE_AT` datetime DEFAULT NULL,
  `INTERVAL_VALUE` varchar(256) DEFAULT NULL,
  `INTERVAL_FIELD` varchar(18) DEFAULT NULL,
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `STARTS` datetime DEFAULT NULL,
  `ENDS` datetime DEFAULT NULL,
  `STATUS` varchar(18) NOT NULL DEFAULT '',
  `ON_COMPLETION` varchar(12) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `EVENT_COMMENT` varchar(64) NOT NULL DEFAULT '',
  `ORIGINATOR` bigint(10) NOT NULL DEFAULT '0',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FILES`
--

CREATE TEMPORARY TABLE `FILES` (
  `FILE_ID` bigint(4) NOT NULL DEFAULT '0',
  `FILE_NAME` varchar(64) DEFAULT NULL,
  `FILE_TYPE` varchar(20) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL,
  `TABLE_CATALOG` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `TABLE_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NUMBER` bigint(4) DEFAULT NULL,
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `FULLTEXT_KEYS` varchar(64) DEFAULT NULL,
  `DELETED_ROWS` bigint(4) DEFAULT NULL,
  `UPDATE_COUNT` bigint(4) DEFAULT NULL,
  `FREE_EXTENTS` bigint(4) DEFAULT NULL,
  `TOTAL_EXTENTS` bigint(4) DEFAULT NULL,
  `EXTENT_SIZE` bigint(4) NOT NULL DEFAULT '0',
  `INITIAL_SIZE` bigint(21) unsigned DEFAULT NULL,
  `MAXIMUM_SIZE` bigint(21) unsigned DEFAULT NULL,
  `AUTOEXTEND_SIZE` bigint(21) unsigned DEFAULT NULL,
  `CREATION_TIME` datetime DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime DEFAULT NULL,
  `LAST_ACCESS_TIME` datetime DEFAULT NULL,
  `RECOVER_TIME` bigint(4) DEFAULT NULL,
  `TRANSACTION_COUNTER` bigint(4) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `STATUS` varchar(20) NOT NULL DEFAULT '',
  `EXTRA` varchar(255) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GLOBAL_STATUS`
--

CREATE TEMPORARY TABLE `GLOBAL_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `GLOBAL_STATUS`
--

INSERT INTO `GLOBAL_STATUS` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('ABORTED_CLIENTS', '1'),
('ABORTED_CONNECTS', '2348'),
('BINLOG_CACHE_DISK_USE', '0'),
('BINLOG_CACHE_USE', '0'),
('BINLOG_STMT_CACHE_DISK_USE', '0'),
('BINLOG_STMT_CACHE_USE', '0'),
('BYTES_RECEIVED', '48271580'),
('BYTES_SENT', '372233336'),
('COM_ADMIN_COMMANDS', '42'),
('COM_ASSIGN_TO_KEYCACHE', '0'),
('COM_ALTER_DB', '0'),
('COM_ALTER_DB_UPGRADE', '0'),
('COM_ALTER_EVENT', '0'),
('COM_ALTER_FUNCTION', '0'),
('COM_ALTER_PROCEDURE', '0'),
('COM_ALTER_SERVER', '0'),
('COM_ALTER_TABLE', '1'),
('COM_ALTER_TABLESPACE', '0'),
('COM_ANALYZE', '0'),
('COM_BEGIN', '0'),
('COM_BINLOG', '0'),
('COM_CALL_PROCEDURE', '0'),
('COM_CHANGE_DB', '1097316'),
('COM_CHANGE_MASTER', '0'),
('COM_CHECK', '0'),
('COM_CHECKSUM', '0'),
('COM_COMMIT', '0'),
('COM_CREATE_DB', '4'),
('COM_CREATE_EVENT', '0'),
('COM_CREATE_FUNCTION', '0'),
('COM_CREATE_INDEX', '0'),
('COM_CREATE_PROCEDURE', '0'),
('COM_CREATE_SERVER', '0'),
('COM_CREATE_TABLE', '6'),
('COM_CREATE_TRIGGER', '0'),
('COM_CREATE_UDF', '0'),
('COM_CREATE_USER', '0'),
('COM_CREATE_VIEW', '0'),
('COM_DEALLOC_SQL', '0'),
('COM_DELETE', '59'),
('COM_DELETE_MULTI', '0'),
('COM_DO', '0'),
('COM_DROP_DB', '1'),
('COM_DROP_EVENT', '0'),
('COM_DROP_FUNCTION', '0'),
('COM_DROP_INDEX', '0'),
('COM_DROP_PROCEDURE', '0'),
('COM_DROP_SERVER', '0'),
('COM_DROP_TABLE', '0'),
('COM_DROP_TRIGGER', '0'),
('COM_DROP_USER', '2'),
('COM_DROP_VIEW', '0'),
('COM_EMPTY_QUERY', '0'),
('COM_EXECUTE_SQL', '0'),
('COM_FLUSH', '42'),
('COM_GRANT', '12'),
('COM_HA_CLOSE', '0'),
('COM_HA_OPEN', '0'),
('COM_HA_READ', '0'),
('COM_HELP', '0'),
('COM_INSERT', '1740'),
('COM_INSERT_SELECT', '0'),
('COM_INSTALL_PLUGIN', '0'),
('COM_KILL', '0'),
('COM_LOAD', '0'),
('COM_LOCK_TABLES', '155'),
('COM_OPTIMIZE', '0'),
('COM_PRELOAD_KEYS', '0'),
('COM_PREPARE_SQL', '0'),
('COM_PURGE', '0'),
('COM_PURGE_BEFORE_DATE', '0'),
('COM_RELEASE_SAVEPOINT', '0'),
('COM_RENAME_TABLE', '0'),
('COM_RENAME_USER', '0'),
('COM_REPAIR', '0'),
('COM_REPLACE', '0'),
('COM_REPLACE_SELECT', '0'),
('COM_RESET', '0'),
('COM_RESIGNAL', '0'),
('COM_REVOKE', '2'),
('COM_REVOKE_ALL', '0'),
('COM_ROLLBACK', '0'),
('COM_ROLLBACK_TO_SAVEPOINT', '0'),
('COM_SAVEPOINT', '0'),
('COM_SELECT', '180398'),
('COM_SET_OPTION', '31101'),
('COM_SIGNAL', '0'),
('COM_SHOW_AUTHORS', '0'),
('COM_SHOW_BINLOG_EVENTS', '0'),
('COM_SHOW_BINLOGS', '10'),
('COM_SHOW_CHARSETS', '0'),
('COM_SHOW_COLLATIONS', '0'),
('COM_SHOW_CONTRIBUTORS', '0'),
('COM_SHOW_CREATE_DB', '0'),
('COM_SHOW_CREATE_EVENT', '0'),
('COM_SHOW_CREATE_FUNC', '0'),
('COM_SHOW_CREATE_PROC', '0'),
('COM_SHOW_CREATE_TABLE', '3320'),
('COM_SHOW_CREATE_TRIGGER', '0'),
('COM_SHOW_DATABASES', '28'),
('COM_SHOW_ENGINE_LOGS', '0'),
('COM_SHOW_ENGINE_MUTEX', '0'),
('COM_SHOW_ENGINE_STATUS', '0'),
('COM_SHOW_EVENTS', '0'),
('COM_SHOW_ERRORS', '0'),
('COM_SHOW_FIELDS', '3165'),
('COM_SHOW_FUNCTION_STATUS', '8'),
('COM_SHOW_GRANTS', '336'),
('COM_SHOW_KEYS', '66'),
('COM_SHOW_MASTER_STATUS', '9'),
('COM_SHOW_OPEN_TABLES', '0'),
('COM_SHOW_PLUGINS', '166'),
('COM_SHOW_PRIVILEGES', '0'),
('COM_SHOW_PROCEDURE_STATUS', '8'),
('COM_SHOW_PROCESSLIST', '0'),
('COM_SHOW_PROFILE', '0'),
('COM_SHOW_PROFILES', '0'),
('COM_SHOW_RELAYLOG_EVENTS', '0'),
('COM_SHOW_SLAVE_HOSTS', '0'),
('COM_SHOW_SLAVE_STATUS', '9'),
('COM_SHOW_STATUS', '11893'),
('COM_SHOW_STORAGE_ENGINES', '4'),
('COM_SHOW_TABLE_STATUS', '3479'),
('COM_SHOW_TABLES', '209'),
('COM_SHOW_TRIGGERS', '3263'),
('COM_SHOW_VARIABLES', '41'),
('COM_SHOW_WARNINGS', '2'),
('COM_SLAVE_START', '0'),
('COM_SLAVE_STOP', '0'),
('COM_STMT_CLOSE', '20979'),
('COM_STMT_EXECUTE', '20979'),
('COM_STMT_FETCH', '0'),
('COM_STMT_PREPARE', '20979'),
('COM_STMT_REPREPARE', '0'),
('COM_STMT_RESET', '0'),
('COM_STMT_SEND_LONG_DATA', '0'),
('COM_TRUNCATE', '0'),
('COM_UNINSTALL_PLUGIN', '0'),
('COM_UNLOCK_TABLES', '161'),
('COM_UPDATE', '165'),
('COM_UPDATE_MULTI', '0'),
('COM_XA_COMMIT', '0'),
('COM_XA_END', '0'),
('COM_XA_PREPARE', '0'),
('COM_XA_RECOVER', '0'),
('COM_XA_ROLLBACK', '0'),
('COM_XA_START', '0'),
('COMPRESSION', 'OFF'),
('CONNECTIONS', '30457'),
('CREATED_TMP_DISK_TABLES', '7162'),
('CREATED_TMP_FILES', '5'),
('CREATED_TMP_TABLES', '24523'),
('DELAYED_ERRORS', '0'),
('DELAYED_INSERT_THREADS', '0'),
('DELAYED_WRITES', '0'),
('FLUSH_COMMANDS', '1'),
('HANDLER_COMMIT', '90059'),
('HANDLER_DELETE', '63'),
('HANDLER_DISCOVER', '0'),
('HANDLER_PREPARE', '0'),
('HANDLER_READ_FIRST', '55535'),
('HANDLER_READ_KEY', '163695'),
('HANDLER_READ_LAST', '218'),
('HANDLER_READ_NEXT', '7779992'),
('HANDLER_READ_PREV', '10399'),
('HANDLER_READ_RND', '0'),
('HANDLER_READ_RND_NEXT', '7072992'),
('HANDLER_ROLLBACK', '0'),
('HANDLER_SAVEPOINT', '0'),
('HANDLER_SAVEPOINT_ROLLBACK', '0'),
('HANDLER_UPDATE', '287'),
('HANDLER_WRITE', '3800139'),
('INNODB_BUFFER_POOL_PAGES_DATA', '872'),
('INNODB_BUFFER_POOL_BYTES_DATA', '14286848'),
('INNODB_BUFFER_POOL_PAGES_DIRTY', '1'),
('INNODB_BUFFER_POOL_BYTES_DIRTY', '16384'),
('INNODB_BUFFER_POOL_PAGES_FLUSHED', '2903'),
('INNODB_BUFFER_POOL_PAGES_FREE', '7315'),
('INNODB_BUFFER_POOL_PAGES_MISC', '5'),
('INNODB_BUFFER_POOL_PAGES_TOTAL', '8192'),
('INNODB_BUFFER_POOL_READ_AHEAD_RND', '0'),
('INNODB_BUFFER_POOL_READ_AHEAD', '0'),
('INNODB_BUFFER_POOL_READ_AHEAD_EVICTED', '0'),
('INNODB_BUFFER_POOL_READ_REQUESTS', '5936282'),
('INNODB_BUFFER_POOL_READS', '823'),
('INNODB_BUFFER_POOL_WAIT_FREE', '0'),
('INNODB_BUFFER_POOL_WRITE_REQUESTS', '15160'),
('INNODB_DATA_FSYNCS', '4117'),
('INNODB_DATA_PENDING_FSYNCS', '0'),
('INNODB_DATA_PENDING_READS', '0'),
('INNODB_DATA_PENDING_WRITES', '0'),
('INNODB_DATA_READ', '15667200'),
('INNODB_DATA_READS', '915'),
('INNODB_DATA_WRITES', '4608'),
('INNODB_DATA_WRITTEN', '96836096'),
('INNODB_DBLWR_PAGES_WRITTEN', '2903'),
('INNODB_DBLWR_WRITES', '804'),
('INNODB_HAVE_ATOMIC_BUILTINS', 'ON'),
('INNODB_LOG_WAITS', '0'),
('INNODB_LOG_WRITE_REQUESTS', '1594'),
('INNODB_LOG_WRITES', '1184'),
('INNODB_OS_LOG_FSYNCS', '1945'),
('INNODB_OS_LOG_PENDING_FSYNCS', '0'),
('INNODB_OS_LOG_PENDING_WRITES', '0'),
('INNODB_OS_LOG_WRITTEN', '1320960'),
('INNODB_PAGE_SIZE', '16384'),
('INNODB_PAGES_CREATED', '50'),
('INNODB_PAGES_READ', '822'),
('INNODB_PAGES_WRITTEN', '2903'),
('INNODB_ROW_LOCK_CURRENT_WAITS', '0'),
('INNODB_ROW_LOCK_TIME', '0'),
('INNODB_ROW_LOCK_TIME_AVG', '0'),
('INNODB_ROW_LOCK_TIME_MAX', '0'),
('INNODB_ROW_LOCK_WAITS', '0'),
('INNODB_ROWS_DELETED', '55'),
('INNODB_ROWS_INSERTED', '2753'),
('INNODB_ROWS_READ', '3143455'),
('INNODB_ROWS_UPDATED', '275'),
('INNODB_TRUNCATED_STATUS_WRITES', '0'),
('KEY_BLOCKS_NOT_FLUSHED', '0'),
('KEY_BLOCKS_UNUSED', '4364'),
('KEY_BLOCKS_USED', '2334'),
('KEY_READ_REQUESTS', '1732305'),
('KEY_READS', '28'),
('KEY_WRITE_REQUESTS', '217216'),
('KEY_WRITES', '20606'),
('LAST_QUERY_COST', '0.000000'),
('MAX_USED_CONNECTIONS', '10'),
('NOT_FLUSHED_DELAYED_ROWS', '0'),
('OPEN_FILES', '51'),
('OPEN_STREAMS', '0'),
('OPEN_TABLE_DEFINITIONS', '129'),
('OPEN_TABLES', '205'),
('OPENED_FILES', '28887'),
('OPENED_TABLE_DEFINITIONS', '138'),
('OPENED_TABLES', '629'),
('PERFORMANCE_SCHEMA_COND_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_COND_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_HANDLES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_LOCKER_LOST', '0'),
('PERFORMANCE_SCHEMA_MUTEX_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_MUTEX_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_RWLOCK_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_RWLOCK_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_TABLE_HANDLES_LOST', '0'),
('PERFORMANCE_SCHEMA_TABLE_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_THREAD_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_THREAD_INSTANCES_LOST', '0'),
('PREPARED_STMT_COUNT', '0'),
('QCACHE_FREE_BLOCKS', '0'),
('QCACHE_FREE_MEMORY', '0'),
('QCACHE_HITS', '0'),
('QCACHE_INSERTS', '0'),
('QCACHE_LOWMEM_PRUNES', '0'),
('QCACHE_NOT_CACHED', '0'),
('QCACHE_QUERIES_IN_CACHE', '0'),
('QCACHE_TOTAL_BLOCKS', '0'),
('QUERIES', '1415558'),
('QUESTIONS', '1373600'),
('RPL_STATUS', 'AUTH_MASTER'),
('SELECT_FULL_JOIN', '0'),
('SELECT_FULL_RANGE_JOIN', '0'),
('SELECT_RANGE', '777'),
('SELECT_RANGE_CHECK', '0'),
('SELECT_SCAN', '78544'),
('SLAVE_HEARTBEAT_PERIOD', '0.000'),
('SLAVE_OPEN_TEMP_TABLES', '0'),
('SLAVE_RECEIVED_HEARTBEATS', '0'),
('SLAVE_RETRIED_TRANSACTIONS', '0'),
('SLAVE_RUNNING', 'OFF'),
('SLOW_LAUNCH_THREADS', '0'),
('SLOW_QUERIES', '0'),
('SORT_MERGE_PASSES', '0'),
('SORT_RANGE', '9008'),
('SORT_ROWS', '59861'),
('SORT_SCAN', '1034'),
('SSL_ACCEPT_RENEGOTIATES', '0'),
('SSL_ACCEPTS', '0'),
('SSL_CALLBACK_CACHE_HITS', '0'),
('SSL_CIPHER', ''),
('SSL_CIPHER_LIST', ''),
('SSL_CLIENT_CONNECTS', '0'),
('SSL_CONNECT_RENEGOTIATES', '0'),
('SSL_CTX_VERIFY_DEPTH', '0'),
('SSL_CTX_VERIFY_MODE', '0'),
('SSL_DEFAULT_TIMEOUT', '0'),
('SSL_FINISHED_ACCEPTS', '0'),
('SSL_FINISHED_CONNECTS', '0'),
('SSL_SESSION_CACHE_HITS', '0'),
('SSL_SESSION_CACHE_MISSES', '0'),
('SSL_SESSION_CACHE_MODE', 'NONE'),
('SSL_SESSION_CACHE_OVERFLOWS', '0'),
('SSL_SESSION_CACHE_SIZE', '0'),
('SSL_SESSION_CACHE_TIMEOUTS', '0'),
('SSL_SESSIONS_REUSED', '0'),
('SSL_USED_SESSION_CACHE_ENTRIES', '0'),
('SSL_VERIFY_DEPTH', '0'),
('SSL_VERIFY_MODE', '0'),
('SSL_VERSION', ''),
('TABLE_LOCKS_IMMEDIATE', '165704'),
('TABLE_LOCKS_WAITED', '0'),
('TC_LOG_MAX_PAGES_USED', '0'),
('TC_LOG_PAGE_SIZE', '0'),
('TC_LOG_PAGE_WAITS', '0'),
('THREADS_CACHED', '0'),
('THREADS_CONNECTED', '1'),
('THREADS_CREATED', '30456'),
('THREADS_RUNNING', '1'),
('UPTIME', '3567857'),
('UPTIME_SINCE_FLUSH_STATUS', '3567857');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GLOBAL_VARIABLES`
--

CREATE TEMPORARY TABLE `GLOBAL_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `GLOBAL_VARIABLES`
--

INSERT INTO `GLOBAL_VARIABLES` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('MAX_PREPARED_STMT_COUNT', '16382'),
('INNODB_BUFFER_POOL_SIZE', '134217728'),
('HAVE_CRYPT', 'YES'),
('PERFORMANCE_SCHEMA_EVENTS_WAITS_HISTORY_LONG_SIZE', '10000'),
('INNODB_VERSION', '5.5.35'),
('QUERY_PREALLOC_SIZE', '8192'),
('DELAYED_QUEUE_SIZE', '1000'),
('PERFORMANCE_SCHEMA_MAX_COND_INSTANCES', '1000'),
('SSL_CIPHER', ''),
('COLLATION_SERVER', 'latin1_swedish_ci'),
('SECURE_FILE_PRIV', ''),
('TIMED_MUTEXES', 'OFF'),
('DELAYED_INSERT_TIMEOUT', '300'),
('PERFORMANCE_SCHEMA_MAX_MUTEX_INSTANCES', '1000000'),
('LC_TIME_NAMES', 'en_US'),
('PERFORMANCE_SCHEMA_MAX_RWLOCK_INSTANCES', '1000000'),
('TIME_FORMAT', '%H:%i:%s'),
('PERFORMANCE_SCHEMA_MAX_RWLOCK_CLASSES', '30'),
('BASEDIR', '/usr'),
('PERFORMANCE_SCHEMA_MAX_MUTEX_CLASSES', '200'),
('UPDATABLE_VIEWS_WITH_LIMIT', 'YES'),
('BACK_LOG', '50'),
('SLOW_LAUNCH_TIME', '2'),
('EVENT_SCHEDULER', 'OFF'),
('MAX_SEEKS_FOR_KEY', '18446744073709551615'),
('PERFORMANCE_SCHEMA_MAX_THREAD_CLASSES', '50'),
('RELAY_LOG_INDEX', ''),
('FT_STOPWORD_FILE', '(built-in)'),
('SQL_QUOTE_SHOW_CREATE', 'ON'),
('PERFORMANCE_SCHEMA', 'OFF'),
('QUERY_CACHE_SIZE', '0'),
('BINLOG_FORMAT', 'STATEMENT'),
('WAIT_TIMEOUT', '30'),
('LONG_QUERY_TIME', '5.000000'),
('PERFORMANCE_SCHEMA_MAX_TABLE_HANDLES', '100000'),
('CHARACTER_SETS_DIR', '/usr/share/mysql/charsets/'),
('LOWER_CASE_TABLE_NAMES', '0'),
('BINLOG_CACHE_SIZE', '32768'),
('REPORT_HOST', ''),
('CHARACTER_SET_RESULTS', 'latin1'),
('MYISAM_SORT_BUFFER_SIZE', '8388608'),
('CHARACTER_SET_CONNECTION', 'latin1'),
('INNODB_ROLLBACK_SEGMENTS', '128'),
('PRELOAD_BUFFER_SIZE', '32768'),
('LARGE_FILES_SUPPORT', 'ON'),
('MAX_WRITE_LOCK_COUNT', '18446744073709551615'),
('SQL_SAFE_UPDATES', 'OFF'),
('MAX_JOIN_SIZE', '18446744073709551615'),
('NET_BUFFER_LENGTH', '16384'),
('FT_QUERY_EXPANSION_LIMIT', '20'),
('SKIP_SHOW_DATABASE', 'OFF'),
('FT_MAX_WORD_LEN', '84'),
('GROUP_CONCAT_MAX_LEN', '1024'),
('MAX_SP_RECURSION_DEPTH', '0'),
('RANGE_ALLOC_BLOCK_SIZE', '4096'),
('SYNC_RELAY_LOG', '0'),
('OPTIMIZER_PRUNE_LEVEL', '1'),
('HAVE_QUERY_CACHE', 'YES'),
('INNODB_LOG_FILE_SIZE', '5242880'),
('DELAY_KEY_WRITE', 'ON'),
('TRANSACTION_PREALLOC_SIZE', '4096'),
('INTERACTIVE_TIMEOUT', '50'),
('MYISAM_RECOVER_OPTIONS', 'OFF'),
('AUTOMATIC_SP_PRIVILEGES', 'ON'),
('PROTOCOL_VERSION', '10'),
('DELAYED_INSERT_LIMIT', '100'),
('LOW_PRIORITY_UPDATES', 'OFF'),
('COMPLETION_TYPE', 'NO_CHAIN'),
('REPORT_PASSWORD', ''),
('BINLOG_DIRECT_NON_TRANSACTIONAL_UPDATES', 'OFF'),
('MAX_INSERT_DELAYED_THREADS', '20'),
('VERSION_COMMENT', '(Ubuntu)'),
('SQL_BIG_SELECTS', 'ON'),
('AUTO_INCREMENT_OFFSET', '1'),
('TRANSACTION_ALLOC_BLOCK_SIZE', '8192'),
('JOIN_BUFFER_SIZE', '131072'),
('THREAD_CACHE_SIZE', '0'),
('CONNECT_TIMEOUT', '10'),
('INNODB_DOUBLEWRITE', 'ON'),
('SQL_LOW_PRIORITY_UPDATES', 'OFF'),
('IGNORE_BUILTIN_INNODB', 'OFF'),
('INIT_FILE', ''),
('DEFAULT_WEEK_FORMAT', '0'),
('LARGE_PAGES', 'OFF'),
('LOG_OUTPUT', 'FILE'),
('LARGE_PAGE_SIZE', '0'),
('INNODB_IO_CAPACITY', '200'),
('INIT_SLAVE', ''),
('INNODB_USE_NATIVE_AIO', 'OFF'),
('MAX_BINLOG_SIZE', '1073741824'),
('HAVE_SYMLINK', 'YES'),
('MAX_ERROR_COUNT', '64'),
('TIME_ZONE', 'SYSTEM'),
('MAX_CONNECTIONS', '200'),
('INNODB_TABLE_LOCKS', 'ON'),
('INNODB_AUTOEXTEND_INCREMENT', '8'),
('READ_BUFFER_SIZE', '131072'),
('MYISAM_DATA_POINTER_SIZE', '6'),
('INNODB_THREAD_SLEEP_DELAY', '10000'),
('LOG_QUERIES_NOT_USING_INDEXES', 'OFF'),
('SQL_AUTO_IS_NULL', 'OFF'),
('LOWER_CASE_FILE_SYSTEM', 'OFF'),
('SLAVE_TRANSACTION_RETRIES', '10'),
('SORT_BUFFER_SIZE', '2097152'),
('KEEP_FILES_ON_CREATE', 'OFF'),
('MAX_HEAP_TABLE_SIZE', '16777216'),
('SYNC_RELAY_LOG_INFO', '0'),
('LOCK_WAIT_TIMEOUT', '31536000'),
('INNODB_REPLICATION_DELAY', '0'),
('KEY_CACHE_AGE_THRESHOLD', '300'),
('QUERY_CACHE_MIN_RES_UNIT', '4096'),
('NET_RETRY_COUNT', '10'),
('INNODB_STATS_ON_METADATA', 'ON'),
('LOG_WARNINGS', '1'),
('INNODB_ROLLBACK_ON_TIMEOUT', 'OFF'),
('FLUSH', 'OFF'),
('PROFILING_HISTORY_SIZE', '15'),
('MAX_LONG_DATA_SIZE', '1048576'),
('INNODB_CHANGE_BUFFERING', 'all'),
('CHARACTER_SET_SERVER', 'latin1'),
('READ_RND_BUFFER_SIZE', '262144'),
('SLAVE_MAX_ALLOWED_PACKET', '1073741824'),
('INNODB_FILE_FORMAT', 'Antelope'),
('FLUSH_TIME', '0'),
('BIG_TABLES', 'OFF'),
('CHARACTER_SET_DATABASE', 'latin1'),
('SQL_SELECT_LIMIT', '18446744073709551615'),
('BULK_INSERT_BUFFER_SIZE', '8388608'),
('DATE_FORMAT', '%Y-%m-%d'),
('CHARACTER_SET_FILESYSTEM', 'binary'),
('READ_ONLY', 'OFF'),
('BINLOG_STMT_CACHE_SIZE', '32768'),
('MAX_BINLOG_CACHE_SIZE', '18446744073709547520'),
('INNODB_DATA_FILE_PATH', 'ibdata1:10M:autoextend'),
('PERFORMANCE_SCHEMA_MAX_FILE_CLASSES', '50'),
('INNODB_PURGE_THREADS', '0'),
('MAX_SORT_LENGTH', '1024'),
('PROFILING', 'OFF'),
('PERFORMANCE_SCHEMA_EVENTS_WAITS_HISTORY_SIZE', '10'),
('INNODB_STRICT_MODE', 'OFF'),
('SLAVE_COMPRESSED_PROTOCOL', 'OFF'),
('KEY_CACHE_DIVISION_LIMIT', '100'),
('OLD_PASSWORDS', 'OFF'),
('GENERAL_LOG_FILE', '/var/lib/mysql/codex.log'),
('NET_WRITE_TIMEOUT', '60'),
('PERFORMANCE_SCHEMA_MAX_COND_CLASSES', '80'),
('QUERY_CACHE_TYPE', 'ON'),
('AUTO_INCREMENT_INCREMENT', '1'),
('METADATA_LOCKS_CACHE_SIZE', '1024'),
('TMPDIR', '/tmp'),
('QUERY_CACHE_LIMIT', '1048576'),
('EXPIRE_LOGS_DAYS', '0'),
('TX_ISOLATION', 'REPEATABLE-READ'),
('HAVE_PARTITIONING', 'YES'),
('LOG_ERROR', '/var/log/mysql/error.log'),
('FOREIGN_KEY_CHECKS', 'ON'),
('MAX_LENGTH_FOR_SORT_DATA', '1024'),
('RELAY_LOG_INFO_FILE', 'relay-log.info'),
('THREAD_STACK', '262144'),
('INNODB_AUTOINC_LOCK_MODE', '1'),
('NEW', 'OFF'),
('INNODB_COMMIT_CONCURRENCY', '0'),
('SKIP_NAME_RESOLVE', 'OFF'),
('INNODB_MIRRORED_LOG_GROUPS', '1'),
('PID_FILE', '/var/run/mysqld/mysqld.pid'),
('INNODB_PURGE_BATCH_SIZE', '20'),
('MAX_ALLOWED_PACKET', '1048576'),
('VERSION', '5.5.35-0ubuntu0.12.04.2'),
('CONCURRENT_INSERT', 'AUTO'),
('INNODB_SUPPORT_XA', 'ON'),
('TABLE_DEFINITION_CACHE', '400'),
('INNODB_SYNC_SPIN_LOOPS', '30'),
('QUERY_ALLOC_BLOCK_SIZE', '8192'),
('COLLATION_CONNECTION', 'latin1_swedish_ci'),
('MYISAM_REPAIR_THREADS', '1'),
('INNODB_ADAPTIVE_FLUSHING', 'ON'),
('FT_BOOLEAN_SYNTAX', '+ -><()~*:""&|'),
('INNODB_ADAPTIVE_HASH_INDEX', 'ON'),
('VERSION_COMPILE_MACHINE', 'x86_64'),
('SYSTEM_TIME_ZONE', 'EDT'),
('QUERY_CACHE_WLOCK_INVALIDATE', 'OFF'),
('DIV_PRECISION_INCREMENT', '4'),
('SYNC_FRM', 'ON'),
('STORED_PROGRAM_CACHE', '256'),
('TMP_TABLE_SIZE', '16777216'),
('INNODB_DATA_HOME_DIR', ''),
('PERFORMANCE_SCHEMA_MAX_THREAD_INSTANCES', '1000'),
('INNODB_READ_IO_THREADS', '4'),
('MULTI_RANGE_COUNT', '256'),
('INNODB_WRITE_IO_THREADS', '4'),
('SERVER_ID', '0'),
('INNODB_BUFFER_POOL_INSTANCES', '1'),
('SKIP_NETWORKING', 'OFF'),
('INNODB_FORCE_RECOVERY', '0'),
('CHARACTER_SET_SYSTEM', 'utf8'),
('INNODB_LOG_FILES_IN_GROUP', '2'),
('INIT_CONNECT', ''),
('OPTIMIZER_SEARCH_DEPTH', '62'),
('HAVE_DYNAMIC_LOADING', 'YES'),
('AUTOCOMMIT', 'ON'),
('SYNC_BINLOG', '0'),
('SSL_CAPATH', ''),
('INNODB_PRINT_ALL_DEADLOCKS', 'OFF'),
('SLAVE_EXEC_MODE', 'STRICT'),
('INNODB_OPEN_FILES', '300'),
('GENERAL_LOG', 'OFF'),
('INNODB_FILE_FORMAT_CHECK', 'ON'),
('INNODB_READ_AHEAD_THRESHOLD', '56'),
('HOSTNAME', 'codex'),
('KEY_CACHE_BLOCK_SIZE', '1024'),
('OLD', 'OFF'),
('KEY_BUFFER_SIZE', '8388608'),
('REPORT_PORT', '3306'),
('HAVE_NDBCLUSTER', 'NO'),
('SQL_LOG_BIN', 'ON'),
('THREAD_HANDLING', 'one-thread-per-connection'),
('INNODB_STATS_METHOD', 'nulls_equal'),
('LOG_BIN', 'OFF'),
('INNODB_FAST_SHUTDOWN', '1'),
('RELAY_LOG_SPACE_LIMIT', '0'),
('SSL_CA', ''),
('MAX_USER_CONNECTIONS', '30'),
('INNODB_THREAD_CONCURRENCY', '0'),
('SQL_MAX_JOIN_SIZE', '18446744073709551615'),
('SLAVE_NET_TIMEOUT', '3600'),
('TABLE_OPEN_CACHE', '400'),
('INNODB_STATS_SAMPLE_PAGES', '8'),
('SQL_BIG_TABLES', 'OFF'),
('LOCAL_INFILE', 'ON'),
('SQL_BUFFER_RESULT', 'OFF'),
('HAVE_RTREE_KEYS', 'YES'),
('ENGINE_CONDITION_PUSHDOWN', 'ON'),
('HAVE_PROFILING', 'YES'),
('LC_MESSAGES_DIR', '/usr/share/mysql/'),
('OLD_ALTER_TABLE', 'OFF'),
('HAVE_INNODB', 'YES'),
('MYISAM_MMAP_SIZE', '18446744073709551615'),
('SQL_MODE', ''),
('PERFORMANCE_SCHEMA_MAX_FILE_HANDLES', '32768'),
('RELAY_LOG_RECOVERY', 'OFF'),
('REPORT_USER', ''),
('MAX_DELAYED_THREADS', '20'),
('HAVE_GEOMETRY', 'YES'),
('DATETIME_FORMAT', '%Y-%m-%d %H:%i:%s'),
('SLOW_QUERY_LOG', 'OFF'),
('INNODB_FLUSH_LOG_AT_TRX_COMMIT', '1'),
('LC_MESSAGES', 'en_US'),
('MAX_RELAY_LOG_SIZE', '0'),
('LOG', 'OFF'),
('INNODB_RANDOM_READ_AHEAD', 'OFF'),
('OPEN_FILES_LIMIT', '1024'),
('HAVE_CSV', 'YES'),
('DATADIR', '/var/lib/mysql/'),
('PORT', '3306'),
('FT_MIN_WORD_LEN', '4'),
('INNODB_CONCURRENCY_TICKETS', '500'),
('VERSION_COMPILE_OS', 'debian-linux-gnu'),
('LOG_BIN_TRUST_FUNCTION_CREATORS', 'OFF'),
('INNODB_LOCKS_UNSAFE_FOR_BINLOG', 'OFF'),
('INNODB_FORCE_LOAD_CORRUPTED', 'OFF'),
('SQL_WARNINGS', 'OFF'),
('HAVE_OPENSSL', 'DISABLED'),
('RELAY_LOG', ''),
('MAX_BINLOG_STMT_CACHE_SIZE', '18446744073709547520'),
('PLUGIN_DIR', '/usr/lib/mysql/plugin/'),
('PERFORMANCE_SCHEMA_MAX_FILE_INSTANCES', '10000'),
('LOG_SLOW_QUERIES', 'OFF'),
('INNODB_SPIN_WAIT_DELAY', '6'),
('MAX_TMP_TABLES', '32'),
('INNODB_FILE_FORMAT_MAX', 'Antelope'),
('SQL_LOG_OFF', 'OFF'),
('DEFAULT_STORAGE_ENGINE', 'InnoDB'),
('SLOW_QUERY_LOG_FILE', '/var/lib/mysql/codex-slow.log'),
('INNODB_LOCK_WAIT_TIMEOUT', '50'),
('SQL_SLAVE_SKIP_COUNTER', '0'),
('INNODB_OLD_BLOCKS_TIME', '0'),
('SECURE_AUTH', 'OFF'),
('RPL_RECOVERY_RANK', '0'),
('NET_READ_TIMEOUT', '30'),
('MYISAM_STATS_METHOD', 'nulls_unequal'),
('OPTIMIZER_SWITCH', 'index_merge=on,index_merge_union=on,index_merge_sort_union=on,index_merge_intersection=on,engine_condition_pushdown=on'),
('MAX_CONNECT_ERRORS', '10'),
('LOCKED_IN_MEMORY', 'OFF'),
('INNODB_FLUSH_METHOD', ''),
('INNODB_LARGE_PREFIX', 'OFF'),
('INNODB_CHECKSUMS', 'ON'),
('STORAGE_ENGINE', 'InnoDB'),
('SSL_KEY', ''),
('HAVE_SSL', 'DISABLED'),
('MYISAM_USE_MMAP', 'OFF'),
('SLAVE_SKIP_ERRORS', 'OFF'),
('MIN_EXAMINED_ROW_LIMIT', '0'),
('LOG_SLAVE_UPDATES', 'OFF'),
('RELAY_LOG_PURGE', 'ON'),
('SYNC_MASTER_INFO', '0'),
('COLLATION_DATABASE', 'latin1_swedish_ci'),
('INNODB_FILE_PER_TABLE', 'ON'),
('INNODB_LOG_GROUP_HOME_DIR', './'),
('SSL_CERT', ''),
('INNODB_LOG_BUFFER_SIZE', '8388608'),
('SOCKET', '/var/run/mysqld/mysqld.sock'),
('CHARACTER_SET_CLIENT', 'latin1'),
('INNODB_MAX_PURGE_LAG', '0'),
('SKIP_EXTERNAL_LOCKING', 'ON'),
('MYISAM_MAX_SORT_FILE_SIZE', '9223372036853727232'),
('SLAVE_LOAD_TMPDIR', '/tmp'),
('SLAVE_TYPE_CONVERSIONS', ''),
('INNODB_ADDITIONAL_MEM_POOL_SIZE', '8388608'),
('SQL_NOTES', 'ON'),
('INNODB_USE_SYS_MALLOC', 'ON'),
('LICENSE', 'GPL'),
('INNODB_MAX_DIRTY_PAGES_PCT', '75'),
('PERFORMANCE_SCHEMA_MAX_TABLE_INSTANCES', '50000'),
('THREAD_CONCURRENCY', '10'),
('UNIQUE_CHECKS', 'ON'),
('INNODB_OLD_BLOCKS_PCT', '37'),
('HAVE_COMPRESS', 'YES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `KEY_COLUMN_USAGE`
--

CREATE TEMPORARY TABLE `KEY_COLUMN_USAGE` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(10) NOT NULL DEFAULT '0',
  `POSITION_IN_UNIQUE_CONSTRAINT` bigint(10) DEFAULT NULL,
  `REFERENCED_TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `REFERENCED_TABLE_NAME` varchar(64) DEFAULT NULL,
  `REFERENCED_COLUMN_NAME` varchar(64) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `KEY_COLUMN_USAGE`
--

INSERT INTO `KEY_COLUMN_USAGE` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `POSITION_IN_UNIQUE_CONSTRAINT`, `REFERENCED_TABLE_SCHEMA`, `REFERENCED_TABLE_NAME`, `REFERENCED_COLUMN_NAME`) VALUES
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'armas', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'armaslegajos', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_armaslegajos_armas1', 'def', 'admin_m3code.com', 'armaslegajos', 'armas_id', 1, 1, 'admin_m3code.com', 'armas', 'id'),
('def', 'admin_m3code.com', 'fk_armaslegajos_legajos1', 'def', 'admin_m3code.com', 'armaslegajos', 'legajos_id', 1, 1, 'admin_m3code.com', 'legajos', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'articulos', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_articulos_proveedores1', 'def', 'admin_m3code.com', 'articulos', 'proveedors_id', 1, 1, 'admin_m3code.com', 'proveedors', 'id'),
('def', 'admin_m3code.com', 'fk_articulos_rubro1', 'def', 'admin_m3code.com', 'articulos', 'rubros_id', 1, 1, 'admin_m3code.com', 'rubros', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'articulosdepositos', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_articulos_depositos_articulos1', 'def', 'admin_m3code.com', 'articulosdepositos', 'articulos_id', 1, 1, 'admin_m3code.com', 'articulos', 'id'),
('def', 'admin_m3code.com', 'fk_articulos_depositos_depositos1', 'def', 'admin_m3code.com', 'articulosdepositos', 'depositos_id', 1, 1, 'admin_m3code.com', 'depositos', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'centrocostos', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_centroscostoscomprasmovimientos_centrocostos1', 'def', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 'centrocostos_id', 1, 1, 'admin_m3code.com', 'centrocostos', 'id'),
('def', 'admin_m3code.com', 'fk_centroscostoscomprasmovimientos_comprasmovimientos1', 'def', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 'comprasmovimientos_id', 1, 1, 'admin_m3code.com', 'comprasmovimientos', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'ciudads', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_ciudads_provincias1', 'def', 'admin_m3code.com', 'ciudads', 'provincias_id', 1, 1, 'admin_m3code.com', 'provincias', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'clientes', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_clientes_centrocostos1', 'def', 'admin_m3code.com', 'clientes', 'centrocostos_id', 1, 1, 'admin_m3code.com', 'centrocostos', 'id'),
('def', 'admin_m3code.com', 'fk_clientes_ciudads1', 'def', 'admin_m3code.com', 'clientes', 'ciudads_id', 1, 1, 'admin_m3code.com', 'ciudads', 'id'),
('def', 'admin_m3code.com', 'fk_clientes_responsabilidadesivas1', 'def', 'admin_m3code.com', 'clientes', 'responsabilidadesivas_id', 1, 1, 'admin_m3code.com', 'responsabilidadesivas', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'comprasmovimientos', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_comprasmovimientos_proveedors1', 'def', 'admin_m3code.com', 'comprasmovimientos', 'proveedors_id', 1, 1, 'admin_m3code.com', 'proveedors', 'id'),
('def', 'admin_m3code.com', 'fk_venta_movimientos_tipos_documentos0', 'def', 'admin_m3code.com', 'comprasmovimientos', 'tiposdocumentos_id', 1, 1, 'admin_m3code.com', 'tiposdocumentos', 'id'),
('def', 'admin_m3code.com', 'fk_venta_movimientos_users10', 'def', 'admin_m3code.com', 'comprasmovimientos', 'users_id', 1, 1, 'admin_m3code.com', 'users', 'id'),
('def', 'admin_m3code.com', 'fk_venta_movimiento_condiciones_ventas10', 'def', 'admin_m3code.com', 'comprasmovimientos', 'condicionesventas_id', 1, 1, 'admin_m3code.com', 'condicionesventas', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'condicionesventas', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'configs', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'depositos', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'empleoscategorias', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_empleoscategorias_sindicatos1', 'def', 'admin_m3code.com', 'empleoscategorias', 'sindicatos_id', 1, 1, 'admin_m3code.com', 'sindicatos', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'legajos', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_legajos_ciudads1', 'def', 'admin_m3code.com', 'legajos', 'ciudads_id', 1, 1, 'admin_m3code.com', 'ciudads', 'id'),
('def', 'admin_m3code.com', 'fk_legajos_empleoscategorias1', 'def', 'admin_m3code.com', 'legajos', 'empleoscategorias_id', 1, 1, 'admin_m3code.com', 'empleoscategorias', 'id'),
('def', 'admin_m3code.com', 'fk_legajos_obrassocials1', 'def', 'admin_m3code.com', 'legajos', 'obrassocials_id', 1, 1, 'admin_m3code.com', 'obrassocials', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'legajoslicencias', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_legajoslicencias_licencias1', 'def', 'admin_m3code.com', 'legajoslicencias', 'licencias_id', 1, 1, 'admin_m3code.com', 'licencias', 'id'),
('def', 'admin_m3code.com', 'fk_table1_legajos1', 'def', 'admin_m3code.com', 'legajoslicencias', 'legajos_id', 1, 1, 'admin_m3code.com', 'legajos', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'licencias', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'obrassocials', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'partesdiarios', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_partesdiarios_centrocostos1', 'def', 'admin_m3code.com', 'partesdiarios', 'centrocostos_id', 1, 1, 'admin_m3code.com', 'centrocostos', 'id'),
('def', 'admin_m3code.com', 'fk_partesdiarios_users1', 'def', 'admin_m3code.com', 'partesdiarios', 'users_id', 1, 1, 'admin_m3code.com', 'users', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'partesdiarioscuerpos', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_partesdiarioscuerpos_legajos1', 'def', 'admin_m3code.com', 'partesdiarioscuerpos', 'legajos_id', 1, 1, 'admin_m3code.com', 'legajos', 'id'),
('def', 'admin_m3code.com', 'fk_partesdiarioscuerpos_partesdiarios1', 'def', 'admin_m3code.com', 'partesdiarioscuerpos', 'partesdiarios_id', 1, 1, 'admin_m3code.com', 'partesdiarios', 'id'),
('def', 'admin_m3code.com', 'fk_partesdiarioscuerpos_partesdiariosnovedads1', 'def', 'admin_m3code.com', 'partesdiarioscuerpos', 'partesdiariosnovedads_id', 1, 1, 'admin_m3code.com', 'partesdiariosnovedads', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'partesdiariosnovedads', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'proveedors', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_proveedores_responsabilidad_iva1', 'def', 'admin_m3code.com', 'proveedors', 'responsabilidadesivas_id', 1, 1, 'admin_m3code.com', 'responsabilidadesivas', 'id'),
('def', 'admin_m3code.com', 'fk_proveedors_centrocostos1', 'def', 'admin_m3code.com', 'proveedors', 'centrocostos_id', 1, 1, 'admin_m3code.com', 'centrocostos', 'id'),
('def', 'admin_m3code.com', 'fk_proveedors_ciudads1', 'def', 'admin_m3code.com', 'proveedors', 'ciudads_id', 1, 1, 'admin_m3code.com', 'ciudads', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'provincias', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'responsabilidadesivas', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'rubros', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'sindicatos', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'tiposdocumentos', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'users', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'vehiculos', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_vehiculos_centrocostos1', 'def', 'admin_m3code.com', 'vehiculos', 'centrocostos_id', 1, 1, 'admin_m3code.com', 'centrocostos', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'vehiculoslicencias', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_vehiculoslicencias_vehiculos1', 'def', 'admin_m3code.com', 'vehiculoslicencias', 'vehiculos_id', 1, 1, 'admin_m3code.com', 'vehiculos', 'id'),
('def', 'admin_m3code.com', 'fk_vehiculoslicencias_vehiculoslicenciastipos1', 'def', 'admin_m3code.com', 'vehiculoslicencias', 'vehiculoslicenciastipos_id', 1, 1, 'admin_m3code.com', 'vehiculoslicenciastipos', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'vehiculoslicenciastipos', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'ventasmovimientos', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_ventasmovimientos_clientes1', 'def', 'admin_m3code.com', 'ventasmovimientos', 'clientes_id', 1, 1, 'admin_m3code.com', 'clientes', 'id'),
('def', 'admin_m3code.com', 'fk_venta_movimientos_tipos_documentos', 'def', 'admin_m3code.com', 'ventasmovimientos', 'tiposdocumentos_id', 1, 1, 'admin_m3code.com', 'tiposdocumentos', 'id'),
('def', 'admin_m3code.com', 'fk_venta_movimientos_users1', 'def', 'admin_m3code.com', 'ventasmovimientos', 'users_id', 1, 1, 'admin_m3code.com', 'users', 'id'),
('def', 'admin_m3code.com', 'fk_venta_movimiento_condiciones_ventas1', 'def', 'admin_m3code.com', 'ventasmovimientos', 'condicionesventas_id', 1, 1, 'admin_m3code.com', 'condicionesventas', 'id'),
('def', 'admin_m3code.com', 'PRIMARY', 'def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'id', 1, NULL, NULL, NULL, NULL),
('def', 'admin_m3code.com', 'fk_venta_movimiento_cuerpo_articulos1', 'def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'articulos_id', 1, 1, 'admin_m3code.com', 'articulos', 'id'),
('def', 'admin_m3code.com', 'fk_venta_movimiento_cuerpo_venta_movimientos1', 'def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'ventasmovimientos_id', 1, 1, 'admin_m3code.com', 'ventasmovimientos', 'id');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PARAMETERS`
--

CREATE TEMPORARY TABLE `PARAMETERS` (
  `SPECIFIC_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `SPECIFIC_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `SPECIFIC_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` int(21) NOT NULL DEFAULT '0',
  `PARAMETER_MODE` varchar(5) DEFAULT NULL,
  `PARAMETER_NAME` varchar(64) DEFAULT NULL,
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` int(21) DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` int(21) DEFAULT NULL,
  `NUMERIC_PRECISION` int(21) DEFAULT NULL,
  `NUMERIC_SCALE` int(21) DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(64) DEFAULT NULL,
  `COLLATION_NAME` varchar(64) DEFAULT NULL,
  `DTD_IDENTIFIER` longtext NOT NULL,
  `ROUTINE_TYPE` varchar(9) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PARTITIONS`
--

CREATE TEMPORARY TABLE `PARTITIONS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PARTITION_NAME` varchar(64) DEFAULT NULL,
  `SUBPARTITION_NAME` varchar(64) DEFAULT NULL,
  `PARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `SUBPARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_METHOD` varchar(18) DEFAULT NULL,
  `SUBPARTITION_METHOD` varchar(12) DEFAULT NULL,
  `PARTITION_EXPRESSION` longtext,
  `SUBPARTITION_EXPRESSION` longtext,
  `PARTITION_DESCRIPTION` longtext,
  `TABLE_ROWS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `AVG_ROW_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_FREE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_COMMENT` varchar(80) NOT NULL DEFAULT '',
  `NODEGROUP` varchar(12) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `PARTITIONS`
--

INSERT INTO `PARTITIONS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `PARTITION_NAME`, `SUBPARTITION_NAME`, `PARTITION_ORDINAL_POSITION`, `SUBPARTITION_ORDINAL_POSITION`, `PARTITION_METHOD`, `SUBPARTITION_METHOD`, `PARTITION_EXPRESSION`, `SUBPARTITION_EXPRESSION`, `PARTITION_DESCRIPTION`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `CHECKSUM`, `PARTITION_COMMENT`, `NODEGROUP`, `TABLESPACE_NAME`) VALUES
('def', 'information_schema', 'CHARACTER_SETS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 384, 0, 16434816, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'COLLATIONS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 231, 0, 16704765, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 195, 0, 16357770, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'COLUMNS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'COLUMN_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2565, 0, 16757145, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'ENGINES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 490, 0, 16574250, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'EVENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'FILES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2677, 0, 16758020, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'GLOBAL_STATUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'GLOBAL_VARIABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'KEY_COLUMN_USAGE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4637, 0, 16762755, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'PARAMETERS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'PARTITIONS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'PLUGINS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'PROCESSLIST', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'PROFILING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 308, 0, 16562084, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4814, 0, 16767162, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'ROUTINES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'SCHEMATA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3464, 0, 16738048, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2179, 0, 16736899, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'SESSION_STATUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'SESSION_VARIABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'STATISTICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5753, 0, 16752736, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'TABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 9450, 0, 16764300, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'TABLESPACES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6951, 0, 16772763, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'TABLE_CONSTRAINTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2504, 0, 16721712, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'TABLE_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2372, 0, 16748692, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'TRIGGERS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'USER_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1986, 0, 16726092, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'VIEWS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6852, 0, 16766844, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_TRX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4534, 0, 16766732, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 257, 0, 16332350, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_LOCK_WAITS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 599, 0, 16749238, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_CMPMEM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 29, 0, 15204352, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_CMP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 25, 0, 13107200, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_LOCKS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 31244, 0, 16746784, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 29, 0, 15204352, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_CMP_RESET', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 25, 0, 13107200, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6669, 0, 16765866, 0, 0, '2014-05-08 21:31:06', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'armas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 0, 0, '2014-03-12 01:39:12', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'armaslegajos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 0, '2014-03-12 01:39:13', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'articulos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 2340, 16384, NULL, 32768, 0, '2014-03-12 02:30:02', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'articulosdepositos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 0, '2014-03-12 01:39:13', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'centrocostos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 16384, 16384, NULL, 0, 0, '2014-03-12 01:39:12', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'centroscostoscomprasmovimientos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 0, '2014-03-12 01:39:13', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'ciudads', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4096, 16384, NULL, 16384, 0, '2014-03-12 02:51:01', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'clientes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5461, 16384, NULL, 49152, 0, '2014-03-12 02:30:27', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'comprasmovimientos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 65536, 0, '2014-03-12 01:39:13', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'condicionesventas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8192, 16384, NULL, 0, 0, '2014-03-12 01:39:12', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'configs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 0, 0, '2014-03-12 01:39:12', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'depositos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 0, 0, '2014-03-12 01:39:12', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'empleoscategorias', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 16384, 0, '2014-03-12 01:39:13', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'legajos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 49152, 0, '2014-03-12 01:39:13', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'legajoslicencias', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 0, '2014-03-12 01:39:13', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'licencias', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 0, 0, '2014-03-12 01:39:12', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'obrassocials', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 0, 0, '2014-03-12 01:39:12', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'partesdiarios', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 0, '2014-03-12 01:39:13', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'partesdiarioscuerpos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 49152, 0, '2014-03-12 01:39:13', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'partesdiariosnovedads', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 0, 0, '2014-03-12 01:39:12', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'proveedors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 16384, 16384, NULL, 49152, 0, '2014-03-12 02:50:16', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'provincias', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4096, 16384, NULL, 0, 0, '2014-03-12 02:51:43', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'responsabilidadesivas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 16384, 16384, NULL, 0, 0, '2014-03-12 01:39:12', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'rubros', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 16384, 16384, NULL, 0, 0, '2014-03-12 01:39:12', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'sindicatos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 0, 0, '2014-03-12 01:39:12', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'tiposdocumentos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1638, 16384, NULL, 0, 0, '2014-03-12 02:29:17', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'users', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8192, 16384, NULL, 0, 0, '2014-03-12 01:39:12', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'vehiculos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 16384, 0, '2014-03-12 01:39:13', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'vehiculoslicencias', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 0, '2014-03-12 01:39:13', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'vehiculoslicenciastipos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 0, 0, '2014-03-12 01:39:12', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'ventasmovimientos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 327, 16384, NULL, 65536, 0, '2014-03-12 02:27:24', NULL, NULL, NULL, '', '', NULL),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 71, 230, 16384, NULL, 32768, 0, '2014-03-12 01:39:13', NULL, NULL, NULL, '', '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PLUGINS`
--

CREATE TEMPORARY TABLE `PLUGINS` (
  `PLUGIN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PLUGIN_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_STATUS` varchar(10) NOT NULL DEFAULT '',
  `PLUGIN_TYPE` varchar(80) NOT NULL DEFAULT '',
  `PLUGIN_TYPE_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_LIBRARY` varchar(64) DEFAULT NULL,
  `PLUGIN_LIBRARY_VERSION` varchar(20) DEFAULT NULL,
  `PLUGIN_AUTHOR` varchar(64) DEFAULT NULL,
  `PLUGIN_DESCRIPTION` longtext,
  `PLUGIN_LICENSE` varchar(80) DEFAULT NULL,
  `LOAD_OPTION` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `PLUGINS`
--

INSERT INTO `PLUGINS` (`PLUGIN_NAME`, `PLUGIN_VERSION`, `PLUGIN_STATUS`, `PLUGIN_TYPE`, `PLUGIN_TYPE_VERSION`, `PLUGIN_LIBRARY`, `PLUGIN_LIBRARY_VERSION`, `PLUGIN_AUTHOR`, `PLUGIN_DESCRIPTION`, `PLUGIN_LICENSE`, `LOAD_OPTION`) VALUES
('binlog', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50535.0', NULL, NULL, 'MySQL AB', 'This is a pseudo storage engine to represent the binlog in a transaction', 'GPL', 'FORCE'),
('mysql_native_password', '1.0', 'ACTIVE', 'AUTHENTICATION', '1.0', NULL, NULL, 'R.J.Silk, Sergei Golubchik', 'Native MySQL authentication', 'GPL', 'FORCE'),
('mysql_old_password', '1.0', 'ACTIVE', 'AUTHENTICATION', '1.0', NULL, NULL, 'R.J.Silk, Sergei Golubchik', 'Old MySQL-4.0 authentication', 'GPL', 'FORCE'),
('MyISAM', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50535.0', NULL, NULL, 'MySQL AB', 'MyISAM storage engine', 'GPL', 'FORCE'),
('MEMORY', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50535.0', NULL, NULL, 'MySQL AB', 'Hash based, stored in memory, useful for temporary tables', 'GPL', 'FORCE'),
('MRG_MYISAM', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50535.0', NULL, NULL, 'MySQL AB', 'Collection of identical MyISAM tables', 'GPL', 'FORCE'),
('CSV', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50535.0', NULL, NULL, 'Brian Aker, MySQL AB', 'CSV storage engine', 'GPL', 'FORCE'),
('FEDERATED', '1.0', 'DISABLED', 'STORAGE ENGINE', '50535.0', NULL, NULL, 'Patrick Galbraith and Brian Aker, MySQL AB', 'Federated MySQL storage engine', 'GPL', 'OFF'),
('BLACKHOLE', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50535.0', NULL, NULL, 'MySQL AB', '/dev/null storage engine (anything you write to it disappears)', 'GPL', 'ON'),
('PERFORMANCE_SCHEMA', '0.1', 'ACTIVE', 'STORAGE ENGINE', '50535.0', NULL, NULL, 'Marc Alff, Oracle', 'Performance Schema', 'GPL', 'FORCE'),
('ARCHIVE', '3.0', 'ACTIVE', 'STORAGE ENGINE', '50535.0', NULL, NULL, 'Brian Aker, MySQL AB', 'Archive storage engine', 'GPL', 'ON'),
('InnoDB', '5.5', 'ACTIVE', 'STORAGE ENGINE', '50535.0', NULL, NULL, 'Oracle Corporation', 'Supports transactions, row-level locking, and foreign keys', 'GPL', 'ON'),
('INNODB_TRX', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50535.0', NULL, NULL, 'Oracle Corporation', 'InnoDB transactions', 'GPL', 'ON'),
('INNODB_LOCKS', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50535.0', NULL, NULL, 'Oracle Corporation', 'InnoDB conflicting locks', 'GPL', 'ON'),
('INNODB_LOCK_WAITS', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50535.0', NULL, NULL, 'Oracle Corporation', 'InnoDB which lock is blocking which', 'GPL', 'ON'),
('INNODB_CMP', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50535.0', NULL, NULL, 'Oracle Corporation', 'Statistics for the InnoDB compression', 'GPL', 'ON'),
('INNODB_CMP_RESET', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50535.0', NULL, NULL, 'Oracle Corporation', 'Statistics for the InnoDB compression; reset cumulated counts', 'GPL', 'ON'),
('INNODB_CMPMEM', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50535.0', NULL, NULL, 'Oracle Corporation', 'Statistics for the InnoDB compressed buffer pool', 'GPL', 'ON'),
('INNODB_CMPMEM_RESET', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50535.0', NULL, NULL, 'Oracle Corporation', 'Statistics for the InnoDB compressed buffer pool; reset cumulated counts', 'GPL', 'ON'),
('INNODB_BUFFER_PAGE', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50535.0', NULL, NULL, 'Oracle Corporation', 'InnoDB Buffer Page Information', 'GPL', 'ON'),
('INNODB_BUFFER_PAGE_LRU', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50535.0', NULL, NULL, 'Oracle Corporation', 'InnoDB Buffer Page in LRU', 'GPL', 'ON'),
('INNODB_BUFFER_POOL_STATS', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50535.0', NULL, NULL, 'Oracle Corporation', 'InnoDB Buffer Pool Statistics Information ', 'GPL', 'ON'),
('partition', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50535.0', NULL, NULL, 'Mikael Ronstrom, MySQL AB', 'Partition Storage Engine Helper', 'GPL', 'ON');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PROCESSLIST`
--

CREATE TEMPORARY TABLE `PROCESSLIST` (
  `ID` bigint(4) NOT NULL DEFAULT '0',
  `USER` varchar(16) NOT NULL DEFAULT '',
  `HOST` varchar(64) NOT NULL DEFAULT '',
  `DB` varchar(64) DEFAULT NULL,
  `COMMAND` varchar(16) NOT NULL DEFAULT '',
  `TIME` int(7) NOT NULL DEFAULT '0',
  `STATE` varchar(64) DEFAULT NULL,
  `INFO` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `PROCESSLIST`
--

INSERT INTO `PROCESSLIST` (`ID`, `USER`, `HOST`, `DB`, `COMMAND`, `TIME`, `STATE`, `INFO`) VALUES
(30456, 'admin_m3code', 'localhost', 'admin_m3code.com', 'Query', 0, 'executing', 'SELECT * FROM `information_schema`.`PROCESSLIST`');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PROFILING`
--

CREATE TEMPORARY TABLE `PROFILING` (
  `QUERY_ID` int(20) NOT NULL DEFAULT '0',
  `SEQ` int(20) NOT NULL DEFAULT '0',
  `STATE` varchar(30) NOT NULL DEFAULT '',
  `DURATION` decimal(9,6) NOT NULL DEFAULT '0.000000',
  `CPU_USER` decimal(9,6) DEFAULT NULL,
  `CPU_SYSTEM` decimal(9,6) DEFAULT NULL,
  `CONTEXT_VOLUNTARY` int(20) DEFAULT NULL,
  `CONTEXT_INVOLUNTARY` int(20) DEFAULT NULL,
  `BLOCK_OPS_IN` int(20) DEFAULT NULL,
  `BLOCK_OPS_OUT` int(20) DEFAULT NULL,
  `MESSAGES_SENT` int(20) DEFAULT NULL,
  `MESSAGES_RECEIVED` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MAJOR` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MINOR` int(20) DEFAULT NULL,
  `SWAPS` int(20) DEFAULT NULL,
  `SOURCE_FUNCTION` varchar(30) DEFAULT NULL,
  `SOURCE_FILE` varchar(20) DEFAULT NULL,
  `SOURCE_LINE` int(20) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `REFERENTIAL_CONSTRAINTS`
--

CREATE TEMPORARY TABLE `REFERENTIAL_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_NAME` varchar(64) DEFAULT NULL,
  `MATCH_OPTION` varchar(64) NOT NULL DEFAULT '',
  `UPDATE_RULE` varchar(64) NOT NULL DEFAULT '',
  `DELETE_RULE` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `REFERENCED_TABLE_NAME` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `REFERENTIAL_CONSTRAINTS`
--

INSERT INTO `REFERENTIAL_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `UNIQUE_CONSTRAINT_CATALOG`, `UNIQUE_CONSTRAINT_SCHEMA`, `UNIQUE_CONSTRAINT_NAME`, `MATCH_OPTION`, `UPDATE_RULE`, `DELETE_RULE`, `TABLE_NAME`, `REFERENCED_TABLE_NAME`) VALUES
('def', 'admin_m3code.com', 'fk_armaslegajos_armas1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'armaslegajos', 'armas'),
('def', 'admin_m3code.com', 'fk_armaslegajos_legajos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'armaslegajos', 'legajos'),
('def', 'admin_m3code.com', 'fk_articulos_proveedores1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'articulos', 'proveedors'),
('def', 'admin_m3code.com', 'fk_articulos_rubro1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'articulos', 'rubros'),
('def', 'admin_m3code.com', 'fk_articulos_depositos_articulos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'articulosdepositos', 'articulos'),
('def', 'admin_m3code.com', 'fk_articulos_depositos_depositos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'articulosdepositos', 'depositos'),
('def', 'admin_m3code.com', 'fk_centroscostoscomprasmovimientos_centrocostos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'centroscostoscomprasmovimientos', 'centrocostos'),
('def', 'admin_m3code.com', 'fk_centroscostoscomprasmovimientos_comprasmovimientos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'centroscostoscomprasmovimientos', 'comprasmovimientos'),
('def', 'admin_m3code.com', 'fk_ciudads_provincias1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'ciudads', 'provincias'),
('def', 'admin_m3code.com', 'fk_clientes_centrocostos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'clientes', 'centrocostos'),
('def', 'admin_m3code.com', 'fk_clientes_ciudads1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'clientes', 'ciudads'),
('def', 'admin_m3code.com', 'fk_clientes_responsabilidadesivas1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'clientes', 'responsabilidadesivas'),
('def', 'admin_m3code.com', 'fk_comprasmovimientos_proveedors1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'comprasmovimientos', 'proveedors'),
('def', 'admin_m3code.com', 'fk_venta_movimientos_tipos_documentos0', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'comprasmovimientos', 'tiposdocumentos'),
('def', 'admin_m3code.com', 'fk_venta_movimientos_users10', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'comprasmovimientos', 'users'),
('def', 'admin_m3code.com', 'fk_venta_movimiento_condiciones_ventas10', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'comprasmovimientos', 'condicionesventas'),
('def', 'admin_m3code.com', 'fk_empleoscategorias_sindicatos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'empleoscategorias', 'sindicatos'),
('def', 'admin_m3code.com', 'fk_legajos_ciudads1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'legajos', 'ciudads'),
('def', 'admin_m3code.com', 'fk_legajos_empleoscategorias1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'legajos', 'empleoscategorias'),
('def', 'admin_m3code.com', 'fk_legajos_obrassocials1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'legajos', 'obrassocials'),
('def', 'admin_m3code.com', 'fk_legajoslicencias_licencias1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'legajoslicencias', 'licencias'),
('def', 'admin_m3code.com', 'fk_table1_legajos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'legajoslicencias', 'legajos'),
('def', 'admin_m3code.com', 'fk_partesdiarios_centrocostos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'partesdiarios', 'centrocostos'),
('def', 'admin_m3code.com', 'fk_partesdiarios_users1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'partesdiarios', 'users'),
('def', 'admin_m3code.com', 'fk_partesdiarioscuerpos_legajos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'partesdiarioscuerpos', 'legajos'),
('def', 'admin_m3code.com', 'fk_partesdiarioscuerpos_partesdiarios1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'partesdiarioscuerpos', 'partesdiarios'),
('def', 'admin_m3code.com', 'fk_partesdiarioscuerpos_partesdiariosnovedads1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'partesdiarioscuerpos', 'partesdiariosnovedads'),
('def', 'admin_m3code.com', 'fk_proveedores_responsabilidad_iva1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'proveedors', 'responsabilidadesivas'),
('def', 'admin_m3code.com', 'fk_proveedors_centrocostos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'proveedors', 'centrocostos'),
('def', 'admin_m3code.com', 'fk_proveedors_ciudads1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'proveedors', 'ciudads'),
('def', 'admin_m3code.com', 'fk_vehiculos_centrocostos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'vehiculos', 'centrocostos'),
('def', 'admin_m3code.com', 'fk_vehiculoslicencias_vehiculos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'vehiculoslicencias', 'vehiculos'),
('def', 'admin_m3code.com', 'fk_vehiculoslicencias_vehiculoslicenciastipos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'vehiculoslicencias', 'vehiculoslicenciastipos'),
('def', 'admin_m3code.com', 'fk_ventasmovimientos_clientes1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'ventasmovimientos', 'clientes'),
('def', 'admin_m3code.com', 'fk_venta_movimientos_tipos_documentos', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'ventasmovimientos', 'tiposdocumentos'),
('def', 'admin_m3code.com', 'fk_venta_movimientos_users1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'ventasmovimientos', 'users'),
('def', 'admin_m3code.com', 'fk_venta_movimiento_condiciones_ventas1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'ventasmovimientos', 'condicionesventas'),
('def', 'admin_m3code.com', 'fk_venta_movimiento_cuerpo_articulos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'ventasmovimientoscuerpos', 'articulos'),
('def', 'admin_m3code.com', 'fk_venta_movimiento_cuerpo_venta_movimientos1', 'def', 'admin_m3code.com', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'ventasmovimientoscuerpos', 'ventasmovimientos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ROUTINES`
--

CREATE TEMPORARY TABLE `ROUTINES` (
  `SPECIFIC_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `ROUTINE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_TYPE` varchar(9) NOT NULL DEFAULT '',
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` int(21) DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` int(21) DEFAULT NULL,
  `NUMERIC_PRECISION` int(21) DEFAULT NULL,
  `NUMERIC_SCALE` int(21) DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(64) DEFAULT NULL,
  `COLLATION_NAME` varchar(64) DEFAULT NULL,
  `DTD_IDENTIFIER` longtext,
  `ROUTINE_BODY` varchar(8) NOT NULL DEFAULT '',
  `ROUTINE_DEFINITION` longtext,
  `EXTERNAL_NAME` varchar(64) DEFAULT NULL,
  `EXTERNAL_LANGUAGE` varchar(64) DEFAULT NULL,
  `PARAMETER_STYLE` varchar(8) NOT NULL DEFAULT '',
  `IS_DETERMINISTIC` varchar(3) NOT NULL DEFAULT '',
  `SQL_DATA_ACCESS` varchar(64) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(64) DEFAULT NULL,
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `ROUTINE_COMMENT` longtext NOT NULL,
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SCHEMATA`
--

CREATE TEMPORARY TABLE `SCHEMATA` (
  `CATALOG_NAME` varchar(512) NOT NULL DEFAULT '',
  `SCHEMA_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFAULT_CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `DEFAULT_COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(512) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SCHEMATA`
--

INSERT INTO `SCHEMATA` (`CATALOG_NAME`, `SCHEMA_NAME`, `DEFAULT_CHARACTER_SET_NAME`, `DEFAULT_COLLATION_NAME`, `SQL_PATH`) VALUES
('def', 'information_schema', 'utf8', 'utf8_general_ci', NULL),
('def', 'admin_m3code.com', 'utf8', 'utf8_general_ci', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SCHEMA_PRIVILEGES`
--

CREATE TEMPORARY TABLE `SCHEMA_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SCHEMA_PRIVILEGES`
--

INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'SELECT', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'INSERT', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'UPDATE', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'DELETE', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'CREATE', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'DROP', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'REFERENCES', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'INDEX', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'ALTER', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'CREATE TEMPORARY TABLES', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'LOCK TABLES', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'EXECUTE', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'CREATE VIEW', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'SHOW VIEW', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'CREATE ROUTINE', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'ALTER ROUTINE', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'EVENT', 'NO'),
('''admin_m3code''@''localhost''', 'def', 'admin_m3code.com', 'TRIGGER', 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SESSION_STATUS`
--

CREATE TEMPORARY TABLE `SESSION_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SESSION_STATUS`
--

INSERT INTO `SESSION_STATUS` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('ABORTED_CLIENTS', '1'),
('ABORTED_CONNECTS', '2348'),
('BINLOG_CACHE_DISK_USE', '0'),
('BINLOG_CACHE_USE', '0'),
('BINLOG_STMT_CACHE_DISK_USE', '0'),
('BINLOG_STMT_CACHE_USE', '0'),
('BYTES_RECEIVED', '18444'),
('BYTES_SENT', '460329'),
('COM_ADMIN_COMMANDS', '0'),
('COM_ASSIGN_TO_KEYCACHE', '0'),
('COM_ALTER_DB', '0'),
('COM_ALTER_DB_UPGRADE', '0'),
('COM_ALTER_EVENT', '0'),
('COM_ALTER_FUNCTION', '0'),
('COM_ALTER_PROCEDURE', '0'),
('COM_ALTER_SERVER', '0'),
('COM_ALTER_TABLE', '0'),
('COM_ALTER_TABLESPACE', '0'),
('COM_ANALYZE', '0'),
('COM_BEGIN', '0'),
('COM_BINLOG', '0'),
('COM_CALL_PROCEDURE', '0'),
('COM_CHANGE_DB', '2'),
('COM_CHANGE_MASTER', '0'),
('COM_CHECK', '0'),
('COM_CHECKSUM', '0'),
('COM_COMMIT', '0'),
('COM_CREATE_DB', '0'),
('COM_CREATE_EVENT', '0'),
('COM_CREATE_FUNCTION', '0'),
('COM_CREATE_INDEX', '0'),
('COM_CREATE_PROCEDURE', '0'),
('COM_CREATE_SERVER', '0'),
('COM_CREATE_TABLE', '0'),
('COM_CREATE_TRIGGER', '0'),
('COM_CREATE_UDF', '0'),
('COM_CREATE_USER', '0'),
('COM_CREATE_VIEW', '0'),
('COM_DEALLOC_SQL', '0'),
('COM_DELETE', '0'),
('COM_DELETE_MULTI', '0'),
('COM_DO', '0'),
('COM_DROP_DB', '0'),
('COM_DROP_EVENT', '0'),
('COM_DROP_FUNCTION', '0'),
('COM_DROP_INDEX', '0'),
('COM_DROP_PROCEDURE', '0'),
('COM_DROP_SERVER', '0'),
('COM_DROP_TABLE', '0'),
('COM_DROP_TRIGGER', '0'),
('COM_DROP_USER', '0'),
('COM_DROP_VIEW', '0'),
('COM_EMPTY_QUERY', '0'),
('COM_EXECUTE_SQL', '0'),
('COM_FLUSH', '0'),
('COM_GRANT', '0'),
('COM_HA_CLOSE', '0'),
('COM_HA_OPEN', '0'),
('COM_HA_READ', '0'),
('COM_HELP', '0'),
('COM_INSERT', '0'),
('COM_INSERT_SELECT', '0'),
('COM_INSTALL_PLUGIN', '0'),
('COM_KILL', '0'),
('COM_LOAD', '0'),
('COM_LOCK_TABLES', '0'),
('COM_OPTIMIZE', '0'),
('COM_PRELOAD_KEYS', '0'),
('COM_PREPARE_SQL', '0'),
('COM_PURGE', '0'),
('COM_PURGE_BEFORE_DATE', '0'),
('COM_RELEASE_SAVEPOINT', '0'),
('COM_RENAME_TABLE', '0'),
('COM_RENAME_USER', '0'),
('COM_REPAIR', '0'),
('COM_REPLACE', '0'),
('COM_REPLACE_SELECT', '0'),
('COM_RESET', '0'),
('COM_RESIGNAL', '0'),
('COM_REVOKE', '0'),
('COM_REVOKE_ALL', '0'),
('COM_ROLLBACK', '0'),
('COM_ROLLBACK_TO_SAVEPOINT', '0'),
('COM_SAVEPOINT', '0'),
('COM_SELECT', '55'),
('COM_SET_OPTION', '57'),
('COM_SIGNAL', '0'),
('COM_SHOW_AUTHORS', '0'),
('COM_SHOW_BINLOG_EVENTS', '0'),
('COM_SHOW_BINLOGS', '0'),
('COM_SHOW_CHARSETS', '0'),
('COM_SHOW_COLLATIONS', '0'),
('COM_SHOW_CONTRIBUTORS', '0'),
('COM_SHOW_CREATE_DB', '0'),
('COM_SHOW_CREATE_EVENT', '0'),
('COM_SHOW_CREATE_FUNC', '0'),
('COM_SHOW_CREATE_PROC', '0'),
('COM_SHOW_CREATE_TABLE', '53'),
('COM_SHOW_CREATE_TRIGGER', '0'),
('COM_SHOW_DATABASES', '1'),
('COM_SHOW_ENGINE_LOGS', '0'),
('COM_SHOW_ENGINE_MUTEX', '0'),
('COM_SHOW_ENGINE_STATUS', '0'),
('COM_SHOW_EVENTS', '0'),
('COM_SHOW_ERRORS', '0'),
('COM_SHOW_FIELDS', '0'),
('COM_SHOW_FUNCTION_STATUS', '2'),
('COM_SHOW_GRANTS', '0'),
('COM_SHOW_KEYS', '0'),
('COM_SHOW_MASTER_STATUS', '0'),
('COM_SHOW_OPEN_TABLES', '0'),
('COM_SHOW_PLUGINS', '1'),
('COM_SHOW_PRIVILEGES', '0'),
('COM_SHOW_PROCEDURE_STATUS', '2'),
('COM_SHOW_PROCESSLIST', '0'),
('COM_SHOW_PROFILE', '0'),
('COM_SHOW_PROFILES', '0'),
('COM_SHOW_RELAYLOG_EVENTS', '0'),
('COM_SHOW_SLAVE_HOSTS', '0'),
('COM_SHOW_SLAVE_STATUS', '0'),
('COM_SHOW_STATUS', '0'),
('COM_SHOW_STORAGE_ENGINES', '0'),
('COM_SHOW_TABLE_STATUS', '98'),
('COM_SHOW_TABLES', '2'),
('COM_SHOW_TRIGGERS', '52'),
('COM_SHOW_VARIABLES', '1'),
('COM_SHOW_WARNINGS', '0'),
('COM_SLAVE_START', '0'),
('COM_SLAVE_STOP', '0'),
('COM_STMT_CLOSE', '0'),
('COM_STMT_EXECUTE', '0'),
('COM_STMT_FETCH', '0'),
('COM_STMT_PREPARE', '0'),
('COM_STMT_REPREPARE', '0'),
('COM_STMT_RESET', '0'),
('COM_STMT_SEND_LONG_DATA', '0'),
('COM_TRUNCATE', '0'),
('COM_UNINSTALL_PLUGIN', '0'),
('COM_UNLOCK_TABLES', '0'),
('COM_UPDATE', '0'),
('COM_UPDATE_MULTI', '0'),
('COM_XA_COMMIT', '0'),
('COM_XA_END', '0'),
('COM_XA_PREPARE', '0'),
('COM_XA_RECOVER', '0'),
('COM_XA_ROLLBACK', '0'),
('COM_XA_START', '0'),
('COMPRESSION', 'OFF'),
('CONNECTIONS', '30457'),
('CREATED_TMP_DISK_TABLES', '129'),
('CREATED_TMP_FILES', '5'),
('CREATED_TMP_TABLES', '424'),
('DELAYED_ERRORS', '0'),
('DELAYED_INSERT_THREADS', '0'),
('DELAYED_WRITES', '0'),
('FLUSH_COMMANDS', '1'),
('HANDLER_COMMIT', '32'),
('HANDLER_DELETE', '0'),
('HANDLER_DISCOVER', '0'),
('HANDLER_PREPARE', '0'),
('HANDLER_READ_FIRST', '38'),
('HANDLER_READ_KEY', '32'),
('HANDLER_READ_LAST', '0'),
('HANDLER_READ_NEXT', '0'),
('HANDLER_READ_PREV', '0'),
('HANDLER_READ_RND', '0'),
('HANDLER_READ_RND_NEXT', '2609'),
('HANDLER_ROLLBACK', '0'),
('HANDLER_SAVEPOINT', '0'),
('HANDLER_SAVEPOINT_ROLLBACK', '0'),
('HANDLER_UPDATE', '0'),
('HANDLER_WRITE', '2409'),
('INNODB_BUFFER_POOL_PAGES_DATA', '872'),
('INNODB_BUFFER_POOL_BYTES_DATA', '14286848'),
('INNODB_BUFFER_POOL_PAGES_DIRTY', '1'),
('INNODB_BUFFER_POOL_BYTES_DIRTY', '16384'),
('INNODB_BUFFER_POOL_PAGES_FLUSHED', '2903'),
('INNODB_BUFFER_POOL_PAGES_FREE', '7315'),
('INNODB_BUFFER_POOL_PAGES_MISC', '5'),
('INNODB_BUFFER_POOL_PAGES_TOTAL', '8192'),
('INNODB_BUFFER_POOL_READ_AHEAD_RND', '0'),
('INNODB_BUFFER_POOL_READ_AHEAD', '0'),
('INNODB_BUFFER_POOL_READ_AHEAD_EVICTED', '0'),
('INNODB_BUFFER_POOL_READ_REQUESTS', '5937773'),
('INNODB_BUFFER_POOL_READS', '823'),
('INNODB_BUFFER_POOL_WAIT_FREE', '0'),
('INNODB_BUFFER_POOL_WRITE_REQUESTS', '15160'),
('INNODB_DATA_FSYNCS', '4117'),
('INNODB_DATA_PENDING_FSYNCS', '0'),
('INNODB_DATA_PENDING_READS', '0'),
('INNODB_DATA_PENDING_WRITES', '0'),
('INNODB_DATA_READ', '15667200'),
('INNODB_DATA_READS', '915'),
('INNODB_DATA_WRITES', '4608'),
('INNODB_DATA_WRITTEN', '96836096'),
('INNODB_DBLWR_PAGES_WRITTEN', '2903'),
('INNODB_DBLWR_WRITES', '804'),
('INNODB_HAVE_ATOMIC_BUILTINS', 'ON'),
('INNODB_LOG_WAITS', '0'),
('INNODB_LOG_WRITE_REQUESTS', '1594'),
('INNODB_LOG_WRITES', '1184'),
('INNODB_OS_LOG_FSYNCS', '1945'),
('INNODB_OS_LOG_PENDING_FSYNCS', '0'),
('INNODB_OS_LOG_PENDING_WRITES', '0'),
('INNODB_OS_LOG_WRITTEN', '1320960'),
('INNODB_PAGE_SIZE', '16384'),
('INNODB_PAGES_CREATED', '50'),
('INNODB_PAGES_READ', '822'),
('INNODB_PAGES_WRITTEN', '2903'),
('INNODB_ROW_LOCK_CURRENT_WAITS', '0'),
('INNODB_ROW_LOCK_TIME', '0'),
('INNODB_ROW_LOCK_TIME_AVG', '0'),
('INNODB_ROW_LOCK_TIME_MAX', '0'),
('INNODB_ROW_LOCK_WAITS', '0'),
('INNODB_ROWS_DELETED', '55'),
('INNODB_ROWS_INSERTED', '2753'),
('INNODB_ROWS_READ', '3143455'),
('INNODB_ROWS_UPDATED', '275'),
('INNODB_TRUNCATED_STATUS_WRITES', '0'),
('KEY_BLOCKS_NOT_FLUSHED', '0'),
('KEY_BLOCKS_UNUSED', '4364'),
('KEY_BLOCKS_USED', '2334'),
('KEY_READ_REQUESTS', '1732305'),
('KEY_READS', '28'),
('KEY_WRITE_REQUESTS', '217216'),
('KEY_WRITES', '20606'),
('LAST_QUERY_COST', '10.499000'),
('MAX_USED_CONNECTIONS', '10'),
('NOT_FLUSHED_DELAYED_ROWS', '0'),
('OPEN_FILES', '51'),
('OPEN_STREAMS', '0'),
('OPEN_TABLE_DEFINITIONS', '129'),
('OPEN_TABLES', '205'),
('OPENED_FILES', '29143'),
('OPENED_TABLE_DEFINITIONS', '0'),
('OPENED_TABLES', '32'),
('PERFORMANCE_SCHEMA_COND_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_COND_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_HANDLES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_LOCKER_LOST', '0'),
('PERFORMANCE_SCHEMA_MUTEX_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_MUTEX_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_RWLOCK_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_RWLOCK_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_TABLE_HANDLES_LOST', '0'),
('PERFORMANCE_SCHEMA_TABLE_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_THREAD_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_THREAD_INSTANCES_LOST', '0'),
('PREPARED_STMT_COUNT', '0'),
('QCACHE_FREE_BLOCKS', '0'),
('QCACHE_FREE_MEMORY', '0'),
('QCACHE_HITS', '0'),
('QCACHE_INSERTS', '0'),
('QCACHE_LOWMEM_PRUNES', '0'),
('QCACHE_NOT_CACHED', '0'),
('QCACHE_QUERIES_IN_CACHE', '0'),
('QCACHE_TOTAL_BLOCKS', '0'),
('QUERIES', '1415630'),
('QUESTIONS', '326'),
('RPL_STATUS', 'AUTH_MASTER'),
('SELECT_FULL_JOIN', '0'),
('SELECT_FULL_RANGE_JOIN', '0'),
('SELECT_RANGE', '0'),
('SELECT_RANGE_CHECK', '0'),
('SELECT_SCAN', '213'),
('SLAVE_HEARTBEAT_PERIOD', '0.000'),
('SLAVE_OPEN_TEMP_TABLES', '0'),
('SLAVE_RECEIVED_HEARTBEATS', '0'),
('SLAVE_RETRIED_TRANSACTIONS', '0'),
('SLAVE_RUNNING', 'OFF'),
('SLOW_LAUNCH_THREADS', '0'),
('SLOW_QUERIES', '0'),
('SORT_MERGE_PASSES', '0'),
('SORT_RANGE', '0'),
('SORT_ROWS', '0'),
('SORT_SCAN', '0'),
('SSL_ACCEPT_RENEGOTIATES', '0'),
('SSL_ACCEPTS', '0'),
('SSL_CALLBACK_CACHE_HITS', '0'),
('SSL_CIPHER', ''),
('SSL_CIPHER_LIST', ''),
('SSL_CLIENT_CONNECTS', '0'),
('SSL_CONNECT_RENEGOTIATES', '0'),
('SSL_CTX_VERIFY_DEPTH', '0'),
('SSL_CTX_VERIFY_MODE', '0'),
('SSL_DEFAULT_TIMEOUT', '0'),
('SSL_FINISHED_ACCEPTS', '0'),
('SSL_FINISHED_CONNECTS', '0'),
('SSL_SESSION_CACHE_HITS', '0'),
('SSL_SESSION_CACHE_MISSES', '0'),
('SSL_SESSION_CACHE_MODE', 'NONE'),
('SSL_SESSION_CACHE_OVERFLOWS', '0'),
('SSL_SESSION_CACHE_SIZE', '0'),
('SSL_SESSION_CACHE_TIMEOUTS', '0'),
('SSL_SESSIONS_REUSED', '0'),
('SSL_USED_SESSION_CACHE_ENTRIES', '0'),
('SSL_VERIFY_DEPTH', '0'),
('SSL_VERIFY_MODE', '0'),
('SSL_VERSION', ''),
('TABLE_LOCKS_IMMEDIATE', '165706'),
('TABLE_LOCKS_WAITED', '0'),
('TC_LOG_MAX_PAGES_USED', '0'),
('TC_LOG_PAGE_SIZE', '0'),
('TC_LOG_PAGE_WAITS', '0'),
('THREADS_CACHED', '0'),
('THREADS_CONNECTED', '1'),
('THREADS_CREATED', '30456'),
('THREADS_RUNNING', '1'),
('UPTIME', '3567857'),
('UPTIME_SINCE_FLUSH_STATUS', '3567857');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SESSION_VARIABLES`
--

CREATE TEMPORARY TABLE `SESSION_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `SESSION_VARIABLES`
--

INSERT INTO `SESSION_VARIABLES` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('MAX_PREPARED_STMT_COUNT', '16382'),
('INNODB_BUFFER_POOL_SIZE', '134217728'),
('HAVE_CRYPT', 'YES'),
('PERFORMANCE_SCHEMA_EVENTS_WAITS_HISTORY_LONG_SIZE', '10000'),
('INNODB_VERSION', '5.5.35'),
('QUERY_PREALLOC_SIZE', '8192'),
('DELAYED_QUEUE_SIZE', '1000'),
('PERFORMANCE_SCHEMA_MAX_COND_INSTANCES', '1000'),
('SSL_CIPHER', ''),
('COLLATION_SERVER', 'latin1_swedish_ci'),
('SECURE_FILE_PRIV', ''),
('TIMED_MUTEXES', 'OFF'),
('DELAYED_INSERT_TIMEOUT', '300'),
('PERFORMANCE_SCHEMA_MAX_MUTEX_INSTANCES', '1000000'),
('LC_TIME_NAMES', 'en_US'),
('PERFORMANCE_SCHEMA_MAX_RWLOCK_INSTANCES', '1000000'),
('TIME_FORMAT', '%H:%i:%s'),
('PERFORMANCE_SCHEMA_MAX_RWLOCK_CLASSES', '30'),
('BASEDIR', '/usr'),
('PERFORMANCE_SCHEMA_MAX_MUTEX_CLASSES', '200'),
('UPDATABLE_VIEWS_WITH_LIMIT', 'YES'),
('BACK_LOG', '50'),
('SLOW_LAUNCH_TIME', '2'),
('EVENT_SCHEDULER', 'OFF'),
('MAX_SEEKS_FOR_KEY', '18446744073709551615'),
('PERFORMANCE_SCHEMA_MAX_THREAD_CLASSES', '50'),
('RELAY_LOG_INDEX', ''),
('FT_STOPWORD_FILE', '(built-in)'),
('SQL_QUOTE_SHOW_CREATE', 'ON'),
('PERFORMANCE_SCHEMA', 'OFF'),
('QUERY_CACHE_SIZE', '0'),
('BINLOG_FORMAT', 'STATEMENT'),
('WAIT_TIMEOUT', '30'),
('LONG_QUERY_TIME', '5.000000'),
('PERFORMANCE_SCHEMA_MAX_TABLE_HANDLES', '100000'),
('CHARACTER_SETS_DIR', '/usr/share/mysql/charsets/'),
('LOWER_CASE_TABLE_NAMES', '0'),
('BINLOG_CACHE_SIZE', '32768'),
('REPORT_HOST', ''),
('CHARACTER_SET_RESULTS', 'utf8'),
('MYISAM_SORT_BUFFER_SIZE', '8388608'),
('CHARACTER_SET_CONNECTION', 'utf8'),
('INNODB_ROLLBACK_SEGMENTS', '128'),
('PRELOAD_BUFFER_SIZE', '32768'),
('LARGE_FILES_SUPPORT', 'ON'),
('MAX_WRITE_LOCK_COUNT', '18446744073709551615'),
('SQL_SAFE_UPDATES', 'OFF'),
('MAX_JOIN_SIZE', '18446744073709551615'),
('NET_BUFFER_LENGTH', '16384'),
('FT_QUERY_EXPANSION_LIMIT', '20'),
('SKIP_SHOW_DATABASE', 'OFF'),
('FT_MAX_WORD_LEN', '84'),
('GROUP_CONCAT_MAX_LEN', '1024'),
('MAX_SP_RECURSION_DEPTH', '0'),
('RANGE_ALLOC_BLOCK_SIZE', '4096'),
('SYNC_RELAY_LOG', '0'),
('OPTIMIZER_PRUNE_LEVEL', '1'),
('HAVE_QUERY_CACHE', 'YES'),
('INNODB_LOG_FILE_SIZE', '5242880'),
('DELAY_KEY_WRITE', 'ON'),
('TRANSACTION_PREALLOC_SIZE', '4096'),
('INTERACTIVE_TIMEOUT', '50'),
('MYISAM_RECOVER_OPTIONS', 'OFF'),
('AUTOMATIC_SP_PRIVILEGES', 'ON'),
('PROTOCOL_VERSION', '10'),
('DELAYED_INSERT_LIMIT', '100'),
('LOW_PRIORITY_UPDATES', 'OFF'),
('COMPLETION_TYPE', 'NO_CHAIN'),
('REPORT_PASSWORD', ''),
('BINLOG_DIRECT_NON_TRANSACTIONAL_UPDATES', 'OFF'),
('MAX_INSERT_DELAYED_THREADS', '20'),
('VERSION_COMMENT', '(Ubuntu)'),
('SQL_BIG_SELECTS', 'ON'),
('AUTO_INCREMENT_OFFSET', '1'),
('TRANSACTION_ALLOC_BLOCK_SIZE', '8192'),
('JOIN_BUFFER_SIZE', '131072'),
('THREAD_CACHE_SIZE', '0'),
('CONNECT_TIMEOUT', '10'),
('INNODB_DOUBLEWRITE', 'ON'),
('SQL_LOW_PRIORITY_UPDATES', 'OFF'),
('IGNORE_BUILTIN_INNODB', 'OFF'),
('INIT_FILE', ''),
('DEFAULT_WEEK_FORMAT', '0'),
('LARGE_PAGES', 'OFF'),
('LOG_OUTPUT', 'FILE'),
('LARGE_PAGE_SIZE', '0'),
('INNODB_IO_CAPACITY', '200'),
('INIT_SLAVE', ''),
('INNODB_USE_NATIVE_AIO', 'OFF'),
('MAX_BINLOG_SIZE', '1073741824'),
('HAVE_SYMLINK', 'YES'),
('MAX_ERROR_COUNT', '64'),
('TIME_ZONE', '+00:00'),
('MAX_CONNECTIONS', '200'),
('INNODB_TABLE_LOCKS', 'ON'),
('PROXY_USER', ''),
('INNODB_AUTOEXTEND_INCREMENT', '8'),
('READ_BUFFER_SIZE', '131072'),
('MYISAM_DATA_POINTER_SIZE', '6'),
('PSEUDO_THREAD_ID', '30456'),
('INNODB_THREAD_SLEEP_DELAY', '10000'),
('LOG_QUERIES_NOT_USING_INDEXES', 'OFF'),
('SQL_AUTO_IS_NULL', 'OFF'),
('LOWER_CASE_FILE_SYSTEM', 'OFF'),
('SLAVE_TRANSACTION_RETRIES', '10'),
('SORT_BUFFER_SIZE', '2097152'),
('KEEP_FILES_ON_CREATE', 'OFF'),
('MAX_HEAP_TABLE_SIZE', '16777216'),
('SYNC_RELAY_LOG_INFO', '0'),
('LOCK_WAIT_TIMEOUT', '31536000'),
('INNODB_REPLICATION_DELAY', '0'),
('KEY_CACHE_AGE_THRESHOLD', '300'),
('QUERY_CACHE_MIN_RES_UNIT', '4096'),
('NET_RETRY_COUNT', '10'),
('INNODB_STATS_ON_METADATA', 'ON'),
('LOG_WARNINGS', '1'),
('INNODB_ROLLBACK_ON_TIMEOUT', 'OFF'),
('FLUSH', 'OFF'),
('PROFILING_HISTORY_SIZE', '15'),
('MAX_LONG_DATA_SIZE', '1048576'),
('INNODB_CHANGE_BUFFERING', 'all'),
('CHARACTER_SET_SERVER', 'latin1'),
('READ_RND_BUFFER_SIZE', '262144'),
('SLAVE_MAX_ALLOWED_PACKET', '1073741824'),
('INNODB_FILE_FORMAT', 'Antelope'),
('FLUSH_TIME', '0'),
('BIG_TABLES', 'OFF'),
('CHARACTER_SET_DATABASE', 'utf8'),
('SQL_SELECT_LIMIT', '18446744073709551615'),
('BULK_INSERT_BUFFER_SIZE', '8388608'),
('DATE_FORMAT', '%Y-%m-%d'),
('CHARACTER_SET_FILESYSTEM', 'binary'),
('READ_ONLY', 'OFF'),
('BINLOG_STMT_CACHE_SIZE', '32768'),
('RAND_SEED1', '0'),
('MAX_BINLOG_CACHE_SIZE', '18446744073709547520'),
('INNODB_DATA_FILE_PATH', 'ibdata1:10M:autoextend'),
('PERFORMANCE_SCHEMA_MAX_FILE_CLASSES', '50'),
('INNODB_PURGE_THREADS', '0'),
('MAX_SORT_LENGTH', '1024'),
('PROFILING', 'OFF'),
('PERFORMANCE_SCHEMA_EVENTS_WAITS_HISTORY_SIZE', '10'),
('INNODB_STRICT_MODE', 'OFF'),
('SLAVE_COMPRESSED_PROTOCOL', 'OFF'),
('KEY_CACHE_DIVISION_LIMIT', '100'),
('OLD_PASSWORDS', 'OFF'),
('GENERAL_LOG_FILE', '/var/lib/mysql/codex.log'),
('NET_WRITE_TIMEOUT', '60'),
('PERFORMANCE_SCHEMA_MAX_COND_CLASSES', '80'),
('QUERY_CACHE_TYPE', 'ON'),
('AUTO_INCREMENT_INCREMENT', '1'),
('METADATA_LOCKS_CACHE_SIZE', '1024'),
('TMPDIR', '/tmp'),
('QUERY_CACHE_LIMIT', '1048576'),
('EXPIRE_LOGS_DAYS', '0'),
('TX_ISOLATION', 'REPEATABLE-READ'),
('HAVE_PARTITIONING', 'YES'),
('LOG_ERROR', '/var/log/mysql/error.log'),
('FOREIGN_KEY_CHECKS', 'ON'),
('MAX_LENGTH_FOR_SORT_DATA', '1024'),
('RELAY_LOG_INFO_FILE', 'relay-log.info'),
('THREAD_STACK', '262144'),
('INNODB_AUTOINC_LOCK_MODE', '1'),
('NEW', 'OFF'),
('INNODB_COMMIT_CONCURRENCY', '0'),
('SKIP_NAME_RESOLVE', 'OFF'),
('INNODB_MIRRORED_LOG_GROUPS', '1'),
('PID_FILE', '/var/run/mysqld/mysqld.pid'),
('INNODB_PURGE_BATCH_SIZE', '20'),
('MAX_ALLOWED_PACKET', '1048576'),
('VERSION', '5.5.35-0ubuntu0.12.04.2'),
('CONCURRENT_INSERT', 'AUTO'),
('INNODB_SUPPORT_XA', 'ON'),
('TABLE_DEFINITION_CACHE', '400'),
('INNODB_SYNC_SPIN_LOOPS', '30'),
('QUERY_ALLOC_BLOCK_SIZE', '8192'),
('COLLATION_CONNECTION', 'utf8_general_ci'),
('MYISAM_REPAIR_THREADS', '1'),
('INNODB_ADAPTIVE_FLUSHING', 'ON'),
('FT_BOOLEAN_SYNTAX', '+ -><()~*:""&|'),
('INNODB_ADAPTIVE_HASH_INDEX', 'ON'),
('VERSION_COMPILE_MACHINE', 'x86_64'),
('SYSTEM_TIME_ZONE', 'EDT'),
('QUERY_CACHE_WLOCK_INVALIDATE', 'OFF'),
('DIV_PRECISION_INCREMENT', '4'),
('SYNC_FRM', 'ON'),
('STORED_PROGRAM_CACHE', '256'),
('TMP_TABLE_SIZE', '16777216'),
('INNODB_DATA_HOME_DIR', ''),
('PERFORMANCE_SCHEMA_MAX_THREAD_INSTANCES', '1000'),
('INNODB_READ_IO_THREADS', '4'),
('MULTI_RANGE_COUNT', '256'),
('INNODB_WRITE_IO_THREADS', '4'),
('SERVER_ID', '0'),
('INNODB_BUFFER_POOL_INSTANCES', '1'),
('SKIP_NETWORKING', 'OFF'),
('INNODB_FORCE_RECOVERY', '0'),
('CHARACTER_SET_SYSTEM', 'utf8'),
('INNODB_LOG_FILES_IN_GROUP', '2'),
('INIT_CONNECT', ''),
('ERROR_COUNT', '0'),
('OPTIMIZER_SEARCH_DEPTH', '62'),
('HAVE_DYNAMIC_LOADING', 'YES'),
('AUTOCOMMIT', 'ON'),
('SYNC_BINLOG', '0'),
('SSL_CAPATH', ''),
('INNODB_PRINT_ALL_DEADLOCKS', 'OFF'),
('SLAVE_EXEC_MODE', 'STRICT'),
('INNODB_OPEN_FILES', '300'),
('GENERAL_LOG', 'OFF'),
('INNODB_FILE_FORMAT_CHECK', 'ON'),
('LAST_INSERT_ID', '0'),
('INNODB_READ_AHEAD_THRESHOLD', '56'),
('HOSTNAME', 'codex'),
('KEY_CACHE_BLOCK_SIZE', '1024'),
('OLD', 'OFF'),
('KEY_BUFFER_SIZE', '8388608'),
('REPORT_PORT', '3306'),
('HAVE_NDBCLUSTER', 'NO'),
('SQL_LOG_BIN', 'ON'),
('PSEUDO_SLAVE_MODE', 'OFF'),
('THREAD_HANDLING', 'one-thread-per-connection'),
('INNODB_STATS_METHOD', 'nulls_equal'),
('LOG_BIN', 'OFF'),
('INNODB_FAST_SHUTDOWN', '1'),
('RELAY_LOG_SPACE_LIMIT', '0'),
('SSL_CA', ''),
('MAX_USER_CONNECTIONS', '30'),
('INNODB_THREAD_CONCURRENCY', '0'),
('SQL_MAX_JOIN_SIZE', '18446744073709551615'),
('SLAVE_NET_TIMEOUT', '3600'),
('TABLE_OPEN_CACHE', '400'),
('INNODB_STATS_SAMPLE_PAGES', '8'),
('SQL_BIG_TABLES', 'OFF'),
('LOCAL_INFILE', 'ON'),
('SQL_BUFFER_RESULT', 'OFF'),
('HAVE_RTREE_KEYS', 'YES'),
('ENGINE_CONDITION_PUSHDOWN', 'ON'),
('HAVE_PROFILING', 'YES'),
('LC_MESSAGES_DIR', '/usr/share/mysql/'),
('OLD_ALTER_TABLE', 'OFF'),
('HAVE_INNODB', 'YES'),
('MYISAM_MMAP_SIZE', '18446744073709551615'),
('SQL_MODE', ''),
('PERFORMANCE_SCHEMA_MAX_FILE_HANDLES', '32768'),
('TIMESTAMP', '1399584666'),
('RELAY_LOG_RECOVERY', 'OFF'),
('REPORT_USER', ''),
('MAX_DELAYED_THREADS', '20'),
('HAVE_GEOMETRY', 'YES'),
('DATETIME_FORMAT', '%Y-%m-%d %H:%i:%s'),
('SLOW_QUERY_LOG', 'OFF'),
('INNODB_FLUSH_LOG_AT_TRX_COMMIT', '1'),
('LC_MESSAGES', 'en_US'),
('MAX_RELAY_LOG_SIZE', '0'),
('LOG', 'OFF'),
('INNODB_RANDOM_READ_AHEAD', 'OFF'),
('OPEN_FILES_LIMIT', '1024'),
('HAVE_CSV', 'YES'),
('DATADIR', '/var/lib/mysql/'),
('PORT', '3306'),
('FT_MIN_WORD_LEN', '4'),
('INNODB_CONCURRENCY_TICKETS', '500'),
('VERSION_COMPILE_OS', 'debian-linux-gnu'),
('LOG_BIN_TRUST_FUNCTION_CREATORS', 'OFF'),
('INNODB_LOCKS_UNSAFE_FOR_BINLOG', 'OFF'),
('INNODB_FORCE_LOAD_CORRUPTED', 'OFF'),
('SQL_WARNINGS', 'OFF'),
('HAVE_OPENSSL', 'DISABLED'),
('RELAY_LOG', ''),
('MAX_BINLOG_STMT_CACHE_SIZE', '18446744073709547520'),
('PLUGIN_DIR', '/usr/lib/mysql/plugin/'),
('PERFORMANCE_SCHEMA_MAX_FILE_INSTANCES', '10000'),
('LOG_SLOW_QUERIES', 'OFF'),
('INNODB_SPIN_WAIT_DELAY', '6'),
('MAX_TMP_TABLES', '32'),
('INNODB_FILE_FORMAT_MAX', 'Antelope'),
('SQL_LOG_OFF', 'OFF'),
('DEFAULT_STORAGE_ENGINE', 'InnoDB'),
('SLOW_QUERY_LOG_FILE', '/var/lib/mysql/codex-slow.log'),
('INNODB_LOCK_WAIT_TIMEOUT', '50'),
('SQL_SLAVE_SKIP_COUNTER', '0'),
('INNODB_OLD_BLOCKS_TIME', '0'),
('SECURE_AUTH', 'OFF'),
('RPL_RECOVERY_RANK', '0'),
('NET_READ_TIMEOUT', '30'),
('WARNING_COUNT', '0'),
('MYISAM_STATS_METHOD', 'nulls_unequal'),
('OPTIMIZER_SWITCH', 'index_merge=on,index_merge_union=on,index_merge_sort_union=on,index_merge_intersection=on,engine_condition_pushdown=on'),
('MAX_CONNECT_ERRORS', '10'),
('LOCKED_IN_MEMORY', 'OFF'),
('INNODB_FLUSH_METHOD', ''),
('EXTERNAL_USER', ''),
('INNODB_LARGE_PREFIX', 'OFF'),
('INNODB_CHECKSUMS', 'ON'),
('STORAGE_ENGINE', 'InnoDB'),
('SSL_KEY', ''),
('HAVE_SSL', 'DISABLED'),
('MYISAM_USE_MMAP', 'OFF'),
('RAND_SEED2', '0'),
('SLAVE_SKIP_ERRORS', 'OFF'),
('MIN_EXAMINED_ROW_LIMIT', '0'),
('INSERT_ID', '0'),
('LOG_SLAVE_UPDATES', 'OFF'),
('RELAY_LOG_PURGE', 'ON'),
('SYNC_MASTER_INFO', '0'),
('COLLATION_DATABASE', 'utf8_general_ci'),
('INNODB_FILE_PER_TABLE', 'ON'),
('INNODB_LOG_GROUP_HOME_DIR', './'),
('SSL_CERT', ''),
('INNODB_LOG_BUFFER_SIZE', '8388608'),
('SOCKET', '/var/run/mysqld/mysqld.sock'),
('CHARACTER_SET_CLIENT', 'utf8'),
('IDENTITY', '0'),
('INNODB_MAX_PURGE_LAG', '0'),
('SKIP_EXTERNAL_LOCKING', 'ON'),
('MYISAM_MAX_SORT_FILE_SIZE', '9223372036853727232'),
('SLAVE_LOAD_TMPDIR', '/tmp'),
('SLAVE_TYPE_CONVERSIONS', ''),
('INNODB_ADDITIONAL_MEM_POOL_SIZE', '8388608'),
('SQL_NOTES', 'ON'),
('INNODB_USE_SYS_MALLOC', 'ON'),
('LICENSE', 'GPL'),
('INNODB_MAX_DIRTY_PAGES_PCT', '75'),
('PERFORMANCE_SCHEMA_MAX_TABLE_INSTANCES', '50000'),
('THREAD_CONCURRENCY', '10'),
('UNIQUE_CHECKS', 'ON'),
('INNODB_OLD_BLOCKS_PCT', '37'),
('HAVE_COMPRESS', 'YES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `STATISTICS`
--

CREATE TEMPORARY TABLE `STATISTICS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `NON_UNIQUE` bigint(1) NOT NULL DEFAULT '0',
  `INDEX_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `INDEX_NAME` varchar(64) NOT NULL DEFAULT '',
  `SEQ_IN_INDEX` bigint(2) NOT NULL DEFAULT '0',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLLATION` varchar(1) DEFAULT NULL,
  `CARDINALITY` bigint(21) DEFAULT NULL,
  `SUB_PART` bigint(3) DEFAULT NULL,
  `PACKED` varchar(10) DEFAULT NULL,
  `NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `INDEX_TYPE` varchar(16) NOT NULL DEFAULT '',
  `COMMENT` varchar(16) DEFAULT NULL,
  `INDEX_COMMENT` varchar(1024) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `STATISTICS`
--

INSERT INTO `STATISTICS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `NON_UNIQUE`, `INDEX_SCHEMA`, `INDEX_NAME`, `SEQ_IN_INDEX`, `COLUMN_NAME`, `COLLATION`, `CARDINALITY`, `SUB_PART`, `PACKED`, `NULLABLE`, `INDEX_TYPE`, `COMMENT`, `INDEX_COMMENT`) VALUES
('def', 'admin_m3code.com', 'armas', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'armaslegajos', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'armaslegajos', 1, 'admin_m3code.com', 'fk_armaslegajos_armas1_idx', 1, 'armas_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'armaslegajos', 1, 'admin_m3code.com', 'fk_armaslegajos_legajos1_idx', 1, 'legajos_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'articulos', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'articulos', 1, 'admin_m3code.com', 'fk_articulos_proveedores1_idx', 1, 'proveedors_id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'articulos', 1, 'admin_m3code.com', 'fk_articulos_rubro1_idx', 1, 'rubros_id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'articulosdepositos', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'articulosdepositos', 1, 'admin_m3code.com', 'fk_articulos_depositos_depositos1_idx', 1, 'depositos_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'articulosdepositos', 1, 'admin_m3code.com', 'fk_articulos_depositos_articulos1_idx', 1, 'articulos_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'centrocostos', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 1, 'admin_m3code.com', 'fk_centroscostoscomprasmovimientos_centrocostos1_idx', 1, 'centrocostos_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 1, 'admin_m3code.com', 'fk_centroscostoscomprasmovimientos_comprasmovimientos1_idx', 1, 'comprasmovimientos_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'ciudads', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'ciudads', 1, 'admin_m3code.com', 'fk_ciudads_provincias1_idx', 1, 'provincias_id', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'clientes', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 3, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'clientes', 1, 'admin_m3code.com', 'fk_clientes_responsabilidadesivas1_idx', 1, 'responsabilidadesivas_id', 'A', 3, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'clientes', 1, 'admin_m3code.com', 'fk_clientes_ciudads1_idx', 1, 'ciudads_id', 'A', 3, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'clientes', 1, 'admin_m3code.com', 'fk_clientes_centrocostos1_idx', 1, 'centrocostos_id', 'A', 3, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 1, 'admin_m3code.com', 'fk_venta_movimientos_tipos_documentos_idx', 1, 'tiposdocumentos_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 1, 'admin_m3code.com', 'fk_venta_movimiento_condiciones_ventas1_idx', 1, 'condicionesventas_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 1, 'admin_m3code.com', 'fk_venta_movimientos_users1_idx', 1, 'users_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 1, 'admin_m3code.com', 'fk_comprasmovimientos_proveedors1_idx', 1, 'proveedors_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'condicionesventas', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'configs', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'depositos', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'empleoscategorias', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'empleoscategorias', 1, 'admin_m3code.com', 'fk_empleoscategorias_sindicatos1_idx', 1, 'sindicatos_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'legajos', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'legajos', 1, 'admin_m3code.com', 'fk_legajos_ciudads1_idx', 1, 'ciudads_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'legajos', 1, 'admin_m3code.com', 'fk_legajos_empleoscategorias1_idx', 1, 'empleoscategorias_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'legajos', 1, 'admin_m3code.com', 'fk_legajos_obrassocials1_idx', 1, 'obrassocials_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'legajoslicencias', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'legajoslicencias', 1, 'admin_m3code.com', 'fk_table1_legajos1_idx', 1, 'legajos_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'legajoslicencias', 1, 'admin_m3code.com', 'fk_legajoslicencias_licencias1_idx', 1, 'licencias_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'licencias', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'obrassocials', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'partesdiarios', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'partesdiarios', 1, 'admin_m3code.com', 'fk_partesdiarios_centrocostos1_idx', 1, 'centrocostos_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'partesdiarios', 1, 'admin_m3code.com', 'fk_partesdiarios_users1_idx', 1, 'users_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'partesdiarioscuerpos', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'partesdiarioscuerpos', 1, 'admin_m3code.com', 'fk_partesdiarioscuerpos_partesdiarios1_idx', 1, 'partesdiarios_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'partesdiarioscuerpos', 1, 'admin_m3code.com', 'fk_partesdiarioscuerpos_legajos1_idx', 1, 'legajos_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'partesdiarioscuerpos', 1, 'admin_m3code.com', 'fk_partesdiarioscuerpos_partesdiariosnovedads1_idx', 1, 'partesdiariosnovedads_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'partesdiariosnovedads', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'proveedors', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'proveedors', 1, 'admin_m3code.com', 'fk_proveedores_responsabilidad_iva1_idx', 1, 'responsabilidadesivas_id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'proveedors', 1, 'admin_m3code.com', 'fk_proveedors_ciudads1_idx', 1, 'ciudads_id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'proveedors', 1, 'admin_m3code.com', 'fk_proveedors_centrocostos1_idx', 1, 'centrocostos_id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'provincias', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'responsabilidadesivas', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'rubros', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 1, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'sindicatos', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'tiposdocumentos', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 10, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'users', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'vehiculos', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'vehiculos', 1, 'admin_m3code.com', 'fk_vehiculos_centrocostos1_idx', 1, 'centrocostos_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'vehiculoslicencias', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'vehiculoslicencias', 1, 'admin_m3code.com', 'fk_vehiculoslicencias_vehiculos1_idx', 1, 'vehiculos_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'vehiculoslicencias', 1, 'admin_m3code.com', 'fk_vehiculoslicencias_vehiculoslicenciastipos1_idx', 1, 'vehiculoslicenciastipos_id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'vehiculoslicenciastipos', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 50, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 1, 'admin_m3code.com', 'fk_venta_movimientos_tipos_documentos_idx', 1, 'tiposdocumentos_id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 1, 'admin_m3code.com', 'fk_venta_movimiento_condiciones_ventas1_idx', 1, 'condicionesventas_id', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 1, 'admin_m3code.com', 'fk_venta_movimientos_users1_idx', 1, 'users_id', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 1, 'admin_m3code.com', 'fk_ventasmovimientos_clientes1_idx', 1, 'clientes_id', 'A', 6, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 0, 'admin_m3code.com', 'PRIMARY', 1, 'id', 'A', 71, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 1, 'admin_m3code.com', 'fk_venta_movimiento_cuerpo_venta_movimientos1_idx', 1, 'ventasmovimientos_id', 'A', 71, NULL, NULL, '', 'BTREE', '', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 1, 'admin_m3code.com', 'fk_venta_movimiento_cuerpo_articulos1_idx', 1, 'articulos_id', 'A', 14, NULL, NULL, '', 'BTREE', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TABLES`
--

CREATE TEMPORARY TABLE `TABLES` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `ENGINE` varchar(64) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `AUTO_INCREMENT` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `TABLE_COLLATION` varchar(32) DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `CREATE_OPTIONS` varchar(255) DEFAULT NULL,
  `TABLE_COMMENT` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TABLES`
--

INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES
('def', 'information_schema', 'CHARACTER_SETS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 384, 0, 16434816, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=43690', ''),
('def', 'information_schema', 'COLLATIONS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 231, 0, 16704765, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=72628', ''),
('def', 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 195, 0, 16357770, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=86037', ''),
('def', 'information_schema', 'COLUMNS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, 'utf8_general_ci', NULL, 'max_rows=2802', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2565, 0, 16757145, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6540', ''),
('def', 'information_schema', 'ENGINES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 490, 0, 16574250, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=34239', ''),
('def', 'information_schema', 'EVENTS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, 'utf8_general_ci', NULL, 'max_rows=618', ''),
('def', 'information_schema', 'FILES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2677, 0, 16758020, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6267', ''),
('def', 'information_schema', 'GLOBAL_STATUS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
('def', 'information_schema', 'GLOBAL_VARIABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 4637, 0, 16762755, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3618', ''),
('def', 'information_schema', 'PARAMETERS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, 'utf8_general_ci', NULL, 'max_rows=6050', ''),
('def', 'information_schema', 'PARTITIONS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, 'utf8_general_ci', NULL, 'max_rows=5579', ''),
('def', 'information_schema', 'PLUGINS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, 'utf8_general_ci', NULL, 'max_rows=11328', ''),
('def', 'information_schema', 'PROCESSLIST', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, 'utf8_general_ci', NULL, 'max_rows=23899', ''),
('def', 'information_schema', 'PROFILING', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 308, 0, 16562084, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=54471', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 4814, 0, 16767162, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3485', ''),
('def', 'information_schema', 'ROUTINES', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, 'utf8_general_ci', NULL, 'max_rows=583', ''),
('def', 'information_schema', 'SCHEMATA', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3464, 0, 16738048, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=4843', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2179, 0, 16736899, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=7699', ''),
('def', 'information_schema', 'SESSION_STATUS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
('def', 'information_schema', 'SESSION_VARIABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
('def', 'information_schema', 'STATISTICS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 5753, 0, 16752736, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=2916', ''),
('def', 'information_schema', 'TABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 9450, 0, 16764300, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=1775', ''),
('def', 'information_schema', 'TABLESPACES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 6951, 0, 16772763, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=2413', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2504, 0, 16721712, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6700', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2372, 0, 16748692, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=7073', ''),
('def', 'information_schema', 'TRIGGERS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, 'utf8_general_ci', NULL, 'max_rows=569', ''),
('def', 'information_schema', 'USER_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 1986, 0, 16726092, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=8447', ''),
('def', 'information_schema', 'VIEWS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-05-08 21:31:06', '2014-05-08 21:31:06', NULL, 'utf8_general_ci', NULL, 'max_rows=6935', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 6852, 0, 16766844, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=2448', ''),
('def', 'information_schema', 'INNODB_TRX', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 4534, 0, 16766732, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3700', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 257, 0, 16332350, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=65280', ''),
('def', 'information_schema', 'INNODB_LOCK_WAITS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 599, 0, 16749238, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=28008', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 29, 0, 15204352, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=578524', ''),
('def', 'information_schema', 'INNODB_CMP', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 25, 0, 13107200, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=671088', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 31244, 0, 16746784, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=536', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 29, 0, 15204352, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=578524', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 25, 0, 13107200, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=671088', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 6669, 0, 16765866, 0, 0, NULL, '2014-05-08 21:31:06', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=2515', ''),
('def', 'admin_m3code.com', 'armas', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 0, NULL, '2014-03-12 01:39:12', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'armaslegajos', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 0, NULL, '2014-03-12 01:39:13', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'articulos', 'BASE TABLE', 'InnoDB', 10, 'Compact', 7, 2340, 16384, 0, 32768, 0, 10, '2014-03-12 02:30:02', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'articulosdepositos', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 0, 1, '2014-03-12 01:39:13', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'centrocostos', 'BASE TABLE', 'InnoDB', 10, 'Compact', 1, 16384, 16384, 0, 0, 0, NULL, '2014-03-12 01:39:12', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 0, 1, '2014-03-12 01:39:13', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'ciudads', 'BASE TABLE', 'InnoDB', 10, 'Compact', 4, 4096, 16384, 0, 16384, 0, 5, '2014-03-12 02:51:01', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'clientes', 'BASE TABLE', 'InnoDB', 10, 'Compact', 3, 5461, 16384, 0, 49152, 0, 6, '2014-03-12 02:30:27', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'comprasmovimientos', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 65536, 0, 1, '2014-03-12 01:39:13', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'condicionesventas', 'BASE TABLE', 'InnoDB', 10, 'Compact', 2, 8192, 16384, 0, 0, 0, 5, '2014-03-12 01:39:12', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'configs', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 0, 1, '2014-03-12 01:39:12', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'depositos', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 0, 1, '2014-03-12 01:39:12', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'empleoscategorias', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 0, 1, '2014-03-12 01:39:13', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'legajos', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 49152, 0, 1, '2014-03-12 01:39:13', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'legajoslicencias', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 0, 1, '2014-03-12 01:39:13', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'licencias', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 0, 1, '2014-03-12 01:39:12', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'obrassocials', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 0, 1, '2014-03-12 01:39:12', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'partesdiarios', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 0, NULL, '2014-03-12 01:39:13', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'partesdiarioscuerpos', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 49152, 0, NULL, '2014-03-12 01:39:13', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'partesdiariosnovedads', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 0, 1, '2014-03-12 01:39:12', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'proveedors', 'BASE TABLE', 'InnoDB', 10, 'Compact', 1, 16384, 16384, 0, 49152, 0, 2, '2014-03-12 02:50:16', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'provincias', 'BASE TABLE', 'InnoDB', 10, 'Compact', 4, 4096, 16384, 0, 0, 0, 5, '2014-03-12 02:51:43', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'responsabilidadesivas', 'BASE TABLE', 'InnoDB', 10, 'Compact', 1, 16384, 16384, 0, 0, 0, 8, '2014-03-12 01:39:12', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'rubros', 'BASE TABLE', 'InnoDB', 10, 'Compact', 1, 16384, 16384, 0, 0, 0, 7, '2014-03-12 01:39:12', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'sindicatos', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 0, NULL, '2014-03-12 01:39:12', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'tiposdocumentos', 'BASE TABLE', 'InnoDB', 10, 'Compact', 10, 1638, 16384, 0, 0, 0, 11, '2014-03-12 02:29:17', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'users', 'BASE TABLE', 'InnoDB', 10, 'Compact', 2, 8192, 16384, 0, 0, 0, 5, '2014-03-12 01:39:12', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'vehiculos', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 0, 1, '2014-03-12 01:39:13', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'vehiculoslicencias', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 0, 1, '2014-03-12 01:39:13', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'vehiculoslicenciastipos', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 0, NULL, '2014-03-12 01:39:12', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'ventasmovimientos', 'BASE TABLE', 'InnoDB', 10, 'Compact', 50, 327, 16384, 0, 65536, 0, 62, '2014-03-12 02:27:24', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'BASE TABLE', 'InnoDB', 10, 'Compact', 71, 230, 16384, 0, 32768, 0, 78, '2014-03-12 01:39:13', NULL, NULL, 'utf8_general_ci', NULL, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TABLESPACES`
--

CREATE TEMPORARY TABLE `TABLESPACES` (
  `TABLESPACE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `TABLESPACE_TYPE` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NAME` varchar(64) DEFAULT NULL,
  `EXTENT_SIZE` bigint(21) unsigned DEFAULT NULL,
  `AUTOEXTEND_SIZE` bigint(21) unsigned DEFAULT NULL,
  `MAXIMUM_SIZE` bigint(21) unsigned DEFAULT NULL,
  `NODEGROUP_ID` bigint(21) unsigned DEFAULT NULL,
  `TABLESPACE_COMMENT` varchar(2048) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TABLE_CONSTRAINTS`
--

CREATE TEMPORARY TABLE `TABLE_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_TYPE` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TABLE_CONSTRAINTS`
--

INSERT INTO `TABLE_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_SCHEMA`, `TABLE_NAME`, `CONSTRAINT_TYPE`) VALUES
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'armas', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'armaslegajos', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_armaslegajos_armas1', 'admin_m3code.com', 'armaslegajos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_armaslegajos_legajos1', 'admin_m3code.com', 'armaslegajos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'articulos', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_articulos_proveedores1', 'admin_m3code.com', 'articulos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_articulos_rubro1', 'admin_m3code.com', 'articulos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'articulosdepositos', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_articulos_depositos_articulos1', 'admin_m3code.com', 'articulosdepositos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_articulos_depositos_depositos1', 'admin_m3code.com', 'articulosdepositos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'centrocostos', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_centroscostoscomprasmovimientos_centrocostos1', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_centroscostoscomprasmovimientos_comprasmovimientos1', 'admin_m3code.com', 'centroscostoscomprasmovimientos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'ciudads', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_ciudads_provincias1', 'admin_m3code.com', 'ciudads', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'clientes', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_clientes_centrocostos1', 'admin_m3code.com', 'clientes', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_clientes_ciudads1', 'admin_m3code.com', 'clientes', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_clientes_responsabilidadesivas1', 'admin_m3code.com', 'clientes', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'comprasmovimientos', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_comprasmovimientos_proveedors1', 'admin_m3code.com', 'comprasmovimientos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_venta_movimientos_tipos_documentos0', 'admin_m3code.com', 'comprasmovimientos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_venta_movimientos_users10', 'admin_m3code.com', 'comprasmovimientos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_venta_movimiento_condiciones_ventas10', 'admin_m3code.com', 'comprasmovimientos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'condicionesventas', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'configs', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'depositos', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'empleoscategorias', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_empleoscategorias_sindicatos1', 'admin_m3code.com', 'empleoscategorias', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'legajos', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_legajos_ciudads1', 'admin_m3code.com', 'legajos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_legajos_empleoscategorias1', 'admin_m3code.com', 'legajos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_legajos_obrassocials1', 'admin_m3code.com', 'legajos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'legajoslicencias', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_legajoslicencias_licencias1', 'admin_m3code.com', 'legajoslicencias', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_table1_legajos1', 'admin_m3code.com', 'legajoslicencias', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'licencias', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'obrassocials', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'partesdiarios', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_partesdiarios_centrocostos1', 'admin_m3code.com', 'partesdiarios', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_partesdiarios_users1', 'admin_m3code.com', 'partesdiarios', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'partesdiarioscuerpos', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_partesdiarioscuerpos_legajos1', 'admin_m3code.com', 'partesdiarioscuerpos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_partesdiarioscuerpos_partesdiarios1', 'admin_m3code.com', 'partesdiarioscuerpos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_partesdiarioscuerpos_partesdiariosnovedads1', 'admin_m3code.com', 'partesdiarioscuerpos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'partesdiariosnovedads', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'proveedors', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_proveedores_responsabilidad_iva1', 'admin_m3code.com', 'proveedors', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_proveedors_centrocostos1', 'admin_m3code.com', 'proveedors', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_proveedors_ciudads1', 'admin_m3code.com', 'proveedors', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'provincias', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'responsabilidadesivas', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'rubros', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'sindicatos', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'tiposdocumentos', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'users', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'vehiculos', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_vehiculos_centrocostos1', 'admin_m3code.com', 'vehiculos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'vehiculoslicencias', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_vehiculoslicencias_vehiculos1', 'admin_m3code.com', 'vehiculoslicencias', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_vehiculoslicencias_vehiculoslicenciastipos1', 'admin_m3code.com', 'vehiculoslicencias', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'vehiculoslicenciastipos', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'ventasmovimientos', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_ventasmovimientos_clientes1', 'admin_m3code.com', 'ventasmovimientos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_venta_movimientos_tipos_documentos', 'admin_m3code.com', 'ventasmovimientos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_venta_movimientos_users1', 'admin_m3code.com', 'ventasmovimientos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_venta_movimiento_condiciones_ventas1', 'admin_m3code.com', 'ventasmovimientos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'PRIMARY', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'PRIMARY KEY'),
('def', 'admin_m3code.com', 'fk_venta_movimiento_cuerpo_articulos1', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'FOREIGN KEY'),
('def', 'admin_m3code.com', 'fk_venta_movimiento_cuerpo_venta_movimientos1', 'admin_m3code.com', 'ventasmovimientoscuerpos', 'FOREIGN KEY');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TABLE_PRIVILEGES`
--

CREATE TEMPORARY TABLE `TABLE_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TRIGGERS`
--

CREATE TEMPORARY TABLE `TRIGGERS` (
  `TRIGGER_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TRIGGER_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TRIGGER_NAME` varchar(64) NOT NULL DEFAULT '',
  `EVENT_MANIPULATION` varchar(6) NOT NULL DEFAULT '',
  `EVENT_OBJECT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `EVENT_OBJECT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_OBJECT_TABLE` varchar(64) NOT NULL DEFAULT '',
  `ACTION_ORDER` bigint(4) NOT NULL DEFAULT '0',
  `ACTION_CONDITION` longtext,
  `ACTION_STATEMENT` longtext NOT NULL,
  `ACTION_ORIENTATION` varchar(9) NOT NULL DEFAULT '',
  `ACTION_TIMING` varchar(6) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_OLD_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_NEW_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_OLD_ROW` varchar(3) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_NEW_ROW` varchar(3) NOT NULL DEFAULT '',
  `CREATED` datetime DEFAULT NULL,
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USER_PRIVILEGES`
--

CREATE TEMPORARY TABLE `USER_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `USER_PRIVILEGES`
--

INSERT INTO `USER_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES
('''admin_m3code''@''localhost''', 'def', 'USAGE', 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VIEWS`
--

CREATE TEMPORARY TABLE `VIEWS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VIEW_DEFINITION` longtext NOT NULL,
  `CHECK_OPTION` varchar(8) NOT NULL DEFAULT '',
  `IS_UPDATABLE` varchar(3) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `INNODB_BUFFER_PAGE`
--

CREATE TEMPORARY TABLE `INNODB_BUFFER_PAGE` (
  `POOL_ID` bigint(21) unsigned NOT NULL DEFAULT '0',
  `BLOCK_ID` bigint(21) unsigned NOT NULL DEFAULT '0',
  `SPACE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGE_NUMBER` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGE_TYPE` varchar(64) DEFAULT NULL,
  `FLUSH_TYPE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `FIX_COUNT` bigint(21) unsigned NOT NULL DEFAULT '0',
  `IS_HASHED` varchar(3) DEFAULT NULL,
  `NEWEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `OLDEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `ACCESS_TIME` bigint(21) unsigned NOT NULL DEFAULT '0',
  `TABLE_NAME` varchar(1024) DEFAULT NULL,
  `INDEX_NAME` varchar(1024) DEFAULT NULL,
  `NUMBER_RECORDS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_SIZE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COMPRESSED_SIZE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGE_STATE` varchar(64) DEFAULT NULL,
  `IO_FIX` varchar(64) DEFAULT NULL,
  `IS_OLD` varchar(3) DEFAULT NULL,
  `FREE_PAGE_CLOCK` bigint(21) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- en uso (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `INNODB_TRX`
--

CREATE TEMPORARY TABLE `INNODB_TRX` (
  `trx_id` varchar(18) NOT NULL DEFAULT '',
  `trx_state` varchar(13) NOT NULL DEFAULT '',
  `trx_started` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trx_requested_lock_id` varchar(81) DEFAULT NULL,
  `trx_wait_started` datetime DEFAULT NULL,
  `trx_weight` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_mysql_thread_id` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_query` varchar(1024) DEFAULT NULL,
  `trx_operation_state` varchar(64) DEFAULT NULL,
  `trx_tables_in_use` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_tables_locked` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_lock_structs` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_lock_memory_bytes` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_rows_locked` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_rows_modified` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_concurrency_tickets` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_isolation_level` varchar(16) NOT NULL DEFAULT '',
  `trx_unique_checks` int(1) NOT NULL DEFAULT '0',
  `trx_foreign_key_checks` int(1) NOT NULL DEFAULT '0',
  `trx_last_foreign_key_error` varchar(256) DEFAULT NULL,
  `trx_adaptive_hash_latched` int(1) NOT NULL DEFAULT '0',
  `trx_adaptive_hash_timeout` bigint(21) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- en uso (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `INNODB_BUFFER_POOL_STATS`
--

CREATE TEMPORARY TABLE `INNODB_BUFFER_POOL_STATS` (
  `POOL_ID` bigint(21) unsigned NOT NULL DEFAULT '0',
  `POOL_SIZE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `FREE_BUFFERS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATABASE_PAGES` bigint(21) unsigned NOT NULL DEFAULT '0',
  `OLD_DATABASE_PAGES` bigint(21) unsigned NOT NULL DEFAULT '0',
  `MODIFIED_DATABASE_PAGES` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PENDING_DECOMPRESS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PENDING_READS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PENDING_FLUSH_LRU` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PENDING_FLUSH_LIST` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGES_MADE_YOUNG` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGES_NOT_MADE_YOUNG` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGES_MADE_YOUNG_RATE` double NOT NULL DEFAULT '0',
  `PAGES_MADE_NOT_YOUNG_RATE` double NOT NULL DEFAULT '0',
  `NUMBER_PAGES_READ` bigint(21) unsigned NOT NULL DEFAULT '0',
  `NUMBER_PAGES_CREATED` bigint(21) unsigned NOT NULL DEFAULT '0',
  `NUMBER_PAGES_WRITTEN` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGES_READ_RATE` double NOT NULL DEFAULT '0',
  `PAGES_CREATE_RATE` double NOT NULL DEFAULT '0',
  `PAGES_WRITTEN_RATE` double NOT NULL DEFAULT '0',
  `NUMBER_PAGES_GET` bigint(21) unsigned NOT NULL DEFAULT '0',
  `HIT_RATE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `YOUNG_MAKE_PER_THOUSAND_GETS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `NOT_YOUNG_MAKE_PER_THOUSAND_GETS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `NUMBER_PAGES_READ_AHEAD` bigint(21) unsigned NOT NULL DEFAULT '0',
  `NUMBER_READ_AHEAD_EVICTED` bigint(21) unsigned NOT NULL DEFAULT '0',
  `READ_AHEAD_RATE` double NOT NULL DEFAULT '0',
  `READ_AHEAD_EVICTED_RATE` double NOT NULL DEFAULT '0',
  `LRU_IO_TOTAL` bigint(21) unsigned NOT NULL DEFAULT '0',
  `LRU_IO_CURRENT` bigint(21) unsigned NOT NULL DEFAULT '0',
  `UNCOMPRESS_TOTAL` bigint(21) unsigned NOT NULL DEFAULT '0',
  `UNCOMPRESS_CURRENT` bigint(21) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- en uso (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `INNODB_LOCK_WAITS`
--

CREATE TEMPORARY TABLE `INNODB_LOCK_WAITS` (
  `requesting_trx_id` varchar(18) NOT NULL DEFAULT '',
  `requested_lock_id` varchar(81) NOT NULL DEFAULT '',
  `blocking_trx_id` varchar(18) NOT NULL DEFAULT '',
  `blocking_lock_id` varchar(81) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- en uso (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `INNODB_CMPMEM`
--

CREATE TEMPORARY TABLE `INNODB_CMPMEM` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `buffer_pool_instance` int(11) NOT NULL DEFAULT '0',
  `pages_used` int(11) NOT NULL DEFAULT '0',
  `pages_free` int(11) NOT NULL DEFAULT '0',
  `relocation_ops` bigint(21) NOT NULL DEFAULT '0',
  `relocation_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- en uso (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `INNODB_CMP`
--

CREATE TEMPORARY TABLE `INNODB_CMP` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `compress_ops` int(11) NOT NULL DEFAULT '0',
  `compress_ops_ok` int(11) NOT NULL DEFAULT '0',
  `compress_time` int(11) NOT NULL DEFAULT '0',
  `uncompress_ops` int(11) NOT NULL DEFAULT '0',
  `uncompress_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- en uso (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `INNODB_LOCKS`
--

CREATE TEMPORARY TABLE `INNODB_LOCKS` (
  `lock_id` varchar(81) NOT NULL DEFAULT '',
  `lock_trx_id` varchar(18) NOT NULL DEFAULT '',
  `lock_mode` varchar(32) NOT NULL DEFAULT '',
  `lock_type` varchar(32) NOT NULL DEFAULT '',
  `lock_table` varchar(1024) NOT NULL DEFAULT '',
  `lock_index` varchar(1024) DEFAULT NULL,
  `lock_space` bigint(21) unsigned DEFAULT NULL,
  `lock_page` bigint(21) unsigned DEFAULT NULL,
  `lock_rec` bigint(21) unsigned DEFAULT NULL,
  `lock_data` varchar(8192) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- en uso (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `INNODB_CMPMEM_RESET`
--

CREATE TEMPORARY TABLE `INNODB_CMPMEM_RESET` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `buffer_pool_instance` int(11) NOT NULL DEFAULT '0',
  `pages_used` int(11) NOT NULL DEFAULT '0',
  `pages_free` int(11) NOT NULL DEFAULT '0',
  `relocation_ops` bigint(21) NOT NULL DEFAULT '0',
  `relocation_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- en uso (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `INNODB_CMP_RESET`
--

CREATE TEMPORARY TABLE `INNODB_CMP_RESET` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `compress_ops` int(11) NOT NULL DEFAULT '0',
  `compress_ops_ok` int(11) NOT NULL DEFAULT '0',
  `compress_time` int(11) NOT NULL DEFAULT '0',
  `uncompress_ops` int(11) NOT NULL DEFAULT '0',
  `uncompress_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- en uso (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `INNODB_BUFFER_PAGE_LRU`
--

CREATE TEMPORARY TABLE `INNODB_BUFFER_PAGE_LRU` (
  `POOL_ID` bigint(21) unsigned NOT NULL DEFAULT '0',
  `LRU_POSITION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `SPACE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGE_NUMBER` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGE_TYPE` varchar(64) DEFAULT NULL,
  `FLUSH_TYPE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `FIX_COUNT` bigint(21) unsigned NOT NULL DEFAULT '0',
  `IS_HASHED` varchar(3) DEFAULT NULL,
  `NEWEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `OLDEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `ACCESS_TIME` bigint(21) unsigned NOT NULL DEFAULT '0',
  `TABLE_NAME` varchar(1024) DEFAULT NULL,
  `INDEX_NAME` varchar(1024) DEFAULT NULL,
  `NUMBER_RECORDS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_SIZE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COMPRESSED_SIZE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COMPRESSED` varchar(3) DEFAULT NULL,
  `IO_FIX` varchar(64) DEFAULT NULL,
  `IS_OLD` varchar(3) DEFAULT NULL,
  `FREE_PAGE_CLOCK` bigint(21) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- en uso (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
