-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: fifa
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `clube`
--

DROP TABLE IF EXISTS `clube`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clube` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(63) COLLATE utf8mb3_bin NOT NULL COMMENT 'Nome resumido do clube.',
  `dinheiro_transferencia` decimal(12,2) unsigned NOT NULL COMMENT 'Montante financeiro que o clube tem orçado para gastar na temporada em contratações.',
  `prestigio_domestico` int NOT NULL COMMENT 'Representa de forma ascendente, qual é o nível de prestígio de um clube na sua liga doméstica. Normalmente é usado no jogo para simular se um jogador deseja ou não ir para o clube que fez uma proposta de transferência.',
  `prestigio_internacional` int NOT NULL COMMENT 'Representa de forma ascendente, qual é o nível de prestígio de um clube no mundo. Normalmente é usado no jogo para simular se um jogador deseja ou não ir para o clube que fez uma proposta de transferência.',
  `liga_id` int unsigned NOT NULL COMMENT 'O ID referente à tabela "Liga". O valor representa de qual liga doméstica pertence a equipe.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_clube_liga1_idx` (`liga_id`),
  CONSTRAINT `Um clube deve estar uma liga` FOREIGN KEY (`liga_id`) REFERENCES `liga` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clube`
--

LOCK TABLES `clube` WRITE;
/*!40000 ALTER TABLE `clube` DISABLE KEYS */;
/*!40000 ALTER TABLE `clube` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidade`
--

DROP TABLE IF EXISTS `habilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habilidade` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `nome_traduzido` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidade`
--

LOCK TABLES `habilidade` WRITE;
/*!40000 ALTER TABLE `habilidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `habilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogador`
--

DROP TABLE IF EXISTS `jogador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogador` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) COLLATE utf8mb3_bin NOT NULL COMMENT 'Nome usado pelo jogador na camisa do time e nas demais funcionalidades do jogo.',
  `nome_completo` varchar(64) COLLATE utf8mb3_bin NOT NULL COMMENT 'Nome completo do jogador, vindo de seu documento oficial.',
  `idade` int NOT NULL COMMENT 'A idade o jogador, independente da data de nascimento que não está entre os dados.',
  `altura` int DEFAULT NULL COMMENT 'Altura do jogador em centímetros.',
  `peso` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'Peso do jogador em quilogramas.',
  `overall` int unsigned NOT NULL COMMENT 'Considerado como uma forma de avaliação do jogador.',
  `potencial` int unsigned NOT NULL COMMENT 'Se refere até quanto o atributo overall do jogador pode evoluir durante o jogo.',
  `valor_mercado_eur` decimal(12,2) unsigned NOT NULL COMMENT 'Refere-se à avaliação do mercado sobre quanto vale o jogador para uma proposta de transferência. Em euros.',
  `valor_salario_eur` decimal(12,2) unsigned NOT NULL COMMENT 'Salário do jogador dentro do clube atual. Em euros.',
  `valor_clausula_venda_eur` decimal(12,2) unsigned NOT NULL COMMENT 'Valor acordado entre o clube e o jogador para a quebra de contrato. Normalmente é utilizado para a realização de transferência.\n',
  `inicio_contrato` year NOT NULL COMMENT 'Ano em que se iniciou o contrato do jogador com o clube. Importante: Esta data comumente é iniciada em julho/agosto da temporada.',
  `fim_contrato` year NOT NULL COMMENT 'Ano em que se encerra o contrato do jogador com o clube. Importante: Esta data comumente se refere a julho/agosto da temporada.',
  `camisa_clube` int unsigned NOT NULL COMMENT 'Número da camisa do atleta no clube.',
  `is_emprestimo` tinyint unsigned NOT NULL COMMENT 'Booleano que identifica se o jogador vem de empréstimo de outro clube ou se é um contratado.',
  `clube_id` int unsigned DEFAULT NULL COMMENT 'Valor referente à tabela "Clube". O ID representa o clube que o jogador está atuando. Não necessariamente precisa atribuido a algum time, já qie o jogador pode estar livre no mercado.',
  `pais_id` int unsigned NOT NULL,
  `posicao_principal_id` int unsigned NOT NULL COMMENT 'Valor referente à tabela "posicao". Representa a  posição que o atleta mais se identifica e gosta de atuar.',
  `posicao_clube_id` int unsigned NOT NULL COMMENT 'Valor referente a tabela "posicao". Representa a posição inicial que o jogador está atuando no quadro de jogadores que iniciam as partidas.',
  `pe` char(1) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_jogador_clube_idx` (`clube_id`),
  KEY `fk_jogador_pais1_idx` (`pais_id`),
  KEY `fk_jogador_posicao1_idx` (`posicao_principal_id`),
  KEY `fk_jogador_posicao2_idx` (`posicao_clube_id`),
  CONSTRAINT `Um jogador pertence a um clube` FOREIGN KEY (`clube_id`) REFERENCES `clube` (`id`),
  CONSTRAINT `Um jogador tem muitas posições` FOREIGN KEY (`posicao_clube_id`) REFERENCES `posicao` (`id`),
  CONSTRAINT `Um jogador tem uma posição principal` FOREIGN KEY (`posicao_principal_id`) REFERENCES `posicao` (`id`),
  CONSTRAINT `Um jogador vem de um país` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogador`
