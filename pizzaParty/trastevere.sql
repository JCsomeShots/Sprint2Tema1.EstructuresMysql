-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 01-03-2022 a las 09:40:32
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
-- Estructura de tabla para la tabla `bebidas`
--

CREATE TABLE `bebidas` (
  `id` tinyint(4) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripción` varchar(100) DEFAULT NULL,
  `imagen` varbinary(125) DEFAULT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bebidas`
--

INSERT INTO `bebidas` (`id`, `nombre`, `descripción`, `imagen`, `precio`) VALUES
(3, 'Coca-cola', NULL, NULL, 2.5),
(4, 'fanta', NULL, NULL, 2.5),
(5, 'Agua 1/2', NULL, NULL, 3),
(6, 'Vichy', NULL, NULL, 3),
(7, 'Estrella', NULL, NULL, 4.5),
(8, 'Sin Alcohol', NULL, NULL, 4.2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bebidas_pedidos`
--

CREATE TABLE `bebidas_pedidos` (
  `bebidas_id` tinyint(4) NOT NULL,
  `producto_id` tinyint(4) NOT NULL,
  `cantidad` int(30) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'jose', 'perez', NULL, 'aaa', 'aaa'),
(2, 'manuel', 'rosales', NULL, 'bbb', 'bbb');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` tinyint(4) NOT NULL,
  `cocinero_id` tinyint(4) NOT NULL,
  `repartidor_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `cocinero_id`, `repartidor_id`) VALUES
(2, 1, 1),
(1, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hamburguesas`
--

CREATE TABLE `hamburguesas` (
  `id` tinyint(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripción` varchar(100) DEFAULT NULL,
  `imagen` varbinary(125) DEFAULT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `hamburguesas`
--

INSERT INTO `hamburguesas` (`id`, `nombre`, `descripción`, `imagen`, `precio`) VALUES
(1, 'Crunchy', NULL, NULL, 8.9),
(2, 'Raclette', NULL, NULL, 9.4),
(3, 'Foie', NULL, NULL, 11.9),
(4, 'Jack Bacon', NULL, NULL, 11.2),
(5, 'piri piri', NULL, NULL, 8.2),
(6, 'pulled pork', NULL, NULL, 10.9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hamburguesa_pedido`
--

CREATE TABLE `hamburguesa_pedido` (
  `hamburguesa_id` tinyint(4) NOT NULL,
  `producto_id` tinyint(4) NOT NULL,
  `cantidad` int(30) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `productos_id` tinyint(4) NOT NULL,
  `resto_id` tinyint(4) NOT NULL,
  `clientes_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pizzas`
--

CREATE TABLE `pizzas` (
  `id` tinyint(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `imagen_url` varchar(30) DEFAULT NULL,
  `precio` float NOT NULL,
  `categoria_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pizzas`
--

INSERT INTO `pizzas` (`id`, `nombre`, `description`, `imagen_url`, `precio`, `categoria_id`) VALUES
(4, 'clásica', NULL, NULL, 9.5, 1),
(5, 'vegetariana', NULL, NULL, 10.4, 2),
(6, 'barça', NULL, NULL, 7.03, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pizza_pedido`
--

CREATE TABLE `pizza_pedido` (
  `pizza_id` tinyint(4) NOT NULL,
  `productos_id` tinyint(4) NOT NULL,
  `cantidad` int(30) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` tinyint(4) NOT NULL,
  `pizza_pedido_id` tinyint(4) NOT NULL,
  `hamburguesa_pedido__id` tinyint(4) NOT NULL,
  `bebidas_pedidos_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `empleado_id` tinyint(4) NOT NULL,
  `localidad_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `resto`
--

INSERT INTO `resto` (`id`, `nombre`, `dirección`, `CP`, `empleado_id`, `localidad_id`) VALUES
(1, 'resto1', NULL, NULL, 1, 1),
(2, 'resto2', NULL, NULL, 2, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bebidas`
--
ALTER TABLE `bebidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bebidas_pedidos`
--
ALTER TABLE `bebidas_pedidos`
  ADD KEY `id_bebidas` (`bebidas_id`,`producto_id`),
  ADD KEY `bebidas_id` (`bebidas_id`,`producto_id`),
  ADD KEY `producto_id` (`producto_id`);

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
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cocinero_id` (`cocinero_id`,`repartidor_id`),
  ADD KEY `repartidor_id` (`repartidor_id`);

--
-- Indices de la tabla `hamburguesas`
--
ALTER TABLE `hamburguesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hamburguesa_pedido`
--
ALTER TABLE `hamburguesa_pedido`
  ADD KEY `id_hamburguesa` (`hamburguesa_id`,`producto_id`),
  ADD KEY `hamburguesa_id` (`hamburguesa_id`,`producto_id`),
  ADD KEY `producto_id` (`producto_id`);

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
  ADD KEY `clientes_id` (`productos_id`),
  ADD KEY `clientes_id_2` (`productos_id`),
  ADD KEY `repartidor_id` (`repartidor_id`),
  ADD KEY `resto_id` (`resto_id`,`clientes_id`),
  ADD KEY `clientes_id_3` (`clientes_id`);

--
-- Indices de la tabla `pizzas`
--
ALTER TABLE `pizzas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categoria_id` (`categoria_id`),
  ADD KEY `categoria_id_2` (`categoria_id`),
  ADD KEY `categoria_id_3` (`categoria_id`);

--
-- Indices de la tabla `pizza_pedido`
--
ALTER TABLE `pizza_pedido`
  ADD KEY `id_pizza` (`pizza_id`,`productos_id`),
  ADD KEY `productos_id` (`productos_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hamburguesa_id` (`hamburguesa_pedido__id`,`bebidas_pedidos_id`),
  ADD KEY `pizza_id` (`pizza_pedido_id`),
  ADD KEY `bebidas_id` (`bebidas_pedidos_id`);

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
  ADD KEY `pedido_id` (`empleado_id`),
  ADD KEY `localidad_id` (`localidad_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bebidas`
--
ALTER TABLE `bebidas`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `hamburguesas`
--
ALTER TABLE `hamburguesas`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pizzas`
--
ALTER TABLE `pizzas`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

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
-- Filtros para la tabla `bebidas_pedidos`
--
ALTER TABLE `bebidas_pedidos`
  ADD CONSTRAINT `bebidas_pedidos_ibfk_1` FOREIGN KEY (`bebidas_id`) REFERENCES `bebidas` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `bebidas_pedidos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`bebidas_pedidos_id`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`) ON DELETE NO ACTION;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`cocinero_id`) REFERENCES `cocinero` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`repartidor_id`) REFERENCES `repartidor` (`id`) ON DELETE NO ACTION;

--
-- Filtros para la tabla `hamburguesa_pedido`
--
ALTER TABLE `hamburguesa_pedido`
  ADD CONSTRAINT `hamburguesa_pedido_ibfk_1` FOREIGN KEY (`hamburguesa_id`) REFERENCES `hamburguesas` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `hamburguesa_pedido_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`hamburguesa_pedido__id`) ON DELETE NO ACTION;

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `localidad_ibfk_1` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`) ON DELETE NO ACTION;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`repartidor_id`) REFERENCES `repartidor` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_4` FOREIGN KEY (`resto_id`) REFERENCES `resto` (`id`) ON DELETE NO ACTION;

--
-- Filtros para la tabla `pizzas`
--
ALTER TABLE `pizzas`
  ADD CONSTRAINT `pizzas_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION;

--
-- Filtros para la tabla `pizza_pedido`
--
ALTER TABLE `pizza_pedido`
  ADD CONSTRAINT `pizza_pedido_ibfk_1` FOREIGN KEY (`pizza_id`) REFERENCES `pizzas` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`pizza_pedido_id`) REFERENCES `pizza_pedido` (`productos_id`) ON DELETE NO ACTION;

--
-- Filtros para la tabla `resto`
--
ALTER TABLE `resto`
  ADD CONSTRAINT `resto_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `resto_ibfk_4` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`) ON DELETE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
