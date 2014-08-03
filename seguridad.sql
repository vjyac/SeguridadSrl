-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-05-2014 a las 13:50:55
-- Versión del servidor: 5.5.29
-- Versión de PHP: 5.4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
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
(1, 'Sin centro de costo', '2014-03-12 01:56:21', '2014-03-12 01:56:21', 'inactivo');

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
(1, 'Virasoro', '2014-03-12 16:23:52', '2014-03-12 16:23:52', 1),
(2, 'Santo Tome', '2014-03-12 16:24:05', '2014-03-12 16:24:05', 1),
(3, 'San Jose', '2014-03-12 16:40:54', '2014-03-12 16:40:54', 2),
(4, 'Capital Federal', '2014-03-12 16:46:09', '2014-03-12 16:46:09', 4);

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
(5, 'Belgrano Cargas y Logística S.A.', 'Mujica Carlos, Padre 426', '30714101443', '', NULL, '', 7, 4, '2014-03-12 12:47:41', '2014-03-12 12:47:41', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `empresasdocumentosnumeros`
--

INSERT INTO `empresasdocumentosnumeros` (`id`, `numero`, `empresas_id`, `tiposdocumentos_id`, `created_at`, `updated_at`) VALUES
(1, 200000059, 1, 1, NULL, '2014-05-28 11:23:54'),
(2, 100000001, 1, 2, NULL, NULL),
(3, 0, 1, 3, NULL, NULL),
(4, 0, 1, 4, NULL, NULL),
(5, 0, 1, 5, NULL, NULL),
(6, 0, 1, 6, NULL, NULL),
(7, 0, 1, 7, NULL, NULL),
(8, 0, 1, 8, NULL, NULL),
(9, 0, 1, 9, NULL, NULL),
(10, 0, 1, 10, NULL, NULL),
(11, 400000390, 2, 1, NULL, '2014-05-27 23:07:54'),
(12, 200000001, 2, 2, NULL, NULL),
(13, 0, 2, 3, NULL, NULL),
(14, 0, 2, 4, NULL, NULL),
(15, 0, 2, 5, NULL, NULL),
(16, 0, 2, 6, NULL, NULL),
(17, 0, 2, 7, NULL, NULL),
(18, 0, 2, 8, NULL, NULL),
(19, 0, 2, 9, NULL, NULL),
(20, 0, 2, 10, NULL, NULL);

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
(1, 'Red de Seguridad SRL', '30714076708', '', '', 'Diego Lovera', 7, '2014-03-12 16:30:11', '2014-03-12 16:30:11', 1, 1);

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
(1, 'Corrientes', '2014-03-12 16:22:43', '2014-03-12 16:22:43'),
(2, 'Misiones', '2014-03-12 16:23:09', '2014-03-12 16:23:09'),
(3, 'Entre Rios', '2014-03-12 16:23:19', '2014-03-12 16:23:19'),
(4, 'Buenos Aires', '2014-03-12 16:45:46', '2014-03-12 16:45:46');

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
(7, 'Responsable Inscripto', 1, 5, 6, 7, '2014-03-12 06:02:30', '2014-03-12 16:27:17');

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
(6, 'Servicios', '2014-03-12 06:07:55', '2014-03-12 06:07:55');

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
-- Estructura de tabla para la tabla `tiposdocumentos`
--

CREATE TABLE `tiposdocumentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tiposdocumento` varchar(75) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `tiposdocumentos`
--

INSERT INTO `tiposdocumentos` (`id`, `tiposdocumento`, `created_at`, `updated_at`) VALUES
(1, 'Factura A', '2014-03-12 05:58:21', '2014-05-28 00:39:30'),
(2, 'Factura B', '2014-03-12 05:58:32', '2014-05-28 00:39:37'),
(3, 'Factura C', '2014-03-12 05:59:28', '2014-03-12 05:59:28'),
(4, 'Factura M', '2014-03-12 05:59:36', '2014-03-12 05:59:36'),
(5, 'Recibo', '2014-03-12 06:00:05', '2014-05-27 04:24:43'),
(6, 'Nota de Credito A', '2014-03-12 06:00:31', '2014-03-12 06:00:31'),
(7, 'Nota de Debito A', '2014-03-12 06:00:43', '2014-03-12 06:00:43'),
(8, 'Remito', '2014-03-12 06:00:55', '2014-03-12 06:00:55'),
(9, 'Nota de Credito B', '2014-03-12 06:01:17', '2014-03-12 06:01:17'),
(10, 'Nota de Debito B', '2014-03-12 06:01:30', '2014-03-12 06:01:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(75) DEFAULT NULL,
  `email` varchar(125) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(3, 'keloxers', 'keloxers@gmail.com', '$2y$08$RuUbbtiQ2exDanpehxgRPekyjnfRLYmaZYFNEhvyPX5lQEu4GFCLi', '2014-03-12 05:56:40', '2014-03-12 05:56:40'),
(4, 'diego', 'diego', '$2y$08$/NlbRKvuh4wRpXcWOQHaNednBqRt2cGjm3DA4c73TCBpUQGu6CvDm', '2014-03-12 16:21:24', '2014-03-12 16:21:24'),
(5, 'godoy', 'godoy', '$2y$08$EQJ7c1cmVwmkuQF2sQ8vHuJexO3TkLwMpN9t.827k3loA4JQ26vfa', '2014-05-24 17:57:42', '2014-05-24 17:57:42'),
(6, 'rosa', 'rosa', '$2y$08$FxwUoasb0EJanUgBGnuUS.p2tBbjdBeCaL72uxI0ieFuA8D/lmp/e', '2014-05-24 17:58:15', '2014-05-24 17:58:15'),
(7, 'hugo', 'hugo', '$2y$08$38j4RfJ906f/tuaFCX.Bl.RqzyU/s0DFEnL5nVT.HujBL/gV28d0S', '2014-05-24 19:08:45', '2014-05-24 19:08:45'),
(8, '', 'godoy', '$2y$08$bOn/mAHZ2lBu/YbElbXHTOVWEu/BssraLsHVc3NljAEI35T9QrG7e', '2014-05-26 19:05:04', '2014-05-26 19:05:04'),
(9, '', 'godoy', '$2y$08$.v5S4Z3hrHN42/FJq5lztuxIkUUSnh9Wt20/kdhRfy1HvBgEDO/c6', '2014-05-26 19:06:33', '2014-05-26 19:06:33'),
(10, '', 'godoy', '$2y$08$07.O.IoY2lVZlzXZh1C..O9kPFlFl9UPHNThP8WtZ/tOngEsJnRzO', '2014-05-26 19:07:35', '2014-05-26 19:07:35');

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
  PRIMARY KEY (`id`),
  KEY `fk_venta_movimientos_tipos_documentos_idx` (`tiposdocumentos_id`),
  KEY `fk_venta_movimiento_condiciones_ventas1_idx` (`condicionesventas_id`),
  KEY `fk_venta_movimientos_users1_idx` (`users_id`),
  KEY `fk_ventasmovimientos_clientes1_idx` (`clientes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

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
(9, '2014-02-04', '2014-02-04', 1, '400000389', 'debe', 15004.00, 0.00, 4, 12400.00, 0.00, 2604.00, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 13:31:15', '2014-05-27 00:24:43', 4, 2),
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
(35, '2014-03-05', '2014-03-05', 1, '200000060', 'debe', 1016.40, 0.00, 4, 840.00, 0.00, 176.40, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:27:34', '2014-05-24 13:51:19', 4, 3),
(36, '2014-03-05', '2014-03-05', 1, '200000061', 'debe', 847.00, 0.00, 4, 700.00, 0.00, 147.00, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:28:00', '2014-05-24 13:51:19', 4, 3),
(37, '2014-03-05', '2014-03-05', 1, '200000062', 'debe', 1101.10, 0.00, 4, 910.00, 0.00, 191.10, 0.00, 0.00, 0.00, 'cerrada', NULL, '2014-03-12 14:28:28', '2014-05-24 13:51:19', 4, 3),
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
(61, '2014-03-06', '2014-03-07', 1, '400000390', 'debe', 15004.00, 15004.00, 4, 12400.00, 0.00, 2604.00, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-03-21 23:16:27', '2014-03-21 23:17:40', 4, 2),
(62, '2014-05-24', '2014-05-24', 1, '200000075', 'debe', 1306.80, 1306.80, 3, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-24 13:40:55', '2014-05-24 13:47:34', 4, 3),
(64, '2014-03-27', '2014-03-27', 1, '200000076', 'debe', 1306.80, 1306.80, 3, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-24 14:24:35', '2014-05-24 14:27:16', 5, 3),
(65, '2014-03-27', '2014-03-27', 1, '200000077', 'debe', 1089.00, 1089.00, 3, 900.00, 0.00, 189.00, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-24 14:28:06', '2014-05-24 14:29:20', 5, 3),
(66, '2014-03-31', '2014-05-31', 1, '200000078', 'debe', 1306.80, 1306.80, 3, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-24 14:30:54', '2014-05-24 14:31:39', 5, 3),
(67, '2014-03-31', '2014-03-31', 1, '200000079', 'debe', 1089.00, 1089.00, 3, 900.00, 0.00, 189.00, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-24 14:33:07', '2014-05-24 14:33:50', 5, 3),
(68, '2014-04-07', '2014-04-07', 1, '200000080', 'debe', 1796.85, 1796.85, 3, 1485.00, 0.00, 311.85, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:20:04', '2014-05-26 21:21:08', 5, 3),
(69, '2014-04-07', '2014-04-07', 1, '200000081', 'debe', 1306.80, 1306.80, 3, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:21:52', '2014-05-26 21:22:32', 5, 3),
(70, '2014-05-10', '2014-05-10', 1, '200000082', 'debe', 1306.80, 1306.80, 3, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:23:37', '2014-05-26 21:24:17', 5, 3),
(71, '2014-05-10', '2014-05-10', 1, '200000083', 'debe', 1089.00, 1089.00, 3, 900.00, 0.00, 189.00, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:25:03', '2014-05-26 21:25:49', 5, 3),
(72, '2014-05-10', '2014-05-10', 1, '200000084', 'debe', 65776.69, 65776.69, 3, 54360.90, 0.00, 11415.79, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:28:25', '2014-05-26 21:39:45', 5, 5),
(73, '2014-05-10', '2014-05-10', 1, '200000085', 'debe', 1306.80, 1306.80, 3, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:40:39', '2014-05-26 21:41:12', 5, 3),
(74, '2014-05-11', '2014-05-11', 1, '200000086', 'debe', 1306.80, 1306.80, 3, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:41:50', '2014-05-26 21:42:25', 5, 3),
(75, '2014-05-11', '2014-05-11', 1, '200000087', 'debe', 1306.80, 1306.80, 3, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:43:07', '2014-05-26 21:43:41', 5, 3),
(76, '2014-05-11', '2014-05-11', 1, '200000088', 'debe', 707.85, 707.85, 3, 585.00, 0.00, 122.85, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:44:22', '2014-05-26 21:44:51', 5, 3),
(77, '2014-05-11', '2014-05-11', 1, '200000089', 'debe', 1306.80, 1306.80, 3, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:45:44', '2014-05-26 21:47:30', 5, 3),
(78, '2014-05-11', '2014-05-11', 1, '200000090', 'debe', 1089.00, 1089.00, 3, 900.00, 0.00, 189.00, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:47:59', '2014-05-26 21:48:26', 5, 3),
(79, '2014-05-11', '2014-05-11', 1, '200000091', 'debe', 1306.80, 1306.80, 3, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:49:01', '2014-05-26 21:49:31', 5, 3),
(80, '2014-05-11', '2014-05-11', 1, '200000092', 'debe', 1306.80, 1306.80, 3, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:50:07', '2014-05-26 21:50:36', 5, 3),
(81, '2014-05-11', '2014-05-11', 1, '200000093', 'debe', 1306.80, 1306.80, 3, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:51:19', '2014-05-26 21:51:43', 5, 3),
(82, '2014-05-11', '2014-05-11', 1, '200000094', 'debe', 1361.25, 1361.25, 3, 1125.00, 0.00, 236.25, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:52:32', '2014-05-26 21:53:03', 5, 3),
(83, '2014-05-11', '2014-05-11', 1, '200000095', 'debe', 1306.80, 1306.80, 3, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:54:22', '2014-05-26 21:55:08', 5, 3),
(84, '2014-05-11', '2014-05-11', 1, '200000096', 'debe', 1089.00, 1089.00, 3, 900.00, 0.00, 189.00, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 21:55:38', '2014-05-26 21:56:11', 5, 3),
(85, '2014-05-12', '2014-05-12', 1, '200000097', 'debe', 96796.26, 96796.26, 3, 79996.91, 0.00, 16799.35, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 22:05:39', '2014-05-26 22:08:56', 5, 5),
(86, '2014-05-14', '2014-05-20', 1, '200000098', 'debe', 282882.91, 282882.91, 3, 233787.53, 0.00, 49095.38, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 22:10:09', '2014-05-26 22:12:42', 5, 5),
(87, '2014-05-19', '2014-05-25', 1, '200000099', 'debe', 1306.80, 1306.80, 3, 1080.00, 0.00, 226.80, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 22:15:47', '2014-05-26 22:16:17', 5, 3),
(88, '2014-05-19', '2014-05-25', 1, '200000100', 'debe', 1089.00, 1089.00, 3, 900.00, 0.00, 189.00, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 22:16:59', '2014-05-26 22:17:50', 5, 3),
(89, '2014-05-23', '2014-05-27', 1, '200000101', 'debe', 65776.69, 65776.69, 3, 54360.90, 0.00, 11415.79, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 22:18:40', '2014-05-26 22:19:53', 5, 5),
(90, '2014-02-26', '2014-02-28', 1, '200000102', 'debe', NULL, NULL, 4, NULL, NULL, NULL, NULL, 0.00, NULL, 'pendiente', NULL, '2014-05-26 23:43:59', '2014-05-26 23:46:05', 6, 3),
(91, '2014-04-09', '2014-04-10', 1, '200000103', 'debe', 20255.40, 20255.40, 4, 16740.00, 0.00, 3515.40, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-26 23:55:38', '2014-05-27 00:20:26', 6, 2),
(93, '2014-05-06', '2014-05-06', 1, '200000104', 'debe', 19602.00, 19602.00, 4, 16200.00, 0.00, 3402.00, 0.00, 0.00, 0.00, 'pendiente', NULL, '2014-05-27 00:26:42', '2014-05-27 00:31:15', 6, 2);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venta_movimiento_cuerpo_venta_movimientos1_idx` (`ventasmovimientos_id`),
  KEY `fk_venta_movimiento_cuerpo_articulos1_idx` (`articulos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=114 ;

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
(77, 61, 2, 1, 'Servicio de Seguridad', 15004.00, 12400.00, 0.00, 2604.00, 21.00, 0.00, 0.00, 0.00, 15004.00, '2014-03-22 03:17:11', '2014-03-22 03:17:11'),
(78, 62, 3, 24, 'Servicio de Vigilancia', 45.00, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-05-24 17:47:18', '2014-05-24 17:47:18'),
(79, 64, 3, 24, 'Servicio de Vigilancia', 45.00, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-05-24 18:27:03', '2014-05-24 18:27:03'),
(80, 65, 3, 20, 'Servicio de Vigilancia', 45.00, 900.00, 0.00, 189.00, 21.00, 0.00, 0.00, 0.00, 1089.00, '2014-05-24 18:29:11', '2014-05-24 18:29:11'),
(81, 66, 3, 24, 'Servicio de Vigilancia', 45.00, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-05-24 18:31:33', '2014-05-24 18:31:33'),
(82, 67, 3, 20, 'Servicio de Vigilancia', 45.00, 900.00, 0.00, 189.00, 21.00, 0.00, 0.00, 0.00, 1089.00, '2014-05-24 18:33:43', '2014-05-24 18:33:43'),
(83, 68, 3, 33, 'Servicio de Vigilancia', 45.00, 1485.00, 0.00, 311.85, 21.00, 0.00, 0.00, 0.00, 1796.85, '2014-05-27 01:21:00', '2014-05-27 01:21:00'),
(84, 69, 3, 24, 'Servicio de Vigilancia', 45.00, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-05-27 01:22:23', '2014-05-27 01:22:23'),
(85, 70, 3, 24, 'Servicio de Vigilancia', 45.00, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-05-27 01:24:06', '2014-05-27 01:24:06'),
(86, 71, 3, 20, 'Servicio de Vigilancia', 45.00, 900.00, 0.00, 189.00, 21.00, 0.00, 0.00, 0.00, 1089.00, '2014-05-27 01:25:40', '2014-05-27 01:25:40'),
(88, 72, 2, 1, 'Servicio de Seguridad', 54360.90, 54360.90, 0.00, 11415.79, 21.00, 0.00, 0.00, 0.00, 65776.69, '2014-05-27 01:39:26', '2014-05-27 01:39:26'),
(89, 73, 3, 24, 'Servicio de Vigilancia', 45.00, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-05-27 01:41:04', '2014-05-27 01:41:04'),
(90, 74, 3, 24, 'Servicio de Vigilancia', 45.00, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-05-27 01:42:18', '2014-05-27 01:42:18'),
(91, 75, 3, 24, 'Servicio de Vigilancia', 45.00, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-05-27 01:43:34', '2014-05-27 01:43:34'),
(92, 76, 3, 13, 'Servicio de Vigilancia', 45.00, 585.00, 0.00, 122.85, 21.00, 0.00, 0.00, 0.00, 707.85, '2014-05-27 01:44:45', '2014-05-27 01:44:45'),
(93, 77, 3, 24, 'Servicio de Vigilancia', 45.00, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-05-27 01:46:05', '2014-05-27 01:46:05'),
(94, 78, 3, 20, 'Servicio de Vigilancia', 45.00, 900.00, 0.00, 189.00, 21.00, 0.00, 0.00, 0.00, 1089.00, '2014-05-27 01:48:20', '2014-05-27 01:48:20'),
(95, 79, 3, 24, 'Servicio de Vigilancia', 45.00, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-05-27 01:49:24', '2014-05-27 01:49:24'),
(96, 80, 3, 24, 'Servicio de Vigilancia', 45.00, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-05-27 01:50:30', '2014-05-27 01:50:30'),
(97, 81, 3, 24, 'Servicio de Vigilancia', 45.00, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-05-27 01:51:37', '2014-05-27 01:51:37'),
(98, 82, 3, 25, 'Servicio de Vigilancia', 45.00, 1125.00, 0.00, 236.25, 21.00, 0.00, 0.00, 0.00, 1361.25, '2014-05-27 01:52:56', '2014-05-27 01:52:56'),
(99, 83, 3, 24, 'Servicio de Vigilancia', 45.00, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-05-27 01:54:42', '2014-05-27 01:54:42'),
(100, 84, 3, 20, 'Servicio de Vigilancia', 45.00, 900.00, 0.00, 189.00, 21.00, 0.00, 0.00, 0.00, 1089.00, '2014-05-27 01:55:59', '2014-05-27 01:55:59'),
(103, 85, 2, 1, 'Servicio de Seguridad', 79996.91, 79996.91, 0.00, 16799.35, 21.00, 0.00, 0.00, 0.00, 96796.26, '2014-05-27 02:08:44', '2014-05-27 02:08:44'),
(105, 86, 2, 1, 'Servicio de Seguridad', 233787.53, 233787.53, 0.00, 49095.38, 21.00, 0.00, 0.00, 0.00, 282882.91, '2014-05-27 02:12:22', '2014-05-27 02:12:22'),
(106, 87, 3, 24, 'Servicio de Vigilancia', 45.00, 1080.00, 0.00, 226.80, 21.00, 0.00, 0.00, 0.00, 1306.80, '2014-05-27 02:16:11', '2014-05-27 02:16:11'),
(107, 88, 3, 20, 'Servicio de Vigilancia', 45.00, 900.00, 0.00, 189.00, 21.00, 0.00, 0.00, 0.00, 1089.00, '2014-05-27 02:17:18', '2014-05-27 02:17:18'),
(108, 89, 2, 1, 'Servicio de Seguridad', 54360.90, 54360.90, 0.00, 11415.79, 21.00, 0.00, 0.00, 0.00, 65776.69, '2014-05-27 02:19:44', '2014-05-27 02:19:44'),
(112, 91, 3, 372, 'Servicio de Vigilancia', 45.00, 16740.00, 0.00, 3515.40, 21.00, 0.00, 0.00, 0.00, 20255.40, '2014-05-27 04:20:06', '2014-05-27 04:20:06'),
(113, 93, 3, 360, 'Servicio de Vigilancia', 45.00, 16200.00, 0.00, 3402.00, 21.00, 0.00, 0.00, 0.00, 19602.00, '2014-05-27 04:30:52', '2014-05-27 04:30:52');

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
  ADD CONSTRAINT `fk_centrocostoscategoriasporcentrocostos_centrocostoscategori1` FOREIGN KEY (`centrocostoscategorias_id`) REFERENCES `centrocostoscategorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_centrocostoscategoriasporcentrocostos_centrocostos1` FOREIGN KEY (`centrocostos_id`) REFERENCES `centrocostos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_venta_movimientos_tipos_documentos0` FOREIGN KEY (`tiposdocumentos_id`) REFERENCES `tiposdocumentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_movimientos_users10` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comprasmovimientos_proveedors1` FOREIGN KEY (`proveedors_id`) REFERENCES `proveedors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  ADD CONSTRAINT `fk_venta_movimiento_cuerpo_venta_movimientos1` FOREIGN KEY (`ventasmovimientos_id`) REFERENCES `ventasmovimientos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_movimiento_cuerpo_articulos1` FOREIGN KEY (`articulos_id`) REFERENCES `articulos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
