-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2026 a las 05:53:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mutua_inventory_`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos`
--

CREATE TABLE `activos` (
  `id_act` int(10) UNSIGNED NOT NULL,
  `id_cat` smallint(5) UNSIGNED NOT NULL,
  `id_ubi` smallint(5) UNSIGNED NOT NULL,
  `id_usu` int(10) UNSIGNED NOT NULL,
  `id_marca` smallint(5) UNSIGNED NOT NULL,
  `id_estado` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `codigo` varchar(50) NOT NULL,
  `nom_act` varchar(150) NOT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `serie` varchar(100) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `foto_url` varchar(300) DEFAULT NULL,
  `valor` decimal(12,2) UNSIGNED DEFAULT NULL,
  `valor_estimado` decimal(12,2) UNSIGNED DEFAULT NULL,
  `forma_adquisicion` varchar(100) DEFAULT NULL,
  `descripcion_act` text DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `id_usu_registro` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_cat` smallint(5) UNSIGNED NOT NULL,
  `nom_categoria` varchar(80) NOT NULL,
  `descripcion_cat` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_cat`, `nom_categoria`, `descripcion_cat`) VALUES
(1, 'Tecnologia', 'Equipos tecnologicos: computadores, impresoras, proyectores, etc.'),
(2, 'Electrodomestico', 'Aparatos electricos de uso domestico: neveras, microondas, lavadoras, etc.'),
(3, 'Mobiliario', 'Muebles y elementos de oficina: escritorios, sillas, archivadores, etc.'),
(4, 'Red', 'Equipos de red y comunicaciones: routers, switches, telefonos, etc.'),
(5, 'Sonido', 'Equipos de audio y sonido.'),
(6, 'Otro', 'Activos que no encajan en las categorias anteriores.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id_estado` tinyint(3) UNSIGNED NOT NULL,
  `nom_estado` varchar(50) NOT NULL,
  `descripcion_est` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id_estado`, `nom_estado`, `descripcion_est`) VALUES
(1, 'Activo', 'El activo esta en uso y en condiciones operativas.'),
(2, 'Inactivo', 'El activo no esta en uso actualmente pero sigue perteneciendo a la fundacion.'),
(3, 'Dado de baja', 'El activo fue retirado del inventario por dano, donacion o entrega a familias.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento`
--

CREATE TABLE `mantenimiento` (
  `id_mante` int(10) UNSIGNED NOT NULL,
  `id_act` int(10) UNSIGNED NOT NULL,
  `id_usu` int(10) UNSIGNED NOT NULL,
  `id_tipo_mante` tinyint(3) UNSIGNED NOT NULL,
  `fecha_mantenimiento` date NOT NULL,
  `descripcion_trabajo` text NOT NULL,
  `responsable_tecnico` varchar(150) DEFAULT NULL,
  `numero_contrato` varchar(80) DEFAULT NULL,
  `costo` decimal(12,2) UNSIGNED DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` smallint(5) UNSIGNED NOT NULL,
  `nom_marca` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `nom_marca`) VALUES
(8, 'Canon'),
(3, 'Dell'),
(7, 'Epson'),
(9, 'Frigidaire'),
(2, 'HP'),
(10, 'KitchenAid'),
(4, 'Lenovo'),
(6, 'LG'),
(11, 'Otro'),
(5, 'Samsung'),
(1, 'Sin marca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` tinyint(3) UNSIGNED NOT NULL,
  `nom_rol` varchar(50) NOT NULL,
  `descripcion_rol` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nom_rol`, `descripcion_rol`) VALUES
(1, 'Administrador', 'Acceso total: puede crear, editar, eliminar y consultar toda la informacion del sistema.'),
(2, 'Visualizador', 'Solo lectura: puede consultar activos e informacion del sistema sin modificar datos.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_mantenimiento`
--

CREATE TABLE `tipo_mantenimiento` (
  `id_tipo_mante` tinyint(3) UNSIGNED NOT NULL,
  `nom_mant` varchar(80) NOT NULL,
  `descripcion_mant` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_mantenimiento`
--

INSERT INTO `tipo_mantenimiento` (`id_tipo_mante`, `nom_mant`, `descripcion_mant`) VALUES
(1, 'Preventivo', 'Mantenimiento programado con anticipacion para evitar fallas.'),
(2, 'Correctivo', 'Mantenimiento realizado despues de que el activo presento una falla.'),
(3, 'Limpieza periodica', 'Limpieza general del activo segun cronograma.'),
(4, 'Revision tecnica', 'Revision especializada por tecnico o proveedor externo.'),
(5, 'Calibracion', 'Ajuste y calibracion para activos que lo requieran.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id_ubi` smallint(5) UNSIGNED NOT NULL,
  `nom_lugar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id_ubi`, `nom_lugar`) VALUES
(1, 'Administracion'),
(3, 'Biblioteca'),
(6, 'Bodega'),
(2, 'Cocina MANQA'),
(7, 'Otro'),
(4, 'Sala de sistemas'),
(5, 'Salon comunal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usu` int(10) UNSIGNED NOT NULL,
  `id_rol` tinyint(3) UNSIGNED NOT NULL,
  `nombre_completo` varchar(150) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usu`, `id_rol`, `nombre_completo`, `correo`, `contrasena`, `activo`, `fecha_registro`) VALUES
(1, 1, 'Administrador Mutua', 'admin@fundacionmutua.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '2026-05-09 21:19:39');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activos`
--
ALTER TABLE `activos`
  ADD PRIMARY KEY (`id_act`),
  ADD UNIQUE KEY `uq_activo_codigo` (`codigo`),
  ADD KEY `fk_activo_cat` (`id_cat`),
  ADD KEY `fk_activo_ubi` (`id_ubi`),
  ADD KEY `fk_activo_usu` (`id_usu`),
  ADD KEY `fk_activo_marca` (`id_marca`),
  ADD KEY `fk_activo_usu_reg` (`id_usu_registro`),
  ADD KEY `fk_activo_estado` (`id_estado`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_cat`),
  ADD UNIQUE KEY `uq_cat_nombre` (`nom_categoria`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estado`),
  ADD UNIQUE KEY `uq_estado_nombre` (`nom_estado`);

--
-- Indices de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`id_mante`),
  ADD KEY `fk_mante_usu` (`id_usu`),
  ADD KEY `fk_mante_tipo` (`id_tipo_mante`),
  ADD KEY `idx_mante_act` (`id_act`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`),
  ADD UNIQUE KEY `uq_marca_nombre` (`nom_marca`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `uq_rol_nombre` (`nom_rol`);

--
-- Indices de la tabla `tipo_mantenimiento`
--
ALTER TABLE `tipo_mantenimiento`
  ADD PRIMARY KEY (`id_tipo_mante`),
  ADD UNIQUE KEY `uq_tipo_mante_nombre` (`nom_mant`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id_ubi`),
  ADD UNIQUE KEY `uq_ubi_nombre` (`nom_lugar`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usu`),
  ADD UNIQUE KEY `uq_usuario_correo` (`correo`),
  ADD KEY `fk_usuario_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activos`
--
ALTER TABLE `activos`
  MODIFY `id_act` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_cat` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estado` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  MODIFY `id_mante` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_mantenimiento`
--
ALTER TABLE `tipo_mantenimiento`
  MODIFY `id_tipo_mante` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id_ubi` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usu` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activos`
--
ALTER TABLE `activos`
  ADD CONSTRAINT `fk_activo_cat` FOREIGN KEY (`id_cat`) REFERENCES `categoria` (`id_cat`),
  ADD CONSTRAINT `fk_activo_estado` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`),
  ADD CONSTRAINT `fk_activo_marca` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`),
  ADD CONSTRAINT `fk_activo_ubi` FOREIGN KEY (`id_ubi`) REFERENCES `ubicacion` (`id_ubi`),
  ADD CONSTRAINT `fk_activo_usu` FOREIGN KEY (`id_usu`) REFERENCES `usuario` (`id_usu`),
  ADD CONSTRAINT `fk_activo_usu_reg` FOREIGN KEY (`id_usu_registro`) REFERENCES `usuario` (`id_usu`);

--
-- Filtros para la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD CONSTRAINT `fk_mante_act` FOREIGN KEY (`id_act`) REFERENCES `activos` (`id_act`),
  ADD CONSTRAINT `fk_mante_tipo` FOREIGN KEY (`id_tipo_mante`) REFERENCES `tipo_mantenimiento` (`id_tipo_mante`),
  ADD CONSTRAINT `fk_mante_usu` FOREIGN KEY (`id_usu`) REFERENCES `usuario` (`id_usu`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
