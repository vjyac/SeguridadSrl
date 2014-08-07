-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
--
-- Servidor: localhost:8889
-- Tiempo de generación: 07-08-2014 a las 23:52:58
-- Versión del servidor: 5.5.34
-- Versión de PHP: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `seguridadsrl`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armas`
--

CREATE TABLE `armas` (
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

CREATE TABLE `armaslegajos` (
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

CREATE TABLE `articulos` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `articulo`, `rubros_id`, `proveedors_id`, `precio_base`, `utilidad`, `precio_publico`, `iva`, `created_at`, `updated_at`) VALUES
(2, 'Servicio de Seguridad', 6, 1, 12400.00, 0.00, 15004.00, 21.00, '2014-03-12 19:32:19', '2014-03-12 19:32:19'),
(3, 'Servicio de Vigilancia', 6, 1, 45.00, 0.00, 54.45, 21.00, '2014-03-12 19:33:26', '2014-03-12 21:44:24'),
(4, 'Serv. Seguridad Estac. Paso de los Libres', 6, 1, 45.12, 0.00, 54.60, 21.00, '2014-03-12 20:38:03', '2014-03-12 20:39:03'),
(5, 'Serv. Seguridad Estac. Monte Caceros', 6, 1, 45.12, 0.00, 54.60, 21.00, '2014-03-12 20:38:49', '2014-03-12 20:38:49'),
(6, 'Serv. Extra, Adicional y/o Preventivos', 6, 1, 350.82, 0.00, 424.49, 21.00, '2014-03-12 20:40:09', '2014-03-12 20:40:09'),
(7, 'Serv. maniobra Inter. Paso de Los Libres', 6, 1, 15280.80, 0.00, 18489.77, 21.00, '2014-03-12 20:41:05', '2014-03-12 20:41:05'),
(9, 'Apoyo maniobra Inter. Paso de Los Libres', 6, 1, 600.00, 0.00, 726.00, 21.00, '2014-03-12 20:41:55', '2014-03-12 20:41:55'),
(10, 'Cheque rechazados', 6, 1, 1.00, 0.00, 1.00, 0.00, '2014-08-03 16:32:21', '2014-08-03 16:32:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulosdepositos`
--

