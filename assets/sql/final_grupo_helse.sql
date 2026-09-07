CREATE DATABASE  IF NOT EXISTS `final` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `final`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: final
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCLIENTE` int NOT NULL,
  `Nom_cliente` varchar(150) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Correo_elect` varchar(150) DEFAULT NULL,
  `Direccion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idCLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (9011,'SANAMOS SANTANDER S.A.S','3258496587','ssantander@gmail.com.co','CALLE 66 A CARRERA 52E - 225'),(9012,'SESUMED ZOMAC S.A.S','3005489652','seszomaz@zomac.com.co','CRA 40 #45C SUR 124 '),(9013,'SUMIVITALES  S.A.S.','3145698752','vitales@sumivitales.com.co','MZ 5 # 28'),(9014,'SUMPRO COLOMBIA S.A.S.','3165895471','sumploco@gmail.com','CALLE 39B SUR # 28-85'),(9015,'SUPLYMEDICAL S.A.S','3152478955','medical@sumplymedical.com.co','CALLE 25A # 28A 20'),(9016,'TADA INVERSIONES SAS','3002569874','inversionestada@tada.com.co','CARRERA 7  #9-37 '),(9017,'FARMACIA INSTITUCIONAL SAS','3225897444','contabilidad@institucional.com.co','IV CENTENARIO CARRERA 26 #02-04'),(9018,'RED FARMACEUTICA S.A.S','3335655874','redfarmacutica@hotmail.com','CALLE 30#34-19 '),(9019,'FUNDACION DEL CLUB ROTARIO BOGOTA USAQUEN ','3001548955','clubrotario@gmail.com','CALLE 2F #32A76'),(90110,'FUNDACION CARDIOVASCULAR DE COLOMBIA','6018547852','fundacardio@cardiovascular.com.co','CALLE 48 F SUR # 39B 314 APTO 105'),(90111,'ATLAS PHARMA LTDA','6015855471','pharma@gmail.com.co','CARRERA 15B 29 49 '),(90112,'FUNDACION FAMILIA Y FUTURO','3102566985','familiayfuturo@hotmail.com','CALLE15A #5A -32  '),(90113,'DISTRIBUCIONES PHARMASER LIMITADA','3112556987','gerencia@pharmaser.com.co','LIMONAE ETAPA 3 MZ 5 CASA 8 '),(90114,'VJ SPORTS SAS','3126559874','sports@vjsports.com.co','CLL 71 NRO 58 102 '),(90115,'FUNDACION CARVAJAL','3102563245','carvajarfundacion@gmail.com',' CARRERA 19B # 108'),(90116,'TODODROGAS CIA S.A.S','3114856963','contabilidad@tododrogas.com.co','CALLE138B#93D-46'),(90117,'SOLUCIONES FARMACEUTICAS LG S.A.S.','3165589745','lgfarmaceuticas@gmail.com','CLL27 22-17  '),(90118,'KEY PHARMA S.A.S.','3135896589','keypharma@hotmail.com','BLOQUE 5 MANZANA 21 CASA 5'),(90119,'FUNDACION RENACER AL NUEVO CHOCO','3189655233','nuevochoco@fundacion.com.co','CLL 25 #25-147'),(90120,'FUNDACIÃ“N PRINCIPIO & FIN','3195874656','fundacion@gmail.com','CLL 40C# 69A-12');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio` (
  `Id_envio` int NOT NULL,
  `Destino` varchar(150) DEFAULT NULL,
  `Costo_envio` decimal(15,0) DEFAULT NULL,
  `Nro_remision` int DEFAULT NULL,
  `Id_metodo` int NOT NULL,
  PRIMARY KEY (`Id_envio`),
  KEY `fk_envio_pedido_idx` (`Nro_remision`),
  KEY `fk_envio_metodo_idx` (`Id_metodo`),
  CONSTRAINT `fk_envio_metodo` FOREIGN KEY (`Id_metodo`) REFERENCES `metodo_envio` (`Id_metodo`),
  CONSTRAINT `fk_envio_pedido` FOREIGN KEY (`Nro_remision`) REFERENCES `pedido` (`Nro_remision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
INSERT INTO `envio` VALUES (36,'CALI',400000,8992,401882),(145,'CUCUTA',265000,8983,401880),(155,'CALI',30000,678,401880),(215,'MEDELLIN',200000,8989,401880),(235,'BOGOTA',100000,5242,401882),(255,'BOGOTA',100000,8988,401882),(258,'BARRANQUILLA',280000,5227,401881),(266,'BOGOTA',100000,5252,401882),(325,'RIONEGRO ',350000,5244,401880),(456,'CALI',80000,5226,401881),(589,'POPAYAN ',210000,8991,401880),(595,'MEDELLIN',180000,5238,401881),(635,'BARRANQUILLA',1500000,5250,401881),(654,'POPAYAN ',60000,8987,401880),(855,'CARTAGENA ',150000,8970,401880),(2114,'CALI',35000,5256,401880),(5263,'MEDELLIN',125000,8990,401880),(6584,'BUCARAMANGA',200000,5245,401881),(9563,'BOGOTA',100000,5243,401882);
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_envio`
--

DROP TABLE IF EXISTS `metodo_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_envio` (
  `Id_metodo` int NOT NULL,
  `Metodo_envio` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_metodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_envio`
--

LOCK TABLES `metodo_envio` WRITE;
/*!40000 ALTER TABLE `metodo_envio` DISABLE KEYS */;
INSERT INTO `metodo_envio` VALUES (401880,'TRANSPORTADORA'),(401881,'TERMINAL '),(401882,'CAMION PROPIO');
/*!40000 ALTER TABLE `metodo_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `Nro_remision` int NOT NULL,
  `Idcliente` int DEFAULT NULL,
  `Fecha_remision` date DEFAULT NULL,
  `Valor_remision` decimal(15,0) DEFAULT NULL,
  `Estado_remision` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Nro_remision`),
  KEY `fk_pedido_cliente_idx` (`Idcliente`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`Idcliente`) REFERENCES `cliente` (`idCLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (678,90113,'2026-08-15',468000,'ENTREGADA'),(679,9016,'2026-08-19',234000,'ENTREGADA'),(5226,9014,'2026-08-04',1125000,'DEVOLUCION'),(5227,9011,'2026-08-11',5684000,'ENTREGADA'),(5238,90114,'2026-08-13',1920000,'DEVOLUCION'),(5242,9015,'2026-08-04',1170000,'DEVOLUCION'),(5243,9013,'2026-08-10',1320000,'DEVOLUCION'),(5244,90113,'2026-08-06',5096000,'ENTREGADA'),(5245,90113,'2026-08-10',2700000,'ENTREGADA'),(5250,9017,'2026-08-15',10560000,'PENDIENTE DE ENTREGA '),(5252,90113,'2026-08-12',585000,'ENTREGADA'),(5256,90115,'2026-08-20',900000,'ENTREGADA '),(8970,9013,'2026-08-04',1800000,'PENDIENTE DE ENTREGA '),(8983,90112,'2026-08-11',4950000,'ENTREGADA'),(8987,9011,'2026-08-20',1500000,'PENDIENTE DE ENTREGA '),(8988,90113,'2026-08-19',1980000,'ENTREGADA'),(8989,90114,'2026-08-18',1650000,'PENDIENTE DE ENTREGA '),(8990,9017,'2026-08-18',2450000,'ENTREGADA'),(8991,90113,'2026-08-20',1125000,'ENTREGADA'),(8992,9011,'2026-08-19',1924000,'ENTREGADA');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `Id_producto` int NOT NULL,
  `Nom_producto` varchar(150) DEFAULT NULL,
  `Especificacion_producto` varchar(300) DEFAULT NULL,
  `Valor_producto` decimal(15,0) DEFAULT NULL,
  `Inventario` int DEFAULT NULL,
  PRIMARY KEY (`Id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'ENSURE ADVANCE LIQUIDO VAINILLA RPB','BOTELLA X 220ML',9000,200),(2,'PEDIASURE VAINILLA NUTRICIÃ“N ESPECIALIZADA','LATA X 400GR',45000,100),(3,'SIMILAC 5 HMO 2 ','BOLSA X 1400GR',175000,160),(4,'SIMILAC TOTAL COMFORT HMO 1 ','LATA X 700GR',98000,85),(5,'NEWEAT HIPRO VAINILLA ','SOBRE X 85GR',7500,88),(6,'BABY KLIM 2','LATA X 800GR',72000,956),(7,'PROWHEY ONCARE VAINILLA','LATA X 400GR',60000,325),(8,'PROWHEY RENAL CRONICO','SOBRE X 90GR',90000,632),(9,'NAN OPTIPRO 1','LATA X 900GR',110000,585),(10,'NAN PREMATUROS FORMULA INFANTIL ','LATA X 400GR',35000,563),(11,'NESTOGENO 2 FORMULA INFANTIL','LATA X 800GR',130000,156),(12,'NESTUM 5 CEREALES ','CAJA X 200GR',25000,125),(13,'NUTREN SENIOR VAINILLA','LATA X 740GR',78000,236),(14,'NAN EXPERT PRO COMFORT ','LATA X 400GR',45000,89),(15,'KLIM 1+ PREBIO DHA','BOLSAX 1KG',36000,85),(16,'NESTUM TRIGO MIEL','CAJA X 350GR',26000,52),(17,'PAÃ‘AL ADULTO TENA SLIP ','PACA X 21 UND',60000,3658),(18,'PAÃ‘AL BEBE HUGGIES ACTIVSEC 3','PACA X 50 UND',32000,2588),(19,'SIMILAC TOTAL COMFORT HMO 1','LATA X 700GR ',88000,458),(20,'NEWEAT HIPRO MARACUYA ','LATA X 900GR ',150000,636);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_pedido`
--

DROP TABLE IF EXISTS `productos_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_pedido` (
  `Nro_remision` int NOT NULL,
  `Id_producto` int NOT NULL,
  `Cantidad` int DEFAULT NULL,
  PRIMARY KEY (`Nro_remision`,`Id_producto`),
  KEY `fk_productos_pedido_remision_idx` (`Nro_remision`),
  KEY `fk_productos_pedido_producto_idx` (`Id_producto`),
  CONSTRAINT `fk_productos_pedido_producto` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id_producto`),
  CONSTRAINT `fk_productos_pedido_remision` FOREIGN KEY (`Nro_remision`) REFERENCES `pedido` (`Nro_remision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_pedido`
--

LOCK TABLES `productos_pedido` WRITE;
/*!40000 ALTER TABLE `productos_pedido` DISABLE KEYS */;
INSERT INTO `productos_pedido` VALUES (678,1,52),(679,1,26),(5226,12,45),(5227,4,58),(5238,7,32),(5242,1,130),(5243,9,12),(5244,4,52),(5245,2,60),(5250,9,96),(5252,1,65),(5256,15,25),(8970,7,30),(8983,9,45),(8987,7,25),(8988,2,44),(8989,9,15),(8990,4,25),(8991,2,25),(8992,16,74);
/*!40000 ALTER TABLE `productos_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-06 18:43:32
