-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/02/2025 às 11:40
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
-- Banco de dados: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacoes`
--

CREATE TABLE `avaliacoes` (
  `avaliacao_id` int(11) NOT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `nota` int(11) NOT NULL CHECK (`nota` between 1 and 5),
  `comentario` text DEFAULT NULL,
  `data_avaliacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `nome`, `descricao`) VALUES
(1, 'Marvel', 'Action figures da Marvel, com personagens dos quadrinhos e filmes.'),
(2, 'DC', 'Action figures da DC, com personagens dos quadrinhos e filmes.'),
(3, 'Star Wars', 'Action figures baseadas no universo de Star Wars.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `endereco_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `rua` varchar(255) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `produto_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `data_atualizacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_pedido`
--

CREATE TABLE `itens_pedido` (
  `item_id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `pagamento_id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `valor_pago` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `data_pagamento` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `pedido_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `data_pedido` datetime DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `produto_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `imagem_url` varchar(255) DEFAULT NULL,
  `peso` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cep_origem` varchar(8) NOT NULL DEFAULT '01001000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`produto_id`, `nome`, `descricao`, `preco`, `estoque`, `categoria_id`, `imagem_url`, `peso`, `cep_origem`) VALUES
(1, 'Iron Man - Action Figure', 'Action figure do Homem de Ferro com traje de batalha. Movimentos articulados e detalhes incríveis.', 299.99, 15, 1, 'https://www.fantoy.com.br/media/catalog/product/cache/5070b15b05522f191912dd31c57262ab/a/o/aou_im5-min.jpg', 0.50, '01001000'),
(2, 'Captain America - Action Figure', 'Action figure do Capitão América com escudo e roupas detalhadas. Ideal para colecionadores.', 249.99, 20, 1, 'https://www.fantoy.com.br/media/catalog/product/cache/5070b15b05522f191912dd31c57262ab/c/a/capamerica1.jpg', 0.50, '01001000'),
(3, 'Spider-Man - Action Figure', 'Action figure do Homem-Aranha com teia de aranha e vários acessórios.', 199.99, 30, 1, 'https://www.fantoy.com.br/media/catalog/product/cache/5070b15b05522f191912dd31c57262ab/n/o/noir-min_1.jpg', 0.40, '01001000'),
(4, 'Thor - Action Figure', 'Action figure do Thor com martelo Mjolnir e capa detalhada.', 279.99, 25, 1, 'https://www.fantoy.com.br/media/catalog/product/cache/5070b15b05522f191912dd31c57262ab/2/4/242-min_10.jpg', 0.60, '01001000'),
(5, 'Black Panther - Action Figure', 'Action figure do Pantera Negra com armamento e detalhes precisos.', 329.99, 18, 1, 'https://www.fantoy.com.br/media/catalog/product/cache/5070b15b05522f191912dd31c57262ab/k/i/killm.jpg', 0.50, '01001000'),
(6, 'Batman - Action Figure', 'Action figure do Batman com capa e acessórios de combate.', 259.99, 12, 2, 'https://www.fantoy.com.br/media/catalog/product/cache/5070b15b05522f191912dd31c57262ab/1/0/100-min_1_2.jpg', 0.60, '01001000'),
(7, 'Superman - Action Figure', 'Action figure do Superman com detalhes de musculatura e capa fluida.', 269.99, 22, 2, 'https://www.fantoy.com.br/media/catalog/product/cache/5070b15b05522f191912dd31c57262ab/s/u/superman_the_movie-min.jpg', 0.50, '01001000'),
(8, 'Wonder Woman - Action Figure', 'Action figure da Mulher Maravilha com espada e braceletes.', 219.99, 17, 2, 'https://www.fantoy.com.br/media/catalog/product/cache/5070b15b05522f191912dd31c57262ab/w/o/wonder_woman-min_1.jpg', 0.50, '01001000'),
(9, 'Darth Vader - Action Figure', 'Action figure do Darth Vader com sabre de luz e capa.', 349.99, 10, 3, 'https://www.fantoy.com.br/media/catalog/product/cache/5070b15b05522f191912dd31c57262ab/v/a/vader_3.jpg', 0.70, '01001000'),
(10, 'Stormtrooper - Action Figure', 'Action figure do Stormtrooper com arma e armadura clássica.', 149.99, 40, 3, 'https://www.fantoy.com.br/media/catalog/product/cache/5070b15b05522f191912dd31c57262ab/a/s/ashigaru_stormtrooper.jpg', 0.40, '01001000');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_criacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nome`, `email`, `senha`, `telefone`, `data_criacao`) VALUES
(1, 'kayky de souza', 'email@gmail.com', '$2y$10$J4WAgMspanP4ARCrh.tyv.qn9LP8AHM/Y/Riv8hhDA//kJ3aJErCq', NULL, '2025-02-03 08:04:43'),
(2, 'kayky de souza', 'email2@gmail.com', '$2y$10$trCC021ObW/YUrYE88Y2wOTi1zXZoaDRno2RqHMbNYbaXEyg/Gra2', NULL, '2025-02-03 08:24:34'),
(3, 'teste', 'teste@gmail.com', '$2y$10$bb0TSSIzhDCph2HZGSrTvur/cRhy/lvlecqfvJNOoc8ldY6tv2rlG', NULL, '2025-02-04 08:10:50');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD PRIMARY KEY (`avaliacao_id`),
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Índices de tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`endereco_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`produto_id`);

--
-- Índices de tabela `itens_pedido`
--
ALTER TABLE `itens_pedido`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `idx_itens_pedido_pedido_id` (`pedido_id`);

--
-- Índices de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`pagamento_id`),
  ADD KEY `idx_pagamentos_pedido_id` (`pedido_id`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedido_id`),
  ADD KEY `idx_pedidos_usuario_id` (`usuario_id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`produto_id`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `idx_produtos_nome` (`nome`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  MODIFY `avaliacao_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `endereco_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itens_pedido`
--
ALTER TABLE `itens_pedido`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `pagamento_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedido_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`produto_id`),
  ADD CONSTRAINT `avaliacoes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`);

--
-- Restrições para tabelas `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`);

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`produto_id`);

--
-- Restrições para tabelas `itens_pedido`
--
ALTER TABLE `itens_pedido`
  ADD CONSTRAINT `itens_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`),
  ADD CONSTRAINT `itens_pedido_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`produto_id`);

--
-- Restrições para tabelas `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`);

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
