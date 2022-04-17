-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-04-2022 a las 01:02:05
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
-- Base de datos: `CulD_Ampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` tinyint(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `dir_calle` varchar(30) NOT NULL,
  `dir_numero` tinyint(5) NOT NULL,
  `dir_piso` tinyint(5) DEFAULT NULL,
  `dir_puerta` tinyint(5) DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `CP` varchar(10) DEFAULT NULL,
  `pais` varchar(60) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `fecha_registro` date NOT NULL DEFAULT current_timestamp(),
  `id_recomendado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `dir_calle`, `dir_numero`, `dir_piso`, `dir_puerta`, `ciudad`, `CP`, `pais`, `telefono`, `email`, `fecha_registro`, `id_recomendado`) VALUES
(1, 'Rai Roca', 'sol', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-21', NULL),
(2, 'brain gomez', 'sol', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-21', NULL),
(3, 'Juan Casado', 'Sol', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-21', NULL),
(4, 'Eugenia Morales', 'sol ', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-21', NULL),
(5, 'Felipe Pinglo', 'sol ', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-21', NULL),
(6, 'Corina Cruz', 'sol', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-21', NULL),
(7, 'Fatima Cantuarias', 'sol', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-21', NULL),
(8, 'Josean Moss', 'sol', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-21', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gafas`
--

CREATE TABLE `gafas` (
  `id` tinyint(4) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `graduacion_der` float DEFAULT NULL,
  `graduacion_izq` float DEFAULT NULL,
  `colorVidre_der` varchar(11) NOT NULL,
  `colorVidre_izq` varchar(11) NOT NULL,
  `color_montura` varchar(12) NOT NULL,
  `precio` float(5,2) NOT NULL,
  `marca_id` tinyint(4) NOT NULL,
  `montura` enum('Flotante','Pasta','Metálica','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gafas`
--

INSERT INTO `gafas` (`id`, `modelo`, `graduacion_der`, `graduacion_izq`, `colorVidre_der`, `colorVidre_izq`, `color_montura`, `precio`, `marca_id`, `montura`) VALUES
(12, 'Aviator classic', NULL, NULL, 'verde', 'verde', 'dorado', 195.67, 1, 'Flotante'),
(13, 'club master classic', NULL, NULL, 'verde', 'verde', 'negro', 147.00, 1, 'Pasta'),
(14, 'Square II', NULL, NULL, 'azul', 'azul', 'azul', 132.00, 1, 'Metálica'),
(15, 'Novak djokovic', NULL, NULL, 'verde', 'verde', 'carei', 185.00, 2, 'Flotante'),
(16, 'La piquée', NULL, NULL, 'marrón', 'marrón', 'a_print', 155.00, 2, 'Flotante'),
(17, 'Hiperfit', NULL, NULL, 'naranja', 'naranja', 'negro', 115.00, 3, 'Pasta'),
(18, 'carrera 264', 1.3, 0.8, 'blanco', 'blanco', 'gris', 140.00, 3, 'Metálica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` tinyint(4) NOT NULL,
  `provedor_id` tinyint(4) NOT NULL,
  `nombre_marca` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `provedor_id`, `nombre_marca`) VALUES
(1, 3, 'Ray.Ban'),
(2, 1, 'Lacoste'),
(3, 2, 'carrera'),
(4, 3, 'persol'),
(5, 4, 'prada'),
(6, 1, 'Dior'),
(7, 2, 'Arnette');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` tinyint(3) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion_calle` varchar(40) DEFAULT NULL,
  `direccion_numero` tinyint(5) DEFAULT NULL,
  `direccion_piso` varchar(5) DEFAULT NULL,
  `direccion_puerta` tinyint(3) DEFAULT NULL,
  `ciudad` varchar(20) NOT NULL,
  `CP` varchar(10) NOT NULL,
  `pais` varchar(10) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `nif` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `nombre`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `ciudad`, `CP`, `pais`, `telefono`, `fax`, `nif`) VALUES
(1, 'Optica Universitaria', 'avenida Diagonal', 127, '1', 0, 'barcelona ', '08001', 'españa', '934863697', NULL, '12345678a'),
(2, 'Opticalia', 'calle Valencia', 126, 'bajos', 0, 'Barcelona', '08002', 'España', '932318749', NULL, '12345678b'),
(3, 'bigbuy', 'compra on-line', NULL, NULL, NULL, 'barcelona ', '', 'españa', '', NULL, ''),
(4, 'mikita', 'calle Valencia ', 125, 'bajos', NULL, 'barcelona ', '08002', 'españa', '936738877', NULL, '12345678c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `id` tinyint(4) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`id`, `nombre`) VALUES
(1, 'Helena Lecina'),
(2, 'Jose Ruiz'),
(3, 'Mario Delgado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` tinyint(4) NOT NULL,
  `fecha_venta` date NOT NULL,
  `vendedor_id` tinyint(4) NOT NULL,
  `cliente_id` tinyint(4) NOT NULL,
  `gafas_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `fecha_venta`, `vendedor_id`, `cliente_id`, `gafas_id`) VALUES
(1, '2022-02-01', 1, 1, 12),
(2, '2022-01-05', 2, 2, 18),
(3, '2021-12-08', 3, 3, 13),
(4, '2022-02-11', 1, 4, 17),
(5, '2022-01-27', 2, 5, 16),
(6, '2021-08-03', 3, 6, 15),
(7, '2021-09-01', 1, 7, 14),
(8, '2021-10-04', 1, 8, 12);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_recomendado` (`id_recomendado`);

--
-- Indices de la tabla `gafas`
--
ALTER TABLE `gafas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `montura_id` (`marca_id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_marca_2` (`nombre_marca`),
  ADD KEY `provedor_id` (`provedor_id`),
  ADD KEY `nombre_marca` (`nombre_marca`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendedor_id` (`vendedor_id`,`cliente_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `id_gafas` (`gafas_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `gafas`
--
ALTER TABLE `gafas`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_recomendado`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION;

--
-- Filtros para la tabla `gafas`
--
ALTER TABLE `gafas`
  ADD CONSTRAINT `gafas_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`) ON DELETE NO ACTION;

--
-- Filtros para la tabla `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `marca_ibfk_1` FOREIGN KEY (`provedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedor` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`gafas_id`) REFERENCES `gafas` (`id`) ON DELETE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
