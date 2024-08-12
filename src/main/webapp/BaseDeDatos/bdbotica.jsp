-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-08-2024 a las 05:17:12
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdbotica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajuste_comprobantes`
--

CREATE TABLE `ajuste_comprobantes` (
  `ID` int(11) NOT NULL,
  `Fecha_Hora` datetime DEFAULT NULL,
  `motivo` varchar(40) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `ID_tipoComprobante` int(11) NOT NULL,
  `ID_Comprobante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ajuste_comprobantes`
--

INSERT INTO `ajuste_comprobantes` (`ID`, `Fecha_Hora`, `motivo`, `monto`, `ID_tipoComprobante`, `ID_Comprobante`) VALUES
(1, '2024-07-18 09:00:00', 'Descuento por promoción', 10.00, 1, 1),
(2, '2024-07-18 10:30:00', 'Recargo por envío urgente', 5.00, 2, 2),
(3, '2024-07-18 11:45:00', 'Devolución por producto defectuoso', 20.00, 1, 3),
(4, '2024-07-18 13:15:00', 'Ajuste por diferencia de cambio', 15.00, 2, 4),
(5, '2024-07-18 14:30:00', 'Descuento especial cliente frecuente', 8.00, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `ID_categoria` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`ID_categoria`, `Nombre`) VALUES
(1, 'Medicamentos'),
(2, 'Suplementos'),
(3, 'Cuidado general');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID`) VALUES
('01234567'),
('11234567'),
('12345678'),
('20100012345'),
('20100023456'),
('20100034567'),
('20100045678'),
('20100056789'),
('20100067890'),
('20100078901'),
('21234567'),
('23456789'),
('31234567'),
('34567890'),
('41234567'),
('45678901'),
('51234567'),
('56789012'),
('67890123'),
('78901234'),
('89012345'),
('90123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_empresas`
--

CREATE TABLE `cliente_empresas` (
  `RUC` varchar(11) NOT NULL,
  `RazonSocial` varchar(45) NOT NULL,
  `Direccion` varchar(70) NOT NULL,
  `Telefono` varchar(9) NOT NULL,
  `Correo` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente_empresas`
--

INSERT INTO `cliente_empresas` (`RUC`, `RazonSocial`, `Direccion`, `Telefono`, `Correo`) VALUES
('20100012345', 'Comercial ABC S.A.', 'Av. Principal 123', '987654321', 'contacto@comercialabc.com'),
('20100023456', 'Inversiones XYZ S.R.L.', 'Calle Secundaria 456', '987654322', 'info@inversionesxyz.com'),
('20100034567', 'Servicios Integrales E.I.R.L.', 'Jr. Tercero 789', '987654323', 'ventas@serviciosintegrales.com'),
('20100045678', 'Distribuidora Central S.A.C.', 'Av. Cuarta 101', '987654324', 'contacto@distribuidoracentral.com'),
('20100056789', 'Logística & Transporte S.A.', 'Calle Quinta 202', '987654325', 'logistica@logitrans.com'),
('20100067890', 'Tecnología y Soluciones E.I.R.L.', 'Av. Sexta 303', '987654326', 'soporte@tecnologiasoluciones.com'),
('20100078901', 'Construcciones del Norte S.A.C.', 'Jr. Séptimo 404', '987654327', 'proyectos@construnorte.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_personas`
--

CREATE TABLE `cliente_personas` (
  `DNI` varchar(11) NOT NULL,
  `Nombres` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Telefono` varchar(9) DEFAULT NULL,
  `Correo` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente_personas`
--

INSERT INTO `cliente_personas` (`DNI`, `Nombres`, `Apellidos`, `Telefono`, `Correo`) VALUES
('01234567', 'Sofía', 'Díaz', '987654330', 'sofia.diaz@example.com'),
('11234567', 'Miguel', 'Torres', '987654331', 'miguel.torres@example.com'),
('12345678', 'Juan', 'Pérez', '987654321', 'juan.perez@example.com'),
('21234567', 'Valeria', 'Ruiz', '987654332', 'valeria.ruiz@example.com'),
('23456789', 'María', 'González', '987654322', 'maria.gonzalez@example.com'),
('31234567', 'Ricardo', 'Vásquez', '987654333', 'ricardo.vasquez@example.com'),
('34567890', 'Carlos', 'Ramírez', '987654323', 'carlos.ramirez@example.com'),
('41234567', 'Isabel', 'Morales', '987654334', 'isabel.morales@example.com'),
('45678901', 'Ana', 'Fernández', '987654324', 'ana.fernandez@example.com'),
('51234567', 'Fernando', 'Ortiz', '987654335', 'fernando.ortiz@example.com'),
('56789012', 'Luis', 'Martínez', '987654325', 'luis.martinez@example.com'),
('67890123', 'Laura', 'García', '987654326', 'laura.garcia@example.com'),
('78901234', 'José', 'Rodríguez', '987654327', 'jose.rodriguez@example.com'),
('89012345', 'Elena', 'López', '987654328', 'elena.lopez@example.com'),
('90123456', 'Pedro', 'Hernández', '987654329', 'pedro.hernandez@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantes`
--

CREATE TABLE `comprobantes` (
  `ID` int(11) NOT NULL,
  `Fecha_Hora` datetime DEFAULT NULL,
  `ID_pedido` int(11) NOT NULL,
  `ID_cliente` varchar(11) NOT NULL,
  `DNI_empleado` varchar(8) NOT NULL,
  `ID_tipoComprobante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comprobantes`
--

INSERT INTO `comprobantes` (`ID`, `Fecha_Hora`, `ID_pedido`, `ID_cliente`, `DNI_empleado`, `ID_tipoComprobante`) VALUES
(1, '2024-07-18 08:45:00', 1, '12345678', '11111111', 1),
(2, '2024-07-18 09:30:00', 2, '23456789', '12345678', 2),
(3, '2024-07-18 10:15:00', 3, '34567890', '33333333', 1),
(4, '2024-07-18 11:00:00', 4, '45678901', '44444444', 2),
(5, '2024-07-18 11:45:00', 5, '56789012', '7159938', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `ID_DetallePedido` int(11) NOT NULL,
  `ID_Pedido` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `SubTotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`ID_DetallePedido`, `ID_Pedido`, `ID_Producto`, `Cantidad`, `SubTotal`) VALUES
(1, 1, 7, 2, 13.00),
(2, 1, 10, 1, 25.00),
(3, 2, 8, 1, 18.75),
(4, 2, 9, 2, 29.60),
(5, 3, 5, 3, 23.70),
(6, 3, 12, 1, 30.50),
(7, 4, 6, 2, 18.50),
(8, 4, 13, 1, 9.90),
(9, 5, 11, 1, 12.50),
(10, 5, 15, 2, 11.50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `DNI` varchar(8) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(50) DEFAULT NULL,
  `Correo` varchar(250) DEFAULT NULL,
  `Telefono` varchar(9) DEFAULT NULL,
  `Sueldo` decimal(10,2) DEFAULT NULL,
  `ID_farm` int(11) NOT NULL,
  `horarioE` time NOT NULL,
  `horarioS` time DEFAULT NULL,
  `Estado` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`DNI`, `Nombre`, `Apellidos`, `Correo`, `Telefono`, `Sueldo`, `ID_farm`, `horarioE`, `horarioS`, `Estado`) VALUES
('11111111', 'my', 'me', 'mye', '912345678', 1888.00, 1, '07:23:00', '10:23:00', 'I'),
('11111112', 'Ramon', 'Costini', 'rmcostin@gmail.com', '928291111', 1600.00, 1, '08:00:00', '16:00:00', 'A'),
('12345678', 'ya', 'na', 'yai@gmail.com', '987654321', 1630.00, 1, '06:19:00', '22:19:00', 'I'),
('33333333', 'va', 've', 'vae', '912348764', 1700.00, 1, '07:41:00', '00:41:00', 'A'),
('44444444', 'viviana', 'yitreski', 'ra', '984732657', 1234.00, 1, '09:00:00', '23:00:00', 'A'),
('7159938', 'Orlando', 'Salazar', 'steven@gmail.com', '972363452', 1.00, 1, '08:00:00', '20:00:00', 'A'),
('72758660', 'Jakelyne', 'Rafael', 'jakeli@gmail.com', '941766589', 138.00, 1, '08:00:00', '20:00:00', 'A'),
('72758680', 'Eric', 'Rafael', 'eric@gmail.com', '998766589', 138.00, 1, '08:00:00', '20:00:00', 'A'),
('73468973', 'awedrfty', 'qwer', 'sdf@asd', '936826842', 1800.00, 1, '19:34:00', '23:34:00', 'A'),
('75172230', 'hehe', 'hehe', 'ho@gmail', '987651510', 1395.00, 1, '07:07:00', '23:08:00', 'A'),
('75392234', 'Bc', 'bc', 'bc@gmail', '987651527', 1380.00, 1, '07:25:00', '10:25:00', 'A'),
('75392281', 'aby', 'ab', 'ab@gmail', '987651512', 1385.00, 1, '16:35:00', '20:39:00', 'A'),
('75392830', 'mia', 'Mali', 'mia@gmail.com', '937538652', 1600.00, 1, '07:30:00', '23:00:00', 'A'),
('75392842', 'mia', 'Mali', 'mia@gmail.com', '937538652', 1600.00, 1, '07:30:00', '23:00:00', 'A'),
('75392845', 'a', 'b', 'a@gmail', '987651216', 1350.00, 1, '08:22:00', '16:23:00', 'A'),
('75392854', 'Lola', 'Mani', 'lola@gmail.com', '937538652', 1600.00, 1, '08:00:00', '21:00:00', 'A'),
('75392882', 'Fabi', 'Martinez', 'fabi@gmail.com', '937538890', 1800.00, 1, '04:45:00', '04:45:00', 'A'),
('75392884', 'Lola', 'Mani', 'lola@gmail.com', '937538652', 1600.00, 1, '08:00:00', '21:00:00', 'A'),
('75392891', 'mia', 'Mali', 'mia@gmail.com', '937538652', 1600.00, 1, '09:55:00', '20:09:00', 'A'),
('77777777', 'sieteñ', 'ñeño', 'ni@', '964676467', 2469.00, 1, '03:42:00', '09:40:00', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `farmacias`
--

CREATE TABLE `farmacias` (
  `ID` int(11) NOT NULL,
  `ubicacion` varchar(250) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `NTelefono` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `farmacias`
--

INSERT INTO `farmacias` (`ID`, `ubicacion`, `direccion`, `NTelefono`) VALUES
(1, 'Ubicación de ejemplo', 'Dirección de ejemplo', '123456789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `ID_HoraEmp` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Hentrada` time DEFAULT NULL,
  `Hsalida` time DEFAULT NULL,
  `DNI_empleado` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `ID_Pedido` int(11) NOT NULL,
  `Fecha_Hora` datetime DEFAULT NULL,
  `PrecioTotal` decimal(10,2) DEFAULT NULL,
  `IGV` decimal(10,2) DEFAULT NULL,
  `Precio_Final` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`ID_Pedido`, `Fecha_Hora`, `PrecioTotal`, `IGV`, `Precio_Final`) VALUES
(1, '2024-07-18 08:30:00', 150.00, 18.00, 168.00),
(2, '2024-07-18 10:15:00', 250.00, 30.00, 280.00),
(3, '2024-07-18 12:00:00', 180.00, 21.60, 201.60),
(4, '2024-07-18 14:45:00', 320.00, 38.40, 358.40),
(5, '2024-07-18 16:30:00', 200.00, 24.00, 224.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_Prod` int(11) NOT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `ID_categoria` int(11) NOT NULL,
  `RUC_Prov` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_Prod`, `Nombre`, `descripcion`, `FechaVencimiento`, `Precio`, `Stock`, `ID_categoria`, `RUC_Prov`) VALUES
(1, 'Paracetamol', 'Analgesic and antipyretic', '2024-12-31', 10.50, 100, 1, '12345678901'),
(2, 'Ibuprofeno', 'Anti-inflammatory drug', '2023-09-15', 8.75, 80, 1, '23456789012'),
(3, 'Vitamina C', 'Immune system support', '2023-11-30', 15.20, 50, 2, '34567890123'),
(4, 'Proteína en polvo', 'Supplement for muscle growth', '2024-06-28', 45.00, 30, 2, '45678901234'),
(5, 'Crema humectante', 'Moisturizing cream for skin', '2023-10-31', 12.80, 70, 3, '56789012345'),
(6, 'Jabón antibacterial', 'Antibacterial soap', '2023-12-15', 5.50, 120, 3, '67890123456'),
(7, 'Omeprazol', 'Antacid and antiulcer agent', '2024-04-30', 7.90, 90, 1, '78901234567'),
(8, 'Calcio + Vitamina D', 'Bone health supplement', '2023-11-20', 18.50, 60, 2, '89012345678'),
(9, 'Shampoo revitalizante', 'Revitalizing shampoo', '2023-09-10', 9.75, 100, 3, '90123456789'),
(10, 'Antihistamínico', 'Allergy relief medication', '2024-03-15', 14.30, 40, 1, '01234567890'),
(11, 'Ácido fólico', 'Folic acid supplement', '2023-08-25', 6.20, 110, 2, '11234567890'),
(12, 'Gel para el dolor muscular', 'Muscle pain relief gel', '2024-05-12', 22.00, 25, 3, '21234567890'),
(13, 'Pastillas para la tos', 'Cough relief tablets', '2023-10-05', 8.90, 80, 1, '31234567890'),
(14, 'Colágeno en polvo', 'Collagen powder supplement', '2024-01-31', 32.50, 35, 2, '41234567890'),
(15, 'Protector solar SPF 50', 'Sunscreen SPF 50', '2023-12-31', 14.75, 60, 3, '51234567890');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `RUC` varchar(11) NOT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Pais` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Correo` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`RUC`, `Nombre`, `Pais`, `Telefono`, `Correo`) VALUES
('01234567890', 'FarmaSalud', 'Venezuela', '+58 212 1234567', 'servicio@farmasalud.ve'),
('11234567890', 'Vida y Salud', 'Brasil', '+55 11 91234-56', 'contacto@vidaysalud.com.br'),
('12345678901', 'FarmaDistribuciones', 'Perú', '+51 987654321', 'contacto@farmadist.com'),
('21234567890', 'Distribuciones Medicas', 'Perú', '+51 987654322', 'ventas@distribucionesmedicas.pe'),
('23456789012', 'Medicamentos Globales', 'México', '+52 5555555555', 'ventas@medglobal.com'),
('31234567890', 'MediHealth', 'Chile', '+56 2 23456789', 'info@medihealth.cl'),
('34567890123', 'Salud y Vida', 'Colombia', '+57 3100000000', 'info@saludyvida.co'),
('41234567890', 'Salud Integral', 'México', '+52 1 555555555', 'contacto@saludintegral.mx'),
('45678901234', 'Farma Internacional', 'Argentina', '+54 11 4444444', 'comercial@farmaint.com.ar'),
('51234567890', 'Farmacéutica del Norte', 'Argentina', '+54 341 4444445', 'ventas@farmaceuticanorte.com.ar'),
('56789012345', 'PharmaPlus', 'Chile', '+56 9 87654321', 'servicio@pharmaplus.cl'),
('61234567890', 'Medicasa', 'Colombia', '+57 1 3456789', 'servicio@medicasa.co'),
('67890123456', 'Distribuidora Médica', 'Ecuador', '+593 99 1234567', 'distribuidora@medica.ec'),
('78901234567', 'Salud Total', 'Uruguay', '+598 98 765432', 'ventas@saludtotal.uy'),
('89012345678', 'Meditech', 'Bolivia', '+591 70123456', 'info@meditech.bo'),
('90123456789', 'Farmacias Unidas', 'Paraguay', '+595 21 123456', 'contacto@farmaciasunidas.py');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_comprobantes`
--

CREATE TABLE `tipo_comprobantes` (
  `ID` int(11) NOT NULL,
  `tipoComprobante` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_comprobantes`
--

INSERT INTO `tipo_comprobantes` (`ID`, `tipoComprobante`) VALUES
(1, 'boleta'),
(2, 'factura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `dniEmpleado` varchar(8) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `Estado` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`dniEmpleado`, `nombre`, `clave`, `Estado`) VALUES
('7159938', 'Miri', 'mikri1234', 'I'),
('72758680', 'Jakeli', '7275', 'I'),
('73468973', 'jt', 'jt1234', 'I'),
('75392882', 'Miri', 'Ã±456', 'A'),
('75392884', 'ñanó', 'l34', 'A'),
('77777777', 'ñeño', '1234', 'A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ajuste_comprobantes`
--
ALTER TABLE `ajuste_comprobantes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_AjusteComprobante_tipoComprobante1_idx` (`ID_tipoComprobante`),
  ADD KEY `fk_AjusteComprobante_Comprobante1_idx` (`ID_Comprobante`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `cliente_empresas`
--
ALTER TABLE `cliente_empresas`
  ADD PRIMARY KEY (`RUC`);

--
-- Indices de la tabla `cliente_personas`
--
ALTER TABLE `cliente_personas`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_Comprobante_tipoComprobante1_idx` (`ID_tipoComprobante`),
  ADD KEY `fk_comprobantes_pedidos1_idx` (`ID_pedido`),
  ADD KEY `fk_comprobantes_empleados1_idx` (`DNI_empleado`),
  ADD KEY `fk_comprobantes_cliente1_idx` (`ID_cliente`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`ID_DetallePedido`),
  ADD KEY `ID_PedCl` (`ID_Pedido`),
  ADD KEY `ID_Prod` (`ID_Producto`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`DNI`),
  ADD KEY `fk_empleados_farma1_idx` (`ID_farm`);

--
-- Indices de la tabla `farmacias`
--
ALTER TABLE `farmacias`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`ID_HoraEmp`),
  ADD KEY `fk_horarios_empleado1_idx_idx` (`DNI_empleado`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID_Pedido`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_Prod`),
  ADD KEY `fk_productos_proveedor1_idx` (`RUC_Prov`),
  ADD KEY `fk_productos_categorias1_idx` (`ID_categoria`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`RUC`);

--
-- Indices de la tabla `tipo_comprobantes`
--
ALTER TABLE `tipo_comprobantes`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`dniEmpleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ajuste_comprobantes`
--
ALTER TABLE `ajuste_comprobantes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `ID_DetallePedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `farmacias`
--
ALTER TABLE `farmacias`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `ID_HoraEmp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID_Prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tipo_comprobantes`
--
ALTER TABLE `tipo_comprobantes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ajuste_comprobantes`
--
ALTER TABLE `ajuste_comprobantes`
  ADD CONSTRAINT `fk_AjusteComprobante_Comprobante1` FOREIGN KEY (`ID_Comprobante`) REFERENCES `comprobantes` (`ID`),
  ADD CONSTRAINT `fk_AjusteComprobante_tipoComprobante1` FOREIGN KEY (`ID_tipoComprobante`) REFERENCES `tipo_comprobantes` (`ID`);

--
-- Filtros para la tabla `cliente_empresas`
--
ALTER TABLE `cliente_empresas`
  ADD CONSTRAINT `fk_cliente_empresas_clientes1` FOREIGN KEY (`RUC`) REFERENCES `clientes` (`ID`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cliente_personas`
--
ALTER TABLE `cliente_personas`
  ADD CONSTRAINT `fk_cliente_personas_clientes1` FOREIGN KEY (`DNI`) REFERENCES `clientes` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD CONSTRAINT `fk_Comprobante_tipoComprobante1` FOREIGN KEY (`ID_tipoComprobante`) REFERENCES `tipo_comprobantes` (`ID`),
  ADD CONSTRAINT `fk_comprobantes_cliente1` FOREIGN KEY (`ID_cliente`) REFERENCES `clientes` (`ID`),
  ADD CONSTRAINT `fk_comprobantes_empleados1` FOREIGN KEY (`DNI_empleado`) REFERENCES `empleados` (`DNI`),
  ADD CONSTRAINT `fk_comprobantes_pedidos1` FOREIGN KEY (`ID_pedido`) REFERENCES `pedidos` (`ID_Pedido`);

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedidos` (`ID_Pedido`),
  ADD CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Prod`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_empleados_farma1` FOREIGN KEY (`ID_farm`) REFERENCES `farmacias` (`ID`);

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `fk_horarios_empleado1_idx` FOREIGN KEY (`DNI_empleado`) REFERENCES `empleados` (`DNI`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_categorias1` FOREIGN KEY (`ID_categoria`) REFERENCES `categorias` (`ID_categoria`),
  ADD CONSTRAINT `fk_productos_proveedor1` FOREIGN KEY (`RUC_Prov`) REFERENCES `proveedores` (`RUC`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_empleados1` FOREIGN KEY (`dniEmpleado`) REFERENCES `empleados` (`DNI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
