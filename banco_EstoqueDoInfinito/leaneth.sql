-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 10-Out-2018 às 19:44
-- Versão do servidor: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leaneth`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `razao_social` varchar(150) NOT NULL,
  `cnpj` varchar(150) NOT NULL,
  `id_usuarios` int(11) NOT NULL,
  `idAdministrador` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fantasia` varchar(150) NOT NULL,
  PRIMARY KEY (`idAdministrador`),
  KEY `idUsuarios` (`id_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `administrador`
--

INSERT INTO `administrador` (`razao_social`, `cnpj`, `id_usuarios`, `idAdministrador`, `nome_fantasia`) VALUES
('bla', '342342342323', 18, 12, 'bla'),
('bla', '984yr2y372937', 28, 13, 'bla'),
('bla', '342342342323', 29, 14, 'bla'),
('teste1508', '9876452778y', 30, 15, 'teste1508'),
('leaneth', '46587427649', 31, 16, 'leaneth'),
('jace&CIA', '342342342323', 35, 17, 'jace'),
('', '', 36, 18, ''),
('admin', 'admin', 39, 19, 'admin');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_loja`
--

DROP TABLE IF EXISTS `cliente_loja`;
CREATE TABLE IF NOT EXISTS `cliente_loja` (
  `nomeFantasia` varchar(150) DEFAULT NULL,
  `cnpj` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `razao_social` varchar(150) DEFAULT NULL,
  `telefone` varchar(150) DEFAULT NULL,
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `endereco` varchar(150) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente_loja`
--

INSERT INTO `cliente_loja` (`nomeFantasia`, `cnpj`, `email`, `razao_social`, `telefone`, `idCliente`, `endereco`) VALUES
('teste1508', '78436r32', 'prod 1508@gmail.com', 'teste1508', '34661936', 4, 'prod 1508');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cor`
--

DROP TABLE IF EXISTS `cor`;
CREATE TABLE IF NOT EXISTS `cor` (
  `id_cor` int(11) NOT NULL AUTO_INCREMENT,
  `cor` varchar(145) NOT NULL,
  PRIMARY KEY (`id_cor`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cor`
--

INSERT INTO `cor` (`id_cor`, `cor`) VALUES
(40, '37'),
(41, '40'),
(42, '37');

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
CREATE TABLE IF NOT EXISTS `forma_pagamento` (
  `descricao` varchar(150) DEFAULT NULL,
  `idFormaPagamento` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idFormaPagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagem`
--

DROP TABLE IF EXISTS `imagem`;
CREATE TABLE IF NOT EXISTS `imagem` (
  `id_imagem` int(11) NOT NULL AUTO_INCREMENT,
  `imagem` varchar(64) NOT NULL,
  PRIMARY KEY (`id_imagem`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `imagem`
--

INSERT INTO `imagem` (`id_imagem`, `imagem`) VALUES
(24, '270918021904cana de acucar.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `dataHora` varchar(150) DEFAULT NULL,
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `vend_id_vend` int(11) NOT NULL,
  `formPag_id_formPag` int(11) NOT NULL,
  `cliente_id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_pedido_vendedor1_idx` (`vend_id_vend`),
  KEY `fk_Pedido_forma_pagamento1_idx` (`formPag_id_formPag`),
  KEY `fk_Pedido_cliente_loja1_idx` (`cliente_id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `idProdutos` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `preco` varchar(150) DEFAULT NULL,
  `estoque` int(11) DEFAULT NULL,
  `estoque_min` int(11) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `referencia` int(15) NOT NULL,
  `idTipoProduto` int(11) NOT NULL,
  PRIMARY KEY (`idProdutos`),
  KEY `idTipoProduto` (`idTipoProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`idProdutos`, `nome`, `preco`, `estoque`, `estoque_min`, `descricao`, `referencia`, `idTipoProduto`) VALUES
(41, 'TESTE', '456', 65, 65, 'teste', 1212, 1),
(42, 'tseste', '5765', 64, 8, 'ghtgdfj', 656789, 3),
(44, 'TESTE', '456', 65, 65, 'teste', 1212, 1),
(45, 'TESTE', '456', 65, 65, 'teste', 1212, 1),
(46, 'TESTE', '200.00', 123, 45, 'teste de cadastro', 1212, 3),
(47, '1054', '373', 23, 2333, 'teste de cadastro', 1212, 3),
(48, '1118', '200.00', 34, 63, '', 547654, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `prod_cor`
--

DROP TABLE IF EXISTS `prod_cor`;
CREATE TABLE IF NOT EXISTS `prod_cor` (
  `prod_id_prod` int(11) NOT NULL,
  `cor_id_cor` int(11) NOT NULL,
  PRIMARY KEY (`prod_id_prod`,`cor_id_cor`),
  KEY `fk_produtos_has_cor_cor1_idx` (`cor_id_cor`),
  KEY `fk_produtos_has_cor_produtos1_idx` (`prod_id_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `prod_cor`
--

INSERT INTO `prod_cor` (`prod_id_prod`, `cor_id_cor`) VALUES
(46, 40),
(47, 41),
(48, 42);

-- --------------------------------------------------------

--
-- Estrutura da tabela `prod_imagem`
--

DROP TABLE IF EXISTS `prod_imagem`;
CREATE TABLE IF NOT EXISTS `prod_imagem` (
  `prod_id_prod` int(11) NOT NULL,
  `img_id_img` int(11) NOT NULL,
  PRIMARY KEY (`prod_id_prod`,`img_id_img`),
  KEY `fk_produtos_has_imagem_imagem1_idx` (`img_id_img`),
  KEY `fk_produtos_has_imagem_produtos1_idx` (`prod_id_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `prod_imagem`
--

INSERT INTO `prod_imagem` (`prod_id_prod`, `img_id_img`) VALUES
(48, 24);

-- --------------------------------------------------------

--
-- Estrutura da tabela `prod_tamanho`
--

DROP TABLE IF EXISTS `prod_tamanho`;
CREATE TABLE IF NOT EXISTS `prod_tamanho` (
  `tam_id_tam` int(11) NOT NULL,
  `prod_id_prod` int(11) NOT NULL,
  PRIMARY KEY (`tam_id_tam`,`prod_id_prod`),
  KEY `fk_tamanho_has_produtos_produtos1_idx` (`prod_id_prod`),
  KEY `fk_tamanho_has_produtos_tamanho1_idx` (`tam_id_tam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `prod_tamanho`
--

INSERT INTO `prod_tamanho` (`tam_id_tam`, `prod_id_prod`) VALUES
(34, 46),
(37, 47),
(38, 48);

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_venda`
--

DROP TABLE IF EXISTS `status_venda`;
CREATE TABLE IF NOT EXISTS `status_venda` (
  `descricao` varchar(150) DEFAULT NULL,
  `idStatusVenda` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id_admin` int(11) NOT NULL,
  PRIMARY KEY (`idStatusVenda`,`admin_id_admin`),
  KEY `fk_status_venda_administrador1_idx` (`admin_id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_venda_pedido`
--

DROP TABLE IF EXISTS `status_venda_pedido`;
CREATE TABLE IF NOT EXISTS `status_venda_pedido` (
  `idPedido` int(11) DEFAULT NULL,
  `idStatusVenda` int(11) DEFAULT NULL,
  `data_hora` varchar(150) DEFAULT NULL,
  KEY `idPedido` (`idPedido`),
  KEY `idStatusVenda` (`idStatusVenda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tamanho`
--

DROP TABLE IF EXISTS `tamanho`;
CREATE TABLE IF NOT EXISTS `tamanho` (
  `tamanho` varchar(5) DEFAULT NULL,
  `idTamanho` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idTamanho`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tamanho`
--

INSERT INTO `tamanho` (`tamanho`, `idTamanho`) VALUES
('0', 34),
('0', 35),
('0', 36),
('34', 37),
('37', 38),
('38', 39);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_produto`
--

DROP TABLE IF EXISTS `tipo_produto`;
CREATE TABLE IF NOT EXISTS `tipo_produto` (
  `tipo` varchar(150) DEFAULT NULL,
  `idTipoProduto` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idTipoProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipo_produto`
--

INSERT INTO `tipo_produto` (`tipo`, `idTipoProduto`) VALUES
('Calça', 1),
('Shorts', 2),
('Blusa', 3),
('Casaco', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `telefone` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `senha` varchar(150) DEFAULT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `idUsuarios` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`telefone`, `email`, `senha`, `nome`, `idUsuarios`) VALUES
('23424', 'admin@teste.com', '23423', 'TESTE 2 2', 18),
('34661936', 'newVend@teste.com', '123', 'newVend', 19),
('34661936', 'newVend@teste.com', '123', 'newVend', 20),
('34661936', 'belinha@gmail.com', '123', 'Belinha', 21),
('34661936', 'belinha@gmail.com', '123', 'Belinha', 22),
('34661936', 'gui@teste.com', '123', 'gui', 23),
('34661936', 'gui@teste.com', '123', 'gui', 24),
('34661936', 'bla@teste.com', '123', 'bla', 25),
('34661936', 'vend', '123', 'vend', 26),
('34661936', 'vend', '123', 'vend', 27),
('34661936', 'bla', '123', 'bla', 28),
('34661936', 'bla@teste.com', '123', 'bla', 29),
('34661936', 'teste1508@teste.com', '123', 'teste1508', 30),
('65432189', 'leaneth@teste.com', '123', 'leaneth', 31),
('836827638', 'joao@teste.com', '123', 'JoÃ£o', 32),
('836827638', 'joao@teste.com', '123', 'JoÃ£o', 33),
('836827638', 'joao@teste.com', '123', 'JoÃ£o', 34),
('34661936', 'jacr@gmail.com', '123', 'Jace', 35),
('', '', '', '', 36),
('34661936', 'clare@teste.com', '123', 'clare', 37),
('', '', '', '', 38),
('admin', 'admin@teste.com', 'admin', 'admin', 39);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas_produto`
--

DROP TABLE IF EXISTS `vendas_produto`;
CREATE TABLE IF NOT EXISTS `vendas_produto` (
  `idPedido` int(11) DEFAULT NULL,
  `idProdutos` int(11) DEFAULT NULL,
  `preco_negociado` varchar(10) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  KEY `idPedido` (`idPedido`),
  KEY `idProdutos` (`idProdutos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
CREATE TABLE IF NOT EXISTS `vendedor` (
  `idVendedor` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(150) DEFAULT NULL,
  `id_usuarios` int(11) DEFAULT NULL,
  `empresa` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`idVendedor`),
  KEY `idUsuarios` (`id_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`idVendedor`, `cpf`, `id_usuarios`, `empresa`) VALUES
(2, '6762736236', 28, 'bla'),
(3, '8263926', 34, 'Casa Sorriso'),
(4, '89076543', 37, 'clare@cia'),
(5, '', 38, '');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`idUsuarios`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_Pedido_cliente_loja1` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `cliente_loja` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pedido_forma_pagamento1` FOREIGN KEY (`formPag_id_formPag`) REFERENCES `forma_pagamento` (`idFormaPagamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_vendedor1` FOREIGN KEY (`vend_id_vend`) REFERENCES `vendedor` (`idVendedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`idTipoProduto`) REFERENCES `tipo_produto` (`idTipoProduto`);

--
-- Limitadores para a tabela `prod_cor`
--
ALTER TABLE `prod_cor`
  ADD CONSTRAINT `fk_produtos_has_cor_cor1` FOREIGN KEY (`cor_id_cor`) REFERENCES `cor` (`id_cor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produtos_has_cor_produtos1` FOREIGN KEY (`prod_id_prod`) REFERENCES `produtos` (`idProdutos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `prod_imagem`
--
ALTER TABLE `prod_imagem`
  ADD CONSTRAINT `fk_produtos_has_imagem_imagem1` FOREIGN KEY (`img_id_img`) REFERENCES `imagem` (`id_imagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produtos_has_imagem_produtos1` FOREIGN KEY (`prod_id_prod`) REFERENCES `produtos` (`idProdutos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `prod_tamanho`
--
ALTER TABLE `prod_tamanho`
  ADD CONSTRAINT `fk_tamanho_has_produtos_produtos1` FOREIGN KEY (`prod_id_prod`) REFERENCES `produtos` (`idProdutos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tamanho_has_produtos_tamanho1` FOREIGN KEY (`tam_id_tam`) REFERENCES `tamanho` (`idTamanho`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `status_venda`
--
ALTER TABLE `status_venda`
  ADD CONSTRAINT `fk_status_venda_administrador1` FOREIGN KEY (`admin_id_admin`) REFERENCES `administrador` (`idAdministrador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `status_venda_pedido`
--
ALTER TABLE `status_venda_pedido`
  ADD CONSTRAINT `status_venda_pedido_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
  ADD CONSTRAINT `status_venda_pedido_ibfk_2` FOREIGN KEY (`idStatusVenda`) REFERENCES `status_venda` (`idStatusVenda`);

--
-- Limitadores para a tabela `vendas_produto`
--
ALTER TABLE `vendas_produto`
  ADD CONSTRAINT `vendas_produto_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
  ADD CONSTRAINT `vendas_produto_ibfk_2` FOREIGN KEY (`idProdutos`) REFERENCES `produtos` (`idProdutos`);

--
-- Limitadores para a tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`idUsuarios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
