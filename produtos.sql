-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/01/2025 às 14:27
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

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`produto_id`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `idx_produtos_nome` (`nome`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
