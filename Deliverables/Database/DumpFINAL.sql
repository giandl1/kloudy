-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: kloudy
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carta`
--

DROP TABLE IF EXISTS `carta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carta` (
  `codice` int(11) NOT NULL AUTO_INCREMENT,
  `proprietario` varchar(35) DEFAULT NULL,
  `utente` varchar(20) DEFAULT NULL,
  `dataScad` varchar(10) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `cvv` int(11) DEFAULT NULL,
  PRIMARY KEY (`codice`),
  KEY `utente` (`utente`),
  CONSTRAINT `carta_ibfk_1` FOREIGN KEY (`utente`) REFERENCES `utente` (`nickname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carta`
--

LOCK TABLES `carta` WRITE;
/*!40000 ALTER TABLE `carta` DISABLE KEYS */;
INSERT INTO `carta` VALUES (12,'Tito Fornasiero','TitoFornasiero','06/24','1111111111111111',352),(29,'Gianluca di Lillo','gianluca','11/23','1111111111111111',123);
/*!40000 ALTER TABLE `carta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirizzo`
--

DROP TABLE IF EXISTS `indirizzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `indirizzo` (
  `codice` int(11) NOT NULL AUTO_INCREMENT,
  `indirizzo` varchar(40) DEFAULT NULL,
  `citta` varchar(40) DEFAULT NULL,
  `cap` decimal(5,0) DEFAULT NULL,
  `telefono` decimal(11,0) DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `cognome` varchar(20) DEFAULT NULL,
  `utente` varchar(30) DEFAULT NULL,
  `provincia` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codice`),
  KEY `utente` (`utente`),
  CONSTRAINT `indirizzo_ibfk_1` FOREIGN KEY (`utente`) REFERENCES `utente` (`nickname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirizzo`
--

LOCK TABLES `indirizzo` WRITE;
/*!40000 ALTER TABLE `indirizzo` DISABLE KEYS */;
INSERT INTO `indirizzo` VALUES (1,'Via Roma 2','Caserta',81024,3200781141,'Tito','Fornasiero','TitoFornasiero','Caserta'),(24,'Via asd 123','Maddaloni',81024,3200781141,'Gianluca','di Lillo','gianluca','Caserta');
/*!40000 ALTER TABLE `indirizzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderatore`
--

DROP TABLE IF EXISTS `moderatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `moderatore` (
  `nickname` varchar(20) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderatore`
--

LOCK TABLES `moderatore` WRITE;
/*!40000 ALTER TABLE `moderatore` DISABLE KEYS */;
INSERT INTO `moderatore` VALUES ('kloudymod','aaa111');
/*!40000 ALTER TABLE `moderatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ordine` (
  `codice` int(11) NOT NULL AUTO_INCREMENT,
  `dataOrdine` date DEFAULT NULL,
  `cliente` varchar(20) NOT NULL,
  `totale` double NOT NULL,
  `stato` varchar(15) DEFAULT NULL,
  `tracking` varchar(30) DEFAULT NULL,
  `corriere` varchar(30) DEFAULT NULL,
  `indirizzo` int(11) DEFAULT NULL,
  `carta` int(11) DEFAULT NULL,
  `artista` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codice`),
  KEY `cliente` (`cliente`),
  KEY `ordine_ibfk_3_idx` (`carta`),
  KEY `ordine_ibfk_2` (`indirizzo`),
  CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `utente` (`nickname`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ordine_ibfk_2` FOREIGN KEY (`indirizzo`) REFERENCES `indirizzo` (`codice`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordine_ibfk_3` FOREIGN KEY (`carta`) REFERENCES `carta` (`codice`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (1,'2019-01-01','gianluca',1000,'In attesa','','',NULL,NULL,'TitoFornasiero'),(2,'2019-02-06','TitoFornasiero',140,'spedito','ABCD','Bartolini',1,12,'TitoFornasiero'),(17,'2019-02-08','gianluca',140,'In attesa','','',24,29,'TitoFornasiero'),(18,'2019-02-09','gianluca',140,'In attesa','','',24,29,'TitoFornasiero'),(19,'2019-02-09','gianluca',23,'In attesa','','',24,29,'train456'),(20,'2019-02-09','gianluca',12,'In attesa','','',24,29,'AntonioManzini'),(23,'2019-02-09','gianluca',140,'In spedizione','ABCD','Bartolini',24,29,'TitoFornasiero');
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prodotto` (
  `codice` int(11) NOT NULL AUTO_INCREMENT,
  `titolo` varchar(50) DEFAULT NULL,
  `autore` varchar(20) DEFAULT NULL,
  `descrizione` text,
  `dataCreazione` date DEFAULT NULL,
  `prezzo` double DEFAULT NULL,
  `dimensione` varchar(10) DEFAULT NULL,
  `opera` varchar(20) DEFAULT NULL,
  `numeroBrani` decimal(2,0) DEFAULT NULL,
  `durata` time DEFAULT NULL,
  `editore` varchar(30) DEFAULT NULL,
  `numeroPagine` int(11) DEFAULT NULL,
  `categoria` varchar(20) DEFAULT NULL,
  `verificato` tinyint(1) DEFAULT '0',
  `disponibilita` int(11) DEFAULT NULL,
  `genere` varchar(20) DEFAULT NULL,
  `motivazione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codice`),
  KEY `FK1_idx` (`autore`),
  CONSTRAINT `FK1` FOREIGN KEY (`autore`) REFERENCES `utente` (`nickname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (1,'Paesaggio Iariano','TitoFornasiero','Bello e interessante','2013-03-03',140,'29x39','Iariano.jpg',NULL,NULL,NULL,NULL,'digitalArt',1,81,NULL,NULL),(2,'Monnalisa Chiaro-Scuro','TitoFornasiero','Personale reinterpretazione della famosa Monnalisa','2013-09-10',38,'50x70','Monnalisa.jpg',NULL,NULL,NULL,NULL,'digitalArt',1,10,NULL,'Non adatto ai contenuti del sito'),(3,'Ultima Cena 2.0','TitoFornasiero','Ultima cena reinterpreta e colorata per renderela il più brillante possibile','2017-02-01',18,'35x40','ultimaCena.jpg',NULL,NULL,NULL,NULL,'digitalArt',0,4,NULL,NULL),(4,'Rien ne va plus','AntonioManzini','Un nuovo capitolo del grande Romanzo di Rocco Schiavone, un uomo duro con se stesso prima che con gli altri, ruvido, intransigente, svogliato e vigile; dietro il suo cinismo una umanità insospettabile e un senso della giustizia tutto suo. E nel raccontarcelo Antonio Manzini ci parla anche dell\'Italia di oggi, inquieta e inquietante.','2019-01-04',12,'430 mb','rien.jpg',NULL,NULL,'Sellerio Editore Palermo',410,'testi',1,10,'Romanzo giallo',NULL),(5,'Cosa farai?','AntonioManzini','Il libro d’ore di Rilke è uno dei libri più amati dallo stesso autore benché fosse un’opera giovanile. Libro di grande spiritualità, accoglie una serie di riflessioni messe in poesia con grazia e musicalità estreme. Questo brano in particolare è di una forza incredibile celata dietro una (presunta) semplicità.','2008-10-10',35,'365 mb','rilke.jpg',NULL,NULL,'Tiz',126,'testi',0,15,'Amore',NULL),(6,'E la morte non avrà più dominio','AntonioManzini','Forse è la poesia più conosciuta di Dylan Thomas, un brano che lascia letteralmente senza fiato per il ritmo incalzante nonché per la forza e la successione vorticosa delle immagini.','1996-11-12',58,'150 mb','thomas.jpg',NULL,NULL,'Einaudi',1,'testi',1,4,'Racconti',NULL),(7,'Light Ambience','train456',NULL,'2019-01-01',4.3,'15 mb','ambience.wav',1,'00:02:46',NULL,NULL,'audio',0,100,NULL,'contenuto non adatto'),(8,'LoopMix','train456',NULL,'2019-01-03',2.5,'9 mb','loop.mp3',1,'00:02:48',NULL,NULL,'audio',0,50,NULL,'prodotto non adatto ai contenuti del sito'),(9,'Great Pretender','train456','Instrumental fragment from the song \'Great Pretender\' from the \'7 Songs\' album. A short piece played on 12 string guitar with a toy piano carrying the melody.','2018-03-04',23,'200 mb','pretender.wav',7,'00:18:46',NULL,NULL,'audio',1,18,NULL,NULL);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodottoordine`
--

DROP TABLE IF EXISTS `prodottoordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prodottoordine` (
  `codice` int(11) NOT NULL AUTO_INCREMENT,
  `titolo` varchar(30) DEFAULT NULL,
  `autore` varchar(30) DEFAULT NULL,
  `prezzo` double DEFAULT NULL,
  `codiceOrdine` int(11) NOT NULL,
  `opera` varchar(50) DEFAULT NULL,
  `quantita` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `categoria` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codice`),
  KEY `codiceOrdine` (`codiceOrdine`),
  KEY `prodottoordine_ibfk2_2_idx` (`id`),
  CONSTRAINT `prodottoordine_ibfk2_2` FOREIGN KEY (`id`) REFERENCES `prodotto` (`codice`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `prodottoordine_ibfk_1` FOREIGN KEY (`codiceOrdine`) REFERENCES `ordine` (`codice`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodottoordine`
--

LOCK TABLES `prodottoordine` WRITE;
/*!40000 ALTER TABLE `prodottoordine` DISABLE KEYS */;
INSERT INTO `prodottoordine` VALUES (1,'test','TitoFornasiero',140,2,'test.jpg',1,1,'digitalArt'),(19,'Paesaggio Iariano','TitoFornasiero',140,17,'imm/Iariano.jpg',1,1,'digitalArt'),(20,'Paesaggio Iariano','TitoFornasiero',140,18,'imm/Iariano.jpg',1,1,'digitalArt'),(21,'Great Pretender','train456',23,19,'imm/pretender.wav',1,9,'audio'),(22,'Rien ne va plus','AntonioManzini',12,20,'imm/rien.jpg',1,4,'testi'),(25,'Paesaggio Iariano','TitoFornasiero',140,23,'imm/Iariano.jpg',1,1,'digitalArt');
/*!40000 ALTER TABLE `prodottoordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `utente` (
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `piva` decimal(11,0) DEFAULT NULL,
  `nickname` varchar(20) NOT NULL,
  `ruolo` varchar(15) NOT NULL,
  PRIMARY KEY (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('Antonio','Manzini','anto@lol.com','aaa111',NULL,'AntonioManzini','artista'),('Gianluca','di Lillo','lol@lol.com','aaa111',NULL,'gianluca','appassionato'),('Tito','Fornasiero','tito@lol.com','aaa111',NULL,'TitoFornasiero','artista'),('Luca','Peruzzo','luca@lol.com','aaa111',NULL,'train456','artista');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-09 17:56:25
