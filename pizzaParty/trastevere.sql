-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-04-2022 a las 12:56:42
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trastevere`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` tinyint(4) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'categoria1'),
(2, 'categoria2'),
(3, 'categoria3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` tinyint(4) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `dirección` varchar(30) DEFAULT NULL,
  `CP` varchar(12) DEFAULT NULL,
  `telf` varchar(12) DEFAULT NULL,
  `localidad_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellido`, `dirección`, `CP`, `telf`, `localidad_id`) VALUES
(1, 'leo', 'messi', NULL, NULL, NULL, 1),
(2, 'cris', 'ronaldo', NULL, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cocinero`
--

CREATE TABLE `cocinero` (
  `id` tinyint(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) DEFAULT NULL,
  `nif` varchar(10) NOT NULL,
  `tlfn` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cocinero`
--

INSERT INTO `cocinero` (`id`, `nombre`, `apellido1`, `apellido2`, `nif`, `tlfn`) VALUES
(1, 'andres', 'perez', NULL, '111', 'aaa'),
(2, 'alfonso', 'mandibulin', NULL, '222', 'bbb');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id` tinyint(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `provincia_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id`, `nombre`, `provincia_id`) VALUES
(1, 'Barcelona', 1),
(2, 'Badalona', 1),
(3, 'Hospitalet De Llobregat', 1),
(4, 'Figueres', 2),
(5, 'Reus', 4),
(6, 'Seo Urgell', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` tinyint(4) NOT NULL,
  `fecha_venta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tipo_pedido` enum('domicilio','tienda') NOT NULL,
  `repartidor_id` tinyint(4) DEFAULT NULL,
  `resto_id` tinyint(4) NOT NULL,
  `clientes_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `fecha_venta`, `tipo_pedido`, `repartidor_id`, `resto_id`, `clientes_id`) VALUES
(1, '2022-04-16 10:35:31', 'domicilio', 2, 1, 2),
(2, '2022-04-16 10:39:20', 'domicilio', 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` tinyint(4) NOT NULL,
  `tipo_producto` enum('pizza','hamburguesa','bebida','') NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `imagen_url` varchar(30) DEFAULT NULL,
  `precio` float NOT NULL,
  `categoria_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `tipo_producto`, `nombre`, `descripcion`, `imagen_url`, `precio`, `categoria_id`) VALUES
(1, 'bebida', 'Coca-cola', NULL, NULL, 2.5, NULL),
(2, 'bebida', 'Fanta', NULL, NULL, 2.5, NULL),
(3, 'hamburguesa', 'Crunchy', NULL, NULL, 8.9, NULL),
(4, 'hamburguesa', 'Raclette', NULL, NULL, 9.4, NULL),
(5, 'pizza', 'Clasica', NULL, NULL, 9.5, 1),
(6, 'pizza', 'vegetariana', NULL, NULL, 10.4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosTotal`
--

CREATE TABLE `productosTotal` (
  `id_producto` tinyint(4) NOT NULL,
  `id_pedido` tinyint(4) NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productosTotal`
--

INSERT INTO `productosTotal` (`id_producto`, `id_pedido`, `precio`, `cantidad`) VALUES
(1, 1, 2.4, 2),
(2, 2, 2.5, 1),
(4, 2, 10.4, 1),
(5, 1, 9.4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id` tinyint(4) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id`, `nombre`) VALUES
(1, 'Barcelona'),
(2, 'Girona'),
(3, 'Lleida'),
(4, 'Tarragona');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartidor`
--

CREATE TABLE `repartidor` (
  `id` tinyint(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) NOT NULL,
  `nif` varchar(10) NOT NULL,
  `telf` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `repartidor`
--

INSERT INTO `repartidor` (`id`, `nombre`, `apellido1`, `apellido2`, `nif`, `telf`) VALUES
(1, 'juanca', 'cruz', 'lecina', '111', '111'),
(2, 'Jose', 'ruiz', 'castell', '222', '222');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resto`
--

CREATE TABLE `resto` (
  `id` tinyint(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `dirección` varchar(30) DEFAULT NULL,
  `CP` varchar(10) DEFAULT NULL,
  `cocinero_id` tinyint(4) NOT NULL,
  `localidad_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `resto`
--

INSERT INTO `resto` (`id`, `nombre`, `dirección`, `CP`, `cocinero_id`, `localidad_id`) VALUES
(1, 'picola1', NULL, NULL, 2, 1),
(2, 'picola2', NULL, NULL, 1, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidos_id` (`localidad_id`);

--
-- Indices de la tabla `cocinero`
--
ALTER TABLE `cocinero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provincia_id` (`provincia_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `repartidor_id` (`repartidor_id`),
  ADD KEY `resto_id` (`resto_id`,`clientes_id`),
  ADD KEY `clientes_id_3` (`clientes_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `productosTotal`
--
ALTER TABLE `productosTotal`
  ADD UNIQUE KEY `id_producto` (`id_producto`,`id_pedido`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `resto`
--
ALTER TABLE `resto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`cocinero_id`),
  ADD KEY `localidad_id` (`localidad_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cocinero`
--
ALTER TABLE `cocinero`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `resto`
--
ALTER TABLE `resto`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`) ON DELETE NO ACTION;

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `localidad_ibfk_1` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`) ON DELETE NO ACTION;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_4` FOREIGN KEY (`repartidor_id`) REFERENCES `repartidor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pedidos_ibfk_5` FOREIGN KEY (`resto_id`) REFERENCES `resto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productosTotal`
--
ALTER TABLE `productosTotal`
  ADD CONSTRAINT `productosTotal_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `productosTotal_ibfk_3` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `resto`
--
ALTER TABLE `resto`
  ADD CONSTRAINT `resto_ibfk_4` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `resto_ibfk_7` FOREIGN KEY (`cocinero_id`) REFERENCES `cocinero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