CREATE TABLE `articulosdepositos` (
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

CREATE TABLE `centrocostos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `centrocosto` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'inactivo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `centrocostos`
--

INSERT INTO `centrocostos` (`id`, `centrocosto`, `created_at`, `updated_at`, `estado`) VALUES
(1, 'Sin centro de costo', '2014-03-12 04:56:21', '2014-03-12 04:56:21', 'inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centrocostoscategorias`
--

CREATE TABLE `centrocostoscategorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `centrocostoscategoria` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centrocostoscategoriasporcentrocostos`
--

CREATE TABLE `centrocostoscategoriasporcentrocostos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `centrocostoscategorias_id` int(11) NOT NULL,
  `centrocostos_id` int(11) NOT NULL,
  `porcentaje` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_centrocostoscategoriasporcentrocostos_centrocostoscatego_idx` (`centrocostoscategorias_id`),
  KEY `fk_centrocostoscategoriasporcentrocostos_centrocostos1_idx` (`centrocostos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centroscostoscomprasmovimientos`
--

CREATE TABLE `centroscostoscomprasmovimientos` (
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

CREATE TABLE `ciudads` (
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
(1, 'Virasoro', '2014-03-12 19:23:52', '2014-03-12 19:23:52', 1),
(2, 'Santo Tome', '2014-03-12 19:24:05', '2014-03-12 19:24:05', 1),
(3, 'San Jose', '2014-03-12 19:40:54', '2014-03-12 19:40:54', 2),
(4, 'Capital Federal', '2014-03-12 19:46:09', '2014-03-12 19:46:09', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
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
(5, 'Belgrano Cargas y LogÃ­stica S.A.', 'Mujica Carlos, Padre 426', '30714101443', '', NULL, '', 7, 4, '2014-03-12 12:47:41', '2014-03-12 12:47:41', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprasmovimientos`
--

CREATE TABLE `comprasmovimientos` (
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

CREATE TABLE `condicionesventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condicionesventa` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `condicionesventas`
--

INSERT INTO `condicionesventas` (`id`, `condicionesventa`, `created_at`, `updated_at`) VALUES
(1, 'Contado', '2014-03-12 08:58:01', '2014-03-12 08:58:01'),
(2, 'Cta. Cte.', '2014-03-12 19:24:25', '2014-03-12 19:24:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configs`
--

CREATE TABLE `configs` (
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

CREATE TABLE `depositos` (
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

CREATE TABLE `empleoscategorias` (
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
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id`, `empresa`, `created_at`, `updated_at`) VALUES
(1, 'Seguridad S.R.L.', NULL, NULL),
(2, 'Seguridad S.H.', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresasdocumentosnumeros`
--

CREATE TABLE `empresasdocumentosnumeros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(12) DEFAULT NULL,
  `empresas_id` int(11) NOT NULL,
  `tiposdocumentos_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empresasdocumentosnumeros_empresas1_idx` (`empresas_id`),
  KEY `fk_empresasdocumentosnumeros_tiposdocumentos1_idx` (`tiposdocumentos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `empresasdocumentosnumeros`
--

INSERT INTO `empresasdocumentosnumeros` (`id`, `numero`, `empresas_id`, `tiposdocumentos_id`, `created_at`, `updated_at`) VALUES
(1, 200000087, 1, 1, NULL, '2014-08-06 23:00:47'),
(2, 100000001, 1, 2, NULL, NULL),
(3, 0, 1, 3, NULL, NULL),
(4, 0, 1, 4, NULL, NULL),
(5, 0, 1, 5, NULL, NULL),
(6, 150, 1, 6, '2014-07-05 00:00:00', '2014-08-05 23:25:57'),
(7, 12, 1, 7, NULL, '2014-08-05 21:44:58'),
(8, 0, 1, 8, NULL, NULL),
(9, 500, 1, 9, '2014-07-05 00:00:00', '2014-07-05 00:00:00'),
(10, 0, 1, 10, NULL, NULL),
(11, 400000397, 2, 1, NULL, '2014-08-06 23:11:18'),
(12, 200000001, 2, 2, NULL, NULL),
(13, 0, 2, 3, NULL, NULL),
(14, 0, 2, 4, NULL, NULL),
(15, 0, 2, 5, NULL, NULL),
(16, 900, 2, 6, '2014-07-05 00:00:00', '2014-07-05 00:00:00'),
(17, 0, 2, 7, NULL, NULL),
(18, 0, 2, 8, NULL, NULL),
(19, 2500, 2, 9, '2014-07-05 00:00:00', '2014-07-05 00:00:00'),
(20, 0, 2, 10, NULL, NULL),
(21, 704, 1, 11, '2014-08-06 00:00:00', '2014-08-04 23:16:04'),
(22, 9000, 2, 11, '2014-08-06 00:00:00', '2014-08-06 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `permissions` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `legajos`
--

CREATE TABLE `legajos` (
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

CREATE TABLE `legajoslicencias` (
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

CREATE TABLE `licencias` (
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

CREATE TABLE `obrassocials` (
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

CREATE TABLE `partesdiarios` (
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

CREATE TABLE `partesdiarioscuerpos` (
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

CREATE TABLE `partesdiariosnovedads` (
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

CREATE TABLE `proveedors` (
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
(1, 'Red de Seguridad SRL', '30714076708', '', '', 'Diego Lovera', 7, '2014-03-12 19:30:11', '2014-03-12 19:30:11', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
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
(1, 'Corrientes', '2014-03-12 19:22:43', '2014-03-12 19:22:43'),
(2, 'Misiones', '2014-03-12 19:23:09', '2014-03-12 19:23:09'),
(3, 'Entre Rios', '2014-03-12 19:23:19', '2014-03-12 19:23:19'),
(4, 'Buenos Aires', '2014-03-12 19:45:46', '2014-03-12 19:45:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsabilidadesivas`
--

CREATE TABLE `responsabilidadesivas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `responsabilidadesiva` varchar(125) DEFAULT NULL,
  `venta_tiposdocumentos_id` int(11) DEFAULT NULL,
  `recibo_tiposdocumentos_id` int(11) DEFAULT NULL,
  `nc_tiposdocumentos_id` int(11) DEFAULT NULL,
  `nd_tiposdocumentos_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `responsabilidadesivas`
--

INSERT INTO `responsabilidadesivas` (`id`, `responsabilidadesiva`, `venta_tiposdocumentos_id`, `recibo_tiposdocumentos_id`, `nc_tiposdocumentos_id`, `nd_tiposdocumentos_id`, `created_at`, `updated_at`) VALUES
(7, 'Responsable Inscripto', 1, 5, 6, 7, '2014-03-12 09:02:30', '2014-03-12 19:27:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubros`
--

CREATE TABLE `rubros` (
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
(6, 'Servicios', '2014-03-12 09:07:55', '2014-03-12 09:07:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sindicatos`
--

CREATE TABLE `sindicatos` (
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
-- Estructura de tabla para la tabla `throttle`
--

CREATE TABLE `throttle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `attempts` int(11) DEFAULT NULL,
  `suspended` tinyint(1) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdocumentos`
--

CREATE TABLE `tiposdocumentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tiposdocumento` varchar(75) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `tiposdocumentos`
--

INSERT INTO `tiposdocumentos` (`id`, `tiposdocumento`, `created_at`, `updated_at`) VALUES
(1, 'Factura A', '2014-03-12 08:58:21', '2014-05-28 03:39:30'),
(2, 'Factura B', '2014-03-12 08:58:32', '2014-05-28 03:39:37'),
(3, 'Factura C', '2014-03-12 08:59:28', '2014-03-12 08:59:28'),
(4, 'Factura M', '2014-03-12 08:59:36', '2014-03-12 08:59:36'),
(5, 'Recibo', '2014-03-12 09:00:05', '2014-05-27 07:24:43'),
(6, 'Nota de Credito A', '2014-03-12 09:00:31', '2014-03-12 09:00:31'),
(7, 'Nota de Debito A', '2014-03-12 09:00:43', '2014-03-12 09:00:43'),
(8, 'Remito', '2014-03-12 09:00:55', '2014-03-12 09:00:55'),
(9, 'Nota de Credito B', '2014-03-12 09:01:17', '2014-03-12 09:01:17'),
(10, 'Nota de Debito B', '2014-03-12 09:01:30', '2014-03-12 09:01:30'),
(11, 'Pago a Cuentas', '2014-08-03 03:00:00', '2014-08-03 03:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(75) DEFAULT NULL,
  `email` varchar(125) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(125) DEFAULT NULL,
  `last_name` varchar(125) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `permissions` text,
  `activated` tinyint(4) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `persist_code` varchar(255) DEFAULT NULL,
  `reset_password_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `first_name`, `last_name`, `remember_token`, `permissions`, `activated`, `activation_code`, `activated_at`, `last_login`, `persist_code`, `reset_password_code`, `created_at`, `updated_at`) VALUES
(3, 'keloxers', 'keloxers@gmail.com', '$2y$08$RuUbbtiQ2exDanpehxgRPekyjnfRLYmaZYFNEhvyPX5lQEu4GFCLi', NULL, NULL, 'ghmuefUohIlywzHnFObR8CrLth2dbW91PRissHGoz8Y3E7AX5UPY72TXS3iX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-03-12 08:56:40', '2014-08-07 23:19:47'),
(4, 'diego', 'diego', '$2y$08$/NlbRKvuh4wRpXcWOQHaNednBqRt2cGjm3DA4c73TCBpUQGu6CvDm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-03-12 19:21:24', '2014-03-12 19:21:24'),
(5, 'godoy', 'godoy', '$2y$08$EQJ7c1cmVwmkuQF2sQ8vHuJexO3TkLwMpN9t.827k3loA4JQ26vfa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-24 20:57:42', '2014-05-24 20:57:42'),
(6, 'rosa', 'rosa', '$2y$08$FxwUoasb0EJanUgBGnuUS.p2tBbjdBeCaL72uxI0ieFuA8D/lmp/e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-24 20:58:15', '2014-05-24 20:58:15'),
(7, 'hugo', 'hugo', '$2y$08$38j4RfJ906f/tuaFCX.Bl.RqzyU/s0DFEnL5nVT.HujBL/gV28d0S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-24 22:08:45', '2014-05-24 22:08:45'),
(8, '', 'godoy', '$2y$08$bOn/mAHZ2lBu/YbElbXHTOVWEu/BssraLsHVc3NljAEI35T9QrG7e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-26 22:05:04', '2014-05-26 22:05:04'),
(9, '', 'godoy', '$2y$08$.v5S4Z3hrHN42/FJq5lztuxIkUUSnh9Wt20/kdhRfy1HvBgEDO/c6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-26 22:06:33', '2014-05-26 22:06:33'),
(10, '', 'godoy', '$2y$08$07.O.IoY2lVZlzXZh1C..O9kPFlFl9UPHNThP8WtZ/tOngEsJnRzO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-26 22:07:35', '2014-05-26 22:07:35'),
(11, 'ProcjectTido', 'wareztrance@mail.ru', '$2y$08$.fDBjxkd8bGdUDAcEiIiZuzAuQ6bpRNBRqiouLX4/5chP4kj5ezdC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-31 15:57:58', '2014-05-31 15:57:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_groups`
--

CREATE TABLE `users_groups` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
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

CREATE TABLE `vehiculoslicencias` (
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

CREATE TABLE `vehiculoslicenciastipos` (
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

CREATE TABLE `ventasmovimientos` (
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
  `empresas_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_venta_movimientos_tipos_documentos_idx` (`tiposdocumentos_id`),
  KEY `fk_venta_movimiento_condiciones_ventas1_idx` (`condicionesventas_id`),
  KEY `fk_venta_movimientos_users1_idx` (`users_id`),
  KEY `fk_ventasmovimientos_clientes1_idx` (`clientes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventasmovimientoscuerpos`
--

CREATE TABLE `ventasmovimientoscuerpos` (
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
  `descripcion` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venta_movimiento_cuerpo_venta_movimientos1_idx` (`ventasmovimientos_id`),
  KEY `fk_venta_movimiento_cuerpo_articulos1_idx` (`articulos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

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
-- Filtros para la tabla `centrocostoscategoriasporcentrocostos`
--
ALTER TABLE `centrocostoscategoriasporcentrocostos`
  ADD CONSTRAINT `fk_centrocostoscategoriasporcentrocostos_centrocostos1` FOREIGN KEY (`centrocostos_id`) REFERENCES `centrocostos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_centrocostoscategoriasporcentrocostos_centrocostoscategori1` FOREIGN KEY (`centrocostoscategorias_id`) REFERENCES `centrocostoscategorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Filtros para la tabla `empresasdocumentosnumeros`
--
ALTER TABLE `empresasdocumentosnumeros`
  ADD CONSTRAINT `fk_empresasdocumentosnumeros_empresas1` FOREIGN KEY (`empresas_id`) REFERENCES `empresas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empresasdocumentosnumeros_tiposdocumentos1` FOREIGN KEY (`tiposdocumentos_id`) REFERENCES `tiposdocumentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
