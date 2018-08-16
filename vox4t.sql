-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: vox4t
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `id_administrador` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_administrador`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'adm@vox4t.com','123456');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canal`
--

DROP TABLE IF EXISTS `canal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canal` (
  `id_canal` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_administrador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_canal`),
  KEY `fk_adm_canal` (`id_administrador`),
  KEY `fk_categoria_canal` (`id_categoria`),
  CONSTRAINT `fk_adm_canal` FOREIGN KEY (`id_administrador`) REFERENCES `administrador` (`id_administrador`),
  CONSTRAINT `fk_categoria_canal` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal`
--

LOCK TABLES `canal` WRITE;
/*!40000 ALTER TABLE `canal` DISABLE KEYS */;
INSERT INTO `canal` VALUES (1,'@jctransito',1,NULL),(2,'@radiotransitofm',1,NULL),(3,'@globoesportecom',2,NULL),(4,'@ESPNagora',2,NULL),(5,'@LulaOficial',3,NULL),(6,'@jairbolsonaro',3,NULL);
/*!40000 ALTER TABLE `canal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `id_administrador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `fk_categoria_admin` (`id_administrador`),
  CONSTRAINT `fk_categoria_admin` FOREIGN KEY (`id_administrador`) REFERENCES `administrador` (`id_administrador`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Transito',NULL),(2,'Esportes',NULL),(3,'Politica',NULL);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacao`
--

DROP TABLE IF EXISTS `publicacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicacao` (
  `id_publicacao` int(11) NOT NULL AUTO_INCREMENT,
  `mensagem` varchar(300) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `id_canal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_publicacao`),
  KEY `fk_publicacao_canal` (`id_canal`),
  CONSTRAINT `fk_publicacao_canal` FOREIGN KEY (`id_canal`) REFERENCES `canal` (`id_canal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacao`
--

LOCK TABLES `publicacao` WRITE;
/*!40000 ALTER TABLE `publicacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Vox4t','vox4t@gmail.com','E10ADC3949BA59ABBE56E057F20F883E','2018-04-15','M',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_escolhe_categoria`
--

DROP TABLE IF EXISTS `usuario_escolhe_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_escolhe_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_escolhe_usuario` (`id_usuario`),
  KEY `fk_escolhe_categoria` (`id_categoria`),
  CONSTRAINT `FKb5ww9q7g1f8ui2sbdx1cj78aw` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `FKeny8mam4b37kvg26vgrxhn1jl` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `fk_escolhe_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `fk_escolhe_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_escolhe_categoria`
--

LOCK TABLES `usuario_escolhe_categoria` WRITE;
/*!40000 ALTER TABLE `usuario_escolhe_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_escolhe_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_usuario_escolhe_categoria`
--

DROP TABLE IF EXISTS `usuario_usuario_escolhe_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_usuario_escolhe_categoria` (
  `Usuario_id_usuario` int(11) NOT NULL,
  `usuarioEscolheCategoria_id` int(11) NOT NULL,
  KEY `FK5st6evc7y0gfs71jeat9kega3` (`usuarioEscolheCategoria_id`),
  KEY `FK4nvq26m9dtadxvyna3hk9285y` (`Usuario_id_usuario`),
  CONSTRAINT `FK4nvq26m9dtadxvyna3hk9285y` FOREIGN KEY (`Usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK5st6evc7y0gfs71jeat9kega3` FOREIGN KEY (`usuarioEscolheCategoria_id`) REFERENCES `usuario_escolhe_categoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_usuario_escolhe_categoria`
--

LOCK TABLES `usuario_usuario_escolhe_categoria` WRITE;
/*!40000 ALTER TABLE `usuario_usuario_escolhe_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_usuario_escolhe_categoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-16 17:04:07