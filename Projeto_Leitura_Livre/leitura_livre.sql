-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/11/2025 às 20:47
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `leitura_livre`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `autor`
--

CREATE TABLE `autor` (
  `id_autor` int(11) NOT NULL,
  `nome_completo` varchar(100) NOT NULL,
  `nacionalidade` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `autor`
--

INSERT INTO `autor` (`id_autor`, `nome_completo`, `nacionalidade`) VALUES
(1, 'Machado de Assis', 'Brasileira'),
(2, 'George Orwell', 'Britânica');

-- --------------------------------------------------------

--
-- Estrutura para tabela `autoria`
--

CREATE TABLE `autoria` (
  `id_obra` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL,
  `tipo_participacao` varchar(50) DEFAULT 'Autor Principal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `autoria`
--

INSERT INTO `autoria` (`id_obra`, `id_autor`, `tipo_participacao`) VALUES
(1, 1, 'Autor Principal'),
(2, 2, 'Autor Principal');

-- --------------------------------------------------------

--
-- Estrutura para tabela `editora`
--

CREATE TABLE `editora` (
  `id_editora` int(11) NOT NULL,
  `nome_fantasia` varchar(100) NOT NULL,
  `email_contato` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `editora`
--

INSERT INTO `editora` (`id_editora`, `nome_fantasia`, `email_contato`) VALUES
(1, 'Editora Alpha', 'contato@alpha.com'),
(2, 'Editora Beta', 'sac@beta.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimo`
--

CREATE TABLE `emprestimo` (
  `id_emprestimo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `data_retirada` date NOT NULL,
  `data_prevista_devolucao` date NOT NULL,
  `data_real_devolucao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `emprestimo`
--

INSERT INTO `emprestimo` (`id_emprestimo`, `id_usuario`, `data_retirada`, `data_prevista_devolucao`, `data_real_devolucao`) VALUES
(1, 1, '2025-11-27', '2025-12-12', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `exemplar`
--

CREATE TABLE `exemplar` (
  `id_exemplar` int(11) NOT NULL,
  `id_obra` int(11) NOT NULL,
  `codigo_tombo` varchar(20) NOT NULL,
  `estado_conservacao` varchar(50) DEFAULT NULL,
  `status` enum('Disponível','Emprestado','Manutenção','Extraviado') DEFAULT 'Disponível'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `exemplar`
--

INSERT INTO `exemplar` (`id_exemplar`, `id_obra`, `codigo_tombo`, `estado_conservacao`, `status`) VALUES
(1, 1, 'LIV-001', NULL, 'Disponível'),
(2, 1, 'LIV-002', NULL, 'Emprestado'),
(3, 2, 'LIV-003', NULL, 'Disponível');

-- --------------------------------------------------------

--
-- Estrutura para tabela `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `genero`
--

INSERT INTO `genero` (`id_genero`, `descricao`) VALUES
(1, 'Ficção'),
(2, 'Técnico'),
(3, 'Romance');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_emprestimo`
--

CREATE TABLE `item_emprestimo` (
  `id_item` int(11) NOT NULL,
  `id_emprestimo` int(11) NOT NULL,
  `id_exemplar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item_emprestimo`
--

INSERT INTO `item_emprestimo` (`id_item`, `id_emprestimo`, `id_exemplar`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `multa`
--

CREATE TABLE `multa` (
  `id_multa` int(11) NOT NULL,
  `id_emprestimo` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_geracao` date NOT NULL,
  `status_pagamento` enum('Pendente','Pago','Isento') DEFAULT 'Pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `obra`
--

CREATE TABLE `obra` (
  `id_obra` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `ano_publicacao` int(11) DEFAULT NULL,
  `id_editora` int(11) NOT NULL,
  `id_genero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `obra`
--

INSERT INTO `obra` (`id_obra`, `titulo`, `isbn`, `ano_publicacao`, `id_editora`, `id_genero`) VALUES
(1, 'Dom Casmurro', '9788500001', 1899, 1, 3),
(2, '1984', '9788500002', 1949, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefone_usuario`
--

CREATE TABLE `telefone_usuario` (
  `id_telefone` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `tipo` varchar(20) DEFAULT 'Celular'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `telefone_usuario`
--

INSERT INTO `telefone_usuario` (`id_telefone`, `id_usuario`, `numero`, `tipo`) VALUES
(1, 1, '(11) 99999-8888', 'Celular');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` char(11) NOT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `cpf`, `logradouro`, `cidade`, `uf`) VALUES
(1, 'João Estudante', '11122233344', NULL, 'São Paulo', 'SP');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autor`);

--
-- Índices de tabela `autoria`
--
ALTER TABLE `autoria`
  ADD PRIMARY KEY (`id_obra`,`id_autor`),
  ADD KEY `id_autor` (`id_autor`);

--
-- Índices de tabela `editora`
--
ALTER TABLE `editora`
  ADD PRIMARY KEY (`id_editora`);

--
-- Índices de tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD PRIMARY KEY (`id_emprestimo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `exemplar`
--
ALTER TABLE `exemplar`
  ADD PRIMARY KEY (`id_exemplar`),
  ADD UNIQUE KEY `codigo_tombo` (`codigo_tombo`),
  ADD KEY `id_obra` (`id_obra`);

--
-- Índices de tabela `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Índices de tabela `item_emprestimo`
--
ALTER TABLE `item_emprestimo`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_emprestimo` (`id_emprestimo`),
  ADD KEY `id_exemplar` (`id_exemplar`);

--
-- Índices de tabela `multa`
--
ALTER TABLE `multa`
  ADD PRIMARY KEY (`id_multa`),
  ADD KEY `id_emprestimo` (`id_emprestimo`);

--
-- Índices de tabela `obra`
--
ALTER TABLE `obra`
  ADD PRIMARY KEY (`id_obra`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `id_editora` (`id_editora`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Índices de tabela `telefone_usuario`
--
ALTER TABLE `telefone_usuario`
  ADD PRIMARY KEY (`id_telefone`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `editora`
--
ALTER TABLE `editora`
  MODIFY `id_editora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  MODIFY `id_emprestimo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `exemplar`
--
ALTER TABLE `exemplar`
  MODIFY `id_exemplar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `item_emprestimo`
--
ALTER TABLE `item_emprestimo`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `multa`
--
ALTER TABLE `multa`
  MODIFY `id_multa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `obra`
--
ALTER TABLE `obra`
  MODIFY `id_obra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `telefone_usuario`
--
ALTER TABLE `telefone_usuario`
  MODIFY `id_telefone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `autoria`
--
ALTER TABLE `autoria`
  ADD CONSTRAINT `autoria_ibfk_1` FOREIGN KEY (`id_obra`) REFERENCES `obra` (`id_obra`),
  ADD CONSTRAINT `autoria_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`);

--
-- Restrições para tabelas `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Restrições para tabelas `exemplar`
--
ALTER TABLE `exemplar`
  ADD CONSTRAINT `exemplar_ibfk_1` FOREIGN KEY (`id_obra`) REFERENCES `obra` (`id_obra`);

--
-- Restrições para tabelas `item_emprestimo`
--
ALTER TABLE `item_emprestimo`
  ADD CONSTRAINT `item_emprestimo_ibfk_1` FOREIGN KEY (`id_emprestimo`) REFERENCES `emprestimo` (`id_emprestimo`),
  ADD CONSTRAINT `item_emprestimo_ibfk_2` FOREIGN KEY (`id_exemplar`) REFERENCES `exemplar` (`id_exemplar`);

--
-- Restrições para tabelas `multa`
--
ALTER TABLE `multa`
  ADD CONSTRAINT `multa_ibfk_1` FOREIGN KEY (`id_emprestimo`) REFERENCES `emprestimo` (`id_emprestimo`);

--
-- Restrições para tabelas `obra`
--
ALTER TABLE `obra`
  ADD CONSTRAINT `obra_ibfk_1` FOREIGN KEY (`id_editora`) REFERENCES `editora` (`id_editora`),
  ADD CONSTRAINT `obra_ibfk_2` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`);

--
-- Restrições para tabelas `telefone_usuario`
--
ALTER TABLE `telefone_usuario`
  ADD CONSTRAINT `telefone_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
