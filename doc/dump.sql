-- phpMyAdmin SQL Dump
-- version 4.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 08-Abr-2015 às 07:35
-- Versão do servidor: 5.6.23
-- PHP Version: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: pharma
--

DROP DATABASE IF EXISTS pharma;
CREATE DATABASE IF NOT EXISTS pharma DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE pharma;

-- --------------------------------------------------------

--
-- Estrutura da tabela dp_goya
--

DROP TABLE IF EXISTS dp_goya;
CREATE TABLE IF NOT EXISTS dp_goya (
  ean varchar(254) NOT NULL,
  medicamento varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela dp_goya
--

INSERT INTO dp_goya (ean, medicamento) VALUES
  ('7896637023375', 'ALOIS 10MG 30 COMP. (C1)'),
  ('7896637024402', 'ALOIS 10MG 60 COMP. (C1)'),
  ('7896637025553', 'ALOIS 10MG 120 COMP.REV. (C1)'),
  ('7896637025218', 'ALOIS 10MG 50 COMP.REV. (C1)'),
  ('7896637017022', 'ARPADOL 400MG 30 COMP.'),
  ('7896637018012', 'ARTANE 2MG 30 COMP. (B1)'),
  ('7896637018029', 'ARTANE 5MG 30 COMP. (B1)'),
  ('7896637022729', 'AZULFIN 500MG 60 COMP.'),
  ('7896637024358', 'COLCHIS 0,5MG 30 COMP.'),
  ('7896637024365', 'COLCHIS 1MG 30 COMP.'),
  ('7896637026178', 'DESOL SOL.10ML'),
  ('7896637026185', 'DESOL SOL.20ML'),
  ('7896637022033', 'DESTILBENOL 1MG 50 COMP.'),
  ('7896637026222', 'DIGELIV 30 SACHES 2G'),
  ('7896637025423', 'DOBEVEN 500MG 30 CAPS.'),
  ('7896637023979', 'DONAREN 100MG 30 COMP. (C1)'),
  ('7896637023610', 'DONAREN RETARD 150MG 20 COMP.(C1)'),
  ('7896637022767', 'DONAREN 50MG 60 COMP. (C1)'),
  ('7896637022583', 'ETOXIN 50MG XPE 120ML (C1)'),
  ('7896637017176', 'FITOSCAR POMADA 20G'),
  ('7896637023139', 'FLANCOX 300MG 30 COMP.'),
  ('7896637023146', 'FLANCOX 300MG 14 COMP.'),
  ('7896637023344', 'FLANCOX 400MG 10 COMP.'),
  ('7896637022446', 'FLANCOX 400MG 20 COMP.'),
  ('7896637026505', 'FOLINE 60 COMP.'),
  ('7896637022316', 'INIBINA 10MG 20 COMP.'),
  ('7896637024020', 'INIBINA 10MG 30 COMP.'),
  ('7896637022903', 'LABIRIN 16MG 30 COMP.'),
  ('7896637023771', 'LABIRIN 24MG 30 COMP.'),
  ('7896637022897', 'LABIRIN 8MG 30 COMP.'),
  ('7896637026307', 'LACTOSIL 10.000 FCC 30 SACHES 2G'),
  ('7896637026291', 'LACTOSIL 4.000 FCC 30 SACHES 2G'),
  ('7896637022989', 'LEVOXIN 250MG 3 COMP.(A)'),
  ('7896637022996', 'LEVOXIN 250MG 7 COMP.(A)'),
  ('7896637023108', 'LEVOXIN 500MG 10 COMP.(A)'),
  ('7896637023764', 'LEVOXIN 500MG 14 COMP.(A)'),
  ('7896637023092', 'LEVOXIN 500MG 3 COMP.(A)'),
  ('7896637023009', 'LEVOXIN 500MG 7 COMP.(A)'),
  ('7896637022415', 'LITOCIT 10MEQ CX C/60 CP OR'),
  ('7896637022408', 'LITOCIT 5 mEq 60 comp.'),
  ('7896637023443', 'LONIUM 40MG 30 COMP.'),
  ('7896637023450', 'LONIUM 40MG 60 COMP.'),
  ('7896637023115', 'MECLIN 25MG 15 COMP.'),
  ('7896637023641', 'MECLIN 50MG 15 COMP.'),
  ('7896637023665', 'MIOSAN 10MG 10 COMP.'),
  ('7896637022842', 'MIOSAN 10MG 30 COMP.'),
  ('7896637023658', 'MIOSAN 5MG 10 COMP.'),
  ('7896637022835', 'MIOSAN 5MG 30 COMP.'),
  ('7896637025102', 'MIOSAN CAF 10/60MG 15 CPR'),
  ('7896637025096', 'MIOSAN CAF 5/30MG 15 CPR'),
  ('7896637022774', 'MOMENT 0,025% CR.50G'),
  ('7896637022781', 'MOMENT 0,075% CR.50G'),
  ('7896637023122', 'MOMENT 0,025% LOCAO 60ML ROLL-ON'),
  ('7896637022439', 'OTO-XILODASE FR 8ML+AMP.'),
  ('7896637025362', 'POSTEC POMADA 20G'),
  ('7896637025225', 'PRIMID 100MG 100 COMP. (C1)'),
  ('7896637025232', 'PRIMID 250MG 20 COMP. (C1)'),
  ('7896637022552', 'RETEMIC 5MG 30 COMP.'),
  ('7896637022569', 'RETEMIC 5MG 60 COMP.'),
  ('7896637023566', 'RETEMIC UD 10MG 30 COMP.'),
  ('7896637022576', 'RETEMIC  XPE 120ML'),
  ('7896637023047', 'REUQUINOL 400MG 30 COMP.'),
  ('7896637015011', 'TOMAT 30 CAPS.'),
  ('7896637022811', 'TRIANCIL 20MG/ML INJ.5 AMP.1ML'),
  ('7896637022804', 'TRIANCIL 20MG/ML INJ. FR. 5ML'),
  ('7896637022750', 'UNOPROST 1MG 20 COMP.'),
  ('7896637022910', 'UNOPROST 2MG 30 COMP.'),
  ('7896637023849', 'UNOPROST 4MG 30 COMP.'),
  ('7896637023580', 'URO-VAXOM 6MG 30 CAPS.'),
  ('7896637022644', 'YOMAX 5,4MG 60 COMP.');

-- --------------------------------------------------------

--
-- Estrutura da tabela dp_oficial
--

DROP TABLE IF EXISTS dp_oficial;
CREATE TABLE IF NOT EXISTS dp_oficial (
  ean varchar(254) NOT NULL,
  medicamento varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela dp_oficial
--

INSERT INTO dp_oficial (ean, medicamento) VALUES
  ('7896637023375', 'ALOIS 10MG CPR 1X30'),
  ('7896637024402', 'ALOIS 10MG CPR 1X60'),
  ('7896637025553', 'ALOIS 10MG CPR REV 1X120'),
  ('7896637025218', 'ALOIS 10MG CPR REV 1X50'),
  ('7896637017022', 'ARPADOL 400MG CPR 1X30'),
  ('7896637018012', 'ARTANE 2MG CPR 1X30'),
  ('7896637018029', 'ARTANE 5MG CPR 1X30'),
  ('7896637022729', 'AZULFIN 500MG CPR 1X60'),
  ('7896637023481', 'BENEPAX 30MG CPR 1x20'),
  ('7896637016056', 'CLORID MEMANTINA 10MG CPR 1X60'),
  ('7896637024358', 'COLCHIS 0,5MG CPR 1X30'),
  ('7896637024365', 'COLCHIS 1MG CPR 1X30'),
  ('7896637026178', 'DESOL FRC 10ML'),
  ('7896637026185', 'DESOL FRC 20ML'),
  ('7896637022033', 'DESTILBENOL 1MG CPR 1X50'),
  ('7896637026222', 'DIGELIV SCH 30X2G 400 FCC GALU'),
  ('7896637025423', 'DOBEVEN 500MG CPR 1X30'),
  ('7896637023979', 'DONAREN 100MG CPR REV 1X30'),
  ('7896637023610', 'DONAREN 150MG CPR REV 1X20'),
  ('7896637022767', 'DONAREN 50MG CPR 1X60'),
  ('7896637022583', 'ETOXIN 50MG XPE 120ML APS'),
  ('7896637017176', 'FITOSCAR 60MG POM 20G'),
  ('7896637023139', 'FLANCOX 300MG CPR 1X30'),
  ('7896637023146', 'FLANCOX 300MG CPR REV 1X14'),
  ('7896637023344', 'FLANCOX 400MG CPR REV 1X10'),
  ('7896637022446', 'FLANCOX 400MG CPR REV 1X20'),
  ('7896637026505', 'FOLINE CPR 1X60'),
  ('7896637022231', 'HYALOZIMA 2000 3DOSES'),
  ('7896637022279', 'HYALOZIMA 20000 3DOSES'),
  ('7896637022316', 'INIBINA 10MG CPR 1X20'),
  ('7896637024020', 'INIBINA 10MG CPR 1X30'),
  ('7896637022903', 'LABIRIN 16MG CPR 1X30'),
  ('7896637023771', 'LABIRIN 24MG CPR 1X30'),
  ('7896637022897', 'LABIRIN 8MG CPR 1X30'),
  ('7896637026307', 'LACTOSIL SCH 30X2G 10000 FCC ALU'),
  ('7896637026291', 'LACTOSIL SCH 30X2G 4000 FCC ALU'),
  ('7896637022989', 'LEVOXIN 250MG CPR 1X3'),
  ('7896637022996', 'LEVOXIN 250MG CPR 1X7'),
  ('7896637023108', 'LEVOXIN 500MG CPR 1X10'),
  ('7896637023764', 'LEVOXIN 500MG CPR 1X14'),
  ('7896637023092', 'LEVOXIN 500MG CPR 1X3'),
  ('7896637023009', 'LEVOXIN 500MG CPR 1X7'),
  ('7896637022415', 'LITOCIT 10MEQ CPR 1X60'),
  ('7896637022408', 'LITOCIT 5MEQ CPR 1X60'),
  ('7896637023443', 'LONIUM 40MG CPR 1X30'),
  ('7896637023450', 'LONIUM 40MG CPR 1X60'),
  ('7896637023115', 'MECLIN 25MG CPR 1X15'),
  ('7896637023641', 'MECLIN 50MG CPR 1X15'),
  ('7896637017107', 'MENTALIV 200MG 20 CAPS'),
  ('7896637023665', 'MIOSAN 10MG CPR 1X10'),
  ('7896637022842', 'MIOSAN 10MG CPR REV 1X30'),
  ('7896637023658', 'MIOSAN 5MG CPR REV 1X10'),
  ('7896637022835', 'MIOSAN 5MG CPR REV 1X30'),
  ('7896637025102', 'MIOSAN CAF 10MG CPR 1X15'),
  ('7896637025096', 'MIOSAN CAF 5MG CPR 1X15'),
  ('7896637022774', 'MOMENT 0.025% CR TOPICO 1X1'),
  ('7896637022781', 'MOMENT 0.075% CR TOPICO 1X1'),
  ('7896637023122', 'MOMENT LOC TOPICO 60ML'),
  ('7896637022439', 'OTO XILODASE GTS 8ML'),
  ('7896637025362', 'POSTEC UTR POM 20G'),
  ('7896637025225', 'PRIMID 100MG CPR 1X100'),
  ('7896637025232', 'PRIMID 250MG CPR 1X20'),
  ('7896637022552', 'RETEMIC 5MG CPR 1X30'),
  ('7896637022569', 'RETEMIC 5MG CPR 1X60'),
  ('7896637023566', 'RETEMIC UD 10MG CPR 1X30'),
  ('7896637022576', 'RETEMIC XPE 120ML'),
  ('7896637023047', 'REUQUINOL 400MG CPR 1X30'),
  ('7896637022880', 'SEIS-B 300MG CPR 1X20'),
  ('7896637015011', 'TOMAT 5MG CPS 1X30'),
  ('7896637022811', 'TRIANCIL 20MG INJ 5AMP 1 ML'),
  ('7896637022804', 'TRIANCIL 20MG INJ 5ML'),
  ('7896637022750', 'UNOPROST 1MG CPR 1X20'),
  ('7896637022910', 'UNOPROST 2MG CPR 1X30'),
  ('7896637023849', 'UNOPROST 4MG CPR 1X30'),
  ('7896637023580', 'URO VAXOM 6MG CPS 1X30'),
  ('7896637022651', 'XILODASE POM 15G'),
  ('7896637022668', 'XILODASE POM 30G'),
  ('7896637022644', 'YOMAX 5.4MG CPR 1X60');

-- --------------------------------------------------------

--
-- Estrutura da tabela dp_profarma
--

DROP TABLE IF EXISTS dp_profarma;
CREATE TABLE IF NOT EXISTS dp_profarma (
  ean varchar(254) NOT NULL,
  medicamento varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela dp_profarma
--

INSERT INTO dp_profarma (ean, medicamento) VALUES
  ('7896637023375', 'ALOIS 10MG C/30'),
  ('7896637024402', 'ALOIS 10MG C/60 COM'),
  ('7896637025553', 'ALOIS 10MG C/120'),
  ('7896637025218', 'ALOIS 10MG C/50'),
  ('7896637017022', 'ARPADOL 400MG C/30 COM'),
  ('7896637018012', 'ARTANE 2MG C/30 COM.'),
  ('7896637018029', 'ARTANE 5MG COM C/30'),
  ('7896637022729', 'AZULFIN 500MG C/60 COM.REV.'),
  ('7896637024358', 'COLCHIS 0,5MG C/30 COM'),
  ('7896637024365', 'COLCHIS 1MG C/ 30 COM.'),
  ('7896637026178', 'DESOL 1FR. 10ML'),
  ('7896637026185', 'DESOL 1FR. 20ML'),
  ('7896637022033', 'DESTILBENOL 1MG C/50 COM.'),
  ('7896637026222', 'DIGELIV 30SACHES 2G 400FCC'),
  ('7896637025423', 'DOBEVEN 500MG C/30COMP'),
  ('7896637023979', 'DONAREN 100MG C/30'),
  ('7896637023610', 'DONAREN RET.150MG C/20'),
  ('7896637022767', 'DONAREN 50MG C/60 COM.'),
  ('7896637022583', 'ETOXIN 50MG/1ML FR 120ML'),
  ('7896637017176', 'FITOSCAR 60MG BG.C/20G'),
  ('7896637023139', 'FLANCOX 300MG C/ 30'),
  ('7896637023146', 'FLANCOX 300 MG C/14'),
  ('7896637023344', 'FLANCOX 400MG C/10 COM.'),
  ('7896637022446', 'FLANCOX 400MG C/ 20'),
  ('7896637026505', 'FOLINE C/60 CAPSULAS'),
  ('7896637022316', 'INIBINA 10 MG C/20 COM'),
  ('7896637024020', 'INIBINA 10 MG C/30 COM'),
  ('7896637022903', 'LABIRIN 16MG C/30 COM.'),
  ('7896637023771', 'LABIRIN 24MG C/30'),
  ('7896637022897', 'LABIRIN 8MG C/30 COM.'),
  ('7896637026307', 'LACTOSIL 30SACHES 2G 10.000'),
  ('7896637026291', 'LACTOSIL 30SACHES 2G 4.000'),
  ('7896637022989', 'LEVOXIN 250MG C/3 COM.'),
  ('7896637022996', 'LEVOXIN 250MG C/7 COM.'),
  ('7896637023108', 'LEVOXIN 500MG C/10 COM'),
  ('7896637023764', 'LEVOXIN 500MG C/14'),
  ('7896637023092', 'LEVOXIN 500MG C/3 COM.'),
  ('7896637023009', 'LEVOXIN 500MG C/7 COM.'),
  ('7896637022415', 'LITOCIT 10MEQ C/60 COM.'),
  ('7896637022408', 'LITOCIT 5MEQ C/60 COM.'),
  ('7896637023443', 'LONIUM 40MG C/30'),
  ('7896637023450', 'LONIUM 40MG C/60'),
  ('7896637023115', 'MECLIN 25MG C/15'),
  ('7896637023641', 'MECLIN 50MG C/ 15 COM'),
  ('7896637023665', 'MIOSAN 10MG C/ 10'),
  ('7896637022842', 'MIOSAN 10MG COM.REV. C/30'),
  ('7896637023658', 'MIOSAN 5MG C/ 10'),
  ('7896637022835', 'MIOSAN 5MG COM.REV. C/30'),
  ('7896637025102', 'MIOSAN CAF 10MG/60MG C/15'),
  ('7896637025096', 'MIOSAN CAF 5MG/30MG C/15'),
  ('7896637022774', 'MOMENT 0,025% BNG.50G'),
  ('7896637022781', 'MOMENT 0,075% BNG.50G'),
  ('7896637023122', 'MOMENT 0,025% ROLL ON 60ML'),
  ('7896637022439', 'OTO-XILODASE GTS 8 ML'),
  ('7896637025362', 'POSTEC 150 UTR 2,5MG/G 20G'),
  ('7896637025225', 'PRIMID 100MG C/100'),
  ('7896637025232', 'PRIMID 250MG C/20 COM'),
  ('7896637022552', 'RETEMIC 5MG C/30 COM'),
  ('7896637022569', 'RETEMIC C/60 COM'),
  ('7896637023566', 'RETEMIC UD 10MG C/ 30'),
  ('7896637022576', 'RETEMIC XPE.120ML'),
  ('7896637023047', 'REUQUINOL 400MG C/30'),
  ('7896637015011', 'TOMAT 5MG C/30 CAPS.'),
  ('7896637022811', 'TRIANCIL 20MG C/5 AMP 1ML'),
  ('7896637022804', 'TRIANCIL 20MG C/1 AMP 5ML'),
  ('7896637022750', 'UNOPROST 1MG C/20 COM.'),
  ('7896637022910', 'UNOPROST 2MG C/30 COM.'),
  ('7896637023849', 'UNOPROST 4MG C/30 COM'),
  ('7896637023580', 'URO-VAXOM 6MG C/30 CAP'),
  ('7896637022644', 'YOMAX 5,4MG C/60 COM'),
  ('7896637016056', 'MEMANTINA 10MG C60 APS');

-- --------------------------------------------------------

--
-- Estrutura da tabela log
--

DROP TABLE IF EXISTS log;
CREATE TABLE IF NOT EXISTS log (
  log_id int(11) NOT NULL,
  log_date datetime DEFAULT NULL,
  log_user varchar(100) DEFAULT NULL,
  log_import varchar(50) DEFAULT NULL,
  log_action varchar(50) DEFAULT NULL,
  log_msg varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela stack
--

DROP TABLE IF EXISTS stack;
CREATE TABLE IF NOT EXISTS stack (
  id int(11) NOT NULL,
  user varchar(50) DEFAULT NULL,
  distributor varchar(100) DEFAULT NULL,
  date datetime DEFAULT NULL,
  period datetime DEFAULT NULL,
  pathorigem varchar(512) DEFAULT NULL,
  pathdestino varchar(512) DEFAULT NULL,
  status int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela stackitem
--

DROP TABLE IF EXISTS stackitem;
CREATE TABLE IF NOT EXISTS stackitem (
  stackID bigint(128) NOT NULL,
  distribuidor varchar(100) DEFAULT NULL,
  cd varchar(100) DEFAULT NULL,
  apresentacao varchar(512) DEFAULT NULL,
  ean varchar(45) DEFAULT NULL,
  tipo varchar(45) DEFAULT NULL,
  info varchar(50) NOT NULL,
  valor double DEFAULT NULL,
  periodo datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view view_estoque
--
DROP VIEW IF EXISTS view_estoque;
CREATE TABLE IF NOT EXISTS view_estoque (
   apresentacao varchar(512)
  ,cd varchar(100)
  ,distribuidor varchar(100)
  ,ean varchar(254)
  ,info varchar(50)
  ,periodo datetime
  ,tipo varchar(45)
  ,valor double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view view_estoque_ean
--
DROP VIEW IF EXISTS view_estoque_ean;
CREATE TABLE IF NOT EXISTS view_estoque_ean (
   apresentacao varchar(254)
  ,cd varchar(100)
  ,distribuidor varchar(100)
  ,ean varchar(254)
  ,info varchar(50)
  ,periodo datetime
  ,tipo varchar(45)
  ,valor double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view view_venda
--
DROP VIEW IF EXISTS view_venda;
CREATE TABLE IF NOT EXISTS view_venda (
   apresentacao varchar(512)
  ,cd varchar(100)
  ,distribuidor varchar(100)
  ,ean varchar(254)
  ,info varchar(50)
  ,periodo datetime
  ,tipo varchar(45)
  ,valor double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view view_venda_ean
--
DROP VIEW IF EXISTS view_venda_ean;
CREATE TABLE IF NOT EXISTS view_venda_ean (
   apresentacao varchar(254)
  ,cd varchar(100)
  ,distribuidor varchar(100)
  ,ean varchar(254)
  ,info varchar(50)
  ,periodo datetime
  ,tipo varchar(45)
  ,valor double
);

-- --------------------------------------------------------

--
-- Structure for view view_estoque
--
DROP TABLE IF EXISTS view_estoque;

CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW view_estoque AS select stackitem.apresentacao AS apresentacao,stackitem.cd AS cd,stackitem.distribuidor AS distribuidor,dp_goya.ean AS ean,stackitem.info AS info,stackitem.periodo AS periodo,stackitem.tipo AS tipo,stackitem.valor AS valor from (stackitem join dp_goya on((stackitem.apresentacao = dp_goya.medicamento))) where ((ucase(stackitem.distribuidor) = 'GOYAS') and (ucase(stackitem.tipo) = 'ESTOQUE')) union all select stackitem.apresentacao AS apresentacao,stackitem.cd AS cd,stackitem.distribuidor AS distribuidor,dp_profarma.ean AS ean,stackitem.info AS info,stackitem.periodo AS periodo,stackitem.tipo AS tipo,stackitem.valor AS valor from (stackitem join dp_profarma on((stackitem.apresentacao = dp_profarma.medicamento))) where ((ucase(stackitem.distribuidor) = 'PROFARMA') and (ucase(stackitem.tipo) = 'ESTOQUE')) union all select stackitem.apresentacao AS apresentacao,stackitem.cd AS cd,stackitem.distribuidor AS distribuidor,stackitem.ean AS ean,stackitem.info AS info,stackitem.periodo AS periodo,stackitem.tipo AS tipo,stackitem.valor AS valor from stackitem where ((ucase(stackitem.distribuidor) not in ('GOYAS','PROFARMA')) and (ucase(stackitem.tipo) = 'ESTOQUE'));

-- --------------------------------------------------------

--
-- Structure for view view_estoque_ean
--
DROP TABLE IF EXISTS view_estoque_ean;

CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW view_estoque_ean AS select dp_oficial.medicamento AS apresentacao,view_estoque.cd AS cd,view_estoque.distribuidor AS distribuidor,dp_oficial.ean AS ean,view_estoque.info AS info,view_estoque.periodo AS periodo,view_estoque.tipo AS tipo,view_estoque.valor AS valor from (view_estoque join dp_oficial on((view_estoque.ean = dp_oficial.ean)));

-- --------------------------------------------------------

--
-- Structure for view view_venda
--
DROP TABLE IF EXISTS view_venda;

CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW view_venda AS select stackitem.apresentacao AS apresentacao,stackitem.cd AS cd,stackitem.distribuidor AS distribuidor,dp_goya.ean AS ean,stackitem.info AS info,stackitem.periodo AS periodo,stackitem.tipo AS tipo,stackitem.valor AS valor from (stackitem join dp_goya on((stackitem.apresentacao = dp_goya.medicamento))) where ((ucase(stackitem.distribuidor) = 'GOYAS') and (ucase(stackitem.tipo) = 'VENDA')) union all select stackitem.apresentacao AS apresentacao,stackitem.cd AS cd,stackitem.distribuidor AS distribuidor,dp_profarma.ean AS ean,stackitem.info AS info,stackitem.periodo AS periodo,stackitem.tipo AS tipo,stackitem.valor AS valor from (stackitem join dp_profarma on((stackitem.apresentacao = dp_profarma.medicamento))) where ((ucase(stackitem.distribuidor) = 'PROFARMA') and (ucase(stackitem.tipo) = 'VENDA')) union all select stackitem.apresentacao AS apresentacao,stackitem.cd AS cd,stackitem.distribuidor AS distribuidor,stackitem.ean AS ean,stackitem.info AS info,stackitem.periodo AS periodo,stackitem.tipo AS tipo,stackitem.valor AS valor from stackitem where ((ucase(stackitem.distribuidor) not in ('GOYAS','PROFARMA')) and (ucase(stackitem.tipo) = 'VENDA'));

-- --------------------------------------------------------

--
-- Structure for view view_venda_ean
--
DROP TABLE IF EXISTS view_venda_ean;

CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW view_venda_ean AS select dp_oficial.medicamento AS apresentacao,view_venda.cd AS cd,view_venda.distribuidor AS distribuidor,dp_oficial.ean AS ean,view_venda.info AS info,view_venda.periodo AS periodo,view_venda.tipo AS tipo,view_venda.valor AS valor from (view_venda join dp_oficial on((view_venda.ean = dp_oficial.ean)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table log
--
ALTER TABLE log
ADD PRIMARY KEY (log_id);

--
-- Indexes for table stack
--
ALTER TABLE stack
ADD PRIMARY KEY (id);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table log
--
ALTER TABLE log
MODIFY log_id int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table stack
--
ALTER TABLE stack
MODIFY id int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
