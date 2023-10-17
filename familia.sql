-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Out-2023 às 14:24
-- Versão do servidor: 8.0.28
-- versão do PHP: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `familia`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Banir` (IN `FDP` INT)  BEGIN
	DELETE from filhos where filho_id=FDP;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `filhos` ()  BEGIN
	select filhos.filho_id as INDICE, filhos.filho_nome as CRIANCAS from filhos;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `gerafilho` (IN `Filho` VARCHAR(10), IN `Gen` INT)  BEGIN
	insert into filhos(filho_nome,pai) values(Filho,Gen);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mudafilho` (IN `Apelido` VARCHAR(20), IN `Ind` INT)  BEGIN
	UPDATE filhos set filho_nome = Apelido where filho_id=Ind;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pais` ()  BEGIN
	SELECT pais.pai_id as INDICE, pais.pai_nome as ADULTOS from pais;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `filhos`
--

CREATE TABLE `filhos` (
  `filho_id` int NOT NULL,
  `filho_nome` varchar(55) COLLATE utf8_swedish_ci NOT NULL,
  `pai` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `filhos`
--

INSERT INTO `filhos` (`filho_id`, `filho_nome`, `pai`) VALUES
(1, 'zezinho', 1),
(2, 'zelinha duncan', 1),
(3, 'joazinho', 2),
(4, 'joaninha', 2),
(5, 'chiquinho', 3),
(7, 'Zenildo', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `maes`
--

CREATE TABLE `maes` (
  `mae_id` int NOT NULL,
  `nome_mae` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pais`
--

CREATE TABLE `pais` (
  `pai_id` int NOT NULL,
  `pai_nome` varchar(20) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `pais`
--

INSERT INTO `pais` (`pai_id`, `pai_nome`) VALUES
(1, 'JOSE'),
(2, 'JOãO'),
(3, 'FRANCISCO');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `filhos`
--
ALTER TABLE `filhos`
  ADD PRIMARY KEY (`filho_id`),
  ADD KEY `fk_pai` (`pai`);

--
-- Índices para tabela `maes`
--
ALTER TABLE `maes`
  ADD PRIMARY KEY (`mae_id`);

--
-- Índices para tabela `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`pai_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `filhos`
--
ALTER TABLE `filhos`
  MODIFY `filho_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `maes`
--
ALTER TABLE `maes`
  MODIFY `mae_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pais`
--
ALTER TABLE `pais`
  MODIFY `pai_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `filhos`
--
ALTER TABLE `filhos`
  ADD CONSTRAINT `fk_pai` FOREIGN KEY (`pai`) REFERENCES `pais` (`pai_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
