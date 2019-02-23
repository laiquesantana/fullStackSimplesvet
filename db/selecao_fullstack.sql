CREATE DATABASE  IF NOT EXISTS `selecao_fullstack` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `selecao_fullstack`;


DROP TABLE IF EXISTS `animais`;
DROP TABLE IF EXISTS `racas`;


CREATE TABLE `racas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `situacao` enum('ATI','INA') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP PROCEDURE IF EXISTS `selecao_fullstack`.`atualizar`;

DELIMITER $$
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
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `selecao_fullstack`.`criar`;
DELIMITER $$
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
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS`selecao_fullstack`.`atualicar_racas`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualicar_racas`(
	IN p_nome varchar(100),
	IN p_raca_id INT(11),
	IN p_situacao ENUM('ATI', 'INA'))
BEGIN
    update racas 
     SET 
     nome = p_nome,
     situacao = p_situacao
	 WHERE  id = p_raca_id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS`selecao_fullstack`.`criar_racas`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `criar_racas`(
	IN p_nome varchar(100),
	IN p_situacao ENUM('ATI', 'INA'))
BEGIN
    insert into racas (nome ,
    situacao) 
    values (p_nome ,p_situacao);
END$$
DELIMITER ;




DROP FUNCTION IF EXISTS`selecao_fullstack`.`CALCULADATANASCIMENTO`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `CALCULADATANASCIMENTO`(data_nascimento DATETIME) RETURNS int(11)
BEGIN
DECLARE idade INT;
DECLARE data_atual DATETIME;
	set data_atual = NOW();
	set idade = TIMESTAMPDIFF(DAY,data_nascimento,data_atual); 
RETURN idade;
END$$
DELIMITER ;





DROP VIEW IF EXISTS `selecao_fullstack`.`listar`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `selecao_fullstack`.`listar` AS select `selecao_fullstack`.`racas`.`situacao` AS `situacao_raca`,`selecao_fullstack`.`racas`.`nome` AS `nome_raca`,`pet`.`id` AS `id`,`pet`.`nome` AS `nome`,`pet`.`raca_id` AS `raca`,`pet`.`chip` AS `chip`,`pet`.`data_nascimento` AS `data_nascimento`,`pet`.`data_atualizacao` AS `data_atualizacao`,`pet`.`data_falecimento` AS `data_falecimento`,`pet`.`sexo` AS `sexo`,`pet`.`especie` AS `especie`,`CALCULADATANASCIMENTO`(`pet`.`data_nascimento`) AS `idade`,(case when (`pet`.`data_falecimento` is not null) then 'morto' else 'vivo' end) AS `situacao` from (`selecao_fullstack`.`animais` `pet` join `selecao_fullstack`.`racas`) where (`pet`.`raca_id` = `selecao_fullstack`.`racas`.`id`);





