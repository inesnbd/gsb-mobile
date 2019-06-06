-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  mar. 04 avril 2019 à 00:45
-- Version du serveur :  5.6.35
-- Version de PHP :  7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `gsb`
--

-- --------------------------------------------------------

--
-- Structure de la table `detail_frais_forfait`
--

CREATE TABLE `detail_frais_forfait` (
  `id` int(11) NOT NULL,
  `frais_forfait_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `fiche_frais_id` int(11) NOT NULL,
  `etat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `detail_frais_forfait`
--

INSERT INTO `detail_frais_forfait` (`id`, `frais_forfait_id`, `quantite`, `fiche_frais_id`, `etat_id`) VALUES
(4, 1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `detail_frais_non_forfait`
--

CREATE TABLE `detail_frais_non_forfait` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `montant` decimal(10,0) NOT NULL,
  `fiche_frais_id` int(11) NOT NULL,
  `etat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `detail_frais_non_forfait`
--

INSERT INTO `detail_frais_non_forfait` (`id`, `libelle`, `montant`, `fiche_frais_id`, `etat_id`) VALUES
(4, 'Train', '90', 1, 2),
(5, 'Billet avion', '390', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
(1, 'Remboursée'),
(2, 'Refusée'),
(3, 'Saisie clôturée'),
(4, 'Fiche créée, saisie en cours'),
(5, 'Validée et mise en paiement');


-- --------------------------------------------------------

--
-- Structure de la table `fiche_frais`
--

CREATE TABLE `fiche_frais` (
  `id` int(11) NOT NULL,
  `mois` int(2) NOT NULL,
  `annee` int(4) NOT NULL,
  `etat_id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fiche_frais`
--

INSERT INTO `fiche_frais` (`id`, `mois`, `annee`, `etat_id`, `utilisateur_id`) VALUES
(1, 12, 2018, 1, 1),
(3, 11, 2018, 1, 1),
(4, 1, 2019, 1, 1),
(5, 2, 2019, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `frais_forfait`
--

CREATE TABLE `frais_forfait` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `montant` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `frais_forfait`
--

INSERT INTO `frais_forfait` (`id`, `libelle`, `montant`) VALUES
(1, 'Hotel', '100.00'),
(2, 'Frais kilométrique', '0.10');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `libelle`) VALUES
(1, 'visiteur'),
(2, 'comptable'),
(3, 'Administrateur');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `code_postal` varchar(5) NOT NULL,
  `date_embauche` date NOT NULL,
  `nom_utilisateur` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `adresse`, `ville`, `code_postal`, `date_embauche`, `nom_utilisateur`, `mot_de_passe`, `role_id`) VALUES
(1, 'Nebbad', 'Ines', 'test', 'test', '69000', '2018-12-11', 'test', 'test', 1);
(2, 'Andre', 'David', 'dandre', 'oppg5', '1 rue Petit', '46200', 'Lalbenque', '1998-11-23', NULL, 2),
(3, 'Bedos', 'Christian', 'cbedos', 'gmhxd', '1 rue Peranud', '46250', 'Montcuq', '1995-01-12', NULL, 3),
(4, 'Tusseau', 'Louis', 'ltusseau', 'ktp3s', '22 rue des Ternes', '46123', 'Gramat', '2000-05-01', NULL, 1),
(5, 'Bentot', 'Pascal', 'pbentot', 'doyw1', '11 allée des Cerises', '46512', 'Bessines', '1992-07-09', NULL, 1),
(6, 'Bioret', 'Luc', 'lbioret', 'hrjfs', '1 Avenue gambetta', '46000', 'Cahors', '1998-05-11', NULL, 1),
(7, 'Bunisset', 'Francis', 'fbunisset', '4vbnd', '10 rue des Perles', '93100', 'Montreuil', '1987-10-21', NULL, 1),
(8, 'Bunisset', 'Denise', 'dbunisset', 's1y1r', '23 rue Manin', '75019', 'paris', '2010-12-05', NULL, 2),
(9, 'Cacheux', 'Bernard', 'bcacheux', 'uf7r3', '114 rue Blanche', '75017', 'Paris', '2009-11-12', NULL, 3),
(10, 'Cadic', 'Eric', 'ecadic', '6u8dc', '123 avenue de la République', '75011', 'Paris', '2008-09-23', NULL, 2),
(11, 'Charoze', 'Catherine', 'ccharoze', 'u817o', '100 rue Petit', '75019', 'Paris', '2005-11-12', NULL, 1),
(12, 'Clepkens', 'Christophe', 'cclepkens', 'bw1us', '12 allée des Anges', '93230', 'Romainville', '2003-08-11', NULL, 2),
(13, 'Cottin', 'Vincenne', 'vcottin', '2hoh9', '36 rue Des Roches', '93100', 'Monteuil', '2001-11-18', NULL, 1),
(14, 'Daburon', 'François', 'fdaburon', '7oqpv', '13 rue de Chanzy', '94000', 'Créteil', '2002-02-11', NULL, 1),
(15, 'De', 'Philippe', 'pde', 'gk9kx', '13 rue Barthes', '94000', 'Créteil', '2010-12-14', NULL, 3),
(16, 'Debelle', 'Michel', 'mdebelle', 'od5rt', '181 avenue Barbusse', '93210', 'Rosny', '2006-11-23', NULL, 2),
(17, 'Debelle', 'Jeanne', 'jdebelle', 'nvwqq', '134 allée des Joncs', '44000', 'Nantes', '2000-05-11', NULL, 1),
(18, 'Debroise', 'Michel', 'mdebroise', 'sghkb', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17', NULL, 1),
(19, 'Desmarquest', 'Nathalie', 'ndesmarquest', 'f1fob', '14 Place d Arc', '45000', 'Orléans', '2005-11-12', NULL, 1),
(20, 'Desnost', 'Pierre', 'pdesnost', '4k2o5', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05', NULL, 1),
(21, 'Dudouit', 'Frédéric', 'fdudouit', '44im8', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01', NULL, 1),
(22, 'Duncombe', 'Claude', 'cduncombe', 'qf77j', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10', NULL, 1),
(23, 'Enault-Pascreau', 'Céline', 'cenault', 'y2qdu', '25 place de la gare', '23200', 'Gueret', '1995-09-01', NULL, 1),
(24, 'Eynde', 'Valérie', 'veynde', 'i7sn3', '3 Grand Place', '13015', 'Marseille', '1999-11-01', NULL, 1),
(25, 'Finck', 'Jacques', 'jfinck', 'mpb3t', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10', NULL, 2),
(26, 'Frémont', 'Fernande', 'ffremont', 'xs5tq', '4 route de la mer', '13012', 'Allauh', '1998-10-01', NULL, 1),
(27, 'Gest', 'Alain', 'agest', 'dywvt', '30 avenue de la mer', '13025', 'Berre', '1985-11-01', NULL, 'visiteur'),
(28, 'Villechalane', 'Louis', 'lvillachane', 'jux7g', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21', NULL, 1);
--
-- Index pour les tables déchargées
--

--
-- Index pour la table `detail_frais_forfait`
--
ALTER TABLE `detail_frais_forfait`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detail_frais_forfait_fiche_frais` (`fiche_frais_id`),
  ADD KEY `fk_detail_frais_forfait_frais_forfait` (`frais_forfait_id`),
  ADD KEY `fk_dff_e` (`etat_id`);

--
-- Index pour la table `detail_frais_non_forfait`
--
ALTER TABLE `detail_frais_non_forfait`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detail_frais_non_forfait_fiche_frais` (`fiche_frais_id`),
  ADD KEY `fk_dfnf_e` (`etat_id`);

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fiche_frais`
--
ALTER TABLE `fiche_frais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fiche_frais_utilisateur` (`utilisateur_id`),
  ADD KEY `fk_fiche_frais_etat` (`etat_id`);

--
-- Index pour la table `frais_forfait`
--
ALTER TABLE `frais_forfait`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_role` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `detail_frais_forfait`
--
ALTER TABLE `detail_frais_forfait`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `detail_frais_non_forfait`
--
ALTER TABLE `detail_frais_non_forfait`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `etat`
--
ALTER TABLE `etat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `fiche_frais`
--
ALTER TABLE `fiche_frais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `frais_forfait`
--
ALTER TABLE `frais_forfait`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `detail_frais_forfait`
--
ALTER TABLE `detail_frais_forfait`
  ADD CONSTRAINT `fk_detail_frais_forfait_fiche_frais` FOREIGN KEY (`fiche_frais_id`) REFERENCES `fiche_frais` (`id`),
  ADD CONSTRAINT `fk_detail_frais_forfait_frais_forfait` FOREIGN KEY (`frais_forfait_id`) REFERENCES `frais_forfait` (`id`),
  ADD CONSTRAINT `fk_dff_e` FOREIGN KEY (`etat_id`) REFERENCES `etat` (`id`);

--
-- Contraintes pour la table `detail_frais_non_forfait`
--
ALTER TABLE `detail_frais_non_forfait`
  ADD CONSTRAINT `fk_detail_frais_non_forfait_fiche_frais` FOREIGN KEY (`fiche_frais_id`) REFERENCES `fiche_frais` (`id`),
  ADD CONSTRAINT `fk_dfnf_e` FOREIGN KEY (`etat_id`) REFERENCES `etat` (`id`);

--
-- Contraintes pour la table `fiche_frais`
--
ALTER TABLE `fiche_frais`
  ADD CONSTRAINT `fk_fiche_frais_etat` FOREIGN KEY (`etat_id`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fk_fiche_frais_utilisateur` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
