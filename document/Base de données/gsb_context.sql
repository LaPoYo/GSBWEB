-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le : ven. 03 juin 2022 à 11:38
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsb_context`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite_compl`
--

DROP TABLE IF EXISTS `activite_compl`;
CREATE TABLE IF NOT EXISTS `activite_compl` (
  `AC_NUM` varchar(0) DEFAULT NULL,
  `AC_DATE` varchar(0) DEFAULT NULL,
  `AC_LIEU` varchar(0) DEFAULT NULL,
  `AC_THEME` varchar(0) DEFAULT NULL,
  `AC_MOTIF` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `composant`
--

DROP TABLE IF EXISTS `composant`;
CREATE TABLE IF NOT EXISTS `composant` (
  `CMP_CODE` varchar(0) DEFAULT NULL,
  `CMP_LIBELLE` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `constituer`
--

DROP TABLE IF EXISTS `constituer`;
CREATE TABLE IF NOT EXISTS `constituer` (
  `MED_DEPOTLEGAL` varchar(0) DEFAULT NULL,
  `CMP_CODE` varchar(0) DEFAULT NULL,
  `CST_QTE` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `departement_id` int(11) NOT NULL AUTO_INCREMENT,
  `departement_code` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `departement_nom` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `departement_nom_uppercase` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `departement_slug` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `departement_nom_soundex` varchar(20) DEFAULT NULL,
  `reg_code` varchar(255) DEFAULT NULL,
  `num_region` int(11) DEFAULT NULL,
  PRIMARY KEY (`departement_id`),
  KEY `departement_slug` (`departement_slug`),
  KEY `departement_code` (`departement_code`),
  KEY `departement_nom_soundex` (`departement_nom_soundex`),
  KEY `reg_code` (`reg_code`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`departement_id`, `departement_code`, `departement_nom`, `departement_nom_uppercase`, `departement_slug`, `departement_nom_soundex`, `reg_code`, `num_region`) VALUES
(1, '01', 'Ain', 'AIN', 'ain', 'A500', 'RA', 20),
(7, '07', 'Ardèche', 'ARDÈCHE', 'ardeche', 'A632', 'RA', 20),
(27, '26', 'Drôme', 'DRÔME', 'drome', 'D650', 'RA', 20),
(39, '38', 'Isère', 'ISÈRE', 'isere', 'I260', 'RA', 20),
(43, '42', 'Loire', 'LOIRE', 'loire', 'L600', 'RA', 20),
(70, '69', 'Rhône', 'RHÔNE', 'rhone', 'R500', 'RA', 20),
(74, '73', 'Savoie', 'SAVOIE', 'savoie', 'S100', 'RA', 20),
(75, '74', 'Haute-Savoie', 'HAUTE-SAVOIE', 'haute-savoie', 'H321', 'RA', 20),
(45, '44', 'Loire-Atlantique', 'LOIRE-ATLANTIQUE', 'loire-atlantique', 'L634532', 'PL', 19),
(50, '49', 'Maine-et-Loire', 'MAINE-ET-LOIRE', 'maine-et-loire', 'M346', 'PL', 19),
(54, '53', 'Mayenne', 'MAYENNE', 'mayenne', 'M000', 'PL', 19),
(73, '72', 'Sarthe', 'SARTHE', 'sarthe', 'S630', 'PL', 19),
(86, '85', 'Vendée', 'VENDÉE', 'vendee', 'V530', 'PL', 19),
(2, '02', 'Aisne', 'AISNE', 'aisne', 'A250', 'PI', 18),
(61, '60', 'Oise', 'OISE', 'oise', 'O200', 'PI', 18),
(81, '80', 'Somme', 'SOMME', 'somme', 'S500', 'PI', 18),
(16, '16', 'Charente', 'CHARENTE', 'charente', 'C653', 'PC', 17),
(17, '17', 'Charente-Maritime', 'CHARENTE-MARITIME', 'charente-maritime', 'C6535635', 'PC', 17),
(80, '79', 'Deux-Sèvres', 'DEUX-SÈVRES', 'deux-sevres', 'D2162', 'PC', 17),
(87, '86', 'Vienne', 'VIENNE', 'vienne', 'V500', 'PC', 17),
(5, '05', 'Hautes-Alpes', 'HAUTES-ALPES', 'hautes-alpes', 'H32412', 'PA', 16),
(4, '04', 'Alpes-de-Haute-Provence', 'ALPES-DE-HAUTE-PROVENCE', 'alpes-de-haute-provence', 'A412316152', 'PA', 16),
(6, '06', 'Alpes-Maritimes', 'ALPES-MARITIMES', 'alpes-maritimes', 'A41256352', 'PA', 16),
(13, '13', 'Bouches-du-Rhône', 'BOUCHES-DU-RHÔNE', 'bouches-du-rhone', 'B2365', 'PA', 16),
(84, '83', 'Var', 'VAR', 'var', 'V600', 'PA', 16),
(85, '84', 'Vaucluse', 'VAUCLUSE', 'vaucluse', 'V242', 'PA', 16),
(60, '59', 'Nord', 'NORD', 'nord', 'N630', 'NP', 15),
(63, '62', 'Pas-de-Calais', 'PAS-DE-CALAIS', 'pas-de-calais', 'P23242', 'NP', 15),
(9, '09', 'Ariège', 'ARIÈGE', 'ariege', 'A620', 'MP', 14),
(11, '11', 'Aude', 'AUDE', 'aude', 'A300', 'MP', 14),
(12, '12', 'Aveyron', 'AVEYRON', 'aveyron', 'A165', 'MP', 14),
(31, '30', 'Gard', 'GARD', 'gard', 'G630', 'MP', 14),
(32, '31', 'Haute-Garonne', 'HAUTE-GARONNE', 'haute-garonne', 'H3265', 'MP', 14),
(33, '32', 'Gers', 'GERS', 'gers', 'G620', 'MP', 14),
(35, '34', 'Hérault', 'HÉRAULT', 'herault', 'H643', 'MP', 14),
(47, '46', 'Lot', 'LOT', 'lot', 'L300', 'MP', 14),
(49, '48', 'Lozère', 'LOZÈRE', 'lozere', 'L260', 'MP', 14),
(66, '65', 'Hautes-Pyrénées', 'HAUTES-PYRÉNÉES', 'hautes-pyrenees', 'H321652', 'MP', 14),
(82, '81', 'Tarn', 'TARN', 'tarn', 'T650', 'MP', 14),
(83, '82', 'Tarn-et-Garonne', 'TARN-ET-GARONNE', 'tarn-et-garonne', 'T653265', 'MP', 14),
(19, '19', 'Corrèze', 'CORRÈZE', 'correze', 'C620', 'LI', 13),
(24, '23', 'Creuse', 'CREUSE', 'creuse', 'C620', 'LI', 13),
(88, '87', 'Haute-Vienne', 'HAUTE-VIENNE', 'haute-vienne', 'H315', 'LI', 13),
(76, '75', 'Paris', 'PARIS', 'paris', 'P620', 'IF', 11),
(78, '77', 'Seine-et-Marne', 'SEINE-ET-MARNE', 'seine-et-marne', 'S53565', 'IF', 11),
(79, '78', 'Yvelines', 'YVELINES', 'yvelines', 'Y1452', 'IF', 11),
(92, '91', 'Essonne', 'ESSONNE', 'essonne', 'E250', 'IF', 11),
(93, '92', 'Hauts-de-Seine', 'HAUTS-DE-SEINE', 'hauts-de-seine', 'H32325', 'IF', 11),
(94, '93', 'Seine-Saint-Denis', 'SEINE-SAINT-DENIS', 'seine-saint-denis', 'S525352', 'IF', 11),
(95, '94', 'Val-de-Marne', 'VAL-DE-MARNE', 'val-de-marne', 'V43565', 'IF', 11),
(96, '95', 'Val-d\'oise', 'VAL-D\'OISE', 'val-doise', 'V432', 'IF', 11),
(28, '27', 'Eure', 'EURE', 'eure', 'E600', 'HN', 10),
(77, '76', 'Seine-Maritime', 'SEINE-MARITIME', 'seine-maritime', 'S5635', 'HN', 10),
(26, '25', 'Doubs', 'DOUBS', 'doubs', 'D120', 'FC', 9),
(40, '39', 'Jura', 'JURA', 'jura', 'J600', 'FC', 9),
(71, '70', 'Haute-Saône', 'HAUTE-SAÔNE', 'haute-saone', 'H325', 'FC', 9),
(18, '18', 'Cher', 'CHER', 'cher', 'C600', 'CE', 8),
(29, '28', 'Eure-et-Loir', 'EURE-ET-LOIR', 'eure-et-loir', 'E6346', 'CE', 8),
(37, '36', 'Indre', 'INDRE', 'indre', 'I536', 'CE', 8),
(38, '37', 'Indre-et-Loire', 'INDRE-ET-LOIRE', 'indre-et-loire', 'I536346', 'CE', 8),
(42, '41', 'Loir-et-Cher', 'LOIR-ET-CHER', 'loir-et-cher', 'L6326', 'CE', 8),
(46, '45', 'Loiret', 'LOIRET', 'loiret', 'L630', 'CE', 8),
(8, '08', 'Ardennes', 'ARDENNES', 'ardennes', 'A6352', 'CA', 7),
(10, '10', 'Aube', 'AUBE', 'aube', 'A100', 'CA', 7),
(52, '51', 'Marne', 'MARNE', 'marne', 'M650', 'CA', 7),
(53, '52', 'Haute-Marne', 'HAUTE-MARNE', 'haute-marne', 'H3565', 'CA', 7),
(22, '21', 'Côte-d\'or', 'CÔTE-D\'OR', 'cote-dor', 'C360', 'BO', 6),
(59, '58', 'Nièvre', 'NIÈVRE', 'nievre', 'N160', 'BO', 6),
(72, '71', 'Saône-et-Loire', 'SAÔNE-ET-LOIRE', 'saone-et-loire', 'S5346', 'BO', 6),
(90, '89', 'Yonne', 'YONNE', 'yonne', 'Y500', 'BO', 6),
(14, '14', 'Calvados', 'CALVADOS', 'calvados', 'C4132', 'BN', 5),
(51, '50', 'Manche', 'MANCHE', 'manche', 'M200', 'BN', 5),
(62, '61', 'Orne', 'ORNE', 'orne', 'O650', 'BN', 5),
(23, '22', 'Côtes-d\'armor', 'CÔTES-D\'ARMOR', 'cotes-darmor', 'C323656', 'BG', 4),
(30, '29', 'Finistère', 'FINISTÈRE', 'finistere', 'F5236', 'BG', 4),
(36, '35', 'Ile-et-Vilaine', 'ILE-ET-VILAINE', 'ile-et-vilaine', 'I43145', 'BG', 4),
(57, '56', 'Morbihan', 'MORBIHAN', 'morbihan', 'M615', 'BG', 4),
(3, '03', 'Allier', 'ALLIER', 'allier', 'A460', 'AU', 3),
(15, '15', 'Cantal', 'CANTAL', 'cantal', 'C534', 'AU', 3),
(44, '43', 'Haute-Loire', 'HAUTE-LOIRE', 'haute-loire', 'H346', 'AU', 3),
(64, '63', 'Puy-de-Dôme', 'PUY-DE-DÔME', 'puy-de-dome', 'P350', 'AU', 3),
(25, '24', 'Dordogne', 'DORDOGNE', 'dordogne', 'D6325', 'AQ', 2),
(34, '33', 'Gironde', 'GIRONDE', 'gironde', 'G653', 'AQ', 2),
(41, '40', 'Landes', 'LANDES', 'landes', 'L532', 'AQ', 2),
(48, '47', 'Lot-et-Garonne', 'LOT-ET-GARONNE', 'lot-et-garonne', 'L3265', 'AQ', 2),
(65, '64', 'Pyrénées-Atlantiques', 'PYRÉNÉES-ATLANTIQUES', 'pyrenees-atlantiques', 'P65234532', 'AQ', 2),
(67, '66', 'Pyrénées-Orientales', 'PYRÉNÉES-ORIENTALES', 'pyrenees-orientales', 'P65265342', 'AQ', 2),
(55, '54', 'Meurthe-et-Moselle', 'MEURTHE-ET-MOSELLE', 'meurthe-et-moselle', 'M63524', 'AL', 1),
(56, '55', 'Meuse', 'MEUSE', 'meuse', 'M200', 'AL', 1),
(58, '57', 'Moselle', 'MOSELLE', 'moselle', 'M240', 'AL', 1),
(68, '67', 'Bas-Rhin', 'BAS-RHIN', 'bas-rhin', 'B265', 'AL', 1),
(69, '68', 'Haut-Rhin', 'HAUT-RHIN', 'haut-rhin', 'H365', 'AL', 1),
(89, '88', 'Vosges', 'VOSGES', 'vosges', 'V200', 'AL', 1),
(91, '90', 'Territoire de Belfort', 'TERRITOIRE DE BELFORT', 'territoire-de-belfort', 'T636314163', 'AL', 1),
(20, '2a', 'Corse-du-sud', 'CORSE-DU-SUD', 'corse-du-sud', 'C62323', NULL, NULL),
(21, '2b', 'Haute-corse', 'HAUTE-CORSE', 'haute-corse', 'H3262', NULL, NULL),
(97, '976', 'Mayotte', 'MAYOTTE', 'mayotte', 'M300', NULL, NULL),
(98, '971', 'Guadeloupe', 'GUADELOUPE', 'guadeloupe', 'G341', NULL, NULL),
(99, '973', 'Guyane', 'GUYANE', 'guyane', 'G500', NULL, NULL),
(100, '972', 'Martinique', 'MARTINIQUE', 'martinique', 'M6352', NULL, NULL),
(101, '974', 'Réunion', 'RÉUNION', 'reunion', 'R500', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `dosage`
--

DROP TABLE IF EXISTS `dosage`;
CREATE TABLE IF NOT EXISTS `dosage` (
  `DOS_CODE` varchar(0) DEFAULT NULL,
  `DOS_QUANTITE` varchar(0) DEFAULT NULL,
  `DOS_UNITE` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

DROP TABLE IF EXISTS `famille`;
CREATE TABLE IF NOT EXISTS `famille` (
  `FAM_CODE` varchar(3) DEFAULT NULL,
  `FAM_LIBELLE` varchar(67) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `famille`
--

INSERT INTO `famille` (`FAM_CODE`, `FAM_LIBELLE`) VALUES
('AA', 'Antalgiques en association'),
('AAA', 'Antalgiques antipyrétiques en association'),
('AAC', 'Antidépresseur d\'action centrale'),
('AAH', 'Antivertigineux antihistaminique H1'),
('ABA', 'Antibiotique antituberculeux'),
('ABC', 'Antibiotique antiacnéique local'),
('ABP', 'Antibiotique de la famille des béta-lactamines (pénicilline A)'),
('AFC', 'Antibiotique de la famille des cyclines'),
('AFM', 'Antibiotique de la famille des macrolides'),
('AH', 'Antihistaminique H1 local'),
('AIM', 'Antidépresseur imipraminique (tricyclique)'),
('AIN', 'Antidépresseur inhibiteur sélectif de la recapture de la sérotonine'),
('ALO', 'Antibiotique local (ORL)'),
('ANS', 'Antidépresseur IMAO non sélectif'),
('AO', 'Antibiotique ophtalmique'),
('AP', 'Antipsychotique normothymique'),
('AUM', 'Antibiotique urinaire minute'),
('CRT', 'Corticoïde, antibiotique et antifongique à  usage local'),
('HYP', 'Hypnotique antihistaminique'),
('PSA', 'Psychostimulant, antiasthénique'),
('AA', 'Antalgiques en association'),
('AAA', 'Antalgiques antipyrétiques en association'),
('AAC', 'Antidépresseur d\'action centrale'),
('AAH', 'Antivertigineux antihistaminique H1'),
('ABA', 'Antibiotique antituberculeux'),
('ABC', 'Antibiotique antiacnéique local'),
('ABP', 'Antibiotique de la famille des béta-lactamines (pénicilline A)'),
('AFC', 'Antibiotique de la famille des cyclines'),
('AFM', 'Antibiotique de la famille des macrolides'),
('AH', 'Antihistaminique H1 local'),
('AIM', 'Antidépresseur imipraminique (tricyclique)'),
('AIN', 'Antidépresseur inhibiteur sélectif de la recapture de la sérotonine'),
('ALO', 'Antibiotique local (ORL)'),
('ANS', 'Antidépresseur IMAO non sélectif'),
('AO', 'Antibiotique ophtalmique'),
('AP', 'Antipsychotique normothymique'),
('AUM', 'Antibiotique urinaire minute'),
('CRT', 'Corticoïde, antibiotique et antifongique à  usage local'),
('HYP', 'Hypnotique antihistaminique'),
('PSA', 'Psychostimulant, antiasthénique');

-- --------------------------------------------------------

--
-- Structure de la table `formuler`
--

DROP TABLE IF EXISTS `formuler`;
CREATE TABLE IF NOT EXISTS `formuler` (
  `MED_DEPOTLEGAL` varchar(0) DEFAULT NULL,
  `PRE_CODE` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `interagir`
--

DROP TABLE IF EXISTS `interagir`;
CREATE TABLE IF NOT EXISTS `interagir` (
  `MED_PERTURBATEUR` varchar(0) DEFAULT NULL,
  `MED_MED_PERTURBE` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `inviter`
--

DROP TABLE IF EXISTS `inviter`;
CREATE TABLE IF NOT EXISTS `inviter` (
  `AC_NUM` varchar(0) DEFAULT NULL,
  `PRA_NUM` varchar(0) DEFAULT NULL,
  `SPECIALISTEON` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `labo`
--

DROP TABLE IF EXISTS `labo`;
CREATE TABLE IF NOT EXISTS `labo` (
  `LAB_CODE` varchar(2) DEFAULT NULL,
  `LAB_NOM` varchar(10) DEFAULT NULL,
  `LAB_CHEFVENTE` varchar(17) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `labo`
--

INSERT INTO `labo` (`LAB_CODE`, `LAB_NOM`, `LAB_CHEFVENTE`) VALUES
('BC', 'Bichat', 'Suzanne Terminus'),
('GY', 'Gyverny', 'Marcel MacDouglas'),
('SW', 'Swiss Kane', 'Alain Poutre'),
('BC', 'Bichat', 'Suzanne Terminus'),
('GY', 'Gyverny', 'Marcel MacDouglas'),
('SW', 'Swiss Kane', 'Alain Poutre');

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `MED_DEPOTLEGAL` varchar(9) DEFAULT NULL,
  `MED_NOMCOMMERCIAL` varchar(19) DEFAULT NULL,
  `FAM_CODE` varchar(3) DEFAULT NULL,
  `MED_COMPOSITION` varchar(80) DEFAULT NULL,
  `MED_EFFETS` varchar(194) DEFAULT NULL,
  `MED_CONTREINDIC` varchar(236) DEFAULT NULL,
  `MED_PRIXECHANTILLON` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`MED_DEPOTLEGAL`, `MED_NOMCOMMERCIAL`, `FAM_CODE`, `MED_COMPOSITION`, `MED_EFFETS`, `MED_CONTREINDIC`, `MED_PRIXECHANTILLON`) VALUES
('3MYC7', 'TRIMYCINE', 'CRT', 'Triamcinolone (acétonide) + Néomycine + Nystatine', 'Ce médicament est un corticoïde à  activité forte ou très forte associé à  un antibiotique et un antifongique, utilisé en application locale dans certaines atteintes cutanées surinfectées.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, d\'infections de la peau ou de parasitisme non traités, d\'acné. Ne pas appliquer sur une plaie, ni sous un pansement occlusif.', ''),
('ADIMOL9', 'ADIMOL', 'ABP', 'Amoxicilline + Acide clavulanique', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie aux pénicillines ou aux céphalosporines.', ''),
('AMOPIL7', 'AMOPIL', 'ABP', 'Amoxicilline', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie aux pénicillines. Il doit être administré avec prudence en cas d\'allergie aux céphalosporines.', ''),
('AMOX45', 'AMOXAR', 'ABP', 'Amoxicilline', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'La prise de ce médicament peut rendre positifs les tests de dépistage du dopage.', ''),
('AMOXIG12', 'AMOXI Gé', 'ABP', 'Amoxicilline', 'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie aux pénicillines. Il doit être administré avec prudence en cas d\'allergie aux céphalosporines.', ''),
('APATOUX22', 'APATOUX Vitamine C', 'ALO', 'Tyrothricine + Tétracaïne + Acide ascorbique (Vitamine C)', 'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, en cas de phénylcétonurie et chez l\'enfant de moins de 6 ans.', ''),
('BACTIG10', 'BACTIGEL', 'ABC', 'Erythromycine', 'Ce médicament est utilisé en application locale pour traiter l\'acné et les infections cutanées bactériennes associées.', 'Ce médicament est contre-indiqué en cas d\'allergie aux antibiotiques de la famille des macrolides ou des lincosanides.', ''),
('BACTIV13', 'BACTIVIL', 'AFM', 'Erythromycine', 'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie aux macrolides (dont le chef de file est l\'érythromycine).', ''),
('BITALV', 'BIVALIC', 'AAA', 'Dextropropoxyphène + Paracétamol', 'Ce médicament est utilisé pour traiter les douleurs d\'intensité modérée ou intense.', 'Ce médicament est contre-indiqué en cas d\'allergie aux médicaments de cette famille, d\'insuffisance hépatique ou d\'insuffisance rénale.', ''),
('CARTION6', 'CARTION', 'AAA', 'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol', 'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', 'Ce médicament est contre-indiqué en cas de troubles de la coagulation (tendances aux hémorragies), d\'ulcère gastroduodénal, maladies graves du foie.', ''),
('CLAZER6', 'CLAZER', 'AFM', 'Clarithromycine', 'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques. Il est également utilisé dans le traitement de l\'ulcère gastro-duodénal, en association avec d\'autres médicaments.', 'Ce médicament est contre-indiqué en cas d\'allergie aux macrolides (dont le chef de file est l\'érythromycine).', ''),
('DEPRIL9', 'DEPRAMIL', 'AIM', 'Clomipramine', 'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères, certaines douleurs rebelles, les troubles obsessionnels compulsifs et certaines énurésies chez l\'enfant.', 'Ce médicament est contre-indiqué en cas de glaucome ou d\'adénome de la prostate, d\'infarctus récent, ou si vous avez reà§u un traitement par IMAO durant les 2 semaines précédentes ou en cas d\'allergie aux antidépresseurs imipraminiques.', ''),
('DIMIRTAM6', 'DIMIRTAM', 'AAC', 'Mirtazapine', 'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères.', 'La prise de ce produit est contre-indiquée en cas de d\'allergie à  l\'un des constituants.', ''),
('DOLRIL7', 'DOLORIL', 'AAA', 'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol', 'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', 'Ce médicament est contre-indiqué en cas d\'allergie au paracétamol ou aux salicylates.', ''),
('DORNOM8', 'NORMADOR', 'HYP', 'Doxylamine', 'Ce médicament est utilisé pour traiter l\'insomnie chez l\'adulte.', 'Ce médicament est contre-indiqué en cas de glaucome, de certains troubles urinaires (rétention urinaire) et chez l\'enfant de moins de 15 ans.', ''),
('EQUILARX6', 'EQUILAR', 'AAH', 'Méclozine', 'Ce médicament est utilisé pour traiter les vertiges et pour prévenir le mal des transports.', 'Ce médicament ne doit pas être utilisé en cas d\'allergie au produit, en cas de glaucome ou de rétention urinaire.', ''),
('EVILR7', 'EVEILLOR', 'PSA', 'Adrafinil', 'Ce médicament est utilisé pour traiter les troubles de la vigilance et certains symptomes neurologiques chez le sujet agé.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants.', ''),
('INSXT5', 'INSECTIL', 'AH', 'Diphénydramine', 'Ce médicament est utilisé en application locale sur les piqûres d\'insecte et l\'urticaire.', 'Ce médicament est contre-indiqué en cas d\'allergie aux antihistaminiques.', ''),
('JOVAI8', 'JOVENIL', 'AFM', 'Josamycine', 'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie aux macrolides (dont le chef de file est l\'érythromycine).', ''),
('LIDOXY23', 'LIDOXYTRACINE', 'AFC', 'Oxytétracycline +Lidocaïne', 'Ce médicament est utilisé en injection intramusculaire pour traiter certaines infections spécifiques.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants. Il ne doit pas être associé aux rétinoïdes.', ''),
('LITHOR12', 'LITHORINE', 'AP', 'Lithium', 'Ce médicament est indiqué dans la prévention des psychoses maniaco-dépressives ou pour traiter les états maniaques.', 'Ce médicament ne doit pas être utilisé si vous êtes allergique au lithium. Avant de prendre ce traitement, signalez à  votre médecin traitant si vous souffrez d\'insuffisance rénale, ou si vous avez un régime sans sel.', ''),
('PARMOL16', 'PARMOCODEINE', 'AA', 'Codéine + Paracétamol', 'Ce médicament est utilisé pour le traitement des douleurs lorsque des antalgiques simples ne sont pas assez efficaces.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, chez l\'enfant de moins de 15 Kg, en cas d\'insuffisance hépatique ou respiratoire, d\'asthme, de phénylcétonurie et chez la femme qui allaite.', ''),
('PHYSOI8', 'PHYSICOR', 'PSA', 'Sulbutiamine', 'Ce médicament est utilisé pour traiter les baisses d\'activité physique ou psychique, souvent dans un contexte de dépression.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants.', ''),
('PIRIZ8', 'PIRIZAN', 'ABA', 'Pyrazinamide', 'Ce médicament est utilisé, en association à  d\'autres antibiotiques, pour traiter la tuberculose.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, d\'insuffisance rénale ou hépatique, d\'hyperuricémie ou de porphyrie.', ''),
('POMDI20', 'POMADINE', 'AO', 'Bacitracine', 'Ce médicament est utilisé pour traiter les infections oculaires de la surface de l\'oeil.', 'Ce médicament est contre-indiqué en cas d\'allergie aux antibiotiques appliqués localement.', ''),
('TROXT21', 'TROXADET', 'AIN', 'Paroxétine', 'Ce médicament est utilisé pour traiter la dépression et les troubles obsessionnels compulsifs. Il peut également être utilisé en prévention des crises de panique avec ou sans agoraphobie.', 'Ce médicament est contre-indiqué en cas d\'allergie au produit.', ''),
('TXISOL22', 'TOUXISOL Vitamine C', 'ALO', 'Tyrothricine + Acide ascorbique (Vitamine C)', 'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', 'Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants et chez l\'enfant de moins de 6 ans.', ''),
('URIEG6', 'URIREGUL', 'AUM', 'Fosfomycine trométamol', 'Ce médicament est utilisé pour traiter les infections urinaires simples chez la femme de moins de 65 ans.', 'La prise de ce médicament est contre-indiquée en cas d\'allergie à  l\'un des constituants et d\'insuffisance rénale.', '');

-- --------------------------------------------------------

--
-- Structure de la table `offrir`
--

DROP TABLE IF EXISTS `offrir`;
CREATE TABLE IF NOT EXISTS `offrir` (
  `VIS_MATRICULE` varchar(3) DEFAULT NULL,
  `RAP_NUM` tinyint(4) DEFAULT NULL,
  `MED_DEPOTLEGAL` varchar(6) DEFAULT NULL,
  `OFF_QTE` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `offrir`
--

INSERT INTO `offrir` (`VIS_MATRICULE`, `RAP_NUM`, `MED_DEPOTLEGAL`, `OFF_QTE`) VALUES
('a17', 4, '3MYC7', 3),
('a17', 4, 'AMOX45', 12),
('a17', 4, '3MYC7', 3),
('a17', 4, 'AMOX45', 12);

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

DROP TABLE IF EXISTS `posseder`;
CREATE TABLE IF NOT EXISTS `posseder` (
  `PRA_NUM` varchar(0) DEFAULT NULL,
  `SPE_CODE` varchar(0) DEFAULT NULL,
  `POS_DIPLOME` varchar(0) DEFAULT NULL,
  `POS_COEFPRESCRIPTION` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `praticien`
--

DROP TABLE IF EXISTS `praticien`;
CREATE TABLE IF NOT EXISTS `praticien` (
  `PRA_NUM` tinyint(4) DEFAULT NULL,
  `PRA_NOM` varchar(16) DEFAULT NULL,
  `PRA_PRENOM` varchar(15) DEFAULT NULL,
  `PRA_ADRESSE` varchar(29) DEFAULT NULL,
  `PRA_CP` mediumint(9) DEFAULT NULL,
  `PRA_VILLE` varchar(19) DEFAULT NULL,
  `PRA_COEFNOTORIETE` decimal(5,2) DEFAULT NULL,
  `TYP_CODE` varchar(2) DEFAULT NULL,
  `pra_telephone` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `praticien`
--

INSERT INTO `praticien` (`PRA_NUM`, `PRA_NOM`, `PRA_PRENOM`, `PRA_ADRESSE`, `PRA_CP`, `PRA_VILLE`, `PRA_COEFNOTORIETE`, `TYP_CODE`, `pra_telephone`) VALUES
(1, 'Notini', 'Alain', '114 r Authie', 85000, 'LA ROCHE SUR YON', '290.03', 'MH', '2073527893'),
(2, 'Gosselin', 'Albert', '13 r Devon', 41000, 'BLOIS', '307.49', 'MV', '2332993980'),
(3, 'Delahaye', 'André', '36 av 6 Juin', 25000, 'BESANCON', '185.79', 'PS', '5444386532'),
(4, 'Leroux', 'André', '47 av Robert Schuman', 60000, 'BEAUVAIS', '172.04', 'PH', '2229510249'),
(5, 'Desmoulins', 'Anne', '31 r St Jean', 30000, 'NIMES', '94.75', 'PO', '4781595836'),
(6, 'Mouel', 'Anne', '27 r Auvergne', 80000, 'AMIENS', '45.20', 'MH', '3239126413'),
(7, 'Desgranges-Lentz', 'Antoine', '1 r Albert de Mun', 29000, 'MORLAIX', '20.07', 'MV', '1850844865'),
(8, 'Marcouiller', 'Arnaud', '31 r St Jean', 68000, 'MULHOUSE', '396.52', 'PS', '9536845394'),
(9, 'Dupuy', 'Benoit', '9 r Demolombe', 34000, 'MONTPELLIER', '395.66', 'PH', '2131692685'),
(10, 'Lerat', 'Bernard', '31 r St Jean', 59000, 'LILLE', '257.79', 'PO', '2047927549'),
(11, 'Marçais-Lefebvre', 'Bertrand', '86Bis r Basse', 67000, 'STRASBOURG', '450.96', 'MH', '3844559997'),
(12, 'Boscher', 'Bruno', '94 r Falaise', 10000, 'TROYES', '356.14', 'MV', '3079017645'),
(13, 'Morel', 'Catherine', '21 r Chateaubriand', 75000, 'PARIS', '379.57', 'PS', '3861408544'),
(14, 'Guivarch', 'Chantal', '4 av Gén Laperrine', 45000, 'ORLEANS', '114.56', 'PH', '699900929.'),
(15, 'Bessin-Grosdoit', 'Christophe', '92 r Falaise', 6000, 'NICE', '222.06', 'PO', '8765725138'),
(16, 'Rossa', 'Claire', '14 av Thiès', 6000, 'NICE', '529.78', 'MH', '3618655720'),
(17, 'Cauchy', 'Denis', '5 av Ste Thérèse', 11000, 'NARBONNE', '458.82', 'MV', '1796103494'),
(18, 'Gaffé', 'Dominique', '9 av 1ère Armée Française', 35000, 'RENNES', '213.40', 'PS', '8124550616'),
(19, 'Guenon', 'Dominique', '98 bd Mar Lyautey', 44000, 'NANTES', '175.89', 'PH', '5234442907'),
(20, 'Prévot', 'Dominique', '29 r Lucien Nelle', 87000, 'LIMOGES', '151.36', 'PO', '1798562995'),
(21, 'Houchard', 'Eliane', '9 r Demolombe', 49100, 'ANGERS', '436.96', 'MH', '3289486564'),
(22, 'Desmons', 'Elisabeth', '51 r Bernières', 29000, 'QUIMPER', '281.17', 'MV', '1051744139'),
(23, 'Flament', 'Elisabeth', '11 r Pasteur', 35000, 'RENNES', '315.60', 'PS', '5390261314'),
(24, 'Goussard', 'Emmanuel', '9 r Demolombe', 41000, 'BLOIS', '40.72', 'PH', '3796074459'),
(25, 'Desprez', 'Eric', '9 r Vaucelles', 33000, 'BORDEAUX', '406.85', 'PO', '2809588660'),
(26, 'Coste', 'Evelyne', '29 r Lucien Nelle', 19000, 'TULLE', '441.87', 'MH', '2659720231'),
(27, 'Lefebvre', 'Frédéric', '2 pl Wurzburg', 55000, 'VERDUN', '573.63', 'MV', '4869835483'),
(28, 'Lemée', 'Frédéric', '29 av 6 Juin', 56000, 'VANNES', '326.40', 'PS', '6370017031'),
(29, 'Martin', 'Frédéric', 'Bât A 90 r Bayeux', 70000, 'VESOUL', '506.06', 'PH', '7240579013'),
(30, 'Marie', 'Frédérique', '172 r Caponière', 70000, 'VESOUL', '313.31', 'PO', '7092844282'),
(31, 'Rosenstech', 'Geneviève', '27 r Auvergne', 75000, 'PARIS', '366.82', 'MH', '3742484677'),
(32, 'Pontavice', 'Ghislaine', '8 r Gaillon', 86000, 'POITIERS', '265.58', 'MV', '7433890846'),
(33, 'Leveneur-Mosquet', 'Guillaume', '47 av Robert Schuman', 64000, 'PAU', '184.97', 'PS', '5942000510'),
(34, 'Blanchais', 'Guy', '30 r Authie', 8000, 'SEDAN', '502.48', 'PH', '7408330317'),
(35, 'Leveneur', 'Hugues', '7 pl St Gilles', 62000, 'ARRAS', '7.39', 'PO', '9215650362'),
(36, 'Mosquet', 'Isabelle', '22 r Jules Verne', 76000, 'ROUEN', '77.10', 'MH', '3853261167'),
(37, 'Giraudon', 'Jean-Christophe', '1 r Albert de Mun', 38100, 'VIENNE', '92.62', 'MV', '1619355056'),
(38, 'Marie', 'Jean-Claude', '26 r Hérouville', 69000, 'LYON', '120.10', 'PS', '6536992086'),
(39, 'Maury', 'Jean-François', '5 r Pierre Girard', 71000, 'CHALON SUR SAONE', '13.73', 'PH', '7826895572'),
(40, 'Dennel', 'Jean-Louis', '7 pl St Gilles', 28000, 'CHARTRES', '550.69', 'PO', '9523501907'),
(41, 'Ain', 'Jean-Pierre', '4 résid Olympia', 2000, 'LAON', '5.59', 'MH', '4136823130'),
(42, 'Chemery', 'Jean-Pierre', '51 pl Ancienne Boucherie', 14000, 'CAEN', '396.58', 'MV', '2113610237'),
(43, 'Comoz', 'Jean-Pierre', '35 r Auguste Lechesne', 18000, 'BOURGES', '340.35', 'PS', '8157582104'),
(44, 'Desfaudais', 'Jean-Pierre', '7 pl St Gilles', 29000, 'BREST', '71.76', 'PH', '4447080115'),
(45, 'Phan', 'JérÃ´me', '9 r Clos Caillet', 79000, 'NIORT', '451.61', 'PO', '7762654570'),
(46, 'Riou', 'Line', '43 bd Gén Vanier', 77000, 'MARNE LA VALLEE', '193.25', 'MH', '5472032814'),
(47, 'Chubilleau', 'Louis', '46 r Eglise', 17000, 'SAINTES', '202.07', 'MV', '4072200669'),
(48, 'Lebrun', 'Lucette', '178 r Auge', 54000, 'NANCY', '410.41', 'PS', '3944905208'),
(49, 'Goessens', 'Marc', '6 av 6 Juin', 39000, 'DOLE', '548.57', 'PH', '7507924342'),
(50, 'Laforge', 'Marc', '5 résid Prairie', 50000, 'SAINT LO', '265.05', 'PO', '5704906392'),
(51, 'Millereau', 'Marc', '36 av 6 Juin', 72000, 'LA FERTE BERNARD', '430.42', 'MH', '6000759243'),
(52, 'Dauverne', 'Marie-Christine', '69 av Charlemagne', 21000, 'DIJON', '281.05', 'MV', '2889077349'),
(53, 'Vittorio', 'Myriam', '3 pl Champlain', 94000, 'BOISSY SAINT LEGER', '356.23', 'PS', '6443109322'),
(54, 'Lapasset', 'Nhieu', '31 av 6 Juin', 52000, 'CHAUMONT', '107.00', 'PH', '3548314872'),
(55, 'Plantet-Besnier', 'Nicole', '10 av 1ère Armée Française', 86000, 'CHATELLEREAULT', '369.94', 'PO', '8412246702'),
(56, 'Chubilleau', 'Pascal', '3 r Hastings', 15000, 'AURRILLAC', '290.75', 'MH', '1416289202'),
(57, 'Robert', 'Pascal', '31 r St Jean', 93000, 'BOBIGNY', '162.41', 'MV', '1844706211'),
(58, 'Jean', 'Pascale', '114 r Authie', 49100, 'SAUMUR', '375.52', 'PS', '4974663755'),
(59, 'Chanteloube', 'Patrice', '14 av Thiès', 13000, 'MARSEILLE', '478.01', 'PH', '9339200453'),
(60, 'Lecuirot', 'Patrice', 'résid St Pères 55 r Pigacière', 54000, 'NANCY', '239.66', 'PO', '1772011305'),
(61, 'Gandon', 'Patrick', '47 av Robert Schuman', 37000, 'TOURS', '599.06', 'MH', '8424554773'),
(62, 'Mirouf', 'Patrick', '22 r Puits Picard', 74000, 'ANNECY', '458.42', 'MV', '8896243776'),
(63, 'Boireaux', 'Philippe', '14 av Thiès', 10000, 'CHALON EN CHAMPAGNE', '454.48', 'PS', '1953852755'),
(64, 'Cendrier', 'Philippe', '7 pl St Gilles', 12000, 'RODEZ', '164.16', 'PH', '3080532758'),
(65, 'Duhamel', 'Philippe', '114 r Authie', 34000, 'MONTPELLIER', '98.62', 'PO', '9541105832'),
(66, 'Grigy', 'Philippe', '15 r Mélingue', 44000, 'CLISSON', '285.10', 'MH', '8463931194'),
(67, 'Linard', 'Philippe', '1 r Albert de Mun', 81000, 'ALBI', '486.30', 'MV', '3696338779'),
(68, 'Lozier', 'Philippe', '8 r Gaillon', 31000, 'TOULOUSE', '48.40', 'PS', '3089900625'),
(69, 'Dechâtre', 'Pierre', '63 av Thiès', 23000, 'MONTLUCON', '253.75', 'PH', '4360487092'),
(70, 'Goessens', 'Pierre', '22 r Jean Romain', 40000, 'MONT DE MARSAN', '426.19', 'PO', '2532733895'),
(71, 'Leménager', 'Pierre', '39 av 6 Juin', 57000, 'METZ', '118.70', 'MH', '9582208506'),
(72, 'Née', 'Pierre', '39 av 6 Juin', 82000, 'MONTAUBAN', '72.54', 'MV', '3128411530'),
(73, 'Guyot', 'Pierre-Laurent', '43 bd Gén Vanier', 48000, 'MENDE', '352.31', 'PS', '2817580553'),
(74, 'Chauchard', 'Roger', '9 r Vaucelles', 13000, 'MARSEILLE', '552.19', 'PH', '3149379615'),
(75, 'Mabire', 'Roland', '11 r Boutiques', 67000, 'STRASBOURG', '422.39', 'PO', '7294156725'),
(76, 'Leroy', 'Soazig', '45 r Boutiques', 61000, 'ALENCON', '570.67', 'MH', '7022645088'),
(77, 'Guyot', 'Stéphane', '26 r Hérouville', 46000, 'FIGEAC', '28.85', 'MV', '3230755574'),
(78, 'Delposen', 'Sylvain', '39 av 6 Juin', 27000, 'DREUX', '292.01', 'PS', '5085842912'),
(79, 'Rault', 'Sylvie', '15 bd Richemond', 2000, 'SOISSON', '526.60', 'PH', '5736948145'),
(80, 'Renouf', 'Sylvie', '98 bd Mar Lyautey', 88000, 'EPINAL', '425.24', 'PO', '3427212297'),
(81, 'Alliet-Grach', 'Thierry', '14 av Thiès', 7000, 'PRIVAS', '451.31', 'MH', '9925217358'),
(82, 'Bayard', 'Thierry', '92 r Falaise', 42000, 'SAINT ETIENNE', '271.71', 'MV', '9344450206'),
(83, 'Gauchet', 'Thierry', '7 r Desmoueux', 38100, 'GRENOBLE', '406.10', 'PS', '6946599266'),
(84, 'Bobichon', 'Tristan', '219 r Caponière', 9000, 'FOIX', '218.36', 'PH', '6699646019'),
(85, 'Duchemin-Laniel', 'Véronique', '130 r St Jean', 33000, 'LIBOURNE', '265.61', 'PO', '2658432603'),
(86, 'Laurent', 'Younès', '34 r Demolombe', 53000, 'MAYENNE', '496.10', 'MH', '3193225267');

-- --------------------------------------------------------

--
-- Structure de la table `prescrire`
--

DROP TABLE IF EXISTS `prescrire`;
CREATE TABLE IF NOT EXISTS `prescrire` (
  `MED_DEPOTLEGAL` varchar(0) DEFAULT NULL,
  `TIN_CODE` varchar(0) DEFAULT NULL,
  `DOS_CODE` varchar(0) DEFAULT NULL,
  `PRE_POSOLOGIE` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `presentation`
--

DROP TABLE IF EXISTS `presentation`;
CREATE TABLE IF NOT EXISTS `presentation` (
  `PRE_CODE` varchar(0) DEFAULT NULL,
  `PRE_LIBELLE` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `rapport_visite`
--

DROP TABLE IF EXISTS `rapport_visite`;
CREATE TABLE IF NOT EXISTS `rapport_visite` (
  `VIS_MATRICULE` varchar(4) DEFAULT NULL,
  `RAP_NUM` tinyint(4) DEFAULT NULL,
  `PRA_NUM` tinyint(4) DEFAULT NULL,
  `RAP_DATE` varchar(19) DEFAULT NULL,
  `RAP_BILAN` varchar(90) DEFAULT NULL,
  `RAP_MOTIF` varchar(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `rapport_visite`
--

INSERT INTO `rapport_visite` (`VIS_MATRICULE`, `RAP_NUM`, `PRA_NUM`, `RAP_DATE`, `RAP_BILAN`, `RAP_MOTIF`) VALUES
('a131', 3, 23, '2002-04-18 00:00:00', 'Médecin curieux, à recontacer en décembre pour réunion', 'Actualisation annuelle'),
('a131', 7, 41, '2003-03-23 00:00:00', 'RAS\r\nChangement de tel : 05 89 89 89 89', 'Rapport Annuel'),
('a17', 4, 4, '2003-05-21 00:00:00', 'Changement de direction, redéfinition de la politique médicamenteuse, recours au générique', 'Baisse activité'),
('a131', NULL, 23, '2002-04-18 00:00:00', 'Médecin curieux, à recontacer en décembre pour réunion', 'Actualisation annuelle'),
('a131', NULL, 41, '2003-03-23 00:00:00', 'RAS Changement de tel : 05 89 89 89 89', 'Rapport Annuel'),
('a17', NULL, 4, '2003-05-21 00:00:00', 'Changement de direction, redéfinition de la politique médicamenteuse, recours au générique', 'Baisse activité'),
('a131', NULL, 23, '2002-04-18 00:00:00', 'Médecin curieux, à recontacer en décembre pour réunion', 'Actualisation annuelle'),
('a131', NULL, 41, '2003-03-23 00:00:00', 'RAS\r\nChangement de tel : 05 89 89 89 89', 'Rapport Annuel'),
('a17', NULL, 4, '2003-05-21 00:00:00', 'Changement de direction, redéfinition de la politique médicamenteuse, recours au générique', 'Baisse activité');

-- --------------------------------------------------------

--
-- Structure de la table `realiser`
--

DROP TABLE IF EXISTS `realiser`;
CREATE TABLE IF NOT EXISTS `realiser` (
  `AC_NUM` varchar(0) DEFAULT NULL,
  `VIS_MATRICULE` varchar(0) DEFAULT NULL,
  `REA_MTTFRAIS` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `REG_CODE` varchar(2) DEFAULT NULL,
  `SEC_CODE` varchar(1) DEFAULT NULL,
  `REG_NOM` varchar(26) DEFAULT NULL,
  `num_region` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`REG_CODE`, `SEC_CODE`, `REG_NOM`, `num_region`) VALUES
('AL', 'E', 'Alsace Lorraine', 1),
('AQ', 'S', 'Aquitaine', 2),
('AU', 'P', 'Auvergne', 3),
('BG', 'O', 'Bretagne', 4),
('BN', 'O', 'Basse Normandie', 5),
('BO', 'E', 'Bourgogne', 6),
('CA', 'N', 'Champagne Ardennes', 7),
('CE', 'P', 'Centre', 8),
('FC', 'E', 'Franche Comté', 9),
('HN', 'N', 'Haute Normandie', 10),
('IF', 'P', 'Ile de France', 11),
('LG', 'S', 'Languedoc', 12),
('LI', 'P', 'Limousin', 13),
('MP', 'S', 'Midi Pyrénée', 14),
('NP', 'N', 'Nord Pas de Calais', 15),
('PA', 'S', 'Provence Alpes Cote d\'Azur', 16),
('PC', 'O', 'Poitou Charente', 17),
('PI', 'N', 'Picardie', 18),
('PL', 'O', 'Pays de Loire', 19),
('RA', 'E', 'Rhone Alpes', 20),
('RO', 'S', 'Roussilon', 21),
('VD', 'O', 'Vendée', 22);

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

DROP TABLE IF EXISTS `secteur`;
CREATE TABLE IF NOT EXISTS `secteur` (
  `SEC_CODE` varchar(1) DEFAULT NULL,
  `SEC_LIBELLE` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `secteur`
--

INSERT INTO `secteur` (`SEC_CODE`, `SEC_LIBELLE`) VALUES
('E', 'Est'),
('N', 'Nord'),
('O', 'Ouest'),
('P', 'Paris centre'),
('S', 'Sud'),
('E', 'Est'),
('N', 'Nord'),
('O', 'Ouest'),
('P', 'Paris centre'),
('S', 'Sud');

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `SPE_CODE` varchar(3) DEFAULT NULL,
  `SPE_LIBELLE` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`SPE_CODE`, `SPE_LIBELLE`) VALUES
('ACP', 'anatomie et cytologie pathologiques'),
('AMV', 'angéiologie, médecine vasculaire'),
('ARC', 'anesthésiologie et réanimation chirurgicale'),
('BM', 'biologie médicale'),
('CAC', 'cardiologie et affections cardio-vasculaires'),
('CCT', 'chirurgie cardio-vasculaire et thoracique'),
('CG', 'chirurgie générale'),
('CMF', 'chirurgie maxillo-faciale'),
('COM', 'cancérologie, oncologie médicale'),
('COT', 'chirurgie orthopédique et traumatologie'),
('CPR', 'chirurgie plastique reconstructrice et esthétique'),
('CU', 'chirurgie urologique'),
('CV', 'chirurgie vasculaire'),
('DN', 'diabétologie-nutrition, nutrition'),
('DV', 'dermatologie et vénéréologie'),
('EM', 'endocrinologie et métabolismes'),
('ETD', 'évaluation et traitement de la douleur'),
('GEH', 'gastro-entérologie et hépatologie (appareil digestif)'),
('GMO', 'gynécologie médicale, obstétrique'),
('GO', 'gynécologie-obstétrique'),
('HEM', 'maladies du sang (hématologie)'),
('MBS', 'médecine et biologie du sport'),
('MDT', 'médecine du travail'),
('MMO', 'médecine manuelle - ostéopathie'),
('MN', 'médecine nucléaire'),
('MPR', 'médecine physique et de réadaptation'),
('MTR', 'médecine tropicale, pathologie infectieuse et tropicale'),
('NEP', 'néphrologie'),
('NRC', 'neurochirurgie'),
('NRL', 'neurologie'),
('ODM', 'orthopédie dento maxillo-faciale'),
('OPH', 'ophtalmologie'),
('ORL', 'oto-rhino-laryngologie'),
('PEA', 'psychiatrie de l\'enfant et de l\'adolescent'),
('PME', 'pédiatrie maladies des enfants'),
('PNM', 'pneumologie'),
('PSC', 'psychiatrie'),
('RAD', 'radiologie (radiodiagnostic et imagerie médicale)'),
('RDT', 'radiothérapie (oncologie option radiothérapie)'),
('RGM', 'reproduction et gynécologie médicale'),
('RHU', 'rhumatologie'),
('STO', 'stomatologie'),
('SXL', 'sexologie'),
('TXA', 'toxicomanie et alcoologie');

-- --------------------------------------------------------

--
-- Structure de la table `switchboard items`
--

DROP TABLE IF EXISTS `switchboard items`;
CREATE TABLE IF NOT EXISTS `switchboard items` (
  `SwitchboardID` tinyint(4) DEFAULT NULL,
  `ItemNumber` tinyint(4) DEFAULT NULL,
  `ItemText` varchar(26) DEFAULT NULL,
  `Command` varchar(1) DEFAULT NULL,
  `Argument` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `switchboard items`
--

INSERT INTO `switchboard items` (`SwitchboardID`, `ItemNumber`, `ItemText`, `Command`, `Argument`) VALUES
(1, 0, 'Gestion des comptes rendus', '', 'Par défaut'),
(1, 1, 'Comptes-Rendus', '3', 'RAPPORT_VISITE'),
(1, 2, 'Visiteurs', '3', 'F_VISITEUR'),
(1, 3, 'Praticiens', '3', 'F_PRATICIEN'),
(1, 4, 'Medicaments', '3', 'F_MEDICAMENT'),
(1, 5, 'Quitter', '8', 'quitter');

-- --------------------------------------------------------

--
-- Structure de la table `travailler`
--

DROP TABLE IF EXISTS `travailler`;
CREATE TABLE IF NOT EXISTS `travailler` (
  `VIS_MATRICULE` varchar(4) DEFAULT NULL,
  `JJMMAA` varchar(19) DEFAULT NULL,
  `REG_CODE` varchar(2) DEFAULT NULL,
  `TRA_ROLE` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `travailler`
--

INSERT INTO `travailler` (`VIS_MATRICULE`, `JJMMAA`, `REG_CODE`, `TRA_ROLE`) VALUES
('p49', '1977-10-03 00:00:00', 'CE', 'Visiteur'),
('k53', '1983-03-23 00:00:00', 'CA', 'Visiteur'),
('r24', '1984-07-29 00:00:00', 'BN', 'Visiteur'),
('g53', '1985-10-02 00:00:00', 'BG', 'Visiteur'),
('a55', '1987-07-17 00:00:00', 'MP', 'Visiteur'),
('m35', '1987-10-06 00:00:00', 'MP', 'Visiteur'),
('e39', '1988-04-26 00:00:00', 'IF', 'Visiteur'),
('c14', '1989-02-01 00:00:00', 'PA', 'Visiteur'),
('e22', '1989-03-24 00:00:00', 'AL', 'Visiteur'),
('p7', '1990-03-01 00:00:00', 'RO', 'Visiteur'),
('r58', '1990-06-30 00:00:00', 'BG', 'Visiteur'),
('m45', '1990-10-13 00:00:00', 'AL', 'Visiteur'),
('e5', '1990-11-27 00:00:00', 'MP', 'Visiteur'),
('t60', '1991-03-29 00:00:00', 'CE', 'Visiteur'),
('c54', '1991-04-09 00:00:00', 'AL', 'Visiteur'),
('p8', '1991-06-23 00:00:00', 'BO', 'Visiteur'),
('a17', '1991-08-26 00:00:00', 'RA', 'Visiteur'),
('e52', '1991-10-31 00:00:00', 'HN', 'Visiteur'),
('d13', '1991-12-05 00:00:00', 'PL', 'Visiteur'),
('k53', '1992-04-03 00:00:00', 'AL', 'Délégué'),
('c3', '1992-05-05 00:00:00', 'CA', 'Visiteur'),
('n58', '1992-08-30 00:00:00', 'CE', 'Visiteur'),
('s21', '1992-09-25 00:00:00', 'LI', 'Visiteur'),
('h40', '1992-11-01 00:00:00', 'CA', 'Visiteur'),
('a131', '1992-12-11 00:00:00', 'BN', 'Visiteur'),
('p40', '1992-12-14 00:00:00', 'BN', 'Délégué'),
('j50', '1992-12-16 00:00:00', 'NP', 'Visiteur'),
('p32', '1992-12-24 00:00:00', 'IF', 'Visiteur'),
('h13', '1993-05-08 00:00:00', 'LI', 'Visiteur'),
('e24', '1993-05-17 00:00:00', 'AL', 'Délégué'),
('f21', '1993-06-08 00:00:00', 'RA', 'Visiteur'),
('h35', '1993-08-26 00:00:00', 'AU', 'Visiteur'),
('b34', '1993-12-06 00:00:00', 'CE', 'Délégué'),
('f4', '1994-05-03 00:00:00', 'MP', 'Visiteur'),
('b25', '1994-07-03 00:00:00', 'PL', 'Visiteur'),
('t55', '1994-11-29 00:00:00', 'MP', 'Visiteur'),
('p42', '1994-12-12 00:00:00', 'PI', 'Visiteur'),
('n59', '1994-12-19 00:00:00', 'PI', 'Visiteur'),
('o26', '1995-01-05 00:00:00', 'LG', 'Visiteur'),
('l14', '1995-02-02 00:00:00', 'PL', 'Visiteur'),
('t43', '1995-03-09 00:00:00', 'BO', 'Visiteur'),
('a55', '1995-05-19 00:00:00', 'RO', 'Visiteur'),
('l23', '1995-06-05 00:00:00', 'PC', 'Visiteur'),
('b59', '1995-10-21 00:00:00', 'RA', 'Visiteur'),
('s10', '1995-11-14 00:00:00', 'FC', 'Visiteur'),
('e5', '1995-11-27 00:00:00', 'MP', 'Délégué'),
('g7', '1996-01-13 00:00:00', 'LI', 'Visiteur'),
('g19', '1996-01-18 00:00:00', 'IF', 'Visiteur'),
('e49', '1996-02-19 00:00:00', 'MP', 'Visiteur'),
('l56', '1996-02-27 00:00:00', 'FC', 'Visiteur'),
('n42', '1996-03-06 00:00:00', 'HN', 'Visiteur'),
('b13', '1996-03-11 00:00:00', 'AL', 'Visiteur'),
('a131', '1996-05-27 00:00:00', 'BG', 'Visiteur'),
('k4', '1996-11-21 00:00:00', 'LG', 'Visiteur'),
('l46', '1997-01-24 00:00:00', 'PL', 'Visiteur'),
('c14', '1997-02-01 00:00:00', 'PA', 'Délégué'),
('f39', '1997-02-15 00:00:00', 'RA', 'Visiteur'),
('b16', '1997-03-21 00:00:00', 'BG', 'Visiteur'),
('p6', '1997-03-30 00:00:00', 'AQ', 'Visiteur'),
('t47', '1997-08-29 00:00:00', 'PI', 'Visiteur'),
('q17', '1997-09-06 00:00:00', 'BN', 'Visiteur'),
('a17', '1997-09-19 00:00:00', 'RA', 'Délégué'),
('b4', '1997-09-25 00:00:00', 'AQ', 'Visiteur'),
('d51', '1997-11-18 00:00:00', 'FC', 'Délégué'),
('b50', '1998-01-18 00:00:00', 'PA', 'Visiteur'),
('j45', '1998-02-25 00:00:00', 'CA', 'Responsable'),
('h30', '1998-04-26 00:00:00', 'IF', 'Visiteur'),
('r24', '1998-05-25 00:00:00', 'BN', 'Responsable'),
('j8', '1998-06-18 00:00:00', 'IF', 'Responsable'),
('p41', '1998-07-27 00:00:00', 'PC', 'Visiteur'),
('a93', '1999-01-02 00:00:00', 'PC', 'Visiteur'),
('b19', '1999-01-31 00:00:00', 'PL', 'Visiteur'),
('g30', '1999-03-27 00:00:00', 'PI', 'Délégué'),
('m45', '1999-04-08 00:00:00', 'AL', 'Délégué'),
('b34', '1999-06-18 00:00:00', 'CE', 'Responsable'),
('p40', '1999-07-17 00:00:00', 'BN', 'Responsable'),
('a55', '1999-08-21 00:00:00', 'RO', 'Délégué'),
('b25', '2000-01-01 00:00:00', 'PL', 'Délégué'),
('e24', '2000-02-29 00:00:00', 'AL', 'Responsable'),
('b28', '2000-08-02 00:00:00', 'LG', 'Visiteur'),
('g30', '2000-10-31 00:00:00', 'PI', 'Responsable'),
('e5', '2000-11-27 00:00:00', 'AQ', 'Responsable'),
('c14', '2001-03-03 00:00:00', 'PA', 'Responsable'),
('d51', '2002-03-20 00:00:00', 'FC', 'Responsable');

-- --------------------------------------------------------

--
-- Structure de la table `type_individu`
--

DROP TABLE IF EXISTS `type_individu`;
CREATE TABLE IF NOT EXISTS `type_individu` (
  `TIN_CODE` varchar(0) DEFAULT NULL,
  `TIN_LIBELLE` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `type_praticien`
--

DROP TABLE IF EXISTS `type_praticien`;
CREATE TABLE IF NOT EXISTS `type_praticien` (
  `TYP_CODE` varchar(2) DEFAULT NULL,
  `TYP_LIBELLE` varchar(22) DEFAULT NULL,
  `TYP_LIEU` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `type_praticien`
--

INSERT INTO `type_praticien` (`TYP_CODE`, `TYP_LIBELLE`, `TYP_LIEU`) VALUES
('MH', 'Médecin Hospitalier', 'Hopital ou clinique'),
('MV', 'Médecine de Ville', 'Cabinet'),
('PH', 'Pharmacien Hospitalier', 'Hopital ou clinique'),
('PO', 'Pharmacien Officine', 'Pharmacie'),
('PS', 'Personnel de santé', 'Centre paramédical');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

DROP TABLE IF EXISTS `visiteur`;
CREATE TABLE IF NOT EXISTS `visiteur` (
  `VIS_MATRICULE` varchar(4) DEFAULT NULL,
  `VIS_NOM` varchar(15) DEFAULT NULL,
  `Vis_PRENOM` varchar(12) DEFAULT NULL,
  `VIS_ADRESSE` varchar(31) DEFAULT NULL,
  `VIS_CP` varchar(5) DEFAULT NULL,
  `VIS_VILLE` varchar(19) DEFAULT NULL,
  `VIS_DATEEMBAUCHE` varchar(19) DEFAULT NULL,
  `SEC_CODE` varchar(1) DEFAULT NULL,
  `LAB_CODE` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`VIS_MATRICULE`, `VIS_NOM`, `Vis_PRENOM`, `VIS_ADRESSE`, `VIS_CP`, `VIS_VILLE`, `VIS_DATEEMBAUCHE`, `SEC_CODE`, `LAB_CODE`) VALUES
('a131', 'Villechalane', 'Louis', '8 cours Lafontaine', '29000', 'BREST', '1992-12-11 00:00:00', '', 'SW'),
('a17', 'Andre', 'David', '1 r Aimon de Chissée', '38100', 'GRENOBLE', '1991-08-26 00:00:00', '', 'GY'),
('a55', 'Bedos', 'Christian', '1 r Bénédictins', '65000', 'TARBES', '1987-07-17 00:00:00', '', 'GY'),
('a93', 'Tusseau', 'Louis', '22 r Renou', '86000', 'POITIERS', '1999-01-02 00:00:00', '', 'SW'),
('b13', 'Bentot', 'Pascal', '11 av 6 Juin', '67000', 'STRASBOURG', '1996-03-11 00:00:00', '', 'GY'),
('b16', 'Bioret', 'Luc', '1 r Linne', '35000', 'RENNES', '1997-03-21 00:00:00', '', 'SW'),
('b19', 'Bunisset', 'Francis', '10 r Nicolas Chorier', '85000', 'LA ROCHE SUR YON', '1999-01-31 00:00:00', '', 'GY'),
('b25', 'Bunisset', 'Denise', '1 r Lionne', '49100', 'ANGERS', '1994-07-03 00:00:00', '', 'SW'),
('b28', 'Cacheux', 'Bernard', '114 r Authie', '34000', 'MONTPELLIER', '2000-08-02 00:00:00', '', 'GY'),
('b34', 'Cadic', 'Eric', '123 r Caponière', '41000', 'BLOIS', '1993-12-06 00:00:00', 'P', 'SW'),
('b4', 'Charoze', 'Catherine', '100 pl Géants', '33000', 'BORDEAUX', '1997-09-25 00:00:00', '', 'SW'),
('b50', 'Clepkens', 'Christophe', '12 r Fédérico Garcia Lorca', '13000', 'MARSEILLE', '1998-01-18 00:00:00', '', 'SW'),
('b59', 'Cottin', 'Vincenne', '36 sq Capucins', '5000', 'GAP', '1995-10-21 00:00:00', '', 'GY'),
('c14', 'Daburon', 'François', '13 r Champs Elysées', '6000', 'NICE', '1989-02-01 00:00:00', 'S', 'SW'),
('c3', 'De', 'Philippe', '13 r Charles Peguy', '10000', 'TROYES', '1992-05-05 00:00:00', '', 'SW'),
('c54', 'Debelle', 'Michel', '181 r Caponière', '88000', 'EPINAL', '1991-04-09 00:00:00', '', 'SW'),
('d13', 'Debelle', 'Jeanne', '134 r Stalingrad', '44000', 'NANTES', '1991-12-05 00:00:00', '', 'SW'),
('d51', 'Debroise', 'Michel', '2 av 6 Juin', '70000', 'VESOUL', '1997-11-18 00:00:00', 'E', 'GY'),
('e22', 'Desmarquest', 'Nathalie', '14 r Fédérico Garcia Lorca', '54000', 'NANCY', '1989-03-24 00:00:00', '', 'GY'),
('e24', 'Desnost', 'Pierre', '16 r Barral de Montferrat', '55000', 'VERDUN', '1993-05-17 00:00:00', 'E', 'SW'),
('e39', 'Dudouit', 'Frédéric', '18 quai Xavier Jouvin', '75000', 'PARIS', '1988-04-26 00:00:00', '', 'GY'),
('e49', 'Duncombe', 'Claude', '19 av Alsace Lorraine', '9000', 'FOIX', '1996-02-19 00:00:00', '', 'GY'),
('e5', 'Enault-Pascreau', 'Céline', '25B r Stalingrad', '40000', 'MONT DE MARSAN', '1990-11-27 00:00:00', 'S', 'GY'),
('e52', 'Eynde', 'Valérie', '3 r Henri Moissan', '76000', 'ROUEN', '1991-10-31 00:00:00', '', 'GY'),
('f21', 'Finck', 'Jacques', 'rte Montreuil Bellay', '74000', 'ANNECY', '1993-06-08 00:00:00', '', 'SW'),
('f39', 'Frémont', 'Fernande', '4 r Jean Giono', '69000', 'LYON', '1997-02-15 00:00:00', '', 'GY'),
('f4', 'Gest', 'Alain', '30 r Authie', '46000', 'FIGEAC', '1994-05-03 00:00:00', '', 'GY'),
('g19', 'Gheysen', 'Galassus', '32 bd Mar Foch', '75000', 'PARIS', '1996-01-18 00:00:00', '', 'SW'),
('g30', 'Girard', 'Yvon', '31 av 6 Juin', '80000', 'AMIENS', '1999-03-27 00:00:00', 'N', 'GY'),
('g53', 'Gombert', 'Luc', '32 r Emile Gueymard', '56000', 'VANNES', '1985-10-02 00:00:00', '', 'GY'),
('g7', 'Guindon', 'Caroline', '40 r Mar Montgomery', '87000', 'LIMOGES', '1996-01-13 00:00:00', '', 'GY'),
('h13', 'Guindon', 'François', '44 r Picotière', '19000', 'TULLE', '1993-05-08 00:00:00', '', 'SW'),
('h30', 'Igigabel', 'Guy', '33 gal Arlequin', '94000', 'CRETEIL', '1998-04-26 00:00:00', '', 'SW'),
('h35', 'Jourdren', 'Pierre', '34 av Jean Perrot', '15000', 'AURRILLAC', '1993-08-26 00:00:00', '', 'GY'),
('h40', 'Juttard', 'Pierre-Raoul', '34 cours Jean Jaurès', '8000', 'SEDAN', '1992-11-01 00:00:00', '', 'GY'),
('j45', 'Labouré-Morel', 'Saout', '38 cours Berriat', '52000', 'CHAUMONT', '1998-02-25 00:00:00', 'N', 'SW'),
('j50', 'Landré', 'Philippe', '4 av Gén Laperrine', '59000', 'LILLE', '1992-12-16 00:00:00', '', 'GY'),
('j8', 'Langeard', 'Hugues', '39 av Jean Perrot', '93000', 'BAGNOLET', '1998-06-18 00:00:00', 'P', 'GY'),
('k4', 'Lanne', 'Bernard', '4 r Bayeux', '30000', 'NIMES', '1996-11-21 00:00:00', '', 'SW'),
('k53', 'Le', 'Noël', '4 av Beauvert', '68000', 'MULHOUSE', '1983-03-23 00:00:00', '', 'SW'),
('l14', 'Le', 'Jean', '39 r Raspail', '53000', 'LAVAL', '1995-02-02 00:00:00', '', 'SW'),
('l23', 'Leclercq', 'Servane', '11 r Quinconce', '18000', 'BOURGES', '1995-06-05 00:00:00', '', 'SW'),
('l46', 'Lecornu', 'Jean-Bernard', '4 bd Mar Foch', '72000', 'LA FERTE BERNARD', '1997-01-24 00:00:00', '', 'GY'),
('l56', 'Lecornu', 'Ludovic', '4 r Abel Servien', '25000', 'BESANCON', '1996-02-27 00:00:00', '', 'SW'),
('m35', 'Lejard', 'Agnès', '4 r Anthoard', '82000', 'MONTAUBAN', '1987-10-06 00:00:00', '', 'SW'),
('m45', 'Lesaulnier', 'Pascal', '47 r Thiers', '57000', 'METZ', '1990-10-13 00:00:00', '', 'SW'),
('n42', 'Letessier', 'Stéphane', '5 chem Capuche', '27000', 'EVREUX', '1996-03-06 00:00:00', '', 'GY'),
('n58', 'Loirat', 'Didier', 'Les Pêchers cité Bourg la Croix', '45000', 'ORLEANS', '1992-08-30 00:00:00', '', 'GY'),
('n59', 'Maffezzoli', 'Thibaud', '5 r Chateaubriand', '2000', 'LAON', '1994-12-19 00:00:00', '', 'SW'),
('o26', 'Mancini', 'Anne', '5 r D\'Agier', '48000', 'MENDE', '1995-01-05 00:00:00', '', 'GY'),
('p32', 'Marcouiller', 'Gérard', '7 pl St Gilles', '91000', 'ISSY LES MOULINEAUX', '1992-12-24 00:00:00', '', 'GY'),
('p40', 'Michel', 'Jean-Claude', '5 r Gabriel Péri', '61000', 'FLERS', '1992-12-14 00:00:00', 'O', 'SW'),
('p41', 'Montecot', 'Françoise', '6 r Paul Valéry', '17000', 'SAINTES', '1998-07-27 00:00:00', '', 'GY'),
('p42', 'Notini', 'Veronique', '5 r Lieut Chabal', '60000', 'BEAUVAIS', '1994-12-12 00:00:00', '', 'SW'),
('p49', 'Onfroy', 'Den', '5 r Sidonie Jacolin', '37000', 'TOURS', '1977-10-03 00:00:00', '', 'GY'),
('p6', 'Pascreau', 'Charles', '57 bd Mar Foch', '64000', 'PAU', '1997-03-30 00:00:00', '', 'SW'),
('p7', 'Pernot', 'Claude-Noël', '6 r Alexandre 1 de Yougoslavie', '11000', 'NARBONNE', '1990-03-01 00:00:00', '', 'SW'),
('p8', 'Perrier', 'Maître', '6 r Aubert Dubayet', '71000', 'CHALON SUR SAONE', '1991-06-23 00:00:00', '', 'GY'),
('q17', 'Petit', 'Jean-Louis', '7 r Ernest Renan', '50000', 'SAINT LO', '1997-09-06 00:00:00', '', 'GY'),
('r24', 'Piquery', 'Patrick', '9 r Vaucelles', '14000', 'CAEN', '1984-07-29 00:00:00', 'O', 'GY'),
('r58', 'Quiquandon', 'Joël', '7 r Ernest Renan', '29000', 'QUIMPER', '1990-06-30 00:00:00', '', 'GY'),
('s10', 'Retailleau', 'Josselin', '88Bis r Saumuroise', '39000', 'DOLE', '1995-11-14 00:00:00', '', 'SW'),
('s21', 'Retailleau', 'Pascal', '32 bd Ayrault', '23000', 'MONTLUCON', '1992-09-25 00:00:00', '', 'SW'),
('t43', 'Souron', 'Maryse', '7B r Gay Lussac', '21000', 'DIJON', '1995-03-09 00:00:00', '', 'SW'),
('t47', 'Tiphagne', 'Patrick', '7B r Gay Lussac', '62000', 'ARRAS', '1997-08-29 00:00:00', '', 'SW'),
('t55', 'Tréhet', 'Alain', '7D chem Barral', '12000', 'RODEZ', '1994-11-29 00:00:00', '', 'SW'),
('t60', 'Tusseau', 'Josselin', '63 r Bon Repos', '28000', 'CHARTRES', '1991-03-29 00:00:00', '', 'GY'),
('zzz', 'swiss', 'bourdin', '', '', '', '2003-06-18 00:00:00', '', 'BC');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
