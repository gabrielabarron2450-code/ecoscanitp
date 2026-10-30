-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 29-10-2026 a las 02:29:39
-- Versión del servidor: 8.0.36
-- Versión de PHP: 8.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecoscanitp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accionreciclaje`
--

CREATE TABLE `accionreciclaje` (
  `ID_accion` int NOT NULL,
  `ID_usuario` int DEFAULT NULL,
  `ID_contenedor` int DEFAULT NULL,
  `ID_material` int DEFAULT NULL,
  `Cantidad` decimal(10,2) DEFAULT NULL,
  `Fecha_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `Puntos_generados` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `accionreciclaje`
--

INSERT INTO `accionreciclaje` (`ID_accion`, `ID_usuario`, `ID_contenedor`, `ID_material`, `Cantidad`, `Fecha_hora`, `Puntos_generados`) VALUES
(1, 2, 1, 1, 0.10, '2026-04-08 15:45:14', 1),
(2, 2, 3, 1, 1.00, '2026-04-08 19:21:41', 10),
(3, 3, 12, 4, 0.50, '2026-04-08 23:42:59', 500),
(4, 6, 12, 10, 1.00, '2026-04-10 18:25:35', 10),
(5, 6, 3, 1, 1.00, '2026-04-10 18:28:12', 10),
(6, 2, 12, 11, 1.00, '2026-04-19 20:25:33', 10),
(7, 2, 12, 10, 1.00, '2026-04-26 14:24:03', 10),
(8, 7, 1, 4, 0.50, '2026-04-26 23:02:32', 5000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `ID_administrador` int NOT NULL,
  `Nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Apellido` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Correo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Contrasena` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Rol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `Ultimo_acceso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_usuario`
--

CREATE TABLE `admin_usuario` (
  `ID_admin` int NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Correo` varchar(150) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `Activo` tinyint(1) NOT NULL DEFAULT '1',
  `Creado_en` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `admin_usuario`
--

INSERT INTO `admin_usuario` (`ID_admin`, `Nombre`, `Correo`, `Contrasena`, `Activo`, `Creado_en`) VALUES
(1, 'Administrador', 'admin@reciclando.com', '$2y$10$Ml6Q29DwMk42g0vr53qq1u5GxUJ0gHyBcqPhKJ7Jw0XY77echzLQ2', 1, '2026-04-08 23:40:42'),
(2, 'Admin', 'admin@gmail.com', 'admin', 1, '2026-05-10 23:54:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_materiales`
--

CREATE TABLE `cat_materiales` (
  `ID_material` int NOT NULL,
  `Nombre_material` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_materiales`
--

INSERT INTO `cat_materiales` (`ID_material`, `Nombre_material`, `Descripcion`) VALUES
(1, 'PET', 'Botellas de plástico transparente'),
(2, 'PEAD', 'Plástico rígido (envases de detergente)'),
(3, 'Cartón', 'Cajas y empaques de cartón corrugado'),
(4, 'Papel', 'Hojas de oficina, periódicos y revistas'),
(5, 'Vidrio', 'Botellas y frascos de vidrio'),
(6, 'Aluminio', 'Latas de refresco y conservas'),
(7, 'Electrónicos', 'Cables, periféricos y componentes'),
(8, 'Pilas', 'Baterías alcalinas y recargables'),
(9, 'Metal', 'Chatarra ferrosa y otros metales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunicado`
--

CREATE TABLE `comunicado` (
  `ID_comunicado` int NOT NULL,
  `ID_creador` int DEFAULT NULL,
  `Titulo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Contenido` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Tipo_comunicado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_publicacion` datetime DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_app`
--

CREATE TABLE `configuracion_app` (
  `clave` varchar(60) NOT NULL,
  `valor` text NOT NULL,
  `descripcion` varchar(200) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `configuracion_app`
--

INSERT INTO `configuracion_app` (`clave`, `valor`, `descripcion`) VALUES
('lat_universidad', '20.000', 'Latitud del centro del mapa (campus)'),
('lng_universidad', '-18.000', 'Longitud del centro del mapa (campus)'),
('mantenimiento', '0', 'Modo mantenimiento: 1=activo 0=normal'),
('mensaje_mantenimiento', 'La app esta en mantenimiento. Vuelve pronto.', 'Mensaje mostrado a usuarios en mantenimiento'),
('min_peso_kg', '0.1', 'Peso minimo permitido por escaneo (kg)'),
('puntos_multiplicador', '1.0', 'Multiplicador global de puntos por kg reciclado'),
('version_minima', '1.0.0', 'Version minima de app permitida (informativo)'),
('zoom_mapa', '16.5', 'Zoom inicial del mapa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenedor`
--

CREATE TABLE `contenedor` (
  `ID_contenedor` int NOT NULL,
  `ID_ubicacion` int DEFAULT NULL,
  `Estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Codigo` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contenedor`
--

INSERT INTO `contenedor` (`ID_contenedor`, `ID_ubicacion`, `Estado`, `Fecha_registro`, `Codigo`) VALUES
(1, 2, 'Disponible', '2026-04-07 23:21:17', 'EDFA'),
(2, 3, 'Disponible', '2026-04-07 23:21:17', 'EDFK'),
(3, 4, 'Disponible', '2026-04-07 23:21:17', 'EDFL'),
(4, 5, 'Disponible', '2026-04-07 23:21:17', 'EDFM'),
(5, 6, 'Disponible', '2026-04-07 23:21:17', 'EDFZ'),
(6, 7, 'Disponible', '2026-04-07 23:21:17', 'EDFS'),
(7, 8, 'Disponible', '2026-04-07 23:21:17', 'EDFB'),
(8, 9, 'Disponible', '2026-04-07 23:21:17', 'EDFE'),
(9, 10, 'Disponible', '2026-04-07 23:21:17', 'CAFE'),
(10, 11, 'Disponible', '2026-04-07 23:21:17', 'COMT'),
(11, 12, 'Disponible', '2026-04-07 23:21:17', 'GIMN'),
(12, 14, 'Disponible', '2026-04-08 18:15:51', 'ENPR'),
(13, 15, 'Disponible', '2026-04-08 18:15:51', 'EDFW'),
(14, 16, 'Disponible', '2026-04-08 18:15:51', 'EDFV'),
(15, 17, 'Disponible', '2026-04-08 18:15:51', 'EDFX'),
(16, 18, 'Disponible', '2026-04-08 18:15:51', 'EDFO'),
(17, 19, 'Disponible', '2026-04-08 18:15:51', 'EDFI'),
(18, 20, 'Disponible', '2026-04-08 18:15:51', 'SVCO'),
(19, 21, 'Disponible', '2026-04-08 18:15:51', 'PAPL'),
(20, 22, 'Disponible', '2026-04-08 18:15:51', 'HVOO'),
(21, 23, 'Disponible', '2026-04-08 18:15:51', 'POSG'),
(22, 24, 'Disponible', '2026-04-08 18:15:51', 'IDIO'),
(23, 25, 'Disponible', '2026-05-13 16:08:21', 'PPPP'),
(24, 26, 'Disponible', '2026-05-13 16:32:49', 'XMXM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenedor_materiales`
--

CREATE TABLE `contenedor_materiales` (
  `ID_contenedor` int NOT NULL,
  `ID_material` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contenedor_materiales`
--

INSERT INTO `contenedor_materiales` (`ID_contenedor`, `ID_material`) VALUES
(6, 1),
(9, 1),
(18, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(7, 3),
(16, 3),
(19, 3),
(21, 3),
(1, 4),
(2, 4),
(4, 4),
(6, 4),
(8, 4),
(12, 4),
(15, 4),
(22, 4),
(5, 5),
(9, 5),
(11, 5),
(14, 5),
(17, 5),
(19, 5),
(20, 5),
(1, 6),
(4, 6),
(8, 6),
(12, 6),
(2, 7),
(5, 7),
(12, 7),
(22, 7),
(24, 7),
(3, 8),
(13, 8),
(17, 8),
(10, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventocalendario`
--

CREATE TABLE `eventocalendario` (
  `ID_evento` int NOT NULL,
  `ID_creador` int DEFAULT NULL,
  `Titulo_evento` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Fecha_inicio` datetime DEFAULT NULL,
  `Fecha_fin` datetime DEFAULT NULL,
  `Tipo_evento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Estado_evento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ubicacion_evento` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialcanje`
--

CREATE TABLE `historialcanje` (
  `ID_canje` int NOT NULL,
  `ID_usuario` int DEFAULT NULL,
  `ID_recompensa` int DEFAULT NULL,
  `Fecha_canje` datetime DEFAULT CURRENT_TIMESTAMP,
  `Estado_canje` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historialcanje`
--

INSERT INTO `historialcanje` (`ID_canje`, `ID_usuario`, `ID_recompensa`, `Fecha_canje`, `Estado_canje`) VALUES
(1, 7, 2, '2026-04-27 13:46:58', 'Completado'),
(2, 2, 6, '2026-05-13 16:12:39', 'Completado'),
(3, 2, 7, '2026-05-13 16:34:09', 'Completado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialsincronizacion`
--

CREATE TABLE `historialsincronizacion` (
  `ID_sincronizacion` int NOT NULL,
  `ID_usuario` int DEFAULT NULL,
  `Tipo_dato` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Datos_serializados` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Estado_sincronizacion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Intentos` int DEFAULT '0',
  `Fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `Fecha_sincronizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `ID_material` int NOT NULL,
  `Nombre_material` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Tipo_material` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Unidad_medida` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Valor_puntos` int DEFAULT NULL,
  `Estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `material`
--

INSERT INTO `material` (`ID_material`, `Nombre_material`, `Descripcion`, `Tipo_material`, `Unidad_medida`, `Valor_puntos`, `Estado`, `Fecha_registro`) VALUES
(1, 'Orgánico', 'Material generado desde la app Reciclando-ITP', 'Orgánico', '0', 1, 'Activo', '2026-04-08 15:45:14'),
(2, 'Papel', 'Papel y documentos reciclables', 'Papel', 'kg', 5, 'Activo', '2026-04-08 18:15:51'),
(3, 'Carton', 'Cajas y empaques de carton', 'Papel', 'kg', 5, 'Activo', '2026-04-08 18:15:51'),
(4, 'PET', 'Botellas y envases PET', 'Pl??stico', 'kg', 8, 'Activo', '2026-04-08 18:15:51'),
(5, 'Pl??stico', 'Pl??sticos en general', 'Pl??stico', 'kg', 8, 'Activo', '2026-04-08 18:15:51'),
(6, 'Vidrio', 'Botellas y frascos de vidrio', 'Vidrio', 'kg', 6, 'Activo', '2026-04-08 18:15:51'),
(7, 'Aluminio', 'Latas y envases de aluminio', 'Metal', 'kg', 10, 'Activo', '2026-04-08 18:15:51'),
(8, 'Metal', 'Metales diversos', 'Metal', 'kg', 10, 'Activo', '2026-04-08 18:15:51'),
(9, 'Electr??nicos', 'Residuos electr??nicos (e-waste)', 'E-waste', 'kg', 15, 'Activo', '2026-04-08 18:15:51'),
(10, 'Cartón', 'Material generado desde la app Reciclando-ITP', 'Cartón', '0', 10, 'Activo', '2026-04-10 18:25:35'),
(11, 'Plástico', 'Material generado desde la app Reciclando-ITP', 'Plástico', '0', 10, 'Activo', '2026-04-19 20:25:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `ID_notificacion` int NOT NULL,
  `ID_usuario` int DEFAULT NULL,
  `Titulo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Mensaje` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Tipo_notificacion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_envio` datetime DEFAULT NULL,
  `Fecha_lectura` datetime DEFAULT NULL,
  `Prioridad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Canal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset`
--

CREATE TABLE `password_reset` (
  `id` int NOT NULL,
  `correo` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expira_en` datetime NOT NULL,
  `usado` tinyint(1) DEFAULT '0',
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_reset`
--

INSERT INTO `password_reset` (`id`, `correo`, `codigo`, `expira_en`, `usado`, `creado_en`) VALUES
(1, '24200800@pachuca.tecnm.mx', '651923', '2026-04-09 05:09:52', 0, '2026-04-09 04:54:52'),
(3, 'jcarlosgabraham@gmail.com', '282466', '2026-04-11 00:41:42', 1, '2026-04-11 00:26:42'),
(7, 'l24200772@pachuca.tecnm.mx', '292095', '2026-04-29 19:19:24', 1, '2026-04-29 19:04:24'),
(8, 'granadosabrahamj@gmail.com', '325598', '2026-05-06 20:10:32', 1, '2026-05-06 19:55:32'),
(11, 'ca9203435@gmail.com', '900322', '2026-10-28 17:03:05', 0, '2026-10-28 16:48:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos`
--

CREATE TABLE `puntos` (
  `ID_puntos` int NOT NULL,
  `ID_usuario` int DEFAULT NULL,
  `Cantidad_puntos` int DEFAULT NULL,
  `Motivo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_asignacion` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quejasugerencia`
--

CREATE TABLE `quejasugerencia` (
  `ID_queja` int NOT NULL,
  `ID_usuario` int DEFAULT NULL,
  `Tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Asunto` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Respuesta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `Fecha_respuesta` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recompensa`
--

CREATE TABLE `recompensa` (
  `ID_recompensa` int NOT NULL,
  `Nombre_recompensa` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ID_socio` int DEFAULT NULL,
  `Costo_puntos` int DEFAULT NULL,
  `Estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recompensa`
--

INSERT INTO `recompensa` (`ID_recompensa`, `Nombre_recompensa`, `Descripcion`, `ID_socio`, `Costo_puntos`, `Estado`, `Fecha_creacion`) VALUES
(1, 'Cafeteria ITP: Cafe Gratis', 'Valido en cualquier cafeteria del campus.', 1, 500, 'Activo', '2026-04-08 17:47:58'),
(2, 'Impresiones (10 hojas)', 'Aplica para blanco y negro en biblioteca.', 2, 200, 'Activo', '2026-04-08 17:47:58'),
(3, 'Kit de Semillas', 'Incluye maceta biodegradable y semillas.', 3, 800, 'Activo', '2026-04-08 17:47:58'),
(4, 'Playera Reciclando-ITP', 'Edicion especial para embajadores.', 4, 1500, 'Activo', '2026-04-08 17:47:58'),
(5, 'Tiempo extra en sala de computo', '1 hora adicional en sala de computo del campus.', 5, 300, 'Activo', '2026-04-08 17:47:58'),
(6, 'Prueba', 'Prueba', 3, 10, 'Activo', '2026-05-13 16:10:43'),
(7, 'puntos extras', 'sn', 2, 5, 'Activo', '2026-05-13 16:33:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `ID_ruta` int NOT NULL,
  `Nombre_ruta` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Tipo_ruta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Distancia_aproximada` decimal(10,2) DEFAULT NULL,
  `Tiempo_estimado` int DEFAULT NULL,
  `Estado_ruta` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta_ubicacion`
--

CREATE TABLE `ruta_ubicacion` (
  `ID_ruta_ubicacion` int NOT NULL,
  `ID_ruta` int DEFAULT NULL,
  `ID_ubicacion` int DEFAULT NULL,
  `Orden` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio_comercial`
--

CREATE TABLE `socio_comercial` (
  `ID_socio` int NOT NULL,
  `Nombre_establecimiento` varchar(150) NOT NULL,
  `Nombre_responsable` varchar(150) NOT NULL,
  `Categoria` varchar(80) NOT NULL DEFAULT 'General',
  `Descripcion_negocio` text,
  `Productos_servicios` varchar(255) DEFAULT NULL,
  `Logo_icono` varchar(50) DEFAULT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Correo` varchar(150) NOT NULL,
  `Horario_apertura` time NOT NULL,
  `Horario_cierre` time NOT NULL,
  `Comentarios` text,
  `Estado` varchar(50) NOT NULL DEFAULT 'Activo',
  `Fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `socio_comercial`
--

INSERT INTO `socio_comercial` (`ID_socio`, `Nombre_establecimiento`, `Nombre_responsable`, `Categoria`, `Descripcion_negocio`, `Productos_servicios`, `Logo_icono`, `Direccion`, `Telefono`, `Correo`, `Horario_apertura`, `Horario_cierre`, `Comentarios`, `Estado`, `Fecha_registro`) VALUES
(1, 'Cafeteria ITP', 'Responsable Cafeteria', 'Alimentos y bebidas', 'Servicio de cafeteria del campus TecNM Pachuca. Ofrecemos desayunos, almuerzos y bebidas a precios accesibles para estudiantes y personal.', 'Desayunos, comidas corridas, cafe, jugos, snacks', 'local_cafe', 'Edificio de Servicios, Campus TecNM Pachuca', '7711234567', 'cafeteria@pachuca.tecnm.mx', '07:30:00', '18:00:00', 'Valido de lunes a viernes en temporada escolar', 'Activo', '2026-04-08 18:30:35'),
(2, 'Biblioteca TecNM', 'Responsable Biblioteca', 'Servicios academicos', 'Biblioteca central del TecNM Campus Pachuca. Acceso a libros, revistas, bases de datos y servicios de impresion para la comunidad estudiantil.', 'Prestamo de libros, impresiones, acceso a internet, sala de lectura', 'menu_book', 'Edificio B, Campus TecNM Pachuca', '7711234568', 'biblioteca@pachuca.tecnm.mx', '08:00:00', '20:00:00', 'Impresiones en blanco y negro unicamente', 'Activo', '2026-04-08 18:30:35'),
(3, 'Vivero Campus', 'Coordinador Vivero', 'Naturaleza y sustentabilidad', 'Vivero del campus dedicado a la produccion de plantas y educacion ambiental. Promovemos la conciencia ecologica entre la comunidad estudiantil.', 'Plantas de ornato, semillas, macetas, talleres de jardineria', 'local_florist', 'Area Verde, Campus TecNM Pachuca', '7711234569', 'vivero@pachuca.tecnm.mx', '09:00:00', '17:00:00', 'Incluye maceta biodegradable y semillas de temporada', 'Activo', '2026-04-08 18:30:35'),
(4, 'Departamento Difusion', 'Jefe de Difusion', 'Cultura y difusion', 'Departamento de Difusion Cultural del TecNM Pachuca. Organizamos eventos, talleres y promovemos la identidad institucional a traves del merchandising.', 'Playeras, articulosd de papeleria institucional, eventos culturales', 'campaign', 'Edificio A Piso 1, Campus TecNM Pachuca', '7711234570', 'difusion@pachuca.tecnm.mx', '09:00:00', '17:00:00', 'Edicion limitada para embajadores ambientales', 'Activo', '2026-04-08 18:30:35'),
(5, 'Centro de Computo', 'Jefe de Centro Computo', 'Tecnologia y computo', 'Centro de Computo del TecNM Pachuca con equipos de alto rendimiento. Brindamos acceso a internet, software especializado y soporte tecnico a estudiantes.', 'Uso de computadoras, internet, impresiones, escaneo, soporte tecnico', 'computer', 'Edificio COMT, Campus TecNM Pachuca', '7711234571', 'computo@pachuca.tecnm.mx', '07:00:00', '21:00:00', 'Una hora adicional en cualquier sala disponible', 'Activo', '2026-04-08 18:30:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutorial`
--

CREATE TABLE `tutorial` (
  `ID_tutorial` int NOT NULL,
  `ID_creador` int DEFAULT NULL,
  `Titulo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `URL_contenido` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tipo_tutorial` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nivel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_publicacion` datetime DEFAULT NULL,
  `Fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `ID_ubicacion` int NOT NULL,
  `Nombre_ubicacion` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Latitud` decimal(10,7) DEFAULT NULL,
  `Longitud` decimal(10,7) DEFAULT NULL,
  `Tipo_ubicacion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  `Fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`ID_ubicacion`, `Nombre_ubicacion`, `Descripcion`, `Latitud`, `Longitud`, `Tipo_ubicacion`, `Activo`, `Fecha_registro`) VALUES
(1, 'Instituto Tecnologico de Pachuca ', 'Ubicacion del campus ', 20.0831810, -98.7736720, 'Universidad', 1, '2026-04-07 22:15:17'),
(2, 'Edificio A', 'Area administrativa', 20.0833980, -98.7738600, 'Contenedor', 1, '2026-04-07 22:19:43'),
(3, 'Edificio K', 'Contenedor de reciclaje en el área del Edificio K', 20.0832620, -98.7743260, 'Contenedor', 1, '2026-04-07 22:19:43'),
(4, 'Edificio L', 'Contenedor de reciclaje en el área del Edificio L', 20.0828690, -98.7744310, 'Contenedor', 1, '2026-04-07 22:19:43'),
(5, 'Edificio M', 'Contenedor de reciclaje en el área del Edificio M', 20.0824180, -98.7745390, 'Contenedor', 1, '2026-04-07 22:19:43'),
(6, 'Edificio Z', 'Contenedor de reciclaje en el área del Edificio Z', 20.0838450, -98.7742220, 'Contenedor', 1, '2026-04-07 22:19:43'),
(7, 'Edificio S', 'Contenedor de reciclaje en el área del Edificio S', 20.0853170, -98.7741820, 'Contenedor', 1, '2026-04-07 22:19:43'),
(8, 'Edificio B', 'Contenedor de reciclaje en el área del Edificio B', 20.0850970, -98.7746790, 'Contenedor', 1, '2026-04-07 22:19:43'),
(9, 'Edificio E', 'Contenedor de reciclaje en el área del Edificio E', 20.0819100, -98.7747100, 'Contenedor', 1, '2026-04-07 22:19:43'),
(10, 'Cafetería', 'Cafeteria del campus', 20.0832420, -98.7751670, 'Contenedor', 1, '2026-04-07 22:19:43'),
(11, 'Centro de Cómputo', 'Centro de computo', 20.0841780, -98.7757780, 'Contenedor', 1, '2026-04-07 22:19:43'),
(12, 'Gimnasio Miguel Hidalgo', 'Contenedor de reciclaje en el Gimnasio Miguel Alemán', 20.0837920, -98.7765690, 'Contenedor', 1, '2026-04-07 22:19:43'),
(13, 'Prueba_casa', 'Para pruebas, mi casa', 20.2489225, -99.0923613, 'Pruebas', 1, '2026-04-08 15:10:27'),
(14, 'Entrada Principal', 'Acceso principal del campus', 20.0831810, -98.7736720, 'Exterior', 1, '2026-04-08 18:15:51'),
(15, 'Edificio W', 'Investigaci??n y extensi??n', 20.0822350, -98.7754990, 'Interior', 1, '2026-04-08 18:15:51'),
(16, 'Edificio V', 'Vinculaci??n empresarial', 20.0824570, -98.7753840, 'Interior', 1, '2026-04-08 18:15:51'),
(17, 'Edificio X', 'Extensi??n acad??mica', 20.0823620, -98.7758490, 'Interior', 1, '2026-04-08 18:15:51'),
(18, 'Edificio O', 'Oficinas administrativas', 20.0826190, -98.7760000, 'Interior', 1, '2026-04-08 18:15:51'),
(19, 'Edificio I', 'Infraestructura y mantenimiento', 20.0829180, -98.7758470, 'Interior', 1, '2026-04-08 18:15:51'),
(20, 'Servicios Escolares', 'Centro de servicios escolares', 20.0831340, -98.7739180, 'Interior', 1, '2026-04-08 18:15:51'),
(21, 'Papeler??a Don N', 'Tienda campus', 20.0824340, -98.7740180, 'Exterior', 1, '2026-04-08 18:15:51'),
(22, 'Huevo', 'Tienda de alimentos', 20.0834510, -98.7751120, 'Exterior', 1, '2026-04-08 18:15:51'),
(23, 'Posgrado', '??rea posgrados', 20.0840880, -98.7751680, 'Interior', 1, '2026-04-08 18:15:51'),
(24, 'Salon de Idiomas', 'Centro de lenguas', 20.0842980, -98.7741380, 'Exterior', 1, '2026-04-08 18:15:51'),
(25, 'Prueba', 'Prueba', -10.1200000, -10.1100000, 'Interior', 1, '2026-05-13 16:08:21'),
(26, 'Edificio Y', 'los y', -10.0000000, -11.0000000, 'Exterior', 1, '2026-05-13 16:32:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_usuario` int NOT NULL,
  `Nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Apellido` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Correo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Contrasena` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tipo_usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Matricula` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Carrera` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nombre_visible` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Foto_perfil` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verificado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_usuario`, `Nombre`, `Apellido`, `Correo`, `Contrasena`, `Tipo_usuario`, `Estado`, `Fecha_registro`, `Matricula`, `Carrera`, `Nombre_visible`, `Foto_perfil`, `email_verificado`) VALUES
(1, 'Jose Carlos', 'Granados Abraham', '24200800@pachuca.tecnm.mx', 'admin', 'administrador', 'Activo', '2026-03-24 23:02:06', '24200800', 'Ing. Sistemas Computacionales', 'Carlos G Abraham', 'user_1_1775700097.jpg', 0),
(2, 'Admin', 'Dos', 'AdminDos@pachuca.tecnm.mx', 'admin', 'estudiante', 'Activo', '2026-03-25 14:31:44', '24200800', 'Ing. Sistemas Computacionales', 'AdminDosP', 'user_2_1775700060.jpg', 0),
(3, 'José Carlos', 'Granados Abraham', 'ca9203435@gmail.com', '$2y$10$4V.kPsjmMvkc4XnsVNF5DerydFVTBUZ6kRbkTTI0ztsNLtcorTzpS', 'estudiante', 'Activo', '2026-04-08 22:57:05', '24200800', 'Ingeniería en Sistemas Computacionales', 'CarlosGA', NULL, 1),
(4, 'Rafael', 'Granados Abraham', 'rjuego34@gmail.com', '$2y$10$AgqR7aLlwJpml3eIvr4.P.Re/oJmvzQBmqI2UEhJ31DruUMZiO6AS', 'estudiante', 'Activo', '2026-04-09 23:35:34', '20000000', 'Ingeniería Mecatrónica', 'RafaelGA15', NULL, 1),
(5, 'José Carlos', 'Abraham', 'ca343355@gmail.com', '$2y$10$VSj8b4xAp7/vrUNFqOlIdueVbbn2rijM0rkv.fQTgctAgSjURe45q', 'estudiante', 'Activo', '2026-04-10 18:05:32', '24200800', 'Ingeniería en Sistemas Computacionales', 'Carlos2', NULL, 1),
(6, 'José', 'Carlos', 'jcarlosgabraham@gmail.com', '$2y$10$s7tRRyWMt6JIy4V9YaBLhONVVDfW8OSYWmG.RMmCS9Os0iDMxyBde', 'estudiante', 'Activo', '2026-04-10 18:23:57', '2343500', 'Ingeniería en Sistemas Computacionales', 'jcarlos', NULL, 1),
(7, 'Yareli', 'Gaspar', 'yareligasparmoctezuma@gmail.com', '$2y$10$RUfVDSRQA9bGRySgRGX4/ukdKIMthaRiV0aJzUFfDCOeI4cv4swFm', 'estudiante', 'Activo', '2026-04-26 22:38:13', '25200207', 'Ingeniería en Sistemas Computacionales', 'yare', 'user_7_1777336737.jpg', 0),
(8, 'Carlos', 'Abeaham', 'ca80081j@gmail.com', '$2y$10$.cW/6s5qv5lVIx3LDeLfCOKXqldQk4Pe18jQF2fB7ZA4tOMtDO0hG', 'estudiante', 'Activo', '2026-04-26 23:19:09', '122321', 'Ingeniería Mecatrónica', 'jjj', NULL, 0),
(9, 'carlos', 'aaa', 'ca8181j@gmail.com', '$2y$10$wh0mjNb48DneoHz2IB5gmuqfCTivzYpO8MCNXyGDfg5hZN3Il3Po6', 'estudiante', 'Activo', '2026-04-26 23:59:21', '121313', 'Ingeniería Mecatrónica', 'jjj', NULL, 1),
(10, 'Alfonso', 'Sánchez', 'l24200795@pachuca.tecnm.mx', '$2y$10$w97IqKhsPcOJh80W4IuzS.3Ocyytlkun8te1lxQs.oi8V/vlSx1tS', 'estudiante', 'Activo', '2026-04-27 15:10:25', '24200200795', 'Ingeniería en Sistemas Computacionales', 'fabisanch123', NULL, 1),
(11, 'Daniel', 'Zamora Navarrete', 'l24200863@pachuca.tecnm.mx', '$2y$10$x1505agfZLBYIgvXIQyaReg7Jz9kEyyO.xGpiOtDUDDmGpFnGlTOm', 'estudiante', 'Activo', '2026-04-27 15:12:21', '24200863', 'Ingeniería en Sistemas Computacionales', 'papuniel', NULL, 1),
(12, 'Kevin', 'Leonardo', 'l24200772@pachuca.tecnm.mx', '1234', 'administrador', 'Activo', '2026-04-27 15:15:49', '24200772', 'Ingeniería en Sistemas Computacionales', 'Kevin', NULL, 1),
(13, 'Ivan', 'Zeron', 'csegoviaceron@gmail.com', '$2y$10$MC8w24nV/AdIV9YApDT0AeQ5QDzi65hEQA1.RwZIwserJ9uh6/89m', 'estudiante', 'Activo', '2026-04-27 17:44:18', '617eyq8qyq', 'Ingeniería en Sistemas Computacionales', 'ivan', NULL, 1),
(14, 'Jose', 'Carlos', 'granadosabrahamj@gmail.com', '$2y$10$YIGyPmmldOuGGEglcxYxFeZ3pNEiOiQwWOMe9zq2EuUV6fyqJE0UC', 'estudiante', 'Activo', '2026-05-06 13:49:07', '121341', 'Ingeniería en Sistemas Computacionales', 'carlos1', NULL, 1),
(15, 'Carlos', 'Carlos', 'holasoyyo13241@gmail.com', '$2y$10$7NmRZlJ8yZjvptRV2SE.WOByr.zK4NGZ3BF4RhyHgEykkSq70a9C2', 'estudiante', 'Activo', '2026-05-22 18:24:15', '111111', 'Ingeniería Mecatrónica', 'jose', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_comunicado`
--

CREATE TABLE `usuario_comunicado` (
  `ID_usuario_comunicado` int NOT NULL,
  `ID_usuario` int DEFAULT NULL,
  `ID_comunicado` int DEFAULT NULL,
  `Fecha_lectura` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_evento`
--

CREATE TABLE `usuario_evento` (
  `ID_usuario_evento` int NOT NULL,
  `ID_usuario` int DEFAULT NULL,
  `ID_evento` int DEFAULT NULL,
  `Estado_participacion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_tutorial`
--

CREATE TABLE `usuario_tutorial` (
  `ID_usuario_tutorial` int NOT NULL,
  `ID_usuario` int DEFAULT NULL,
  `ID_tutorial` int DEFAULT NULL,
  `Fecha_visualizacion` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `verificacion_email`
--

CREATE TABLE `verificacion_email` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `codigo` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expira_en` datetime NOT NULL,
  `usado` tinyint(1) DEFAULT '0',
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `verificacion_email`
--

INSERT INTO `verificacion_email` (`id`, `user_id`, `codigo`, `expira_en`, `usado`, `creado_en`) VALUES
(1, 1, '339835', '2026-04-09 04:12:20', 0, '2026-04-09 03:57:20'),
(2, 3, '672885', '2026-04-09 05:12:05', 1, '2026-04-09 04:57:05'),
(3, 4, '254784', '2026-04-10 05:50:34', 1, '2026-04-10 05:35:34'),
(4, 5, '891764', '2026-04-11 00:20:33', 1, '2026-04-11 00:05:33'),
(5, 6, '175240', '2026-04-11 00:38:57', 1, '2026-04-11 00:23:57'),
(6, 9, '736967', '2026-04-27 06:14:22', 1, '2026-04-27 05:59:22'),
(7, 10, '240461', '2026-04-27 21:25:26', 1, '2026-04-27 21:10:26'),
(8, 11, '141249', '2026-04-27 21:27:22', 1, '2026-04-27 21:12:22'),
(9, 12, '623333', '2026-04-27 21:30:49', 1, '2026-04-27 21:15:49'),
(10, 13, '408013', '2026-04-27 23:59:19', 1, '2026-04-27 23:44:19'),
(11, 14, '300533', '2026-05-06 20:04:07', 1, '2026-05-06 19:49:07'),
(12, 15, '424692', '2026-05-23 00:39:16', 1, '2026-05-23 00:24:16');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accionreciclaje`
--
ALTER TABLE `accionreciclaje`
  ADD PRIMARY KEY (`ID_accion`),
  ADD KEY `ID_usuario` (`ID_usuario`),
  ADD KEY `ID_contenedor` (`ID_contenedor`),
  ADD KEY `ID_material` (`ID_material`);

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`ID_administrador`);

--
-- Indices de la tabla `admin_usuario`
--
ALTER TABLE `admin_usuario`
  ADD PRIMARY KEY (`ID_admin`),
  ADD UNIQUE KEY `Correo` (`Correo`);

--
-- Indices de la tabla `cat_materiales`
--
ALTER TABLE `cat_materiales`
  ADD PRIMARY KEY (`ID_material`);

--
-- Indices de la tabla `comunicado`
--
ALTER TABLE `comunicado`
  ADD PRIMARY KEY (`ID_comunicado`),
  ADD KEY `ID_creador` (`ID_creador`);

--
-- Indices de la tabla `configuracion_app`
--
ALTER TABLE `configuracion_app`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `contenedor`
--
ALTER TABLE `contenedor`
  ADD PRIMARY KEY (`ID_contenedor`),
  ADD KEY `ID_ubicacion` (`ID_ubicacion`);

--
-- Indices de la tabla `contenedor_materiales`
--
ALTER TABLE `contenedor_materiales`
  ADD PRIMARY KEY (`ID_contenedor`,`ID_material`),
  ADD KEY `ID_material` (`ID_material`);

--
-- Indices de la tabla `eventocalendario`
--
ALTER TABLE `eventocalendario`
  ADD PRIMARY KEY (`ID_evento`);

--
-- Indices de la tabla `historialcanje`
--
ALTER TABLE `historialcanje`
  ADD PRIMARY KEY (`ID_canje`),
  ADD KEY `ID_usuario` (`ID_usuario`),
  ADD KEY `ID_recompensa` (`ID_recompensa`);

--
-- Indices de la tabla `historialsincronizacion`
--
ALTER TABLE `historialsincronizacion`
  ADD PRIMARY KEY (`ID_sincronizacion`),
  ADD KEY `ID_usuario` (`ID_usuario`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`ID_material`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`ID_notificacion`),
  ADD KEY `ID_usuario` (`ID_usuario`);

--
-- Indices de la tabla `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `puntos`
--
ALTER TABLE `puntos`
  ADD PRIMARY KEY (`ID_puntos`),
  ADD KEY `ID_usuario` (`ID_usuario`);

--
-- Indices de la tabla `quejasugerencia`
--
ALTER TABLE `quejasugerencia`
  ADD PRIMARY KEY (`ID_queja`),
  ADD KEY `ID_usuario` (`ID_usuario`);

--
-- Indices de la tabla `recompensa`
--
ALTER TABLE `recompensa`
  ADD PRIMARY KEY (`ID_recompensa`),
  ADD KEY `fk_recompensa_socio` (`ID_socio`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`ID_ruta`);

--
-- Indices de la tabla `ruta_ubicacion`
--
ALTER TABLE `ruta_ubicacion`
  ADD PRIMARY KEY (`ID_ruta_ubicacion`),
  ADD KEY `ID_ruta` (`ID_ruta`),
  ADD KEY `ID_ubicacion` (`ID_ubicacion`);

--
-- Indices de la tabla `socio_comercial`
--
ALTER TABLE `socio_comercial`
  ADD PRIMARY KEY (`ID_socio`);

--
-- Indices de la tabla `tutorial`
--
ALTER TABLE `tutorial`
  ADD PRIMARY KEY (`ID_tutorial`),
  ADD KEY `ID_creador` (`ID_creador`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`ID_ubicacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_usuario`),
  ADD UNIQUE KEY `Correo` (`Correo`);

--
-- Indices de la tabla `usuario_comunicado`
--
ALTER TABLE `usuario_comunicado`
  ADD PRIMARY KEY (`ID_usuario_comunicado`),
  ADD KEY `ID_usuario` (`ID_usuario`),
  ADD KEY `ID_comunicado` (`ID_comunicado`);

--
-- Indices de la tabla `usuario_evento`
--
ALTER TABLE `usuario_evento`
  ADD PRIMARY KEY (`ID_usuario_evento`),
  ADD KEY `ID_usuario` (`ID_usuario`),
  ADD KEY `ID_evento` (`ID_evento`);

--
-- Indices de la tabla `usuario_tutorial`
--
ALTER TABLE `usuario_tutorial`
  ADD PRIMARY KEY (`ID_usuario_tutorial`),
  ADD KEY `ID_usuario` (`ID_usuario`),
  ADD KEY `ID_tutorial` (`ID_tutorial`);

--
-- Indices de la tabla `verificacion_email`
--
ALTER TABLE `verificacion_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accionreciclaje`
--
ALTER TABLE `accionreciclaje`
  MODIFY `ID_accion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `ID_administrador` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `admin_usuario`
--
ALTER TABLE `admin_usuario`
  MODIFY `ID_admin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cat_materiales`
--
ALTER TABLE `cat_materiales`
  MODIFY `ID_material` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `comunicado`
--
ALTER TABLE `comunicado`
  MODIFY `ID_comunicado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contenedor`
--
ALTER TABLE `contenedor`
  MODIFY `ID_contenedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `eventocalendario`
--
ALTER TABLE `eventocalendario`
  MODIFY `ID_evento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historialcanje`
--
ALTER TABLE `historialcanje`
  MODIFY `ID_canje` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `historialsincronizacion`
--
ALTER TABLE `historialsincronizacion`
  MODIFY `ID_sincronizacion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `ID_material` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `ID_notificacion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `puntos`
--
ALTER TABLE `puntos`
  MODIFY `ID_puntos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `quejasugerencia`
--
ALTER TABLE `quejasugerencia`
  MODIFY `ID_queja` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recompensa`
--
ALTER TABLE `recompensa`
  MODIFY `ID_recompensa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ruta`
--
ALTER TABLE `ruta`
  MODIFY `ID_ruta` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ruta_ubicacion`
--
ALTER TABLE `ruta_ubicacion`
  MODIFY `ID_ruta_ubicacion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `socio_comercial`
--
ALTER TABLE `socio_comercial`
  MODIFY `ID_socio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tutorial`
--
ALTER TABLE `tutorial`
  MODIFY `ID_tutorial` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `ID_ubicacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuario_comunicado`
--
ALTER TABLE `usuario_comunicado`
  MODIFY `ID_usuario_comunicado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_evento`
--
ALTER TABLE `usuario_evento`
  MODIFY `ID_usuario_evento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_tutorial`
--
ALTER TABLE `usuario_tutorial`
  MODIFY `ID_usuario_tutorial` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `verificacion_email`
--
ALTER TABLE `verificacion_email`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accionreciclaje`
--
ALTER TABLE `accionreciclaje`
  ADD CONSTRAINT `accionreciclaje_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`),
  ADD CONSTRAINT `accionreciclaje_ibfk_2` FOREIGN KEY (`ID_contenedor`) REFERENCES `contenedor` (`ID_contenedor`),
  ADD CONSTRAINT `accionreciclaje_ibfk_3` FOREIGN KEY (`ID_material`) REFERENCES `material` (`ID_material`);

--
-- Filtros para la tabla `comunicado`
--
ALTER TABLE `comunicado`
  ADD CONSTRAINT `comunicado_ibfk_1` FOREIGN KEY (`ID_creador`) REFERENCES `administrador` (`ID_administrador`);

--
-- Filtros para la tabla `contenedor`
--
ALTER TABLE `contenedor`
  ADD CONSTRAINT `contenedor_ibfk_1` FOREIGN KEY (`ID_ubicacion`) REFERENCES `ubicacion` (`ID_ubicacion`);

--
-- Filtros para la tabla `contenedor_materiales`
--
ALTER TABLE `contenedor_materiales`
  ADD CONSTRAINT `contenedor_materiales_ibfk_1` FOREIGN KEY (`ID_contenedor`) REFERENCES `contenedor` (`ID_contenedor`),
  ADD CONSTRAINT `contenedor_materiales_ibfk_2` FOREIGN KEY (`ID_material`) REFERENCES `cat_materiales` (`ID_material`);

--
-- Filtros para la tabla `historialcanje`
--
ALTER TABLE `historialcanje`
  ADD CONSTRAINT `historialcanje_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`),
  ADD CONSTRAINT `historialcanje_ibfk_2` FOREIGN KEY (`ID_recompensa`) REFERENCES `recompensa` (`ID_recompensa`);

--
-- Filtros para la tabla `historialsincronizacion`
--
ALTER TABLE `historialsincronizacion`
  ADD CONSTRAINT `historialsincronizacion_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`);

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`);

--
-- Filtros para la tabla `puntos`
--
ALTER TABLE `puntos`
  ADD CONSTRAINT `puntos_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`);

--
-- Filtros para la tabla `quejasugerencia`
--
ALTER TABLE `quejasugerencia`
  ADD CONSTRAINT `quejasugerencia_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`);

--
-- Filtros para la tabla `recompensa`
--
ALTER TABLE `recompensa`
  ADD CONSTRAINT `fk_recompensa_socio` FOREIGN KEY (`ID_socio`) REFERENCES `socio_comercial` (`ID_socio`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `ruta_ubicacion`
--
ALTER TABLE `ruta_ubicacion`
  ADD CONSTRAINT `ruta_ubicacion_ibfk_1` FOREIGN KEY (`ID_ruta`) REFERENCES `ruta` (`ID_ruta`),
  ADD CONSTRAINT `ruta_ubicacion_ibfk_2` FOREIGN KEY (`ID_ubicacion`) REFERENCES `ubicacion` (`ID_ubicacion`);

--
-- Filtros para la tabla `tutorial`
--
ALTER TABLE `tutorial`
  ADD CONSTRAINT `tutorial_ibfk_1` FOREIGN KEY (`ID_creador`) REFERENCES `administrador` (`ID_administrador`);

--
-- Filtros para la tabla `usuario_comunicado`
--
ALTER TABLE `usuario_comunicado`
  ADD CONSTRAINT `usuario_comunicado_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`),
  ADD CONSTRAINT `usuario_comunicado_ibfk_2` FOREIGN KEY (`ID_comunicado`) REFERENCES `comunicado` (`ID_comunicado`);

--
-- Filtros para la tabla `usuario_evento`
--
ALTER TABLE `usuario_evento`
  ADD CONSTRAINT `usuario_evento_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`),
  ADD CONSTRAINT `usuario_evento_ibfk_2` FOREIGN KEY (`ID_evento`) REFERENCES `eventocalendario` (`ID_evento`);

--
-- Filtros para la tabla `usuario_tutorial`
--
ALTER TABLE `usuario_tutorial`
  ADD CONSTRAINT `usuario_tutorial_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`),
  ADD CONSTRAINT `usuario_tutorial_ibfk_2` FOREIGN KEY (`ID_tutorial`) REFERENCES `tutorial` (`ID_tutorial`);

--
-- Filtros para la tabla `verificacion_email`
--
ALTER TABLE `verificacion_email`
  ADD CONSTRAINT `verificacion_email_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`ID_usuario`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