--

LOCK TABLES `jogador` WRITE;
/*!40000 ALTER TABLE `jogador` DISABLE KEYS */;
/*!40000 ALTER TABLE `jogador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogador_habilidade`
--

DROP TABLE IF EXISTS `jogador_habilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogador_habilidade` (
  `jogador_id` int unsigned NOT NULL,
  `habilidade_id` int unsigned NOT NULL,
  `valor` int unsigned NOT NULL,
  PRIMARY KEY (`jogador_id`,`habilidade_id`),
  KEY `fk_jogador_has_habilidade_habilidade1_idx` (`habilidade_id`),
  KEY `fk_jogador_has_habilidade_jogador1_idx` (`jogador_id`),
  CONSTRAINT `Um jogador deve ter uma habilidade` FOREIGN KEY (`habilidade_id`) REFERENCES `habilidade` (`id`),
  CONSTRAINT `Uma habilidade deve ter um jogador` FOREIGN KEY (`jogador_id`) REFERENCES `jogador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogador_habilidade`
--

LOCK TABLES `jogador_habilidade` WRITE;
/*!40000 ALTER TABLE `jogador_habilidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `jogador_habilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogador_posicao`
--

DROP TABLE IF EXISTS `jogador_posicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogador_posicao` (
  `jogador_id` int unsigned NOT NULL,
  `posicao_id` int unsigned NOT NULL,
  PRIMARY KEY (`jogador_id`,`posicao_id`),
  KEY `fk_jogador_has_posicao_posicao1_idx` (`posicao_id`),
  KEY `fk_jogador_has_posicao_jogador1_idx` (`jogador_id`),
  CONSTRAINT `Um jogador deve ter uma posição` FOREIGN KEY (`jogador_id`) REFERENCES `jogador` (`id`),
  CONSTRAINT `Uma posição deve ter um jogador` FOREIGN KEY (`posicao_id`) REFERENCES `posicao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogador_posicao`
--

LOCK TABLES `jogador_posicao` WRITE;
/*!40000 ALTER TABLE `jogador_posicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `jogador_posicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liga`
--

DROP TABLE IF EXISTS `liga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liga` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) COLLATE utf8mb3_bin NOT NULL COMMENT 'Nome oficial da Liga dentro do jogo, independente de tradução.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liga`
--

LOCK TABLES `liga` WRITE;
/*!40000 ALTER TABLE `liga` DISABLE KEYS */;
/*!40000 ALTER TABLE `liga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liga_pais`
--

DROP TABLE IF EXISTS `liga_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liga_pais` (
  `liga_id` int unsigned NOT NULL,
  `pais_id` int unsigned NOT NULL,
  PRIMARY KEY (`liga_id`,`pais_id`),
  KEY `fk_liga_has_pais_pais1_idx` (`pais_id`),
  KEY `fk_liga_has_pais_liga1_idx` (`liga_id`),
  CONSTRAINT `Um país deve ter uma liga` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`),
  CONSTRAINT `Uma liga deve estar em um ou muitos países` FOREIGN KEY (`liga_id`) REFERENCES `liga` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liga_pais`
--

LOCK TABLES `liga_pais` WRITE;
/*!40000 ALTER TABLE `liga_pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `liga_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) COLLATE utf8mb3_bin NOT NULL COMMENT 'Nome conhecido do país. Não representa o nome do político do estado apresentado, apenas como é popularmente conhecido.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posicao`
--

DROP TABLE IF EXISTS `posicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posicao` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) COLLATE utf8mb3_bin NOT NULL COMMENT 'Nome em inglês referente à posição que um jogador atua.',
  `nome_traduzido` varchar(64) COLLATE utf8mb3_bin NOT NULL COMMENT 'Valor traduzido.',
  `sigla` varchar(3) COLLATE utf8mb3_bin NOT NULL COMMENT 'Sigla em inglês que se refere ao nome da posição.',
  `sigla_traduzida` varchar(3) COLLATE utf8mb3_bin NOT NULL COMMENT 'Sigla em português que se refere ao nome traduzido da posição.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `sigla_traduzida_UNIQUE` (`sigla_traduzida`),
  UNIQUE KEY `nome_traduzido_UNIQUE` (`nome_traduzido`),
  UNIQUE KEY `nome_UNIQUE` (`nome`),
  UNIQUE KEY `sigla_UNIQUE` (`sigla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicao`
--

LOCK TABLES `posicao` WRITE;
/*!40000 ALTER TABLE `posicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `posicao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-29 10:37:29
