-- MySQL dump 10.13  Distrib 8.4.0, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ecommerce`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ecommerce`;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(10) DEFAULT NULL,
  `Minit` char(3) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `CPF` char(11) NOT NULL,
  `Adress` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `unique_cpf_client` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Maria','M','Silva','123456789','Rua silva de prata 29'),(2,'Matheus','O','Pimentel','987654321','Rua alameda 289'),(3,'Ricardo','F','Silva','45678913','Rua alameda vinha 1009'),(4,'Julia','S','França','789123456','Rua laranjeuras 861'),(5,'Roberta','G','Assis','98745631','avenida koller 19'),(6,'Isabela','M','Cruz','654789123','Rua alameda das flores 28');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idOrder` int NOT NULL AUTO_INCREMENT,
  `idOrderClient` int DEFAULT NULL,
  `OrderStatus` enum('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
  `OrderDescripition` varchar(255) DEFAULT NULL,
  `SendValue` float DEFAULT '10',
  `paymentCash` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idOrder`),
  KEY `fk_orders_client` (`idOrderClient`),
  CONSTRAINT `fk_orders_client` FOREIGN KEY (`idOrderClient`) REFERENCES `clients` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,NULL,'Compra via app',NULL,1),(2,2,NULL,'Compra via app',NULL,50),(3,3,NULL,'Confirmado',NULL,1),(4,4,NULL,'Compra via site',150,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `Idclient` int NOT NULL,
  `Idpayment` int NOT NULL,
  `type_paymant` enum('Boleto','Cartão','Dois cartões') DEFAULT NULL,
  `limitAvailable` float DEFAULT NULL,
  PRIMARY KEY (`Idclient`,`Idpayment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'Boleto',1000),(2,2,'Cartão',1000),(3,3,'Boleto',1000),(4,4,'Dois cartões',1000),(5,5,'Boleto',1000);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `Pname` varchar(10) NOT NULL,
  `Classificatio_kids` tinyint(1) DEFAULT '0',
  `category` enum('Eletrônico','Vestuário','Brinquedos','Alimentos','Móveis') NOT NULL,
  `Avaliação` float DEFAULT '0',
  `size` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (31,'Teclado',0,'Móveis',4,NULL),(32,'Mesa',0,'Móveis',3,NULL),(33,'B Ben10',1,'Eletrônico',5,NULL),(34,'Celular',0,'Eletrônico',3,'3x57x80'),(35,'Led',1,'Eletrônico',5,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productorder`
--

DROP TABLE IF EXISTS `productorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productorder` (
  `idPOproduct` int NOT NULL,
  `idPOorder` int NOT NULL,
  `poQuantity` int DEFAULT '1',
  `poStatus` enum('Disponivel','Sem estoque') DEFAULT 'Disponivel',
  PRIMARY KEY (`idPOproduct`,`idPOorder`),
  KEY `fk_productorder_product` (`idPOorder`),
  CONSTRAINT `fk_productorder_product` FOREIGN KEY (`idPOorder`) REFERENCES `orders` (`idOrder`),
  CONSTRAINT `fk_productorder_seller` FOREIGN KEY (`idPOproduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productorder`
--

LOCK TABLES `productorder` WRITE;
/*!40000 ALTER TABLE `productorder` DISABLE KEYS */;
INSERT INTO `productorder` VALUES (31,1,3,NULL),(32,2,1,NULL),(33,3,1,NULL);
/*!40000 ALTER TABLE `productorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productseller`
--

DROP TABLE IF EXISTS `productseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productseller` (
  `idPsellet` int NOT NULL,
  `idProduct` int NOT NULL,
  `prodquantity` int DEFAULT '1',
  PRIMARY KEY (`idPsellet`,`idProduct`),
  KEY `fk_product_product` (`idProduct`),
  CONSTRAINT `fk_product_product` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_product_saller` FOREIGN KEY (`idPsellet`) REFERENCES `seller` (`idSeller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productseller`
--

LOCK TABLES `productseller` WRITE;
/*!40000 ALTER TABLE `productseller` DISABLE KEYS */;
INSERT INTO `productseller` VALUES (1,31,80),(2,33,10);
/*!40000 ALTER TABLE `productseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productstorage`
--

DROP TABLE IF EXISTS `productstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productstorage` (
  `idProdStorage` int NOT NULL AUTO_INCREMENT,
  `storageLocation` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT '0',
  PRIMARY KEY (`idProdStorage`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productstorage`
--

LOCK TABLES `productstorage` WRITE;
/*!40000 ALTER TABLE `productstorage` DISABLE KEYS */;
INSERT INTO `productstorage` VALUES (1,'Salvador',1000),(2,'Cruz',2000),(3,'Rio de Janeiro',10),(4,'Brasilia',100),(5,'São Paulo',60),(6,'Salvador',20);
/*!40000 ALTER TABLE `productstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsupplier`
--

DROP TABLE IF EXISTS `productsupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsupplier` (
  `idPsSupplier` int NOT NULL,
  `idPsProduct` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`idPsSupplier`,`idPsProduct`),
  KEY `fk_product_supplier_product` (`idPsProduct`),
  CONSTRAINT `fk_product_supplier_product` FOREIGN KEY (`idPsProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_product_supplier_supplier` FOREIGN KEY (`idPsSupplier`) REFERENCES `supplier` (`idSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsupplier`
--

LOCK TABLES `productsupplier` WRITE;
/*!40000 ALTER TABLE `productsupplier` DISABLE KEYS */;
INSERT INTO `productsupplier` VALUES (1,31,500),(1,32,400),(2,34,564),(2,35,10),(3,33,5);
/*!40000 ALTER TABLE `productsupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `idSeller` int NOT NULL AUTO_INCREMENT,
  `SocialName` varchar(255) NOT NULL,
  `CNPJ` char(15) DEFAULT NULL,
  `CPF` char(9) DEFAULT NULL,
  `contact` char(11) NOT NULL,
  PRIMARY KEY (`idSeller`),
  UNIQUE KEY `unique_cnpj_seller` (`CNPJ`),
  UNIQUE KEY `unique_cpf_seller` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'T Eltrics','123456789123456',NULL,'219946287'),(2,'B douglas','987654123',NULL,'219943456'),(3,'O Mundo','123456789765345',NULL,'219345456');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storagelocation`
--

DROP TABLE IF EXISTS `storagelocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storagelocation` (
  `idLproduct` int NOT NULL,
  `idLstorage` int NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`idLproduct`,`idLstorage`),
  KEY `fk_storage_location_storage` (`idLstorage`),
  CONSTRAINT `fk_storage_location_product` FOREIGN KEY (`idLproduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_storage_location_storage` FOREIGN KEY (`idLstorage`) REFERENCES `productstorage` (`idProdStorage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storagelocation`
--

LOCK TABLES `storagelocation` WRITE;
/*!40000 ALTER TABLE `storagelocation` DISABLE KEYS */;
INSERT INTO `storagelocation` VALUES (31,2,'Rj'),(32,6,'GO');
/*!40000 ALTER TABLE `storagelocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `idSupplier` int NOT NULL AUTO_INCREMENT,
  `SocialName` varchar(255) NOT NULL,
  `CNPJ` char(15) NOT NULL,
  `contact` char(11) NOT NULL,
  PRIMARY KEY (`idSupplier`),
  UNIQUE KEY `unique_supplier` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Filhos e Almeida','123456789123456','21985474'),(2,'Silva eletronics','987654321123456','21345667'),(3,'Valm Text','543456789654343','21345678');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-05 19:46:45
