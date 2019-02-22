CREATE DATABASE  IF NOT EXISTS `selecao_fullstack` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `selecao_fullstack`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: selecao_fullstack
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.37-MariaDB

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
-- Table structure for table `animais`
--

DROP TABLE IF EXISTS `animais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `raca_id` int(11) DEFAULT NULL,
  `chip` int(11) DEFAULT NULL,
  `data_nascimento` datetime DEFAULT NULL,
  `data_atualizacao` datetime DEFAULT NULL,
  `data_falecimento` datetime DEFAULT NULL,
  `sexo` enum('M','F') COLLATE utf8_unicode_ci DEFAULT NULL,
  `especie` enum('1','2') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_raca_idx` (`raca_id`),
  CONSTRAINT `fk_raca` FOREIGN KEY (`raca_id`) REFERENCES `racas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animais`
--

LOCK TABLES `animais` WRITE;
/*!40000 ALTER TABLE `animais` DISABLE KEYS */;
INSERT INTO `animais` VALUES (2,'joao',1,112,'2019-02-01 00:00:00','1940-10-11 00:00:00','1941-10-11 00:00:00','F','2'),(3,'amora',1,112,'1942-10-11 00:00:00','1940-10-11 00:00:00','1941-10-11 00:00:00','M','1'),(4,'amora',1,112,'1942-10-11 00:00:00','1940-10-11 00:00:00','1941-10-11 00:00:00','M','1'),(5,'amora',1,112,'1942-10-11 00:00:00','1940-10-11 00:00:00','1941-10-11 00:00:00','F','2'),(6,'joao',1,112,'2019-02-01 00:00:00','1940-10-11 00:00:00','1941-10-11 00:00:00','F','2'),(7,'amora',1,112,'1942-10-11 00:00:00',NULL,'1941-10-11 00:00:00','F','2'),(8,'amora',1,112,'1942-10-11 00:00:00','1940-10-11 00:00:00','1941-10-11 00:00:00','F','2'),(9,'amora',1,112,'1942-10-11 00:00:00','1940-10-11 00:00:00','1941-10-11 00:00:00','F','2'),(10,'amora',1,112,'1942-10-11 00:00:00','1940-10-11 00:00:00',NULL,'F','2');
/*!40000 ALTER TABLE `animais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `listar`
--

DROP TABLE IF EXISTS `listar`;
/*!50001 DROP VIEW IF EXISTS `listar`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listar` AS SELECT 
 1 AS `situacao_raca`,
 1 AS `nome_raca`,
 1 AS `id`,
 1 AS `nome`,
 1 AS `raca`,
 1 AS `chip`,
 1 AS `data_nascimento`,
 1 AS `data_atualizacao`,
 1 AS `data_falecimento`,
 1 AS `sexo`,
 1 AS `especie`,
 1 AS `idade`,
 1 AS `situacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `racas`
--

DROP TABLE IF EXISTS `racas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `racas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `situacao` enum('ATI','INA') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racas`
--

LOCK TABLES `racas` WRITE;
/*!40000 ALTER TABLE `racas` DISABLE KEYS */;
INSERT INTO `racas` VALUES (1,'pitbull','ATI');
/*!40000 ALTER TABLE `racas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'selecao_fullstack'
--

--
-- Dumping routines for database 'selecao_fullstack'
--
/*!50003 DROP FUNCTION IF EXISTS `calculaDataNascimento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CALCULADATANASCIMENTO`(data_nascimento DATETIME) RETURNS int(11)
BEGIN
DECLARE idade INT;
DECLARE data_atual DATETIME;
	set data_atual = NOW();
	set idade = TIMESTAMPDIFF(DAY,data_nascimento,data_atual); 
RETURN idade;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `atualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar`(
	IN p_animal_id  INT(11),
	IN p_nome varchar(100),
	IN p_raca INT(11),
	IN p_chip INT(11),
	IN p_data_nascimento DATETIME,
	IN p_data_atualizacao DATETIME,
	IN p_data_falecimento DATETIME,
	IN p_sexo ENUM('M', 'F'),
	IN p_especie ENUM('1', '2')
    )
BEGIN
    update animais 
    
    SET nome = p_nome,
     raca_id= p_raca,
     chip= p_chip,
     data_nascimento= p_data_nascimento,
     data_atualizacao= p_data_atualizacao,
     data_falecimento= p_data_falecimento,
     sexo = p_sexo,
     especie = p_especie
	 WHERE  id = p_animal_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `criar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `criar`(
	IN p_nome varchar(100),
	IN p_raca INT(11),
	IN p_chip INT(11),
	IN p_data_nascimento DATETIME,
	IN p_data_atualizacao DATETIME,
	IN p_data_falecimento DATETIME,
	IN p_sexo ENUM('M', 'F'),
	IN p_especie ENUM('1', '2')
)
BEGIN
    insert into animais (nome ,
    raca_id,
    chip,
    data_nascimento,
    data_atualizacao,
    data_falecimento,
    sexo,
    especie) 
    values (p_nome ,p_raca,p_chip,p_data_nascimento,p_data_atualizacao
    ,p_data_falecimento,p_sexo,p_especie);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `listar`
--

/*!50001 DROP VIEW IF EXISTS `listar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listar` AS select `racas`.`situacao` AS `situacao_raca`,`racas`.`nome` AS `nome_raca`,`pet`.`id` AS `id`,`pet`.`nome` AS `nome`,`pet`.`raca_id` AS `raca`,`pet`.`chip` AS `chip`,`pet`.`data_nascimento` AS `data_nascimento`,`pet`.`data_atualizacao` AS `data_atualizacao`,`pet`.`data_falecimento` AS `data_falecimento`,`pet`.`sexo` AS `sexo`,`pet`.`especie` AS `especie`,`CALCULADATANASCIMENTO`(`pet`.`data_nascimento`) AS `idade`,(case when (`pet`.`data_falecimento` is not null) then 'morto' else 'vivo' end) AS `situacao` from (`animais` `pet` join `racas`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-22  9:22:38
